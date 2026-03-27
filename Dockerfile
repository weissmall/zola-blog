FROM alpine:edge AS zola

COPY . /project
WORKDIR /project

RUN apk add zola && zola build

FROM ghcr.io/static-web-server/static-web-server:2
WORKDIR /
COPY --from=zola /project/public /public
