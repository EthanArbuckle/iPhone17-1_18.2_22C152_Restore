@interface DEDXPCConnector
- (BOOL)isDaemon;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)started;
- (BOOL)validateConnection:(id)a3;
- (DEDXPCConnector)initWithDelegate:(id)a3;
- (DEDXPCConnectorDelegate)xpcConnectorDelegate;
- (DEDXPCProtocol)diagnosticextensionsdXPCInterface;
- (NSArray)clientConnections;
- (NSMutableDictionary)appConnections;
- (NSXPCConnection)diagnosticextensionsdConnection;
- (NSXPCListener)listener;
- (OS_os_log)log;
- (id)_connectionForPid:(id)a3;
- (id)_whitelistedXPCInterface;
- (id)clientXPCInterfaceFromInbound:(id)a3;
- (id)connectionWithEndpoint:(id)a3 forMachService:(id)a4;
- (id)remoteXPCObjectForApplicationPid:(id)a3;
- (unint64_t)connType;
- (unint64_t)connectionRestartCount;
- (void)_initializeDiagnosticextensionsdConnection;
- (void)_releaseAppConnectionWithPid:(int)a3;
- (void)_storeAppConnection:(id)a3;
- (void)configureConnectionType:(unint64_t)a3;
- (void)configureDaemonMode;
- (void)setAppConnections:(id)a3;
- (void)setConnType:(unint64_t)a3;
- (void)setConnectionRestartCount:(unint64_t)a3;
- (void)setDiagnosticextensionsdConnection:(id)a3;
- (void)setIsDaemon:(BOOL)a3;
- (void)setListener:(id)a3;
- (void)setLog:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)setXpcConnectorDelegate:(id)a3;
- (void)start;
- (void)startForDaemon;
@end

@implementation DEDXPCConnector

- (DEDXPCConnector)initWithDelegate:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DEDXPCConnector;
  v5 = [(DEDXPCConnector *)&v13 init];
  if (v5)
  {
    v6 = +[DEDConfiguration sharedInstance];
    os_log_t v7 = os_log_create((const char *)[v6 loggingSubsystem], "t-xpc-connector");
    log = v5->_log;
    v5->_log = (OS_os_log *)v7;

    *(_WORD *)&v5->_isDaemon = 0;
    listener = v5->_listener;
    v5->_listener = 0;

    uint64_t v10 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:3];
    appConnections = v5->_appConnections;
    v5->_appConnections = (NSMutableDictionary *)v10;

    objc_storeWeak((id *)&v5->_xpcConnectorDelegate, v4);
    v5->_connectionRestartCount = 0;
  }
  return v5;
}

- (void)configureConnectionType:(unint64_t)a3
{
  if (![(DEDXPCConnector *)self started])
  {
    [(DEDXPCConnector *)self setConnType:a3];
  }
}

- (void)configureDaemonMode
{
  if (![(DEDXPCConnector *)self started])
  {
    [(DEDXPCConnector *)self setIsDaemon:1];
  }
}

- (void)start
{
  if (![(DEDXPCConnector *)self started])
  {
    if ([(DEDXPCConnector *)self isDaemon])
    {
      [(DEDXPCConnector *)self startForDaemon];
    }
    else
    {
      [(DEDXPCConnector *)self startForApp];
    }
  }
}

- (void)startForDaemon
{
  v3 = +[DEDConfiguration sharedInstance];
  id v4 = [v3 machServiceName];
  unint64_t v5 = [(DEDXPCConnector *)self connType];
  if (v5)
  {
    if (v5 != 1)
    {
      v9 = 0;
      goto LABEL_11;
    }
    v6 = [(DEDXPCConnector *)self log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FE04000, v6, OS_LOG_TYPE_INFO, "starting anonymous listener", buf, 2u);
    }

    uint64_t v7 = [v3 sharedAnonymousListener];
  }
  else
  {
    v8 = [(DEDXPCConnector *)self log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FE04000, v8, OS_LOG_TYPE_INFO, "starting privileged listener", buf, 2u);
    }

    uint64_t v7 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:v4];
  }
  v9 = (void *)v7;
LABEL_11:
  [(DEDXPCConnector *)self setListener:v9];
  id v10 = [NSString stringWithFormat:@"%@-listener-queue", v4];
  v11 = dispatch_queue_create((const char *)[v10 cStringUsingEncoding:4], 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__DEDXPCConnector_startForDaemon__block_invoke;
  block[3] = &unk_26453A830;
  block[4] = self;
  id v15 = v4;
  id v16 = v9;
  id v12 = v9;
  id v13 = v4;
  dispatch_async(v11, block);
}

uint64_t __33__DEDXPCConnector_startForDaemon__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __33__DEDXPCConnector_startForDaemon__block_invoke_cold_2(a1, v2);
  }

  [*(id *)(a1 + 48) setDelegate:*(void *)(a1 + 32)];
  v3 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __33__DEDXPCConnector_startForDaemon__block_invoke_cold_1(v3);
  }

  return [*(id *)(a1 + 48) resume];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(DEDXPCConnector *)self validateConnection:v7];
  if (v8)
  {
    uint64_t v9 = [v7 processIdentifier];
    id v10 = [(DEDXPCConnector *)self log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v38 = (int)v9;
      _os_log_impl(&dword_21FE04000, v10, OS_LOG_TYPE_DEFAULT, "New connection from pid [%ld]", buf, 0xCu);
    }

    id v11 = objc_initWeak((id *)buf, self);
    id v12 = [(DEDXPCConnector *)self _whitelistedXPCInterface];
    [v7 setRemoteObjectInterface:v12];

    id WeakRetained = objc_loadWeakRetained((id *)buf);
    v14 = [WeakRetained _whitelistedXPCInterface];
    [v7 setExportedInterface:v14];

    id v15 = objc_loadWeakRetained((id *)buf);
    id v16 = [v15 xpcConnectorDelegate];
    id v17 = objc_loadWeakRetained((id *)buf);
    v18 = [NSNumber numberWithInt:v9];
    v19 = [v16 connector:v17 needsXPCInboundForPid:v18];

    [v7 setExportedObject:v19];
    v20 = [v7 description];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __54__DEDXPCConnector_listener_shouldAcceptNewConnection___block_invoke;
    v33[3] = &unk_26453BC00;
    objc_copyWeak(&v35, (id *)buf);
    id v21 = v20;
    id v34 = v21;
    int v36 = v9;
    [v7 setInvalidationHandler:v33];
    uint64_t v26 = MEMORY[0x263EF8330];
    uint64_t v27 = 3221225472;
    v28 = __54__DEDXPCConnector_listener_shouldAcceptNewConnection___block_invoke_26;
    v29 = &unk_26453BC00;
    objc_copyWeak(&v31, (id *)buf);
    id v22 = v21;
    id v30 = v22;
    int v32 = v9;
    [v7 setInterruptionHandler:&v26];
    id v23 = objc_loadWeakRetained((id *)buf);
    objc_msgSend(v23, "_storeAppConnection:", v7, v26, v27, v28, v29);

    [v7 resume];
    objc_destroyWeak(&v31);

    objc_destroyWeak(&v35);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v24 = [(DEDXPCConnector *)self log];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[DEDXPCConnector listener:shouldAcceptNewConnection:]();
    }
  }
  return v8;
}

void __54__DEDXPCConnector_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained log];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v10 = 138543362;
    uint64_t v11 = v5;
    _os_log_impl(&dword_21FE04000, v4, OS_LOG_TYPE_DEFAULT, "connection [%{public}@] was invalidated", (uint8_t *)&v10, 0xCu);
  }

  id v6 = objc_loadWeakRetained(v2);
  id v7 = [v6 xpcConnectorDelegate];
  id v8 = objc_loadWeakRetained(v2);
  [v7 connector:v8 didLooseConnectionToProcessWithPid:*(unsigned int *)(a1 + 48)];

  id v9 = objc_loadWeakRetained(v2);
  [v9 _releaseAppConnectionWithPid:*(unsigned int *)(a1 + 48)];
}

void __54__DEDXPCConnector_listener_shouldAcceptNewConnection___block_invoke_26(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained log];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_21FE04000, v4, OS_LOG_TYPE_DEFAULT, "connection [%{public}@] was interrupted", (uint8_t *)&v7, 0xCu);
  }

  id v6 = objc_loadWeakRetained(v2);
  [v6 _releaseAppConnectionWithPid:*(unsigned int *)(a1 + 48)];
}

- (BOOL)validateConnection:(id)a3
{
  id v4 = [a3 valueForEntitlement:@"com.apple.diagnosticextensionsd.xpcclient"];
  uint64_t v5 = +[DEDConfiguration sharedInstance];
  uint64_t v6 = [v5 connectionType];

  if (v6 == 1 || v4 && ([v4 BOOLValue] & 1) != 0)
  {
    BOOL v7 = 1;
  }
  else
  {
    uint64_t v8 = [(DEDXPCConnector *)self log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[DEDXPCConnector validateConnection:]((uint64_t)self, v8);
    }

    BOOL v7 = 0;
  }

  return v7;
}

- (id)connectionWithEndpoint:(id)a3 forMachService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x263F08D68]) initWithListenerEndpoint:v6];
  }
  else
  {
    if (!v7) {
      goto LABEL_7;
    }
    uint64_t v9 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:v7 options:4096];
  }
  int v10 = (void *)v9;
  if (v9)
  {
    uint64_t v11 = [(DEDXPCConnector *)self _whitelistedXPCInterface];
    [v10 setRemoteObjectInterface:v11];

    uint64_t v12 = [(DEDXPCConnector *)self _whitelistedXPCInterface];
    [v10 setExportedInterface:v12];

    id v13 = [(DEDXPCConnector *)self xpcConnectorDelegate];
    v14 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "processIdentifier"));
    id v15 = [v13 connector:self needsXPCInboundForPid:v14];

    [v10 setExportedObject:v15];
    objc_initWeak(&location, self);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __57__DEDXPCConnector_connectionWithEndpoint_forMachService___block_invoke;
    v21[3] = &unk_26453A9F0;
    objc_copyWeak(&v22, &location);
    [v10 setInvalidationHandler:v21];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __57__DEDXPCConnector_connectionWithEndpoint_forMachService___block_invoke_28;
    v19[3] = &unk_26453A9F0;
    objc_copyWeak(&v20, &location);
    [v10 setInterruptionHandler:v19];
    [v10 resume];
    id v16 = v10;
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);

    id v17 = v16;
    goto LABEL_10;
  }
LABEL_7:
  id v16 = [(DEDXPCConnector *)self log];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[DEDXPCConnector connectionWithEndpoint:forMachService:]((uint64_t)v8, v6, v16);
  }
  id v17 = 0;
LABEL_10:

  return v17;
}

void __57__DEDXPCConnector_connectionWithEndpoint_forMachService___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained log];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __57__DEDXPCConnector_connectionWithEndpoint_forMachService___block_invoke_cold_1();
  }

  id v4 = objc_loadWeakRetained(v1);
  [v4 setDiagnosticextensionsdConnection:0];
}

void __57__DEDXPCConnector_connectionWithEndpoint_forMachService___block_invoke_28(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained log];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __57__DEDXPCConnector_connectionWithEndpoint_forMachService___block_invoke_28_cold_1();
  }

  id v4 = objc_loadWeakRetained(v1);
  [v4 setDiagnosticextensionsdConnection:0];
}

- (id)_whitelistedXPCInterface
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D1BD2A8];
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  id v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  [v2 setClasses:v6 forSelector:sel_xpc_didDiscoverDevices_ argumentIndex:0 ofReply:0];
  id v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);

  [v2 setClasses:v9 forSelector:sel_xpc_gotDeviceUpdate_ argumentIndex:0 ofReply:0];
  int v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);

  [v2 setClasses:v12 forSelector:sel_xpc_startPairSetupForDevice_ argumentIndex:0 ofReply:0];
  id v13 = (void *)MEMORY[0x263EFFA08];
  uint64_t v14 = objc_opt_class();
  id v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);

  [v2 setClasses:v15 forSelector:sel_xpc_promptPINForDevice_ argumentIndex:0 ofReply:0];
  id v16 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);

  [v2 setClasses:v16 forSelector:sel_xpc_tryPIN_forDevice_ argumentIndex:0 ofReply:0];
  id v17 = (void *)MEMORY[0x263EFFA08];
  uint64_t v18 = objc_opt_class();
  v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);

  [v2 setClasses:v19 forSelector:sel_xpc_tryPIN_forDevice_ argumentIndex:1 ofReply:0];
  id v20 = (void *)MEMORY[0x263EFFA08];
  uint64_t v21 = objc_opt_class();
  id v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);

  [v2 setClasses:v22 forSelector:sel_xpc_successPINForDevice_ argumentIndex:0 ofReply:0];
  id v23 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);

  [v2 setClasses:v23 forSelector:sel_xpc_startBugSessionWithIdentifier_configuration_caller_target_ argumentIndex:0 ofReply:0];
  v24 = (void *)MEMORY[0x263EFFA08];
  uint64_t v25 = objc_opt_class();
  uint64_t v26 = objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);

  [v2 setClasses:v26 forSelector:sel_xpc_startBugSessionWithIdentifier_configuration_caller_target_ argumentIndex:1 ofReply:0];
  uint64_t v27 = (void *)MEMORY[0x263EFFA08];
  uint64_t v28 = objc_opt_class();
  v29 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);

  [v2 setClasses:v29 forSelector:sel_xpc_startBugSessionWithIdentifier_configuration_caller_target_ argumentIndex:2 ofReply:0];
  [v2 setClasses:v29 forSelector:sel_xpc_startBugSessionWithIdentifier_configuration_caller_target_ argumentIndex:3 ofReply:0];
  id v30 = (void *)MEMORY[0x263EFFA08];
  uint64_t v31 = objc_opt_class();
  int v32 = objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);

  [v2 setClasses:v32 forSelector:sel_xpc_adoptFiles_forSession_ argumentIndex:0 ofReply:0];
  v33 = (void *)MEMORY[0x263EFFA08];
  uint64_t v34 = objc_opt_class();
  id v35 = objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);

  [v2 setClasses:v35 forSelector:sel_xpc_listClientXPCConnectionsReply_ argumentIndex:0 ofReply:0];
  return v2;
}

- (id)remoteXPCObjectForApplicationPid:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DEDXPCConnector *)self _connectionForPid:v4];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__DEDXPCConnector_remoteXPCObjectForApplicationPid___block_invoke;
  v9[3] = &unk_26453BC28;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

void __52__DEDXPCConnector_remoteXPCObjectForApplicationPid___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __52__DEDXPCConnector_remoteXPCObjectForApplicationPid___block_invoke_cold_1(a1, v2);
  }
}

- (DEDXPCProtocol)diagnosticextensionsdXPCInterface
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = [(DEDXPCConnector *)self diagnosticextensionsdConnection];

  if (!v3)
  {
    if ([(DEDXPCConnector *)self connectionRestartCount] > 4)
    {
      id v4 = [(DEDXPCConnector *)self log];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v11 = 5;
        uint64_t v5 = "diagnosticextensionsd connection has been lost more than [%lu] times. Will not retry";
        goto LABEL_7;
      }
    }
    else
    {
      [(DEDXPCConnector *)self _initializeDiagnosticextensionsdConnection];
      [(DEDXPCConnector *)self setConnectionRestartCount:[(DEDXPCConnector *)self connectionRestartCount] + 1];
      id v4 = [(DEDXPCConnector *)self log];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v11 = [(DEDXPCConnector *)self connectionRestartCount];
        uint64_t v5 = "diagnosticextensionsd connection has been lost. Restarting it. count: [%lu]";
LABEL_7:
        _os_log_impl(&dword_21FE04000, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 0xCu);
      }
    }
  }
  id v6 = [(DEDXPCConnector *)self diagnosticextensionsdConnection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__DEDXPCConnector_diagnosticextensionsdXPCInterface__block_invoke;
  v9[3] = &unk_26453B2D8;
  v9[4] = self;
  id v7 = [v6 remoteObjectProxyWithErrorHandler:v9];

  return (DEDXPCProtocol *)v7;
}

void __52__DEDXPCConnector_diagnosticextensionsdXPCInterface__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __52__DEDXPCConnector_diagnosticextensionsdXPCInterface__block_invoke_cold_1();
  }
}

- (void)_storeAppConnection:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(DEDXPCConnector *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = [v4 processIdentifier];
    _os_log_impl(&dword_21FE04000, v5, OS_LOG_TYPE_DEFAULT, "Storing connection from PID [%i]", (uint8_t *)v9, 8u);
  }

  id v6 = self;
  objc_sync_enter(v6);
  id v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "processIdentifier"));
  uint64_t v8 = [(DEDXPCConnector *)v6 appConnections];
  [v8 setObject:v4 forKeyedSubscript:v7];

  objc_sync_exit(v6);
}

- (void)_releaseAppConnectionWithPid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(DEDXPCConnector *)v4 log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_21FE04000, v5, OS_LOG_TYPE_DEFAULT, "Clearing connection [%i]", (uint8_t *)v8, 8u);
  }

  id v6 = [(DEDXPCConnector *)v4 appConnections];
  id v7 = [NSNumber numberWithInt:v3];
  [v6 removeObjectForKey:v7];

  objc_sync_exit(v4);
}

- (id)_connectionForPid:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = [(DEDXPCConnector *)v5 appConnections];
  id v7 = [v6 objectForKeyedSubscript:v4];

  objc_sync_exit(v5);
  return v7;
}

- (id)clientXPCInterfaceFromInbound:(id)a3
{
  id v4 = [a3 senderPid];
  uint64_t v5 = [(DEDXPCConnector *)self remoteXPCObjectForApplicationPid:v4];

  return v5;
}

- (void)_initializeDiagnosticextensionsdConnection
{
  id v6 = +[DEDConfiguration sharedInstance];
  if ([(DEDXPCConnector *)self connType] == 1)
  {
    uint64_t v3 = [v6 sharedAnonymousListener];
    id v4 = [v3 endpoint];
    uint64_t v5 = [(DEDXPCConnector *)self connectionWithEndpoint:v4 forMachService:0];
    [(DEDXPCConnector *)self setDiagnosticextensionsdConnection:v5];
  }
  else
  {
    uint64_t v3 = [v6 machServiceName];
    id v4 = [(DEDXPCConnector *)self connectionWithEndpoint:0 forMachService:v3];
    [(DEDXPCConnector *)self setDiagnosticextensionsdConnection:v4];
  }
}

- (NSArray)clientConnections
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:4];
  id v4 = self;
  objc_sync_enter(v4);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(DEDXPCConnector *)v4 appConnections];
  id v6 = [v5 allKeys];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        unint64_t v11 = objc_opt_new();
        [v11 setPid:v10];
        [v3 addObject:v11];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v4);
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithArray:v3];

  return (NSArray *)v12;
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLog:(id)a3
{
}

- (NSXPCConnection)diagnosticextensionsdConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDiagnosticextensionsdConnection:(id)a3
{
}

- (NSMutableDictionary)appConnections
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAppConnections:(id)a3
{
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 40, 1);
}

- (void)setListener:(id)a3
{
}

- (unint64_t)connType
{
  return self->_connType;
}

- (void)setConnType:(unint64_t)a3
{
  self->_connType = a3;
}

- (BOOL)isDaemon
{
  return self->_isDaemon;
}

- (void)setIsDaemon:(BOOL)a3
{
  self->_isDaemon = a3;
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (DEDXPCConnectorDelegate)xpcConnectorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnectorDelegate);
  return (DEDXPCConnectorDelegate *)WeakRetained;
}

- (void)setXpcConnectorDelegate:(id)a3
{
}

- (unint64_t)connectionRestartCount
{
  return self->_connectionRestartCount;
}

- (void)setConnectionRestartCount:(unint64_t)a3
{
  self->_connectionRestartCount = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_xpcConnectorDelegate);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_appConnections, 0);
  objc_storeStrong((id *)&self->_diagnosticextensionsdConnection, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

void __33__DEDXPCConnector_startForDaemon__block_invoke_cold_1(NSObject *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08B88] currentThread];
  int v3 = 138412290;
  id v4 = v2;
  _os_log_debug_impl(&dword_21FE04000, a1, OS_LOG_TYPE_DEBUG, "resuming listener from thread %@", (uint8_t *)&v3, 0xCu);
}

void __33__DEDXPCConnector_startForDaemon__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_21FE04000, a2, OS_LOG_TYPE_DEBUG, "listening for service %@", (uint8_t *)&v3, 0xCu);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_21FE04000, v0, OS_LOG_TYPE_ERROR, "received connection request from unknown source", v1, 2u);
}

- (void)validateConnection:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FE04000, a2, OS_LOG_TYPE_ERROR, "XPC caller has no entitlement: %@", (uint8_t *)&v2, 0xCu);
}

- (void)connectionWithEndpoint:(NSObject *)a3 forMachService:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a2 description];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_21FE04000, a3, OS_LOG_TYPE_ERROR, "failed to initialize connection for mach service %{public}@ or endpoint %{public}@", (uint8_t *)&v6, 0x16u);
}

void __57__DEDXPCConnector_connectionWithEndpoint_forMachService___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_21FE04000, v0, OS_LOG_TYPE_DEBUG, "diagnosticextensionsd connection invalidated", v1, 2u);
}

void __57__DEDXPCConnector_connectionWithEndpoint_forMachService___block_invoke_28_cold_1()
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_21FE04000, v0, OS_LOG_TYPE_DEBUG, "diagnosticextensionsd connection interrupted", v1, 2u);
}

void __52__DEDXPCConnector_remoteXPCObjectForApplicationPid___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_21FE04000, a2, OS_LOG_TYPE_ERROR, "failed to get remoteXPCObject for process [%{public}@]", (uint8_t *)&v3, 0xCu);
}

void __52__DEDXPCConnector_diagnosticextensionsdXPCInterface__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_21FE04000, v0, OS_LOG_TYPE_ERROR, "failed to get diagnosticextensionsd remoteXPCObject", v1, 2u);
}

@end