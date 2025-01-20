@interface CLSClient
- (CLSClientDelegate)delagate;
- (void)clientRemote_databaseRecreated;
- (void)setDelagate:(id)a3;
@end

@implementation CLSClient

- (void)clientRemote_databaseRecreated
{
  v2 = clsNotificationQueue();
  dispatch_async(v2, &unk_1F37A0E30);
}

- (CLSClientDelegate)delagate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delagate);

  return (CLSClientDelegate *)WeakRetained;
}

- (void)setDelagate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end