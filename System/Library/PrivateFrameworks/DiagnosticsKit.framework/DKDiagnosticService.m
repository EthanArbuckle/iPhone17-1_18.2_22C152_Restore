@interface DKDiagnosticService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (Class)principalClass;
- (DKDiagnosticService)init;
- (NSMutableArray)connections;
- (NSXPCListener)listener;
- (void)resume;
- (void)setConnections:(id)a3;
- (void)setListener:(id)a3;
- (void)setPrincipalClass:(Class)a3;
@end

@implementation DKDiagnosticService

- (DKDiagnosticService)init
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)DKDiagnosticService;
  v2 = [(DKDiagnosticService *)&v15 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08D88] serviceListener];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v3;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    v5 = [MEMORY[0x263F086E0] mainBundle];
    v6 = [v5 infoDictionary];

    v7 = [v6 objectForKeyedSubscript:@"NSPrincipalClass"];
    uint64_t v8 = NSClassFromString(v7);
    Class principalClass = v2->_principalClass;
    v2->_Class principalClass = (Class)v8;

    v10 = DiagnosticsKitLogHandleForCategory(4);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      Class v11 = v2->_principalClass;
      *(_DWORD *)buf = 138412546;
      v17 = v7;
      __int16 v18 = 2112;
      Class v19 = v11;
      _os_log_impl(&dword_23D039000, v10, OS_LOG_TYPE_DEFAULT, "Principal class: %@ => %@", buf, 0x16u);
    }

    uint64_t v12 = [MEMORY[0x263EFF980] array];
    connections = v2->_connections;
    v2->_connections = (NSMutableArray *)v12;
  }
  return v2;
}

- (void)resume
{
  id v2 = [(DKDiagnosticService *)self listener];
  [v2 resume];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[DKDiagnosticService listener:shouldAcceptNewConnection:]";
    __int16 v29 = 2112;
    id v30 = v7;
    _os_log_impl(&dword_23D039000, v8, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
  }

  v9 = [v7 valueForEntitlement:@"com.apple.DiagnosticsKit.diagnosticmanager"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 BOOLValue])
  {
    v10 = [[DKDiagnosticContext alloc] initWithConnection:v7];
    [(DKDiagnosticService *)self principalClass];
    Class v11 = (char *)objc_opt_new();
    uint64_t v12 = DiagnosticsKitLogHandleForCategory(4);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v11;
      _os_log_impl(&dword_23D039000, v12, OS_LOG_TYPE_DEFAULT, "Instantiated controller: %@", buf, 0xCu);
    }

    [(DKDiagnosticContext *)v10 setXpcPrincipalObject:v11];
    [v7 setExportedObject:v10];
    v13 = +[DKDiagnosticContext _extensionAuxiliaryVendorProtocol];
    [v7 setExportedInterface:v13];

    v14 = +[DKDiagnosticHostContext _extensionAuxiliaryHostProtocol];
    [v7 setRemoteObjectInterface:v14];

    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, v7);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __58__DKDiagnosticService_listener_shouldAcceptNewConnection___block_invoke;
    v23[3] = &unk_264E86908;
    objc_copyWeak(&v24, &location);
    objc_copyWeak(&v25, (id *)buf);
    [v7 setInvalidationHandler:v23];
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __58__DKDiagnosticService_listener_shouldAcceptNewConnection___block_invoke_10;
    v21 = &unk_264E86930;
    objc_copyWeak(&v22, &location);
    [v7 setInterruptionHandler:&v18];
    objc_super v15 = [(DKDiagnosticService *)self connections];
    [v15 addObject:v7];

    [v7 resume];
    [v11 beginRequestWithDiagnosticContext:v10];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);

    BOOL v16 = 1;
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

void __58__DKDiagnosticService_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __58__DKDiagnosticService_listener_shouldAcceptNewConnection___block_invoke_cold_1((uint64_t)WeakRetained, v3);
  }

  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = [v4 connections];
  [v5 removeObject:WeakRetained];
}

void __58__DKDiagnosticService_listener_shouldAcceptNewConnection___block_invoke_10(uint64_t a1)
{
  id v2 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __58__DKDiagnosticService_listener_shouldAcceptNewConnection___block_invoke_10_cold_1(a1, v2);
  }
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (Class)principalClass
{
  return self->_principalClass;
}

- (void)setPrincipalClass:(Class)a3
{
}

- (NSMutableArray)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_principalClass, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

void __58__DKDiagnosticService_listener_shouldAcceptNewConnection___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23D039000, a2, OS_LOG_TYPE_ERROR, "Connection invalidated: %@", (uint8_t *)&v2, 0xCu);
}

void __58__DKDiagnosticService_listener_shouldAcceptNewConnection___block_invoke_10_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = 138412290;
  id v5 = WeakRetained;
  _os_log_error_impl(&dword_23D039000, a2, OS_LOG_TYPE_ERROR, "Connection interrupted: %@", (uint8_t *)&v4, 0xCu);
}

@end