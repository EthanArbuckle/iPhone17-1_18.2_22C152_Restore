@interface ATXUserEducationSuggestionConnector
- (ATXUserEducationSuggestionConnector)initWithOurInterfaceFactory:(void *)a3 theirInterfaceFactory:(void *)a4 ourServiceName:(id)a5 theirServiceName:(id)a6 requestHandler:(id)a7;
- (id)remoteObjectProxy;
@end

@implementation ATXUserEducationSuggestionConnector

- (ATXUserEducationSuggestionConnector)initWithOurInterfaceFactory:(void *)a3 theirInterfaceFactory:(void *)a4 ourServiceName:(id)a5 theirServiceName:(id)a6 requestHandler:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)ATXUserEducationSuggestionConnector;
  v15 = [(ATXUserEducationSuggestionConnector *)&v23 init];
  if (v15)
  {
    v16 = [[ATXUserEducationSuggestionConnectorListenerDelegate alloc] initWithServiceName:v12 interfaceFactory:a3 requestHandler:v14];
    [MEMORY[0x1E4F93BC8] registerForService:v12 delegate:v16];
    id v17 = objc_alloc(MEMORY[0x1E4F93BC0]);
    v18 = ((void (*)(void))a4)();
    v19 = __atxlog_handle_context_user_education_suggestions();
    uint64_t v20 = [v17 initWithServiceName:v13 allowlistedServerInterface:v18 allowlistedClientInterface:0 serverInitiatedRequestHandler:0 interruptionHandler:&__block_literal_global_40 invalidationHandler:&__block_literal_global_4_1 logHandle:v19];
    xpcClientHelper = v15->_xpcClientHelper;
    v15->_xpcClientHelper = (_PASXPCClientHelper *)v20;
  }
  return v15;
}

- (id)remoteObjectProxy
{
  return (id)[(_PASXPCClientHelper *)self->_xpcClientHelper remoteObjectProxyWithErrorHandler:&__block_literal_global_7_1];
}

void __56__ATXUserEducationSuggestionConnector_remoteObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = __atxlog_handle_context_user_education_suggestions();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __56__ATXUserEducationSuggestionConnector_remoteObjectProxy__block_invoke_cold_1((uint64_t)v2, v3);
  }
}

- (void).cxx_destruct
{
}

void __56__ATXUserEducationSuggestionConnector_remoteObjectProxy__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  v3 = "-[ATXUserEducationSuggestionConnector remoteObjectProxy]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "%s: error with xpc connection: %@", (uint8_t *)&v2, 0x16u);
}

@end