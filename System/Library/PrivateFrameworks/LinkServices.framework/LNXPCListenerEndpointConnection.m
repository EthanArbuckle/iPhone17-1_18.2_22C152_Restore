@interface LNXPCListenerEndpointConnection
- (BOOL)refreshWithOptions:(id)a3;
- (LNXPCListenerEndpointConnection)initWithEffectiveBundleIdentifier:(id)a3 appBundleIdentifier:(id)a4 processInstanceIdentifier:(id)a5 appIntentsEnabledOnly:(BOOL)a6 userIdentity:(id)a7 listenerEndpoint:(id)a8 auditToken:(id *)a9 error:(id *)a10;
- (NSXPCListenerEndpoint)listenerEndpoint;
- (void)acquireAssertionsForConnectionOperation:(id)a3;
- (void)connectWithOptions:(id)a3;
@end

@implementation LNXPCListenerEndpointConnection

- (void).cxx_destruct
{
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return self->_listenerEndpoint;
}

- (void)acquireAssertionsForConnectionOperation:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v4 = [(LNConnection *)self queue];
  dispatch_assert_queue_V2(v4);

  v5 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [(LNConnection *)self logPrefix];
    int v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1A4419000, v5, OS_LOG_TYPE_INFO, "%{public}@ Assertion is not required for XPC listener endpoint connection", (uint8_t *)&v7, 0xCu);
  }
}

- (BOOL)refreshWithOptions:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LNXPCListenerEndpointConnection;
  BOOL v4 = [(LNConnection *)&v6 refreshWithOptions:a3];
  if (v4) {
    [(LNConnection *)self setConnected];
  }
  return v4;
}

- (void)connectWithOptions:(id)a3
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)LNXPCListenerEndpointConnection;
  [(LNConnection *)&v17 connectWithOptions:v4];
  [(LNConnection *)self auditToken];
  if (+[LNEntitlementsValidator validateEntitlement:@"com.apple.private.appintents.xpc-host" auditToken:v16 validator:&__block_literal_global_13831])
  {
    id v5 = objc_alloc(MEMORY[0x1E4F29268]);
    objc_super v6 = [(LNXPCListenerEndpointConnection *)self listenerEndpoint];
    int v7 = (void *)[v5 initWithListenerEndpoint:v6];
    [(LNConnection *)self setXPCConnection:v7];

    v8 = [(LNConnection *)self xpcConnection];
    uint64_t v9 = [(LNConnection *)self bundleIdentifier];
    v10 = LNConnectionHostXPCInterface();
    objc_msgSend(v8, "ln_configureWithBundleIdentifier:interface:", v9, v10);

    v11 = [(LNConnection *)self xpcConnection];
    [v11 resume];

    objc_initWeak(location, self);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __54__LNXPCListenerEndpointConnection_connectWithOptions___block_invoke_15;
    v14[3] = &unk_1E5B3A4A8;
    objc_copyWeak(&v15, location);
    [(LNConnection *)self setUpConnectionContextWithAssertions:0 completionHandler:v14];
    objc_destroyWeak(&v15);
    objc_destroyWeak(location);
  }
  else
  {
    v12 = LNConnectionErrorWithCode(1015);
    v13 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v12;
      _os_log_impl(&dword_1A4419000, v13, OS_LOG_TYPE_ERROR, "Unable to connect using an XPC listener endpoint: %{public}@", (uint8_t *)location, 0xCu);
    }

    [(LNConnection *)self setDisconnectedWithError:v12];
  }
}

void __54__LNXPCListenerEndpointConnection_connectWithOptions___block_invoke_15(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (v3)
  {
    objc_super v6 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v3;
      _os_log_impl(&dword_1A4419000, v6, OS_LOG_TYPE_ERROR, "Unable to connect using an XPC listener endpoint. Failed to set connection context: %{public}@", buf, 0xCu);
    }

    int v7 = [v5 xpcConnection];
    [v7 invalidate];

    [v5 setDisconnectedWithError:v3];
  }
  else
  {
    *(_OWORD *)buf = 0u;
    long long v21 = 0u;
    v8 = [WeakRetained xpcConnection];
    uint64_t v9 = v8;
    if (v8)
    {
      [v8 auditToken];
    }
    else
    {
      *(_OWORD *)buf = 0u;
      long long v21 = 0u;
    }

    if (v5)
    {
      [v5 auditToken];
    }
    else
    {
      long long v16 = 0u;
      long long v17 = 0u;
    }
    *(_OWORD *)v18 = *(_OWORD *)buf;
    long long v19 = v21;
    if (*(void *)buf == (void)v16
      && *(void *)&buf[8] == *((void *)&v16 + 1)
      && (void)v21 == (void)v17
      && *((void *)&v21 + 1) == *((void *)&v17 + 1))
    {
      [v5 setConnected];
    }
    else
    {
      v13 = LNConnectionErrorWithCode(1016);
      v14 = getLNLogCategoryConnection();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v18 = 138543362;
        *(void *)&v18[4] = v13;
        _os_log_impl(&dword_1A4419000, v14, OS_LOG_TYPE_ERROR, "Unable to connect using an XPC listener endpoint: %{public}@", v18, 0xCu);
      }

      id v15 = [v5 xpcConnection];
      [v15 invalidate];

      [v5 setDisconnectedWithError:v13];
    }
  }
}

uint64_t __54__LNXPCListenerEndpointConnection_connectWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v3 = v2;
    }
    else {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }
  id v4 = v3;
  uint64_t v5 = [v4 BOOLValue];

  return v5;
}

- (LNXPCListenerEndpointConnection)initWithEffectiveBundleIdentifier:(id)a3 appBundleIdentifier:(id)a4 processInstanceIdentifier:(id)a5 appIntentsEnabledOnly:(BOOL)a6 userIdentity:(id)a7 listenerEndpoint:(id)a8 auditToken:(id *)a9 error:(id *)a10
{
  BOOL v12 = a6;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)LNXPCListenerEndpointConnection;
  v18 = [(LNConnection *)&v24 initWithEffectiveBundleIdentifier:a3 appBundleIdentifier:a4 processInstanceIdentifier:a5 appIntentsEnabledOnly:v12 userIdentity:a7 error:a10];
  long long v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_listenerEndpoint, a8);
    long long v20 = *(_OWORD *)&a9->var0[4];
    v23[0] = *(_OWORD *)a9->var0;
    v23[1] = v20;
    [(LNConnection *)v19 setAuditToken:v23];
    long long v21 = v19;
  }

  return v19;
}

@end