@interface BufferedSendOperation
- (DYTransportMessage)message;
- (DYTransportMessage)replyTo;
- (OS_dispatch_queue)queue;
- (id)replyBlock;
- (unint64_t)timeout;
- (void)dealloc;
- (void)setMessage:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReplyBlock:(id)a3;
- (void)setReplyTo:(id)a3;
- (void)setTimeout:(unint64_t)a3;
@end

@implementation BufferedSendOperation

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BufferedSendOperation;
  [(BufferedSendOperation *)&v3 dealloc];
}

- (DYTransportMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (DYTransportMessage)replyTo
{
  return self->_replyTo;
}

- (void)setReplyTo:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (unint64_t)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(unint64_t)a3
{
  self->_timeout = a3;
}

- (id)replyBlock
{
  return self->_replyBlock;
}

- (void)setReplyBlock:(id)a3
{
}

@end