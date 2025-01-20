@interface DNDSRemoteAppConfigurationServiceProvider
- (DNDSRemoteAppConfigurationServiceProvider)initWithClientDetailsProvider:(id)a3;
- (DNDSRemoteAppConfigurationServiceProviderDelegate)delegate;
- (void)_addConnection:(id)a3;
- (void)_handleClientConnectionInterrupted:(id)a3;
- (void)_handleClientConnectionInvalidated:(id)a3;
- (void)_removeConnection:(id)a3;
- (void)dealloc;
- (void)getCurrentAppConfigurationForActionIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)invalidate;
- (void)invalidateAppContextForActionIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)resume;
- (void)setDelegate:(id)a3;
@end

@implementation DNDSRemoteAppConfigurationServiceProvider

void __87__DNDSRemoteAppConfigurationServiceProvider_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MEMORY[0x1E4F50BE0] userInitiated];
  [v3 setServiceQuality:v4];

  v5 = DNDRemoteAppConfigurationServiceServerInterface();
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__DNDSRemoteAppConfigurationServiceProvider_listener_didReceiveConnection_withContext___block_invoke_2;
  v8[3] = &unk_1E6973990;
  a1 += 40;
  objc_copyWeak(&v9, (id *)a1);
  [v3 setInterruptionHandler:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __87__DNDSRemoteAppConfigurationServiceProvider_listener_didReceiveConnection_withContext___block_invoke_3;
  v6[3] = &unk_1E6973990;
  objc_copyWeak(&v7, (id *)a1);
  [v3 setInvalidationHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
}

- (void)getCurrentAppConfigurationForActionIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v8 = NSString;
  id v9 = (void (**)(id, void *, id))a5;
  id v10 = a3;
  v11 = NSStringFromSelector(a2);
  id v12 = [v8 stringWithFormat:@"com.apple.donotdisturbd.%@", v11];
  [v12 UTF8String];
  v13 = (void *)os_transaction_create();

  v14 = [MEMORY[0x1E4F50BA0] currentContext];
  long long v28 = 0u;
  long long v29 = 0u;
  v15 = [v14 remoteProcess];
  v16 = [v15 auditToken];
  v17 = v16;
  if (v16)
  {
    [v16 realToken];
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
  }

  v18 = [v14 remoteProcess];
  v19 = [v18 bundleIdentifier];

  *(_OWORD *)buf = v28;
  long long v31 = v29;
  v20 = [MEMORY[0x1E4F223F8] bundleRecordForAuditToken:buf error:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v21 = [v20 bundleIdentifier];

    v19 = (void *)v21;
  }
  v22 = _DNDSPrimaryBundleIdentifier(v19);

  v23 = DNDSLogAppConfigurationServiceProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogAppConfigurationServiceProvider, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v22;
    _os_log_impl(&dword_1D3052000, v23, OS_LOG_TYPE_DEFAULT, "Client request to get current app configuration: bundleIdentifier=%{public}@", buf, 0xCu);
  }
  v24 = [(DNDSRemoteAppConfigurationServiceProvider *)self delegate];
  id v27 = 0;
  v25 = [v24 remoteAppConfigurationServiceProvider:self getCurrentAppConfigurationForActionIdentifier:v10 bundleIdentifier:v22 withError:&v27];

  id v26 = v27;
  v9[2](v9, v25, v26);
}

- (DNDSRemoteAppConfigurationServiceProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DNDSRemoteAppConfigurationServiceProviderDelegate *)WeakRetained;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v8 = (BSServiceConnectionListener *)a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  if (self->_requestListener == v8)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __87__DNDSRemoteAppConfigurationServiceProvider_listener_didReceiveConnection_withContext___block_invoke;
    v12[3] = &unk_1E69739B8;
    v12[4] = self;
    objc_copyWeak(&v13, &location);
    [v9 configureConnection:v12];
    objc_destroyWeak(&v13);
    [(DNDSRemoteAppConfigurationServiceProvider *)self _addConnection:v9];
    [v9 activate];
    v11 = DNDSLogAppConfigurationServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogAppConfigurationServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v9;
      _os_log_impl(&dword_1D3052000, v11, OS_LOG_TYPE_DEFAULT, "XPC connection successfully accepted: connection=%{public}@", buf, 0xCu);
    }
  }
  else
  {
    [v9 invalidate];
  }
  objc_destroyWeak(&location);
}

- (void)_addConnection:(id)a3
{
  p_accessLock = &self->_accessLock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_accessLock);
  os_unfair_lock_lock(p_accessLock);
  [(NSMutableSet *)self->_connections addObject:v5];

  os_unfair_lock_unlock(p_accessLock);
}

- (DNDSRemoteAppConfigurationServiceProvider)initWithClientDetailsProvider:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DNDSRemoteAppConfigurationServiceProvider;
  v6 = [(DNDSRemoteAppConfigurationServiceProvider *)&v17 init];
  id v7 = v6;
  if (v6)
  {
    v6->_accessLock._os_unfair_lock_opaque = 0;
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    connections = v7->_connections;
    v7->_connections = v8;

    id v10 = (void *)MEMORY[0x1E4F50BC8];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __75__DNDSRemoteAppConfigurationServiceProvider_initWithClientDetailsProvider___block_invoke;
    v15[3] = &unk_1E6973968;
    v11 = v7;
    id v16 = v11;
    uint64_t v12 = [v10 listenerWithConfigurator:v15];
    requestListener = v11->_requestListener;
    v11->_requestListener = (BSServiceConnectionListener *)v12;

    objc_storeStrong((id *)&v11->_clientDetailsProvider, a3);
  }

  return v7;
}

void __75__DNDSRemoteAppConfigurationServiceProvider_initWithClientDetailsProvider___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 setDomain:@"com.apple.donotdisturb.appconfiguration.service.launching"];
  id v3 = DNDRemoteAppConfigurationServiceServerInterface();
  v4 = [v3 identifier];
  [v5 setService:v4];

  [v5 setDelegate:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  [(DNDSRemoteAppConfigurationServiceProvider *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)DNDSRemoteAppConfigurationServiceProvider;
  [(DNDSRemoteAppConfigurationServiceProvider *)&v3 dealloc];
}

- (void)resume
{
  [(BSServiceConnectionListener *)self->_requestListener activate];
  id v2 = (id)[MEMORY[0x1E4F50BF0] activateManualDomain:@"com.apple.donotdisturb.appconfiguration.service.launching"];
}

- (void)invalidate
{
}

void __87__DNDSRemoteAppConfigurationServiceProvider_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleClientConnectionInterrupted:v3];
}

void __87__DNDSRemoteAppConfigurationServiceProvider_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleClientConnectionInvalidated:v3];
}

- (void)invalidateAppContextForActionIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v8 = NSString;
  id v9 = (void (**)(id, void *, id))a5;
  id v10 = a3;
  v11 = NSStringFromSelector(a2);
  id v12 = [v8 stringWithFormat:@"com.apple.donotdisturbd.%@", v11];
  [v12 UTF8String];
  id v13 = (void *)os_transaction_create();

  v14 = [MEMORY[0x1E4F50BA0] currentContext];
  long long v28 = 0u;
  long long v29 = 0u;
  v15 = [v14 remoteProcess];
  id v16 = [v15 auditToken];
  objc_super v17 = v16;
  if (v16)
  {
    [v16 realToken];
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
  }

  v18 = [v14 remoteProcess];
  v19 = [v18 bundleIdentifier];

  *(_OWORD *)buf = v28;
  long long v31 = v29;
  v20 = [MEMORY[0x1E4F223F8] bundleRecordForAuditToken:buf error:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v21 = [v20 containingBundleRecord];
    uint64_t v22 = [v21 bundleIdentifier];

    v20 = v21;
    v19 = (void *)v22;
  }
  v23 = DNDSLogAppConfigurationServiceProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogAppConfigurationServiceProvider, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v19;
    _os_log_impl(&dword_1D3052000, v23, OS_LOG_TYPE_DEFAULT, "Client request to invalidate app context: bundleIdentifier=%{public}@", buf, 0xCu);
  }
  v24 = [(DNDSRemoteAppConfigurationServiceProvider *)self delegate];
  id v27 = 0;
  [v24 remoteAppConfigurationServiceProvider:self invalidateAppContextForActionIdentifier:v10 bundleIdentifier:v19 withError:&v27];

  id v25 = v27;
  id v26 = [NSNumber numberWithInt:v25 == 0];
  v9[2](v9, v26, v25);
}

- (void)_handleClientConnectionInterrupted:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = DNDSLogAppConfigurationServiceProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogAppConfigurationServiceProvider, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Client XPC connection was interrupted: connection=%{public}@", (uint8_t *)&v6, 0xCu);
  }
  [(DNDSRemoteAppConfigurationServiceProvider *)self _removeConnection:v4];
}

- (void)_handleClientConnectionInvalidated:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = DNDSLogAppConfigurationServiceProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogAppConfigurationServiceProvider, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Client XPC connection was invalidated: connection=%{public}@", (uint8_t *)&v6, 0xCu);
  }
  [(DNDSRemoteAppConfigurationServiceProvider *)self _removeConnection:v4];
}

- (void)_removeConnection:(id)a3
{
  p_accessLock = &self->_accessLock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_accessLock);
  os_unfair_lock_lock(p_accessLock);
  [(NSMutableSet *)self->_connections removeObject:v5];

  os_unfair_lock_unlock(p_accessLock);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_clientDetailsProvider, 0);
  objc_storeStrong((id *)&self->_requestListener, 0);
}

@end