@interface ATXUserEducationSuggestionConnectorListenerDelegate
- (ATXUserEducationSuggestionConnectorListenerDelegate)initWithServiceName:(id)a3 interfaceFactory:(void *)a4 requestHandler:(id)a5;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ATXUserEducationSuggestionConnectorListenerDelegate

- (ATXUserEducationSuggestionConnectorListenerDelegate)initWithServiceName:(id)a3 interfaceFactory:(void *)a4 requestHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ATXUserEducationSuggestionConnectorListenerDelegate;
  v11 = [(ATXUserEducationSuggestionConnectorListenerDelegate *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_serviceName, a3);
    v12->_interfaceFactory = a4;
    objc_storeStrong(&v12->_requestHandler, a5);
  }

  return v12;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __90__ATXUserEducationSuggestionConnectorListenerDelegate_listener_shouldAcceptNewConnection___block_invoke;
  v13[3] = &unk_1E5D07660;
  v13[4] = self;
  id v5 = a4;
  v6 = (void *)MEMORY[0x1AD0D3E40](v13);
  v7 = (void *)MEMORY[0x1E4F93BD0];
  serviceName = self->_serviceName;
  id v9 = ((void (*)(void))self->_interfaceFactory)();
  id requestHandler = self->_requestHandler;
  v11 = __atxlog_handle_context_user_education_suggestions();
  LOBYTE(requestHandler) = [v7 shouldAcceptConnection:v5 serviceName:serviceName whitelistedServerInterface:v9 whitelistedClientInterface:0 requestHandler:requestHandler validateConnection:v6 setupClientProxy:0 interruptionHandler:&__block_literal_global_21_0 invalidationHandler:&__block_literal_global_23 logHandle:v11];

  return (char)requestHandler;
}

uint64_t __90__ATXUserEducationSuggestionConnectorListenerDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F93BD0];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = a2;
  id v5 = __atxlog_handle_context_user_education_suggestions();
  uint64_t v6 = [v2 checkForAndLogTrueBooleanEntitlement:v3 connection:v4 serviceName:v3 logHandle:v5];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestHandler, 0);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end