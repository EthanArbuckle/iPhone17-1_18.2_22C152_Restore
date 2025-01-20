@interface CBShellServer
+ (id)sharedInstance;
- (BOOL)_auditToken:(id *)a3 hasEntitlement:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CBRemoteAlertServerDelegate)remoteAlertsDelegate;
- (CBShellServer)init;
- (CBSystemServicesServerDelegate)systemServicesDelegate;
- (NSXPCListener)listener;
- (unint64_t)_getEntitlementLevelForConnection:(id)a3;
- (void)_setClassesForProxyServerOnInterface:(id)a3;
- (void)_setClassesForRemoteAlertsOnInterface:(id)a3;
- (void)addShutdownTask:(id)a3 forReason:(id)a4;
- (void)connectToSSID:(id)a3 completion:(id)a4;
- (void)connectToSSID:(id)a3 password:(id)a4 completion:(id)a5;
- (void)connectedNetwork:(id)a3;
- (void)createAlert:(id)a3 timeout:(unint64_t)a4 completion:(id)a5;
- (void)currentLocaleIdentifier:(id)a3;
- (void)diagnosticsRunning:(id)a3;
- (void)dimDisplay;
- (void)disableNetworkReconnect;
- (void)disableTouchButtonEvents;
- (void)displayDimmed:(id)a3;
- (void)enableNetworkReconnect;
- (void)enableTouchButtonEvents;
- (void)exitCheckerBoard;
- (void)hideSceneStatusBar;
- (void)launchDiagnostics;
- (void)networkReconnectEnabled:(id)a3;
- (void)networkScanWithCompletion:(id)a3;
- (void)proxyServerWithCompletion:(id)a3;
- (void)receiveResponseFromAlertWithIdentifier:(id)a3 timeout:(double)a4 completion:(id)a5;
- (void)removeShutdownTask:(id)a3;
- (void)setListener:(id)a3;
- (void)setLocaleIdentifier:(id)a3 completion:(id)a4;
- (void)setRemoteAlertsDelegate:(id)a3;
- (void)setSystemServicesDelegate:(id)a3;
- (void)showSceneStatusBar;
- (void)start;
- (void)statusBarStyle:(int64_t)a3;
- (void)undimDisplay;
@end

@implementation CBShellServer

+ (id)sharedInstance
{
  if (qword_10008FEC8 != -1) {
    dispatch_once(&qword_10008FEC8, &stru_10007A328);
  }
  v2 = (void *)qword_10008FEC0;

  return v2;
}

- (CBShellServer)init
{
  v7.receiver = self;
  v7.super_class = (Class)CBShellServer;
  v2 = [(CBShellServer *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)NSXPCListener);
    v4 = (NSXPCListener *)[v3 initWithMachServiceName:kCheckerBoardRemoteServerMachName];
    listener = v2->_listener;
    v2->_listener = v4;
  }
  return v2;
}

- (void)start
{
  id v3 = [(CBShellServer *)self listener];
  [v3 setDelegate:self];

  id v4 = [(CBShellServer *)self listener];
  [v4 resume];
}

- (void)createAlert:(id)a3 timeout:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(CBShellServer *)self remoteAlertsDelegate];
  [v10 server:self createAlert:v9 timeout:v8 completion:(double)a4];
}

- (void)receiveResponseFromAlertWithIdentifier:(id)a3 timeout:(double)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(CBShellServer *)self remoteAlertsDelegate];
  [v10 server:self receiveResponseFromAlertWithIdentifier:v9 timeout:v8 completion:a4];
}

- (void)exitCheckerBoard
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002EFA8;
  block[3] = &unk_1000794E0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)proxyServerWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  v5 = [(CBShellServer *)self systemServicesDelegate];
  id v6 = [v5 proxyServer];

  v4[2](v4, v6);
}

- (void)showSceneStatusBar
{
  id v2 = [(CBShellServer *)self systemServicesDelegate];
  [v2 showSceneStatusBar];
}

- (void)hideSceneStatusBar
{
  id v2 = [(CBShellServer *)self systemServicesDelegate];
  [v2 hideSceneStatusBar];
}

- (void)statusBarStyle:(int64_t)a3
{
  id v4 = [(CBShellServer *)self systemServicesDelegate];
  [v4 statusBarStyle:a3];
}

- (void)dimDisplay
{
  id v2 = [(CBShellServer *)self systemServicesDelegate];
  [v2 dimDisplay];
}

- (void)undimDisplay
{
  id v2 = [(CBShellServer *)self systemServicesDelegate];
  [v2 undimDisplay];
}

- (void)enableTouchButtonEvents
{
  id v2 = [(CBShellServer *)self systemServicesDelegate];
  [v2 enableTouchButtonEvents];
}

- (void)disableTouchButtonEvents
{
  id v2 = [(CBShellServer *)self systemServicesDelegate];
  [v2 disableTouchButtonEvents];
}

- (void)disableNetworkReconnect
{
  id v2 = [(CBShellServer *)self systemServicesDelegate];
  [v2 disableNetworkReconnect];
}

- (void)enableNetworkReconnect
{
  id v2 = [(CBShellServer *)self systemServicesDelegate];
  [v2 enableNetworkReconnect];
}

- (void)addShutdownTask:(id)a3 forReason:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CBShellServer *)self systemServicesDelegate];
  [v8 addShutdownTask:v7 forReason:v6];
}

- (void)removeShutdownTask:(id)a3
{
  id v4 = a3;
  id v5 = [(CBShellServer *)self systemServicesDelegate];
  [v5 removeShutdownTask:v4];
}

- (void)launchDiagnostics
{
  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10002F448;
  v2[3] = &unk_100079608;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)diagnosticsRunning:(id)a3
{
  id v4 = a3;
  id v5 = [(CBShellServer *)self systemServicesDelegate];
  [v5 diagnosticsRunning:v4];
}

- (void)connectToSSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[CBUtilities isInternalInstall])
  {
    id v8 = [(CBShellServer *)self systemServicesDelegate];
    [v8 connectToSSID:v6 completion:v7];
  }
  else
  {
    id v9 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "This function is not available on customer install", v10, 2u);
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)connectToSSID:(id)a3 password:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (+[CBUtilities isInternalInstall])
  {
    v11 = [(CBShellServer *)self systemServicesDelegate];
    [v11 connectToSSID:v8 password:v9 completion:v10];
  }
  else
  {
    v12 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "This function is not available on customer install", v13, 2u);
    }

    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

- (void)networkScanWithCompletion:(id)a3
{
  id v4 = a3;
  if (+[CBUtilities isInternalInstall])
  {
    id v6 = [(CBShellServer *)self systemServicesDelegate];
    [v6 networkScanWithCompletion:v4];
  }
  else
  {
    id v5 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "This function is not available on customer install", buf, 2u);
    }

    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)connectedNetwork:(id)a3
{
  id v4 = a3;
  if (+[CBUtilities isInternalInstall])
  {
    id v6 = [(CBShellServer *)self systemServicesDelegate];
    [v6 connectedNetwork:v4];
  }
  else
  {
    id v5 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "This function is not available on customer install", buf, 2u);
    }

    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)displayDimmed:(id)a3
{
  id v4 = a3;
  id v5 = [(CBShellServer *)self systemServicesDelegate];
  [v5 displayDimmed:v4];
}

- (void)networkReconnectEnabled:(id)a3
{
  id v4 = a3;
  id v5 = [(CBShellServer *)self systemServicesDelegate];
  [v5 networkReconnectEnabled:v4];
}

- (void)currentLocaleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CBShellServer *)self systemServicesDelegate];
  [v5 currentLocaleIdentifier:v4];
}

- (void)setLocaleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CBShellServer *)self systemServicesDelegate];
  [v8 setLocaleIdentifier:v7 completion:v6];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [(CBShellServer *)self _getEntitlementLevelForConnection:v5];
  switch(v6)
  {
    case 3uLL:
      id v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CBSSystemServicesProtocol];
      [v5 setExportedInterface:v8];
      break;
    case 2uLL:
      id v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CBSRemoteAlertServerProtocol];
      [v5 setExportedInterface:v10];

      id v9 = [v5 exportedInterface];
      [(CBShellServer *)self _setClassesForRemoteAlertsOnInterface:v9];
      goto LABEL_8;
    case 1uLL:
      id v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CBSServerProtocol];
      [v5 setExportedInterface:v7];

      id v8 = [v5 exportedInterface];
      [(CBShellServer *)self _setClassesForRemoteAlertsOnInterface:v8];
      break;
    default:
      BOOL v11 = 0;
      goto LABEL_10;
  }

  id v9 = [v5 exportedInterface];
  [(CBShellServer *)self _setClassesForProxyServerOnInterface:v9];
LABEL_8:

  [v5 setExportedObject:self];
  [v5 resume];
  BOOL v11 = 1;
LABEL_10:

  return v11;
}

- (void)_setClassesForRemoteAlertsOnInterface:(id)a3
{
  id v3 = a3;
  id v4 = +[NSSet setWithObject:objc_opt_class()];
  [v3 setClasses:v4 forSelector:"createAlert:timeout:completion:" argumentIndex:0 ofReply:0];
}

- (void)_setClassesForProxyServerOnInterface:(id)a3
{
  id v3 = a3;
  id v4 = +[NSSet setWithObject:objc_opt_class()];
  [v3 setClasses:v4 forSelector:"proxyServerWithCompletion:" argumentIndex:0 ofReply:1];
}

- (unint64_t)_getEntitlementLevelForConnection:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  long long v8 = 0u;
  long long v9 = 0u;
  if (v4) {
    [v4 auditToken:v8, v9];
  }
  if ([(CBShellServer *)self _auditToken:&v8 hasEntitlement:kCheckerBoardServicesEntitlement])
  {
    unint64_t v6 = 1;
  }
  else if ([(CBShellServer *)self _auditToken:&v8 hasEntitlement:kCheckerBoardSystemServicesEntitlement])
  {
    unint64_t v6 = 3;
  }
  else if ([(CBShellServer *)self _auditToken:&v8 hasEntitlement:kCheckerBoardRemoteAlertsEntitlement])
  {
    unint64_t v6 = 2;
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)_auditToken:(id *)a3 hasEntitlement:(id)a4
{
  [a4 UTF8String];
  id v4 = (void *)xpc_copy_entitlement_for_token();
  id v5 = v4;
  if (v4) {
    BOOL value = xpc_BOOL_get_value(v4);
  }
  else {
    BOOL value = 0;
  }

  return value;
}

- (CBRemoteAlertServerDelegate)remoteAlertsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteAlertsDelegate);

  return (CBRemoteAlertServerDelegate *)WeakRetained;
}

- (void)setRemoteAlertsDelegate:(id)a3
{
}

- (CBSystemServicesServerDelegate)systemServicesDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemServicesDelegate);

  return (CBSystemServicesServerDelegate *)WeakRetained;
}

- (void)setSystemServicesDelegate:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_destroyWeak((id *)&self->_systemServicesDelegate);

  objc_destroyWeak((id *)&self->_remoteAlertsDelegate);
}

@end