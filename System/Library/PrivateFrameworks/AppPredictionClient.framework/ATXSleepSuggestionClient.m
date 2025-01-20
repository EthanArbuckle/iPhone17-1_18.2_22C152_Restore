@interface ATXSleepSuggestionClient
- (ATXSleepSuggestionClient)init;
- (NSXPCConnection)xpcConnection;
- (void)predictedSleepSuggestionWithCompletionHandler:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation ATXSleepSuggestionClient

- (ATXSleepSuggestionClient)init
{
  v8.receiver = self;
  v8.super_class = (Class)ATXSleepSuggestionClient;
  v2 = [(ATXSleepSuggestionClient *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.proactive.sleepSchedule" options:0];
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v3;

    v5 = v2->_xpcConnection;
    v6 = ATXSleepSuggestionInterface();
    [(NSXPCConnection *)v5 setRemoteObjectInterface:v6];

    [(NSXPCConnection *)v2->_xpcConnection setInterruptionHandler:&__block_literal_global_11];
    [(NSXPCConnection *)v2->_xpcConnection setInvalidationHandler:&__block_literal_global_7];
    [(NSXPCConnection *)v2->_xpcConnection resume];
  }
  return v2;
}

void __32__ATXSleepSuggestionClient_init__block_invoke()
{
  v0 = __atxlog_handle_modes();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __32__ATXSleepSuggestionClient_init__block_invoke_cold_1(v0);
  }
}

void __32__ATXSleepSuggestionClient_init__block_invoke_5()
{
  v0 = __atxlog_handle_modes();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A790D000, v0, OS_LOG_TYPE_INFO, "ATXSleepSuggestionClient: invalidation handler called", v1, 2u);
  }
}

- (void)predictedSleepSuggestionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(ATXSleepSuggestionClient *)self xpcConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__ATXSleepSuggestionClient_predictedSleepSuggestionWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E5D04F50;
  id v9 = v4;
  id v6 = v4;
  v7 = [v5 remoteObjectProxyWithErrorHandler:v8];
  [v7 predictedSleepSuggestionWithCompletionHandler:v6];
}

void __74__ATXSleepSuggestionClient_predictedSleepSuggestionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_sleep_schedule();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __74__ATXSleepSuggestionClient_predictedSleepSuggestionWithCompletionHandler___block_invoke_cold_1(v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

void __32__ATXSleepSuggestionClient_init__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "ATXSleepSuggestionClient: interruption handler called", v1, 2u);
}

void __74__ATXSleepSuggestionClient_predictedSleepSuggestionWithCompletionHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 localizedDescription];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "ATXSleepSuggestionClient: XPC failed: %@", (uint8_t *)&v4, 0xCu);
}

@end