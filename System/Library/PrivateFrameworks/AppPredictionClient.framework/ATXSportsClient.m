@interface ATXSportsClient
+ (id)sharedInstance;
- (ATXSportsClient)init;
- (void)requestedSchedulesForTeamsWithReply:(id)a3;
@end

@implementation ATXSportsClient

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_46);
  }
  v2 = (void *)sharedInstance_client;

  return v2;
}

uint64_t __33__ATXSportsClient_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_client;
  sharedInstance_client = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (ATXSportsClient)init
{
  v7.receiver = self;
  v7.super_class = (Class)ATXSportsClient;
  v2 = [(ATXSportsClient *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.proactive.sports.xpc" options:0];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    v5 = ATXSportsInterface();
    [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v5];

    [(NSXPCConnection *)v2->_connection setInterruptionHandler:&__block_literal_global_13_1];
    [(NSXPCConnection *)v2->_connection setInvalidationHandler:&__block_literal_global_16];
    [(NSXPCConnection *)v2->_connection resume];
  }
  return v2;
}

void __23__ATXSportsClient_init__block_invoke()
{
  uint64_t v0 = __atxlog_handle_xpc();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __23__ATXSportsClient_init__block_invoke_cold_1(v0);
  }
}

void __23__ATXSportsClient_init__block_invoke_14()
{
  uint64_t v0 = __atxlog_handle_xpc();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1A790D000, v0, OS_LOG_TYPE_DEFAULT, "Sports xpc connection invalidated", v1, 2u);
  }
}

- (void)requestedSchedulesForTeamsWithReply:(id)a3
{
  id v4 = a3;
  connection = self->_connection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__ATXSportsClient_requestedSchedulesForTeamsWithReply___block_invoke;
  v8[3] = &unk_1E5D04F50;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v8];
  [v7 requestedSchedulesForTeamsWithReply:v6];
}

void __55__ATXSportsClient_requestedSchedulesForTeamsWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_xpc();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __55__ATXSportsClient_requestedSchedulesForTeamsWithReply___block_invoke_cold_1((uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

void __23__ATXSportsClient_init__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "Sports xpc connection interrupted", v1, 2u);
}

void __55__ATXSportsClient_requestedSchedulesForTeamsWithReply___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  id v3 = "-[ATXSportsClient requestedSchedulesForTeamsWithReply:]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "%s: error fetching remote object proxy: %@", (uint8_t *)&v2, 0x16u);
}

@end