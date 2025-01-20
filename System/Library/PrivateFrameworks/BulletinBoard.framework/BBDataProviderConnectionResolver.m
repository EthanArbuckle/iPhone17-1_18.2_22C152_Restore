@interface BBDataProviderConnectionResolver
+ (id)resolverForConnection:(id)a3;
+ (id)xpcInterface;
- (BBDataProviderConnection)dataProviderConnection;
- (BBDataProviderConnectionResolver)initWithConnection:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)_invalidate;
- (void)_queue_registerWithServer:(id)a3;
- (void)_registerForPublicationNotification;
- (void)dealloc;
- (void)invalidate;
- (void)ping:(id)a3;
- (void)setDataProviderConnection:(id)a3;
@end

@implementation BBDataProviderConnectionResolver

- (BBDataProviderConnectionResolver)initWithConnection:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"BBDataProviderConnectionResolver.m", 33, @"Invalid parameter not satisfying: %@", @"connection != nil" object file lineNumber description];
  }
  v20.receiver = self;
  v20.super_class = (Class)BBDataProviderConnectionResolver;
  v6 = [(BBDataProviderConnectionResolver *)&v20 init];
  v7 = v6;
  if (v6)
  {
    [(BBDataProviderConnectionResolver *)v6 setDataProviderConnection:v5];
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.bulletinboard.BBDataProviderConnectionResolver", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    id v11 = objc_alloc(MEMORY[0x263F08D88]);
    v12 = [v5 serviceName];
    uint64_t v13 = [v11 initWithMachServiceName:v12];
    wakeupListener = v7->_wakeupListener;
    v7->_wakeupListener = (NSXPCListener *)v13;

    [(NSXPCListener *)v7->_wakeupListener setDelegate:v7];
    [(NSXPCListener *)v7->_wakeupListener resume];
    v15 = v7->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__BBDataProviderConnectionResolver_initWithConnection___block_invoke;
    block[3] = &unk_264295E28;
    v19 = v7;
    dispatch_async(v15, block);
  }
  return v7;
}

void __55__BBDataProviderConnectionResolver_initWithConnection___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __55__BBDataProviderConnectionResolver_initWithConnection___block_invoke_2;
  v2[3] = &unk_264295E28;
  id v3 = v1;
  objc_msgSend(v3, "_queue_registerWithServer:", v2);
}

uint64_t __55__BBDataProviderConnectionResolver_initWithConnection___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerForPublicationNotification];
}

+ (id)resolverForConnection:(id)a3
{
  id v3 = a3;
  v4 = [[BBDataProviderConnectionResolver alloc] initWithConnection:v3];

  return v4;
}

- (void)dealloc
{
  [(BBDataProviderConnectionResolver *)self _invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BBDataProviderConnectionResolver;
  [(BBDataProviderConnectionResolver *)&v3 dealloc];
}

- (void)_invalidate
{
  notify_cancel(self->_listeningToken);
  self->_listeningToken = -1;
  [(NSXPCListener *)self->_wakeupListener invalidate];
  wakeupListener = self->_wakeupListener;
  self->_wakeupListener = 0;

  [(NSXPCConnection *)self->_connectionToServer invalidate];
  connectionToServer = self->_connectionToServer;
  self->_connectionToServer = 0;

  [(BBDataProviderConnectionResolver *)self setDataProviderConnection:0];
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__BBDataProviderConnectionResolver_invalidate__block_invoke;
  block[3] = &unk_264295E28;
  void block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __46__BBDataProviderConnectionResolver_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_registerForPublicationNotification
{
  queue = self->_queue;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __71__BBDataProviderConnectionResolver__registerForPublicationNotification__block_invoke;
  handler[3] = &unk_264296A70;
  handler[4] = self;
  notify_register_dispatch(BBServerListeningForConnectionsKey, &self->_listeningToken, queue, handler);
}

uint64_t __71__BBDataProviderConnectionResolver__registerForPublicationNotification__block_invoke(uint64_t result, int token)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (*(_DWORD *)(*(void *)(result + 32) + 32) == token)
  {
    uint64_t v2 = result;
    uint64_t state64 = 0;
    result = notify_get_state(token, &state64);
    if (state64 == 1)
    {
      objc_super v3 = (void *)BBLogConnection;
      if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(void **)(v2 + 32);
        id v5 = v3;
        v6 = [v4 dataProviderConnection];
        v7 = [v6 serviceName];
        *(_DWORD *)buf = 138543362;
        v10 = v7;
        _os_log_impl(&dword_217675000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ notified that BBServer is ready for publication.", buf, 0xCu);
      }
      return objc_msgSend(*(id *)(v2 + 32), "_queue_registerWithServer:", 0);
    }
  }
  return result;
}

- (void)_queue_registerWithServer:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (self->_connectionToServer)
  {
    v6 = [(BBDataProviderConnectionResolver *)self dataProviderConnection];
    [v6 setServerProxy:0];

    [(NSXPCConnection *)self->_connectionToServer invalidate];
    connectionToServer = self->_connectionToServer;
    self->_connectionToServer = 0;
  }
  v8 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.bulletinboard.dataproviderconnection" options:0];
  dispatch_queue_t v9 = self->_connectionToServer;
  self->_connectionToServer = v8;

  v10 = self->_connectionToServer;
  uint64_t v11 = BBDataProviderConnectionCheckinServerInterface();
  [(NSXPCConnection *)v10 setRemoteObjectInterface:v11];

  objc_initWeak(&location, self);
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __62__BBDataProviderConnectionResolver__queue_registerWithServer___block_invoke;
  v29[3] = &unk_264295FE0;
  objc_copyWeak(&v30, &location);
  v12 = (void *)MEMORY[0x21D44A270](v29);
  [(NSXPCConnection *)self->_connectionToServer setInterruptionHandler:v12];
  [(NSXPCConnection *)self->_connectionToServer setInvalidationHandler:v12];
  [(NSXPCConnection *)self->_connectionToServer resume];
  uint64_t v13 = self->_connectionToServer;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __62__BBDataProviderConnectionResolver__queue_registerWithServer___block_invoke_18;
  v27[3] = &unk_264297108;
  v27[4] = self;
  id v14 = v5;
  id v28 = v14;
  v15 = [(NSXPCConnection *)v13 remoteObjectProxyWithErrorHandler:v27];
  if (v15)
  {
    v16 = [(BBDataProviderConnectionResolver *)self dataProviderConnection];
    v17 = [v16 serviceName];
    if (!v16)
    {
      v21 = [MEMORY[0x263F08690] currentHandler];
      [v21 handleFailureInMethod:a2 object:self file:@"BBDataProviderConnectionResolver.m" lineNumber:131 description:@"dataProviderConnection is nil"];
    }
    if (!v17)
    {
      v22 = [MEMORY[0x263F08690] currentHandler];
      [v22 handleFailureInMethod:a2 object:self file:@"BBDataProviderConnectionResolver.m" lineNumber:132 description:@"Must register a non-nil service name with BBDataProviderConnectionCheckinServer"];
    }
    v18 = BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v17;
      _os_log_impl(&dword_217675000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ is registering with BulletinBoard", (uint8_t *)&buf, 0xCu);
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__10;
    v35 = __Block_byref_object_dispose__10;
    v36 = self->_connectionToServer;
    v19 = [v16 bundleID];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __62__BBDataProviderConnectionResolver__queue_registerWithServer___block_invoke_26;
    v23[3] = &unk_264297130;
    p_long long buf = &buf;
    v23[4] = self;
    id v20 = v16;
    id v24 = v20;
    id v25 = v14;
    [v15 registerServiceName:v17 appBundleID:v19 completion:v23];

    _Block_object_dispose(&buf, 8);
  }

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

void __62__BBDataProviderConnectionResolver__queue_registerWithServer___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained dataProviderConnection];
  uint64_t v3 = [v2 serviceName];
  v4 = (void *)v3;
  id v5 = @"<unknown>";
  if (v3) {
    id v5 = (__CFString *)v3;
  }
  v6 = v5;

  v7 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __62__BBDataProviderConnectionResolver__queue_registerWithServer___block_invoke_cold_1((uint64_t)v6, v7);
  }
}

void __62__BBDataProviderConnectionResolver__queue_registerWithServer___block_invoke_18(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __62__BBDataProviderConnectionResolver__queue_registerWithServer___block_invoke_18_cold_1(a1, v4, (uint64_t)v3);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

uint64_t __62__BBDataProviderConnectionResolver__queue_registerWithServer___block_invoke_26(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) == *(void *)(*(void *)(a1 + 32) + 24))
  {
    [*(id *)(a1 + 40) setServerProxy:v3];
    id v3 = v6;
  }
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  return MEMORY[0x270F9A758]();
}

+ (id)xpcInterface
{
  if (xpcInterface_onceToken_0 != -1) {
    dispatch_once(&xpcInterface_onceToken_0, &__block_literal_global_17);
  }
  uint64_t v2 = (void *)xpcInterface___interface_0;
  return v2;
}

uint64_t __48__BBDataProviderConnectionResolver_xpcInterface__block_invoke()
{
  xpcInterface___interface_0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C7BABC8];
  return MEMORY[0x270F9A758]();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = (NSXPCListener *)a3;
  v8 = [(BBDataProviderConnectionResolver *)self dataProviderConnection];
  dispatch_queue_t v9 = [v8 serviceName];

  v10 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138543618;
    v19 = v9;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_217675000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ received a connection request: %@", (uint8_t *)&v18, 0x16u);
  }
  wakeupListener = self->_wakeupListener;

  if (wakeupListener != v7) {
    goto LABEL_8;
  }
  v12 = [v6 valueForEntitlement:@"com.apple.bulletinboard"];
  int v13 = [v12 BOOLValue];

  if (!v13)
  {
    v16 = BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
      -[BBDataProviderConnectionResolver listener:shouldAcceptNewConnection:]((uint64_t)v9, v16);
    }
LABEL_8:
    BOOL v15 = 0;
    goto LABEL_9;
  }
  id v14 = [(id)objc_opt_class() xpcInterface];
  [v6 setExportedInterface:v14];

  [v6 setExportedObject:self];
  [v6 resume];
  BOOL v15 = 1;
LABEL_9:

  return v15;
}

- (void)ping:(id)a3
{
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  id v3 = [MEMORY[0x263F08D68] currentConnection];
  [v3 invalidate];
}

- (BBDataProviderConnection)dataProviderConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataProviderConnection);
  return (BBDataProviderConnection *)WeakRetained;
}

- (void)setDataProviderConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataProviderConnection);
  objc_storeStrong((id *)&self->_connectionToServer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_wakeupListener, 0);
}

void __62__BBDataProviderConnectionResolver__queue_registerWithServer___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_217675000, a2, OS_LOG_TYPE_ERROR, "Your data provider for service '%{public}@' has been interrupted or invalidated. Either BulletinBoard has crashed or you are using the same service name from two different processes.", (uint8_t *)&v2, 0xCu);
}

void __62__BBDataProviderConnectionResolver__queue_registerWithServer___block_invoke_18_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = a2;
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  int v7 = 138543618;
  v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a3;
  _os_log_error_impl(&dword_217675000, v4, OS_LOG_TYPE_ERROR, "%{public}@ unable to retrieve checkin server proxy: %{public}@", (uint8_t *)&v7, 0x16u);
}

- (void)listener:(uint64_t)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_217675000, a2, OS_LOG_TYPE_ERROR, "%{public}@ cancelling incoming connection because it lacks proper entitlement.", (uint8_t *)&v2, 0xCu);
}

@end