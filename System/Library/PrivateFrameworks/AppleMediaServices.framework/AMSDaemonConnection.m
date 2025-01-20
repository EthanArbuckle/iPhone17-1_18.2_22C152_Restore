@interface AMSDaemonConnection
- (AMSDaemonConnection)init;
- (NSMutableArray)interruptionHandlers;
- (NSXPCConnection)sharedConnection;
- (OS_dispatch_queue)sharedConnectionAccessQueue;
- (id)_connectionProxyWithAccessBlock:(id)a3;
- (id)_serviceInterfaceForSelector:(SEL)a3;
- (id)accountCachedServerDataService;
- (id)accountSignOutServiceProxy;
- (id)callService:(id)a3 then:(id)a4;
- (id)cookieServiceProxy;
- (id)cookieServiceProxySyncWithError:(id *)a3;
- (id)deviceMessengerProxyWithDelegate:(id)a3;
- (id)dismissQRDialogServiceProxy;
- (id)fraudReportServiceProxy;
- (id)keychainServiceProxy;
- (id)paymentConfirmationProxy;
- (id)paymentValidationServiceProxy;
- (id)purchaseServiceProxy;
- (id)pushNotificationService;
- (id)securityServiceProxyWithDelegate:(id)a3;
- (void)_connectionSyncProxyWithAccessBlock:(id)a3;
- (void)_errorForwardingProxyForServiceProxy:(id)a3 proxyReplyError:(id)a4 interface:(id)a5 proxyPromise:(id)a6;
- (void)_handleInterruption;
- (void)_handleInvalidation;
- (void)_initializeConnection;
- (void)addInterruptionHandler:(id)a3;
- (void)attemptResumeIfRequired;
- (void)dealloc;
- (void)setSharedConnection:(id)a3;
@end

@implementation AMSDaemonConnection

- (AMSDaemonConnection)init
{
  v10.receiver = self;
  v10.super_class = (Class)AMSDaemonConnection;
  v2 = [(AMSDaemonConnection *)&v10 init];
  if (v2)
  {
    v3 = [NSString stringWithFormat:@"%@.serviceQueue", @"com.apple.xpc.amsaccountsd"];
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    interruptionHandlers = v2->_interruptionHandlers;
    v2->_interruptionHandlers = v4;

    id v6 = v3;
    dispatch_queue_t v7 = dispatch_queue_create((const char *)[v6 cStringUsingEncoding:4], 0);
    sharedConnectionAccessQueue = v2->_sharedConnectionAccessQueue;
    v2->_sharedConnectionAccessQueue = (OS_dispatch_queue *)v7;

    [(AMSDaemonConnection *)v2 _initializeConnection];
  }
  return v2;
}

- (id)accountCachedServerDataService
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__AMSDaemonConnection_accountCachedServerDataService__block_invoke;
  v4[3] = &unk_1E55A1690;
  v4[4] = self;
  v2 = [(AMSDaemonConnection *)self _connectionProxyWithAccessBlock:v4];
  return v2;
}

- (id)cookieServiceProxy
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__AMSDaemonConnection_cookieServiceProxy__block_invoke;
  v4[3] = &unk_1E55A1690;
  v4[4] = self;
  v2 = [(AMSDaemonConnection *)self _connectionProxyWithAccessBlock:v4];
  return v2;
}

- (id)_connectionProxyWithAccessBlock:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(AMSMutablePromise);
  id v6 = +[AMSProcessInfo currentProcess];
  dispatch_queue_t v7 = [v6 bundleIdentifier];
  int v8 = [v7 isEqualToString:@"com.apple.amsaccountsd"];

  if (v8)
  {
    v14 = AMSErrorWithFormat(11, @"Connection Proxy Failed", @"Async proxy unavailable", v9, v10, v11, v12, v13, v23);
    [(AMSMutablePromise *)v5 finishWithError:v14];
    v15 = v5;
  }
  else
  {
    v16 = [(AMSDaemonConnection *)self sharedConnectionAccessQueue];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __55__AMSDaemonConnection__connectionProxyWithAccessBlock___block_invoke;
    v24[3] = &unk_1E55A0640;
    v24[4] = self;
    v17 = v5;
    v25 = v17;
    id v26 = v4;
    v18 = v24;
    v19 = AMSLogKey();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __AMSDispatchAsync_block_invoke_1;
    block[3] = &unk_1E559EAE0;
    id v28 = v19;
    id v29 = v18;
    id v20 = v19;
    dispatch_async(v16, block);

    v21 = v17;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interruptionHandlers, 0);
  objc_storeStrong((id *)&self->_sharedConnectionAccessQueue, 0);
  objc_storeStrong((id *)&self->_sharedConnection, 0);
}

void __44__AMSDaemonConnection__initializeConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = AMSSetLogKey(*(void **)(a1 + 32));
  [WeakRetained _handleInvalidation];
}

- (void)_handleInvalidation
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = [(AMSDaemonConnection *)self sharedConnectionAccessQueue];
  dispatch_assert_queue_V2(v2);

  v3 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v3)
  {
    v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = objc_opt_class();
    id v6 = v5;
    dispatch_queue_t v7 = AMSLogKey();
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Connection could not be established (invalidated)", (uint8_t *)&v8, 0x16u);
  }
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v3)
  {
    v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = (id)objc_opt_class();
    id v5 = v9;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEBUG, "%{public}@: deallocated", buf, 0xCu);
  }
  [(NSXPCConnection *)self->_sharedConnection setInvalidationHandler:0];
  [(NSXPCConnection *)self->_sharedConnection setInterruptionHandler:0];
  [(NSXPCConnection *)self->_sharedConnection invalidate];
  sharedConnection = self->_sharedConnection;
  self->_sharedConnection = 0;

  v7.receiver = self;
  v7.super_class = (Class)AMSDaemonConnection;
  [(AMSDaemonConnection *)&v7 dealloc];
}

- (void)_initializeConnection
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = AMSSetLogKeyIfNeeded();
  id v4 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v23 = objc_opt_class();
    __int16 v24 = 2114;
    v25 = v3;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Initializing XPC connection", buf, 0x16u);
  }

  id v6 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.xpc.amsaccountsd" options:0];
  objc_super v7 = [(AMSDaemonConnection *)self sharedConnectionAccessQueue];
  [(NSXPCConnection *)v6 _setQueue:v7];

  objc_initWeak((id *)buf, self);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __44__AMSDaemonConnection__initializeConnection__block_invoke;
  v19[3] = &unk_1E559F7A0;
  objc_copyWeak(&v21, (id *)buf);
  id v8 = v3;
  id v20 = v8;
  [(NSXPCConnection *)v6 setInvalidationHandler:v19];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __44__AMSDaemonConnection__initializeConnection__block_invoke_2;
  v16 = &unk_1E559F7A0;
  objc_copyWeak(&v18, (id *)buf);
  id v9 = v8;
  id v17 = v9;
  [(NSXPCConnection *)v6 setInterruptionHandler:&v13];
  uint64_t v10 = +[AMSDaemonConnectionInterface interface];
  [(NSXPCConnection *)v6 setRemoteObjectInterface:v10];

  [(NSXPCConnection *)v6 resume];
  sharedConnection = self->_sharedConnection;
  self->_sharedConnection = v6;
  uint64_t v12 = v6;

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
}

- (OS_dispatch_queue)sharedConnectionAccessQueue
{
  return self->_sharedConnectionAccessQueue;
}

- (void)attemptResumeIfRequired
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = [(AMSDaemonConnection *)self sharedConnection];

  if (!v3)
  {
    id v4 = +[AMSLogConfig sharedAccountsDaemonConfig];
    if (!v4)
    {
      id v4 = +[AMSLogConfig sharedConfig];
    }
    id v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = objc_opt_class();
      objc_super v7 = AMSLogKey();
      int v8 = 138543618;
      uint64_t v9 = v6;
      __int16 v10 = 2114;
      uint64_t v11 = v7;
      _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Reconnecting XPC connection", (uint8_t *)&v8, 0x16u);
    }
    [(AMSDaemonConnection *)self _initializeConnection];
  }
}

void __55__AMSDaemonConnection__connectionProxyWithAccessBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sharedConnection];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  __int16 v10 = __55__AMSDaemonConnection__connectionProxyWithAccessBlock___block_invoke_2;
  uint64_t v11 = &unk_1E559E7E8;
  v3 = *(void **)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = v3;
  id v4 = [v2 remoteObjectProxyWithErrorHandler:&v8];

  if (v4)
  {
    (*(void (**)(void, void *, void, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v4, *(void *)(a1 + 40), v5, v6);
  }
  else
  {
    objc_super v7 = AMSError(0, @"Proxy Failure", @"Failed to fetch connection proxy. Missing either an error or result.", 0);
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v7, v8, v9, v10, v11, v12);
  }
}

void __41__AMSDaemonConnection_cookieServiceProxy__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__AMSDaemonConnection_cookieServiceProxy__block_invoke_2;
  v7[3] = &unk_1E55A16E0;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v5;
  [a2 getCookieServiceProxyWithReplyHandler:v7];
}

void __53__AMSDaemonConnection_accountCachedServerDataService__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__AMSDaemonConnection_accountCachedServerDataService__block_invoke_2;
  v7[3] = &unk_1E55A1668;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v5;
  [a2 getAccountCachedServerDataServiceProxyWithReplyHandler:v7];
}

void __53__AMSDaemonConnection_accountCachedServerDataService__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 _serviceInterfaceForSelector:sel_getAccountCachedServerDataServiceProxyWithReplyHandler_];
  [v5 _errorForwardingProxyForServiceProxy:v7 proxyReplyError:v6 interface:v8 proxyPromise:*(void *)(a1 + 40)];
}

void __41__AMSDaemonConnection_cookieServiceProxy__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 _serviceInterfaceForSelector:sel_getCookieServiceProxyWithReplyHandler_];
  [v5 _errorForwardingProxyForServiceProxy:v7 proxyReplyError:v6 interface:v8 proxyPromise:*(void *)(a1 + 40)];
}

- (void)_errorForwardingProxyForServiceProxy:(id)a3 proxyReplyError:(id)a4 interface:(id)a5 proxyPromise:(id)a6
{
  id v12 = a4;
  id v9 = a6;
  if (a3)
  {
    id v10 = a5;
    id v11 = a3;
    a3 = [[AMSDaemonConnectionErrorForwardingProxy alloc] initWithProxy:v11 fromInterface:v10];
  }
  [v9 finishWithResult:a3 error:v12];
}

void __55__AMSDaemonConnection_cookieServiceProxySyncWithError___block_invoke_42(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [*(id *)(a1 + 32) _serviceInterfaceForSelector:sel_getCookieServiceProxyWithReplyHandler_];
    id v8 = [[AMSDaemonConnectionErrorForwardingProxy alloc] initWithProxy:v5 fromInterface:v7 isSync:1];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  else
  {
    id v11 = +[AMSLogConfig sharedConfig];
    if (!v11)
    {
      id v11 = +[AMSLogConfig sharedConfig];
    }
    id v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = AMSLogKey();
      v15 = AMSLogableError(v6);
      int v16 = 138543874;
      uint64_t v17 = v13;
      __int16 v18 = 2114;
      v19 = v14;
      __int16 v20 = 2114;
      id v21 = v15;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@]Failed to get service interface with proxy. error = %{public}@", (uint8_t *)&v16, 0x20u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

- (id)cookieServiceProxySyncWithError:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__24;
  uint64_t v22 = __Block_byref_object_dispose__24;
  id v23 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__24;
  int v16 = __Block_byref_object_dispose__24;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__AMSDaemonConnection_cookieServiceProxySyncWithError___block_invoke;
  v11[3] = &unk_1E55A1730;
  v11[4] = self;
  v11[5] = &v18;
  v11[6] = &v12;
  [(AMSDaemonConnection *)self _connectionSyncProxyWithAccessBlock:v11];
  if (v19[5])
  {
    id v4 = +[AMSLogConfig sharedConfig];
    if (!v4)
    {
      id v4 = +[AMSLogConfig sharedConfig];
    }
    id v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = objc_opt_class();
      AMSLogKey();
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      id v8 = AMSLogableError((void *)v19[5]);
      *(_DWORD *)buf = 138543874;
      uint64_t v25 = v6;
      __int16 v26 = 2114;
      id v27 = v7;
      __int16 v28 = 2114;
      id v29 = v8;
      _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error connecting sync proxy. error = %{public}@", buf, 0x20u);
    }
    id v9 = 0;
    if (a3) {
      *a3 = (id) v19[5];
    }
  }
  else
  {
    id v9 = (id)v13[5];
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

- (void)_connectionSyncProxyWithAccessBlock:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = +[AMSProcessInfo currentProcess];
  uint64_t v6 = [v5 bundleIdentifier];
  int v7 = [v6 isEqualToString:@"com.apple.amsaccountsd"];

  if (v7)
  {
    uint64_t v13 = AMSErrorWithFormat(11, @"Connection Proxy Failed", @"Sync proxy unavailable", v8, v9, v10, v11, v12, v16[0]);
    v4[2](v4, 0, v13);
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x3032000000;
    uint64_t v20 = __Block_byref_object_copy__24;
    id v21 = __Block_byref_object_dispose__24;
    id v22 = 0;
    uint64_t v14 = [(AMSDaemonConnection *)self sharedConnection];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = (uint64_t)__59__AMSDaemonConnection__connectionSyncProxyWithAccessBlock___block_invoke;
    v16[3] = (uint64_t)&unk_1E55A18E8;
    v16[4] = (uint64_t)self;
    v16[5] = (uint64_t)&v17;
    v15 = [v14 synchronousRemoteObjectProxyWithErrorHandler:v16];

    ((void (**)(id, void *, void *))v4)[2](v4, v15, (void *)v18[5]);
    _Block_object_dispose(&v17, 8);
  }
}

- (id)_serviceInterfaceForSelector:(SEL)a3
{
  id v4 = [(AMSDaemonConnection *)self sharedConnection];
  id v5 = [v4 remoteObjectInterface];

  uint64_t v6 = [v5 interfaceForSelector:a3 argumentIndex:0 ofReply:1];

  return v6;
}

- (NSXPCConnection)sharedConnection
{
  return self->_sharedConnection;
}

void __55__AMSDaemonConnection_cookieServiceProxySyncWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a2)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __55__AMSDaemonConnection_cookieServiceProxySyncWithError___block_invoke_42;
    v12[3] = &unk_1E55A1708;
    long long v13 = *(_OWORD *)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 48);
    [a2 getCookieServiceProxyWithReplyHandler:v12];
  }
  else
  {
    int v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      int v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = AMSLogKey();
      uint64_t v11 = AMSLogableError(v6);
      *(_DWORD *)buf = 138543874;
      uint64_t v16 = v9;
      __int16 v17 = 2114;
      uint64_t v18 = v10;
      __int16 v19 = 2114;
      uint64_t v20 = v11;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@]Failed to get sync remote object proxy. error = %{public}@", buf, 0x20u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

void __59__AMSDaemonConnection__connectionSyncProxyWithAccessBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v5 = +[AMSLogConfig sharedConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = AMSLogKey();
    int v9 = 138543874;
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error connecting (sync) to daemon. %{public}@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)addInterruptionHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(AMSDaemonConnection *)self sharedConnectionAccessQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__AMSDaemonConnection_addInterruptionHandler___block_invoke;
    v6[3] = &unk_1E559EAE0;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(v5, v6);
  }
}

void __46__AMSDaemonConnection_addInterruptionHandler___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) interruptionHandlers];
  id v2 = (void *)[*(id *)(a1 + 40) copy];
  [v3 addObject:v2];
}

- (id)callService:(id)a3 then:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__AMSDaemonConnection_callService_then___block_invoke;
  v9[3] = &unk_1E55A1640;
  id v10 = v5;
  id v6 = v5;
  id v7 = [a3 thenWithBlock:v9];

  return v7;
}

id __40__AMSDaemonConnection_callService_then___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__24;
  v8[4] = __Block_byref_object_dispose__24;
  id v5 = v3;
  id v9 = v5;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__AMSDaemonConnection_callService_then___block_invoke_29;
  v7[3] = &unk_1E559F430;
  v7[4] = v8;
  [v4 addFinishBlock:v7];
  _Block_object_dispose(v8, 8);

  return v4;
}

void __40__AMSDaemonConnection_callService_then___block_invoke_29(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (id)accountSignOutServiceProxy
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__AMSDaemonConnection_accountSignOutServiceProxy__block_invoke;
  v4[3] = &unk_1E55A1690;
  v4[4] = self;
  id v2 = [(AMSDaemonConnection *)self _connectionProxyWithAccessBlock:v4];
  return v2;
}

void __49__AMSDaemonConnection_accountSignOutServiceProxy__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__AMSDaemonConnection_accountSignOutServiceProxy__block_invoke_2;
  v7[3] = &unk_1E55A16B8;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v5;
  [a2 getAccountSignOutServiceProxyWithReplyHandler:v7];
}

void __49__AMSDaemonConnection_accountSignOutServiceProxy__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 _serviceInterfaceForSelector:sel_getAccountSignOutServiceProxyWithReplyHandler_];
  [v5 _errorForwardingProxyForServiceProxy:v7 proxyReplyError:v6 interface:v8 proxyPromise:*(void *)(a1 + 40)];
}

- (id)deviceMessengerProxyWithDelegate:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__AMSDaemonConnection_deviceMessengerProxyWithDelegate___block_invoke;
  v8[3] = &unk_1E55A1780;
  id v9 = v4;
  id v10 = self;
  id v5 = v4;
  id v6 = [(AMSDaemonConnection *)self _connectionProxyWithAccessBlock:v8];

  return v6;
}

void __56__AMSDaemonConnection_deviceMessengerProxyWithDelegate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a2;
  id v8 = +[AMSConnectionDelegateProxy proxyWithDelegate:v6];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__AMSDaemonConnection_deviceMessengerProxyWithDelegate___block_invoke_2;
  v10[3] = &unk_1E55A1758;
  v10[4] = *(void *)(a1 + 40);
  id v11 = v5;
  id v9 = v5;
  [v7 getDeviceMessengerServiceProxyWithDelegate:v8 replyHandler:v10];
}

void __56__AMSDaemonConnection_deviceMessengerProxyWithDelegate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 _serviceInterfaceForSelector:sel_getDeviceMessengerServiceProxyWithDelegate_replyHandler_];
  [v5 _errorForwardingProxyForServiceProxy:v7 proxyReplyError:v6 interface:v8 proxyPromise:*(void *)(a1 + 40)];
}

- (id)dismissQRDialogServiceProxy
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__AMSDaemonConnection_dismissQRDialogServiceProxy__block_invoke;
  v4[3] = &unk_1E55A1690;
  v4[4] = self;
  id v2 = [(AMSDaemonConnection *)self _connectionProxyWithAccessBlock:v4];
  return v2;
}

void __50__AMSDaemonConnection_dismissQRDialogServiceProxy__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__AMSDaemonConnection_dismissQRDialogServiceProxy__block_invoke_2;
  v7[3] = &unk_1E55A17A8;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v5;
  [a2 getDismissQRDialogServiceProxyWithReplyHandler:v7];
}

void __50__AMSDaemonConnection_dismissQRDialogServiceProxy__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 _serviceInterfaceForSelector:sel_getDismissQRDialogServiceProxyWithReplyHandler_];
  [v5 _errorForwardingProxyForServiceProxy:v7 proxyReplyError:v6 interface:v8 proxyPromise:*(void *)(a1 + 40)];
}

- (id)fraudReportServiceProxy
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__AMSDaemonConnection_fraudReportServiceProxy__block_invoke;
  v4[3] = &unk_1E55A1690;
  v4[4] = self;
  id v2 = [(AMSDaemonConnection *)self _connectionProxyWithAccessBlock:v4];
  return v2;
}

void __46__AMSDaemonConnection_fraudReportServiceProxy__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__AMSDaemonConnection_fraudReportServiceProxy__block_invoke_2;
  v7[3] = &unk_1E55A17D0;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v5;
  [a2 getFraudReportServiceProxyWithReplyHandler:v7];
}

void __46__AMSDaemonConnection_fraudReportServiceProxy__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 _serviceInterfaceForSelector:sel_getFraudReportServiceProxyWithReplyHandler_];
  [v5 _errorForwardingProxyForServiceProxy:v7 proxyReplyError:v6 interface:v8 proxyPromise:*(void *)(a1 + 40)];
}

- (id)keychainServiceProxy
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__AMSDaemonConnection_keychainServiceProxy__block_invoke;
  v4[3] = &unk_1E55A1690;
  v4[4] = self;
  id v2 = [(AMSDaemonConnection *)self _connectionProxyWithAccessBlock:v4];
  return v2;
}

void __43__AMSDaemonConnection_keychainServiceProxy__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__AMSDaemonConnection_keychainServiceProxy__block_invoke_2;
  v7[3] = &unk_1E55A17F8;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v5;
  [a2 getKeychainServiceProxyWithReplyHandler:v7];
}

void __43__AMSDaemonConnection_keychainServiceProxy__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 _serviceInterfaceForSelector:sel_getKeychainServiceProxyWithReplyHandler_];
  [v5 _errorForwardingProxyForServiceProxy:v7 proxyReplyError:v6 interface:v8 proxyPromise:*(void *)(a1 + 40)];
}

- (id)purchaseServiceProxy
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__AMSDaemonConnection_purchaseServiceProxy__block_invoke;
  v4[3] = &unk_1E55A1690;
  v4[4] = self;
  id v2 = [(AMSDaemonConnection *)self _connectionProxyWithAccessBlock:v4];
  return v2;
}

void __43__AMSDaemonConnection_purchaseServiceProxy__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__AMSDaemonConnection_purchaseServiceProxy__block_invoke_2;
  v7[3] = &unk_1E55A1820;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v5;
  [a2 getPurchaseServiceProxyWithReplyHandler:v7];
}

void __43__AMSDaemonConnection_purchaseServiceProxy__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 _serviceInterfaceForSelector:sel_getPurchaseServiceProxyWithReplyHandler_];
  [v5 _errorForwardingProxyForServiceProxy:v7 proxyReplyError:v6 interface:v8 proxyPromise:*(void *)(a1 + 40)];
}

- (id)paymentConfirmationProxy
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__AMSDaemonConnection_paymentConfirmationProxy__block_invoke;
  v4[3] = &unk_1E55A1690;
  v4[4] = self;
  id v2 = [(AMSDaemonConnection *)self _connectionProxyWithAccessBlock:v4];
  return v2;
}

void __47__AMSDaemonConnection_paymentConfirmationProxy__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__AMSDaemonConnection_paymentConfirmationProxy__block_invoke_2;
  v7[3] = &unk_1E55A1848;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v5;
  [a2 getPaymentConfirmationServiceProxyWithReplyHandler:v7];
}

void __47__AMSDaemonConnection_paymentConfirmationProxy__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 _serviceInterfaceForSelector:sel_getPaymentConfirmationServiceProxyWithReplyHandler_];
  [v5 _errorForwardingProxyForServiceProxy:v7 proxyReplyError:v6 interface:v8 proxyPromise:*(void *)(a1 + 40)];
}

- (id)paymentValidationServiceProxy
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__AMSDaemonConnection_paymentValidationServiceProxy__block_invoke;
  v4[3] = &unk_1E55A1690;
  v4[4] = self;
  id v2 = [(AMSDaemonConnection *)self _connectionProxyWithAccessBlock:v4];
  return v2;
}

void __52__AMSDaemonConnection_paymentValidationServiceProxy__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__AMSDaemonConnection_paymentValidationServiceProxy__block_invoke_2;
  v7[3] = &unk_1E55A1870;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v5;
  [a2 getPaymentValidationServiceProxyWithReplyHandler:v7];
}

void __52__AMSDaemonConnection_paymentValidationServiceProxy__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 _serviceInterfaceForSelector:sel_getPaymentValidationServiceProxyWithReplyHandler_];
  [v5 _errorForwardingProxyForServiceProxy:v7 proxyReplyError:v6 interface:v8 proxyPromise:*(void *)(a1 + 40)];
}

- (id)pushNotificationService
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__AMSDaemonConnection_pushNotificationService__block_invoke;
  v4[3] = &unk_1E55A1690;
  v4[4] = self;
  id v2 = [(AMSDaemonConnection *)self _connectionProxyWithAccessBlock:v4];
  return v2;
}

void __46__AMSDaemonConnection_pushNotificationService__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__AMSDaemonConnection_pushNotificationService__block_invoke_2;
  v7[3] = &unk_1E55A1898;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v5;
  [a2 getPushNotificationServiceProxyWithReplyHandler:v7];
}

void __46__AMSDaemonConnection_pushNotificationService__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 _serviceInterfaceForSelector:sel_getPushNotificationServiceProxyWithReplyHandler_];
  [v5 _errorForwardingProxyForServiceProxy:v7 proxyReplyError:v6 interface:v8 proxyPromise:*(void *)(a1 + 40)];
}

- (id)securityServiceProxyWithDelegate:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__AMSDaemonConnection_securityServiceProxyWithDelegate___block_invoke;
  v8[3] = &unk_1E55A1780;
  id v9 = v4;
  id v10 = self;
  id v5 = v4;
  id v6 = [(AMSDaemonConnection *)self _connectionProxyWithAccessBlock:v8];

  return v6;
}

void __56__AMSDaemonConnection_securityServiceProxyWithDelegate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a2;
  id v8 = +[AMSConnectionDelegateProxy proxyWithDelegate:v6];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__AMSDaemonConnection_securityServiceProxyWithDelegate___block_invoke_2;
  v10[3] = &unk_1E55A18C0;
  v10[4] = *(void *)(a1 + 40);
  id v11 = v5;
  id v9 = v5;
  [v7 getSecurityServiceProxyWithDelegate:v8 replyHandler:v10];
}

void __56__AMSDaemonConnection_securityServiceProxyWithDelegate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 _serviceInterfaceForSelector:sel_getSecurityServiceProxyWithDelegate_replyHandler_];
  [v5 _errorForwardingProxyForServiceProxy:v7 proxyReplyError:v6 interface:v8 proxyPromise:*(void *)(a1 + 40)];
}

void __55__AMSDaemonConnection__connectionProxyWithAccessBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    AMSError(0, @"AMSDaemonConnection Error", @"Unknown error occurred while fetching Async remote object proxy", 0);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v4 = +[AMSLogConfig sharedConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = AMSLogKey();
    int v8 = 138543874;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    id v11 = v7;
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error connecting (async) to daemon. %{public}@", (uint8_t *)&v8, 0x20u);
  }
  if (([*(id *)(a1 + 40) isFinished] & 1) == 0) {
    [*(id *)(a1 + 40) finishWithError:v3];
  }
}

- (void)_handleInterruption
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [(AMSDaemonConnection *)self sharedConnectionAccessQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = v6;
    int v8 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = v6;
    __int16 v21 = 2114;
    id v22 = v8;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Connection interrupted.", buf, 0x16u);
  }
  [(AMSDaemonConnection *)self setSharedConnection:0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v9 = [(AMSDaemonConnection *)self interruptionHandlers];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * v13++) + 16))();
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

void __44__AMSDaemonConnection__initializeConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = AMSSetLogKey(*(void **)(a1 + 32));
  [WeakRetained _handleInterruption];
}

- (void)setSharedConnection:(id)a3
{
}

- (NSMutableArray)interruptionHandlers
{
  return self->_interruptionHandlers;
}

@end