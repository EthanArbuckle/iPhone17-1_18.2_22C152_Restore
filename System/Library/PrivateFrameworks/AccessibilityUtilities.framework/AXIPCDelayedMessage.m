@interface AXIPCDelayedMessage
- (AXIPCDelayedMessage)initWithMessage:(id)a3 completion:(id)a4;
- (AXIPCMessage)message;
- (id)completion;
- (void)setCompletion:(id)a3;
- (void)setMessage:(id)a3;
@end

@implementation AXIPCDelayedMessage

- (AXIPCDelayedMessage)initWithMessage:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AXIPCDelayedMessage;
  v9 = [(AXIPCDelayedMessage *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_message, a3);
    uint64_t v11 = [v8 copy];
    id completion = v10->_completion;
    v10->_id completion = (id)v11;
  }
  return v10;
}

- (AXIPCMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end