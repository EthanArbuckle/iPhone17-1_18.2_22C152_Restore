@interface COMessageSessionConsumer
- (COMessageChannel)messageChannel;
- (COMessageSessionConsumer)initWithChannel:(id)a3 subTopic:(id)a4 delegate:(id)a5 dispatchQueue:(id)a6;
- (COMessageSessionConsumerDelegate)delegate;
- (NSMutableDictionary)sessions;
- (NSString)subTopic;
- (OS_dispatch_queue)delegateQueue;
- (id)description;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setSessions:(id)a3;
@end

@implementation COMessageSessionConsumer

- (COMessageSessionConsumer)initWithChannel:(id)a3 subTopic:(id)a4 delegate:(id)a5 dispatchQueue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)COMessageSessionConsumer;
  v14 = [(COMessageSessionConsumer *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_messageChannel, v10);
    objc_storeStrong((id *)&v15->_subTopic, a4);
    objc_storeWeak((id *)&v15->_delegate, v12);
    objc_storeStrong((id *)&v15->_delegateQueue, a6);
    uint64_t v16 = [MEMORY[0x263EFF9A0] dictionary];
    sessions = v15->_sessions;
    v15->_sessions = (NSMutableDictionary *)v16;
  }
  return v15;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p, subTopic = %@>", v5, self, self->_subTopic];

  return v6;
}

- (NSString)subTopic
{
  return self->_subTopic;
}

- (COMessageChannel)messageChannel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageChannel);

  return (COMessageChannel *)WeakRetained;
}

- (COMessageSessionConsumerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (COMessageSessionConsumerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (NSMutableDictionary)sessions
{
  return self->_sessions;
}

- (void)setSessions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_messageChannel);

  objc_storeStrong((id *)&self->_subTopic, 0);
}

@end