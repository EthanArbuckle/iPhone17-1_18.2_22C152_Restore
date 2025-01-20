@interface AMSUniversalLinksConnection
- (AMSUniversalLinksConnection)init;
- (AMSUniversalLinksServiceProtocol)proxy;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (id)_makeRemoteConnectionInterface;
- (id)_newRemoteConnection;
- (void)_removeRemoteConnection;
- (void)dealloc;
- (void)setConnection:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation AMSUniversalLinksConnection

- (AMSUniversalLinksConnection)init
{
  v6.receiver = self;
  v6.super_class = (Class)AMSUniversalLinksConnection;
  v2 = [(AMSUniversalLinksConnection *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.AppleMediaServices.UniversalLinks", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (AMSUniversalLinksServiceProtocol)proxy
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__71;
  v11 = __Block_byref_object_dispose__71;
  id v12 = 0;
  dispatch_queue_t v3 = [(AMSUniversalLinksConnection *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__AMSUniversalLinksConnection_proxy__block_invoke;
  v6[3] = &unk_1E55A30A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (AMSUniversalLinksServiceProtocol *)v4;
}

void __36__AMSUniversalLinksConnection_proxy__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) connection];
  if (!v2)
  {
    v2 = (void *)[*(id *)(a1 + 32) _newRemoteConnection];
    [*(id *)(a1 + 32) setConnection:v2];
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__AMSUniversalLinksConnection_proxy__block_invoke_2;
  v6[3] = &unk_1E559F028;
  v6[4] = *(void *)(a1 + 32);
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __36__AMSUniversalLinksConnection_proxy__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = +[AMSLogConfig sharedConfig];
  if (!v3)
  {
    uint64_t v3 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = objc_opt_class();
    objc_super v6 = AMSLogKey();
    int v7 = 138543874;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    v10 = v6;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to retrieve remote object. %{public}@", (uint8_t *)&v7, 0x20u);
  }
}

- (void)dealloc
{
  [(AMSUniversalLinksConnection *)self _removeRemoteConnection];
  v3.receiver = self;
  v3.super_class = (Class)AMSUniversalLinksConnection;
  [(AMSUniversalLinksConnection *)&v3 dealloc];
}

- (id)_makeRemoteConnectionInterface
{
  id v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDD517E8];
  objc_super v3 = +[AMSUniversalLinksUpdateResult archiveClasses];
  [v2 setClasses:v3 forSelector:sel_updateWithCompletion_ argumentIndex:0 ofReply:1];

  return v2;
}

- (id)_newRemoteConnection
{
  objc_super v3 = [(AMSUniversalLinksConnection *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.xpc.amsuniversallinks" options:0];
  uint64_t v5 = [(AMSUniversalLinksConnection *)self queue];
  [v4 _setQueue:v5];

  objc_super v6 = [(AMSUniversalLinksConnection *)self _makeRemoteConnectionInterface];
  [v4 setRemoteObjectInterface:v6];

  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__AMSUniversalLinksConnection__newRemoteConnection__block_invoke;
  v10[3] = &unk_1E559F890;
  objc_copyWeak(&v11, &location);
  [v4 setInvalidationHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__AMSUniversalLinksConnection__newRemoteConnection__block_invoke_2;
  v8[3] = &unk_1E559F890;
  objc_copyWeak(&v9, &location);
  [v4 setInterruptionHandler:v8];
  [v4 resume];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v4;
}

void __51__AMSUniversalLinksConnection__newRemoteConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _removeRemoteConnection];
}

void __51__AMSUniversalLinksConnection__newRemoteConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _removeRemoteConnection];
}

- (void)_removeRemoteConnection
{
  objc_super v3 = [(AMSUniversalLinksConnection *)self connection];
  [v3 invalidate];

  [(AMSUniversalLinksConnection *)self setConnection:0];
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end