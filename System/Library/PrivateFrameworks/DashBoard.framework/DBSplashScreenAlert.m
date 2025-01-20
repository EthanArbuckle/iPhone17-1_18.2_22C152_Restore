@interface DBSplashScreenAlert
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (DBSplashScreenAlert)init;
- (NSXPCConnection)connection;
- (NSXPCListener)listener;
- (SBSRemoteAlertHandle)alertHandle;
- (void)_showAlertIfNecessary;
- (void)connect;
- (void)invalidate;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setAlertHandle:(id)a3;
- (void)setConnection:(id)a3;
- (void)setListener:(id)a3;
@end

@implementation DBSplashScreenAlert

- (DBSplashScreenAlert)init
{
  v7.receiver = self;
  v7.super_class = (Class)DBSplashScreenAlert;
  v2 = [(DBSplashScreenAlert *)&v7 init];
  if (v2)
  {
    v3 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __27__DBSplashScreenAlert_init__block_invoke;
    block[3] = &unk_2649B3E90;
    v6 = v2;
    dispatch_async(v3, block);
  }
  return v2;
}

uint64_t __27__DBSplashScreenAlert_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showAlertIfNecessary];
}

- (void)_showAlertIfNecessary
{
  int v3 = SBSGetScreenLockStatus();
  v4 = DBLogForCategory(9uLL);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "Device is locked, showing alert", buf, 2u);
    }

    v4 = [MEMORY[0x263F08D88] anonymousListener];
    [v4 setDelegate:self];
    [v4 resume];
    objc_storeStrong((id *)&self->_listener, v4);
    v6 = (void *)[objc_alloc(MEMORY[0x263F79410]) initWithServiceName:@"com.apple.CarPlaySplashScreen" viewControllerClassName:@"CARSplashScreenViewController"];
    id v7 = objc_alloc_init(MEMORY[0x263F79408]);
    v8 = [(NSXPCListener *)self->_listener endpoint];
    v9 = [v8 _endpoint];
    [v7 setXpcEndpoint:v9];

    v10 = (void *)[MEMORY[0x263F79428] newHandleWithDefinition:v6 configurationContext:v7];
    [v10 addObserver:self];
    alertHandle = self->_alertHandle;
    self->_alertHandle = (SBSRemoteAlertHandle *)v10;
    id v12 = v10;

    v13 = DBLogForCategory(9uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D6F0000, v13, OS_LOG_TYPE_DEFAULT, "Activating splash screen alert", buf, 2u);
    }

    [v12 activateWithContext:0];
    dispatch_time_t v14 = dispatch_time(0, 10000000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__DBSplashScreenAlert__showAlertIfNecessary__block_invoke;
    block[3] = &unk_2649B3E90;
    void block[4] = self;
    dispatch_after(v14, MEMORY[0x263EF83A0], block);
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "Device is not locked, will not present splash screen alert", buf, 2u);
  }
}

void __44__DBSplashScreenAlert__showAlertIfNecessary__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  v1 = [v2 remoteObjectProxy];
  [v1 dismissAlertAnimated:1];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  BOOL v5 = (void *)MEMORY[0x263F08D80];
  id v6 = a4;
  id v7 = [v5 interfaceWithProtocol:&unk_26E239BD8];
  [v6 setRemoteObjectInterface:v7];
  v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E1E2050];
  [v6 setExportedInterface:v8];
  [v6 setExportedObject:self];
  [v6 setInterruptionHandler:&__block_literal_global_28];
  [v6 setInvalidationHandler:&__block_literal_global_56];
  [v6 resume];
  [(DBSplashScreenAlert *)self setConnection:v6];

  return 1;
}

- (void)invalidate
{
  id v3 = [(DBSplashScreenAlert *)self connection];
  id v2 = [v3 remoteObjectProxy];
  [v2 dismissAlertAnimated:1];
}

- (void)connect
{
  id v2 = DBLogForCategory(9uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_22D6F0000, v2, OS_LOG_TYPE_DEFAULT, "Remote alert connected", v3, 2u);
  }
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v3 = DBLogForCategory(9uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_DEFAULT, "Alert did activate", v4, 2u);
  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  v4 = DBLogForCategory(9uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "Alert did deactivate", v6, 2u);
  }

  BOOL v5 = [(DBSplashScreenAlert *)self alertHandle];
  [v5 invalidate];
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a4;
  BOOL v5 = DBLogForCategory(9uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "Alert did invalidate with error: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (SBSRemoteAlertHandle)alertHandle
{
  return self->_alertHandle;
}

- (void)setAlertHandle:(id)a3
{
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_alertHandle, 0);
}

@end