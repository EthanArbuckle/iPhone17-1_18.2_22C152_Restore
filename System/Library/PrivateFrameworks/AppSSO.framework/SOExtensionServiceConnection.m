@interface SOExtensionServiceConnection
- (BOOL)_connectToService;
- (NSXPCConnection)xpcConnection;
- (NSXPCListenerEndpoint)serviceXpcEndpoint;
- (SOExtensionServiceConnection)initWithListenerEndpoint:(id)a3;
- (void)_connectToService;
- (void)beginAuthorizationWithCompletion:(id)a3;
- (void)setServiceXpcEndpoint:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation SOExtensionServiceConnection

- (SOExtensionServiceConnection)initWithListenerEndpoint:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SOExtensionServiceConnection;
  v5 = [(SOExtensionServiceConnection *)&v10 init];
  v6 = v5;
  if (!v5) {
    goto LABEL_4;
  }
  if (v4)
  {
    [(SOExtensionServiceConnection *)v5 setServiceXpcEndpoint:v4];
    [(SOExtensionServiceConnection *)v6 _connectToService];
LABEL_4:
    v7 = v6;
    goto LABEL_8;
  }
  v8 = SO_LOG_SOExtensionServiceConnection();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[SOExtensionServiceConnection initWithListenerEndpoint:](v8);
  }

  v7 = 0;
LABEL_8:

  return v7;
}

- (BOOL)_connectToService
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v3 = [(SOExtensionServiceConnection *)self xpcConnection];

  if (v3)
  {
    id v4 = SO_LOG_SOExtensionServiceConnection();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[SOExtensionServiceConnection _connectToService]();
    }

    return 1;
  }
  id v5 = objc_alloc(MEMORY[0x263F08D68]);
  v6 = [(SOExtensionServiceConnection *)self serviceXpcEndpoint];
  v7 = (void *)[v5 initWithListenerEndpoint:v6];
  [(SOExtensionServiceConnection *)self setXpcConnection:v7];

  v8 = [(SOExtensionServiceConnection *)self xpcConnection];

  if (v8)
  {
    id location = 0;
    p_id location = &location;
    uint64_t v25 = 0x2050000000;
    id v9 = (id)getSOInternalProtocolsClass_softClass;
    uint64_t v26 = getSOInternalProtocolsClass_softClass;
    if (!getSOInternalProtocolsClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      v28 = __getSOInternalProtocolsClass_block_invoke;
      v29 = &unk_26432A2A8;
      v30 = &location;
      __getSOInternalProtocolsClass_block_invoke((uint64_t)&buf);
      id v9 = p_location[3];
    }
    id v10 = v9;
    _Block_object_dispose(&location, 8);
    v11 = [v10 interfaceWithInternalProtocol:&unk_26C9B6850];
    v12 = [(SOExtensionServiceConnection *)self xpcConnection];
    [v12 setRemoteObjectInterface:v11];

    objc_initWeak(&location, self);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __49__SOExtensionServiceConnection__connectToService__block_invoke;
    v21[3] = &unk_26432A308;
    objc_copyWeak(&v22, &location);
    v13 = [(SOExtensionServiceConnection *)self xpcConnection];
    [v13 setInvalidationHandler:v21];

    uint64_t v19 = MEMORY[0x263EF8330];
    objc_copyWeak(&v20, &location);
    v14 = [(SOExtensionServiceConnection *)self xpcConnection];
    [v14 setInterruptionHandler:&v19];

    v15 = [(SOExtensionServiceConnection *)self xpcConnection];
    [v15 resume];

    v16 = SO_LOG_SOExtensionServiceConnection();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_2185C9000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: new XPC connection", (uint8_t *)&buf, 0xCu);
    }

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    return 1;
  }
  v18 = SO_LOG_SOExtensionServiceConnection();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    -[SOExtensionServiceConnection _connectToService]();
  }

  return 0;
}

void __49__SOExtensionServiceConnection__connectToService__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setXpcConnection:0];
  if (WeakRetained)
  {
    v2 = SO_LOG_SOExtensionServiceConnection();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __49__SOExtensionServiceConnection__connectToService__block_invoke_cold_1();
    }
  }
}

void __49__SOExtensionServiceConnection__connectToService__block_invoke_46(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = SO_LOG_SOExtensionServiceConnection();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __49__SOExtensionServiceConnection__connectToService__block_invoke_46_cold_1();
    }
  }
}

- (void)beginAuthorizationWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(SOExtensionServiceConnection *)self _connectToService])
  {
    id v5 = [(SOExtensionServiceConnection *)self xpcConnection];
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    v14 = __65__SOExtensionServiceConnection_beginAuthorizationWithCompletion___block_invoke;
    v15 = &unk_26432A330;
    id v6 = v4;
    id v16 = v6;
    v7 = [v5 remoteObjectProxyWithErrorHandler:&v12];
    objc_msgSend(v7, "beginAuthorizationWithCompletion:", v6, v12, v13, v14, v15);

    v8 = v16;
LABEL_9:

    goto LABEL_10;
  }
  id v9 = SO_LOG_SOExtensionServiceConnection();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[SOExtensionServiceConnection beginAuthorizationWithCompletion:](v9);
  }

  if (v4)
  {
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2050000000;
    id v10 = (void *)getSOErrorHelperClass_softClass;
    uint64_t v21 = getSOErrorHelperClass_softClass;
    if (!getSOErrorHelperClass_softClass)
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __getSOErrorHelperClass_block_invoke;
      v17[3] = &unk_26432A2A8;
      v17[4] = &v18;
      __getSOErrorHelperClass_block_invoke((uint64_t)v17);
      id v10 = (void *)v19[3];
    }
    id v11 = v10;
    _Block_object_dispose(&v18, 8);
    v8 = [v11 silentInternalErrorWithMessage:@"Failed to connect to AppSSO service"];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
    goto LABEL_9;
  }
LABEL_10:
}

void __65__SOExtensionServiceConnection_beginAuthorizationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SO_LOG_SOExtensionServiceConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __65__SOExtensionServiceConnection_beginAuthorizationWithCompletion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setXpcConnection:(id)a3
{
}

- (NSXPCListenerEndpoint)serviceXpcEndpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 16, 1);
}

- (void)setServiceXpcEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceXpcEndpoint, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)initWithListenerEndpoint:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2185C9000, log, OS_LOG_TYPE_ERROR, "missing XPC endpoint", v1, 2u);
}

- (void)_connectToService
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2185C9000, v0, v1, "%{public}@: XPC connection already exists", v2, v3, v4, v5, v6);
}

void __49__SOExtensionServiceConnection__connectToService__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2185C9000, v0, v1, "%{public}@: XPC connection invalidated", v2, v3, v4, v5, v6);
}

void __49__SOExtensionServiceConnection__connectToService__block_invoke_46_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2185C9000, v0, v1, "%{public}@: XPC connection interrupted", v2, v3, v4, v5, v6);
}

- (void)beginAuthorizationWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2185C9000, log, OS_LOG_TYPE_ERROR, "Failed to connect to AppSSO service", v1, 2u);
}

void __65__SOExtensionServiceConnection_beginAuthorizationWithCompletion___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_2185C9000, v0, OS_LOG_TYPE_ERROR, "AppSSO service XPC error: %{public}@", v1, 0xCu);
}

@end