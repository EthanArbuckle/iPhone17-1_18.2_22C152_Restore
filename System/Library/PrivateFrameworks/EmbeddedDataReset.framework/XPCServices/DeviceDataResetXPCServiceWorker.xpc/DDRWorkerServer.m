@interface DDRWorkerServer
- (BOOL)hasObserver;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (DDRWorker)worker;
- (NSXPCConnection)devicedataresetdConnection;
- (NSXPCListener)listener;
- (OS_dispatch_queue)workerQueue;
- (void)_run;
- (void)resetDataWithRequest:(id)a3 completion:(id)a4;
- (void)resetWithMode:(int64_t)a3 didUpdateWithProgress:(double)a4;
- (void)resetWithModeDidBegin:(int64_t)a3;
- (void)setDevicedataresetdConnection:(id)a3;
- (void)setHasObserver:(BOOL)a3;
- (void)setListener:(id)a3;
- (void)setObserving:(BOOL)a3;
- (void)setWorker:(id)a3;
- (void)setWorkerQueue:(id)a3;
- (void)start;
@end

@implementation DDRWorkerServer

- (void)start
{
  v3 = (void *)BSDispatchQueueCreateWithQualityOfService();
  [(DDRWorkerServer *)self setWorkerQueue:v3];

  v4 = [DDRWorker alloc];
  v5 = [(DDRWorkerServer *)self workerQueue];
  v6 = [(DDRWorker *)v4 initWithQueue:v5];
  [(DDRWorkerServer *)self setWorker:v6];

  v7 = [(DDRWorkerServer *)self worker];
  [v7 setDelegate:self];

  id v8 = +[NSXPCListener serviceListener];
  [v8 setDelegate:self];
  [v8 resume];
  [(DDRWorkerServer *)self _run];
}

- (void)_run
{
  id v2 = +[NSRunLoop mainRunLoop];
  [v2 run];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = DDRLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "got incomming connection in xpc worker server", buf, 2u);
  }

  v7 = +[BSAuditToken tokenFromNSXPCConnection:v5];
  id v8 = DDRLogForCategory(0);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (!v9) {
      goto LABEL_9;
    }
    __int16 v24 = 0;
    v10 = "token is not nil";
    v11 = (uint8_t *)&v24;
  }
  else
  {
    if (!v9) {
      goto LABEL_9;
    }
    *(_WORD *)v23 = 0;
    v10 = "token is nil";
    v11 = v23;
  }
  _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
LABEL_9:

  unsigned __int8 v12 = [v7 hasEntitlement:@"com.apple.dataresetworker.access"];
  v13 = DDRLogForCategory(0);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      *(_WORD *)v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "connection have entitlements", v21, 2u);
    }

    v13 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DDRWorkerServerProtocol];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v15, v16, objc_opt_class(), 0);
    [v13 setClasses:v17 forSelector:"resetDataWithRequest:completion:" argumentIndex:0 ofReply:0];

    [v5 setExportedInterface:v13];
    [v5 setExportedObject:self];
    v18 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DDRWorkerClientProtocol];
    [v5 setRemoteObjectInterface:v18];

    [v5 setInvalidationHandler:&stru_100010690];
    [v5 setInterruptionHandler:&stru_1000106B0];
    v19 = [(DDRWorkerServer *)self workerQueue];
    [v5 _setQueue:v19];

    [v5 resume];
    [(DDRWorkerServer *)self setDevicedataresetdConnection:v5];
  }
  else if (v14)
  {
    *(_WORD *)v22 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "connection does not have entitlements", v22, 2u);
  }

  return v12;
}

- (void)resetDataWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = DDRLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "calling reset data with mode in xpc worker", v10, 2u);
  }

  BOOL v9 = [(DDRWorkerServer *)self worker];
  [v9 resetDataWithRequest:v7 completion:v6];
}

- (void)setObserving:(BOOL)a3
{
  id v5 = DDRLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Oberver is connected to xpc service worker", v6, 2u);
  }

  self->_hasObserver = a3;
}

- (void)resetWithMode:(int64_t)a3 didUpdateWithProgress:(double)a4
{
  id v7 = DDRLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    double v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "worker server update with progress: %lf", (uint8_t *)&v10, 0xCu);
  }

  id v8 = [(DDRWorkerServer *)self devicedataresetdConnection];
  BOOL v9 = [v8 remoteObjectProxy];
  [v9 resetWithMode:a3 didUpdateWithProgress:a4];
}

- (void)resetWithModeDidBegin:(int64_t)a3
{
  id v5 = DDRLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "worker server reset did begin", v8, 2u);
  }

  id v6 = [(DDRWorkerServer *)self devicedataresetdConnection];
  id v7 = [v6 remoteObjectProxy];
  [v7 resetWithModeDidBegin:a3];
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (DDRWorker)worker
{
  return self->_worker;
}

- (void)setWorker:(id)a3
{
}

- (BOOL)hasObserver
{
  return self->_hasObserver;
}

- (void)setHasObserver:(BOOL)a3
{
  self->_hasObserver = a3;
}

- (NSXPCConnection)devicedataresetdConnection
{
  return self->_devicedataresetdConnection;
}

- (void)setDevicedataresetdConnection:(id)a3
{
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_devicedataresetdConnection, 0);
  objc_storeStrong((id *)&self->_worker, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end