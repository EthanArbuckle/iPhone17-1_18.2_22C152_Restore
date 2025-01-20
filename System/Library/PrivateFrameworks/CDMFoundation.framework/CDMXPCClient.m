@interface CDMXPCClient
- (BOOL)areAssetsAvailable:(id)a3;
- (BOOL)registerWithAssetsDelegate:(id)a3 withType:(int64_t)a4;
- (CDMXPCClient)init;
- (CDMXPCClient)initWithCallingBundleId:(id)a3;
- (CDMXPCClient)initWithConnection:(id)a3 delegate:(id)a4 wakeOnInit:(BOOL)a5;
- (CDMXPCClient)initWithDelegate:(id)a3;
- (CDMXPCClient)initWithDelegate:(id)a3 withCallingBundleId:(id)a4;
- (id)connection;
- (void)dealloc;
- (void)doHandleCommand:(id)a3 forCallback:(id)a4;
- (void)invalidateConnection;
- (void)processCDMNluRequest:(id)a3;
- (void)processCDMNluRequest:(id)a3 nullableCompletionHandler:(id)a4;
- (void)setDataDispatcherContext:(id)a3;
- (void)setup:(id)a3;
- (void)setup:(id)a3 nullableCompletionHandler:(id)a4;
- (void)sharedInitTasks;
- (void)waitForDataDispatcherCompletion;
- (void)wake;
- (void)warmupWithCompletionHandler:(id)a3;
@end

@implementation CDMXPCClient

void __48__CDMXPCClient_setup_nullableCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = *(void **)(a1 + 32);
  v4 = [NSNumber numberWithBool:v6 == 0];
  [v3 setValue:v4 forKey:@"successFromSetup"];

  [*(id *)(a1 + 32) setValue:v6 forKey:@"errorFromSetup"];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

- (CDMXPCClient)initWithDelegate:(id)a3
{
  self->_wakeOnInit = 1;
  objc_storeStrong((id *)&self->_delegate, a3);
  [(CDMXPCClient *)self sharedInitTasks];
  return self;
}

- (void)wake
{
  v2 = [(CDMXPCClient *)self connection];
  id v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_27];

  [v3 wake];
}

- (void)sharedInitTasks
{
  self->_lock._os_unfair_lock_opaque = 0;
  if (self->_wakeOnInit) {
    [(CDMXPCClient *)self wake];
  }
}

- (void)setup:(id)a3 nullableCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([(CDMClientInterface *)self daemonKilled])
  {
    v8 = [NSNumber numberWithInt:0];
    [(CDMXPCClient *)self setValue:v8 forKey:@"daemonKilled"];
  }
  [v7 createSandboxExtensionForXPC];
  v9 = [(CDMXPCClient *)self connection];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __48__CDMXPCClient_setup_nullableCompletionHandler___block_invoke;
  v15[3] = &unk_2647A42E0;
  v15[4] = self;
  id v10 = v6;
  id v16 = v10;
  v11 = [v9 remoteObjectProxyWithErrorHandler:v15];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __48__CDMXPCClient_setup_nullableCompletionHandler___block_invoke_2;
  v13[3] = &unk_2647A42E0;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  [v11 setupWithConfig:v7 completionHandler:v13];
}

- (id)connection
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_connection)
  {
    id v4 = objc_alloc(MEMORY[0x263F08D68]);
    uint64_t v5 = +[CDMXPCDefines machServiceName];
    id v6 = (NSXPCConnection *)[v4 initWithMachServiceName:v5 options:4096];
    connection = self->_connection;
    self->_connection = v6;

    v8 = self->_connection;
    v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DA5A580];
    [(NSXPCConnection *)v8 setRemoteObjectInterface:v9];

    objc_initWeak(&location, self);
    id v10 = self->_connection;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __26__CDMXPCClient_connection__block_invoke;
    v17[3] = &unk_2647A4220;
    objc_copyWeak(&v18, &location);
    [(NSXPCConnection *)v10 setInvalidationHandler:v17];
    v11 = self->_connection;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __26__CDMXPCClient_connection__block_invoke_419;
    v15[3] = &unk_2647A4220;
    objc_copyWeak(&v16, &location);
    [(NSXPCConnection *)v11 setInterruptionHandler:v15];
    [(NSXPCConnection *)self->_connection resume];
    id v12 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[CDMXPCClient connection]";
      _os_log_debug_impl(&dword_2263A0000, v12, OS_LOG_TYPE_DEBUG, "%s Created connection to assistant_cdmd.", buf, 0xCu);
    }

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  os_unfair_lock_unlock(p_lock);
  v13 = self->_connection;
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataDispatcherContext, 0);
  objc_storeStrong((id *)&self->_serviceCenter, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)doHandleCommand:(id)a3 forCallback:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[CDMXPCClient doHandleCommand:forCallback:]";
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_debug_impl(&dword_2263A0000, v8, OS_LOG_TYPE_DEBUG, "%s Sending over XPC -> command=%@", buf, 0x16u);
  }

  v9 = [(CDMXPCClient *)self connection];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __44__CDMXPCClient_doHandleCommand_forCallback___block_invoke;
  v17[3] = &unk_2647A4298;
  id v10 = v7;
  id v18 = v10;
  v11 = [v9 remoteObjectProxyWithErrorHandler:v17];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[CDMXPCClient doHandleCommand:forCallback:]";
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_debug_impl(&dword_2263A0000, v12, OS_LOG_TYPE_DEBUG, "%s Sending over XPC a command that isKindOfClass CDMServiceGraphCommand -> command=%@", buf, 0x16u);
    }

    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __44__CDMXPCClient_doHandleCommand_forCallback___block_invoke_444;
    v15[3] = &unk_2647A4358;
    id v16 = v10;
    [v11 processRequestWithServiceGraphCommand:v6 completionHandler:v15];
    v13 = v16;
  }
  else
  {
    v13 = [NSString stringWithFormat:@"This command not supported: command=%@", v6];
    id v14 = [(CDMClientInterface *)self createNSError:v13 errorCode:1];
    if (v10) {
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
    }
  }
}

void __44__CDMXPCClient_doHandleCommand_forCallback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[CDMXPCClient doHandleCommand:forCallback:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_2263A0000, v4, OS_LOG_TYPE_ERROR, "%s [ERR]: Unable to make XPC connection, error=%@", (uint8_t *)&v6, 0x16u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __44__CDMXPCClient_doHandleCommand_forCallback___block_invoke_444(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 32))
  {
    id v7 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 136315650;
      id v9 = "-[CDMXPCClient doHandleCommand:forCallback:]_block_invoke";
      __int16 v10 = 2112;
      id v11 = v5;
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_debug_impl(&dword_2263A0000, v7, OS_LOG_TYPE_DEBUG, "%s XPC processRequestWithCmdCommandType finished with response=%@, error=%@", (uint8_t *)&v8, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)setDataDispatcherContext:(id)a3
{
}

- (void)waitForDataDispatcherCompletion
{
  v2 = [(CDMXPCClient *)self connection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_439];

  [v3 waitForDataDispatcherCompletionWithCompletionHandler:&__block_literal_global_442];
}

void __47__CDMXPCClient_waitForDataDispatcherCompletion__block_invoke_440()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    int v1 = 136315138;
    v2 = "-[CDMXPCClient waitForDataDispatcherCompletion]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v0, OS_LOG_TYPE_DEBUG, "%s CDMXPCService's waitForDataDispatcherCompletion method called", (uint8_t *)&v1, 0xCu);
  }
}

void __47__CDMXPCClient_waitForDataDispatcherCompletion__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[CDMXPCClient waitForDataDispatcherCompletion]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_2263A0000, v3, OS_LOG_TYPE_ERROR, "%s [ERR]: waitForDataDispatcherCompletion connection error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)processCDMNluRequest:(id)a3 nullableCompletionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  uint64_t v8 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "-[CDMXPCClient processCDMNluRequest:nullableCompletionHandler:]";
    __int16 v32 = 2112;
    id v33 = v6;
    _os_log_debug_impl(&dword_2263A0000, v8, OS_LOG_TYPE_DEBUG, "%s Sending XPC Nlu request to service -> %@", buf, 0x16u);
  }

  if ([(CDMClientInterface *)self daemonKilled])
  {
    id v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = *MEMORY[0x263F08320];
    v29 = @"assistant_cdmd has been killed. Please call setup to ensure CDM can handle requests.";
    __int16 v10 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    id v11 = [v9 errorWithDomain:@"CDMXPCClientErrorDomain" code:0 userInfo:v10];

    __int16 v12 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[CDMXPCClient processCDMNluRequest:nullableCompletionHandler:]";
      __int16 v32 = 2112;
      id v33 = v11;
      _os_log_error_impl(&dword_2263A0000, v12, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
    }

    if (v7)
    {
      v7[2](v7, 0, v11);
    }
    else if (self->_delegate)
    {
      id v18 = [CDMNluRequestID alloc];
      v19 = [v6 objcProto];
      v20 = [v19 requestId];
      __int16 v21 = [(CDMNluRequestID *)v18 initWithObjcProto:v20];

      [(CDMClientDelegate *)self->_delegate processCDMNluRequestErrorCallback:v21 error:v11];
    }
  }
  else
  {
    id v13 = [(CDMXPCClient *)self connection];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __63__CDMXPCClient_processCDMNluRequest_nullableCompletionHandler___block_invoke;
    v25[3] = &unk_2647A4308;
    uint64_t v14 = v7;
    id v27 = v14;
    v25[4] = self;
    id v15 = v6;
    id v26 = v15;
    id v16 = [v13 remoteObjectProxyWithErrorHandler:v25];

    v17 = [v15 objcProto];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __63__CDMXPCClient_processCDMNluRequest_nullableCompletionHandler___block_invoke_435;
    v22[3] = &unk_2647A4330;
    v24 = v14;
    v22[4] = self;
    id v23 = v15;
    [v16 processCDMNluRequestWithCdmNluRequest:v17 completionHandler:v22];

    id v11 = v27;
  }
}

void __63__CDMXPCClient_processCDMNluRequest_nullableCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4)
  {
    (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, 0, v3);
  }
  else if (*(void *)(*(void *)(a1 + 32) + 40))
  {
    id v5 = [CDMNluRequestID alloc];
    id v6 = [*(id *)(a1 + 40) objcProto];
    id v7 = [v6 requestId];
    uint64_t v8 = [(CDMNluRequestID *)v5 initWithObjcProto:v7];

    [*(id *)(*(void *)(a1 + 32) + 40) processCDMNluRequestErrorCallback:v8 error:v3];
  }
  else
  {
    id v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      id v11 = "-[CDMXPCClient processCDMNluRequest:nullableCompletionHandler:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_error_impl(&dword_2263A0000, v9, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

void __63__CDMXPCClient_processCDMNluRequest_nullableCompletionHandler___block_invoke_435(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  id v7 = [[CDMNluResponse alloc] initWithObjcProto:v6];

  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = CDMOSLoggerForCategory(0);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v10)
    {
      int v16 = 136315394;
      v17 = "-[CDMXPCClient processCDMNluRequest:nullableCompletionHandler:]_block_invoke";
      __int16 v18 = 2112;
      v19 = v7;
      _os_log_debug_impl(&dword_2263A0000, v9, OS_LOG_TYPE_DEBUG, "%s XPC response to Nlu request with callback handler <- %@", (uint8_t *)&v16, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (v10)
    {
      int v16 = 136315394;
      v17 = "-[CDMXPCClient processCDMNluRequest:nullableCompletionHandler:]_block_invoke";
      __int16 v18 = 2112;
      v19 = v7;
      _os_log_debug_impl(&dword_2263A0000, v9, OS_LOG_TYPE_DEBUG, "%s XPC response to Nlu request without callback handler <- %@", (uint8_t *)&v16, 0x16u);
    }

    id v11 = *(void **)(*(void *)(a1 + 32) + 40);
    if (v11)
    {
      if (v5)
      {
        __int16 v12 = [CDMNluRequestID alloc];
        id v13 = [*(id *)(a1 + 40) objcProto];
        uint64_t v14 = [v13 requestId];
        id v15 = [(CDMNluRequestID *)v12 initWithObjcProto:v14];

        [*(id *)(*(void *)(a1 + 32) + 40) processCDMNluRequestErrorCallback:v15 error:v5];
      }
      else
      {
        [v11 processCDMNluRequestCallback:v7];
      }
    }
  }
}

- (void)processCDMNluRequest:(id)a3
{
}

void __48__CDMXPCClient_setup_nullableCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:");
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)setup:(id)a3
{
}

void __20__CDMXPCClient_wake__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    id v5 = "-[CDMXPCClient wake]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_2263A0000, v3, OS_LOG_TYPE_INFO, "%s [WARN]: Error waking assistant_cdmd: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)warmupWithCompletionHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[CDMXPCClient warmupWithCompletionHandler:]";
    _os_log_debug_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }

  __int16 v6 = [(CDMXPCClient *)self connection];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__CDMXPCClient_warmupWithCompletionHandler___block_invoke;
  v12[3] = &unk_2647A4298;
  id v7 = v4;
  id v13 = v7;
  uint64_t v8 = [v6 remoteObjectProxyWithErrorHandler:v12];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__CDMXPCClient_warmupWithCompletionHandler___block_invoke_428;
  v10[3] = &unk_2647A4298;
  id v11 = v7;
  id v9 = v7;
  [v8 warmupWithCompletionHandler:v10];
}

void __44__CDMXPCClient_warmupWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[CDMXPCClient warmupWithCompletionHandler:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_2263A0000, v4, OS_LOG_TYPE_ERROR, "%s [ERR]: warmupWithCompletionHandler connection error: %@", (uint8_t *)&v6, 0x16u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __44__CDMXPCClient_warmupWithCompletionHandler___block_invoke_428(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = CDMOSLoggerForCategory(0);
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      __int16 v8 = "-[CDMXPCClient warmupWithCompletionHandler:]_block_invoke";
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_error_impl(&dword_2263A0000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: warmupWithCompletionHandler error: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315138;
    __int16 v8 = "-[CDMXPCClient warmupWithCompletionHandler:]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEBUG, "%s warmupWithCompletionHandler completed without error", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

- (BOOL)registerWithAssetsDelegate:(id)a3 withType:(int64_t)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    localeIdentifier = self->_localeIdentifier;
    int v11 = 136315394;
    __int16 v12 = "-[CDMXPCClient registerWithAssetsDelegate:withType:]";
    __int16 v13 = 2112;
    uint64_t v14 = localeIdentifier;
    _os_log_debug_impl(&dword_2263A0000, v7, OS_LOG_TYPE_DEBUG, "%s Register assets delegate for CDMXPCClient for locale: %@", (uint8_t *)&v11, 0x16u);
  }

  BOOL v8 = +[CDMAssetsUtils registerWithAssetsDelegate:v6 withType:a4 withLocale:self->_localeIdentifier];
  return v8;
}

- (BOOL)areAssetsAvailable:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v17 = 0;
  __int16 v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v5 = [(CDMXPCClient *)self connection];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __35__CDMXPCClient_areAssetsAvailable___block_invoke;
  v16[3] = &unk_2647A4248;
  v16[4] = &v17;
  id v6 = [v5 remoteObjectProxyWithErrorHandler:v16];

  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __35__CDMXPCClient_areAssetsAvailable___block_invoke_424;
  v13[3] = &unk_2647A4270;
  uint64_t v15 = &v17;
  BOOL v8 = v7;
  uint64_t v14 = v8;
  [v6 areAssetsAvailableWithLocale:v4 completionHandler:v13];
  dispatch_time_t v9 = dispatch_time(0, 1000000000* +[CDMUserDefaultsUtils readXPCCallbackDefaultTimeout]);
  if (dispatch_semaphore_wait(v8, v9))
  {
    id v10 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v22 = "-[CDMXPCClient areAssetsAvailable:]";
      _os_log_error_impl(&dword_2263A0000, v10, OS_LOG_TYPE_ERROR, "%s [ERR]: Timed-out waiting for areAssetsAvailable XPC call. Returning false", buf, 0xCu);
    }

    BOOL v11 = 0;
  }
  else
  {
    BOOL v11 = *((unsigned char *)v18 + 24) != 0;
  }

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __35__CDMXPCClient_areAssetsAvailable___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "-[CDMXPCClient areAssetsAvailable:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_error_impl(&dword_2263A0000, v4, OS_LOG_TYPE_ERROR, "%s [ERR]: areAssetsAvailable connection error: %@", (uint8_t *)&v5, 0x16u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
}

intptr_t __35__CDMXPCClient_areAssetsAvailable___block_invoke_424(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (CDMXPCClient)initWithDelegate:(id)a3 withCallingBundleId:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[CDMDataDispatcherContext alloc] initWithCallingBundleId:v6];

  dataDispatcherContext = self->_dataDispatcherContext;
  self->_dataDispatcherContext = v8;

  id v10 = [(CDMXPCClient *)self initWithDelegate:v7];
  return v10;
}

- (CDMXPCClient)initWithConnection:(id)a3 delegate:(id)a4 wakeOnInit:(BOOL)a5
{
  id v8 = (NSXPCConnection *)a3;
  uint64_t v9 = (CDMClientDelegate *)a4;
  self->_wakeOnInit = a5;
  connection = self->_connection;
  self->_connection = v8;
  BOOL v11 = v8;

  delegate = self->_delegate;
  self->_delegate = v9;

  [(CDMXPCClient *)self sharedInitTasks];
  return self;
}

- (void)invalidateConnection
{
  connection = self->_connection;
  if (connection)
  {
    [(NSXPCConnection *)connection invalidate];
    id v4 = self->_connection;
    self->_connection = 0;
  }
}

- (void)dealloc
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(CDMXPCClient *)self invalidateConnection];
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)CDMXPCClient;
  [(CDMXPCClient *)&v4 dealloc];
}

- (CDMXPCClient)initWithCallingBundleId:(id)a3
{
  id v4 = a3;
  int v5 = [[CDMDataDispatcherContext alloc] initWithCallingBundleId:v4];

  dataDispatcherContext = self->_dataDispatcherContext;
  self->_dataDispatcherContext = v5;

  return [(CDMXPCClient *)self init];
}

- (CDMXPCClient)init
{
  self->_wakeOnInit = 1;
  [(CDMXPCClient *)self sharedInitTasks];
  return self;
}

void __26__CDMXPCClient_connection__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(v1);
    [v3 invalidateConnection];
  }
  id v4 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    id v6 = "-[CDMXPCClient connection]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v4, OS_LOG_TYPE_DEBUG, "%s Connection to assistant_cdmd was invalidated.", (uint8_t *)&v5, 0xCu);
  }
}

void __26__CDMXPCClient_connection__block_invoke_419(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(v1);
    id v4 = [NSNumber numberWithInt:1];
    [v3 setValue:v4 forKey:@"daemonKilled"];

    int v5 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      uint64_t v7 = "-[CDMXPCClient connection]_block_invoke";
      _os_log_error_impl(&dword_2263A0000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: Connection to assistant_cdmd was interrupted. daemonKilled KVO set to true.", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    id v3 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      uint64_t v7 = "-[CDMXPCClient connection]_block_invoke";
      _os_log_error_impl(&dword_2263A0000, v3, OS_LOG_TYPE_ERROR, "%s [ERR]: Connection to assistant_cdmd was interrupted. CDMXPCClient (self) was nil, so couldn't set daemonKilled KVO.", (uint8_t *)&v6, 0xCu);
    }
  }
}

@end