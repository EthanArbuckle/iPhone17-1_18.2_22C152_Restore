@interface SAClient
+ (id)sharedInstance;
- (NSXPCConnection)connection;
- (SAClient)init;
- (SACrashDetectionClientProtocol)crashDetectionClientDelegate;
- (SAEmergencyResponseClientProtocol)emergencyResponseClientDelegate;
- (id)serverProxy;
- (void)callAuthenticationRequestHandlerWithError;
- (void)callAuthenticationRequestHandlerWithStatus:(int64_t)a3 error:(id)a4;
- (void)connection;
- (void)dialVoiceCallToPhoneNumber:(id)a3 completionHandler:(id)a4;
- (void)init;
- (void)requestCrashDetectionAuthorization:(id)a3;
- (void)requestMostRecentCrashDetectionEvent;
- (void)setConnection:(id)a3;
- (void)setCrashDetectionClientDelegate:(id)a3;
- (void)setEmergencyResponseClientDelegate:(id)a3;
- (void)updateMostRecentCrashDetectionEvent:(id)a3;
- (void)updateVoiceCallStatus:(int64_t)a3;
@end

@implementation SAClient

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__SAClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sSAClient;

  return v2;
}

uint64_t __26__SAClient_sharedInstance__block_invoke()
{
  sharedInstance_sSAClient = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (SAClient)init
{
  v14.receiver = self;
  v14.super_class = (Class)SAClient;
  v2 = [(SAClient *)&v14 init];
  if (v2)
  {
    v3 = sa_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      [(SAClient *)v3 init];
    }

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.SafetyKit.SAClient", 0);
    messageQueue = v2->_messageQueue;
    v2->_messageQueue = (OS_dispatch_queue *)v11;
  }
  return v2;
}

- (void)requestMostRecentCrashDetectionEvent
{
}

void __48__SAClient_requestMostRecentCrashDetectionEvent__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) serverProxy];
  [v1 requestMostRecentCrashDetectionEvent];
}

- (void)requestCrashDetectionAuthorization:(id)a3
{
  uint64_t v4 = (void (**)(id, void, void *))a3;
  uint64_t v5 = sa_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SAClient requestCrashDetectionAuthorization:](v5, v6, v7, v8, v9, v10, v11, v12);
  }

  v13 = self;
  objc_sync_enter(v13);
  if (v13->_authenticationRequestHandler)
  {
    objc_super v14 = sa_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SAClient requestCrashDetectionAuthorization:](v14);
    }

    v15 = +[SAError errorWithCode:4];
    v4[2](v4, 0, v15);
  }
  else
  {
    uint64_t v16 = MEMORY[0x245698E90](v4);
    id authenticationRequestHandler = v13->_authenticationRequestHandler;
    v13->_id authenticationRequestHandler = (id)v16;

    objc_initWeak(&location, v13);
    messageQueue = v13->_messageQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__SAClient_requestCrashDetectionAuthorization___block_invoke;
    block[3] = &unk_2651C9330;
    block[4] = v13;
    objc_copyWeak(&v20, &location);
    dispatch_async(messageQueue, block);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v13);
}

void __47__SAClient_requestCrashDetectionAuthorization___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) serverProxy];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __47__SAClient_requestCrashDetectionAuthorization___block_invoke_2;
  v3[3] = &unk_2651C9308;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  [v2 requestCrashDetectionAuthorization:v3];

  objc_destroyWeak(&v4);
}

void __47__SAClient_requestCrashDetectionAuthorization___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained callAuthenticationRequestHandlerWithStatus:a2 error:v5];
}

- (void)callAuthenticationRequestHandlerWithError
{
  id v3 = +[SAError errorWithCode:4];
  [(SAClient *)self callAuthenticationRequestHandlerWithStatus:0 error:v3];
}

- (void)callAuthenticationRequestHandlerWithStatus:(int64_t)a3 error:(id)a4
{
  id v9 = a4;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  id authenticationRequestHandler = (void (**)(id, int64_t, id))v6->_authenticationRequestHandler;
  if (authenticationRequestHandler)
  {
    authenticationRequestHandler[2](authenticationRequestHandler, a3, v9);
    id v8 = v6->_authenticationRequestHandler;
    v6->_id authenticationRequestHandler = 0;
  }
  objc_sync_exit(v6);
}

- (void)updateMostRecentCrashDetectionEvent:(id)a3
{
  id v4 = a3;
  id v5 = sa_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SAClient updateMostRecentCrashDetectionEvent:]();
  }

  if (v4)
  {
    uint64_t v6 = [(SAClient *)self crashDetectionClientDelegate];
    [v6 updateMostRecentCrashDetectionEvent:v4];
  }
  else
  {
    uint64_t v6 = sa_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SAClient updateMostRecentCrashDetectionEvent:](v6);
    }
  }
}

- (void)dialVoiceCallToPhoneNumber:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sa_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SAClient dialVoiceCallToPhoneNumber:completionHandler:]();
  }

  messageQueue = self->_messageQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__SAClient_dialVoiceCallToPhoneNumber_completionHandler___block_invoke;
  block[3] = &unk_2651C9358;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(messageQueue, block);
}

void __57__SAClient_dialVoiceCallToPhoneNumber_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) serverProxy];
  [v2 dialVoiceCallToPhoneNumber:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)updateVoiceCallStatus:(int64_t)a3
{
  id v5 = sa_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SAClient updateVoiceCallStatus:](a3, v5, v6, v7, v8, v9, v10, v11);
  }

  uint64_t v12 = [(SAClient *)self emergencyResponseClientDelegate];
  [v12 updateVoiceCallStatus:a3];
}

- (id)serverProxy
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_messageQueue);
  id v3 = [(SAClient *)self connection];
  id v4 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_0];

  return v4;
}

void __23__SAClient_serverProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = sa_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __23__SAClient_serverProxy__block_invoke_cold_1();
  }
}

- (void)setConnection:(id)a3
{
  uint64_t v8 = (NSXPCConnection *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_messageQueue);
  connection = self->_connection;
  p_connection = &self->_connection;
  id v5 = connection;
  if (connection != v8)
  {
    if (v5)
    {
      [(NSXPCConnection *)v5 invalidate];
      [(NSXPCConnection *)*p_connection setInvalidationHandler:0];
      [(NSXPCConnection *)*p_connection setInterruptionHandler:0];
    }
    objc_storeStrong((id *)p_connection, a3);
  }
}

- (NSXPCConnection)connection
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_messageQueue);
  connection = self->_connection;
  if (!connection)
  {
    id v4 = sa_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      [(SAClient *)v4 connection];
    }

    uint64_t v12 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.SafetyKit" options:4096];
    id v13 = self->_connection;
    self->_connection = v12;

    id v14 = self->_connection;
    v15 = SAServerInterface();
    [(NSXPCConnection *)v14 setRemoteObjectInterface:v15];

    uint64_t v16 = self->_connection;
    v17 = SAClientInterface();
    [(NSXPCConnection *)v16 setExportedInterface:v17];

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    objc_initWeak(&location, self);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __22__SAClient_connection__block_invoke;
    v21[3] = &unk_2651C9218;
    objc_copyWeak(&v22, &location);
    [(NSXPCConnection *)self->_connection setInterruptionHandler:v21];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __22__SAClient_connection__block_invoke_5;
    v19[3] = &unk_2651C9218;
    objc_copyWeak(&v20, &location);
    [(NSXPCConnection *)self->_connection setInvalidationHandler:v19];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }

  return connection;
}

void __22__SAClient_connection__block_invoke(uint64_t a1)
{
  id v2 = sa_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_245182000, v2, OS_LOG_TYPE_DEFAULT, "SA server connection interrupted", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained callAuthenticationRequestHandlerWithError];
  [WeakRetained requestMostRecentCrashDetectionEvent];
}

void __22__SAClient_connection__block_invoke_5(uint64_t a1)
{
  id v2 = sa_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_245182000, v2, OS_LOG_TYPE_DEFAULT, "SA server connection invalidated", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained[1];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __22__SAClient_connection__block_invoke_6;
  block[3] = &unk_2651C92E0;
  block[4] = WeakRetained;
  dispatch_async(v4, block);
}

uint64_t __22__SAClient_connection__block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) setConnection:0];
  id v2 = *(void **)(a1 + 32);

  return [v2 callAuthenticationRequestHandlerWithError];
}

- (SACrashDetectionClientProtocol)crashDetectionClientDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_crashDetectionClientDelegate);

  return (SACrashDetectionClientProtocol *)WeakRetained;
}

- (void)setCrashDetectionClientDelegate:(id)a3
{
}

- (SAEmergencyResponseClientProtocol)emergencyResponseClientDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_emergencyResponseClientDelegate);

  return (SAEmergencyResponseClientProtocol *)WeakRetained;
}

- (void)setEmergencyResponseClientDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_emergencyResponseClientDelegate);
  objc_destroyWeak((id *)&self->_crashDetectionClientDelegate);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_authenticationRequestHandler, 0);

  objc_storeStrong((id *)&self->_messageQueue, 0);
}

- (void)init
{
}

- (void)requestCrashDetectionAuthorization:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  id v2 = "-[SAClient requestCrashDetectionAuthorization:]";
  _os_log_error_impl(&dword_245182000, log, OS_LOG_TYPE_ERROR, "%s - Unable to request authorization because there is already an active request.", (uint8_t *)&v1, 0xCu);
}

- (void)requestCrashDetectionAuthorization:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updateMostRecentCrashDetectionEvent:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_245182000, log, OS_LOG_TYPE_ERROR, "Received malformed message from server for updateMostRecentCrashDetectionEvent: event should never be nil.", v1, 2u);
}

- (void)updateMostRecentCrashDetectionEvent:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_245182000, v0, v1, "%s, event: %@", v2, v3, v4, v5, 2u);
}

- (void)dialVoiceCallToPhoneNumber:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_245182000, v0, v1, "%s, phoneNumber: %@", v2, v3, v4, v5, 2u);
}

- (void)updateVoiceCallStatus:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __23__SAClient_serverProxy__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_245182000, v0, OS_LOG_TYPE_ERROR, "%s - unable to get serverProxy, error: %@", (uint8_t *)v1, 0x16u);
}

- (void)connection
{
}

@end