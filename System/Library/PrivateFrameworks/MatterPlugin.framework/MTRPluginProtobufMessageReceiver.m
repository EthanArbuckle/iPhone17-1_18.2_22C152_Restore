@interface MTRPluginProtobufMessageReceiver
- (MTRPluginProtobufMessageReceiver)initWithDelegate:(id)a3 delegateQueue:(id)a4 sessionID:(id)a5;
- (MTRPluginProtobufMessageTransportDelegate)delegate;
- (NSMutableDictionary)messageSelectors;
- (NSUUID)sessionID;
- (OS_dispatch_queue)delegateQueue;
- (id)description;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setMessageSelectors:(id)a3;
- (void)setSessionID:(id)a3;
@end

@implementation MTRPluginProtobufMessageReceiver

- (MTRPluginProtobufMessageReceiver)initWithDelegate:(id)a3 delegateQueue:(id)a4 sessionID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MTRPluginProtobufMessageReceiver;
  v11 = [(MTRPluginProtobufMessageReceiver *)&v15 init];
  v12 = v11;
  if (v11)
  {
    [(MTRPluginProtobufMessageReceiver *)v11 setSessionID:v10];
    [(MTRPluginProtobufMessageReceiver *)v12 setDelegate:v8];
    [(MTRPluginProtobufMessageReceiver *)v12 setDelegateQueue:v9];
    if (v10)
    {
      v13 = [MEMORY[0x263EFF9A0] dictionary];
      [(MTRPluginProtobufMessageReceiver *)v12 setMessageSelectors:v13];
    }
  }

  return v12;
}

- (id)description
{
  v2 = NSString;
  v3 = [(MTRPluginProtobufMessageReceiver *)self delegate];
  v4 = objc_msgSend(v2, "stringWithFormat:", @"<MTRPluginProtobufMessageReceiver: delegate: %p>", v3);

  return v4;
}

- (NSUUID)sessionID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSessionID:(id)a3
{
}

- (MTRPluginProtobufMessageTransportDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MTRPluginProtobufMessageTransportDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDelegateQueue:(id)a3
{
}

- (NSMutableDictionary)messageSelectors
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMessageSelectors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageSelectors, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end