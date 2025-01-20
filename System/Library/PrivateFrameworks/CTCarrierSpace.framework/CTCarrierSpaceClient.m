@interface CTCarrierSpaceClient
- (CTCarrierSpaceClient)init;
- (CTCarrierSpaceClient)initWithQueue:(dispatch_queue_s *)a3;
- (CTCarrierSpaceClient)initWithQueue:(dispatch_queue_s *)a3 andListenerEndpoint:(id)a4;
- (CTCarrierSpaceClientDelegate)delegate;
- (id).cxx_construct;
- (id)_proxyWithErrorHandler:(id)a3;
- (void)_connect_sync;
- (void)_ensureConnected_sync;
- (void)authenticationDidComplete:(id)a3 completion:(id)a4;
- (void)authenticationDidFail:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)fetchAppsInfo:(BOOL)a3 completion:(id)a4;
- (void)fetchAppsInfo:(id)a3;
- (void)fetchDataPlanMetrics:(id)a3;
- (void)fetchPlansInfo:(BOOL)a3 completion:(id)a4;
- (void)fetchPlansInfo:(id)a3;
- (void)fetchUsageInfo:(BOOL)a3 completion:(id)a4;
- (void)fetchUsageInfo:(id)a3;
- (void)getAuthenticationContext:(id)a3;
- (void)getCapabilities:(id)a3;
- (void)getUserConsentFlowInfo:(id)a3;
- (void)invalidate;
- (void)ping:(id)a3;
- (void)purchasePlan:(id)a3 authInfo:(id)a4 completion:(id)a5;
- (void)purchasePlan:(id)a3 completion:(id)a4;
- (void)refreshAllInfo:(id)a3;
- (void)refreshAppsInfo:(id)a3;
- (void)refreshPlansInfo:(id)a3;
- (void)refreshUsageInfo:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setUserConsent:(BOOL)a3 completion:(id)a4;
- (void)setUserInAuthFlow:(BOOL)a3 completion:(id)a4;
- (void)userDidAcceptPlanTerms:(BOOL)a3 completion:(id)a4;
@end

@implementation CTCarrierSpaceClient

- (void)_connect_sync
{
  endpoint = self->_endpoint;
  id v4 = objc_alloc(MEMORY[0x263F08D68]);
  if (endpoint) {
    v5 = (NSXPCConnection *)[v4 initWithListenerEndpoint:self->_endpoint];
  }
  else {
    v5 = (NSXPCConnection *)[v4 initWithMachServiceName:@"com.apple.commcenter.carrierspace.xpc" options:4096];
  }
  connection = self->_connection;
  self->_connection = v5;

  v7 = objc_alloc_init(CTCarrierSpaceClientDelegateProxy);
  delegateProxy = self->_delegateProxy;
  self->_delegateProxy = v7;

  v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C50F240];
  [(NSXPCConnection *)self->_connection setExportedInterface:v9];

  [(NSXPCConnection *)self->_connection setExportedObject:self->_delegateProxy];
  -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C510200]);
  id location = 0;
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __37__CTCarrierSpaceClient__connect_sync__block_invoke;
  v16[3] = &unk_2642009D8;
  objc_copyWeak(&v17, &location);
  [(NSXPCConnection *)self->_connection setInvalidationHandler:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __37__CTCarrierSpaceClient__connect_sync__block_invoke_59;
  v14[3] = &unk_2642009D8;
  objc_copyWeak(&v15, &location);
  [(NSXPCConnection *)self->_connection setInterruptionHandler:v14];
  v10 = self->_connection;
  if (self->_callbackQueue.fObj.fObj)
  {
    -[NSXPCConnection _setQueue:](v10, "_setQueue:");
  }
  else
  {
    v11 = [(NSXPCConnection *)v10 _queue];
    v12 = (dispatch_object_s *)v11;
    if (v11) {
      dispatch_retain(v11);
    }
    fObj = self->_callbackQueue.fObj.fObj;
    self->_callbackQueue.fObj.fObj = v12;
    if (fObj) {
      dispatch_release(fObj);
    }
  }
  [(NSXPCConnection *)self->_connection resume];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __37__CTCarrierSpaceClient__connect_sync__block_invoke(uint64_t a1)
{
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37__CTCarrierSpaceClient__connect_sync__block_invoke_2;
    block[3] = &unk_2642009B0;
    id v4 = WeakRetained;
    dispatch_async(v2[2], block);
  }
}

void __37__CTCarrierSpaceClient__connect_sync__block_invoke_2(uint64_t a1)
{
  v2 = _CTCarrierSpaceLogDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2142C8000, v2, OS_LOG_TYPE_DEFAULT, "Connection has been invalidated", v5, 2u);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = 0;
}

void __37__CTCarrierSpaceClient__connect_sync__block_invoke_59(uint64_t a1)
{
  v2 = _CTCarrierSpaceLogDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2142C8000, v2, OS_LOG_TYPE_DEFAULT, "Connection interrupted. Attempting to reestablish connection", v4, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained ping:&__block_literal_global];
}

void __37__CTCarrierSpaceClient__connect_sync__block_invoke_60(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = _CTCarrierSpaceLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __37__CTCarrierSpaceClient__connect_sync__block_invoke_60_cold_1((uint64_t)v2, v3);
    }
  }
  else
  {
    id v4 = _CTCarrierSpaceLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2142C8000, v4, OS_LOG_TYPE_DEFAULT, "Successfully reestablished connection", v5, 2u);
    }
  }
}

- (void)_ensureConnected_sync
{
  if (!self->_connection) {
    [(CTCarrierSpaceClient *)self _connect_sync];
  }
}

- (id)_proxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__CTCarrierSpaceClient__proxyWithErrorHandler___block_invoke;
  v9[3] = &unk_264200A48;
  v9[4] = self;
  id v10 = v4;
  id v5 = v4;
  id v11 = (id)MEMORY[0x21669D220](v9);
  fObj = self->_queue.fObj.fObj;
  v13 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___ZN8dispatch9sync_implIU8__strongU13block_pointerFP11objc_objectvEEENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS6_17integral_constantIbLb0EEE_block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  void block[4] = &v13;
  block[5] = &v11;
  dispatch_sync(fObj, block);
  v7 = v13;

  return v7;
}

id __47__CTCarrierSpaceClient__proxyWithErrorHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__CTCarrierSpaceClient__proxyWithErrorHandler___block_invoke_2;
  v5[3] = &unk_264200A20;
  id v6 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v5];

  return v3;
}

void __47__CTCarrierSpaceClient__proxyWithErrorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CTCarrierSpaceLogDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __47__CTCarrierSpaceClient__proxyWithErrorHandler___block_invoke_2_cold_1((uint64_t)v3, v4);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  [(CTCarrierSpaceClient *)self _ensureConnected_sync];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__CTCarrierSpaceClient_setDelegate___block_invoke;
  v7[3] = &unk_264200A70;
  v7[4] = self;
  id v8 = v4;
  fObj = self->_callbackQueue.fObj.fObj;
  id v6 = v4;
  dispatch_async(fObj, v7);
}

void __36__CTCarrierSpaceClient_setDelegate___block_invoke(uint64_t a1)
{
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 40));
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "setDelegate:");
}

- (CTCarrierSpaceClient)initWithQueue:(dispatch_queue_s *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CTCarrierSpaceClient;
  id v4 = [(CTCarrierSpaceClient *)&v13 init];
  if (v4)
  {
    uint64_t v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.CTCarrierSpaceClient", v5);
    v7 = *((void *)v4 + 2);
    *((void *)v4 + 2) = v6;
    if (v7) {
      dispatch_release(v7);
    }
    if (a3) {
      dispatch_retain((dispatch_object_t)a3);
    }
    id v8 = *((void *)v4 + 3);
    *((void *)v4 + 3) = a3;
    if (v8)
    {
      dispatch_release(v8);
      a3 = (dispatch_queue_s *)*((void *)v4 + 3);
    }
    if (!a3)
    {
      global_queue = dispatch_get_global_queue(0, 0);
      id v11 = global_queue;
      if (global_queue)
      {
        dispatch_retain(global_queue);
        v12 = *((void *)v4 + 3);
        *((void *)v4 + 3) = v11;
        if (v12) {
          dispatch_release(v12);
        }
      }
      else
      {
        *((void *)v4 + 3) = 0;
      }
    }
    objc_msgSend(v4, "_ensureConnected_sync");
  }
  return (CTCarrierSpaceClient *)v4;
}

- (CTCarrierSpaceClient)init
{
  return [(CTCarrierSpaceClient *)self initWithQueue:0];
}

- (void)dealloc
{
  connection = self->_connection;
  if (connection) {
    [(NSXPCConnection *)connection invalidate];
  }
  v4.receiver = self;
  v4.super_class = (Class)CTCarrierSpaceClient;
  [(CTCarrierSpaceClient *)&v4 dealloc];
}

- (CTCarrierSpaceClient)initWithQueue:(dispatch_queue_s *)a3 andListenerEndpoint:(id)a4
{
  objc_storeStrong((id *)&self->_endpoint, a4);
  return [(CTCarrierSpaceClient *)self initWithQueue:a3];
}

- (void)ping:(id)a3
{
  id v5 = a3;
  objc_super v4 = -[CTCarrierSpaceClient _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:");
  [v4 ping:v5];
}

- (void)invalidate
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__CTCarrierSpaceClient_invalidate__block_invoke;
  block[3] = &unk_2642009B0;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)self->_queue.fObj.fObj, block);
}

uint64_t __34__CTCarrierSpaceClient_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) invalidate];
}

- (void)refreshUsageInfo:(id)a3
{
  id v5 = a3;
  objc_super v4 = -[CTCarrierSpaceClient _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:");
  [v4 refreshUsageInfo:v5];
}

- (void)refreshPlansInfo:(id)a3
{
  id v5 = a3;
  objc_super v4 = -[CTCarrierSpaceClient _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:");
  [v4 refreshPlansInfo:v5];
}

- (void)refreshAppsInfo:(id)a3
{
  id v5 = a3;
  objc_super v4 = -[CTCarrierSpaceClient _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:");
  [v4 refreshAppsInfo:v5];
}

- (void)setUserInAuthFlow:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  dispatch_queue_t v6 = -[CTCarrierSpaceClient _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:");
  [v6 setUserInAuthFlow:v4 completion:v7];
}

- (void)authenticationDidComplete:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(CTCarrierSpaceClient *)self _proxyWithErrorHandler:v6];
  [v7 authenticationDidComplete:v8 completion:v6];
}

- (void)authenticationDidFail:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(CTCarrierSpaceClient *)self _proxyWithErrorHandler:v6];
  [v7 authenticationDidFail:v8 completion:v6];
}

- (void)userDidAcceptPlanTerms:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  id v6 = -[CTCarrierSpaceClient _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:");
  [v6 userDidAcceptPlanTerms:v4 completion:v7];
}

- (void)getAuthenticationContext:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__CTCarrierSpaceClient_getAuthenticationContext___block_invoke;
  v7[3] = &unk_264200A20;
  id v5 = v4;
  id v8 = v5;
  id v6 = [(CTCarrierSpaceClient *)self _proxyWithErrorHandler:v7];
  [v6 getAuthenticationContext:v5];
}

uint64_t __49__CTCarrierSpaceClient_getAuthenticationContext___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getCapabilities:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __40__CTCarrierSpaceClient_getCapabilities___block_invoke;
  v9[3] = &unk_264200A20;
  id v5 = v4;
  id v10 = v5;
  id v6 = [(CTCarrierSpaceClient *)self _proxyWithErrorHandler:v9];
  id v7 = _CTCarrierSpaceLogDomain();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_2142C8000, v7, OS_LOG_TYPE_INFO, "Client requesting to get capabiities", v8, 2u);
  }
  [v6 getCapabilities:v5];
}

uint64_t __40__CTCarrierSpaceClient_getCapabilities___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getUserConsentFlowInfo:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__CTCarrierSpaceClient_getUserConsentFlowInfo___block_invoke;
  v9[3] = &unk_264200A20;
  id v5 = v4;
  id v10 = v5;
  id v6 = [(CTCarrierSpaceClient *)self _proxyWithErrorHandler:v9];
  if (v6)
  {
    id v7 = _CTCarrierSpaceLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_2142C8000, v7, OS_LOG_TYPE_INFO, "Client requesting to get user consent flow information", v8, 2u);
    }
    [v6 getUserConsentFlowInfo:v5];
  }
}

uint64_t __47__CTCarrierSpaceClient_getUserConsentFlowInfo___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setUserConsent:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(CTCarrierSpaceClient *)self _proxyWithErrorHandler:v6];
  id v8 = _CTCarrierSpaceLogDomain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_2142C8000, v8, OS_LOG_TYPE_INFO, "Client setting user consent", v9, 2u);
  }
  [v7 setUserConsent:v4 completion:v6];
}

- (void)fetchUsageInfo:(id)a3
{
}

- (void)fetchUsageInfo:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__CTCarrierSpaceClient_fetchUsageInfo_completion___block_invoke;
  v11[3] = &unk_264200A20;
  id v7 = v6;
  id v12 = v7;
  id v8 = [(CTCarrierSpaceClient *)self _proxyWithErrorHandler:v11];
  v9 = _CTCarrierSpaceLogDomain();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_2142C8000, v9, OS_LOG_TYPE_INFO, "Client requesting to fetch usage", v10, 2u);
  }
  [v8 fetchUsageInfo:v4 completion:v7];
}

uint64_t __50__CTCarrierSpaceClient_fetchUsageInfo_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchPlansInfo:(id)a3
{
}

- (void)fetchPlansInfo:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__CTCarrierSpaceClient_fetchPlansInfo_completion___block_invoke;
  v11[3] = &unk_264200A20;
  id v7 = v6;
  id v12 = v7;
  id v8 = [(CTCarrierSpaceClient *)self _proxyWithErrorHandler:v11];
  v9 = _CTCarrierSpaceLogDomain();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_2142C8000, v9, OS_LOG_TYPE_INFO, "Client requesting to fetch plans", v10, 2u);
  }
  [v8 fetchPlansInfo:v4 completion:v7];
}

uint64_t __50__CTCarrierSpaceClient_fetchPlansInfo_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAppsInfo:(id)a3
{
}

- (void)fetchAppsInfo:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__CTCarrierSpaceClient_fetchAppsInfo_completion___block_invoke;
  v11[3] = &unk_264200A20;
  id v7 = v6;
  id v12 = v7;
  id v8 = [(CTCarrierSpaceClient *)self _proxyWithErrorHandler:v11];
  v9 = _CTCarrierSpaceLogDomain();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_2142C8000, v9, OS_LOG_TYPE_INFO, "Client requesting to fetch apps", v10, 2u);
  }
  [v8 fetchAppsInfo:v4 completion:v7];
}

uint64_t __49__CTCarrierSpaceClient_fetchAppsInfo_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)refreshAllInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(CTCarrierSpaceClient *)self _proxyWithErrorHandler:v4];
  id v6 = _CTCarrierSpaceLogDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_2142C8000, v6, OS_LOG_TYPE_INFO, "Client requesting to refresh all info", v7, 2u);
  }
  [v5 refreshAllInfo:v4];
}

- (void)purchasePlan:(id)a3 completion:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CTCarrierSpaceClient *)self _proxyWithErrorHandler:v7];
  v9 = _CTCarrierSpaceLogDomain();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_2142C8000, v9, OS_LOG_TYPE_INFO, "Client requesting to purchase plan: %@", (uint8_t *)&v10, 0xCu);
  }
  [v8 purchasePlan:v6 authInfo:0 completion:v7];
}

- (void)purchasePlan:(id)a3 authInfo:(id)a4 completion:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CTCarrierSpaceClient *)self _proxyWithErrorHandler:v10];
  uint64_t v12 = _CTCarrierSpaceLogDomain();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412546;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_impl(&dword_2142C8000, v12, OS_LOG_TYPE_INFO, "Client requesting to purchase plan: %@, auth info: %@", (uint8_t *)&v13, 0x16u);
  }
  [v11 purchasePlan:v8 authInfo:v9 completion:v10];
}

- (void)fetchDataPlanMetrics:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__CTCarrierSpaceClient_fetchDataPlanMetrics___block_invoke;
  v9[3] = &unk_264200A20;
  id v5 = v4;
  id v10 = v5;
  id v6 = [(CTCarrierSpaceClient *)self _proxyWithErrorHandler:v9];
  id v7 = _CTCarrierSpaceLogDomain();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_2142C8000, v7, OS_LOG_TYPE_INFO, "Client is fetching data plan metrics", v8, 2u);
  }
  [v6 fetchDataPlanMetrics:v5];
}

uint64_t __45__CTCarrierSpaceClient_fetchDataPlanMetrics___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CTCarrierSpaceClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CTCarrierSpaceClientDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_delegateProxy, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  fObj = self->_callbackQueue.fObj.fObj;
  if (fObj) {
    dispatch_release(fObj);
  }
  id v4 = self->_queue.fObj.fObj;
  if (v4) {
    dispatch_release(v4);
  }
  objc_storeStrong((id *)&self->_connection, 0);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

void __37__CTCarrierSpaceClient__connect_sync__block_invoke_60_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2142C8000, a2, OS_LOG_TYPE_ERROR, "Failed to ping connection after interruption: %@", (uint8_t *)&v2, 0xCu);
}

void __47__CTCarrierSpaceClient__proxyWithErrorHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2142C8000, a2, OS_LOG_TYPE_ERROR, "Failed to create remote object proxy: %@", (uint8_t *)&v2, 0xCu);
}

@end