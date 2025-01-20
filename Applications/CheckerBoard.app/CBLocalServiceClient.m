@interface CBLocalServiceClient
- (BOOL)didMoveToEndgame;
- (CBLocalServiceClient)initWithMainNavController:(id)a3;
- (NSXPCConnection)connection;
- (UINavigationController)mainNavController;
- (void)_ping;
- (void)invalidate;
- (void)moveToDiagnosticsAppWithcompletion:(id)a3;
- (void)relaunchToDiagnosticsApp;
- (void)resume;
- (void)setConnection:(id)a3;
- (void)setDidMoveToEndgame:(BOOL)a3;
- (void)setMainNavController:(id)a3;
- (void)setProxyServer:(id)a3 completion:(id)a4;
@end

@implementation CBLocalServiceClient

- (CBLocalServiceClient)initWithMainNavController:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CBLocalServiceClient;
  v5 = [(CBLocalServiceClient *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_mainNavController, v4);
    v6->_didMoveToEndgame = 0;
    v7 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.checkerboardd" options:4096];
    connection = v6->_connection;
    v6->_connection = v7;

    v9 = +[CBLocalServiceInterface serverInterface];
    [(NSXPCConnection *)v6->_connection setRemoteObjectInterface:v9];

    v10 = +[CBLocalServiceInterface clientInterface];
    [(NSXPCConnection *)v6->_connection setExportedInterface:v10];

    [(NSXPCConnection *)v6->_connection setExportedObject:v6];
    [(NSXPCConnection *)v6->_connection setInterruptionHandler:&stru_10007A030];
    [(NSXPCConnection *)v6->_connection setInvalidationHandler:&stru_10007A050];
  }

  return v6;
}

- (void)resume
{
  v3 = [(CBLocalServiceClient *)self connection];
  [v3 resume];

  [(CBLocalServiceClient *)self _ping];
}

- (void)invalidate
{
  v3 = [(CBLocalServiceClient *)self connection];

  if (v3)
  {
    id v4 = [(CBLocalServiceClient *)self connection];
    [v4 invalidate];
  }
}

- (void)_ping
{
  v2 = [(CBLocalServiceClient *)self connection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&stru_10007A070];

  [v3 ping:&stru_10007A090];
}

- (void)relaunchToDiagnosticsApp
{
  [(CBLocalServiceClient *)self setDidMoveToEndgame:0];

  [(CBLocalServiceClient *)self moveToDiagnosticsAppWithcompletion:&stru_10007A0B0];
}

- (void)moveToDiagnosticsAppWithcompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  v5 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Local XPC - moveToDiagnosticsApp", buf, 2u);
  }

  if ([(CBLocalServiceClient *)self didMoveToEndgame])
  {
    v6 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Local XPC - already moved to Diagnostics app", buf, 2u);
    }

    v4[2](v4, 0);
  }
  else
  {
    v7 = [(CBLocalServiceClient *)self mainNavController];

    if (v7)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100027F9C;
      v10[3] = &unk_10007A0D8;
      v10[4] = self;
      v11 = v4;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
    }
    else
    {
      v8 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Local XPC - moveToDiagnosticsApp: mainNavController is nil", buf, 2u);
      }

      v9 = +[NSError errorWithDomain:@"com.apple.CheckerBoard.daemonXPCErrorDomain" code:2 userInfo:0];
      ((void (**)(id, void *))v4)[2](v4, v9);
    }
  }
}

- (void)setProxyServer:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Local XPC - Receive proxy server info. proxyServer = %@;",
      (uint8_t *)&v13,
      0xCu);
  }

  v8 = +[CBUserSettings sharedInstance];
  [v8 assignProxyServer:v5];

  v9 = +[CBUserSettings sharedInstance];
  v10 = [v9 proxyServer];

  if ([v10 isEqual:v5])
  {
    v11 = 0;
  }
  else
  {
    objc_super v12 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      id v14 = v10;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Local XPC - Failed to set assignedProxyServer = %@; proxyServer = %@;",
        (uint8_t *)&v13,
        0x16u);
    }

    v11 = +[NSError errorWithDomain:@"com.apple.CheckerBoard.daemonXPCErrorDomain" code:1 userInfo:0];
  }
  v6[2](v6, v11);
}

- (BOOL)didMoveToEndgame
{
  return self->_didMoveToEndgame;
}

- (void)setDidMoveToEndgame:(BOOL)a3
{
  self->_didMoveToEndgame = a3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (UINavigationController)mainNavController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainNavController);

  return (UINavigationController *)WeakRetained;
}

- (void)setMainNavController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mainNavController);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end