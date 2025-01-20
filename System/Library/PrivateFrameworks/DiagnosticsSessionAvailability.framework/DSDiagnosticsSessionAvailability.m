@interface DSDiagnosticsSessionAvailability
+ (id)sharedInstance;
- (NSXPCConnection)connection;
- (int64_t)enhancedLoggingStatus;
- (void)_getSessionStatusWithTicketNumber:(id)a3 timeout:(id)a4 completionHandler:(id)a5;
- (void)_openDiagnosticsAppWithCompletionHandler:(id)a3;
- (void)_setUpXPCConnectionIfNeeded;
- (void)getSessionStatusWithCompletionHandler:(id)a3;
- (void)getSessionStatusWithTicketNumber:(id)a3 completionHandler:(id)a4;
- (void)getSessionStatusWithTicketNumber:(id)a3 timeout:(double)a4 completionHandler:(id)a5;
- (void)getSessionStatusWithTimeout:(double)a3 completionHandler:(id)a4;
- (void)openApplicationForSessionStatus:(int64_t)a3 completionHandler:(id)a4;
- (void)setConnection:(id)a3;
@end

@implementation DSDiagnosticsSessionAvailability

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __50__DSDiagnosticsSessionAvailability_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(DSDiagnosticsSessionAvailability);
  return MEMORY[0x270F9A758]();
}

- (void)getSessionStatusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = DSLogSessionAvailability();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DSDiagnosticsSessionAvailability getSessionStatusWithCompletionHandler:](v5, v6, v7, v8, v9, v10, v11, v12);
  }

  [(DSDiagnosticsSessionAvailability *)self _getSessionStatusWithTicketNumber:0 timeout:0 completionHandler:v4];
}

- (void)getSessionStatusWithTimeout:(double)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = DSLogSessionAvailability();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[DSDiagnosticsSessionAvailability getSessionStatusWithTimeout:completionHandler:](v7, v8, v9, v10, v11, v12, v13, v14);
  }

  v15 = [NSNumber numberWithDouble:a3];
  [(DSDiagnosticsSessionAvailability *)self _getSessionStatusWithTicketNumber:0 timeout:v15 completionHandler:v6];
}

- (void)getSessionStatusWithTicketNumber:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = DSLogSessionAvailability();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DSDiagnosticsSessionAvailability getSessionStatusWithTicketNumber:completionHandler:](v8, v9, v10, v11, v12, v13, v14, v15);
  }

  [(DSDiagnosticsSessionAvailability *)self _getSessionStatusWithTicketNumber:v7 timeout:0 completionHandler:v6];
}

- (void)getSessionStatusWithTicketNumber:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = DSLogSessionAvailability();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[DSDiagnosticsSessionAvailability getSessionStatusWithTicketNumber:timeout:completionHandler:](v10, v11, v12, v13, v14, v15, v16, v17);
  }

  v18 = [NSNumber numberWithDouble:a4];
  [(DSDiagnosticsSessionAvailability *)self _getSessionStatusWithTicketNumber:v9 timeout:v18 completionHandler:v8];
}

- (void)_getSessionStatusWithTicketNumber:(id)a3 timeout:(id)a4 completionHandler:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = DSLogSessionAvailability();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v21 = "-[DSDiagnosticsSessionAvailability _getSessionStatusWithTicketNumber:timeout:completionHandler:]";
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl(&dword_24CD24000, v11, OS_LOG_TYPE_DEFAULT, "%s ticketNumber: %@ timeout: %@", buf, 0x20u);
  }

  [(DSDiagnosticsSessionAvailability *)self _setUpXPCConnectionIfNeeded];
  uint64_t v12 = [(DSDiagnosticsSessionAvailability *)self connection];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __96__DSDiagnosticsSessionAvailability__getSessionStatusWithTicketNumber_timeout_completionHandler___block_invoke;
  v18[3] = &unk_2652F68B0;
  id v13 = v10;
  id v19 = v13;
  uint64_t v14 = [v12 remoteObjectProxyWithErrorHandler:v18];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __96__DSDiagnosticsSessionAvailability__getSessionStatusWithTicketNumber_timeout_completionHandler___block_invoke_16;
  v16[3] = &unk_2652F68D8;
  id v17 = v13;
  id v15 = v13;
  [v14 getSessionStatusWithTicketNumber:v8 timeout:v9 completionHandler:v16];
}

void __96__DSDiagnosticsSessionAvailability__getSessionStatusWithTicketNumber_timeout_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v16[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = DSLogSessionAvailability();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __96__DSDiagnosticsSessionAvailability__getSessionStatusWithTicketNumber_timeout_completionHandler___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }

  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = (void *)MEMORY[0x263F087E8];
  uint64_t v15 = *MEMORY[0x263F08608];
  v16[0] = v3;
  id v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
  uint64_t v14 = [v12 errorWithDomain:@"com.apple.DiagnosticsSessionAvailability" code:1 userInfo:v13];
  (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v14);
}

void __96__DSDiagnosticsSessionAvailability__getSessionStatusWithTicketNumber_timeout_completionHandler___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = DSLogSessionAvailability();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_24CD24000, v7, OS_LOG_TYPE_DEFAULT, "Service returned status: %@ error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v5 integerValue], v6);
}

- (void)openApplicationForSessionStatus:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  uint64_t v7 = DSLogSessionAvailability();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[DSDiagnosticsSessionAvailability openApplicationForSessionStatus:completionHandler:](a3, v7);
  }

  if ((unint64_t)(a3 - 1) < 2 || a3 == 4)
  {
    [(DSDiagnosticsSessionAvailability *)self _openDiagnosticsAppWithCompletionHandler:v6];
  }
  else if (!a3 && v6)
  {
    v6[2](v6, 0);
  }
}

- (void)_openDiagnosticsAppWithCompletionHandler:(id)a3
{
  v22[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = DSLogSessionAvailability();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[DSDiagnosticsSessionAvailability _openDiagnosticsAppWithCompletionHandler:](v4, v5, v6, v7, v8, v9, v10, v11);
  }

  uint64_t v12 = [MEMORY[0x263F3F790] serviceWithDefaultShellEndpoint];
  uint64_t v13 = *MEMORY[0x263F3F5B8];
  v22[0] = &unk_26FF34528;
  uint64_t v14 = *MEMORY[0x263F3F5E0];
  v21[0] = v13;
  v21[1] = v14;
  uint64_t v15 = [NSURL URLWithString:@"diagnostics://"];
  v21[2] = *MEMORY[0x263F3F5E8];
  v22[1] = v15;
  v22[2] = MEMORY[0x263EFFA88];
  uint64_t v16 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];

  id v17 = [MEMORY[0x263F3F778] optionsWithDictionary:v16];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __77__DSDiagnosticsSessionAvailability__openDiagnosticsAppWithCompletionHandler___block_invoke;
  v19[3] = &unk_2652F6900;
  id v20 = v3;
  id v18 = v3;
  [v12 openApplication:@"com.apple.Diagnostics" withOptions:v17 completion:v19];
}

void __77__DSDiagnosticsSessionAvailability__openDiagnosticsAppWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v20[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = DSLogSessionAvailability();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __77__DSDiagnosticsSessionAvailability__openDiagnosticsAppWithCompletionHandler___block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }

    uint64_t v14 = *(void *)(a1 + 32);
    if (v14)
    {
      uint64_t v15 = (void *)MEMORY[0x263F087E8];
      uint64_t v19 = *MEMORY[0x263F08608];
      v20[0] = v6;
      uint64_t v16 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
      id v17 = [v15 errorWithDomain:@"com.apple.DiagnosticsSessionAvailability" code:2 userInfo:v16];
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v17);
    }
  }
  else
  {
    uint64_t v18 = *(void *)(a1 + 32);
    if (v18) {
      (*(void (**)(uint64_t, void))(v18 + 16))(v18, 0);
    }
  }
}

- (int64_t)enhancedLoggingStatus
{
  [(DSDiagnosticsSessionAvailability *)self _setUpXPCConnectionIfNeeded];
  id v3 = [(DSDiagnosticsSessionAvailability *)self connection];
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_27];

  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__DSDiagnosticsSessionAvailability_enhancedLoggingStatus__block_invoke_28;
  v7[3] = &unk_2652F6948;
  v7[4] = &v8;
  [v4 getEnhancedLoggingStatusWithCompletionHandler:v7];
  int64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __57__DSDiagnosticsSessionAvailability_enhancedLoggingStatus__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = DSLogSessionAvailability();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __96__DSDiagnosticsSessionAvailability__getSessionStatusWithTicketNumber_timeout_completionHandler___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

uint64_t __57__DSDiagnosticsSessionAvailability_enhancedLoggingStatus__block_invoke_28(uint64_t a1, void *a2)
{
  uint64_t result = [a2 integerValue];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)_setUpXPCConnectionIfNeeded
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_24CD24000, log, OS_LOG_TYPE_DEBUG, "Setting up XPC connection", v1, 2u);
}

void __63__DSDiagnosticsSessionAvailability__setUpXPCConnectionIfNeeded__block_invoke()
{
  v0 = DSLogSessionAvailability();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __63__DSDiagnosticsSessionAvailability__setUpXPCConnectionIfNeeded__block_invoke_cold_1(v0);
  }
}

void __63__DSDiagnosticsSessionAvailability__setUpXPCConnectionIfNeeded__block_invoke_38()
{
  v0 = DSLogSessionAvailability();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __63__DSDiagnosticsSessionAvailability__setUpXPCConnectionIfNeeded__block_invoke_38_cold_1(v0);
  }
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)getSessionStatusWithCompletionHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getSessionStatusWithTimeout:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getSessionStatusWithTicketNumber:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getSessionStatusWithTicketNumber:(uint64_t)a3 timeout:(uint64_t)a4 completionHandler:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __96__DSDiagnosticsSessionAvailability__getSessionStatusWithTicketNumber_timeout_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)openApplicationForSessionStatus:(uint64_t)a1 completionHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  id v3 = "-[DSDiagnosticsSessionAvailability openApplicationForSessionStatus:completionHandler:]";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_24CD24000, a2, OS_LOG_TYPE_DEBUG, "%s sessionStatus: %ld", (uint8_t *)&v2, 0x16u);
}

- (void)_openDiagnosticsAppWithCompletionHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __77__DSDiagnosticsSessionAvailability__openDiagnosticsAppWithCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __63__DSDiagnosticsSessionAvailability__setUpXPCConnectionIfNeeded__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_24CD24000, log, OS_LOG_TYPE_ERROR, "XPC connection interrupted", v1, 2u);
}

void __63__DSDiagnosticsSessionAvailability__setUpXPCConnectionIfNeeded__block_invoke_38_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_24CD24000, log, OS_LOG_TYPE_ERROR, "XPC connection invalidated", v1, 2u);
}

@end