@interface OSADiagnosticMonitorServer
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (OSADiagnosticMonitorServer)init;
- (void)didWriteLog:(id)a3 filePath:(id)a4;
- (void)failedToWriteLog:(id)a3 error:(id)a4;
- (void)q_addConnection:(id)a3 entitled:(BOOL)a4;
- (void)willWriteLog:(id)a3 details:(id)a4;
@end

@implementation OSADiagnosticMonitorServer

- (void)willWriteLog:(id)a3 details:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = DiagnosticMonitorLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received log event: %@", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003EE0;
  block[3] = &unk_100020F80;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

- (void)didWriteLog:(id)a3 filePath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = DiagnosticMonitorLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Log write succeeded: %@", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003FF0;
  block[3] = &unk_100020F80;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

+ (id)sharedInstance
{
  if (qword_100026298 != -1) {
    dispatch_once(&qword_100026298, &stru_100020F58);
  }
  v2 = (void *)qword_100026290;

  return v2;
}

- (OSADiagnosticMonitorServer)init
{
  v11.receiver = self;
  v11.super_class = (Class)OSADiagnosticMonitorServer;
  v2 = [(OSADiagnosticMonitorServer *)&v11 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.osanalystics.diagnosticmonitorserver", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = +[NSMutableSet set];
    clients = v2->_clients;
    v2->_clients = (NSMutableSet *)v5;

    id v7 = objc_alloc((Class)NSXPCListener);
    v8 = (NSXPCListener *)[v7 initWithMachServiceName:kOSADiagnosticMonitorMachService];
    listener = v2->_listener;
    v2->_listener = v8;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
  }
  return v2;
}

- (void)failedToWriteLog:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = DiagnosticMonitorLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Log write failed: %@", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E5F4;
  block[3] = &unk_100020F80;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = [v5 valueForEntitlement:@"com.apple.osanalytics.canusediagnosticmonitor"];
  unsigned int v7 = [v6 BOOLValue];

  v8 = DiagnosticMonitorLog();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_1000152FC(v5);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    sub_100015378(v5, v9);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E81C;
  block[3] = &unk_100020FA8;
  block[4] = self;
  id v14 = v5;
  char v15 = v7;
  id v11 = v5;
  dispatch_async(queue, block);

  return 1;
}

- (void)q_addConnection:(id)a3 entitled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v7 = [[Client alloc] initWithConnection:v6 entitled:v4];
  [(NSMutableSet *)self->_clients addObject:v7];
  v8 = OSADiagnosticMonitorClientInterface();
  [v6 setRemoteObjectInterface:v8];

  v9 = OSADiagnosticMonitorServerInterface();
  [v6 setExportedInterface:v9];

  [v6 setExportedObject:v7];
  [v6 _setQueue:self->_queue];
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_10000E958;
  id v14 = &unk_100020FD0;
  char v15 = v7;
  id v16 = self;
  id v10 = v7;
  [v6 setInvalidationHandler:&v11];
  objc_msgSend(v6, "resume", v11, v12, v13, v14);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_listener, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end