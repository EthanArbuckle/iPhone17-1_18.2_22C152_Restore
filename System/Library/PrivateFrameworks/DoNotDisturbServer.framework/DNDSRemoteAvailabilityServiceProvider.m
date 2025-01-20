@interface DNDSRemoteAvailabilityServiceProvider
- (DNDSRemoteAvailabilityServiceProvider)initWithClientDetailsProvider:(id)a3;
- (DNDSRemoteAvailabilityServiceProviderDelegate)delegate;
- (void)_addConnection:(id)a3;
- (void)_handleClientConnectionInterrupted:(id)a3;
- (void)_handleClientConnectionInvalidated:(id)a3;
- (void)_removeConnection:(id)a3;
- (void)dealloc;
- (void)getIsLocalUserAvailableWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)resume;
- (void)setDelegate:(id)a3;
@end

@implementation DNDSRemoteAvailabilityServiceProvider

- (DNDSRemoteAvailabilityServiceProvider)initWithClientDetailsProvider:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DNDSRemoteAvailabilityServiceProvider;
  v6 = [(DNDSRemoteAvailabilityServiceProvider *)&v17 init];
  v7 = v6;
  if (v6)
  {
    v6->_accessLock._os_unfair_lock_opaque = 0;
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    connections = v7->_connections;
    v7->_connections = v8;

    v10 = (void *)MEMORY[0x1E4F50BC8];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __71__DNDSRemoteAvailabilityServiceProvider_initWithClientDetailsProvider___block_invoke;
    v15[3] = &unk_1E6973968;
    v11 = v7;
    v16 = v11;
    uint64_t v12 = [v10 listenerWithConfigurator:v15];
    requestListener = v11->_requestListener;
    v11->_requestListener = (BSServiceConnectionListener *)v12;

    objc_storeStrong((id *)&v11->_clientDetailsProvider, a3);
  }

  return v7;
}

void __71__DNDSRemoteAvailabilityServiceProvider_initWithClientDetailsProvider___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 setDomain:@"com.apple.donotdisturb.availability.service.launching"];
  v3 = DNDRemoteAvailabilityServiceServerInterface();
  v4 = [v3 identifier];
  [v5 setService:v4];

  [v5 setDelegate:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  [(DNDSRemoteAvailabilityServiceProvider *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)DNDSRemoteAvailabilityServiceProvider;
  [(DNDSRemoteAvailabilityServiceProvider *)&v3 dealloc];
}

- (void)resume
{
  [(BSServiceConnectionListener *)self->_requestListener activate];
  id v2 = (id)[MEMORY[0x1E4F50BF0] activateManualDomain:@"com.apple.donotdisturb.availability.service.launching"];
}

- (void)invalidate
{
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
    v12[2] = __83__DNDSRemoteAvailabilityServiceProvider_listener_didReceiveConnection_withContext___block_invoke;
    v12[3] = &unk_1E69739B8;
    v12[4] = self;
    objc_copyWeak(&v13, &location);
    [v9 configureConnection:v12];
    objc_destroyWeak(&v13);
    [(DNDSRemoteAvailabilityServiceProvider *)self _addConnection:v9];
    [v9 activate];
    v11 = DNDSLogAvailabilityProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_DEFAULT))
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

void __83__DNDSRemoteAvailabilityServiceProvider_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MEMORY[0x1E4F50BE0] userInitiated];
  [v3 setServiceQuality:v4];

  id v5 = DNDRemoteAvailabilityServiceServerInterface();
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__DNDSRemoteAvailabilityServiceProvider_listener_didReceiveConnection_withContext___block_invoke_2;
  v8[3] = &unk_1E6973990;
  a1 += 40;
  objc_copyWeak(&v9, (id *)a1);
  [v3 setInterruptionHandler:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__DNDSRemoteAvailabilityServiceProvider_listener_didReceiveConnection_withContext___block_invoke_3;
  v6[3] = &unk_1E6973990;
  objc_copyWeak(&v7, (id *)a1);
  [v3 setInvalidationHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
}

void __83__DNDSRemoteAvailabilityServiceProvider_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleClientConnectionInterrupted:v3];
}

void __83__DNDSRemoteAvailabilityServiceProvider_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleClientConnectionInvalidated:v3];
}

- (void)getIsLocalUserAvailableWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v52 = a4;
  v8 = NSString;
  id v9 = NSStringFromSelector(a2);
  id v10 = [v8 stringWithFormat:@"com.apple.donotdisturbd.%@", v9];
  [v10 UTF8String];
  uint64_t v11 = os_transaction_create();

  uint64_t v12 = [MEMORY[0x1E4F50BA0] currentContext];
  long long v54 = 0u;
  long long v55 = 0u;
  id v13 = [v12 remoteProcess];
  v14 = [v13 auditToken];
  v15 = v14;
  v50 = (void *)v11;
  id v51 = v7;
  if (v14)
  {
    [v14 realToken];
  }
  else
  {
    long long v54 = 0u;
    long long v55 = 0u;
  }

  *(_OWORD *)buf = v54;
  *(_OWORD *)&buf[16] = v55;
  int v16 = TCCAccessCheckAuditToken();
  int v17 = objc_msgSend(v12, "dnds_hasUserNotificationsCommunicationEntitlement");
  v18 = [v12 remoteProcess];
  v19 = [v18 bundleIdentifier];

  v20 = (void *)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:v19];
  *(_OWORD *)buf = v54;
  *(_OWORD *)&buf[16] = v55;
  v21 = [MEMORY[0x1E4F223F8] bundleRecordForAuditToken:buf error:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v22 = [v21 containingBundleRecord];
    uint64_t v23 = [v22 bundleIdentifier];

    uint64_t v24 = [objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:v23];
    if (v17)
    {
      int v17 = 1;
    }
    else
    {
      v25 = [v22 entitlements];
      v26 = [v25 objectForKey:@"com.apple.developer.usernotifications.communication" ofClass:objc_opt_class()];
      int v17 = [v26 BOOLValue];
    }
    v20 = (void *)v24;
    v19 = (void *)v23;
  }
  else
  {
    v22 = v21;
  }
  int v27 = DNDGrantedUserNotificationsAuthorizationForBundleIdentifier(v19);
  if (!v16 || !v17 || !v27)
  {
    v36 = (uint64_t *)MEMORY[0x1E4F5F528];
    if (v27)
    {
      id v30 = 0;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_ERROR)) {
        -[DNDSRemoteAvailabilityServiceProvider getIsLocalUserAvailableWithRequestDetails:completionHandler:]();
      }
      v37 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v38 = *v36;
      uint64_t v60 = *MEMORY[0x1E4F28568];
      v61 = @"User Notifications are disabled for this App.";
      v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
      id v30 = [v37 errorWithDomain:v38 code:1004 userInfo:v39];
    }
    v35 = (void (**)(void, void, void))v52;
    if (v16)
    {
      v34 = v51;
      if (v17) {
        goto LABEL_24;
      }
    }
    else
    {
      v34 = v51;
      if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_ERROR)) {
        -[DNDSRemoteAvailabilityServiceProvider getIsLocalUserAvailableWithRequestDetails:completionHandler:]();
      }
      v40 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v41 = *MEMORY[0x1E4F5F528];
      uint64_t v58 = *MEMORY[0x1E4F28568];
      v59 = @"Focus Status is not shared with this App.";
      v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
      uint64_t v43 = [v40 errorWithDomain:v41 code:1004 userInfo:v42];

      id v30 = (id)v43;
      v35 = (void (**)(void, void, void))v52;
      if (v17)
      {
LABEL_24:
        v33 = v50;
        if (!v35) {
          goto LABEL_33;
        }
        goto LABEL_32;
      }
    }
    if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteAvailabilityServiceProvider getIsLocalUserAvailableWithRequestDetails:completionHandler:]();
    }
    v44 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v45 = *MEMORY[0x1E4F5F528];
    uint64_t v56 = *MEMORY[0x1E4F28568];
    v57 = @"App is missing Communication Notifications entitlement.";
    v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
    uint64_t v47 = [v44 errorWithDomain:v45 code:1004 userInfo:v46];

    id v30 = (id)v47;
    v33 = v50;
    v35 = (void (**)(void, void, void))v52;
    if (!v52) {
      goto LABEL_33;
    }
LABEL_32:
    ((void (**)(void, void, id))v35)[2](v35, MEMORY[0x1E4F1CC38], v30);
LABEL_33:
    [v12 invalidate];
    goto LABEL_39;
  }
  v28 = [(DNDSRemoteAvailabilityServiceProvider *)self delegate];
  id v53 = 0;
  uint64_t v29 = [v28 remoteAvailabilityServiceProvider:self isLocalUserAvailableForApplicationIdentifier:v20 withError:&v53];
  id v30 = v53;

  v31 = DNDSLogAvailabilityProvider;
  BOOL v32 = os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_DEFAULT);
  if (v30)
  {
    v33 = v50;
    v34 = v51;
    if (v32)
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v51;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v30;
      *(_WORD *)&buf[22] = 2114;
      *(void *)&buf[24] = v12;
      _os_log_impl(&dword_1D3052000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] Error determining Focus Status; will report YES for available: error=%{public}@ connection=%{public}@",
        buf,
        0x20u);
    }
    v35 = (void (**)(void, void, void))v52;
    (*((void (**)(id, void, id))v52 + 2))(v52, MEMORY[0x1E4F1CC38], v30);
  }
  else
  {
    v33 = v50;
    v34 = v51;
    if (v32)
    {
      v48 = @"NO";
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v51;
      *(_WORD *)&buf[12] = 2114;
      if (v29) {
        v48 = @"YES";
      }
      *(void *)&buf[14] = v48;
      *(_WORD *)&buf[22] = 2114;
      *(void *)&buf[24] = v12;
      _os_log_impl(&dword_1D3052000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] Determinined Focus Status: available=%{public}@ connection=%{public}@", buf, 0x20u);
    }
    v49 = [NSNumber numberWithBool:v29];
    v35 = (void (**)(void, void, void))v52;
    (*((void (**)(id, void *, void))v52 + 2))(v52, v49, 0);
  }
LABEL_39:
}

- (void)_handleClientConnectionInterrupted:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = DNDSLogAvailabilityProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Client XPC connection was interrupted: connection=%{public}@", (uint8_t *)&v6, 0xCu);
  }
  [(DNDSRemoteAvailabilityServiceProvider *)self _removeConnection:v4];
}

- (void)_handleClientConnectionInvalidated:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = DNDSLogAvailabilityProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Client XPC connection was invalidated: connection=%{public}@", (uint8_t *)&v6, 0xCu);
  }
  [(DNDSRemoteAvailabilityServiceProvider *)self _removeConnection:v4];
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

- (void)_removeConnection:(id)a3
{
  p_accessLock = &self->_accessLock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_accessLock);
  os_unfair_lock_lock(p_accessLock);
  [(NSMutableSet *)self->_connections removeObject:v5];

  os_unfair_lock_unlock(p_accessLock);
}

- (DNDSRemoteAvailabilityServiceProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DNDSRemoteAvailabilityServiceProviderDelegate *)WeakRetained;
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

- (void)getIsLocalUserAvailableWithRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without Communication Notifications entitlement tried to get Focus Status, will invalidate: connection=%{public}@");
}

- (void)getIsLocalUserAvailableWithRequestDetails:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without sharing authorization tried to get Focus Status, will invalidate: connection=%{public}@");
}

- (void)getIsLocalUserAvailableWithRequestDetails:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without User Notifications authorization tried to get Focus Status, will invalidate: connection=%{public}@");
}

@end