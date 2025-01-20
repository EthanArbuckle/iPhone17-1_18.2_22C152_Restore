@interface AMSMultiUserService
+ (AMSMultiUserServiceProtocol)proxyObject;
+ (AMSMultiUserServiceProtocol)proxyObjectAsync;
+ (BOOL)isConnectionEntitled:(id)a3;
+ (NSString)machServiceName;
+ (NSXPCConnection)sharedConnection;
+ (NSXPCInterface)serviceInterface;
+ (OS_dispatch_queue)sharedConnectionAccessQueue;
+ (id)_createXPCConnection;
+ (void)setSharedConnection:(id)a3;
@end

@implementation AMSMultiUserService

+ (AMSMultiUserServiceProtocol)proxyObject
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = +[AMSProcessInfo currentProcess];
  v5 = [v4 bundleIdentifier];
  int v6 = [v5 isEqualToString:@"com.apple.amsaccountsd"];

  if (v6)
  {
    v7 = +[AMSLogConfig sharedAccountsMultiUserConfig];
    if (!v7)
    {
      v7 = +[AMSLogConfig sharedConfig];
    }
    v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      v10 = AMSLogKey();
      NSStringFromSelector(a2);
      v11 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2114;
      v17 = v11;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] %{public}@ is unavailable from amsaccountsd.", buf, 0x20u);
    }
    id v12 = 0;
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v17 = __Block_byref_object_copy__51;
    v18 = __Block_byref_object_dispose__51;
    id v19 = 0;
    v13 = [a1 sharedConnectionAccessQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __34__AMSMultiUserService_proxyObject__block_invoke;
    v15[3] = &unk_1E55A1220;
    v15[4] = buf;
    v15[5] = a1;
    dispatch_sync(v13, v15);

    id v12 = *(id *)(*(void *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);
  }
  return (AMSMultiUserServiceProtocol *)v12;
}

+ (OS_dispatch_queue)sharedConnectionAccessQueue
{
  if (_MergedGlobals_134 != -1) {
    dispatch_once(&_MergedGlobals_134, &__block_literal_global_98);
  }
  v2 = (void *)qword_1EB38DE68;
  return (OS_dispatch_queue *)v2;
}

void __34__AMSMultiUserService_proxyObject__block_invoke(uint64_t a1)
{
  v2 = AMSLogKey();
  objc_initWeak(&location, *(id *)(a1 + 40));
  v3 = [*(id *)(a1 + 40) sharedConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __34__AMSMultiUserService_proxyObject__block_invoke_2;
  v8[3] = &unk_1E55A4D30;
  id v4 = v2;
  id v9 = v4;
  objc_copyWeak(&v10, &location);
  uint64_t v5 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v8];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

+ (NSXPCConnection)sharedConnection
{
  v3 = [a1 sharedConnectionAccessQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)kSharedConnection_0;
  if (!kSharedConnection_0)
  {
    uint64_t v5 = [a1 _createXPCConnection];
    uint64_t v6 = (void *)kSharedConnection_0;
    kSharedConnection_0 = v5;

    [(id)kSharedConnection_0 resume];
    id v4 = (void *)kSharedConnection_0;
  }
  return (NSXPCConnection *)v4;
}

+ (id)_createXPCConnection
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = +[AMSLogConfig sharedAccountsMultiUserConfig];
  if (!v3)
  {
    v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v25 = v5;
    __int16 v26 = 2114;
    v27 = v6;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Initializing amsaccountsd XPC connection.", buf, 0x16u);
  }
  id v7 = objc_alloc(MEMORY[0x1E4F29268]);
  v8 = [a1 machServiceName];
  id v9 = (void *)[v7 initWithMachServiceName:v8 options:0];

  id v10 = AMSLogKey();
  objc_initWeak((id *)buf, a1);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __43__AMSMultiUserService__createXPCConnection__block_invoke;
  v21[3] = &unk_1E559F7A0;
  objc_copyWeak(&v23, (id *)buf);
  id v11 = v10;
  id v22 = v11;
  [v9 setInterruptionHandler:v21];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __43__AMSMultiUserService__createXPCConnection__block_invoke_2;
  v18 = &unk_1E559F7A0;
  objc_copyWeak(&v20, (id *)buf);
  id v12 = v11;
  id v19 = v12;
  [v9 setInvalidationHandler:&v15];
  v13 = objc_msgSend(a1, "serviceInterface", v15, v16, v17, v18);
  [v9 setRemoteObjectInterface:v13];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);

  return v9;
}

+ (NSXPCInterface)serviceInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDD516C8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_msgSend(v3, "initWithObjects:", v4, v5, objc_opt_class(), 0);
  [v2 setClasses:v6 forSelector:sel_exportMultiUserTokenForHomeIdentifier_generateIfMissing_generateIfInvalid_completion_ argumentIndex:0 ofReply:1];

  return (NSXPCInterface *)v2;
}

+ (NSString)machServiceName
{
  return (NSString *)@"com.apple.amsaccountsd.multiuser";
}

uint64_t __50__AMSMultiUserService_sharedConnectionAccessQueue__block_invoke()
{
  qword_1EB38DE68 = (uint64_t)dispatch_queue_create("com.apple.AppleMediaServices.AMSMultiUserService.sharedConnection", 0);
  return MEMORY[0x1F41817F8]();
}

+ (BOOL)isConnectionEntitled:(id)a3
{
  id v3 = [a3 valueForEntitlement:@"com.apple.private.applemediaservices"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  char v5 = [v4 BOOLValue];
  return v5;
}

void __34__AMSMultiUserService_proxyObject__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AMSSetLogKey(*(void **)(a1 + 32));
  char v5 = +[AMSLogConfig sharedAccountsMultiUserConfig];
  if (!v5)
  {
    char v5 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v8 = objc_opt_class();
    id v9 = AMSLogKey();
    id v10 = AMSLogableError(v3);
    int v11 = 138543874;
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    v14 = v9;
    __int16 v15 = 2114;
    uint64_t v16 = v10;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create the proxy object (sync). error = %{public}@", (uint8_t *)&v11, 0x20u);
  }
}

+ (AMSMultiUserServiceProtocol)proxyObjectAsync
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = +[AMSProcessInfo currentProcess];
  char v5 = [v4 bundleIdentifier];
  int v6 = [v5 isEqualToString:@"com.apple.amsaccountsd"];

  if (v6)
  {
    id v7 = +[AMSLogConfig sharedAccountsMultiUserConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      id v10 = AMSLogKey();
      NSStringFromSelector(a2);
      int v11 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2114;
      uint64_t v17 = v11;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] %{public}@ is unavailable from amsaccountsd.", buf, 0x20u);
    }
    id v12 = 0;
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v17 = __Block_byref_object_copy__51;
    v18 = __Block_byref_object_dispose__51;
    id v19 = 0;
    __int16 v13 = [a1 sharedConnectionAccessQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __39__AMSMultiUserService_proxyObjectAsync__block_invoke;
    v15[3] = &unk_1E55A1220;
    v15[4] = buf;
    v15[5] = a1;
    dispatch_sync(v13, v15);

    id v12 = *(id *)(*(void *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);
  }
  return (AMSMultiUserServiceProtocol *)v12;
}

void __39__AMSMultiUserService_proxyObjectAsync__block_invoke(uint64_t a1)
{
  v2 = AMSLogKey();
  objc_initWeak(&location, *(id *)(a1 + 40));
  id v3 = [*(id *)(a1 + 40) sharedConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__AMSMultiUserService_proxyObjectAsync__block_invoke_2;
  v8[3] = &unk_1E55A4D30;
  id v4 = v2;
  id v9 = v4;
  objc_copyWeak(&v10, &location);
  uint64_t v5 = [v3 remoteObjectProxyWithErrorHandler:v8];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __39__AMSMultiUserService_proxyObjectAsync__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AMSSetLogKey(*(void **)(a1 + 32));
  uint64_t v5 = +[AMSLogConfig sharedAccountsMultiUserConfig];
  if (!v5)
  {
    uint64_t v5 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v8 = objc_opt_class();
    id v9 = AMSLogKey();
    id v10 = AMSLogableError(v3);
    int v11 = 138543874;
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    v14 = v9;
    __int16 v15 = 2114;
    uint64_t v16 = v10;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create the proxy object (async). error = %{public}@", (uint8_t *)&v11, 0x20u);
  }
}

+ (void)setSharedConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 sharedConnectionAccessQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)kSharedConnection_0;
  kSharedConnection_0 = (uint64_t)v4;
}

void __43__AMSMultiUserService__createXPCConnection__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = AMSSetLogKey(*(void **)(a1 + 32));
  uint64_t v5 = +[AMSLogConfig sharedAccountsMultiUserConfig];
  if (!v5)
  {
    uint64_t v5 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    __int16 v15 = v8;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The connection was interrupted.", buf, 0x16u);
  }
  id v9 = [WeakRetained sharedConnectionAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__AMSMultiUserService__createXPCConnection__block_invoke_91;
  block[3] = &unk_1E559F890;
  objc_copyWeak(&v11, v2);
  dispatch_async(v9, block);

  objc_destroyWeak(&v11);
}

void __43__AMSMultiUserService__createXPCConnection__block_invoke_91(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setSharedConnection:0];
}

void __43__AMSMultiUserService__createXPCConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = AMSSetLogKey(*(void **)(a1 + 32));
  uint64_t v5 = +[AMSLogConfig sharedAccountsMultiUserConfig];
  if (!v5)
  {
    uint64_t v5 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    __int16 v15 = v8;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] The connection was invalidated.", buf, 0x16u);
  }
  id v9 = [WeakRetained sharedConnectionAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__AMSMultiUserService__createXPCConnection__block_invoke_92;
  block[3] = &unk_1E559F890;
  objc_copyWeak(&v11, v2);
  dispatch_async(v9, block);

  objc_destroyWeak(&v11);
}

void __43__AMSMultiUserService__createXPCConnection__block_invoke_92(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setSharedConnection:0];
}

@end