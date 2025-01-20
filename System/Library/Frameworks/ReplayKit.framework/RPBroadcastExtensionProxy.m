@interface RPBroadcastExtensionProxy
- (BOOL)enableMixedRealityCamera;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSExtension)broadcastUploadExtension;
- (NSXPCConnection)connection;
- (NSXPCListener)listener;
- (NSXPCListenerEndpoint)listenerEndpoint;
- (RPBroadcastExtensionProxy)initWithBroadcastUploadExtension:(id)a3;
- (RPBroadcastExtensionProxy)initWithBroadcastUploadListenerEndpoint:(id)a3;
- (id)broadcastURLHandler;
- (id)connectionReadyHandler;
- (id)errorHandler;
- (id)serviceInfoHandler;
- (void)dealloc;
- (void)establishConnectionWithHandler:(id)a3;
- (void)finishBroadcastWithError:(id)a3;
- (void)invalidateConnection;
- (void)ping;
- (void)processPayload:(id)a3 completion:(id)a4;
- (void)setBroadcastURLHandler:(id)a3;
- (void)setBroadcastUploadExtension:(id)a3;
- (void)setConnection:(id)a3;
- (void)setConnectionReadyHandler:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setListener:(id)a3;
- (void)setListenerEndpoint:(id)a3;
- (void)setServiceInfoHandler:(id)a3;
- (void)setupNewConnection:(id)a3;
- (void)updateBroadcastURL:(id)a3;
- (void)updateServiceInfo:(id)a3;
@end

@implementation RPBroadcastExtensionProxy

- (RPBroadcastExtensionProxy)initWithBroadcastUploadExtension:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RPBroadcastExtensionProxy;
  v5 = [(RPBroadcastExtensionProxy *)&v9 init];
  if (v5)
  {
    if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v11 = "-[RPBroadcastExtensionProxy initWithBroadcastUploadExtension:]";
      __int16 v12 = 1024;
      int v13 = 41;
      __int16 v14 = 2048;
      v15 = v5;
      _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
    }
    v6 = [MEMORY[0x263F08D88] anonymousListener];
    [(RPBroadcastExtensionProxy *)v5 setListener:v6];

    [(NSXPCListener *)v5->_listener resume];
    [(NSXPCListener *)v5->_listener setDelegate:v5];
    v7 = [(NSXPCListener *)v5->_listener endpoint];
    [(RPBroadcastExtensionProxy *)v5 setListenerEndpoint:v7];

    [(RPBroadcastExtensionProxy *)v5 setBroadcastUploadExtension:v4];
  }

  return v5;
}

- (RPBroadcastExtensionProxy)initWithBroadcastUploadListenerEndpoint:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RPBroadcastExtensionProxy;
  v5 = [(RPBroadcastExtensionProxy *)&v8 init];
  if (v5)
  {
    if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v10 = "-[RPBroadcastExtensionProxy initWithBroadcastUploadListenerEndpoint:]";
      __int16 v11 = 1024;
      int v12 = 53;
      __int16 v13 = 2048;
      __int16 v14 = v5;
      _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
    }
    if (!v5->_connection)
    {
      v6 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithListenerEndpoint:v4];
      [(RPBroadcastExtensionProxy *)v5 setupNewConnection:v6];
    }
  }

  return v5;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v5 = "-[RPBroadcastExtensionProxy dealloc]";
    __int16 v6 = 1024;
    int v7 = 63;
    __int16 v8 = 2048;
    objc_super v9 = self;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  v3.receiver = self;
  v3.super_class = (Class)RPBroadcastExtensionProxy;
  [(RPBroadcastExtensionProxy *)&v3 dealloc];
}

- (void)establishConnectionWithHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v13 = "-[RPBroadcastExtensionProxy establishConnectionWithHandler:]";
    __int16 v14 = 1024;
    int v15 = 67;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d establishing connection to extension", buf, 0x12u);
  }
  [(RPBroadcastExtensionProxy *)self setConnectionReadyHandler:v4];
  id v5 = objc_alloc_init(MEMORY[0x263F08810]);
  broadcastUploadExtension = self->_broadcastUploadExtension;
  id v11 = v5;
  int v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:1];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__RPBroadcastExtensionProxy_establishConnectionWithHandler___block_invoke;
  v9[3] = &unk_26451DC10;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(NSExtension *)broadcastUploadExtension beginExtensionRequestWithInputItems:v7 completion:v9];
}

void __60__RPBroadcastExtensionProxy_establishConnectionWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __60__RPBroadcastExtensionProxy_establishConnectionWithHandler___block_invoke_cold_2(v6);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v16 = "-[RPBroadcastExtensionProxy establishConnectionWithHandler:]_block_invoke";
      __int16 v17 = 1024;
      int v18 = 78;
      _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d beginExtensionRequestWithInputItems returned", buf, 0x12u);
    }
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    id v8 = [*(id *)(*(void *)(a1 + 32) + 48) _extensionContextForUUID:v5];
    objc_super v9 = [v8 _auxiliaryConnection];
    id v10 = [v9 remoteObjectProxy];

    if (v10)
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 72);
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __60__RPBroadcastExtensionProxy_establishConnectionWithHandler___block_invoke_6;
      v13[3] = &unk_26451D7F0;
      int v12 = v7;
      __int16 v14 = v12;
      [v10 setEndpoint:v11 completionHandler:v13];
      dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __60__RPBroadcastExtensionProxy_establishConnectionWithHandler___block_invoke_cold_1();
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

intptr_t __60__RPBroadcastExtensionProxy_establishConnectionWithHandler___block_invoke_6(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    id v4 = "-[RPBroadcastExtensionProxy establishConnectionWithHandler:]_block_invoke";
    __int16 v5 = 1024;
    int v6 = 87;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Remote endpoint set.", (uint8_t *)&v3, 0x12u);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)invalidateConnection
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    int v8 = 136446978;
    objc_super v9 = "-[RPBroadcastExtensionProxy invalidateConnection]";
    __int16 v10 = 1024;
    int v11 = 100;
    __int16 v12 = 2048;
    __int16 v13 = self;
    __int16 v14 = 2048;
    int v15 = connection;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p invalidating connection=%p with extension", (uint8_t *)&v8, 0x26u);
  }
  [(RPBroadcastExtensionProxy *)self setConnectionReadyHandler:0];
  [(NSXPCConnection *)self->_connection setInvalidationHandler:0];
  [(NSXPCConnection *)self->_connection setInterruptionHandler:0];
  [(NSXPCConnection *)self->_connection invalidate];
  [(NSXPCListener *)self->_listener invalidate];
  [(RPBroadcastExtensionProxy *)self setConnection:0];
  [(RPBroadcastExtensionProxy *)self setListener:0];
  id serviceInfoHandler = self->_serviceInfoHandler;
  self->_id serviceInfoHandler = 0;

  id broadcastURLHandler = self->_broadcastURLHandler;
  self->_id broadcastURLHandler = 0;

  id errorHandler = self->_errorHandler;
  self->_id errorHandler = 0;

  uint64_t v7 = [(RPBroadcastExtensionProxy *)self broadcastUploadExtension];
  [v7 _kill:9];

  [(RPBroadcastExtensionProxy *)self setBroadcastUploadExtension:0];
}

- (void)setupNewConnection:(id)a3
{
  id v4 = a3;
  [(RPBroadcastExtensionProxy *)self setConnection:v4];
  [(NSXPCConnection *)self->_connection setExportedObject:self];
  __int16 v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D139048];
  [(NSXPCConnection *)self->_connection setExportedInterface:v5];

  int v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D138FE0];
  [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v6];

  objc_initWeak(&location, self);
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  objc_super v9 = __48__RPBroadcastExtensionProxy_setupNewConnection___block_invoke;
  __int16 v10 = &unk_26451DC38;
  objc_copyWeak(&v11, &location);
  [(NSXPCConnection *)self->_connection setInvalidationHandler:&v7];
  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", &__block_literal_global_7, v7, v8, v9, v10);
  [(NSXPCConnection *)self->_connection resume];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __48__RPBroadcastExtensionProxy_setupNewConnection___block_invoke(uint64_t a1)
{
  if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __48__RPBroadcastExtensionProxy_setupNewConnection___block_invoke_cold_1();
  }
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [WeakRetained errorHandler];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v2);
    int v6 = [v5 errorHandler];
    uint64_t v7 = [MEMORY[0x263F087E8] _rpUserErrorForCode:-5808 userInfo:MEMORY[0x263EFFA78]];
    ((void (**)(void, void *))v6)[2](v6, v7);
  }
}

void __48__RPBroadcastExtensionProxy_setupNewConnection___block_invoke_64()
{
  if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __48__RPBroadcastExtensionProxy_setupNewConnection___block_invoke_64_cold_1();
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  return 1;
}

- (void)updateServiceInfo:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    uint64_t v7 = "-[RPBroadcastExtensionProxy updateServiceInfo:]";
    __int16 v8 = 1024;
    int v9 = 145;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d received serviceInfo", (uint8_t *)&v6, 0x12u);
  }
  id serviceInfoHandler = (void (**)(id, id))self->_serviceInfoHandler;
  if (serviceInfoHandler) {
    serviceInfoHandler[2](serviceInfoHandler, v4);
  }
}

- (void)updateBroadcastURL:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    uint64_t v7 = "-[RPBroadcastExtensionProxy updateBroadcastURL:]";
    __int16 v8 = 1024;
    int v9 = 152;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d received broadcastURL", (uint8_t *)&v6, 0x12u);
  }
  id broadcastURLHandler = (void (**)(id, id))self->_broadcastURLHandler;
  if (broadcastURLHandler) {
    broadcastURLHandler[2](broadcastURLHandler, v4);
  }
}

- (void)ping
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    uint64_t v7 = "-[RPBroadcastExtensionProxy ping]";
    __int16 v8 = 1024;
    int v9 = 159;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d received ping from extension, notifying handler that connection is ready", (uint8_t *)&v6, 0x12u);
  }
  connectionReadyHandler = (void (**)(id, void))self->_connectionReadyHandler;
  if (connectionReadyHandler) {
    connectionReadyHandler[2](connectionReadyHandler, 0);
  }
  id v4 = [MEMORY[0x263F08D68] currentConnection];
  self->_BOOL enableMixedRealityCamera = 0;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    BOOL enableMixedRealityCamera = self->_enableMixedRealityCamera;
    int v6 = 136447234;
    uint64_t v7 = "-[RPBroadcastExtensionProxy ping]";
    __int16 v8 = 1024;
    int v9 = 169;
    __int16 v10 = 2048;
    id v11 = self;
    __int16 v12 = 2048;
    __int16 v13 = v4;
    __int16 v14 = 1024;
    BOOL v15 = enableMixedRealityCamera;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p connection=%p enableMixedRealityCamera=%d", (uint8_t *)&v6, 0x2Cu);
  }
}

- (void)finishBroadcastWithError:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    uint64_t v7 = "-[RPBroadcastExtensionProxy finishBroadcastWithError:]";
    __int16 v8 = 1024;
    int v9 = 173;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d received finish request from service due to error %@", (uint8_t *)&v6, 0x1Cu);
  }
  id errorHandler = (void (**)(id, id))self->_errorHandler;
  if (errorHandler) {
    errorHandler[2](errorHandler, v4);
  }
}

- (void)processPayload:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  connection = self->_connection;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  __int16 v13 = __55__RPBroadcastExtensionProxy_processPayload_completion___block_invoke;
  __int16 v14 = &unk_26451DC60;
  objc_copyWeak(&v15, &location);
  int v9 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:&v11];
  __int16 v10 = v9;
  if (v9) {
    objc_msgSend(v9, "processPayload:completion:", v6, v7, v11, v12, v13, v14);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __55__RPBroadcastExtensionProxy_processPayload_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __55__RPBroadcastExtensionProxy_processPayload_completion___block_invoke_cold_1(v3);
  }
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v4);
  id v6 = [WeakRetained errorHandler];

  if (v6)
  {
    id v7 = objc_loadWeakRetained(v4);
    __int16 v8 = [v7 errorHandler];
    int v9 = [MEMORY[0x263F087E8] _rpUserErrorForCode:-5808 userInfo:MEMORY[0x263EFFA78]];
    ((void (**)(void, void *))v8)[2](v8, v9);
  }
}

- (id)serviceInfoHandler
{
  return self->_serviceInfoHandler;
}

- (void)setServiceInfoHandler:(id)a3
{
}

- (id)broadcastURLHandler
{
  return self->_broadcastURLHandler;
}

- (void)setBroadcastURLHandler:(id)a3
{
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
}

- (BOOL)enableMixedRealityCamera
{
  return self->_enableMixedRealityCamera;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSExtension)broadcastUploadExtension
{
  return self->_broadcastUploadExtension;
}

- (void)setBroadcastUploadExtension:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (id)connectionReadyHandler
{
  return self->_connectionReadyHandler;
}

- (void)setConnectionReadyHandler:(id)a3
{
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return self->_listenerEndpoint;
}

- (void)setListenerEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
  objc_storeStrong(&self->_connectionReadyHandler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_broadcastUploadExtension, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong(&self->_broadcastURLHandler, 0);

  objc_storeStrong(&self->_serviceInfoHandler, 0);
}

void __60__RPBroadcastExtensionProxy_establishConnectionWithHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d Error setting listenerEndpoint", v1, v2, v3, v4, 2u);
}

void __60__RPBroadcastExtensionProxy_establishConnectionWithHandler___block_invoke_cold_2(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  [a1 code];
  *(_DWORD *)uint64_t v3 = 136446722;
  OUTLINED_FUNCTION_0_0();
  *(_DWORD *)&v3[7] = 75;
  v3[9] = v1;
  int v4 = v2;
  _os_log_error_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d Error beginning extension request: %i", (uint8_t *)v3, 0x18u);
}

void __48__RPBroadcastExtensionProxy_setupNewConnection___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d connection to broadcast extension invalidated", v1, v2, v3, v4, 2u);
}

void __48__RPBroadcastExtensionProxy_setupNewConnection___block_invoke_64_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d connection to broadcast extension interrupted", v1, v2, v3, v4, 2u);
}

void __55__RPBroadcastExtensionProxy_processPayload_completion___block_invoke_cold_1(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  [a1 code];
  *(_DWORD *)uint64_t v3 = 136446722;
  OUTLINED_FUNCTION_0_0();
  *(_DWORD *)&v3[7] = 183;
  v3[9] = v1;
  int v4 = v2;
  _os_log_error_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d error getting remote proxy to extension: %i", (uint8_t *)v3, 0x18u);
}

@end