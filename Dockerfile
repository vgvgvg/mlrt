FROM rocker/r-base
LABEL maintainer="Vladimir Grishanov <vgrichanov@tangerine.ca>" \
	version="1.0" \
	description="Machine Learning R Real-time micro service"

RUN R -e 'install.packages(c("plumber"))'

RUN mkdir -p /usr/src/sum

COPY ./sum.R /usr/src/sum

EXPOSE 8080
CMD ["R", "-e", "pr <- plumber::plumb('/usr/src/sum/sum.R'); pr$run(host='0.0.0.0', port=8080)"]

