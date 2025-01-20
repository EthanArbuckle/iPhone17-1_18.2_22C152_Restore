@interface HMDRemoteEventRouterServerMessageReceiver
- (NSUUID)messageTargetUUID;
- (OS_dispatch_queue)messageReceiveQueue;
- (void)handleRequestMessage:(id)a3;
@end

@implementation HMDRemoteEventRouterServerMessageReceiver

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)handleRequestMessage:(id)a3
{
  id v6 = a3;
  if (self)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
    if (WeakRetained)
    {
      v5 = WeakRetained;
      [WeakRetained _handleRequestMessage:v6 connectionMode:1];
    }
  }
}

- (OS_dispatch_queue)messageReceiveQueue
{
  if (self)
  {
    self = (HMDRemoteEventRouterServerMessageReceiver *)objc_getProperty(self, a2, 16, 1);
    uint64_t v2 = vars8;
  }
  return (OS_dispatch_queue *)self;
}

- (NSUUID)messageTargetUUID
{
  if (self)
  {
    self = (HMDRemoteEventRouterServerMessageReceiver *)objc_getProperty(self, a2, 8, 1);
    uint64_t v2 = vars8;
  }
  return (NSUUID *)self;
}

@end