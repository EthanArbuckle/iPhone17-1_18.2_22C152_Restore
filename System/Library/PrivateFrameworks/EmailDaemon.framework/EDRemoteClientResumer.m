@interface EDRemoteClientResumer
- (EDRemoteClient)remoteClient;
- (EDRemoteClientResumer)initWithRemoteClient:(id)a3;
- (void)resumeForUpdates;
- (void)setRemoteClient:(id)a3;
@end

@implementation EDRemoteClientResumer

- (EDRemoteClientResumer)initWithRemoteClient:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EDRemoteClientResumer;
  v5 = [(EDRemoteClientResumer *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_remoteClient, v4);
  }

  return v6;
}

- (void)resumeForUpdates
{
  id v3 = [(EDRemoteClientResumer *)self remoteClient];
  v2 = [v3 clientResumer];
  [v2 resumeForUpdates];
}

- (EDRemoteClient)remoteClient
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteClient);

  return (EDRemoteClient *)WeakRetained;
}

- (void)setRemoteClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end