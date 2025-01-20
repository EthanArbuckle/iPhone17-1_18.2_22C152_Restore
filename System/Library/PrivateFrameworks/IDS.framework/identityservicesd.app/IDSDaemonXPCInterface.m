@interface IDSDaemonXPCInterface
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (IDSDGroupContextNotifyingObserver)observer;
- (IDSDaemonXPCInterface)init;
- (NSMutableArray)observerProxies;
- (NSXPCConnection)connection;
- (NSXPCListener)listener;
- (id)groupContextController;
- (void)didCacheGroup:(id)a3;
- (void)didCreateGroup:(id)a3;
- (void)didReceiveDecryptionFailureForGroup:(id)a3;
- (void)didReceiveRegistrationIdentityUpdate;
- (void)didUpdateGroup:(id)a3 withNewGroup:(id)a4;
- (void)setConnection:(id)a3;
- (void)setListener:(id)a3;
- (void)setObserver:(id)a3;
- (void)setObserverProxies:(id)a3;
@end

@implementation IDSDaemonXPCInterface

+ (id)sharedInstance
{
  if (qword_100A4AAD0 != -1) {
    dispatch_once(&qword_100A4AAD0, &stru_100985F38);
  }
  v2 = (void *)qword_100A4AAD8;

  return v2;
}

- (IDSDaemonXPCInterface)init
{
  v15.receiver = self;
  v15.super_class = (Class)IDSDaemonXPCInterface;
  v2 = [(IDSDaemonXPCInterface *)&v15 init];
  if (v2)
  {
    v3 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Daemon XPC Interface Up", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    v4 = [[IDSDGroupContextNotifyingObserver alloc] initWithDelegate:v2];
    observer = v2->_observer;
    v2->_observer = v4;

    v6 = [(IDSDaemonXPCInterface *)v2 groupContextController];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001F23FC;
    v12[3] = &unk_100985F60;
    v7 = v2;
    v13 = v7;
    [v6 groupContextForProtectionSpace:0 withCompletion:v12];

    observerProxies = v7->_observerProxies;
    v7->_observerProxies = 0;

    v9 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.identityservicesd.nsxpc.auth"];
    listener = v7->_listener;
    v7->_listener = v9;

    [(NSXPCListener *)v7->_listener setDelegate:v7];
    [(NSXPCListener *)v7->_listener resume];
  }
  return v2;
}

- (id)groupContextController
{
  return +[IDSDGroupContextController sharedInstance];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Incoming Daemon XPC Interface with new connection %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v24 = v7;
    _IDSLogV();
  }
  v9 = +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___IDSGroupContextDaemonProtocol, v24);
  [v7 setExportedInterface:v9];

  v10 = +[IDSDGroupContextController sharedInstance];
  [v7 setExportedObject:v10];
  [v7 resume];
  objc_storeStrong((id *)&self->_connection, a4);
  v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___IDSGroupContextObserverDaemonProtocol];
  [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v11];

  v12 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
  observerProxies = self->_observerProxies;
  if (!observerProxies)
  {
    v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    objc_super v15 = self->_observerProxies;
    self->_observerProxies = v14;

    observerProxies = self->_observerProxies;
  }
  [(NSMutableArray *)observerProxies addObject:v12];
  v16 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = [(NSMutableArray *)self->_observerProxies count];
    *(_DWORD *)buf = 138412546;
    id v34 = v12;
    __int16 v35 = 2048;
    id v36 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "We got remote object proxy %@ new observerProxies count: %lu", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    v25 = v12;
    id v26 = [(NSMutableArray *)self->_observerProxies count];
    _IDSLogV();
  }
  +[CUTWeakReference weakRefWithObject:](CUTWeakReference, "weakRefWithObject:", self, v25, v26);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1001F2860;
  v30[3] = &unk_10097E440;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v31 = v18;
  id v19 = v12;
  id v32 = v19;
  [(NSXPCConnection *)self->_connection setInvalidationHandler:v30];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1001F29A8;
  v27[3] = &unk_10097E440;
  id v28 = v18;
  id v29 = v19;
  connection = self->_connection;
  id v21 = v19;
  id v22 = v18;
  [(NSXPCConnection *)connection setInterruptionHandler:v27];

  return 1;
}

- (void)didCreateGroup:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = self->_observerProxies;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v9);
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_1001F2C64;
        v11[3] = &unk_100981B98;
        id v12 = v4;
        v13 = v10;
        [v10 didCreateGroup:v12 completion:v11];

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)didCacheGroup:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = self->_observerProxies;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v9);
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_1001F2F14;
        v11[3] = &unk_100981B98;
        id v12 = v4;
        v13 = v10;
        [v10 didCacheGroup:v12 completion:v11];

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)didUpdateGroup:(id)a3 withNewGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obj = self->_observerProxies;
  id v8 = [(NSMutableArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v11);
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_1001F31F0;
        v15[3] = &unk_1009847A8;
        id v13 = v6;
        id v16 = v13;
        id v17 = v7;
        id v18 = v12;
        [v12 didUpdateGroup:v13 withNewGroup:v17 completion:v15];

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSMutableArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
}

- (void)didReceiveDecryptionFailureForGroup:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = self->_observerProxies;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v9);
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_1001F34B4;
        v11[3] = &unk_100981B98;
        id v12 = v4;
        id v13 = v10;
        [v10 didReceiveDecryptionFailureForGroup:v12 completion:v11];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)didReceiveRegistrationIdentityUpdate
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_observerProxies;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v6);
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 3221225472;
        v8[2] = sub_1001F3738;
        v8[3] = &unk_100981208;
        v8[4] = v7;
        [v7 didReceiveRegistrationIdentityUpdateWithCompletion:v8];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (IDSDGroupContextNotifyingObserver)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
}

- (NSMutableArray)observerProxies
{
  return self->_observerProxies;
}

- (void)setObserverProxies:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerProxies, 0);
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

@end