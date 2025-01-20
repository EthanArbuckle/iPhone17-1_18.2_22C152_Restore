@interface THClient
- (BOOL)getConnectionEntitlementValidity;
- (BOOL)getConnectionEntitlementValidity:(id)a3;
- (BOOL)initCommon;
- (BOOL)initCommon:(id)a3;
- (BOOL)isConnected;
- (NSXPCConnection)xpcConnection;
- (THClient)init;
- (THClient)initWithKeychainAccessGroup:(id)a3;
- (dispatch_queue_s)threadSafePropertyQueue;
- (id)asynchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)clientProxyWithErrorHandler:(id)a3;
- (id)clientProxyWithErrorHandler:(id)a3 pingService:(BOOL)a4;
- (id)performXPCRequestBlock:(id)a3 timeout:(double)a4 error:(id *)a5;
- (id)synchronousClientProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxy;
- (void)checkPreferredNetworkForActiveOperationalDataset:(NSData *)activeOperationalDataSet completion:(void *)completion;
- (void)connectToXPCService;
- (void)ctcsAddPreferredNetworkWithCompletionInternally:(id)a3 extendedPANId:(id)a4 borderAgentID:(id)a5 ipV4NwSignature:(id)a6 ipv6NwSignature:(id)a7 wifiSSID:(id)a8 wifiPassword:(id)a9 completion:(id)a10;
- (void)ctcsCleanKeychainThreadNetworksWithCompletion:(id)a3;
- (void)ctcsCleanPreferredAndFrozenThreadNetworksWithCompletion:(id)a3;
- (void)ctcsDeleteActiveDataSetRecordWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)ctcsDeletePreferredNetworkForNetworkSignatureInternallyWithCompletion:(id)a3 ipv6NwSignature:(id)a4 wifiSSID:(id)a5 completion:(id)a6;
- (void)ctcsDeletePreferredNetworkWithCompletion:(id)a3;
- (void)ctcsRetrieveActiveDataSetRecordWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)ctcsRetrieveOrGeneratePreferredNetworkInternallyWithCompletion:(id)a3;
- (void)ctcsRetrievePreferredNetworkInternallyWithCompletion:(id)a3;
- (void)ctcsStoreThreadNetworkCredentialActiveDataSetInternally:(id)a3 network:(id)a4 credentialsDataSet:(id)a5 waitForSync:(BOOL)a6 completion:(id)a7;
- (void)dealloc;
- (void)deleteCredentialsForBorderAgent:(NSData *)borderAgentID completion:(void *)completion;
- (void)handleXPCConnectionInterrupted;
- (void)handleXPCConnectionInvalidated;
- (void)init;
- (void)invalidate;
- (void)isPreferredNetworkAvailableWithCompletion:(void *)completion;
- (void)pingXPCService;
- (void)pingXPCServiceWithClientProxy:(id)a3 completion:(id)a4;
- (void)retrieveActiveDataSetRecordInternallyForExtendedPANID:(id)a3 completion:(id)a4;
- (void)retrieveAllActiveCredentials:(void *)completion;
- (void)retrieveAllCredentials:(void *)completion;
- (void)retrieveCredentialsForBorderAgent:(NSData *)borderAgentID completion:(void *)completion;
- (void)retrieveCredentialsForExtendedPANID:(NSData *)extendedPANID completion:(void *)completion;
- (void)retrieveCredentialsForUUID:(id)a3 completion:(id)a4;
- (void)retrieveOrGeneratePreferredNetworkInternally:(id)a3;
- (void)retrievePreferredCredentials:(void *)completion;
- (void)retrievePreferredCredentialsInternally:(id)a3;
- (void)retrievePreferredNetworkInternallyOnMdnsAndSig:(id)a3;
- (void)retrievePreferredNetworkWithNoScan:(id)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setThreadSafePropertyQueue:(dispatch_queue_s *)a3;
- (void)setXpcConnection:(id)a3;
- (void)storeCachedAODasPreferredNetwork:(id)a3 completion:(id)a4;
- (void)storeCredentialsForBorderAgent:(NSData *)borderAgentID activeOperationalDataSet:(NSData *)activeOperationalDataSet completion:(void *)completion;
- (void)storeCredentialsForBorderAgentInternally:(id)a3 networkName:(id)a4 extendedPANId:(id)a5 activeOperationalDataSet:(id)a6 completion:(id)a7;
- (void)updatePreferredCredentialsInternally:(id)a3;
- (void)validateAODInternally:(id)a3 completion:(id)a4;
@end

@implementation THClient

- (THClient)init
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)THClient;
  v2 = [(THClient *)&v16 init];
  v3 = v2;
  if (!v2)
  {
LABEL_5:
    v7 = v3;
    goto LABEL_9;
  }
  BOOL v4 = [(THClient *)v2 initCommon];
  v5 = ThreadNetworkLoggingCategory(0);
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[THClient init]";
      _os_log_impl(&dword_1D49C1000, v6, OS_LOG_TYPE_INFO, "Client: %s - XPC Client Init done", buf, 0xCu);
    }
    goto LABEL_5;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    [(THClient *)v6 init];
  }
  [(THClient *)v3 invalidate];
  v7 = 0;
LABEL_9:

  return v7;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = [(THClient *)self xpcConnection];

  if (v3)
  {
    BOOL v4 = [(THClient *)self xpcConnection];
    [v4 invalidate];
  }
  v5 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v9 = "-[THClient dealloc]";
    _os_log_impl(&dword_1D49C1000, v5, OS_LOG_TYPE_DEFAULT, "%s : Client: Connection - deallocated...", buf, 0xCu);
  }
  if ([(THClient *)self threadSafePropertyQueue]) {
    dispatch_release((dispatch_object_t)self->_threadSafePropertyQueue);
  }
  v6 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v9 = "-[THClient dealloc]";
    _os_log_impl(&dword_1D49C1000, v6, OS_LOG_TYPE_DEFAULT, "%s : Client: thread safe property queue - deallocated...", buf, 0xCu);
  }
  v7.receiver = self;
  v7.super_class = (Class)THClient;
  [(THClient *)&v7 dealloc];
}

- (THClient)initWithKeychainAccessGroup:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)THClient;
  v5 = [(THClient *)&v19 init];
  v6 = v5;
  if (!v5)
  {
LABEL_5:
    uint64_t v10 = v6;
    goto LABEL_9;
  }
  BOOL v7 = [(THClient *)v5 initCommon:v4];
  uint64_t v8 = ThreadNetworkLoggingCategory(0);
  uint64_t v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[THClient initWithKeychainAccessGroup:]";
      _os_log_impl(&dword_1D49C1000, v9, OS_LOG_TYPE_DEFAULT, "Client: %s - XPC Client Init done", buf, 0xCu);
    }
    goto LABEL_5;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[THClient initWithKeychainAccessGroup:](v9, v11, v12, v13, v14, v15, v16, v17);
  }
  [(THClient *)v6 invalidate];
  uint64_t v10 = 0;
LABEL_9:

  return v10;
}

- (BOOL)initCommon:(id)a3
{
  id v4 = a3;
  v5 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], QOS_CLASS_USER_INITIATED, 0);
  self->_threadSafePropertyQueue = (dispatch_queue_s *)dispatch_queue_create("CTCS XPC Client Thread Safe Property Queue", v5);
  self->_isConnected = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __23__THClient_initCommon___block_invoke;
  v9[3] = &unk_1E69FEDA8;
  objc_copyWeak(&v12, &location);
  uint64_t v11 = &v14;
  id v6 = v4;
  id v10 = v6;
  DispatchXPCConnectionQueueIfNecessaryAndWait(v9, 1);
  char v7 = *((unsigned char *)v15 + 24);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v14, 8);

  return v7;
}

void __23__THClient_initCommon___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [WeakRetained getConnectionEntitlementValidity:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (BOOL)initCommon
{
  id v3 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], QOS_CLASS_USER_INITIATED, 0);
  self->_threadSafePropertyQueue = (dispatch_queue_s *)dispatch_queue_create("CTCS XPC Client Thread Safe Property Queue", v3);
  self->_isConnected = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __22__THClient_initCommon__block_invoke;
  v6[3] = &unk_1E69FEDD0;
  objc_copyWeak(&v7, &location);
  v6[4] = &v9;
  DispatchXPCConnectionQueueIfNecessaryAndWait(v6, 1);
  char v4 = *((unsigned char *)v10 + 24);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v9, 8);
  return v4;
}

void __22__THClient_initCommon__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [WeakRetained getConnectionEntitlementValidity];
    id WeakRetained = v3;
  }
}

- (void)pingXPCServiceWithClientProxy:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__THClient_pingXPCServiceWithClientProxy_completion___block_invoke;
  v9[3] = &unk_1E69FEDF8;
  objc_copyWeak(&v11, &location);
  id v8 = v7;
  id v10 = v8;
  [v6 ping:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __53__THClient_pingXPCServiceWithClientProxy_completion___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  LODWORD(v4) = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a3) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = v4;
    }
    if (v4 == 1)
    {
      [WeakRetained setIsConnected:1];
      id v8 = ThreadNetworkLoggingCategory(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl(&dword_1D49C1000, v8, OS_LOG_TYPE_INFO, "Successfully established connection", v11, 2u);
      }
    }
    else
    {
      uint64_t v9 = ThreadNetworkLoggingCategory(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __53__THClient_pingXPCServiceWithClientProxy_completion___block_invoke_cold_1(v9);
      }
      [v7 setIsConnected:0];
    }
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, v4);
    }
  }
}

- (void)pingXPCService
{
  id v2 = [(THClient *)self clientProxyWithErrorHandler:&__block_literal_global_2 pingService:1];
}

void __26__THClient_pingXPCService__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1D49C1000, v3, OS_LOG_TYPE_INFO, "clientProxyWithErrorHandler: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)handleXPCConnectionInterrupted
{
  id v3 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_1D49C1000, v3, OS_LOG_TYPE_INFO, "Handle interrupted XPC Connection", v4, 2u);
  }
  [(THClient *)self setIsConnected:0];
}

- (void)handleXPCConnectionInvalidated
{
  id v3 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1D49C1000, v3, OS_LOG_TYPE_INFO, "Handle invalidated XPC Connection", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__THClient_handleXPCConnectionInvalidated__block_invoke;
  v4[3] = &unk_1E69FEE40;
  objc_copyWeak(&v5, buf);
  DispatchXPCConnectionQueueIfNecessaryAndWait(v4, 1);
  [(THClient *)self setIsConnected:0];
  objc_destroyWeak(&v5);
  objc_destroyWeak(buf);
}

void __42__THClient_handleXPCConnectionInvalidated__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setXpcConnection:0];
}

- (void)connectToXPCService
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = ThreadNetworkLoggingCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    objc_super v19 = "-[THClient connectToXPCService]";
    __int16 v20 = 1024;
    int v21 = 177;
    _os_log_impl(&dword_1D49C1000, v3, OS_LOG_TYPE_DEFAULT, "Client: %s:%d", buf, 0x12u);
  }
  int v4 = [(THClient *)self xpcConnection];
  BOOL v5 = v4 == 0;

  if (v5)
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.ThreadNetwork.xpc" options:4096];
    [(THClient *)self setXpcConnection:v6];

    id v7 = +[XPCInterface CTCSCreateXPCTransportInterface];
    id v8 = [(THClient *)self xpcConnection];
    [v8 setRemoteObjectInterface:v7];

    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __31__THClient_connectToXPCService__block_invoke;
    v15[3] = &unk_1E69FEE40;
    objc_copyWeak(&v16, &location);
    uint64_t v9 = [(THClient *)self xpcConnection];
    [v9 setInterruptionHandler:v15];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __31__THClient_connectToXPCService__block_invoke_7;
    v13[3] = &unk_1E69FEE40;
    objc_copyWeak(&v14, &location);
    uint64_t v10 = [(THClient *)self xpcConnection];
    [v10 setInvalidationHandler:v13];

    id v11 = [(THClient *)self xpcConnection];
    [v11 resume];

    char v12 = ThreadNetworkLoggingCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      objc_super v19 = "-[THClient connectToXPCService]";
      _os_log_impl(&dword_1D49C1000, v12, OS_LOG_TYPE_INFO, "Client: %s - connectToXPCService Connection resumed", buf, 0xCu);
    }
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __31__THClient_connectToXPCService__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = ThreadNetworkLoggingCategory(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __31__THClient_connectToXPCService__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
    [WeakRetained handleXPCConnectionInterrupted];
  }
}

void __31__THClient_connectToXPCService__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = ThreadNetworkLoggingCategory(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __31__THClient_connectToXPCService__block_invoke_7_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
    [WeakRetained handleXPCConnectionInvalidated];
  }
}

- (void)invalidate
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __22__THClient_invalidate__block_invoke;
  v2[3] = &unk_1E69FEE40;
  objc_copyWeak(&v3, &location);
  DispatchXPCConnectionQueueIfNecessaryAndWait(v2, 1);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __22__THClient_invalidate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = ThreadNetworkLoggingCategory(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __22__THClient_invalidate__block_invoke_cold_1(v2);
    }
    id v3 = [WeakRetained xpcConnection];

    if (v3)
    {
      uint64_t v4 = [WeakRetained xpcConnection];
      [v4 invalidate];
    }
    [WeakRetained setIsConnected:0];
  }
}

- (id)clientProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(THClient *)self clientProxyWithErrorHandler:v4 pingService:[(THClient *)self isConnected] ^ 1];

  return v5;
}

- (id)clientProxyWithErrorHandler:(id)a3 pingService:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v18 = 0;
  objc_super v19 = &v18;
  uint64_t v20 = 0x3032000000;
  int v21 = __Block_byref_object_copy_;
  uint64_t v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  objc_initWeak(&location, self);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  char v12 = __52__THClient_clientProxyWithErrorHandler_pingService___block_invoke;
  uint64_t v13 = &unk_1E69FEE90;
  objc_copyWeak(&v16, &location);
  uint64_t v15 = &v18;
  id v7 = v6;
  id v14 = v7;
  DispatchXPCConnectionQueueIfNecessaryAndWait(&v10, 1);
  if (v4) {
    -[THClient pingXPCServiceWithClientProxy:completion:](self, "pingXPCServiceWithClientProxy:completion:", v19[5], &__block_literal_global_11, v10, v11, v12, v13);
  }
  id v8 = (id)v19[5];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __52__THClient_clientProxyWithErrorHandler_pingService___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained connectToXPCService];
    BOOL v4 = [v3 xpcConnection];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__THClient_clientProxyWithErrorHandler_pingService___block_invoke_2;
    v8[3] = &unk_1E69FEE68;
    id v9 = *(id *)(a1 + 32);
    uint64_t v5 = [v4 remoteObjectProxyWithErrorHandler:v8];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

void __52__THClient_clientProxyWithErrorHandler_pingService___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1D49C1000, v4, OS_LOG_TYPE_INFO, "remoteObjectProxyWithErrorHandler: %@", (uint8_t *)&v6, 0xCu);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __52__THClient_clientProxyWithErrorHandler_pingService___block_invoke_8(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    BOOL v4 = @"NO";
    if (a2) {
      BOOL v4 = @"YES";
    }
    int v5 = 138412290;
    int v6 = v4;
    _os_log_impl(&dword_1D49C1000, v3, OS_LOG_TYPE_INFO, "clientProxyWithErrorHandler connected=%@", (uint8_t *)&v5, 0xCu);
  }
}

- (id)synchronousRemoteObjectProxy
{
  return [(THClient *)self synchronousClientProxyWithErrorHandler:&__block_literal_global_17];
}

void __40__THClient_synchronousRemoteObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1D49C1000, v3, OS_LOG_TYPE_INFO, "synchronousRemoteObjectProxy - %@", (uint8_t *)&v4, 0xCu);
  }
}

- (id)synchronousClientProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy_;
  char v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  objc_initWeak(&location, self);
  if (![(THClient *)self isConnected]) {
    [(THClient *)self pingXPCService];
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__THClient_synchronousClientProxyWithErrorHandler___block_invoke;
  v8[3] = &unk_1E69FEE90;
  objc_copyWeak(&v11, &location);
  uint64_t v10 = &v13;
  id v5 = v4;
  id v9 = v5;
  DispatchXPCConnectionQueueIfNecessaryAndWait(v8, 1);
  id v6 = (id)v14[5];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v13, 8);

  return v6;
}

void __51__THClient_synchronousClientProxyWithErrorHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained xpcConnection];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51__THClient_synchronousClientProxyWithErrorHandler___block_invoke_2;
    v8[3] = &unk_1E69FEE68;
    id v9 = *(id *)(a1 + 32);
    uint64_t v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v8];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

void __51__THClient_synchronousClientProxyWithErrorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __51__THClient_synchronousClientProxyWithErrorHandler___block_invoke_2_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v3);
  }
}

- (id)performXPCRequestBlock:(id)a3 timeout:(double)a4 error:(id *)a5
{
  v41[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void (**)(id, void *))a3;
  uint64_t v8 = dispatch_semaphore_create(0);
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  id v37 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  id v31 = 0;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __49__THClient_performXPCRequestBlock_timeout_error___block_invoke;
  v25[3] = &unk_1E69FEED8;
  v25[4] = &v32;
  v25[5] = &v26;
  v25[6] = v8;
  v7[2](v7, v25);
  if (a4 <= 0.0) {
    dispatch_time_t v9 = -1;
  }
  else {
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  }
  if (!dispatch_semaphore_wait(v8, v9))
  {
    uint64_t v15 = 0;
    if (!a5) {
      goto LABEL_17;
    }
    goto LABEL_12;
  }
  uint64_t v10 = NSString;
  uint64_t v11 = [NSNumber numberWithDouble:a4];
  char v12 = [v10 stringWithFormat:@"XPC method request timed out after %@ seconds", v11];

  uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v40 = *MEMORY[0x1E4F28568];
  v41[0] = v12;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
  uint64_t v15 = [v13 errorWithDomain:@"com.apple.ThreadNetwork" code:3 userInfo:v14];

  id v16 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    char v17 = [v15 description];
    *(_DWORD *)buf = 138412290;
    v39 = v17;
    _os_log_impl(&dword_1D49C1000, v16, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  id v18 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    objc_super v19 = [MEMORY[0x1E4F29060] callStackSymbols];
    *(_DWORD *)buf = 138412290;
    v39 = v19;
    _os_log_impl(&dword_1D49C1000, v18, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  if (a5)
  {
LABEL_12:
    uint64_t v20 = (void *)v27[5];
    if (v20)
    {
      *a5 = v20;
      int v21 = ThreadNetworkLoggingCategory(0);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = [(id)v27[5] description];
        -[THClient performXPCRequestBlock:timeout:error:](v22, buf, v21);
      }
    }
    else if (v15)
    {
      *a5 = v15;
    }
  }
LABEL_17:
  id v23 = (id)v33[5];

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v23;
}

void __49__THClient_performXPCRequestBlock_timeout_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (BOOL)isConnected
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  threadSafePropertyQueue = self->_threadSafePropertyQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __23__THClient_isConnected__block_invoke;
  v5[3] = &unk_1E69FEF00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(threadSafePropertyQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __23__THClient_isConnected__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

- (void)setIsConnected:(BOOL)a3
{
  threadSafePropertyQueue = self->_threadSafePropertyQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __27__THClient_setIsConnected___block_invoke;
  v4[3] = &unk_1E69FEF28;
  BOOL v5 = a3;
  void v4[4] = self;
  dispatch_barrier_async(threadSafePropertyQueue, v4);
}

void __27__THClient_setIsConnected___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 8))
  {
    *(unsigned char *)(v2 + 8) = v1;
    id v4 = ThreadNetworkLoggingCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      if (*(unsigned char *)(a1 + 40)) {
        BOOL v5 = @"true";
      }
      else {
        BOOL v5 = @"false";
      }
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1D49C1000, v4, OS_LOG_TYPE_INFO, "CTCS XPC Client - isConnected: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (BOOL)getConnectionEntitlementValidity:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  BOOL v5 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__THClient_getConnectionEntitlementValidity___block_invoke;
  v9[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  void v9[4] = v5;
  int v6 = [(THClient *)self clientProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__THClient_getConnectionEntitlementValidity___block_invoke_38;
  v8[3] = &unk_1E69FEF70;
  void v8[4] = &v10;
  v8[5] = v5;
  [v6 isConnectionValid:v4 completion:v8];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v5);
  LOBYTE(v5) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)v5;
}

void __45__THClient_getConnectionEntitlementValidity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __45__THClient_getConnectionEntitlementValidity___block_invoke_cold_1();
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __45__THClient_getConnectionEntitlementValidity___block_invoke_38(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  int v6 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __45__THClient_getConnectionEntitlementValidity___block_invoke_38_cold_1();
  }
  uint64_t v7 = *(NSObject **)(a1 + 40);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  dispatch_semaphore_signal(v7);
}

- (BOOL)getConnectionEntitlementValidity
{
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v3 = dispatch_semaphore_create(0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__THClient_getConnectionEntitlementValidity__block_invoke;
  v7[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v7[4] = v3;
  id v4 = [(THClient *)self clientProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__THClient_getConnectionEntitlementValidity__block_invoke_39;
  v6[3] = &unk_1E69FEF70;
  v6[4] = &v8;
  void v6[5] = v3;
  [v4 isConnectionValid:v6];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v3);
  LOBYTE(v3) = *((unsigned char *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return (char)v3;
}

void __44__THClient_getConnectionEntitlementValidity__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __44__THClient_getConnectionEntitlementValidity__block_invoke_cold_1();
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __44__THClient_getConnectionEntitlementValidity__block_invoke_39(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  int v6 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __44__THClient_getConnectionEntitlementValidity__block_invoke_39_cold_1();
  }
  uint64_t v7 = *(NSObject **)(a1 + 40);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  dispatch_semaphore_signal(v7);
}

- (id)asynchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(THClient *)self xpcConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__THClient_asynchronousRemoteObjectProxyWithErrorHandler___block_invoke;
  v9[3] = &unk_1E69FEE68;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

void __58__THClient_asynchronousRemoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [v3 description];
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1D49C1000, v4, OS_LOG_TYPE_INFO, "Connection failed while trying to get async remote object proxy (%@)\n", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

- (void)ctcsStoreThreadNetworkCredentialActiveDataSetInternally:(id)a3 network:(id)a4 credentialsDataSet:(id)a5 waitForSync:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v26 = "-[THClient ctcsStoreThreadNetworkCredentialActiveDataSetInternally:network:credentialsDataSet:waitForSync:completion:]";
    __int16 v27 = 1024;
    int v28 = 436;
    _os_log_impl(&dword_1D49C1000, v16, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  char v17 = [(THClient *)self xpcConnection];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __118__THClient_ctcsStoreThreadNetworkCredentialActiveDataSetInternally_network_credentialsDataSet_waitForSync_completion___block_invoke;
  v23[3] = &unk_1E69FEE68;
  id v18 = v12;
  id v24 = v18;
  objc_super v19 = [v17 remoteObjectProxyWithErrorHandler:v23];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __118__THClient_ctcsStoreThreadNetworkCredentialActiveDataSetInternally_network_credentialsDataSet_waitForSync_completion___block_invoke_40;
  v21[3] = &unk_1E69FEF98;
  id v22 = v18;
  id v20 = v18;
  [v19 ctcsServerStoreThreadNetworkCredentialActiveDataSetInternally:v15 network:v14 credentialsDataSet:v13 waitForSync:v7 completion:v21];
}

void __118__THClient_ctcsStoreThreadNetworkCredentialActiveDataSetInternally_network_credentialsDataSet_waitForSync_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __118__THClient_ctcsStoreThreadNetworkCredentialActiveDataSetInternally_network_credentialsDataSet_waitForSync_completion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __118__THClient_ctcsStoreThreadNetworkCredentialActiveDataSetInternally_network_credentialsDataSet_waitForSync_completion___block_invoke_40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)ctcsDeleteActiveDataSetRecordWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v18 = "-[THClient ctcsDeleteActiveDataSetRecordWithUniqueIdentifier:completion:]";
    __int16 v19 = 1024;
    int v20 = 451;
    _os_log_impl(&dword_1D49C1000, v8, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  uint64_t v9 = [(THClient *)self xpcConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__THClient_ctcsDeleteActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke;
  v15[3] = &unk_1E69FEE68;
  id v10 = v6;
  id v16 = v10;
  char v11 = [v9 remoteObjectProxyWithErrorHandler:v15];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__THClient_ctcsDeleteActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke_42;
  v13[3] = &unk_1E69FEE68;
  id v14 = v10;
  id v12 = v10;
  [v11 ctcsServerDeleteActiveDataSetRecordWithUniqueIdentifier:v7 completion:v13];
}

void __73__THClient_ctcsDeleteActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__THClient_ctcsDeleteActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __73__THClient_ctcsDeleteActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke_42(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)ctcsRetrieveActiveDataSetRecordWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v18 = "-[THClient ctcsRetrieveActiveDataSetRecordWithUniqueIdentifier:completion:]";
    __int16 v19 = 1024;
    int v20 = 466;
    _os_log_impl(&dword_1D49C1000, v8, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  uint64_t v9 = [(THClient *)self xpcConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__THClient_ctcsRetrieveActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke;
  v15[3] = &unk_1E69FEE68;
  id v10 = v6;
  id v16 = v10;
  char v11 = [v9 remoteObjectProxyWithErrorHandler:v15];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__THClient_ctcsRetrieveActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke_43;
  v13[3] = &unk_1E69FEFC0;
  id v14 = v10;
  id v12 = v10;
  [v11 ctcsServerRetrieveActiveDataSetRecordWithUniqueIdentifier:v7 completion:v13];
}

void __75__THClient_ctcsRetrieveActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __75__THClient_ctcsRetrieveActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __75__THClient_ctcsRetrieveActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke_43(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)ctcsRetrievePreferredNetworkInternallyWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[THClient ctcsRetrievePreferredNetworkInternallyWithCompletion:]";
    __int16 v16 = 1024;
    int v17 = 480;
    _os_log_impl(&dword_1D49C1000, v5, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  id v6 = [(THClient *)self xpcConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__THClient_ctcsRetrievePreferredNetworkInternallyWithCompletion___block_invoke;
  v12[3] = &unk_1E69FEE68;
  id v7 = v4;
  id v13 = v7;
  uint64_t v8 = [v6 remoteObjectProxyWithErrorHandler:v12];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__THClient_ctcsRetrievePreferredNetworkInternallyWithCompletion___block_invoke_45;
  v10[3] = &unk_1E69FEFC0;
  id v11 = v7;
  id v9 = v7;
  [v8 ctcsServerRetrievePreferredNetworkInternallyWithCompletion:v10];
}

void __65__THClient_ctcsRetrievePreferredNetworkInternallyWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __65__THClient_ctcsRetrievePreferredNetworkInternallyWithCompletion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65__THClient_ctcsRetrievePreferredNetworkInternallyWithCompletion___block_invoke_45(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)ctcsRetrieveOrGeneratePreferredNetworkInternallyWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[THClient ctcsRetrieveOrGeneratePreferredNetworkInternallyWithCompletion:]";
    __int16 v16 = 1024;
    int v17 = 494;
    _os_log_impl(&dword_1D49C1000, v5, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  id v6 = [(THClient *)self xpcConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__THClient_ctcsRetrieveOrGeneratePreferredNetworkInternallyWithCompletion___block_invoke;
  v12[3] = &unk_1E69FEE68;
  id v7 = v4;
  id v13 = v7;
  uint64_t v8 = [v6 remoteObjectProxyWithErrorHandler:v12];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__THClient_ctcsRetrieveOrGeneratePreferredNetworkInternallyWithCompletion___block_invoke_46;
  v10[3] = &unk_1E69FEFC0;
  id v11 = v7;
  id v9 = v7;
  [v8 ctcsServerRetrieveOrGeneratePreferredNetworkInternallyWithCompletion:v10];
}

void __75__THClient_ctcsRetrieveOrGeneratePreferredNetworkInternallyWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __75__THClient_ctcsRetrieveOrGeneratePreferredNetworkInternallyWithCompletion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __75__THClient_ctcsRetrieveOrGeneratePreferredNetworkInternallyWithCompletion___block_invoke_46(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)ctcsDeletePreferredNetworkWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[THClient ctcsDeletePreferredNetworkWithCompletion:]";
    __int16 v16 = 1024;
    int v17 = 509;
    _os_log_impl(&dword_1D49C1000, v5, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  id v6 = [(THClient *)self xpcConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__THClient_ctcsDeletePreferredNetworkWithCompletion___block_invoke;
  v12[3] = &unk_1E69FEE68;
  id v7 = v4;
  id v13 = v7;
  uint64_t v8 = [v6 remoteObjectProxyWithErrorHandler:v12];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__THClient_ctcsDeletePreferredNetworkWithCompletion___block_invoke_47;
  v10[3] = &unk_1E69FEE68;
  id v11 = v7;
  id v9 = v7;
  [v8 ctcsServerDeletePreferredNetworkWithCompletion:v10];
}

void __53__THClient_ctcsDeletePreferredNetworkWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __53__THClient_ctcsDeletePreferredNetworkWithCompletion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __53__THClient_ctcsDeletePreferredNetworkWithCompletion___block_invoke_47(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)ctcsCleanPreferredAndFrozenThreadNetworksWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[THClient ctcsCleanPreferredAndFrozenThreadNetworksWithCompletion:]";
    __int16 v16 = 1024;
    int v17 = 524;
    _os_log_impl(&dword_1D49C1000, v5, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  id v6 = [(THClient *)self xpcConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__THClient_ctcsCleanPreferredAndFrozenThreadNetworksWithCompletion___block_invoke;
  v12[3] = &unk_1E69FEE68;
  id v7 = v4;
  id v13 = v7;
  uint64_t v8 = [v6 remoteObjectProxyWithErrorHandler:v12];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__THClient_ctcsCleanPreferredAndFrozenThreadNetworksWithCompletion___block_invoke_48;
  v10[3] = &unk_1E69FEE68;
  id v11 = v7;
  id v9 = v7;
  [v8 ctcsServerCleanPreferredAndFrozenThreadNetworksWithCompletion:v10];
}

void __68__THClient_ctcsCleanPreferredAndFrozenThreadNetworksWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __68__THClient_ctcsCleanPreferredAndFrozenThreadNetworksWithCompletion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__THClient_ctcsCleanPreferredAndFrozenThreadNetworksWithCompletion___block_invoke_48(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)ctcsCleanKeychainThreadNetworksWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[THClient ctcsCleanKeychainThreadNetworksWithCompletion:]";
    __int16 v16 = 1024;
    int v17 = 538;
    _os_log_impl(&dword_1D49C1000, v5, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  id v6 = [(THClient *)self xpcConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__THClient_ctcsCleanKeychainThreadNetworksWithCompletion___block_invoke;
  v12[3] = &unk_1E69FEE68;
  id v7 = v4;
  id v13 = v7;
  uint64_t v8 = [v6 remoteObjectProxyWithErrorHandler:v12];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__THClient_ctcsCleanKeychainThreadNetworksWithCompletion___block_invoke_49;
  v10[3] = &unk_1E69FEE68;
  id v11 = v7;
  id v9 = v7;
  [v8 ctcsServerCleanKeychainThreadNetworksWithCompletion:v10];
}

void __58__THClient_ctcsCleanKeychainThreadNetworksWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __58__THClient_ctcsCleanKeychainThreadNetworksWithCompletion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__THClient_ctcsCleanKeychainThreadNetworksWithCompletion___block_invoke_49(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)storeCredentialsForBorderAgentInternally:(id)a3 networkName:(id)a4 extendedPANId:(id)a5 activeOperationalDataSet:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  __int16 v16 = (void (**)(id, void *))a7;
  if (!v14 || !v13 || !v12 || !v15)
  {
    int v17 = [MEMORY[0x1E4F28C58] storeError:4 description:@"Invalid input parameter"];
    v16[2](v16, v17);
  }
  uint64_t v18 = [(THClient *)self xpcConnection];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __115__THClient_storeCredentialsForBorderAgentInternally_networkName_extendedPANId_activeOperationalDataSet_completion___block_invoke;
  v29[3] = &unk_1E69FEE68;
  __int16 v19 = v16;
  v30 = v19;
  int v20 = [v18 remoteObjectProxyWithErrorHandler:v29];

  uint64_t v21 = [[THThreadNetworkBorderAgent alloc] initWithBaDiscrId:v12];
  id v22 = [[THThreadNetwork alloc] initWithName:v13 extendedPANID:v14];
  id v23 = [[THThreadNetworkCredentialsDataSet alloc] initWithDataSetArray:v15 userInfo:0];
  id v24 = v23;
  if (!v21 || !v22 || !v23)
  {
    v25 = [MEMORY[0x1E4F28C58] storeError:4 description:@"Invalid input parameter caused error"];
    v19[2](v19, v25);
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __115__THClient_storeCredentialsForBorderAgentInternally_networkName_extendedPANId_activeOperationalDataSet_completion___block_invoke_59;
  v27[3] = &unk_1E69FEF98;
  int v28 = v19;
  uint64_t v26 = v19;
  [v20 ctcsServerStoreThreadNetworkCredentialActiveDataSetInternally:v21 network:v22 credentialsDataSet:v24 waitForSync:0 completion:v27];
}

void __115__THClient_storeCredentialsForBorderAgentInternally_networkName_extendedPANId_activeOperationalDataSet_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __115__THClient_storeCredentialsForBorderAgentInternally_networkName_extendedPANId_activeOperationalDataSet_completion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __115__THClient_storeCredentialsForBorderAgentInternally_networkName_extendedPANId_activeOperationalDataSet_completion___block_invoke_59(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)retrieveActiveDataSetRecordInternallyForExtendedPANID:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void, void *))a4;
  id v7 = a3;
  uint64_t v8 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v19 = "-[THClient retrieveActiveDataSetRecordInternallyForExtendedPANID:completion:]";
    __int16 v20 = 1024;
    int v21 = 586;
    _os_log_impl(&dword_1D49C1000, v8, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  if (!v7)
  {
    id v9 = [MEMORY[0x1E4F28C58] storeError:4 description:@"Invalid input parameter"];
    v6[2](v6, 0, v9);
  }
  id v10 = [(THClient *)self xpcConnection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __77__THClient_retrieveActiveDataSetRecordInternallyForExtendedPANID_completion___block_invoke;
  v16[3] = &unk_1E69FEE68;
  id v11 = v6;
  id v17 = v11;
  id v12 = [v10 remoteObjectProxyWithErrorHandler:v16];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__THClient_retrieveActiveDataSetRecordInternallyForExtendedPANID_completion___block_invoke_60;
  v14[3] = &unk_1E69FEFC0;
  id v15 = v11;
  id v13 = v11;
  [v12 ctcsServerRetrieveActiveDataSetRecordInternallyWithXPANId:v7 completion:v14];
}

void __77__THClient_retrieveActiveDataSetRecordInternallyForExtendedPANID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __77__THClient_retrieveActiveDataSetRecordInternallyForExtendedPANID_completion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__THClient_retrieveActiveDataSetRecordInternallyForExtendedPANID_completion___block_invoke_60(uint64_t a1, void *a2, void *a3)
{
  id v30 = a2;
  id v5 = a3;
  if (v30)
  {
    uint64_t v27 = a1;
    id v28 = v5;
    id v6 = [THCredentials alloc];
    uint64_t v26 = [v30 network];
    uint64_t v29 = [v26 networkName];
    v25 = [v30 network];
    int v21 = [v25 extendedPANID];
    id v24 = [v30 borderAgent];
    __int16 v19 = [v24 discriminatorId];
    id v23 = [v30 credentialsDataSet];
    uint64_t v18 = [v23 dataSetArray];
    uint64_t v22 = [v30 credentials];
    id v7 = [v22 PSKc];
    __int16 v20 = [v30 credentials];
    uint64_t v8 = [v20 masterKey];
    id v9 = [v30 credentials];
    char v10 = [v9 channel];
    id v11 = [v30 credentials];
    id v12 = [v11 PANID];
    id v13 = [v30 creationDate];
    id v14 = [v30 lastModificationDate];
    LOBYTE(v17) = v10;
    id v15 = [(THCredentials *)v6 initThreadCredentials:v29 extendedPANID:v21 borderAgentID:v19 activeOperationalDataSet:v18 PSKC:v7 networkKey:v8 channel:v17 panID:v12 creationDate:v13 lastModificationDate:v14];

    if (v15)
    {
      id v5 = v28;
      (*(void (**)(void))(*(void *)(v27 + 32) + 16))();
    }
    else
    {
      __int16 v16 = [MEMORY[0x1E4F28C58] storeError:3 description:@"Failed to retrieve record"];
      (*(void (**)(void))(*(void *)(v27 + 32) + 16))();

      id v5 = v28;
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)updatePreferredCredentialsInternally:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[THClient updatePreferredCredentialsInternally:]";
    __int16 v16 = 1024;
    int v17 = 620;
    _os_log_impl(&dword_1D49C1000, v5, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  id v6 = [(THClient *)self xpcConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49__THClient_updatePreferredCredentialsInternally___block_invoke;
  v12[3] = &unk_1E69FEE68;
  id v7 = v4;
  id v13 = v7;
  uint64_t v8 = [v6 remoteObjectProxyWithErrorHandler:v12];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__THClient_updatePreferredCredentialsInternally___block_invoke_65;
  v10[3] = &unk_1E69FEFE8;
  id v11 = v7;
  id v9 = v7;
  [v8 ctcsUpdatePreferredNetworkInternallyWithCompletion:v10];
}

void __49__THClient_updatePreferredCredentialsInternally___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __49__THClient_updatePreferredCredentialsInternally___block_invoke_cold_1();
  }
  (*(void (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v3 != 0);
}

uint64_t __49__THClient_updatePreferredCredentialsInternally___block_invoke_65(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)validateAODInternally:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void, void *))a4;
  id v7 = a3;
  uint64_t v8 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v19 = "-[THClient validateAODInternally:completion:]";
    __int16 v20 = 1024;
    int v21 = 635;
    _os_log_impl(&dword_1D49C1000, v8, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  if (!v7)
  {
    id v9 = [MEMORY[0x1E4F28C58] storeError:4 description:@"Invalid input parameter"];
    v6[2](v6, 0, v9);
  }
  char v10 = [(THClient *)self xpcConnection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __45__THClient_validateAODInternally_completion___block_invoke;
  v16[3] = &unk_1E69FEE68;
  id v11 = v6;
  id v17 = v11;
  id v12 = [v10 remoteObjectProxyWithErrorHandler:v16];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __45__THClient_validateAODInternally_completion___block_invoke_66;
  v14[3] = &unk_1E69FEFC0;
  id v15 = v11;
  id v13 = v11;
  [v12 ctcsValidateAODInternally:v7 completion:v14];
}

void __45__THClient_validateAODInternally_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __45__THClient_validateAODInternally_completion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __45__THClient_validateAODInternally_completion___block_invoke_66(uint64_t a1, void *a2, void *a3)
{
  id v30 = a2;
  id v5 = a3;
  if (v30)
  {
    uint64_t v27 = a1;
    id v28 = v5;
    id v6 = [THCredentials alloc];
    uint64_t v26 = [v30 network];
    uint64_t v29 = [v26 networkName];
    v25 = [v30 network];
    int v21 = [v25 extendedPANID];
    id v24 = [v30 borderAgent];
    __int16 v19 = [v24 discriminatorId];
    id v23 = [v30 credentialsDataSet];
    uint64_t v18 = [v23 dataSetArray];
    uint64_t v22 = [v30 credentials];
    id v7 = [v22 PSKc];
    __int16 v20 = [v30 credentials];
    uint64_t v8 = [v20 masterKey];
    id v9 = [v30 credentials];
    char v10 = [v9 channel];
    id v11 = [v30 credentials];
    id v12 = [v11 PANID];
    id v13 = [v30 creationDate];
    id v14 = [v30 lastModificationDate];
    LOBYTE(v17) = v10;
    id v15 = [(THCredentials *)v6 initThreadCredentials:v29 extendedPANID:v21 borderAgentID:v19 activeOperationalDataSet:v18 PSKC:v7 networkKey:v8 channel:v17 panID:v12 creationDate:v13 lastModificationDate:v14];

    if (v15)
    {
      id v5 = v28;
      (*(void (**)(void))(*(void *)(v27 + 32) + 16))();
    }
    else
    {
      __int16 v16 = [MEMORY[0x1E4F28C58] storeError:3 description:@"Failed to retrieve record"];
      (*(void (**)(void))(*(void *)(v27 + 32) + 16))();

      id v5 = v28;
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)deleteCredentialsForBorderAgent:(NSData *)borderAgentID completion:(void *)completion
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = borderAgentID;
  id v7 = completion;
  uint64_t v8 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v18 = "-[THClient deleteCredentialsForBorderAgent:completion:]";
    __int16 v19 = 1024;
    int v20 = 672;
    _os_log_impl(&dword_1D49C1000, v8, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  if (v6)
  {
    id v9 = [(THClient *)self xpcConnection];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __55__THClient_deleteCredentialsForBorderAgent_completion___block_invoke;
    v15[3] = &unk_1E69FEE68;
    id v10 = v7;
    id v16 = v10;
    id v11 = [v9 remoteObjectProxyWithErrorHandler:v15];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __55__THClient_deleteCredentialsForBorderAgent_completion___block_invoke_67;
    v13[3] = &unk_1E69FEE68;
    id v14 = v10;
    [v11 ctcsServerDeleteActiveDataSetRecordForThreadBorderAgent:v6 completion:v13];

    id v12 = v16;
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28C58] storeError:4 description:@"Invalid input parameter"];
    (*((void (**)(void *, void *))v7 + 2))(v7, v12);
  }
}

void __55__THClient_deleteCredentialsForBorderAgent_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __55__THClient_deleteCredentialsForBorderAgent_completion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __55__THClient_deleteCredentialsForBorderAgent_completion___block_invoke_67(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)storeCredentialsForBorderAgent:(NSData *)borderAgentID activeOperationalDataSet:(NSData *)activeOperationalDataSet completion:(void *)completion
{
  uint64_t v8 = borderAgentID;
  id v9 = activeOperationalDataSet;
  id v10 = completion;
  if (!v8 || !v9)
  {
    id v11 = [MEMORY[0x1E4F28C58] storeError:4 description:@"Invalid input parameter"];
    v10[2](v10, v11);
  }
  id v12 = [(THClient *)self xpcConnection];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __79__THClient_storeCredentialsForBorderAgent_activeOperationalDataSet_completion___block_invoke;
  v18[3] = &unk_1E69FEE68;
  id v13 = v10;
  __int16 v19 = v13;
  id v14 = [v12 remoteObjectProxyWithErrorHandler:v18];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79__THClient_storeCredentialsForBorderAgent_activeOperationalDataSet_completion___block_invoke_68;
  v16[3] = &unk_1E69FEF98;
  uint64_t v17 = v13;
  id v15 = v13;
  [v14 ctcsServerStoreThreadNetworkCredentialActiveDataSet:v8 credentialsDataSet:v9 completion:v16];
}

void __79__THClient_storeCredentialsForBorderAgent_activeOperationalDataSet_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __79__THClient_storeCredentialsForBorderAgent_activeOperationalDataSet_completion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79__THClient_storeCredentialsForBorderAgent_activeOperationalDataSet_completion___block_invoke_68(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __79__THClient_storeCredentialsForBorderAgent_activeOperationalDataSet_completion___block_invoke_68_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)storeCachedAODasPreferredNetwork:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (!v6)
  {
    uint64_t v8 = [MEMORY[0x1E4F28C58] storeError:4 description:@"Invalid input parameter"];
    v7[2](v7, v8);
  }
  id v9 = [(THClient *)self xpcConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__THClient_storeCachedAODasPreferredNetwork_completion___block_invoke;
  v15[3] = &unk_1E69FEE68;
  id v10 = v7;
  id v16 = v10;
  id v11 = [v9 remoteObjectProxyWithErrorHandler:v15];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__THClient_storeCachedAODasPreferredNetwork_completion___block_invoke_69;
  v13[3] = &unk_1E69FEF98;
  id v14 = v10;
  id v12 = v10;
  [v11 ctcsServerStoreCachedAODasPreferredNetwork:v6 completion:v13];
}

void __56__THClient_storeCachedAODasPreferredNetwork_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __56__THClient_storeCachedAODasPreferredNetwork_completion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__THClient_storeCachedAODasPreferredNetwork_completion___block_invoke_69(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __56__THClient_storeCachedAODasPreferredNetwork_completion___block_invoke_69_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)retrieveAllCredentials:(void *)completion
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = completion;
  id v5 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[THClient retrieveAllCredentials:]";
    __int16 v16 = 1024;
    int v17 = 732;
    _os_log_impl(&dword_1D49C1000, v5, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  id v6 = [(THClient *)self xpcConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __35__THClient_retrieveAllCredentials___block_invoke;
  v12[3] = &unk_1E69FEE68;
  id v7 = v4;
  id v13 = v7;
  uint64_t v8 = [v6 remoteObjectProxyWithErrorHandler:v12];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __35__THClient_retrieveAllCredentials___block_invoke_70;
  v10[3] = &unk_1E69FF010;
  id v11 = v7;
  id v9 = v7;
  [v8 ctcsServerRetrieveAllActiveDataSetRecordsWithActiveFlag:0 completion:v10];
}

void __35__THClient_retrieveAllCredentials___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __35__THClient_retrieveAllCredentials___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __35__THClient_retrieveAllCredentials___block_invoke_70(uint64_t a1, void *a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5 && [v5 count])
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v8 = v5;
    uint64_t v31 = [v8 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v31)
    {
      uint64_t v29 = *(void *)v44;
      id v30 = v7;
      id v26 = v6;
      id v27 = v5;
      uint64_t v25 = a1;
      id obj = v8;
      while (2)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v44 != v29) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v43 + 1) + 8 * v9);
          if (!v10) {
            goto LABEL_14;
          }
          uint64_t v32 = v9;
          id v11 = [THCredentials alloc];
          uint64_t v40 = [v10 network];
          v42 = [v40 networkName];
          v39 = [v10 network];
          v41 = [v39 extendedPANID];
          v38 = [v10 borderAgent];
          uint64_t v34 = [v38 discriminatorId];
          id v37 = [v10 credentialsDataSet];
          v33 = [v37 dataSetArray];
          v36 = [v10 credentials];
          id v12 = [v36 PSKc];
          v35 = [v10 credentials];
          id v13 = [v35 masterKey];
          id v14 = [v10 credentials];
          char v15 = [v14 channel];
          __int16 v16 = [v10 credentials];
          int v17 = [v16 PANID];
          uint64_t v18 = [v10 creationDate];
          __int16 v19 = [v10 lastModificationDate];
          LOBYTE(v24) = v15;
          id v20 = [(THCredentials *)v11 initThreadCredentials:v42 extendedPANID:v41 borderAgentID:v34 activeOperationalDataSet:v33 PSKC:v12 networkKey:v13 channel:v24 panID:v17 creationDate:v18 lastModificationDate:v19];

          if (!v20)
          {
LABEL_14:
            id v23 = [MEMORY[0x1E4F28C58] storeError:3 description:@"Failed to retrieve record"];
            (*(void (**)(void))(*(void *)(v25 + 32) + 16))();
            id v5 = v27;
            id v7 = v30;

            id v6 = v26;
            uint64_t v22 = obj;
            goto LABEL_15;
          }
          id v7 = v30;
          [v30 addObject:v20];

          uint64_t v9 = v32 + 1;
        }
        while (v31 != v32 + 1);
        id v8 = obj;
        id v6 = v26;
        id v5 = v27;
        a1 = v25;
        uint64_t v31 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
        if (v31) {
          continue;
        }
        break;
      }
    }

    uint64_t v21 = *(void *)(a1 + 32);
    uint64_t v22 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
    (*(void (**)(uint64_t, void *, void))(v21 + 16))(v21, v22, 0);
LABEL_15:
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)retrieveCredentialsForBorderAgent:(NSData *)borderAgentID completion:(void *)completion
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = completion;
  id v7 = borderAgentID;
  id v8 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v20 = "-[THClient retrieveCredentialsForBorderAgent:completion:]";
    __int16 v21 = 1024;
    int v22 = 775;
    _os_log_impl(&dword_1D49C1000, v8, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  uint64_t v9 = [[THThreadNetworkBorderAgent alloc] initWithBaDiscrId:v7];

  if (!v7 || !v9)
  {
    id v10 = [MEMORY[0x1E4F28C58] storeError:4 description:@"Invalid input parameter"];
    v6[2](v6, 0, v10);
  }
  id v11 = [(THClient *)self xpcConnection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __57__THClient_retrieveCredentialsForBorderAgent_completion___block_invoke;
  v17[3] = &unk_1E69FEE68;
  id v12 = v6;
  id v18 = v12;
  id v13 = [v11 remoteObjectProxyWithErrorHandler:v17];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__THClient_retrieveCredentialsForBorderAgent_completion___block_invoke_74;
  v15[3] = &unk_1E69FEFC0;
  id v16 = v12;
  id v14 = v12;
  [v13 ctcsServerRetrieveActiveDataSetRecordForThreadBorderAgent:v9 completion:v15];
}

void __57__THClient_retrieveCredentialsForBorderAgent_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __57__THClient_retrieveCredentialsForBorderAgent_completion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __57__THClient_retrieveCredentialsForBorderAgent_completion___block_invoke_74(uint64_t a1, void *a2, void *a3)
{
  id v30 = a2;
  id v5 = a3;
  if (v30)
  {
    uint64_t v27 = a1;
    id v28 = v5;
    id v6 = [THCredentials alloc];
    id v26 = [v30 network];
    uint64_t v29 = [v26 networkName];
    uint64_t v25 = [v30 network];
    __int16 v21 = [v25 extendedPANID];
    uint64_t v24 = [v30 borderAgent];
    __int16 v19 = [v24 discriminatorId];
    uint64_t v23 = [v30 credentialsDataSet];
    id v18 = [v23 dataSetArray];
    int v22 = [v30 credentials];
    id v7 = [v22 PSKc];
    id v20 = [v30 credentials];
    id v8 = [v20 masterKey];
    uint64_t v9 = [v30 credentials];
    char v10 = [v9 channel];
    id v11 = [v30 credentials];
    id v12 = [v11 PANID];
    id v13 = [v30 creationDate];
    id v14 = [v30 lastModificationDate];
    LOBYTE(v17) = v10;
    id v15 = [(THCredentials *)v6 initThreadCredentials:v29 extendedPANID:v21 borderAgentID:v19 activeOperationalDataSet:v18 PSKC:v7 networkKey:v8 channel:v17 panID:v12 creationDate:v13 lastModificationDate:v14];

    if (v15)
    {
      id v5 = v28;
      (*(void (**)(void))(*(void *)(v27 + 32) + 16))();
    }
    else
    {
      id v16 = [MEMORY[0x1E4F28C58] storeError:3 description:@"Failed to retrieve record"];
      (*(void (**)(void))(*(void *)(v27 + 32) + 16))();

      id v5 = v28;
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)retrievePreferredCredentials:(void *)completion
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = completion;
  id v5 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[THClient retrievePreferredCredentials:]";
    __int16 v16 = 1024;
    int v17 = 814;
    _os_log_impl(&dword_1D49C1000, v5, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  id v6 = [(THClient *)self xpcConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __41__THClient_retrievePreferredCredentials___block_invoke;
  v12[3] = &unk_1E69FEE68;
  id v7 = v4;
  id v13 = v7;
  id v8 = [v6 remoteObjectProxyWithErrorHandler:v12];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__THClient_retrievePreferredCredentials___block_invoke_75;
  v10[3] = &unk_1E69FEFC0;
  id v11 = v7;
  id v9 = v7;
  [v8 ctcsServerRetrievePreferredNetworkWithCompletion:v10];
}

void __41__THClient_retrievePreferredCredentials___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __41__THClient_retrievePreferredCredentials___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __41__THClient_retrievePreferredCredentials___block_invoke_75(uint64_t a1, void *a2, void *a3)
{
  id v30 = a2;
  id v5 = a3;
  if (v30)
  {
    uint64_t v27 = a1;
    id v28 = v5;
    id v6 = [THCredentials alloc];
    id v26 = [v30 network];
    uint64_t v29 = [v26 networkName];
    uint64_t v25 = [v30 network];
    __int16 v21 = [v25 extendedPANID];
    uint64_t v24 = [v30 borderAgent];
    __int16 v19 = [v24 discriminatorId];
    uint64_t v23 = [v30 credentialsDataSet];
    uint64_t v18 = [v23 dataSetArray];
    int v22 = [v30 credentials];
    id v7 = [v22 PSKc];
    id v20 = [v30 credentials];
    id v8 = [v20 masterKey];
    id v9 = [v30 credentials];
    char v10 = [v9 channel];
    id v11 = [v30 credentials];
    id v12 = [v11 PANID];
    id v13 = [v30 creationDate];
    id v14 = [v30 lastModificationDate];
    LOBYTE(v17) = v10;
    id v15 = [(THCredentials *)v6 initThreadCredentials:v29 extendedPANID:v21 borderAgentID:v19 activeOperationalDataSet:v18 PSKC:v7 networkKey:v8 channel:v17 panID:v12 creationDate:v13 lastModificationDate:v14];

    if (v15)
    {
      id v5 = v28;
      (*(void (**)(void))(*(void *)(v27 + 32) + 16))();
    }
    else
    {
      __int16 v16 = [MEMORY[0x1E4F28C58] storeError:3 description:@"Failed to retrieve record"];
      (*(void (**)(void))(*(void *)(v27 + 32) + 16))();

      id v5 = v28;
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)retrieveCredentialsForExtendedPANID:(NSData *)extendedPANID completion:(void *)completion
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = completion;
  id v7 = extendedPANID;
  id v8 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v19 = "-[THClient retrieveCredentialsForExtendedPANID:completion:]";
    __int16 v20 = 1024;
    int v21 = 843;
    _os_log_impl(&dword_1D49C1000, v8, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  if (!v7)
  {
    id v9 = [MEMORY[0x1E4F28C58] storeError:4 description:@"Invalid input parameter"];
    v6[2](v6, 0, v9);
  }
  char v10 = [(THClient *)self xpcConnection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__THClient_retrieveCredentialsForExtendedPANID_completion___block_invoke;
  v16[3] = &unk_1E69FEE68;
  id v11 = v6;
  id v17 = v11;
  id v12 = [v10 remoteObjectProxyWithErrorHandler:v16];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__THClient_retrieveCredentialsForExtendedPANID_completion___block_invoke_76;
  v14[3] = &unk_1E69FEFC0;
  id v15 = v11;
  id v13 = v11;
  [v12 ctcsServerRetrieveActiveDataSetRecordWithXPANId:v7 completion:v14];
}

void __59__THClient_retrieveCredentialsForExtendedPANID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __59__THClient_retrieveCredentialsForExtendedPANID_completion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59__THClient_retrieveCredentialsForExtendedPANID_completion___block_invoke_76(uint64_t a1, void *a2, void *a3)
{
  id v30 = a2;
  id v5 = a3;
  if (v30)
  {
    uint64_t v27 = a1;
    id v28 = v5;
    id v6 = [THCredentials alloc];
    id v26 = [v30 network];
    uint64_t v29 = [v26 networkName];
    uint64_t v25 = [v30 network];
    int v21 = [v25 extendedPANID];
    uint64_t v24 = [v30 borderAgent];
    __int16 v19 = [v24 discriminatorId];
    uint64_t v23 = [v30 credentialsDataSet];
    uint64_t v18 = [v23 dataSetArray];
    uint64_t v22 = [v30 credentials];
    id v7 = [v22 PSKc];
    __int16 v20 = [v30 credentials];
    id v8 = [v20 masterKey];
    id v9 = [v30 credentials];
    char v10 = [v9 channel];
    id v11 = [v30 credentials];
    id v12 = [v11 PANID];
    id v13 = [v30 creationDate];
    id v14 = [v30 lastModificationDate];
    LOBYTE(v17) = v10;
    id v15 = [(THCredentials *)v6 initThreadCredentials:v29 extendedPANID:v21 borderAgentID:v19 activeOperationalDataSet:v18 PSKC:v7 networkKey:v8 channel:v17 panID:v12 creationDate:v13 lastModificationDate:v14];

    if (v15)
    {
      id v5 = v28;
      (*(void (**)(void))(*(void *)(v27 + 32) + 16))();
    }
    else
    {
      __int16 v16 = [MEMORY[0x1E4F28C58] storeError:3 description:@"Failed to retrieve record"];
      (*(void (**)(void))(*(void *)(v27 + 32) + 16))();

      id v5 = v28;
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)retrievePreferredNetworkInternallyOnMdnsAndSig:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[THClient retrievePreferredNetworkInternallyOnMdnsAndSig:]";
    __int16 v16 = 1024;
    int v17 = 876;
    _os_log_impl(&dword_1D49C1000, v5, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  id v6 = [(THClient *)self xpcConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__THClient_retrievePreferredNetworkInternallyOnMdnsAndSig___block_invoke;
  v12[3] = &unk_1E69FEE68;
  id v7 = v4;
  id v13 = v7;
  id v8 = [v6 remoteObjectProxyWithErrorHandler:v12];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__THClient_retrievePreferredNetworkInternallyOnMdnsAndSig___block_invoke_77;
  v10[3] = &unk_1E69FEFC0;
  id v11 = v7;
  id v9 = v7;
  [v8 ctcsServerRetrievePreferredNetworkInternallyOnMdnsAndSigWithCompletion:v10];
}

void __59__THClient_retrievePreferredNetworkInternallyOnMdnsAndSig___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __59__THClient_retrievePreferredNetworkInternallyOnMdnsAndSig___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59__THClient_retrievePreferredNetworkInternallyOnMdnsAndSig___block_invoke_77(uint64_t a1, void *a2, void *a3)
{
  id v33 = a2;
  id v5 = a3;
  if (v33)
  {
    uint64_t v30 = a1;
    id v31 = v5;
    id v6 = [THCredentials alloc];
    uint64_t v29 = [v33 network];
    uint64_t v32 = [v29 networkName];
    id v28 = [v33 network];
    id v7 = [v28 extendedPANID];
    uint64_t v27 = [v33 borderAgent];
    id v8 = [v27 discriminatorId];
    id v26 = [v33 credentialsDataSet];
    uint64_t v23 = [v26 dataSetArray];
    uint64_t v25 = [v33 credentials];
    int v21 = [v25 PSKc];
    uint64_t v24 = [v33 credentials];
    id v9 = [v24 masterKey];
    char v10 = [v33 credentials];
    char v11 = [v10 channel];
    id v12 = [v33 credentials];
    id v13 = [v12 PANID];
    id v14 = [v33 creationDate];
    id v15 = [v33 lastModificationDate];
    LOBYTE(v20) = v11;
    id v22 = [(THCredentials *)v6 initThreadCredentials:v32 extendedPANID:v7 borderAgentID:v8 activeOperationalDataSet:v23 PSKC:v21 networkKey:v9 channel:v20 panID:v13 creationDate:v14 lastModificationDate:v15];

    if (v22)
    {
      uint64_t v16 = *(void *)(v30 + 32);
      int v17 = [v33 uniqueIdentifier];
      uint64_t v18 = *(void (**)(uint64_t, id, void *, id))(v16 + 16);
      uint64_t v19 = v16;
      id v5 = v31;
      v18(v19, v22, v17, v31);
    }
    else
    {
      int v17 = [MEMORY[0x1E4F28C58] storeError:3 description:@"Failed to retrieve record"];
      (*(void (**)(void))(*(void *)(v30 + 32) + 16))();
      id v5 = v31;
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)retrieveOrGeneratePreferredNetworkInternally:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[THClient retrieveOrGeneratePreferredNetworkInternally:]";
    __int16 v16 = 1024;
    int v17 = 905;
    _os_log_impl(&dword_1D49C1000, v5, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  id v6 = [(THClient *)self xpcConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__THClient_retrieveOrGeneratePreferredNetworkInternally___block_invoke;
  v12[3] = &unk_1E69FEE68;
  id v7 = v4;
  id v13 = v7;
  id v8 = [v6 remoteObjectProxyWithErrorHandler:v12];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__THClient_retrieveOrGeneratePreferredNetworkInternally___block_invoke_78;
  v10[3] = &unk_1E69FEFC0;
  id v11 = v7;
  id v9 = v7;
  [v8 ctcsServerRetrieveOrGeneratePreferredNetworkInternallyWithCompletion:v10];
}

void __57__THClient_retrieveOrGeneratePreferredNetworkInternally___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __57__THClient_retrieveOrGeneratePreferredNetworkInternally___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __57__THClient_retrieveOrGeneratePreferredNetworkInternally___block_invoke_78(uint64_t a1, void *a2, void *a3)
{
  id v33 = a2;
  id v5 = a3;
  if (v33)
  {
    uint64_t v30 = a1;
    id v31 = v5;
    id v6 = [THCredentials alloc];
    uint64_t v29 = [v33 network];
    uint64_t v32 = [v29 networkName];
    id v28 = [v33 network];
    id v7 = [v28 extendedPANID];
    uint64_t v27 = [v33 borderAgent];
    id v8 = [v27 discriminatorId];
    id v26 = [v33 credentialsDataSet];
    uint64_t v23 = [v26 dataSetArray];
    uint64_t v25 = [v33 credentials];
    int v21 = [v25 PSKc];
    uint64_t v24 = [v33 credentials];
    id v9 = [v24 masterKey];
    char v10 = [v33 credentials];
    char v11 = [v10 channel];
    id v12 = [v33 credentials];
    id v13 = [v12 PANID];
    id v14 = [v33 creationDate];
    id v15 = [v33 lastModificationDate];
    LOBYTE(v20) = v11;
    id v22 = [(THCredentials *)v6 initThreadCredentials:v32 extendedPANID:v7 borderAgentID:v8 activeOperationalDataSet:v23 PSKC:v21 networkKey:v9 channel:v20 panID:v13 creationDate:v14 lastModificationDate:v15];

    if (v22)
    {
      uint64_t v16 = *(void *)(v30 + 32);
      int v17 = [v33 uniqueIdentifier];
      uint64_t v18 = *(void (**)(uint64_t, id, void *, id))(v16 + 16);
      uint64_t v19 = v16;
      id v5 = v31;
      v18(v19, v22, v17, v31);
    }
    else
    {
      int v17 = [MEMORY[0x1E4F28C58] storeError:3 description:@"Failed to retrieve record"];
      (*(void (**)(void))(*(void *)(v30 + 32) + 16))();
      id v5 = v31;
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)retrievePreferredCredentialsInternally:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[THClient retrievePreferredCredentialsInternally:]";
    __int16 v16 = 1024;
    int v17 = 934;
    _os_log_impl(&dword_1D49C1000, v5, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  id v6 = [(THClient *)self xpcConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__THClient_retrievePreferredCredentialsInternally___block_invoke;
  v12[3] = &unk_1E69FEE68;
  id v7 = v4;
  id v13 = v7;
  id v8 = [v6 remoteObjectProxyWithErrorHandler:v12];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__THClient_retrievePreferredCredentialsInternally___block_invoke_79;
  v10[3] = &unk_1E69FEFC0;
  id v11 = v7;
  id v9 = v7;
  [v8 ctcsServerRetrievePreferredNetworkInternallyWithCompletion:v10];
}

void __51__THClient_retrievePreferredCredentialsInternally___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __51__THClient_retrievePreferredCredentialsInternally___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __51__THClient_retrievePreferredCredentialsInternally___block_invoke_79(uint64_t a1, void *a2, void *a3)
{
  id v33 = a2;
  id v5 = a3;
  if (v33)
  {
    uint64_t v30 = a1;
    id v31 = v5;
    id v6 = [THCredentials alloc];
    uint64_t v29 = [v33 network];
    uint64_t v32 = [v29 networkName];
    id v28 = [v33 network];
    id v7 = [v28 extendedPANID];
    uint64_t v27 = [v33 borderAgent];
    id v8 = [v27 discriminatorId];
    id v26 = [v33 credentialsDataSet];
    uint64_t v23 = [v26 dataSetArray];
    uint64_t v25 = [v33 credentials];
    int v21 = [v25 PSKc];
    uint64_t v24 = [v33 credentials];
    id v9 = [v24 masterKey];
    char v10 = [v33 credentials];
    char v11 = [v10 channel];
    id v12 = [v33 credentials];
    id v13 = [v12 PANID];
    id v14 = [v33 creationDate];
    id v15 = [v33 lastModificationDate];
    LOBYTE(v20) = v11;
    id v22 = [(THCredentials *)v6 initThreadCredentials:v32 extendedPANID:v7 borderAgentID:v8 activeOperationalDataSet:v23 PSKC:v21 networkKey:v9 channel:v20 panID:v13 creationDate:v14 lastModificationDate:v15];

    if (v22)
    {
      uint64_t v16 = *(void *)(v30 + 32);
      int v17 = [v33 uniqueIdentifier];
      uint64_t v18 = *(void (**)(uint64_t, id, void *, id))(v16 + 16);
      uint64_t v19 = v16;
      id v5 = v31;
      v18(v19, v22, v17, v31);
    }
    else
    {
      int v17 = [MEMORY[0x1E4F28C58] storeError:3 description:@"Failed to retrieve record"];
      (*(void (**)(void))(*(void *)(v30 + 32) + 16))();
      id v5 = v31;
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)retrieveCredentialsForUUID:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void, void *))a4;
  id v7 = a3;
  id v8 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v19 = "-[THClient retrieveCredentialsForUUID:completion:]";
    __int16 v20 = 1024;
    int v21 = 963;
    _os_log_impl(&dword_1D49C1000, v8, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  if (!v7)
  {
    id v9 = [MEMORY[0x1E4F28C58] storeError:4 description:@"Invalid input parameter"];
    v6[2](v6, 0, v9);
  }
  char v10 = [(THClient *)self xpcConnection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __50__THClient_retrieveCredentialsForUUID_completion___block_invoke;
  v16[3] = &unk_1E69FEE68;
  char v11 = v6;
  id v17 = v11;
  id v12 = [v10 remoteObjectProxyWithErrorHandler:v16];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__THClient_retrieveCredentialsForUUID_completion___block_invoke_80;
  v14[3] = &unk_1E69FEFC0;
  id v15 = v11;
  id v13 = v11;
  [v12 ctcsServerRetrieveActiveDataSetRecordWithUniqueIdentifier:v7 completion:v14];
}

void __50__THClient_retrieveCredentialsForUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __50__THClient_retrieveCredentialsForUUID_completion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __50__THClient_retrieveCredentialsForUUID_completion___block_invoke_80(uint64_t a1, void *a2, void *a3)
{
  id v30 = a2;
  id v5 = a3;
  if (v30)
  {
    uint64_t v27 = a1;
    id v28 = v5;
    id v6 = [THCredentials alloc];
    id v26 = [v30 network];
    uint64_t v29 = [v26 networkName];
    uint64_t v25 = [v30 network];
    int v21 = [v25 extendedPANID];
    uint64_t v24 = [v30 borderAgent];
    uint64_t v19 = [v24 discriminatorId];
    uint64_t v23 = [v30 credentialsDataSet];
    uint64_t v18 = [v23 dataSetArray];
    uint64_t v22 = [v30 credentials];
    id v7 = [v22 PSKc];
    __int16 v20 = [v30 credentials];
    id v8 = [v20 masterKey];
    id v9 = [v30 credentials];
    char v10 = [v9 channel];
    char v11 = [v30 credentials];
    id v12 = [v11 PANID];
    id v13 = [v30 creationDate];
    id v14 = [v30 lastModificationDate];
    LOBYTE(v17) = v10;
    id v15 = [(THCredentials *)v6 initThreadCredentials:v29 extendedPANID:v21 borderAgentID:v19 activeOperationalDataSet:v18 PSKC:v7 networkKey:v8 channel:v17 panID:v12 creationDate:v13 lastModificationDate:v14];

    if (v15)
    {
      id v5 = v28;
      (*(void (**)(void))(*(void *)(v27 + 32) + 16))();
    }
    else
    {
      uint64_t v16 = [MEMORY[0x1E4F28C58] storeError:3 description:@"Failed to retrieve record"];
      (*(void (**)(void))(*(void *)(v27 + 32) + 16))();

      id v5 = v28;
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)checkPreferredNetworkForActiveOperationalDataset:(NSData *)activeOperationalDataSet completion:(void *)completion
{
  id v6 = activeOperationalDataSet;
  id v7 = completion;
  if (v6)
  {
    id v8 = [(THClient *)self xpcConnection];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __72__THClient_checkPreferredNetworkForActiveOperationalDataset_completion___block_invoke;
    v15[3] = &unk_1E69FEE68;
    id v9 = v7;
    id v16 = v9;
    char v10 = [v8 remoteObjectProxyWithErrorHandler:v15];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __72__THClient_checkPreferredNetworkForActiveOperationalDataset_completion___block_invoke_81;
    v13[3] = &unk_1E69FEFE8;
    id v14 = v9;
    [v10 ctcsIsPreferredNetworkForActiveOperationalDataset:v6 completion:v13];

    char v11 = v16;
  }
  else
  {
    char v11 = [MEMORY[0x1E4F28C58] storeError:4 description:@"Invalid input parameter"];
    id v12 = ThreadNetworkLoggingCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[THClient checkPreferredNetworkForActiveOperationalDataset:completion:]();
    }
    (*((void (**)(void *, void))v7 + 2))(v7, 0);
  }
}

void __72__THClient_checkPreferredNetworkForActiveOperationalDataset_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __72__THClient_checkPreferredNetworkForActiveOperationalDataset_completion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __72__THClient_checkPreferredNetworkForActiveOperationalDataset_completion___block_invoke_81(uint64_t a1, char a2)
{
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __72__THClient_checkPreferredNetworkForActiveOperationalDataset_completion___block_invoke_81_cold_1(a2, v4);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)ctcsAddPreferredNetworkWithCompletionInternally:(id)a3 extendedPANId:(id)a4 borderAgentID:(id)a5 ipV4NwSignature:(id)a6 ipv6NwSignature:(id)a7 wifiSSID:(id)a8 wifiPassword:(id)a9 completion:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v34 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  if (v16 && v17)
  {
    uint64_t v23 = [(THClient *)self xpcConnection];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __153__THClient_ctcsAddPreferredNetworkWithCompletionInternally_extendedPANId_borderAgentID_ipV4NwSignature_ipv6NwSignature_wifiSSID_wifiPassword_completion___block_invoke;
    v37[3] = &unk_1E69FEE68;
    id v24 = v22;
    id v38 = v24;
    [v23 remoteObjectProxyWithErrorHandler:v37];
    id v33 = v16;
    id v25 = v17;
    id v26 = v21;
    id v27 = v20;
    id v28 = v19;
    v30 = id v29 = v18;

    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __153__THClient_ctcsAddPreferredNetworkWithCompletionInternally_extendedPANId_borderAgentID_ipV4NwSignature_ipv6NwSignature_wifiSSID_wifiPassword_completion___block_invoke_82;
    v35[3] = &unk_1E69FEE68;
    id v36 = v24;
    [v30 ctcsServerAddPreferredNetworkWithCompletionInternally:v33 extendedPANId:v25 borderAgentID:v29 ipV4NwSignature:v34 ipv6NwSignature:v28 wifiSSID:v27 wifiPassword:v26 completion:v35];

    id v18 = v29;
    id v19 = v28;
    id v20 = v27;
    id v21 = v26;
    id v17 = v25;
    id v16 = v33;
    id v31 = v38;
  }
  else
  {
    id v31 = [MEMORY[0x1E4F28C58] storeError:4 description:@"Invalid input parameter"];
    uint64_t v32 = ThreadNetworkLoggingCategory(0);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[THClient ctcsAddPreferredNetworkWithCompletionInternally:extendedPANId:borderAgentID:ipV4NwSignature:ipv6NwSignature:wifiSSID:wifiPassword:completion:]();
    }
    (*((void (**)(id, void *))v22 + 2))(v22, v31);
  }
}

void __153__THClient_ctcsAddPreferredNetworkWithCompletionInternally_extendedPANId_borderAgentID_ipV4NwSignature_ipv6NwSignature_wifiSSID_wifiPassword_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __153__THClient_ctcsAddPreferredNetworkWithCompletionInternally_extendedPANId_borderAgentID_ipV4NwSignature_ipv6NwSignature_wifiSSID_wifiPassword_completion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __153__THClient_ctcsAddPreferredNetworkWithCompletionInternally_extendedPANId_borderAgentID_ipV4NwSignature_ipv6NwSignature_wifiSSID_wifiPassword_completion___block_invoke_82(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __153__THClient_ctcsAddPreferredNetworkWithCompletionInternally_extendedPANId_borderAgentID_ipV4NwSignature_ipv6NwSignature_wifiSSID_wifiPassword_completion___block_invoke_82_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)ctcsDeletePreferredNetworkForNetworkSignatureInternallyWithCompletion:(id)a3 ipv6NwSignature:(id)a4 wifiSSID:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(THClient *)self xpcConnection];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __118__THClient_ctcsDeletePreferredNetworkForNetworkSignatureInternallyWithCompletion_ipv6NwSignature_wifiSSID_completion___block_invoke;
  v20[3] = &unk_1E69FEE68;
  id v15 = v10;
  id v21 = v15;
  id v16 = [v14 remoteObjectProxyWithErrorHandler:v20];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __118__THClient_ctcsDeletePreferredNetworkForNetworkSignatureInternallyWithCompletion_ipv6NwSignature_wifiSSID_completion___block_invoke_83;
  v18[3] = &unk_1E69FEE68;
  id v19 = v15;
  id v17 = v15;
  [v16 ctcsServerDeletePreferredNetworkForNetworkSignatureInternallyWithCompletion:v13 ipv6NwSignature:v12 wifiSSID:v11 completion:v18];
}

void __118__THClient_ctcsDeletePreferredNetworkForNetworkSignatureInternallyWithCompletion_ipv6NwSignature_wifiSSID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __118__THClient_ctcsDeletePreferredNetworkForNetworkSignatureInternallyWithCompletion_ipv6NwSignature_wifiSSID_completion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __118__THClient_ctcsDeletePreferredNetworkForNetworkSignatureInternallyWithCompletion_ipv6NwSignature_wifiSSID_completion___block_invoke_83(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __118__THClient_ctcsDeletePreferredNetworkForNetworkSignatureInternallyWithCompletion_ipv6NwSignature_wifiSSID_completion___block_invoke_83_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)retrieveAllActiveCredentials:(void *)completion
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = completion;
  id v5 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[THClient retrieveAllActiveCredentials:]";
    __int16 v16 = 1024;
    int v17 = 1059;
    _os_log_impl(&dword_1D49C1000, v5, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  id v6 = [(THClient *)self xpcConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __41__THClient_retrieveAllActiveCredentials___block_invoke;
  v12[3] = &unk_1E69FEE68;
  id v7 = v4;
  id v13 = v7;
  id v8 = [v6 remoteObjectProxyWithErrorHandler:v12];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__THClient_retrieveAllActiveCredentials___block_invoke_84;
  v10[3] = &unk_1E69FF010;
  id v11 = v7;
  id v9 = v7;
  [v8 ctcsServerRetrieveAllActiveDataSetRecordsWithActiveFlag:1 completion:v10];
}

void __41__THClient_retrieveAllActiveCredentials___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __41__THClient_retrieveAllActiveCredentials___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __41__THClient_retrieveAllActiveCredentials___block_invoke_84(uint64_t a1, void *a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5 && [v5 count])
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v8 = v5;
    uint64_t v31 = [v8 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v31)
    {
      uint64_t v29 = *(void *)v44;
      id v30 = v7;
      id v26 = v6;
      id v27 = v5;
      uint64_t v25 = a1;
      id obj = v8;
      while (2)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v44 != v29) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v43 + 1) + 8 * v9);
          if (!v10) {
            goto LABEL_14;
          }
          uint64_t v32 = v9;
          id v11 = [THCredentials alloc];
          uint64_t v40 = [v10 network];
          v42 = [v40 networkName];
          v39 = [v10 network];
          v41 = [v39 extendedPANID];
          id v38 = [v10 borderAgent];
          id v34 = [v38 discriminatorId];
          id v37 = [v10 credentialsDataSet];
          id v33 = [v37 dataSetArray];
          id v36 = [v10 credentials];
          id v12 = [v36 PSKc];
          v35 = [v10 credentials];
          id v13 = [v35 masterKey];
          id v14 = [v10 credentials];
          char v15 = [v14 channel];
          __int16 v16 = [v10 credentials];
          int v17 = [v16 PANID];
          uint64_t v18 = [v10 creationDate];
          id v19 = [v10 lastModificationDate];
          LOBYTE(v24) = v15;
          id v20 = [(THCredentials *)v11 initThreadCredentials:v42 extendedPANID:v41 borderAgentID:v34 activeOperationalDataSet:v33 PSKC:v12 networkKey:v13 channel:v24 panID:v17 creationDate:v18 lastModificationDate:v19];

          if (!v20)
          {
LABEL_14:
            uint64_t v23 = [MEMORY[0x1E4F28C58] storeError:3 description:@"Failed to retrieve record"];
            (*(void (**)(void))(*(void *)(v25 + 32) + 16))();
            id v5 = v27;
            id v7 = v30;

            id v6 = v26;
            id v22 = obj;
            goto LABEL_15;
          }
          id v7 = v30;
          [v30 addObject:v20];

          uint64_t v9 = v32 + 1;
        }
        while (v31 != v32 + 1);
        id v8 = obj;
        id v6 = v26;
        id v5 = v27;
        a1 = v25;
        uint64_t v31 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
        if (v31) {
          continue;
        }
        break;
      }
    }

    uint64_t v21 = *(void *)(a1 + 32);
    id v22 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
    (*(void (**)(uint64_t, void *, void))(v21 + 16))(v21, v22, 0);
LABEL_15:
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)isPreferredNetworkAvailableWithCompletion:(void *)completion
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = completion;
  id v5 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    char v15 = "-[THClient isPreferredNetworkAvailableWithCompletion:]";
    __int16 v16 = 1024;
    int v17 = 1103;
    _os_log_impl(&dword_1D49C1000, v5, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  id v6 = [(THClient *)self xpcConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__THClient_isPreferredNetworkAvailableWithCompletion___block_invoke;
  v12[3] = &unk_1E69FEE68;
  id v7 = v4;
  id v13 = v7;
  id v8 = [v6 remoteObjectProxyWithErrorHandler:v12];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__THClient_isPreferredNetworkAvailableWithCompletion___block_invoke_85;
  v10[3] = &unk_1E69FEFE8;
  id v11 = v7;
  id v9 = v7;
  [v8 ctcsServerRetrieveIsPreferredNetworkAvailable:v10];
}

void __54__THClient_isPreferredNetworkAvailableWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__THClient_isPreferredNetworkAvailableWithCompletion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __54__THClient_isPreferredNetworkAvailableWithCompletion___block_invoke_85(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315650;
    id v7 = "-[THClient isPreferredNetworkAvailableWithCompletion:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 1113;
    __int16 v10 = 1024;
    int v11 = a2;
    _os_log_impl(&dword_1D49C1000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d: - Response: isPreferredAvailable : %d", (uint8_t *)&v6, 0x18u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)retrievePreferredNetworkWithNoScan:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    char v15 = "-[THClient retrievePreferredNetworkWithNoScan:]";
    __int16 v16 = 1024;
    int v17 = 1120;
    _os_log_impl(&dword_1D49C1000, v5, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  int v6 = [(THClient *)self xpcConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__THClient_retrievePreferredNetworkWithNoScan___block_invoke;
  v12[3] = &unk_1E69FEE68;
  id v7 = v4;
  id v13 = v7;
  __int16 v8 = [v6 remoteObjectProxyWithErrorHandler:v12];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__THClient_retrievePreferredNetworkWithNoScan___block_invoke_86;
  v10[3] = &unk_1E69FEFC0;
  id v11 = v7;
  id v9 = v7;
  [v8 ctcsServerRetrievePreferredNetworkWithNoScanWithCompletion:v10];
}

void __47__THClient_retrievePreferredNetworkWithNoScan___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __47__THClient_retrievePreferredNetworkWithNoScan___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __47__THClient_retrievePreferredNetworkWithNoScan___block_invoke_86(uint64_t a1, void *a2, void *a3)
{
  id v33 = a2;
  id v5 = a3;
  if (v33)
  {
    uint64_t v30 = a1;
    id v31 = v5;
    int v6 = [THCredentials alloc];
    uint64_t v29 = [v33 network];
    uint64_t v32 = [v29 networkName];
    id v28 = [v33 network];
    id v7 = [v28 extendedPANID];
    id v27 = [v33 borderAgent];
    __int16 v8 = [v27 discriminatorId];
    id v26 = [v33 credentialsDataSet];
    uint64_t v23 = [v26 dataSetArray];
    uint64_t v25 = [v33 credentials];
    uint64_t v21 = [v25 PSKc];
    uint64_t v24 = [v33 credentials];
    id v9 = [v24 masterKey];
    __int16 v10 = [v33 credentials];
    char v11 = [v10 channel];
    uint64_t v12 = [v33 credentials];
    id v13 = [v12 PANID];
    id v14 = [v33 creationDate];
    char v15 = [v33 lastModificationDate];
    LOBYTE(v20) = v11;
    id v22 = [(THCredentials *)v6 initThreadCredentials:v32 extendedPANID:v7 borderAgentID:v8 activeOperationalDataSet:v23 PSKC:v21 networkKey:v9 channel:v20 panID:v13 creationDate:v14 lastModificationDate:v15];

    if (v22)
    {
      uint64_t v16 = *(void *)(v30 + 32);
      int v17 = [v33 uniqueIdentifier];
      uint64_t v18 = *(void (**)(uint64_t, id, void *, id))(v16 + 16);
      uint64_t v19 = v16;
      id v5 = v31;
      v18(v19, v22, v17, v31);
    }
    else
    {
      int v17 = [MEMORY[0x1E4F28C58] storeError:3 description:@"Failed to retrieve record"];
      (*(void (**)(void))(*(void *)(v30 + 32) + 16))();
      id v5 = v31;
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (dispatch_queue_s)threadSafePropertyQueue
{
  return self->_threadSafePropertyQueue;
}

- (void)setThreadSafePropertyQueue:(dispatch_queue_s *)a3
{
  self->_threadSafePropertyQueue = a3;
}

- (void).cxx_destruct
{
}

- (void)init
{
}

- (void)initWithKeychainAccessGroup:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __53__THClient_pingXPCServiceWithClientProxy_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1D49C1000, log, OS_LOG_TYPE_ERROR, "Failed to ping service.", v1, 2u);
}

void __31__THClient_connectToXPCService__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __31__THClient_connectToXPCService__block_invoke_7_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __22__THClient_invalidate__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1D49C1000, log, OS_LOG_TYPE_ERROR, "Invalidating XPC connection.", v1, 2u);
}

void __51__THClient_synchronousClientProxyWithErrorHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)performXPCRequestBlock:(void *)a1 timeout:(uint8_t *)buf error:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1D49C1000, log, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
}

void __45__THClient_getConnectionEntitlementValidity___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D49C1000, v0, v1, "Client: %s - clientProxyWithErrorHandler Error: %@", v2, v3, v4, v5, 2u);
}

void __45__THClient_getConnectionEntitlementValidity___block_invoke_38_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D49C1000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
}

void __44__THClient_getConnectionEntitlementValidity__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D49C1000, v0, v1, "Client: %s - clientProxyWithErrorHandler Error: %@", v2, v3, v4, v5, 2u);
}

void __44__THClient_getConnectionEntitlementValidity__block_invoke_39_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D49C1000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
}

void __118__THClient_ctcsStoreThreadNetworkCredentialActiveDataSetInternally_network_credentialsDataSet_waitForSync_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D49C1000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
}

void __73__THClient_ctcsDeleteActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D49C1000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
}

void __75__THClient_ctcsRetrieveActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D49C1000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
}

void __65__THClient_ctcsRetrievePreferredNetworkInternallyWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D49C1000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
}

void __75__THClient_ctcsRetrieveOrGeneratePreferredNetworkInternallyWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D49C1000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
}

void __53__THClient_ctcsDeletePreferredNetworkWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D49C1000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
}

void __68__THClient_ctcsCleanPreferredAndFrozenThreadNetworksWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D49C1000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
}

void __58__THClient_ctcsCleanKeychainThreadNetworksWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D49C1000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
}

void __115__THClient_storeCredentialsForBorderAgentInternally_networkName_extendedPANId_activeOperationalDataSet_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1D49C1000, v0, v1, "%s:%d: - Error: %@", v2, v3, v4, v5, 2u);
}

void __77__THClient_retrieveActiveDataSetRecordInternallyForExtendedPANID_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D49C1000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
}

void __49__THClient_updatePreferredCredentialsInternally___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D49C1000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
}

void __45__THClient_validateAODInternally_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D49C1000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
}

void __55__THClient_deleteCredentialsForBorderAgent_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D49C1000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
}

void __79__THClient_storeCredentialsForBorderAgent_activeOperationalDataSet_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1D49C1000, v0, v1, "%s:%d: - Error: %@", v2, v3, v4, v5, 2u);
}

void __79__THClient_storeCredentialsForBorderAgent_activeOperationalDataSet_completion___block_invoke_68_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1D49C1000, v0, v1, "%s:%d: - Response: %@", v2, v3, v4, v5, 2u);
}

void __56__THClient_storeCachedAODasPreferredNetwork_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1D49C1000, v0, v1, "%s:%d: - Error: %@", v2, v3, v4, v5, 2u);
}

void __56__THClient_storeCachedAODasPreferredNetwork_completion___block_invoke_69_cold_1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 136315906;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl(&dword_1D49C1000, v2, OS_LOG_TYPE_ERROR, "%s:%d: - Response: recordUniqueIdentifier %@ error %@", (uint8_t *)v3, 0x26u);
}

void __35__THClient_retrieveAllCredentials___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D49C1000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
}

void __57__THClient_retrieveCredentialsForBorderAgent_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D49C1000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
}

void __41__THClient_retrievePreferredCredentials___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D49C1000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
}

void __59__THClient_retrieveCredentialsForExtendedPANID_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D49C1000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
}

void __59__THClient_retrievePreferredNetworkInternallyOnMdnsAndSig___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D49C1000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
}

void __57__THClient_retrieveOrGeneratePreferredNetworkInternally___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D49C1000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
}

void __51__THClient_retrievePreferredCredentialsInternally___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D49C1000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
}

void __50__THClient_retrieveCredentialsForUUID_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D49C1000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
}

- (void)checkPreferredNetworkForActiveOperationalDataset:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1D49C1000, v0, v1, "%s:%d: - Error: %@", v2, v3, v4, v5, 2u);
}

void __72__THClient_checkPreferredNetworkForActiveOperationalDataset_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1D49C1000, v0, v1, "%s:%d: - Error: %@", v2, v3, v4, v5, 2u);
}

void __72__THClient_checkPreferredNetworkForActiveOperationalDataset_completion___block_invoke_81_cold_1(char a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = "-[THClient checkPreferredNetworkForActiveOperationalDataset:completion:]_block_invoke";
  __int16 v4 = 1024;
  int v5 = 1011;
  __int16 v6 = 1024;
  int v7 = a1 & 1;
  _os_log_error_impl(&dword_1D49C1000, a2, OS_LOG_TYPE_ERROR, "%s:%d: - Response: isPreferred : %d", (uint8_t *)&v2, 0x18u);
}

- (void)ctcsAddPreferredNetworkWithCompletionInternally:extendedPANId:borderAgentID:ipV4NwSignature:ipv6NwSignature:wifiSSID:wifiPassword:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1D49C1000, v0, v1, "%s:%d: - Error: %@", v2, v3, v4, v5, 2u);
}

void __153__THClient_ctcsAddPreferredNetworkWithCompletionInternally_extendedPANId_borderAgentID_ipV4NwSignature_ipv6NwSignature_wifiSSID_wifiPassword_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1D49C1000, v0, v1, "%s:%d: - Error: %@", v2, v3, v4, v5, 2u);
}

void __153__THClient_ctcsAddPreferredNetworkWithCompletionInternally_extendedPANId_borderAgentID_ipV4NwSignature_ipv6NwSignature_wifiSSID_wifiPassword_completion___block_invoke_82_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1D49C1000, v0, v1, "%s:%d: - Completion with error : %@", v2, v3, v4, v5, 2u);
}

void __118__THClient_ctcsDeletePreferredNetworkForNetworkSignatureInternallyWithCompletion_ipv6NwSignature_wifiSSID_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1D49C1000, v0, v1, "%s:%d: - Error: %@", v2, v3, v4, v5, 2u);
}

void __118__THClient_ctcsDeletePreferredNetworkForNetworkSignatureInternallyWithCompletion_ipv6NwSignature_wifiSSID_completion___block_invoke_83_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1D49C1000, v0, v1, "%s:%d: - Completion with error : %@", v2, v3, v4, v5, 2u);
}

void __41__THClient_retrieveAllActiveCredentials___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D49C1000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
}

void __54__THClient_isPreferredNetworkAvailableWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D49C1000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
}

void __47__THClient_retrievePreferredNetworkWithNoScan___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D49C1000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
}

@end