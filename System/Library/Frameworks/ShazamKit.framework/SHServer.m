@interface SHServer
- (NSArray)listeners;
- (SHAPSConnection)apsConnection;
- (SHMediaLibraryAccountListener)accountListener;
- (SHServer)init;
- (id)buildListenerForMachService:(Class)a3;
- (id)buildListeners;
- (void)start;
- (void)stop;
@end

@implementation SHServer

- (SHServer)init
{
  v11.receiver = self;
  v11.super_class = (Class)SHServer;
  v2 = [(SHServer *)&v11 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(SHServer *)v2 buildListeners];
    listeners = v3->_listeners;
    v3->_listeners = (NSArray *)v4;

    v6 = objc_alloc_init(SHMediaLibraryAccountListener);
    accountListener = v3->_accountListener;
    v3->_accountListener = v6;

    v8 = objc_alloc_init(SHAPSConnection);
    apsConnection = v3->_apsConnection;
    v3->_apsConnection = v8;
  }
  return v3;
}

- (void)start
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(SHServer *)self listeners];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v7) listen];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  v8 = [(SHServer *)self accountListener];
  [v8 listenForChanges];

  v9 = [(SHServer *)self apsConnection];
  [v9 registerForPushNotifications];
}

- (void)stop
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(SHServer *)self listeners];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) stopListening];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8 = [(SHServer *)self accountListener];
  [v8 stopListeningForChanges];
}

- (id)buildListeners
{
  v3 = +[NSMutableArray array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = +[SHServiceProvider availableServices];
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v10 = [(SHServer *)self buildListenerForMachService:v9];
        [v3 addObject:v10];

        [v9 initializeGlobalServiceState];
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  id v11 = [v3 copy];

  return v11;
}

- (id)buildListenerForMachService:(Class)a3
{
  v3 = [[SHServiceProvider alloc] initWithService:a3];
  id v4 = [SHConnectionListener alloc];
  id v5 = [(SHServiceProvider *)v3 buildListener];
  id v6 = [(SHConnectionListener *)v4 initWithServiceProvider:v3 listener:v5];

  return v6;
}

- (NSArray)listeners
{
  return self->_listeners;
}

- (SHAPSConnection)apsConnection
{
  return self->_apsConnection;
}

- (SHMediaLibraryAccountListener)accountListener
{
  return self->_accountListener;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountListener, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);

  objc_storeStrong((id *)&self->_listeners, 0);
}

@end