@interface LNExtensionConnection
- (BOOL)refreshWithOptions:(id)a3;
- (_EXExtensionProcess)extensionProcess;
- (id)extensionIdentityWithExtensionPointIdentifier:(id)a3 error:(id *)a4;
- (void)connectDirectlyWithOptions:(id)a3;
- (void)connectUsingMediatorWithOptions:(id)a3;
- (void)connectWithOptions:(id)a3;
- (void)dealloc;
- (void)invalidateExtensionProcess;
- (void)setExtensionProcess:(id)a3;
@end

@implementation LNExtensionConnection

void __57__LNExtensionConnection_connectUsingMediatorWithOptions___block_invoke_17(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__LNExtensionConnection_connectUsingMediatorWithOptions___block_invoke_2;
  aBlock[3] = &unk_1E5B3A0B0;
  id v14 = *(id *)(a1 + 32);
  v10 = (void (**)(void))_Block_copy(aBlock);
  v11 = *(void **)(a1 + 40);
  if (v9)
  {
    [v11 setDisconnectedWithError:v9];
  }
  else
  {
    if (v8) {
      objc_msgSend(v8, "if_auditToken");
    }
    else {
      memset(v12, 0, sizeof(v12));
    }
    [v11 connectUsingListenerEndpoint:v7 auditToken:v12 setupWithAssertions:1];
  }
  v10[2](v10);
}

uint64_t __57__LNExtensionConnection_connectUsingMediatorWithOptions___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)connectWithOptions:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)LNExtensionConnection;
  [(LNConnection *)&v5 connectWithOptions:v4];
  if (![(LNConnection *)self connectUsingProcessIdentifierWithOptions:v4 setupWithAssertions:1])
  {
    getpid();
    if (sandbox_check()) {
      -[LNExtensionConnection connectDirectlyWithOptions:](self, "connectDirectlyWithOptions:", v4, "com.apple.linkd.extension");
    }
    else {
      -[LNExtensionConnection connectUsingMediatorWithOptions:](self, "connectUsingMediatorWithOptions:", v4, "com.apple.linkd.extension");
    }
  }
}

- (void)connectUsingMediatorWithOptions:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [(LNConnection *)self logPrefix];
    LODWORD(buf.opaque[0]) = 138543362;
    *(uint64_t *)((char *)buf.opaque + 4) = (uint64_t)v6;
    _os_log_impl(&dword_1A4419000, v5, OS_LOG_TYPE_INFO, "%{public}@ Establishing a mediator connection to the extension", (uint8_t *)&buf, 0xCu);
  }
  id v7 = [(LNConnection *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.linkd.extension" options:0];
  id v9 = LNDaemonExtensionXPCInterface();
  [v8 setRemoteObjectInterface:v9];

  v10 = [(LNConnection *)self activity];
  buf.opaque[0] = 0;
  buf.opaque[1] = 0;
  os_activity_scope_enter(v10, &buf);
  v11 = [(LNConnection *)self queue];
  [v8 _setQueue:v11];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __57__LNExtensionConnection_connectUsingMediatorWithOptions___block_invoke;
  v19[3] = &unk_1E5B3A0B0;
  v19[4] = v10;
  [v8 setInterruptionHandler:v19];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __57__LNExtensionConnection_connectUsingMediatorWithOptions___block_invoke_16;
  v18[3] = &unk_1E5B3A0B0;
  v18[4] = v10;
  [v8 setInvalidationHandler:v18];
  [v8 resume];
  v12 = [v8 remoteObjectProxy];
  v13 = [(LNConnection *)self bundleIdentifier];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__LNExtensionConnection_connectUsingMediatorWithOptions___block_invoke_17;
  v15[3] = &unk_1E5B39B68;
  id v14 = v8;
  id v16 = v14;
  v17 = self;
  [v12 getConnectionHostInterfaceForBundleIdentifier:v13 completionHandler:v15];

  os_activity_scope_leave(&buf);
}

void __57__LNExtensionConnection_connectUsingMediatorWithOptions___block_invoke_16(uint64_t a1)
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  v1 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1A4419000, v1, OS_LOG_TYPE_INFO, "Extension Mediator XPC connection has been invalidated", v2, 2u);
  }

  os_activity_scope_leave(&state);
}

- (BOOL)refreshWithOptions:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LNExtensionConnection;
  BOOL v4 = [(LNConnection *)&v6 refreshWithOptions:a3];
  if (v4) {
    [(LNConnection *)self setConnected];
  }
  return v4;
}

- (void).cxx_destruct
{
}

- (void)setExtensionProcess:(id)a3
{
}

- (_EXExtensionProcess)extensionProcess
{
  return self->_extensionProcess;
}

- (id)extensionIdentityWithExtensionPointIdentifier:(id)a3 error:(id *)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(LNConnection *)self queue];
  dispatch_assert_queue_V2(v7);

  if (a4) {
    *a4 = 0;
  }
  id v8 = objc_alloc(MEMORY[0x1E4F25880]);
  id v9 = (void *)MEMORY[0x1E4F28F60];
  v10 = [(LNConnection *)self bundleIdentifier];
  v11 = [v9 predicateWithFormat:@"bundleIdentifier = %@", v10];
  v12 = (void *)[v8 initWithExtensionPointIdentifier:v6 predicate:v11];

  v13 = [MEMORY[0x1E4F25888] executeQuery:v12];
  if ([v13 count])
  {
    if ((unint64_t)[v13 count] >= 2)
    {
      id v14 = getLNLogCategoryConnection();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = [(LNConnection *)self bundleIdentifier];
        id v16 = [v13 firstObject];
        v17 = [v16 url];
        *(_DWORD *)os_activity_scope_state_s buf = 138412546;
        v25 = v15;
        __int16 v26 = 2112;
        v27 = v17;
      }
    }
    a4 = [v13 firstObject];
  }
  else if (a4)
  {
    v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = *MEMORY[0x1E4F28568];
    v19 = NSString;
    uint64_t v21 = v20 = [(LNConnection *)self bundleIdentifier];
    v29[0] = v21;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    *a4 = [v18 errorWithDomain:@"LNConnectionErrorDomain" code:1100 userInfo:v22];

    a4 = 0;
  }

  return a4;
}

void __57__LNExtensionConnection_connectUsingMediatorWithOptions___block_invoke(uint64_t a1)
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  v1 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1A4419000, v1, OS_LOG_TYPE_INFO, "Extension Mediator XPC connection has been interrupted", v2, 2u);
  }

  os_activity_scope_leave(&state);
}

- (void)connectDirectlyWithOptions:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  BOOL v4 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    objc_super v5 = [(LNConnection *)self logPrefix];
    *(_DWORD *)os_activity_scope_state_s buf = 138543362;
    v34 = v5;
  }
  id v6 = [(LNConnection *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = objc_alloc(MEMORY[0x1E4F223A0]);
  id v8 = [(LNConnection *)self bundleIdentifier];
  id v32 = 0;
  id v9 = (void *)[v7 initWithBundleIdentifier:v8 error:&v32];
  id v10 = v32;

  if (v9)
  {
    id v30 = v10;
    uint64_t v31 = 0;
    v11 = +[LNExtensionHostConfigurator extensionProcessWithExtensionRecord:v9 extensionType:&v31 error:&v30];
    id v12 = v30;

    [(LNExtensionConnection *)self setExtensionProcess:v11];
    v13 = [(LNExtensionConnection *)self extensionProcess];

    if (v13)
    {
      id v14 = [(LNExtensionConnection *)self extensionProcess];
      v15 = v14;
      if (v14)
      {
        [v14 auditToken];
      }
      else
      {
        long long v28 = 0u;
        long long v29 = 0u;
      }
      v27[0] = v28;
      v27[1] = v29;
      [(LNConnection *)self setAuditToken:v27];

      v18 = [(LNExtensionConnection *)self extensionProcess];
      id v26 = v12;
      v19 = [v18 makeXPCConnectionWithError:&v26];
      id v20 = v26;

      [(LNConnection *)self setXPCConnection:v19];
      uint64_t v21 = [(LNConnection *)self xpcConnection];

      if (v21)
      {
        v22 = [(LNConnection *)self xpcConnection];
        v23 = [(LNConnection *)self bundleIdentifier];
        v24 = LNConnectionHostXPCInterface();
        objc_msgSend(v22, "ln_configureWithBundleIdentifier:interface:", v23, v24);

        v25 = [(LNConnection *)self xpcConnection];
        [v25 resume];

        [(LNConnection *)self setConnected];
      }
      else
      {
        [(LNConnection *)self setDisconnectedWithError:v20];
      }
      id v12 = v20;
    }
    else
    {
      id v16 = getLNLogCategoryConnection();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = [(LNConnection *)self logPrefix];
        *(_DWORD *)os_activity_scope_state_s buf = 138543618;
        v34 = v17;
        __int16 v35 = 2114;
        id v36 = v12;
        _os_log_impl(&dword_1A4419000, v16, OS_LOG_TYPE_ERROR, "%{public}@ No extension process: %{public}@", buf, 0x16u);
      }
      [(LNConnection *)self setDisconnectedWithError:v12];
    }
    id v10 = v12;
  }
  else
  {
    [(LNConnection *)self setDisconnectedWithError:v10];
  }
}

- (void)dealloc
{
  [(LNExtensionConnection *)self invalidateExtensionProcess];
  v3.receiver = self;
  v3.super_class = (Class)LNExtensionConnection;
  [(LNConnection *)&v3 dealloc];
}

- (void)invalidateExtensionProcess
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  extensionProcess = self->_extensionProcess;
  if (extensionProcess)
  {
    [(_EXExtensionProcess *)extensionProcess invalidate];
    BOOL v4 = self->_extensionProcess;
    self->_extensionProcess = 0;

    objc_super v5 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [(LNConnection *)self logPrefix];
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl(&dword_1A4419000, v5, OS_LOG_TYPE_INFO, "%{public}@ Invalidated extension process on dealloc", (uint8_t *)&v7, 0xCu);
    }
  }
}

@end