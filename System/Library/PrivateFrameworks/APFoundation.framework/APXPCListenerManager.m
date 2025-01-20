@interface APXPCListenerManager
+ (void)addDelegate:(id)a3;
- (APXPCListenerManager)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableArray)listeners;
- (NSMutableDictionary)delegates;
- (void)dealloc;
- (void)setDelegates:(id)a3;
- (void)setListeners:(id)a3;
@end

@implementation APXPCListenerManager

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v48 = a3;
  id v6 = a4;
  v7 = [v6 serviceName];
  id v8 = (id)qword_1EB7898B0;
  objc_sync_enter(v8);
  v9 = [(APXPCListenerManager *)self delegates];
  v10 = [v9 objectForKey:v7];

  objc_sync_exit(v8);
  if (v10 && ([v10 conformsToProtocol:&unk_1F2EBCF18] & 1) != 0)
  {
    v11 = [[APXPCConnection alloc] initWithConnection:v6];
    v12 = [v10 actionReceiverForConnection:v11];
    v13 = v12;
    if (v12 && ([v12 conformsToProtocol:&unk_1F2EBCF78] & 1) != 0)
    {
      if (objc_opt_respondsToSelector())
      {
        v14 = [v13 requiredEntitlements];
        v15 = v14;
        if (!v14 || ![v14 count])
        {
          v16 = APLogForCategory(0x33uLL);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138477827;
            v58 = (char *)objc_opt_class();
            v17 = v58;
            _os_log_impl(&dword_1D70B2000, v16, OS_LOG_TYPE_ERROR, "[%{private}@] The optional requiredEntitlements method was implemented, but no entitlements were provided. Is this a developer issue? Please file a radar...", buf, 0xCu);
          }
        }
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        v18 = v15;
        uint64_t v19 = [(APXPCListenerManager *)v18 countByEnumeratingWithState:&v53 objects:v65 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v54;
          while (2)
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v54 != v20) {
                objc_enumerationMutation(v18);
              }
              if (![(APXPCConnection *)v11 hasEntitlement:*(void *)(*((void *)&v53 + 1) + 8 * i)])
              {
                v45 = APLogForCategory(0x33uLL);
                if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                {
                  v46 = (char *)objc_opt_class();
                  *(_DWORD *)buf = 138477827;
                  v58 = v46;
                  v47 = v46;
                  _os_log_impl(&dword_1D70B2000, v45, OS_LOG_TYPE_ERROR, "[%{private}@] Caller does is missing a necessary entitlement. Bailing...", buf, 0xCu);
                }
                goto LABEL_38;
              }
            }
            uint64_t v19 = [(APXPCListenerManager *)v18 countByEnumeratingWithState:&v53 objects:v65 count:16];
            if (v19) {
              continue;
            }
            break;
          }
        }
      }
      v22 = [v13 exportedObject];
      [v6 setExportedObject:v22];

      v23 = (void *)MEMORY[0x1E4F29280];
      v24 = [v13 exportedInterface];
      v25 = [v23 interfaceWithProtocol:v24];
      [v6 setExportedInterface:v25];

      if (objc_opt_respondsToSelector())
      {
        v26 = APLogForCategory(0x33uLL);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v27 = (char *)objc_opt_class();
          *(_DWORD *)buf = 138477827;
          v58 = v27;
          v28 = v27;
          _os_log_impl(&dword_1D70B2000, v26, OS_LOG_TYPE_INFO, "[%{private}@] Extending exported selectors to allow collection classes to pass data.", buf, 0xCu);
        }
        v29 = [v6 exportedInterface];
        [v13 extendCollectionClassesForExportedInterface:v29];
      }
      if (objc_opt_respondsToSelector())
      {
        v30 = (void *)MEMORY[0x1E4F29280];
        v31 = [v13 remoteObjectInterface];
        v32 = [v30 interfaceWithProtocol:v31];
        [v6 setRemoteObjectInterface:v32];

        if (objc_opt_respondsToSelector())
        {
          v33 = APLogForCategory(0x33uLL);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            v34 = (char *)objc_opt_class();
            *(_DWORD *)buf = 138477827;
            v58 = v34;
            v35 = v34;
            _os_log_impl(&dword_1D70B2000, v33, OS_LOG_TYPE_INFO, "[%{private}@] Extending remote selectors to allow collection classes to pass data.", buf, 0xCu);
          }
          v36 = [v6 remoteObjectInterface];
          [v13 extendCollectionClassesForRemoteInterface:v36];
        }
      }
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = sub_1D70DD0DC;
      v51[3] = &unk_1E6A6B6D0;
      v37 = v13;
      v52 = (APXPCListenerManager *)v37;
      [v6 setInterruptionHandler:v51];
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = sub_1D70B49A0;
      v49[3] = &unk_1E6A6B6D0;
      v50 = v37;
      [v6 setInvalidationHandler:v49];
      v38 = APLogForCategory(0x33uLL);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        v39 = [v6 serviceName];
        *(_DWORD *)buf = 136643587;
        v58 = "-[APXPCListenerManager listener:shouldAcceptNewConnection:]";
        __int16 v59 = 2114;
        v60 = self;
        __int16 v61 = 2114;
        id v62 = v6;
        __int16 v63 = 2114;
        v64 = v39;
        _os_log_impl(&dword_1D70B2000, v38, OS_LOG_TYPE_INFO, "%{sensitive}s: listener %{public}@ accepted connection %{public}@ (%{public}@)", buf, 0x2Au);
      }
      [v6 resume];

      BOOL v40 = 1;
      v18 = v52;
    }
    else
    {
      v18 = [NSString stringWithFormat:@"No connection delegate returned or connection delegate doesn't conform to protocol"];
      v42 = APLogForCategory(0x33uLL);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138478083;
        v58 = (char *)objc_opt_class();
        __int16 v59 = 2114;
        v60 = v18;
        v43 = v58;
        _os_log_impl(&dword_1D70B2000, v42, OS_LOG_TYPE_ERROR, "[%{private}@] ERROR: %{public}@", buf, 0x16u);
      }
LABEL_38:
      BOOL v40 = 0;
    }
  }
  else
  {
    v11 = [NSString stringWithFormat:@"No Delegate was found for mach service %@ or delegate doesn't conform to protocol", v7, v48];
    v13 = APLogForCategory(0x33uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138478083;
      v58 = (char *)objc_opt_class();
      __int16 v59 = 2114;
      v60 = (APXPCListenerManager *)v11;
      v41 = v58;
      _os_log_impl(&dword_1D70B2000, v13, OS_LOG_TYPE_ERROR, "[%{private}@] ERROR: %{public}@", buf, 0x16u);
    }
    BOOL v40 = 0;
  }

  return v40;
}

- (NSMutableDictionary)delegates
{
  return self->_delegates;
}

+ (void)addDelegate:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (qword_1EB7898C0 != -1) {
    dispatch_once(&qword_1EB7898C0, &unk_1F2E9CD50);
  }
  id v4 = (id)qword_1EB7898B0;
  objc_sync_enter(v4);
  v5 = [v3 machServiceName];
  id v6 = APLogForCategory(0x33uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v16 = 138478083;
    id v17 = (id)objc_opt_class();
    __int16 v18 = 2114;
    uint64_t v19 = v5;
    id v7 = v17;
    _os_log_impl(&dword_1D70B2000, v6, OS_LOG_TYPE_INFO, "[%{private}@] Adding a delegate for machService: %{public}@", (uint8_t *)&v16, 0x16u);
  }
  id v8 = [(id)qword_1EB7898B0 delegates];
  v9 = [v8 objectForKey:v5];

  if (!v9)
  {
    v10 = [(id)qword_1EB7898B0 delegates];
    [v10 setObject:v3 forKey:v5];

    v11 = APLogForCategory(0x33uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = objc_opt_class();
      int v16 = 138477827;
      id v17 = v12;
      id v13 = v12;
      _os_log_impl(&dword_1D70B2000, v11, OS_LOG_TYPE_INFO, "[%{private}@] Setting up the listener", (uint8_t *)&v16, 0xCu);
    }
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:v5];
    [v14 setDelegate:qword_1EB7898B0];
    [v14 resume];
    v15 = [(id)qword_1EB7898B0 listeners];
    [v15 addObject:v14];
  }
  objc_sync_exit(v4);
}

- (APXPCListenerManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)APXPCListenerManager;
  v2 = [(APXPCListenerManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    delegates = v2->_delegates;
    v2->_delegates = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    listeners = v2->_listeners;
    v2->_listeners = (NSMutableArray *)v5;
  }
  return v2;
}

- (void)dealloc
{
  APSimulateCrash(5, @"The Listener Manager is never allowed to be dealloced", 1u);
  v3.receiver = self;
  v3.super_class = (Class)APXPCListenerManager;
  [(APXPCListenerManager *)&v3 dealloc];
}

- (void)setDelegates:(id)a3
{
}

- (NSMutableArray)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
}

@end