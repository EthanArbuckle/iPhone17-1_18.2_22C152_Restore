@interface APConnectionNotifier
+ (APConnectionNotifier)sharedNotifier;
- (APConnectionNotifier)init;
- (ConnectionProtocol)remoteObjectProxy;
- (NSXPCConnection)underlyingRemoteConnection;
- (OS_dispatch_queue)connectionQueue;
- (id)_newRemoteConnection;
- (id)_remoteConnection;
- (void)setUnderlyingRemoteConnection:(id)a3;
@end

@implementation APConnectionNotifier

- (APConnectionNotifier)init
{
  v6.receiver = self;
  v6.super_class = (Class)APConnectionNotifier;
  v2 = [(APConnectionNotifier *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.AskPermission.APConnectionNotifier", 0);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (ConnectionProtocol)remoteObjectProxy
{
  objc_initWeak(&location, self);
  dispatch_queue_t v3 = [(APConnectionNotifier *)self _remoteConnection];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__APConnectionNotifier_remoteObjectProxy__block_invoke;
  v6[3] = &unk_26474E340;
  objc_copyWeak(&v7, &location);
  v4 = [v3 remoteObjectProxyWithErrorHandler:v6];
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
  return (ConnectionProtocol *)v4;
}

void __41__APConnectionNotifier_remoteObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = +[APLogConfig sharedFrameworkConfig];
  if (!v5)
  {
    v5 = +[APLogConfig sharedConfig];
  }
  objc_super v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543618;
    id v9 = (id)objc_opt_class();
    __int16 v10 = 2114;
    id v11 = v3;
    id v7 = v9;
    _os_log_impl(&dword_2256FB000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Remote object proxy error. Error:%{public}@", (uint8_t *)&v8, 0x16u);
  }
}

+ (APConnectionNotifier)sharedNotifier
{
  if (sharedNotifier_ap_once_token___COUNTER__ != -1) {
    dispatch_once(&sharedNotifier_ap_once_token___COUNTER__, &__block_literal_global);
  }
  v2 = (void *)sharedNotifier_ap_once_object___COUNTER__;
  return (APConnectionNotifier *)v2;
}

uint64_t __38__APConnectionNotifier_sharedNotifier__block_invoke()
{
  sharedNotifier_ap_once_object___COUNTER__ = objc_alloc_init(APConnectionNotifier);
  return MEMORY[0x270F9A758]();
}

- (id)_remoteConnection
{
  id v3 = [(APConnectionNotifier *)self underlyingRemoteConnection];

  if (!v3)
  {
    v4 = [(APConnectionNotifier *)self connectionQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__APConnectionNotifier__remoteConnection__block_invoke;
    block[3] = &unk_26474E388;
    block[4] = self;
    dispatch_sync(v4, block);
  }
  v5 = [(APConnectionNotifier *)self underlyingRemoteConnection];
  return v5;
}

void __41__APConnectionNotifier__remoteConnection__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) underlyingRemoteConnection];

  if (!v2)
  {
    id v3 = (id)[*(id *)(a1 + 32) _newRemoteConnection];
    [*(id *)(a1 + 32) setUnderlyingRemoteConnection:v3];
  }
}

- (id)_newRemoteConnection
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = [(APConnectionNotifier *)self connectionQueue];
  dispatch_assert_queue_V2(v3);

  v4 = +[APLogConfig sharedFrameworkConfig];
  if (!v4)
  {
    v4 = +[APLogConfig sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = (id)objc_opt_class();
    id v6 = v20;
    _os_log_impl(&dword_2256FB000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Creating a remote connection", buf, 0xCu);
  }
  id v7 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.askpermissiond" options:0];
  int v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D8E5A20];
  [v7 setRemoteObjectInterface:v8];
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __44__APConnectionNotifier__newRemoteConnection__block_invoke;
  v16[3] = &unk_26474E3B0;
  objc_copyWeak(&v17, &location);
  [v7 setInvalidationHandler:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __44__APConnectionNotifier__newRemoteConnection__block_invoke_78;
  v14[3] = &unk_26474E3B0;
  objc_copyWeak(&v15, &location);
  [v7 setInterruptionHandler:v14];
  id v9 = +[APLogConfig sharedFrameworkConfig];
  if (!v9)
  {
    id v9 = +[APLogConfig sharedConfig];
  }
  __int16 v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    id v20 = v11;
    id v12 = v11;
    _os_log_impl(&dword_2256FB000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Resuming remote connection", buf, 0xCu);
  }
  [v7 resume];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v7;
}

void __44__APConnectionNotifier__newRemoteConnection__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = +[APLogConfig sharedFrameworkConfig];
  if (!v2)
  {
    v2 = +[APLogConfig sharedConfig];
  }
  id v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_2256FB000, v3, OS_LOG_TYPE_ERROR, "%{public}@: Remote connection invalidated", (uint8_t *)&v5, 0xCu);
  }
  [WeakRetained setUnderlyingRemoteConnection:0];
}

void __44__APConnectionNotifier__newRemoteConnection__block_invoke_78(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = +[APLogConfig sharedFrameworkConfig];
  if (!v2)
  {
    v2 = +[APLogConfig sharedConfig];
  }
  id v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_2256FB000, v3, OS_LOG_TYPE_ERROR, "%{public}@: Remote connection interrupted", (uint8_t *)&v5, 0xCu);
  }
  [WeakRetained setUnderlyingRemoteConnection:0];
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (NSXPCConnection)underlyingRemoteConnection
{
  return self->_underlyingRemoteConnection;
}

- (void)setUnderlyingRemoteConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingRemoteConnection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
}

@end