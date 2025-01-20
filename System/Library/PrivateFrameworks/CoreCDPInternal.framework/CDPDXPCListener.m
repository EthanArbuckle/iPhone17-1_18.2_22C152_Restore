@interface CDPDXPCListener
+ (id)sharedInstance;
- (BOOL)_connection:(id)a3 hasEntitlement:(id)a4;
- (BOOL)_shouldAcceptNewConnectionWithEntitlements:(unint64_t)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CDPDXPCListener)init;
- (NSXPCListener)listener;
- (unint64_t)_clientTypeForBundleID:(id)a3;
- (unint64_t)_clientTypeForConnection:(id)a3;
- (void)setListener:(id)a3;
- (void)start;
@end

@implementation CDPDXPCListener

- (unint64_t)_clientTypeForBundleID:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.purplebuddy"])
  {
    v4 = _CDPLogSystem();
    unint64_t v5 = 2;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      -[CDPDXPCListener _clientTypeForBundleID:](v4);
      unint64_t v5 = 2;
    }
  }
  else
  {
    int v6 = [v3 isEqualToString:@"com.apple.Preferences"];
    v4 = _CDPLogSystem();
    BOOL v7 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
    if (v6)
    {
      if (v7) {
        -[CDPDXPCListener _clientTypeForBundleID:](v4);
      }
      unint64_t v5 = 1;
    }
    else
    {
      if (v7) {
        -[CDPDXPCListener _clientTypeForBundleID:]();
      }
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CDPDXPCListener listener:shouldAcceptNewConnection:]();
  }

  if ([(CDPDXPCListener *)self _connection:v7 hasEntitlement:@"com.apple.cdp.recovery"]|| [(CDPDXPCListener *)self _connection:v7 hasEntitlement:@"com.apple.authkit.client"]|| [(CDPDXPCListener *)self _connection:v7 hasEntitlement:@"com.apple.authkit.client.private"]|| [(CDPDXPCListener *)self _connection:v7 hasEntitlement:@"com.apple.authkit.client.internal"]
    || [(CDPDXPCListener *)self _connection:v7 hasEntitlement:@"com.apple.authkit.client.owner"])
  {
    uint64_t v9 = 9;
  }
  else
  {
    uint64_t v9 = 1;
  }
  if ([(CDPDXPCListener *)self _connection:v7 hasEntitlement:@"com.apple.cdp.statemachine"])
  {
    v9 |= 2uLL;
  }
  if ([(CDPDXPCListener *)self _connection:v7 hasEntitlement:@"com.apple.cdp.utility"])
  {
    v9 |= 4uLL;
  }
  if ([(CDPDXPCListener *)self _connection:v7 hasEntitlement:@"com.apple.cdp.followup"])
  {
    v9 |= 0x10uLL;
  }
  if ([(CDPDXPCListener *)self _connection:v7 hasEntitlement:@"com.apple.cdp.recoverykey"])
  {
    v9 |= 0x20uLL;
  }
  if ([(CDPDXPCListener *)self _connection:v7 hasEntitlement:@"com.apple.cdp.walrus"])
  {
    v9 |= 0x40uLL;
  }
  if ([(CDPDXPCListener *)self _connection:v7 hasEntitlement:@"com.apple.cdp.walrus.pcskeys"])
  {
    uint64_t v10 = v9 | 0x80;
  }
  else
  {
    uint64_t v10 = v9;
  }
  unint64_t v11 = [(CDPDXPCListener *)self _clientTypeForConnection:v7];
  BOOL v12 = [(CDPDXPCListener *)self _shouldAcceptNewConnectionWithEntitlements:v10];
  if (v12)
  {
    v13 = [[CDPDClientHandler alloc] initWithConnection:v7 entitlements:v10 clientType:v11];
    v14 = CDPDaemonExportedInterface();
    [v7 setExportedInterface:v14];

    [v7 setExportedObject:v13];
    objc_initWeak(&location, v7);
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    v19 = __54__CDPDXPCListener_listener_shouldAcceptNewConnection___block_invoke;
    v20 = &unk_26432F190;
    objc_copyWeak(&v21, &location);
    [v7 setInvalidationHandler:&v17];
    objc_msgSend(v7, "resume", v17, v18, v19, v20);
    v15 = _CDPLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[CDPDXPCListener listener:shouldAcceptNewConnection:]();
    }

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    _CDPLogSystem();
    v13 = (CDPDClientHandler *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_DEBUG)) {
      -[CDPDXPCListener listener:shouldAcceptNewConnection:]();
    }
  }

  return v12;
}

- (BOOL)_connection:(id)a3 hasEntitlement:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v6 isEqualToString:@"com.apple.cdp.recoverykey"] & 1) != 0
    || ([v6 isEqualToString:@"com.apple.cdp.utility"] & 1) != 0
    || [v6 isEqualToString:@"com.apple.cdp.walrus"])
  {
    id v7 = [v5 valueForEntitlement:v6];
    BOOL v8 = (objc_opt_respondsToSelector() & 1) != 0 && ([v7 BOOLValue] & 1) != 0;
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (BOOL)_shouldAcceptNewConnectionWithEntitlements:(unint64_t)a3
{
  return a3 != 1;
}

- (unint64_t)_clientTypeForConnection:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v4 = proc_pidpath([a3 processIdentifier], buffer, 0x1000u);
  id v5 = NSURL;
  id v6 = (void *)[[NSString alloc] initWithBytes:buffer length:v4 encoding:4];
  id v7 = [v5 fileURLWithPath:v6];

  if (v7)
  {
    BOOL v8 = (void *)_CFBundleCopyBundleURLForExecutableURL();
    uint64_t v9 = [MEMORY[0x263F086E0] bundleWithURL:v8];
    uint64_t v10 = [v9 bundleIdentifier];
    unint64_t v11 = [(CDPDXPCListener *)self _clientTypeForBundleID:v10];
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

void __54__CDPDXPCListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __54__CDPDXPCListener_listener_shouldAcceptNewConnection___block_invoke_cold_1(a1, v2);
  }

  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 postNotificationName:@"CDPDConnectionInvalidatedNotification" object:WeakRetained];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

uint64_t __33__CDPDXPCListener_sharedInstance__block_invoke()
{
  sharedInstance_instance = objc_alloc_init(CDPDXPCListener);
  return MEMORY[0x270F9A758]();
}

- (CDPDXPCListener)init
{
  v6.receiver = self;
  v6.super_class = (Class)CDPDXPCListener;
  v2 = [(CDPDXPCListener *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.cdp.daemon"];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v3;
  }
  return v2;
}

- (void)start
{
  [(NSXPCListener *)self->_listener setDelegate:self];
  listener = self->_listener;
  [(NSXPCListener *)listener resume];
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
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl(&dword_218640000, v1, OS_LOG_TYPE_DEBUG, "Accepting new connection %@ with entitlements mask %i", v2, 0x12u);
}

- (void)listener:shouldAcceptNewConnection:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "Denying new connection %@", v2, v3, v4, v5, v6);
}

- (void)listener:shouldAcceptNewConnection:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "Received new connection %@, checking entitlements...", v2, v3, v4, v5, v6);
}

void __54__CDPDXPCListener_listener_shouldAcceptNewConnection___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_218640000, a2, OS_LOG_TYPE_DEBUG, "CDP client connection invalidated: %@", v4, 0xCu);
}

- (void)_clientTypeForBundleID:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_218640000, log, OS_LOG_TYPE_DEBUG, "Client is Buddy", v1, 2u);
}

- (void)_clientTypeForBundleID:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_218640000, log, OS_LOG_TYPE_DEBUG, "Client is Preferences", v1, 2u);
}

- (void)_clientTypeForBundleID:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "Unknown client type with bundleID '%@'", v2, v3, v4, v5, v6);
}

@end