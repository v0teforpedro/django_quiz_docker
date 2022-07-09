FROM python:3.10.5-slim

RUN apt update && apt install mc vim -y

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

ENV SECRETKEY=django-insecure-+t-w4lpph)2jsp5w3)m1@sb-kjn6ld-gb%4ct5!t8#l#-98=h0
ENV DEBUG=True
ENV ALLOWED_HOSTS=''

RUN mkdir /opt/src
WORKDIR /opt/src

COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN rm -f requirements.txt

COPY src .

EXPOSE 8090

CMD python manage.py runserver 0.0.0.0:8090