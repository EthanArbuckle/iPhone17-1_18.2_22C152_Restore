@interface AMSCommerceService
+ (AMSCommerceService)proxyObject;
+ (AMSCommerceService)proxyObjectAsync;
+ (NSXPCConnection)sharedConnection;
+ (OS_dispatch_queue)sharedConnectionAccessQueue;
+ (id)_createXPCConnection;
+ (void)setSharedConnection:(id)a3;
@end

@implementation AMSCommerceService

+ (AMSCommerceService)proxyObject
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__20;
  v11 = __Block_byref_object_dispose__20;
  id v12 = 0;
  v3 = [a1 sharedConnectionAccessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__AMSCommerceService_proxyObject__block_invoke;
  v6[3] = &unk_1E55A1220;
  v6[4] = &v7;
  v6[5] = a1;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (AMSCommerceService *)v4;
}

void __33__AMSCommerceService_proxyObject__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 40) sharedConnection];
  uint64_t v2 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_31];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __33__AMSCommerceService_proxyObject__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = +[AMSLogConfig sharedAccountsConfig];
  if (!v3)
  {
    uint64_t v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v2;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_ERROR, "AMSCommerceService: Failed to create the proxy object (sync). error = %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

+ (AMSCommerceService)proxyObjectAsync
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__20;
  v11 = __Block_byref_object_dispose__20;
  id v12 = 0;
  uint64_t v3 = [a1 sharedConnectionAccessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__AMSCommerceService_proxyObjectAsync__block_invoke;
  v6[3] = &unk_1E55A1220;
  v6[4] = &v7;
  v6[5] = a1;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (AMSCommerceService *)v4;
}

void __38__AMSCommerceService_proxyObjectAsync__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 40) sharedConnection];
  uint64_t v2 = [v5 remoteObjectProxyWithErrorHandler:&__block_literal_global_3_2];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __38__AMSCommerceService_proxyObjectAsync__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = +[AMSLogConfig sharedAccountsConfig];
  if (!v3)
  {
    uint64_t v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v2;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_ERROR, "AMSCommerceService: Failed to create the proxy object (async). error = %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

+ (void)setSharedConnection:(id)a3
{
  id v4 = a3;
  int v5 = [a1 sharedConnectionAccessQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)kSharedConnection;
  kSharedConnection = (uint64_t)v4;
}

+ (NSXPCConnection)sharedConnection
{
  uint64_t v3 = [a1 sharedConnectionAccessQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)kSharedConnection;
  if (!kSharedConnection)
  {
    uint64_t v5 = [a1 _createXPCConnection];
    id v6 = (void *)kSharedConnection;
    kSharedConnection = v5;

    [(id)kSharedConnection resume];
    id v4 = (void *)kSharedConnection;
  }
  return (NSXPCConnection *)v4;
}

+ (OS_dispatch_queue)sharedConnectionAccessQueue
{
  if (_MergedGlobals_92 != -1) {
    dispatch_once(&_MergedGlobals_92, &__block_literal_global_5);
  }
  id v2 = (void *)qword_1EB38D748;
  return (OS_dispatch_queue *)v2;
}

uint64_t __49__AMSCommerceService_sharedConnectionAccessQueue__block_invoke()
{
  qword_1EB38D748 = (uint64_t)dispatch_queue_create("com.apple.AppleMediaServices.AMSCommerceService.sharedConnection", 0);
  return MEMORY[0x1F41817F8]();
}

+ (id)_createXPCConnection
{
  uint64_t v3 = +[AMSLogConfig sharedAccountsConfig];
  if (!v3)
  {
    uint64_t v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_INFO, "AMSCommerceService: Initializing commerce xpc connection", (uint8_t *)buf, 2u);
  }

  if (getuid() || +[AMSProcessInfo isBuddyRunning]) {
    uint64_t v5 = @"com.apple.commerce";
  }
  else {
    uint64_t v5 = @"com.apple.commerced";
  }
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:v5 options:0];
  objc_initWeak(buf, a1);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __42__AMSCommerceService__createXPCConnection__block_invoke;
  v14[3] = &unk_1E559F890;
  objc_copyWeak(&v15, buf);
  [v6 setInterruptionHandler:v14];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __42__AMSCommerceService__createXPCConnection__block_invoke_2;
  id v12 = &unk_1E559F890;
  objc_copyWeak(&v13, buf);
  [v6 setInvalidationHandler:&v9];
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F29280], "interfaceWithProtocol:", &unk_1EDD510C8, v9, v10, v11, v12);
  [v6 setRemoteObjectInterface:v7];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(buf);
  return v6;
}

void __42__AMSCommerceService__createXPCConnection__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = +[AMSLogConfig sharedAccountsConfig];
  if (!v3)
  {
    uint64_t v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "AMSCommerceService: The connection was interrupted.", buf, 2u);
  }

  uint64_t v5 = [WeakRetained sharedConnectionAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__AMSCommerceService__createXPCConnection__block_invoke_13;
  block[3] = &unk_1E559F890;
  objc_copyWeak(&v7, v1);
  dispatch_async(v5, block);

  objc_destroyWeak(&v7);
}

void __42__AMSCommerceService__createXPCConnection__block_invoke_13(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setSharedConnection:0];
}

void __42__AMSCommerceService__createXPCConnection__block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = +[AMSLogConfig sharedAccountsConfig];
  if (!v3)
  {
    uint64_t v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_ERROR, "AMSCommerceService: The connection was invalidated.", buf, 2u);
  }

  uint64_t v5 = [WeakRetained sharedConnectionAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__AMSCommerceService__createXPCConnection__block_invoke_14;
  block[3] = &unk_1E559F890;
  objc_copyWeak(&v7, v1);
  dispatch_async(v5, block);

  objc_destroyWeak(&v7);
}

void __42__AMSCommerceService__createXPCConnection__block_invoke_14(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setSharedConnection:0];
}

@end