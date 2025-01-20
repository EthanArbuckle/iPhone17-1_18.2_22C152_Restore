@interface LNProcessInstanceRegistryClient
+ (LNProcessInstanceRegistryClient)sharedInstance;
- (LNProcessInstanceRegistryClient)init;
- (NSXPCConnection)xpcConnection;
- (id)registerWithError:(id *)a3;
@end

@implementation LNProcessInstanceRegistryClient

- (void).cxx_destruct
{
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (id)registerWithError:(id *)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  [(NSXPCConnection *)self->_xpcConnection activate];
  v5 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *MEMORY[0x263F51D88];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_23624D000, v5, OS_LOG_TYPE_INFO, "Activated connection to %@ (ApplicationService)", (uint8_t *)&buf, 0xCu);
  }

  v7 = +[LNAppConnectionListener sharedListener];
  v8 = [v7 listenerEndpoint];

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  v9 = [(LNProcessInstanceRegistryClient *)self xpcConnection];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __53__LNProcessInstanceRegistryClient_registerWithError___block_invoke;
  v14[3] = &unk_264CA8F60;
  v14[4] = &buf;
  v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __53__LNProcessInstanceRegistryClient_registerWithError___block_invoke_16;
  v13[3] = &unk_264CA8F88;
  v13[4] = &buf;
  v13[5] = &v15;
  [v10 registerListenerEndpointWithXPCListenerEndpoint:v8 reply:v13];

  *a3 = *(id *)(*((void *)&buf + 1) + 40);
  id v11 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&buf, 8);

  return v11;
}

void __53__LNProcessInstanceRegistryClient_registerWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543362;
    id v8 = v3;
    _os_log_impl(&dword_23624D000, v4, OS_LOG_TYPE_ERROR, "Unable to get synchronousRemoteObjectProxy, error: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __53__LNProcessInstanceRegistryClient_registerWithError___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (LNProcessInstanceRegistryClient)init
{
  v9.receiver = self;
  v9.super_class = (Class)LNProcessInstanceRegistryClient;
  v2 = [(LNProcessInstanceRegistryClient *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F08D68]);
    uint64_t v4 = [v3 initWithMachServiceName:*MEMORY[0x263F51D88] options:0];
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v4;

    uint64_t v6 = LNDaemonApplicationXPCInterface();
    [(NSXPCConnection *)v2->_xpcConnection setRemoteObjectInterface:v6];

    [(NSXPCConnection *)v2->_xpcConnection setInterruptionHandler:&__block_literal_global_10];
    [(NSXPCConnection *)v2->_xpcConnection setInvalidationHandler:&__block_literal_global_13];
    int v7 = v2;
  }

  return v2;
}

void __39__LNProcessInstanceRegistryClient_init__block_invoke_11()
{
  v0 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_23624D000, v0, OS_LOG_TYPE_INFO, "Process Instance Registry XPC connection has been invalidated", v1, 2u);
  }
}

void __39__LNProcessInstanceRegistryClient_init__block_invoke()
{
  v0 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_23624D000, v0, OS_LOG_TYPE_INFO, "Process Instance Registry XPC connection has been interrupted", v1, 2u);
  }
}

+ (LNProcessInstanceRegistryClient)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_68);
  }
  v2 = (void *)sharedInstance_value;

  return (LNProcessInstanceRegistryClient *)v2;
}

uint64_t __49__LNProcessInstanceRegistryClient_sharedInstance__block_invoke()
{
  sharedInstance_value = objc_alloc_init(LNProcessInstanceRegistryClient);

  return MEMORY[0x270F9A758]();
}

@end