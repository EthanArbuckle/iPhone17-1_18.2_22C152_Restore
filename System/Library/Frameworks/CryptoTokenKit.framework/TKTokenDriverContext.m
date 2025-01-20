@interface TKTokenDriverContext
- (BOOL)startRequestWithError:(id *)a3;
- (NSXPCListenerEndpoint)configurationEndpoint;
- (TKTokenConfigurationConnection)configurationConnection;
- (TKTokenDriver)driver;
- (double)idleTimeout;
- (id)configurationForTokenID:(id)a3;
- (void)acquireTokenWithInstanceID:(id)a3 reply:(id)a4;
- (void)acquireTokenWithSlot:(id)a3 AID:(id)a4 reply:(id)a5;
- (void)auditAuthOperation:(id)a3 auditToken:(id *)a4 success:(BOOL)a5;
- (void)configureWithReply:(id)a3;
- (void)idleTimeout;
- (void)releaseTokenWithInstanceID:(id)a3 reply:(id)a4;
- (void)setConfigurationEndpoint:(id)a3 reply:(id)a4;
- (void)setup;
@end

@implementation TKTokenDriverContext

- (TKTokenConfigurationConnection)configurationConnection
{
  v3 = self;
  objc_sync_enter(v3);
  configurationConnection = v3->_configurationConnection;
  if (!configurationConnection)
  {
    v5 = [(TKTokenDriverContext *)v3 configurationEndpoint];

    if (!v5)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:v3 file:@"TKToken.m" lineNumber:308 description:@"ctkd did not set configurationEndpoint"];
    }
    v6 = [TKTokenConfigurationConnection alloc];
    v7 = [(TKTokenDriverContext *)v3 configurationEndpoint];
    uint64_t v8 = [(TKTokenConfigurationConnection *)v6 initWithEndpoint:v7];
    v9 = v3->_configurationConnection;
    v3->_configurationConnection = (TKTokenConfigurationConnection *)v8;

    configurationConnection = v3->_configurationConnection;
  }
  v10 = configurationConnection;
  objc_sync_exit(v3);

  return v10;
}

- (id)configurationForTokenID:(id)a3
{
  id v4 = a3;
  v5 = [TKTokenConfiguration alloc];
  v6 = [(TKTokenDriverContext *)self configurationConnection];
  v7 = [(TKTokenConfiguration *)v5 initWithTokenID:v4 configurationConnection:v6];

  return v7;
}

- (void)auditAuthOperation:(id)a3 auditToken:(id *)a4 success:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = [(TKTokenDriverContext *)self _auxiliaryConnection];
  v10 = [v9 remoteObjectProxyWithErrorHandler:&__block_literal_global_255];

  long long v11 = *(_OWORD *)&a4->var0[4];
  v12[0] = *(_OWORD *)a4->var0;
  v12[1] = v11;
  [v10 auditAuthOperation:v8 auditToken:v12 success:v5];
}

void __62__TKTokenDriverContext_auditAuthOperation_auditToken_success___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = TK_LOG_token();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __62__TKTokenDriverContext_auditAuthOperation_auditToken_success___block_invoke_cold_1();
  }
}

- (double)idleTimeout
{
  id v2 = [(TKTokenDriverContext *)self inputItems];
  v3 = [v2 firstObject];

  if (v3)
  {
    id v4 = [v3 userInfo];
    BOOL v5 = [v4 objectForKeyedSubscript:@"idleTimeout"];

    objc_opt_class();
    double v6 = 5.0;
    if (objc_opt_isKindOfClass())
    {
      [v5 doubleValue];
      double v6 = v7;
      id v8 = TK_LOG_token();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        [(TKTokenDriverContext *)v8 idleTimeout];
      }
    }
  }
  else
  {
    double v6 = 5.0;
  }

  return v6;
}

- (void)setup
{
  v3 = +[TKTokenDriver createDriver];
  driver = self->_driver;
  self->_driver = v3;

  [(TKTokenDriver *)self->_driver setContext:self];
  BOOL v5 = [TKSharedResourceSlot alloc];
  double v6 = [(TKTokenDriverContext *)self driver];
  double v7 = [v6 classID];
  id v8 = [(TKSharedResourceSlot *)v5 initWithName:v7];
  [(TKTokenDriver *)self->_driver setKeepAliveResourceSlot:v8];

  objc_initWeak(&location, self);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __29__TKTokenDriverContext_setup__block_invoke;
  v25[3] = &unk_1E63C8018;
  objc_copyWeak(&v26, &location);
  uint64_t v9 = [(TKTokenDriver *)self->_driver keepAliveResourceSlot];
  [v9 setObjectDestroyedBlock:v25];

  [(TKTokenDriverContext *)self idleTimeout];
  double v11 = v10;
  uint64_t v12 = [(TKTokenDriver *)self->_driver keepAliveResourceSlot];
  [v12 setIdleTimeout:v11];

  uint64_t v13 = [(TKTokenDriverContext *)self _auxiliaryConnection];
  uint64_t v14 = [v13 _queue];
  uint64_t v15 = [(TKTokenDriver *)self->_driver keepAliveResourceSlot];
  [v15 setIdleQueue:v14];

  v16 = [(TKTokenDriver *)self->_driver keepAliveResourceSlot];
  v17 = [v16 resourceWithError:0];
  id initialKeepAlive = self->_initialKeepAlive;
  self->_id initialKeepAlive = v17;

  v19 = [(TKTokenDriverContext *)self inputItems];
  v20 = [v19 firstObject];
  v21 = [v20 userInfo];
  v22 = [v21 objectForKey:@"avoidInitialKeepAlive"];
  int v23 = [v22 BOOLValue];

  if (v23)
  {
    id v24 = self->_initialKeepAlive;
    self->_id initialKeepAlive = 0;
  }
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __29__TKTokenDriverContext_setup__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = TK_LOG_token();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __29__TKTokenDriverContext_setup__block_invoke_cold_3(WeakRetained);
    }

    v3 = [WeakRetained driver];
    [v3 terminate];

    id v4 = TK_LOG_token();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __29__TKTokenDriverContext_setup__block_invoke_cold_2();
    }

    BOOL v5 = (void *)WeakRetained[5];
    WeakRetained[5] = 0;

    double v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-7 userInfo:0];
    [WeakRetained cancelRequestWithError:v6];

    double v7 = TK_LOG_token();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __29__TKTokenDriverContext_setup__block_invoke_cold_1();
    }
  }
}

- (void)setConfigurationEndpoint:(id)a3 reply:(id)a4
{
  objc_storeStrong((id *)&self->_configurationEndpoint, a3);
  BOOL v5 = (void (**)(void))a4;
  v5[2]();
}

- (BOOL)startRequestWithError:(id *)a3
{
  double v6 = [(TKTokenDriverContext *)self driver];

  if (v6)
  {
    id initialKeepAlive = self->_initialKeepAlive;
    id v8 = initialKeepAlive;
    if (!initialKeepAlive)
    {
      a3 = [(TKTokenDriverContext *)self driver];
      v3 = [a3 keepAliveResourceSlot];
      id v8 = [v3 resourceWithError:0];
    }
    uint64_t v9 = [(TKTokenDriverContext *)self driver];
    [v9 setKeepAlive:v8];

    if (!initialKeepAlive)
    {
    }
    id v10 = self->_initialKeepAlive;
    self->_id initialKeepAlive = 0;
  }
  else
  {
    double v11 = TK_LOG_token();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[TKTokenDriverContext startRequestWithError:]();
    }

    if (a3)
    {
      *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4099 userInfo:0];
    }
  }
  return v6 != 0;
}

- (void)acquireTokenWithInstanceID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v17 = 0;
  BOOL v8 = [(TKTokenDriverContext *)self startRequestWithError:&v17];
  id v9 = v17;
  if (v8)
  {
    id v10 = _os_activity_create(&dword_1BED55000, "acquire token by instanceID", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v10, &state);
    double v11 = [(TKTokenDriverContext *)self driver];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    _OWORD v12[2] = __57__TKTokenDriverContext_acquireTokenWithInstanceID_reply___block_invoke;
    v12[3] = &unk_1E63C8040;
    id v13 = v6;
    uint64_t v14 = self;
    id v15 = v7;
    [v11 acquireTokenWithInstanceID:v13 reply:v12];

    os_activity_scope_leave(&state);
  }
  else
  {
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v9);
  }
}

void __57__TKTokenDriverContext_acquireTokenWithInstanceID_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = TK_LOG_token();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __57__TKTokenDriverContext_acquireTokenWithInstanceID_reply___block_invoke_cold_1(a1, v7, v8, v9, v10, v11, v12, v13);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v14 = [*(id *)(a1 + 40) driver];
  [v14 setKeepAlive:0];
}

- (void)acquireTokenWithSlot:(id)a3 AID:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v18 = 0;
  BOOL v11 = [(TKTokenDriverContext *)self startRequestWithError:&v18];
  id v12 = v18;
  if (v11)
  {
    uint64_t v13 = _os_activity_create(&dword_1BED55000, "acquire token by slot", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v13, &state);
    uint64_t v14 = [(TKTokenDriverContext *)self driver];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __55__TKTokenDriverContext_acquireTokenWithSlot_AID_reply___block_invoke;
    v15[3] = &unk_1E63C8068;
    v15[4] = self;
    id v16 = v10;
    [v14 acquireTokenWithSlot:v8 AID:v9 reply:v15];

    os_activity_scope_leave(&state);
  }
  else
  {
    (*((void (**)(id, void, void, id))v10 + 2))(v10, 0, 0, v12);
  }
}

void __55__TKTokenDriverContext_acquireTokenWithSlot_AID_reply___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a2;
  id v10 = TK_LOG_token();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __55__TKTokenDriverContext_acquireTokenWithSlot_AID_reply___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  BOOL v11 = [*(id *)(a1 + 32) driver];
  [v11 setKeepAlive:0];
}

- (void)configureWithReply:(id)a3
{
  id v4 = a3;
  id v12 = 0;
  BOOL v5 = [(TKTokenDriverContext *)self startRequestWithError:&v12];
  id v6 = v12;
  if (v5)
  {
    id v7 = _os_activity_create(&dword_1BED55000, "configure token class", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v7, &state);
    id v8 = [(TKTokenDriverContext *)self driver];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __43__TKTokenDriverContext_configureWithReply___block_invoke;
    v9[3] = &unk_1E63C8090;
    v9[4] = self;
    id v10 = v4;
    [v8 configureWithReply:v9];

    os_activity_scope_leave(&state);
  }
  else
  {
    (*((void (**)(id, void, id))v4 + 2))(v4, 0, v6);
  }
}

void __43__TKTokenDriverContext_configureWithReply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = TK_LOG_token();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __43__TKTokenDriverContext_configureWithReply___block_invoke_cold_1(a1);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v6 = [*(id *)(a1 + 32) driver];
  [v6 setKeepAlive:0];
}

- (void)releaseTokenWithInstanceID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v14 = 0;
  BOOL v8 = [(TKTokenDriverContext *)self startRequestWithError:&v14];
  id v9 = v14;
  if (v8)
  {
    id v10 = _os_activity_create(&dword_1BED55000, "release token", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v10, &state);
    BOOL v11 = [(TKTokenDriverContext *)self driver];
    [v11 releaseTokenWithInstanceID:v6];

    v7[2](v7);
    id v12 = [(TKTokenDriverContext *)self driver];
    [v12 setKeepAlive:0];

    os_activity_scope_leave(&state);
  }
  else
  {
    v7[2](v7);
  }
}

- (TKTokenDriver)driver
{
  return self->_driver;
}

- (NSXPCListenerEndpoint)configurationEndpoint
{
  return self->_configurationEndpoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationEndpoint, 0);
  objc_storeStrong((id *)&self->_driver, 0);
  objc_storeStrong(&self->_initialKeepAlive, 0);

  objc_storeStrong((id *)&self->_configurationConnection, 0);
}

void __62__TKTokenDriverContext_auditAuthOperation_auditToken_success___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1BED55000, v0, OS_LOG_TYPE_ERROR, "Failed to get host proxy: %{public}@", v1, 0xCu);
}

- (void)idleTimeout
{
}

void __29__TKTokenDriverContext_setup__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1BED55000, v0, v1, "Extension request cancelled", v2, v3, v4, v5, v6);
}

void __29__TKTokenDriverContext_setup__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1BED55000, v0, v1, "Driver shut down all endpoints", v2, v3, v4, v5, v6);
}

void __29__TKTokenDriverContext_setup__block_invoke_cold_3(void *a1)
{
  uint64_t v1 = [a1 driver];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0(&dword_1BED55000, v2, v3, "Idle time detected in extension (%{public}@), shutting down the context %{public}@", v4, v5, v6, v7, v8);
}

- (void)startRequestWithError:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1BED55000, v0, v1, "Aborting request on inactive context", v2, v3, v4, v5, v6);
}

void __57__TKTokenDriverContext_acquireTokenWithInstanceID_reply___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __55__TKTokenDriverContext_acquireTokenWithSlot_AID_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BED55000, v0, v1, "answering endpoint for %@", v2, v3, v4, v5, v6);
}

void __43__TKTokenDriverContext_configureWithReply___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) driver];
  uint64_t v2 = [v1 classID];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1BED55000, v3, v4, "finished configuring class %{public}@", v5, v6, v7, v8, v9);
}

@end