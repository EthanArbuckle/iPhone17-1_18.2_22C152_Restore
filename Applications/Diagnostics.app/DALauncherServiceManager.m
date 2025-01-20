@interface DALauncherServiceManager
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (DALauncherServiceManager)init;
- (NSMutableSet)remoteClients;
- (NSXPCListener)listener;
- (void)informExitingForReason:(int64_t)a3;
- (void)initListener;
- (void)ping:(id)a3;
- (void)setListener:(id)a3;
- (void)setRemoteClients:(id)a3;
@end

@implementation DALauncherServiceManager

+ (id)sharedInstance
{
  if (qword_100186990 != -1) {
    dispatch_once(&qword_100186990, &stru_10014C290);
  }
  v2 = (void *)qword_100186988;

  return v2;
}

- (DALauncherServiceManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)DALauncherServiceManager;
  v2 = [(DALauncherServiceManager *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    remoteClients = v2->_remoteClients;
    v2->_remoteClients = v3;

    listener = v2->_listener;
    v2->_listener = 0;

    [(DALauncherServiceManager *)v2 initListener];
  }
  return v2;
}

- (void)informExitingForReason:(int64_t)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(DALauncherServiceManager *)self remoteClients];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) diagnosticsExitingForReason:a3];
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  v10 = [(DALauncherServiceManager *)self remoteClients];
  [v10 removeAllObjects];
}

- (void)initListener
{
  id v3 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.diagnostics.launcher-service"];
  [(DALauncherServiceManager *)self setListener:v3];

  v4 = [(DALauncherServiceManager *)self listener];
  [v4 setDelegate:self];

  id v5 = [(DALauncherServiceManager *)self listener];
  [v5 resume];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "New connection %@ requested for remote runner service", (uint8_t *)&buf, 0xCu);
  }

  v9 = [v7 valueForEntitlement:@"com.apple.diagnostics.launcher-service"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 BOOLValue])
  {
    v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DADiagnosticsLauncherServerProtocol];
    [v7 setExportedObject:self];
    [v7 setExportedInterface:v10];
    long long v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DADiagnosticsLauncherClientProtocol];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v24 = 0x3032000000;
    v25 = sub_100028CD0;
    v26 = sub_100028CE0;
    id v27 = 0;
    objc_initWeak(&location, v7);
    [v7 setRemoteObjectInterface:v11];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100028CE8;
    v18[3] = &unk_10014BE30;
    v18[4] = &buf;
    objc_copyWeak(&v19, &location);
    long long v12 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v18];
    if (v12 && !*(void *)(*((void *)&buf + 1) + 40))
    {
      v15 = [(DALauncherServiceManager *)self remoteClients];
      [v15 addObject:v12];

      [v7 resume];
      v16 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v21 = 138412290;
        id v22 = v7;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Connection %@ established with launcher service", v21, 0xCu);
      }

      BOOL v13 = 1;
    }
    else
    {
      BOOL v13 = 0;
    }

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    long long v14 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1001028EC((uint64_t)v7, v14);
    }

    [v7 invalidate];
    BOOL v13 = 0;
  }

  return v13;
}

- (void)ping:(id)a3
{
  id v3 = (void (**)(void))a3;
  v4 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Launcher service from iOSDiagnostics is pinging to see if we are alive", v5, 2u);
  }

  v3[2](v3);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSMutableSet)remoteClients
{
  return (NSMutableSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRemoteClients:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteClients, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

@end