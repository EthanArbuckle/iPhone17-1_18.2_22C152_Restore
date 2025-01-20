@interface LNDaemonConnection
- (BOOL)refreshWithOptions:(id)a3;
- (NSXPCConnection)mediatorXPCConnection;
- (void)connectWithOptions:(id)a3;
- (void)setMediatorXPCConnection:(id)a3;
@end

@implementation LNDaemonConnection

- (void).cxx_destruct
{
}

- (void)setMediatorXPCConnection:(id)a3
{
}

- (NSXPCConnection)mediatorXPCConnection
{
  return self->_mediatorXPCConnection;
}

- (BOOL)refreshWithOptions:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LNDaemonConnection;
  BOOL v4 = [(LNConnection *)&v6 refreshWithOptions:a3];
  if (v4) {
    [(LNConnection *)self setConnected];
  }
  return v4;
}

- (void)connectWithOptions:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)LNDaemonConnection;
  [(LNConnection *)&v27 connectWithOptions:v4];
  v5 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_super v6 = [(LNConnection *)self logPrefix];
    LODWORD(buf.opaque[0]) = 138543362;
    *(uint64_t *)((char *)buf.opaque + 4) = (uint64_t)v6;
    _os_log_impl(&dword_1A4419000, v5, OS_LOG_TYPE_INFO, "%{public}@ Establishing a mediator connection to the daemon", (uint8_t *)&buf, 0xCu);
  }
  v7 = [(LNConnection *)self queue];
  dispatch_assert_queue_V2(v7);

  v8 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.linkd.extension" options:0];
  [(LNDaemonConnection *)self setMediatorXPCConnection:v8];

  v9 = LNDaemonExtensionXPCInterface();
  v10 = [(LNDaemonConnection *)self mediatorXPCConnection];
  [v10 setRemoteObjectInterface:v9];

  v11 = [(LNConnection *)self activity];
  buf.opaque[0] = 0;
  buf.opaque[1] = 0;
  os_activity_scope_enter(v11, &buf);
  objc_initWeak(&location, self);
  v12 = [(LNDaemonConnection *)self mediatorXPCConnection];
  v13 = [(LNConnection *)self queue];
  [v12 _setQueue:v13];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __41__LNDaemonConnection_connectWithOptions___block_invoke;
  v24[3] = &unk_1E5B3A060;
  v24[4] = v11;
  objc_copyWeak(&v25, &location);
  v14 = [(LNDaemonConnection *)self mediatorXPCConnection];
  [v14 setInterruptionHandler:v24];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __41__LNDaemonConnection_connectWithOptions___block_invoke_8;
  v22[3] = &unk_1E5B3A060;
  v22[4] = v11;
  objc_copyWeak(&v23, &location);
  v15 = [(LNDaemonConnection *)self mediatorXPCConnection];
  [v15 setInvalidationHandler:v22];

  v16 = [(LNDaemonConnection *)self mediatorXPCConnection];
  [v16 resume];

  v17 = [(LNDaemonConnection *)self mediatorXPCConnection];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __41__LNDaemonConnection_connectWithOptions___block_invoke_9;
  v21[3] = &unk_1E5B39828;
  v21[4] = self;
  v18 = [v17 remoteObjectProxyWithErrorHandler:v21];
  v19 = [(LNConnection *)self bundleIdentifier];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __41__LNDaemonConnection_connectWithOptions___block_invoke_11;
  v20[3] = &unk_1E5B39258;
  v20[4] = self;
  [v18 getConnectionHostInterfaceForBundleIdentifier:v19 completionHandler:v20];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
  os_activity_scope_leave(&buf);
}

void __41__LNDaemonConnection_connectWithOptions___block_invoke(uint64_t a1)
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A4419000, v3, OS_LOG_TYPE_INFO, "Daemon Mediator XPC connection has been interrupted", v5, 2u);
  }

  if (WeakRetained)
  {
    id v4 = [WeakRetained mediatorXPCConnection];
    [v4 invalidate];

    [WeakRetained setMediatorXPCConnection:0];
  }

  os_activity_scope_leave(&state);
}

void __41__LNDaemonConnection_connectWithOptions___block_invoke_8(uint64_t a1)
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A4419000, v3, OS_LOG_TYPE_INFO, "Daemon Mediator XPC connection has been invalidated", v4, 2u);
  }

  if (WeakRetained) {
    [WeakRetained setMediatorXPCConnection:0];
  }

  os_activity_scope_leave(&state);
}

void __41__LNDaemonConnection_connectWithOptions___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__LNDaemonConnection_connectWithOptions___block_invoke_2;
  v7[3] = &unk_1E5B3A0D8;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __41__LNDaemonConnection_connectWithOptions___block_invoke_11(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = *(void **)(a1 + 32);
  if (v9)
  {
    [v10 setDisconnectedWithError:v9];
  }
  else
  {
    if (v8) {
      objc_msgSend(v8, "if_auditToken");
    }
    else {
      memset(v11, 0, sizeof(v11));
    }
    [v10 connectUsingListenerEndpoint:v7 auditToken:v11 setupWithAssertions:0];
  }
}

uint64_t __41__LNDaemonConnection_connectWithOptions___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A4419000, v2, OS_LOG_TYPE_ERROR, "Unable to get remoteObjectProxyWithErrorHandler, error: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) setDisconnectedWithError:*(void *)(a1 + 32)];
}

@end