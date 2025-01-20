@interface TKTokenServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)waitForRegistry;
- (NSXPCListener)SEPKeyListener;
- (NSXPCListener)tokenServerListener;
- (NSXPCListener)tokenWatcherListener;
- (TKClientToken)client;
- (TKHostTokenRegistry)tokenRegistry;
- (TKSEPKeyServer)SEPKeyServer;
- (TKTokenServer)initWithTokenServer:(id)a3;
- (id)ensureSlotWatcherIsRunning;
- (id)pairingNotification:(id *)a3;
- (void)dealloc;
- (void)getEndpoint:(id)a3;
- (void)hostTokenRegistry:(id)a3 addedToken:(id)a4;
- (void)hostTokenRegistry:(id)a3 removedToken:(id)a4;
- (void)setEnsureSlotWatcherIsRunning:(id)a3;
- (void)setTokenRegistry:(id)a3;
- (void)start;
- (void)startWatchingWithReply:(id)a3;
- (void)stop;
@end

@implementation TKTokenServer

- (TKClientToken)client
{
  id v3 = objc_alloc((Class)TKClientToken);
  v4 = [(TKTokenServer *)self tokenServerListener];
  v5 = [v4 endpoint];
  id v6 = [v3 initWithTokenID:&stru_100021240 serverEndpoint:v5 targetUID:0];

  return (TKClientToken *)v6;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TKTokenServer *)self SEPKeyListener];

  if (v8 == v6)
  {
    v12 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___TKRemoteSEPKeyProtocol];
    [v7 setExportedInterface:v12];

    v13 = [(TKTokenServer *)self SEPKeyServer];
LABEL_7:
    [v7 setExportedObject:v13];
LABEL_9:

    [v7 resume];
    BOOL v11 = 1;
    goto LABEL_10;
  }
  id v9 = [(TKTokenServer *)self tokenServerListener];

  if (v9 == v6)
  {
    v13 = [[TKTokenClientConnection alloc] initWithConnection:v7 server:self];
    v14 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___TKClientTokenServerProtocol];
    [v7 setExportedInterface:v14];

    goto LABEL_7;
  }
  id v10 = [(TKTokenServer *)self tokenWatcherListener];

  if (v10 == v6)
  {
    v15 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___TKProtocolTokenWatcherServer];
    [v7 setExportedInterface:v15];

    [v7 setExportedObject:self];
    v13 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___TKProtocolTokenWatcherHost];
    [v7 setRemoteObjectInterface:v13];
    goto LABEL_9;
  }
  BOOL v11 = 0;
LABEL_10:

  return v11;
}

- (void)startWatchingWithReply:(id)a3
{
  v32 = (void (**)(id, id))a3;
  v4 = self->_watcherConnections;
  objc_sync_enter(v4);
  v5 = +[NSXPCConnection currentConnection];
  [(NSHashTable *)self->_watcherConnections addObject:v5];
  v35 = self;

  objc_sync_exit(v4);
  id v6 = [&__NSArray0__struct mutableCopy];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v7 = +[TKClientToken builtinTokenIDs];
  id v8 = [v7 countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v41;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v41 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v46 = *(void *)(*((void *)&v40 + 1) + 8 * (void)v10);
        BOOL v11 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v46, 1, v32);
        [v6 addObject:v11];

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v8);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v12 = [(TKTokenServer *)v35 tokenRegistry];
  id obj = [v12 tokens];

  id v13 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v13)
  {
    uint64_t v34 = *(void *)v37;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v37 != v34) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v14);
        v16 = [(TKTokenServer *)v35 tokenRegistry];
        v17 = [v16 tokenWithTokenID:v15];

        v18 = [v17 driver];
        if (!v18)
        {
          v19 = [v17 registry];
          v20 = [v19 driverCache];
          v21 = [v17 tokenID];
          v22 = [v21 classID];
          v18 = [v20 hostTokenDriverWithClassID:v22 error:0];
        }
        v23 = [v15 stringRepresentation];
        v44[0] = v23;
        v24 = [v18 extension];
        uint64_t v25 = [v24 _localizedName];
        v26 = (void *)v25;
        CFStringRef v27 = &stru_100021240;
        if (v25) {
          CFStringRef v27 = (const __CFString *)v25;
        }
        v44[1] = v27;
        uint64_t v28 = [v17 slotName];
        v29 = (void *)v28;
        CFStringRef v30 = &stru_100021240;
        if (v28) {
          CFStringRef v30 = (const __CFString *)v28;
        }
        v44[2] = v30;
        v31 = +[NSArray arrayWithObjects:v44 count:3];
        [v6 addObject:v31];

        v14 = (char *)v14 + 1;
      }
      while (v13 != v14);
      id v13 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v13);
  }

  v32[2](v32, v6);
}

- (void)getEndpoint:(id)a3
{
  tokenWatcherListener = self->_tokenWatcherListener;
  id v5 = a3;
  id v6 = [(NSXPCListener *)tokenWatcherListener endpoint];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)hostTokenRegistry:(id)a3 addedToken:(id)a4
{
  id v33 = a3;
  id v37 = a4;
  id v6 = [(TKTokenServer *)self tokenRegistry];
  long long v39 = [v6 tokenWithTokenID:v37];

  long long v38 = [v39 driver];
  if (!v38)
  {
    id v7 = [v39 registry];
    id v8 = [v7 driverCache];
    uint64_t v9 = [v39 tokenID];
    id v10 = [v9 classID];
    long long v38 = [v8 hostTokenDriverWithClassID:v10 error:0];
  }
  id v44 = 0;
  BOOL v11 = [(TKTokenServer *)self pairingNotification:&v44];
  id v35 = v44;
  uint64_t v12 = [v39 slotName];
  id v13 = (void *)v12;
  if (v12) {
    CFStringRef v14 = (const __CFString *)v12;
  }
  else {
    CFStringRef v14 = &stru_100021240;
  }
  v15 = [v38 extension];
  uint64_t v16 = [v15 _localizedName];
  v17 = (void *)v16;
  if (v16) {
    CFStringRef v18 = (const __CFString *)v16;
  }
  else {
    CFStringRef v18 = &stru_100021240;
  }
  v19 = [v37 stringRepresentation];
  [v11 tokenInserted:v14 driverName:v18 tokenID:v19 reply:&stru_100020958];

  [v35 invalidate];
  uint64_t v34 = self->_watcherConnections;
  objc_sync_enter(v34);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = self->_watcherConnections;
  id v20 = [(NSHashTable *)obj countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v41;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v41 != v21) {
          objc_enumerationMutation(obj);
        }
        v23 = [*(id *)(*((void *)&v40 + 1) + 8 * i) remoteObjectProxy];
        v24 = [v37 stringRepresentation];
        v45[0] = v24;
        uint64_t v25 = [v38 extension];
        uint64_t v26 = [v25 _localizedName];
        CFStringRef v27 = (void *)v26;
        if (v26) {
          CFStringRef v28 = (const __CFString *)v26;
        }
        else {
          CFStringRef v28 = &stru_100021240;
        }
        v45[1] = v28;
        uint64_t v29 = [v39 slotName];
        CFStringRef v30 = (void *)v29;
        if (v29) {
          CFStringRef v31 = (const __CFString *)v29;
        }
        else {
          CFStringRef v31 = &stru_100021240;
        }
        v45[2] = v31;
        v32 = +[NSArray arrayWithObjects:v45 count:3];
        [v23 insertedToken:v32];
      }
      id v20 = [(NSHashTable *)obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v20);
  }

  objc_sync_exit(v34);
}

- (void)hostTokenRegistry:(id)a3 removedToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v22 = 0;
  id v8 = [(TKTokenServer *)self pairingNotification:&v22];
  id v9 = v22;
  id v10 = [v7 stringRepresentation];
  [v8 tokenRemoved:v10 reply:&stru_100020978];

  [v9 invalidate];
  BOOL v11 = self->_watcherConnections;
  objc_sync_enter(v11);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v12 = self->_watcherConnections;
  id v13 = [(NSHashTable *)v12 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * (void)v15), "remoteObjectProxy", (void)v18);
        v17 = [v7 stringRepresentation];
        [v16 removedToken:v17];

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [(NSHashTable *)v12 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v13);
  }

  objc_sync_exit(v11);
}

- (TKTokenServer)initWithTokenServer:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TKTokenServer;
  id v5 = [(TKTokenServer *)&v19 init];
  if (v5)
  {
    id v6 = (NSCondition *)objc_alloc_init((Class)NSCondition);
    tokenRegistrySetCondition = v5->_tokenRegistrySetCondition;
    v5->_tokenRegistrySetCondition = v6;

    if (v4)
    {
      id v8 = (NSXPCListener *)v4;
    }
    else
    {
      id v8 = +[NSXPCListener anonymousListener];
    }
    tokenServerListener = v5->_tokenServerListener;
    v5->_tokenServerListener = v8;

    [(NSXPCListener *)v5->_tokenServerListener setDelegate:v5];
    uint64_t v10 = +[NSXPCListener anonymousListener];
    tokenWatcherListener = v5->_tokenWatcherListener;
    v5->_tokenWatcherListener = (NSXPCListener *)v10;

    [(NSXPCListener *)v5->_tokenWatcherListener setDelegate:v5];
    uint64_t v12 = +[NSHashTable weakObjectsHashTable];
    watcherConnections = v5->_watcherConnections;
    v5->_watcherConnections = (NSHashTable *)v12;

    uint64_t v14 = objc_alloc_init(TKSEPKeyServer);
    SEPKeyServer = v5->_SEPKeyServer;
    v5->_SEPKeyServer = v14;

    uint64_t v16 = +[NSXPCListener anonymousListener];
    SEPKeyListener = v5->_SEPKeyListener;
    v5->_SEPKeyListener = (NSXPCListener *)v16;

    [(NSXPCListener *)v5->_SEPKeyListener setDelegate:v5];
  }

  return v5;
}

- (void)setTokenRegistry:(id)a3
{
  id v5 = a3;
  id v6 = sub_10000F450();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100014EB0(v6, v7, v8);
  }

  if (!self->_tokenRegistrySet)
  {
    [(NSCondition *)self->_tokenRegistrySetCondition lock];
    self->_tokenRegistrySet = 1;
    objc_storeStrong((id *)&self->_tokenRegistry, a3);
    [(TKHostTokenRegistry *)self->_tokenRegistry setDelegate:self];
    [(NSCondition *)self->_tokenRegistrySetCondition broadcast];
    [(NSCondition *)self->_tokenRegistrySetCondition unlock];
  }
}

- (BOOL)waitForRegistry
{
  [(NSCondition *)self->_tokenRegistrySetCondition lock];
  while (!self->_tokenRegistrySet)
  {
    id v6 = sub_10000F450();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100014F24(&v10, v11, v6);
    }

    [(NSCondition *)self->_tokenRegistrySetCondition wait];
    uint64_t v7 = sub_10000F450();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100014EEC(&v8, v9, v7);
    }
  }
  [(NSCondition *)self->_tokenRegistrySetCondition unlock];
  id v3 = [(TKTokenServer *)self tokenRegistry];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_tokenServerListener invalidate];
  [(NSXPCListener *)self->_tokenWatcherListener invalidate];
  [(NSXPCListener *)self->_SEPKeyListener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TKTokenServer;
  [(TKTokenServer *)&v3 dealloc];
}

- (void)start
{
  objc_super v3 = [(TKTokenServer *)self tokenServerListener];
  [v3 resume];

  BOOL v4 = [(TKTokenServer *)self tokenWatcherListener];
  [v4 resume];

  id v5 = [(TKTokenServer *)self SEPKeyListener];
  [v5 resume];

  uint64_t v6 = TKTokenWatcherServerStartedNotification;
  uint32_t v7 = notify_post((const char *)[TKTokenWatcherServerStartedNotification UTF8String]);
  if (v7)
  {
    int v8 = v7;
    id v9 = sub_10000F450();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100014F5C(v6, v8, v9);
    }
  }
}

- (void)stop
{
  id obj = self;
  objc_sync_enter(obj);
  v2 = [(TKTokenServer *)obj tokenServerListener];
  [v2 invalidate];

  objc_super v3 = [(TKTokenServer *)obj tokenWatcherListener];
  [v3 invalidate];

  BOOL v4 = [(TKTokenServer *)obj SEPKeyListener];
  [v4 invalidate];

  tokenServerListener = obj->_tokenServerListener;
  obj->_tokenServerListener = 0;

  tokenWatcherListener = obj->_tokenWatcherListener;
  obj->_tokenWatcherListener = 0;

  SEPKeyListener = obj->_SEPKeyListener;
  obj->_SEPKeyListener = 0;

  [(NSCondition *)obj->_tokenRegistrySetCondition lock];
  if (!obj->_tokenRegistrySet)
  {
    obj->_tokenRegistrySet = 1;
    [(NSCondition *)obj->_tokenRegistrySetCondition broadcast];
  }
  [(NSCondition *)obj->_tokenRegistrySetCondition unlock];
  int v8 = [(TKTokenServer *)obj tokenRegistry];
  id v9 = [v8 driverCache];
  [v9 invalidate];

  objc_sync_exit(obj);
}

- (id)pairingNotification:(id *)a3
{
  return 0;
}

- (TKHostTokenRegistry)tokenRegistry
{
  return self->_tokenRegistry;
}

- (NSXPCListener)tokenServerListener
{
  return self->_tokenServerListener;
}

- (TKSEPKeyServer)SEPKeyServer
{
  return self->_SEPKeyServer;
}

- (id)ensureSlotWatcherIsRunning
{
  return self->_ensureSlotWatcherIsRunning;
}

- (void)setEnsureSlotWatcherIsRunning:(id)a3
{
}

- (NSXPCListener)tokenWatcherListener
{
  return self->_tokenWatcherListener;
}

- (NSXPCListener)SEPKeyListener
{
  return self->_SEPKeyListener;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SEPKeyListener, 0);
  objc_storeStrong((id *)&self->_tokenWatcherListener, 0);
  objc_storeStrong(&self->_ensureSlotWatcherIsRunning, 0);
  objc_storeStrong((id *)&self->_SEPKeyServer, 0);
  objc_storeStrong((id *)&self->_tokenServerListener, 0);
  objc_storeStrong((id *)&self->_tokenRegistry, 0);
  objc_storeStrong((id *)&self->_tokenRegistrySetCondition, 0);

  objc_storeStrong((id *)&self->_watcherConnections, 0);
}

@end