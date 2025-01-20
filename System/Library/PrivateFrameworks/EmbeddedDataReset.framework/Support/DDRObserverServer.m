@interface DDRObserverServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (DDRObserverServer)initWithQueue:(id)a3;
- (DDRObserverServerDelegate)delegate;
- (NSMutableArray)clients;
- (NSXPCListener)listener;
- (OS_dispatch_queue)serverQueue;
- (void)connect;
- (void)enumerateObserverConnections:(id)a3;
- (void)setClients:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setListener:(id)a3;
- (void)setServerQueue:(id)a3;
- (void)start;
@end

@implementation DDRObserverServer

- (DDRObserverServer)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DDRObserverServer;
  v6 = [(DDRObserverServer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_serverQueue, a3);
  }

  return v7;
}

- (void)start
{
  v3 = sub_100002D9C(2uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting up DDRObserverServer", v9, 2u);
  }

  id v4 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.devicedatareset.DeviceDataResetObservationService.NonLaunching"];
  [(DDRObserverServer *)self setListener:v4];

  id v5 = [(DDRObserverServer *)self listener];
  [v5 setDelegate:self];

  v6 = [(DDRObserverServer *)self listener];
  v7 = [v6 _xpcConnection];
  xpc_connection_set_non_launching();

  v8 = [(DDRObserverServer *)self listener];
  [v8 resume];
}

- (NSMutableArray)clients
{
  clients = self->_clients;
  if (!clients)
  {
    id v4 = (NSMutableArray *)objc_opt_new();
    id v5 = self->_clients;
    self->_clients = v4;

    clients = self->_clients;
  }
  return clients;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_100002D9C(2uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Checking incoming connection: %@ to DDRObserverServer", buf, 0xCu);
  }

  objc_super v9 = +[BSAuditToken tokenFromNSXPCConnection:v7];
  v10 = [(DDRObserverServer *)self delegate];
  unsigned __int8 v11 = [v10 connectionHasRequiredEntitlements:v9];

  if (v11)
  {
    v12 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DDRServerObserverProtocol];
    [v7 setExportedInterface:v12];
    [v7 setExportedObject:self];
    v13 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DDRClientObserverProtocol];
    [v7 setRemoteObjectInterface:v13];

    v14 = [(DDRObserverServer *)self serverQueue];
    [v7 _setQueue:v14];

    v15 = [(DDRObserverServer *)self clients];
    [v15 addObject:v7];

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000044E0;
    v27[3] = &unk_100008340;
    v27[4] = self;
    id v16 = v7;
    id v28 = v16;
    [v16 setInvalidationHandler:v27];
    v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    v23 = sub_10000456C;
    v24 = &unk_100008340;
    v25 = self;
    id v17 = v16;
    id v26 = v17;
    [v17 setInterruptionHandler:&v21];
    objc_msgSend(v17, "resume", v21, v22, v23, v24, v25);
    v18 = sub_100002D9C(2uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v30 = v6;
      __int16 v31 = 2112;
      id v32 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Adding client complete in DDRObserverServer, listener: %@, connection: %@", buf, 0x16u);
    }

    v19 = [(DDRObserverServer *)self delegate];
    [v19 didAddObserverClientWithXPCConnection:v17];
  }
  else
  {
    [v7 invalidate];
  }

  return v11;
}

- (void)enumerateObserverConnections:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(DDRObserverServer *)self clients];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      objc_super v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * (void)v9));
        objc_super v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)connect
{
  v2 = sub_100002D9C(2uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Incoming connection called connect", v3, 2u);
  }
}

- (DDRObserverServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DDRObserverServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (OS_dispatch_queue)serverQueue
{
  return self->_serverQueue;
}

- (void)setServerQueue:(id)a3
{
}

- (void)setClients:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_serverQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end