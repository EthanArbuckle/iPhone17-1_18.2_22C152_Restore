@interface MSPMapsPushDaemonRemoteXPCProxy
- (MSPMapsPushDaemonRemoteProxy)target;
- (MSPMapsPushDaemonRemoteXPCProxy)initWithObserver:(id)a3;
- (void)pushDaemonProxyReceivedNotificationData:(id)a3 forType:(id)a4 recordIdentifier:(id)a5;
- (void)setTarget:(id)a3;
@end

@implementation MSPMapsPushDaemonRemoteXPCProxy

- (MSPMapsPushDaemonRemoteXPCProxy)initWithObserver:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MSPMapsPushDaemonRemoteXPCProxy;
  id v3 = a3;
  v4 = [(MSPMapsPushDaemonRemoteXPCProxy *)&v6 init];
  objc_storeWeak((id *)&v4->_target, v3);

  return v4;
}

- (void)pushDaemonProxyReceivedNotificationData:(id)a3 forType:(id)a4 recordIdentifier:(id)a5
{
  p_target = &self->_target;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_target);
  [WeakRetained pushDaemonProxyReceivedNotificationData:v10 forType:v9 recordIdentifier:v8];
}

- (MSPMapsPushDaemonRemoteProxy)target
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);

  return (MSPMapsPushDaemonRemoteProxy *)WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (void).cxx_destruct
{
}

@end