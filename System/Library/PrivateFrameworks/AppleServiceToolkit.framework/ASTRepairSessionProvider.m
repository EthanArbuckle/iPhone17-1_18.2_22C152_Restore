@interface ASTRepairSessionProvider
- (ASTRepairDelegateProtocol)delegate;
- (ASTRepairDelegateProtocol)listenerConnection;
- (ASTRepairProtocol)clientConnection;
- (ASTRepairProtocol)receiver;
- (ASTRepairSessionProvider)initWithServiceName:(id)a3;
- (ASTRepairSessionProvider)initWithServiceName:(id)a3 entitlements:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSArray)entitlements;
- (NSString)serviceName;
- (NSXPCConnection)connection;
- (NSXPCListener)listener;
- (OS_dispatch_queue)serviceCheckQueue;
- (void)cancelSuite;
- (void)completeTestSuite:(id)a3 description:(id)a4;
- (void)endWithCompletionHandler:(id)a3;
- (void)establishConnectionWithCompletionHandler:(id)a3;
- (void)estimatedTimeRemainingForTest:(id)a3 completion:(id)a4;
- (void)ping:(id)a3;
- (void)progressForTest:(id)a3 completion:(id)a4;
- (void)requestAsset:(id)a3 withCompletion:(id)a4;
- (void)requestSuiteResult:(id)a3 withCompletion:(id)a4;
- (void)requestSuiteStart:(id)a3 withCompletionHandler:(id)a4;
- (void)requestSuitesAvailableWithCompletionHandler:(id)a3;
- (void)sendTestResult:(id)a3 withCompletion:(id)a4;
- (void)setClientConnection:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEntitlements:(id)a3;
- (void)setListener:(id)a3;
- (void)setListenerConnection:(id)a3;
- (void)setReceiver:(id)a3;
- (void)setServiceCheckQueue:(id)a3;
- (void)setServiceName:(id)a3;
- (void)showInstructionalPrompt:(id)a3 withConfirmation:(id)a4;
- (void)startListening;
- (void)startTest:(id)a3 parameters:(id)a4;
- (void)startWithCompletionHandler:(id)a3;
- (void)updateTestSuiteImage:(id)a3;
- (void)updateTestSuiteProgress:(id)a3;
@end

@implementation ASTRepairSessionProvider

- (ASTRepairSessionProvider)initWithServiceName:(id)a3
{
  return [(ASTRepairSessionProvider *)self initWithServiceName:a3 entitlements:0];
}

- (ASTRepairSessionProvider)initWithServiceName:(id)a3 entitlements:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ASTRepairSessionProvider;
  v8 = [(ASTRepairSessionProvider *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(ASTRepairSessionProvider *)v8 setServiceName:v6];
    [(ASTRepairSessionProvider *)v9 setEntitlements:v7];
  }

  return v9;
}

- (void)setClientConnection:(id)a3
{
  objc_storeStrong((id *)&self->_clientConnection, a3);
  id v5 = a3;
  [(ASTRepairSessionProvider *)self setReceiver:v5];
}

- (void)setListenerConnection:(id)a3
{
  objc_storeStrong((id *)&self->_listenerConnection, a3);
  id v5 = a3;
  [(ASTRepairSessionProvider *)self setDelegate:v5];
}

- (void)establishConnectionWithCompletionHandler:(id)a3
{
  v49[1] = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void *))a3;
  id v5 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ASTRepairSessionProvider establishConnectionWithCompletionHandler:]";
    _os_log_impl(&dword_23CA80000, v5, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", (uint8_t *)&buf, 0xCu);
  }

  id v6 = objc_alloc(MEMORY[0x263F08D68]);
  id v7 = [(ASTRepairSessionProvider *)self serviceName];
  v8 = (void *)[v6 initWithMachServiceName:v7 options:4096];

  v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F0BA0A8];
  v10 = (void *)MEMORY[0x263EFFA08];
  v49[0] = objc_opt_class();
  objc_super v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:1];
  v12 = [v10 setWithArray:v11];
  [v9 setClasses:v12 forSelector:sel_requestSuiteStart_withCompletionHandler_ argumentIndex:0 ofReply:0];

  v13 = (void *)MEMORY[0x263EFFA08];
  v48[0] = objc_opt_class();
  v48[1] = objc_opt_class();
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:2];
  v15 = [v13 setWithArray:v14];
  [v9 setClasses:v15 forSelector:sel_requestSuitesAvailableWithCompletionHandler_ argumentIndex:0 ofReply:1];

  [v8 setRemoteObjectInterface:v9];
  v16 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F0BB7B8];
  [v8 setExportedInterface:v16];
  [v8 setExportedObject:self];
  [v8 activate];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy_;
  v46 = __Block_byref_object_dispose_;
  id v47 = 0;
  objc_initWeak(&location, self);
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __69__ASTRepairSessionProvider_establishConnectionWithCompletionHandler___block_invoke;
  v40[3] = &unk_264E7D950;
  v40[4] = &buf;
  objc_copyWeak(&v41, &location);
  v17 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v40];
  uint64_t v18 = *(void *)(*((void *)&buf + 1) + 40);
  if (v17)
  {
    if (!v18)
    {
      v19 = ASTLogHandleForCategory(0);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_23CA80000, v19, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] Establishing connection...", v34, 2u);
      }

      v20 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Diagnostics.ServiceAliveCheckQueue", MEMORY[0x263EF83A8]);
      serviceCheckQueue = self->_serviceCheckQueue;
      self->_serviceCheckQueue = v20;

      *(void *)v34 = 0;
      v35 = v34;
      uint64_t v36 = 0x3032000000;
      v37 = __Block_byref_object_copy_;
      v38 = __Block_byref_object_dispose_;
      dispatch_semaphore_t v39 = dispatch_semaphore_create(0);
      v22 = self->_serviceCheckQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __69__ASTRepairSessionProvider_establishConnectionWithCompletionHandler___block_invoke_56;
      block[3] = &unk_264E7D9A0;
      id v23 = v17;
      id v32 = v23;
      v33 = v34;
      dispatch_async(v22, block);
      v24 = *((void *)v35 + 5);
      dispatch_time_t v25 = dispatch_time(0, 2000000000);
      if (dispatch_semaphore_wait(v24, v25))
      {
        v26 = [MEMORY[0x263F087E8] errorWithDomain:@"ASTErrorDomain" code:-6000 userInfo:0];
        v4[2](v4, v26);
      }
      else
      {
        v29 = ASTLogHandleForCategory(0);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30[0] = 0;
          _os_log_impl(&dword_23CA80000, v29, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] Connection established!", (uint8_t *)v30, 2u);
        }

        [(ASTRepairSessionProvider *)self setConnection:v8];
        [(ASTRepairSessionProvider *)self setClientConnection:v23];
        v4[2](v4, 0);
      }

      _Block_object_dispose(v34, 8);
      goto LABEL_18;
    }
LABEL_10:
    ((void (*)(void (**)(id, void *)))v4[2])(v4);
    goto LABEL_18;
  }
  if (v18) {
    goto LABEL_10;
  }
  v27 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v34 = 0;
    _os_log_impl(&dword_23CA80000, v27, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] Unknown error while creating connection..", v34, 2u);
  }

  v28 = [MEMORY[0x263F087E8] errorWithDomain:@"ASTErrorDomain" code:-1 userInfo:0];
  v4[2](v4, v28);

LABEL_18:
  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);
}

void __69__ASTRepairSessionProvider_establishConnectionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  v3 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [WeakRetained delegate];

  if (v5)
  {
    id v6 = objc_loadWeakRetained(v3);
    [v6 setConnection:0];
  }
}

uint64_t __69__ASTRepairSessionProvider_establishConnectionWithCompletionHandler___block_invoke_56(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __69__ASTRepairSessionProvider_establishConnectionWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_264E7D978;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 ping:v3];
}

intptr_t __69__ASTRepairSessionProvider_establishConnectionWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
}

- (void)startWithCompletionHandler:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    v8 = "-[ASTRepairSessionProvider startWithCompletionHandler:]";
    _os_log_impl(&dword_23CA80000, v5, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(ASTRepairSessionProvider *)self receiver];
  [v6 startWithCompletionHandler:v4];
}

- (void)endWithCompletionHandler:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    v8 = "-[ASTRepairSessionProvider endWithCompletionHandler:]";
    _os_log_impl(&dword_23CA80000, v5, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(ASTRepairSessionProvider *)self receiver];
  [v6 endWithCompletionHandler:v4];
}

- (void)requestSuitesAvailableWithCompletionHandler:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    v8 = "-[ASTRepairSessionProvider requestSuitesAvailableWithCompletionHandler:]";
    _os_log_impl(&dword_23CA80000, v5, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(ASTRepairSessionProvider *)self receiver];
  [v6 requestSuitesAvailableWithCompletionHandler:v4];
}

- (void)requestSuiteStart:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  v8 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    objc_super v11 = "-[ASTRepairSessionProvider requestSuiteStart:withCompletionHandler:]";
    _os_log_impl(&dword_23CA80000, v8, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v9 = [(ASTRepairSessionProvider *)self receiver];
  [v9 requestSuiteStart:v7 withCompletionHandler:v6];
}

- (void)sendTestResult:(id)a3 withCompletion:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  v8 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    objc_super v11 = "-[ASTRepairSessionProvider sendTestResult:withCompletion:]";
    _os_log_impl(&dword_23CA80000, v8, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v9 = [(ASTRepairSessionProvider *)self receiver];
  [v9 sendTestResult:v7 withCompletion:v6];
}

- (void)requestSuiteResult:(id)a3 withCompletion:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  v8 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    objc_super v11 = "-[ASTRepairSessionProvider requestSuiteResult:withCompletion:]";
    _os_log_impl(&dword_23CA80000, v8, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v9 = [(ASTRepairSessionProvider *)self receiver];
  [v9 requestSuiteResult:v7 withCompletion:v6];
}

- (void)requestAsset:(id)a3 withCompletion:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  v8 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    objc_super v11 = "-[ASTRepairSessionProvider requestAsset:withCompletion:]";
    _os_log_impl(&dword_23CA80000, v8, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v9 = [(ASTRepairSessionProvider *)self receiver];
  [v9 requestAsset:v7 withCompletion:v6];
}

- (void)ping:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    v8 = "-[ASTRepairSessionProvider ping:]";
    _os_log_impl(&dword_23CA80000, v5, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(ASTRepairSessionProvider *)self receiver];
  [v6 ping:v4];
}

- (void)startListening
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    int v10 = "-[ASTRepairSessionProvider startListening]";
    _os_log_impl(&dword_23CA80000, v3, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", (uint8_t *)&v9, 0xCu);
  }

  id v4 = objc_alloc(MEMORY[0x263F08D88]);
  id v5 = [(ASTRepairSessionProvider *)self serviceName];
  id v6 = (void *)[v4 initWithMachServiceName:v5];
  [(ASTRepairSessionProvider *)self setListener:v6];

  int v7 = [(ASTRepairSessionProvider *)self listener];
  [v7 setDelegate:self];

  v8 = [(ASTRepairSessionProvider *)self listener];
  [v8 resume];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v24 = a3;
  id v6 = a4;
  int v7 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    *(void *)&buf[4] = "-[ASTRepairSessionProvider listener:shouldAcceptNewConnection:]";
    _os_log_impl(&dword_23CA80000, v7, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", buf, 0xCu);
  }

  v8 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [(ASTRepairSessionProvider *)self serviceName];
    *(_DWORD *)long long buf = 138412546;
    *(void *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_impl(&dword_23CA80000, v8, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] New connection %@ requested for %@", buf, 0x16u);
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  int v10 = [(ASTRepairSessionProvider *)self entitlements];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v29;
    char v13 = 1;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v10);
        }
        v15 = objc_msgSend(v6, "valueForEntitlement:", *(void *)(*((void *)&v28 + 1) + 8 * i), v24);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          char v16 = [v15 BOOLValue];
        }
        else {
          char v16 = 0;
        }

        v13 &= v16;
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v38 count:16];
    }
    while (v11);

    if ((v13 & 1) == 0)
    {
      v17 = ASTLogHandleForCategory(0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_23CA80000, v17, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] Failed entitlements check, invalidating connection", buf, 2u);
      }

      [v6 invalidate];
      BOOL v18 = 0;
      goto LABEL_27;
    }
  }
  else
  {
  }
  v19 = objc_msgSend(MEMORY[0x263F08D80], "interfaceWithProtocol:", &unk_26F0BA0A8, v24);
  [v6 setExportedObject:self];
  [v6 setExportedInterface:v19];
  v20 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F0BB7B8];
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v35 = __Block_byref_object_copy_;
  uint64_t v36 = __Block_byref_object_dispose_;
  id v37 = 0;
  objc_initWeak(&location, v6);
  [v6 setRemoteObjectInterface:v20];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __63__ASTRepairSessionProvider_listener_shouldAcceptNewConnection___block_invoke;
  v25[3] = &unk_264E7D950;
  v25[4] = buf;
  objc_copyWeak(&v26, &location);
  v21 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v25];
  if (v21 && !*(void *)(*(void *)&buf[8] + 40))
  {
    [(ASTRepairSessionProvider *)self setListenerConnection:v21];
    [v6 resume];
    v22 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v32 = 138412290;
      id v33 = v6;
      _os_log_impl(&dword_23CA80000, v22, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] Connection %@ established with remote runner service", v32, 0xCu);
    }

    BOOL v18 = 1;
  }
  else
  {
    BOOL v18 = 0;
  }

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);

LABEL_27:
  return v18;
}

void __63__ASTRepairSessionProvider_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v5 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained(v5);

  if (WeakRetained)
  {
    int v7 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_loadWeakRetained(v5);
      int v9 = 138412546;
      id v10 = v8;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_23CA80000, v7, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] Connection %@ broke with error %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)cancelSuite
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[ASTRepairSessionProvider cancelSuite]";
    _os_log_impl(&dword_23CA80000, v3, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(ASTRepairSessionProvider *)self delegate];
  [v4 cancelSuite];
}

- (void)completeTestSuite:(id)a3 description:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    __int16 v11 = "-[ASTRepairSessionProvider completeTestSuite:description:]";
    _os_log_impl(&dword_23CA80000, v8, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", (uint8_t *)&v10, 0xCu);
  }

  int v9 = [(ASTRepairSessionProvider *)self delegate];
  [v9 completeTestSuite:v7 description:v6];
}

- (void)estimatedTimeRemainingForTest:(id)a3 completion:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    __int16 v11 = "-[ASTRepairSessionProvider estimatedTimeRemainingForTest:completion:]";
    _os_log_impl(&dword_23CA80000, v8, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", (uint8_t *)&v10, 0xCu);
  }

  int v9 = [(ASTRepairSessionProvider *)self delegate];
  [v9 estimatedTimeRemainingForTest:v7 completion:v6];
}

- (void)progressForTest:(id)a3 completion:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    __int16 v11 = "-[ASTRepairSessionProvider progressForTest:completion:]";
    _os_log_impl(&dword_23CA80000, v8, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", (uint8_t *)&v10, 0xCu);
  }

  int v9 = [(ASTRepairSessionProvider *)self delegate];
  [v9 progressForTest:v7 completion:v6];
}

- (void)startTest:(id)a3 parameters:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    __int16 v11 = "-[ASTRepairSessionProvider startTest:parameters:]";
    _os_log_impl(&dword_23CA80000, v8, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", (uint8_t *)&v10, 0xCu);
  }

  int v9 = [(ASTRepairSessionProvider *)self delegate];
  [v9 startTest:v7 parameters:v6];
}

- (void)updateTestSuiteImage:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[ASTRepairSessionProvider updateTestSuiteImage:]";
    _os_log_impl(&dword_23CA80000, v5, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(ASTRepairSessionProvider *)self delegate];
  [v6 updateTestSuiteImage:v4];
}

- (void)updateTestSuiteProgress:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[ASTRepairSessionProvider updateTestSuiteProgress:]";
    _os_log_impl(&dword_23CA80000, v5, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(ASTRepairSessionProvider *)self delegate];
  [v6 updateTestSuiteProgress:v4];
}

- (void)showInstructionalPrompt:(id)a3 withConfirmation:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    __int16 v11 = "-[ASTRepairSessionProvider showInstructionalPrompt:withConfirmation:]";
    _os_log_impl(&dword_23CA80000, v8, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v9 = [(ASTRepairSessionProvider *)self delegate];
  [v9 showInstructionalPrompt:v7 withConfirmation:v6];
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NSArray)entitlements
{
  return self->_entitlements;
}

- (void)setEntitlements:(id)a3
{
}

- (ASTRepairProtocol)receiver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_receiver);

  return (ASTRepairProtocol *)WeakRetained;
}

- (void)setReceiver:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (OS_dispatch_queue)serviceCheckQueue
{
  return self->_serviceCheckQueue;
}

- (void)setServiceCheckQueue:(id)a3
{
}

- (ASTRepairProtocol)clientConnection
{
  return self->_clientConnection;
}

- (ASTRepairDelegateProtocol)listenerConnection
{
  return self->_listenerConnection;
}

- (ASTRepairDelegateProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ASTRepairDelegateProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_listenerConnection, 0);
  objc_storeStrong((id *)&self->_clientConnection, 0);
  objc_storeStrong((id *)&self->_serviceCheckQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_receiver);
  objc_storeStrong((id *)&self->_entitlements, 0);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end