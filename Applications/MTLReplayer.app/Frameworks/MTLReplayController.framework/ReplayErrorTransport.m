@interface ReplayErrorTransport
- (ReplayErrorTransport)initWithTransport:(id)a3;
- (void)notifyError:(id)a3;
@end

@implementation ReplayErrorTransport

- (void).cxx_destruct
{
}

- (void)notifyError:(id)a3
{
  if (a3)
  {
    v4 = +[GTTransportMessage_replayer messageWithKind:4127 attributes:0 objectPayload:a3];
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    dispatch_time_t v6 = dispatch_time(0, 3000000000);
    transport = self->_transport;
    v8 = dispatch_get_global_queue(0, 0);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __36__ReplayErrorTransport_notifyError___block_invoke;
    v10[3] = &unk_746120;
    dispatch_semaphore_t v11 = v5;
    v9 = v5;
    [(GTTransport_replayer *)transport send:v4 inReplyTo:0 error:0 replyQueue:v8 timeout:v6 handler:v10];

    dispatch_semaphore_wait(v9, v6);
  }
}

uint64_t __36__ReplayErrorTransport_notifyError___block_invoke(uint64_t a1)
{
  return 1;
}

- (ReplayErrorTransport)initWithTransport:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ReplayErrorTransport;
  dispatch_time_t v6 = [(ReplayErrorTransport *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_transport, a3);
  }

  return v7;
}

@end