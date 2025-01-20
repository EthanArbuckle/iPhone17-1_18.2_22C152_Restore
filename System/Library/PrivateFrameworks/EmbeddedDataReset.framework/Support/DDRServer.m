@interface DDRServer
- (BOOL)hasRequiredEntitlements:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (DDRManager)manager;
- (DDRObserverServer)observerServer;
- (NSMutableArray)clients;
- (NSXPCConnection)completionClient;
- (NSXPCListener)listener;
- (OS_dispatch_queue)serverQueue;
- (id)completion;
- (int64_t)currentResetMode;
- (int64_t)currentResetState;
- (void)didAddObserverClientWithXPCConnection:(id)a3;
- (void)resetDataWithRequest:(id)a3 completion:(id)a4;
- (void)resetWithModeDidBegin:(int64_t)a3;
- (void)resetWithModeDidFinish:(int64_t)a3 error:(id)a4;
- (void)resetWithModeWillBegin:(int64_t)a3;
- (void)setClients:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setCompletionClient:(id)a3;
- (void)setCurrentResetMode:(int64_t)a3;
- (void)setCurrentResetState:(int64_t)a3;
- (void)setListener:(id)a3;
- (void)setManager:(id)a3;
- (void)setObserverServer:(id)a3;
- (void)setServerQueue:(id)a3;
- (void)start;
@end

@implementation DDRServer

- (void)start
{
  v3 = sub_100002D9C(2uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Daemon server start", v15, 2u);
  }

  v4 = (void *)BSDispatchQueueCreateWithQualityOfService();
  [(DDRServer *)self setServerQueue:v4];

  v5 = [DDRObserverServer alloc];
  v6 = [(DDRServer *)self serverQueue];
  v7 = [(DDRObserverServer *)v5 initWithQueue:v6];
  [(DDRServer *)self setObserverServer:v7];

  v8 = [(DDRServer *)self observerServer];
  [v8 setDelegate:self];

  v9 = [(DDRServer *)self observerServer];
  [v9 start];

  v10 = objc_alloc_init(DDRManager);
  [(DDRServer *)self setManager:v10];

  v11 = [(DDRServer *)self manager];
  [v11 setDelegate:self];

  id v12 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.devicedatareset.DeviceDataResetService"];
  [(DDRServer *)self setListener:v12];

  v13 = [(DDRServer *)self listener];
  [v13 setDelegate:self];

  v14 = [(DDRServer *)self listener];
  [v14 resume];

  self->_currentResetMode = 0;
  dispatch_main();
}

- (NSMutableArray)clients
{
  clients = self->_clients;
  if (!clients)
  {
    v4 = (NSMutableArray *)objc_opt_new();
    v5 = self->_clients;
    self->_clients = v4;

    clients = self->_clients;
  }
  return clients;
}

- (BOOL)hasRequiredEntitlements:(id)a3
{
  id v3 = a3;
  if ([v3 hasEntitlement:@"com.apple.wipedevice"]) {
    goto LABEL_8;
  }
  v4 = sub_100002D9C(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "connection does not have new entitlement", buf, 2u);
  }

  if ([v3 hasEntitlement:@"com.apple.frontboard.wipedevice"]) {
    goto LABEL_8;
  }
  v5 = sub_100002D9C(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "connection does not have frontboard entitlement", v10, 2u);
  }

  if ([v3 hasEntitlement:@"com.apple.springboard.wipedevice"])
  {
LABEL_8:
    BOOL v6 = 1;
  }
  else
  {
    v8 = sub_100002D9C(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "connection does not have springboard entitlement", v9, 2u);
    }

    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  BOOL v6 = sub_100002D9C(2uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "got incomming connection in devicedataresetd", buf, 2u);
  }

  v7 = +[BSAuditToken tokenFromNSXPCConnection:v5];
  BOOL v8 = [(DDRServer *)self hasRequiredEntitlements:v7];
  if (v8)
  {
    v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DDRServerProtocol];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    id v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v11, objc_opt_class(), 0);
    [v9 setClasses:v12 forSelector:"resetDataWithRequest:completion:" argumentIndex:0 ofReply:0];

    [v5 setExportedInterface:v9];
    [v5 setExportedObject:self];
    v13 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DDRClientResetProtocol];
    [v5 setRemoteObjectInterface:v13];

    v14 = [(DDRServer *)self serverQueue];
    [v5 _setQueue:v14];

    v15 = [(DDRServer *)self clients];
    [v15 addObject:v5];

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100001B24;
    v22[3] = &unk_100008340;
    v22[4] = self;
    id v16 = v5;
    id v23 = v16;
    [v16 setInvalidationHandler:v22];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100001BB0;
    v20[3] = &unk_100008340;
    v20[4] = self;
    id v17 = v16;
    id v21 = v17;
    [v17 setInterruptionHandler:v20];
    [v17 resume];
    v18 = sub_100002D9C(2uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Adding client complete in devicedataresetd", buf, 2u);
    }
  }
  else
  {
    [v5 invalidate];
  }

  return v8;
}

- (void)didAddObserverClientWithXPCConnection:(id)a3
{
  id v4 = a3;
  id v5 = sub_100002D9C(2uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int64_t currentResetState = self->_currentResetState;
    int v13 = 134217984;
    int64_t v14 = currentResetState;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting current connection to observe data reset flow, currentState = %ld", (uint8_t *)&v13, 0xCu);
  }

  v7 = sub_100002D9C(2uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    int64_t v14 = (int64_t)v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Client with connection:%@ register as observer", (uint8_t *)&v13, 0xCu);
  }

  int64_t v8 = self->_currentResetState;
  if (v8 == 3)
  {
    uint64_t v11 = sub_100002D9C(2uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      int64_t v14 = (int64_t)v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Connection: %@ missed the both broadcast, send them now.", (uint8_t *)&v13, 0xCu);
    }

    id v12 = [v4 remoteObjectProxy];
    [v12 willBeginDataResetWithMode:self->_currentResetMode];

    uint64_t v10 = [v4 remoteObjectProxy];
    [v10 didBeginDataResetWithMode:self->_currentResetMode];
    goto LABEL_13;
  }
  if (v8 == 2)
  {
    v9 = sub_100002D9C(2uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      int64_t v14 = (int64_t)v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Connection: %@ missed the willBeginDataResetWithMode broadcast, send it now.", (uint8_t *)&v13, 0xCu);
    }

    uint64_t v10 = [v4 remoteObjectProxy];
    [v10 willBeginDataResetWithMode:self->_currentResetMode];
LABEL_13:
  }
}

- (void)resetDataWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = sub_100002D9C(2uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Calling reset data in devicedataresetd server", buf, 2u);
  }

  if (!self->_currentResetState)
  {
    self->_int64_t currentResetState = 1;
    id v10 = objc_retainBlock(v7);
    id completion = self->_completion;
    self->_id completion = v10;

    if (self->_completion)
    {
      id v12 = +[NSXPCConnection currentConnection];
      completionClient = self->_completionClient;
      self->_completionClient = v12;
    }
    int64_t v14 = sub_100002D9C(2uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Now proceed with reset in daemon", v15, 2u);
    }

    self->_currentResetMode = (int64_t)[v6 mode];
    v9 = [(DDRServer *)self manager];
    [v9 resetDataWithRequest:v6 completion:&stru_100008380];
    goto LABEL_11;
  }
  if (v7)
  {
    v9 = +[NSError errorWithDomain:@"com.apple.devicedataresetd" code:0 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v9);
LABEL_11:
  }
}

- (void)resetWithModeWillBegin:(int64_t)a3
{
  id v5 = sub_100002D9C(2uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "resetWithModeWillBegin in DDRServer", buf, 2u);
  }

  id v6 = [(DDRServer *)self observerServer];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100002190;
  v7[3] = &unk_1000083A0;
  v7[4] = a3;
  [v6 enumerateObserverConnections:v7];

  self->_int64_t currentResetState = 2;
}

- (void)resetWithModeDidBegin:(int64_t)a3
{
  id v5 = sub_100002D9C(2uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "resetWithModeDidBegin in DDRServer", buf, 2u);
  }

  id v6 = [(DDRServer *)self observerServer];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100002354;
  v7[3] = &unk_1000083A0;
  v7[4] = a3;
  [v6 enumerateObserverConnections:v7];

  self->_int64_t currentResetState = 3;
}

- (void)resetWithModeDidFinish:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = sub_100002D9C(2uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "resetWithModeDidFinish in DDRServer", (uint8_t *)&buf, 2u);
  }

  int64_t v8 = sub_100002D9C(2uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "device data reset daemon got response from worker: %@", (uint8_t *)&buf, 0xCu);
  }

  v9 = self->_completionClient;
  completionClient = self->_completionClient;
  self->_completionClient = 0;

  id completion = (void (**)(id, id))self->_completion;
  if (completion)
  {
    completion[2](completion, v6);
    id v12 = self->_completion;
    self->_id completion = 0;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100002860;
  v36[3] = &unk_1000083C8;
  v36[4] = self;
  v36[5] = &buf;
  int v13 = objc_retainBlock(v36);
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  int v35 = 0;
  int64_t v14 = [(DDRServer *)self observerServer];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100002948;
  v26[3] = &unk_100008418;
  v30 = &v32;
  int64_t v31 = a3;
  id v15 = v6;
  id v27 = v15;
  id v16 = v9;
  v28 = v16;
  id v17 = v13;
  id v29 = v17;
  [v14 enumerateObserverConnections:v26];

  if (*((_DWORD *)v33 + 6) || v16)
  {
    dispatch_time_t v19 = dispatch_time(0, 5000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100002BF8;
    block[3] = &unk_100008440;
    v20 = v17;
    id v24 = v20;
    dispatch_after(v19, (dispatch_queue_t)&_dispatch_main_q, block);
    id v21 = [(NSXPCConnection *)v16 synchronousRemoteObjectProxyWithErrorHandler:&stru_100008460];
    [v21 sync];

    if (!*((_DWORD *)v33 + 6))
    {
      v22 = sub_100002D9C(2uLL);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "observer 0, ok to reboot", v25, 2u);
      }

      v20[2](v20);
    }
  }
  else
  {
    v18 = sub_100002D9C(2uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "reboot directly because no observer anymore.", v25, 2u);
    }

    v17[2](v17);
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&buf, 8);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (DDRObserverServer)observerServer
{
  return self->_observerServer;
}

- (void)setObserverServer:(id)a3
{
}

- (void)setClients:(id)a3
{
}

- (OS_dispatch_queue)serverQueue
{
  return self->_serverQueue;
}

- (void)setServerQueue:(id)a3
{
}

- (DDRManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (int64_t)currentResetState
{
  return self->_currentResetState;
}

- (void)setCurrentResetState:(int64_t)a3
{
  self->_int64_t currentResetState = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (NSXPCConnection)completionClient
{
  return self->_completionClient;
}

- (void)setCompletionClient:(id)a3
{
}

- (int64_t)currentResetMode
{
  return self->_currentResetMode;
}

- (void)setCurrentResetMode:(int64_t)a3
{
  self->_currentResetMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionClient, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_serverQueue, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_observerServer, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end