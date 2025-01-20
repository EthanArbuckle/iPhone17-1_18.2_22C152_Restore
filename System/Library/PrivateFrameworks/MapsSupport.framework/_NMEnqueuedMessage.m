@interface _NMEnqueuedMessage
- (NMMessage)message;
- (NMReply)reply;
- (NSDictionary)options;
- (_NMEnqueuedMessage)init;
- (double)enqueuedTime;
- (id)replyBlock;
- (void)dealloc;
- (void)setEnqueuedTime:(double)a3;
- (void)setMessage:(id)a3;
- (void)setOptions:(id)a3;
- (void)setReply:(id)a3;
- (void)setReplyBlock:(id)a3;
@end

@implementation _NMEnqueuedMessage

- (_NMEnqueuedMessage)init
{
  v10.receiver = self;
  v10.super_class = (Class)_NMEnqueuedMessage;
  v2 = [(_NMEnqueuedMessage *)&v10 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = NSStringFromClass(v3);
    id v5 = +[NSString stringWithFormat:@"%@.%p", v4, v2];
    [v5 UTF8String];
    uint64_t v6 = os_transaction_create();
    transaction = v2->_transaction;
    v2->_transaction = (OS_os_transaction *)v6;

    v8 = v2;
  }

  return v2;
}

- (void)dealloc
{
  transaction = self->_transaction;
  self->_transaction = 0;

  v4.receiver = self;
  v4.super_class = (Class)_NMEnqueuedMessage;
  [(_NMEnqueuedMessage *)&v4 dealloc];
}

- (NMReply)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
}

- (NMMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (id)replyBlock
{
  return self->_replyBlock;
}

- (void)setReplyBlock:(id)a3
{
}

- (double)enqueuedTime
{
  return self->_enqueuedTime;
}

- (void)setEnqueuedTime:(double)a3
{
  self->_enqueuedTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_replyBlock, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_reply, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end