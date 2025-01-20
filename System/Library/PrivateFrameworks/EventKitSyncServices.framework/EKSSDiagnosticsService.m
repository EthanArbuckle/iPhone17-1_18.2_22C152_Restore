@interface EKSSDiagnosticsService
+ (id)log;
- (EKSSDiagnosticsService)init;
- (id)_createConnection;
- (void)dealloc;
- (void)dumpDiagnosticsWithCompletion:(id)a3;
@end

@implementation EKSSDiagnosticsService

+ (id)log
{
  if (log_onceToken != -1) {
    dispatch_once(&log_onceToken, &__block_literal_global);
  }
  v2 = (void *)log_log;
  return v2;
}

uint64_t __29__EKSSDiagnosticsService_log__block_invoke()
{
  log_log = (uint64_t)os_log_create("com.apple.DiagnosticExtensions.EventKitSync", "EKSSDiagnosticsService");
  return MEMORY[0x270F9A758]();
}

- (EKSSDiagnosticsService)init
{
  v7.receiver = self;
  v7.super_class = (Class)EKSSDiagnosticsService;
  v2 = [(EKSSDiagnosticsService *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(EKSSDiagnosticsService *)v2 _createConnection];
    connection = v3->_connection;
    v3->_connection = (NSXPCConnection *)v4;
  }
  return v3;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)EKSSDiagnosticsService;
  [(EKSSDiagnosticsService *)&v3 dealloc];
}

- (id)_createConnection
{
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.EventKitSyncServices.server" options:4096];
  uint64_t v4 = EKSSServiceXPCInterface();
  [v3 setRemoteObjectInterface:v4];

  id v5 = objc_initWeak(&location, self);
  v6 = [(EKSSDiagnosticsService *)self description];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __43__EKSSDiagnosticsService__createConnection__block_invoke;
  v14[3] = &unk_265303010;
  id v7 = v6;
  id v15 = v7;
  [v3 setInterruptionHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __43__EKSSDiagnosticsService__createConnection__block_invoke_6;
  v12[3] = &unk_265303010;
  id v8 = v7;
  id v13 = v8;
  [v3 setInvalidationHandler:v12];
  [v3 resume];
  v9 = +[EKSSDiagnosticsService log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_24D299000, v9, OS_LOG_TYPE_DEFAULT, "connection created", v11, 2u);
  }

  objc_destroyWeak(&location);
  return v3;
}

void __43__EKSSDiagnosticsService__createConnection__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = +[EKSSDiagnosticsService log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_24D299000, v2, OS_LOG_TYPE_DEFAULT, "interrupted: %@", (uint8_t *)&v4, 0xCu);
  }
}

void __43__EKSSDiagnosticsService__createConnection__block_invoke_6(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = +[EKSSDiagnosticsService log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_24D299000, v2, OS_LOG_TYPE_DEFAULT, "invalidated: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)dumpDiagnosticsWithCompletion:(id)a3
{
  id v4 = a3;
  connection = self->_connection;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__EKSSDiagnosticsService_dumpDiagnosticsWithCompletion___block_invoke;
  v8[3] = &unk_265303038;
  id v9 = v4;
  id v6 = v4;
  id v7 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v8];
  [v7 dumpDiagnosticsWithCompletion:v6];
}

void __56__EKSSDiagnosticsService_dumpDiagnosticsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [EKSSLogger alloc];
  uint64_t v5 = [NSString stringWithFormat:@"dumpDiagnostics completed with error: %@", v3];

  id v6 = [(EKSSLogger *)v4 initWithString:v5];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end