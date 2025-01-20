@interface AMSHTTPArchiveService
+ (id)_sharedProxy;
+ (void)recordTrafficWithTaskInfo:(id)a3;
- (AMSHTTPArchiveService)init;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (id)_createProxy;
- (id)_createRemoteConnection;
- (id)errorHandler;
- (void)_removeRemoteConnection;
- (void)dealloc;
- (void)setConnection:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation AMSHTTPArchiveService

void __37__AMSHTTPArchiveService__createProxy__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) connection];
  if (!v2)
  {
    v2 = [*(id *)(a1 + 32) _createRemoteConnection];
    [*(id *)(a1 + 32) setConnection:v2];
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__AMSHTTPArchiveService__createProxy__block_invoke_2;
  v6[3] = &unk_1E559F028;
  v6[4] = *(void *)(a1 + 32);
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

+ (void)recordTrafficWithTaskInfo:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _sharedProxy];
  [v5 recordTrafficWithTaskInfo:v4];
}

+ (id)_sharedProxy
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__37;
  v13 = __Block_byref_object_dispose__37;
  id v14 = 0;
  if (_MergedGlobals_114 != -1) {
    dispatch_once(&_MergedGlobals_114, &__block_literal_global_66);
  }
  id v2 = (id)qword_1EB38D988;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__AMSHTTPArchiveService__sharedProxy__block_invoke_2;
  v6[3] = &unk_1E55A30A0;
  id v7 = v2;
  v8 = &v9;
  uint64_t v3 = v2;
  dispatch_sync(v3, v6);
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

void __37__AMSHTTPArchiveService__sharedProxy__block_invoke_2(uint64_t a1)
{
  id v2 = (void *)_sharedProxy_sharedService;
  if (!_sharedProxy_sharedService)
  {
    uint64_t v3 = objc_alloc_init(AMSHTTPArchiveService);
    id v4 = (void *)_sharedProxy_sharedService;
    _sharedProxy_sharedService = (uint64_t)v3;

    id v2 = (void *)_sharedProxy_sharedService;
  }
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__37;
  v15[4] = __Block_byref_object_dispose__37;
  id v16 = v2;
  id v5 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __37__AMSHTTPArchiveService__sharedProxy__block_invoke_3;
  v14[3] = &unk_1E559EC70;
  v14[4] = v15;
  v6 = v14;
  id v7 = v5;
  v8 = AMSLogKey();
  dispatch_time_t v9 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AMSDispatchAfter_block_invoke_1;
  block[3] = &unk_1E559EAE0;
  id v18 = v8;
  id v19 = v6;
  id v10 = v8;
  dispatch_after(v9, v7, block);

  uint64_t v11 = [(id)_sharedProxy_sharedService _createProxy];
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  _Block_object_dispose(v15, 8);
}

- (id)_createProxy
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__37;
  uint64_t v11 = __Block_byref_object_dispose__37;
  id v12 = 0;
  uint64_t v3 = [(AMSHTTPArchiveService *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__AMSHTTPArchiveService__createProxy__block_invoke;
  v6[3] = &unk_1E55A30A0;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (AMSHTTPArchiveService)init
{
  v6.receiver = self;
  v6.super_class = (Class)AMSHTTPArchiveService;
  id v2 = [(AMSHTTPArchiveService *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.AppleMediaServices.harservice", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (id)_createRemoteConnection
{
  dispatch_queue_t v3 = [(AMSHTTPArchiveService *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.xpc.amstoold" options:0];
  id v5 = [(AMSHTTPArchiveService *)self queue];
  [v4 _setQueue:v5];

  objc_super v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDD51668];
  [v6 setClass:objc_opt_class() forSelector:sel_recordTrafficWithTaskInfo_ argumentIndex:0 ofReply:0];
  [v4 setRemoteObjectInterface:v6];
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__AMSHTTPArchiveService__createRemoteConnection__block_invoke;
  v10[3] = &unk_1E559F890;
  objc_copyWeak(&v11, &location);
  [v4 setInvalidationHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__AMSHTTPArchiveService__createRemoteConnection__block_invoke_54;
  v8[3] = &unk_1E559F890;
  objc_copyWeak(&v9, &location);
  [v4 setInterruptionHandler:v8];
  [v4 resume];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v4;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

uint64_t __37__AMSHTTPArchiveService__sharedProxy__block_invoke()
{
  qword_1EB38D988 = (uint64_t)dispatch_queue_create("com.apple.AppleMediaServices.harconnection", 0);
  return MEMORY[0x1F41817F8]();
}

- (void)dealloc
{
  [(AMSHTTPArchiveService *)self _removeRemoteConnection];
  v3.receiver = self;
  v3.super_class = (Class)AMSHTTPArchiveService;
  [(AMSHTTPArchiveService *)&v3 dealloc];
}

void __37__AMSHTTPArchiveService__createProxy__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  objc_super v3 = +[AMSLogConfig sharedConfig];
  if (!v3)
  {
    objc_super v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = objc_opt_class();
    objc_super v6 = AMSLogKey();
    int v7 = 138543874;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    id v10 = v6;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to retrieve remote object. %{public}@", (uint8_t *)&v7, 0x20u);
  }
}

void __48__AMSHTTPArchiveService__createRemoteConnection__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = +[AMSLogConfig sharedConfig];
  if (!v2)
  {
    id v2 = +[AMSLogConfig sharedConfig];
  }
  objc_super v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = AMSLogKey();
    int v8 = 138543618;
    uint64_t v9 = v4;
    __int16 v10 = 2114;
    __int16 v11 = v5;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Invalidation Handler Reached", (uint8_t *)&v8, 0x16u);
  }
  [WeakRetained _removeRemoteConnection];
  objc_super v6 = [WeakRetained errorHandler];

  if (v6)
  {
    int v7 = [WeakRetained errorHandler];
    v7[2]();
  }
}

void __48__AMSHTTPArchiveService__createRemoteConnection__block_invoke_54(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = +[AMSLogConfig sharedConfig];
  if (!v2)
  {
    id v2 = +[AMSLogConfig sharedConfig];
  }
  objc_super v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = AMSLogKey();
    int v8 = 138543618;
    uint64_t v9 = v4;
    __int16 v10 = 2114;
    __int16 v11 = v5;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Interruption Handler Reached", (uint8_t *)&v8, 0x16u);
  }
  [WeakRetained _removeRemoteConnection];
  objc_super v6 = [WeakRetained errorHandler];

  if (v6)
  {
    int v7 = [WeakRetained errorHandler];
    v7[2]();
  }
}

- (void)_removeRemoteConnection
{
  objc_super v3 = [(AMSHTTPArchiveService *)self connection];
  [v3 invalidate];

  [(AMSHTTPArchiveService *)self setConnection:0];
}

void __37__AMSHTTPArchiveService__sharedProxy__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end