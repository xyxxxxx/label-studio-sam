FROM nvcr.io/nvidia/pytorch:23.06-py3

RUN apt-get update && apt-get install -yq --no-install-recommends \
    openssh-server \
    pdsh \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir deepspeed==0.9.5 flash-attn==1.0.5

RUN mkdir /run/sshd
RUN chown root:root /usr/lib

ENTRYPOINT /usr/sbin/sshd -D && bash
