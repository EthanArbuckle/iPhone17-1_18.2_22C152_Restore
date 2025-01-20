@interface BSServiceManager
+ (BSServiceManager)sharedInstanceCreatingIfNecessary:(uint64_t)a1;
+ (id)debugDescription;
- (BSServiceManager)init;
- (NSString)debugDescription;
- (id)activateManualDomain:(uint64_t)a1;
- (id)domainWithIdentifier:(uint64_t)a1;
- (id)registerDynamicConfiguration:(uint64_t)a1;
- (id)registerMonitor:(uint64_t)a1;
- (os_unfair_lock_s)extendAutomaticBootstrapCompletion;
- (uint64_t)newConnectionWithEndpoint:(void *)a3 oneshot:(BOOL)a4 nonLaunching:(uint64_t)a5 targetPID:(void *)a6 description:;
- (void)_callOutLock_noteEndpointsChangedForServices:(os_unfair_lock_s *)a1;
- (void)enforceXPCServiceListenerRegistration;
- (void)service:(id)a3 didLoseInheritances:(id)a4;
- (void)service:(id)a3 didReceiveInheritances:(id)a4;
@end

@implementation BSServiceManager

+ (BSServiceManager)sharedInstanceCreatingIfNecessary:(uint64_t)a1
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  self;
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_7);
  v3 = (BSServiceManager *)(id)qword_1EB27F848;
  if (v3) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = a2 == 0;
  }
  if (!v4)
  {
    v5 = [BSServiceManager alloc];
    v6 = +[BSServicesConfiguration bootstrapConfiguration];
    id v46 = v6;
    if (v5)
    {
      v58.receiver = v5;
      v58.super_class = (Class)BSServiceManager;
      v7 = (BSServiceManager *)objc_msgSendSuper2(&v58, sel_init);
      v5 = v7;
      if (v7)
      {
        p_bootstrapConfiguration = &v7->_bootstrapConfiguration;
        objc_storeStrong((id *)&v7->_bootstrapConfiguration, v6);
        v5->_lock._os_unfair_lock_opaque = 0;
        v9 = *p_bootstrapConfiguration;
        if (*p_bootstrapConfiguration) {
          v9 = (BSServicesConfiguration *)v9->_orderedDomains;
        }
        v45 = v9;
        v47 = [MEMORY[0x1E4F1CA48] array];
        uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[BSServicesConfiguration count](v45, "count"));
        lock_identifierToDomain = v5->_lock_identifierToDomain;
        v5->_lock_identifierToDomain = (NSMutableDictionary *)v10;

        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        v12 = v45;
        uint64_t v13 = [(BSServicesConfiguration *)v12 countByEnumeratingWithState:&v54 objects:v60 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v55;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v55 != v14) {
                objc_enumerationMutation(v12);
              }
              v16 = *(void **)(*((void *)&v54 + 1) + 8 * i);
              v17 = -[BSServiceDomain _initWithSpecification:]((BSService *)[BSServiceDomain alloc], v16);
              v18 = v5->_lock_identifierToDomain;
              v19 = [v16 identifier];
              [(NSMutableDictionary *)v18 setObject:v17 forKey:v19];

              if (v16 && v16[7] == 3) {
                [v47 addObject:v17];
              }
            }
            uint64_t v13 = [(BSServicesConfiguration *)v12 countByEnumeratingWithState:&v54 objects:v60 count:16];
          }
          while (v13);
        }

        v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        lock_endpointToOutgoingRootConnections = v5->_lock_endpointToOutgoingRootConnections;
        v5->_lock_endpointToOutgoingRootConnections = v20;

        uint64_t v22 = [MEMORY[0x1E4F1CA60] dictionary];
        lock_inheritanceToEndpoint = v5->_lock_inheritanceToEndpoint;
        v5->_lock_inheritanceToEndpoint = (NSMutableDictionary *)v22;

        uint64_t v24 = [MEMORY[0x1E4F1CA60] dictionary];
        lock_endpointToInheritances = v5->_lock_endpointToInheritances;
        v5->_lock_endpointToInheritances = (NSMutableDictionary *)v24;

        uint64_t v26 = [MEMORY[0x1E4F1CA60] dictionary];
        lock_serviceIdentifierToEndpoints = v5->_lock_serviceIdentifierToEndpoints;
        v5->_lock_serviceIdentifierToEndpoints = (NSMutableDictionary *)v26;

        uint64_t v28 = [MEMORY[0x1E4F1CA60] dictionary];
        lock_serviceIdentifierToMonitors = v5->_lock_serviceIdentifierToMonitors;
        v5->_lock_serviceIdentifierToMonitors = (NSMutableDictionary *)v28;

        v5->_callOutLock._os_unfair_lock_opaque = 0;
        uint64_t v30 = [MEMORY[0x1E4F1CA60] dictionary];
        callOutLock_serviceIdentifierToEndpointsToEnvironments = v5->_callOutLock_serviceIdentifierToEndpointsToEnvironments;
        v5->_callOutLock_serviceIdentifierToEndpointsToEnvironments = (NSMutableDictionary *)v30;

        v32 = v5;
        *(void *)&long long v50 = 0;
        *((void *)&v50 + 1) = &v50;
        *(void *)&long long v51 = 0x2020000000;
        v33 = (void (*)(BSServiceManager *))off_1EB27F850;
        *((void *)&v51 + 1) = off_1EB27F850;
        if (!off_1EB27F850)
        {
          v59[0] = MEMORY[0x1E4F143A8];
          v59[1] = 3221225472;
          v59[2] = __getRBSServiceInitializeSymbolLoc_block_invoke;
          v59[3] = &unk_1E58FBE80;
          v59[4] = &v50;
          __getRBSServiceInitializeSymbolLoc_block_invoke(v59);
          v33 = *(void (**)(BSServiceManager *))(*((void *)&v50 + 1) + 24);
        }
        _Block_object_dispose(&v50, 8);
        if (!v33)
        {
          v43 = [MEMORY[0x1E4F28B00] currentHandler];
          v44 = [NSString stringWithUTF8String:"RBSService *softlinkRBSServiceInitialize(id<RBSServiceDelegate>  _Nullable __strong)"];
          objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, @"BSServiceManager.m", 28, @"%s", dlerror());

          __break(1u);
        }
        uint64_t v34 = v33(v32);

        RBSService = v32->_RBSService;
        v32->_RBSService = (RBSService *)v34;

        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v36 = v47;
        uint64_t v37 = [v36 countByEnumeratingWithState:&v50 objects:v59 count:16];
        if (v37)
        {
          uint64_t v38 = *(void *)v51;
          do
          {
            for (uint64_t j = 0; j != v37; ++j)
            {
              if (*(void *)v51 != v38) {
                objc_enumerationMutation(v36);
              }
              id v40 = -[BSServiceDomain _activate](*(os_unfair_lock_s **)(*((void *)&v50 + 1) + 8 * j));
            }
            uint64_t v37 = [v36 countByEnumeratingWithState:&v50 objects:v59 count:16];
          }
          while (v37);
        }

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __52__BSServiceManager__initWithBootstrapConfiguration___block_invoke;
        block[3] = &unk_1E58FC278;
        v5 = v32;
        v49 = v5;
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
    }

    v41 = (void *)qword_1EB27F848;
    qword_1EB27F848 = (uint64_t)v5;

    v3 = v5;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_7);

  return v3;
}

- (uint64_t)newConnectionWithEndpoint:(void *)a3 oneshot:(BOOL)a4 nonLaunching:(uint64_t)a5 targetPID:(void *)a6 description:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a6;
  uint64_t v14 = 0;
  if (a1 && v11)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    id v15 = v11;
    id v16 = v12;
    id v17 = v13;
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
    xpc_object_t object = v15;
    id v33 = v16;
    id v18 = v17;
    self;
    uint64_t v19 = objc_opt_new();
    xpc_object_t v20 = xpc_copy(object);
    v21 = *(void **)(v19 + 8);
    *(void *)(v19 + 8) = v20;

    uint64_t v22 = [v33 copy];
    v23 = *(void **)(v19 + 16);
    *(void *)(v19 + 16) = v22;

    *(_DWORD *)(v19 + 32) = a5;
    uint64_t v24 = [v18 copy];
    v25 = *(void **)(v19 + 24);
    *(void *)(v19 + 24) = v24;

    uint64_t v26 = [*(id *)(a1 + 48) objectForKey:v19];
    if (v26)
    {
      v27 = BSServiceLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v18;
        _os_log_impl(&dword_19C754000, v27, OS_LOG_TYPE_INFO, "found existing rootConnection by endpoint (%@)", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      uint64_t v26 = +[BSXPCServiceConnection connectionWithEndpoint:oneshot:nonLaunching:targetPID:description:]((uint64_t)BSXPCServiceConnection, object, v33, a4, a5, v18);
      if (v26)
      {
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        uint64_t v37 = __96__BSServiceManager__lock_rootConnectionWithEndpoint_oneshot_nonLaunching_targetPID_description___block_invoke;
        uint64_t v38 = &unk_1E58FC8C8;
        uint64_t v28 = v18;
        v39 = v28;
        uint64_t v40 = a1;
        id v31 = (id)v19;
        id v41 = v31;
        -[BSXPCServiceConnection configure:]((uint64_t)v26, (uint64_t)&buf);
        v29 = BSServiceLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint64_t v34 = 138412290;
          v35 = v28;
          _os_log_impl(&dword_19C754000, v29, OS_LOG_TYPE_INFO, "created rootConnection with endpoint=%@", v34, 0xCu);
        }

        [*(id *)(a1 + 48) setObject:v26 forKey:v31];
        -[BSXPCServiceConnection activateNowOrWhenReady:]((uint64_t)v26, 0);

        v27 = v39;
      }
      else
      {
        v27 = BSServiceLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v18;
          _os_log_impl(&dword_19C754000, v27, OS_LOG_TYPE_INFO, "failed to create rootConnection for endpoint=%@", (uint8_t *)&buf, 0xCu);
        }
        uint64_t v26 = 0;
      }
    }

    if (v26)
    {
      uint64_t v14 = +[BSXPCServiceConnection connectionWithConnection:]((uint64_t)BSXPCServiceConnection, v26);
    }
    else
    {
      uint64_t v14 = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
  }
  return v14;
}

void __96__BSServiceManager__lock_rootConnectionWithEndpoint_oneshot_nonLaunching_targetPID_description___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = a2;
  uint64_t v3 = -[BSXPCServiceConnection peer](v2);
  BOOL v4 = (void *)v3;
  if (v3) {
    v5 = *(void **)(v3 + 32);
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  v7 = BSServiceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [v6 name];
    v9 = v8;
    if (!v8)
    {
      v9 = [v6 bundleIdentifier];
    }
    int v10 = 138543874;
    id v11 = v9;
    __int16 v12 = 1026;
    int v13 = [v6 pid];
    __int16 v14 = 2114;
    id v15 = v2;
    _os_log_impl(&dword_19C754000, v7, OS_LOG_TYPE_DEFAULT, "Activated root connection to %{public}@:%{public}d: %{public}@", (uint8_t *)&v10, 0x1Cu);
    if (!v8) {
  }
    }
}

void __96__BSServiceManager__lock_rootConnectionWithEndpoint_oneshot_nonLaunching_targetPID_description___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a2;
  BOOL v4 = [NSString stringWithFormat:@"BSXPCRootOut:%@", a1[4]];
  v5 = v4;
  if (v3)
  {
    uint64_t v6 = [v4 copy];
    v7 = (void *)v3[18];
    v3[18] = v6;
  }
  v8 = +[BSServiceQuality userInteractive];
  v9 = v8;
  if (v3)
  {
    uint64_t v10 = [v8 copy];
    id v11 = (void *)v3[21];
    v3[21] = v10;

    *((unsigned char *)v3 + 128) = 1;
    uint64_t v12 = [&__block_literal_global_173 copy];
    v9 = (void *)v3[12];
    v3[12] = v12;
  }

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __96__BSServiceManager__lock_rootConnectionWithEndpoint_oneshot_nonLaunching_targetPID_description___block_invoke_174;
  v24[3] = &unk_1E58FC8F0;
  int v13 = (void *)a1[6];
  v24[4] = a1[5];
  id v25 = v13;
  if (v3)
  {
    uint64_t v14 = [v24 copy];
    id v15 = (void *)v3[9];
    v3[9] = v14;

    uint64_t v16 = [&__block_literal_global_178 copy];
    id v17 = (void *)v3[10];
    v3[10] = v16;
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __96__BSServiceManager__lock_rootConnectionWithEndpoint_oneshot_nonLaunching_targetPID_description___block_invoke_4;
  v22[3] = &unk_1E58FC818;
  id v18 = (void *)a1[6];
  v22[4] = a1[5];
  id v19 = v18;
  id v23 = v19;
  if (v3)
  {
    uint64_t v20 = [v22 copy];
    v21 = (void *)v3[11];
    v3[11] = v20;

    id v19 = v23;
  }
}

void __52__BSServiceManager__initWithBootstrapConfiguration___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 32)) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = *(void *)(v2 + 40) == 0;
  }
  *(unsigned char *)(v2 + 32) = 1;
  if ([*(id *)(*(void *)(a1 + 32) + 24) count])
  {
    if (v3)
    {
      BOOL v4 = BSServiceBootstrapLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19C754000, v4, OS_LOG_TYPE_DEFAULT, "automatic bootstrapping is complete", buf, 2u);
      }

      [*(id *)(*(void *)(a1 + 32) + 24) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_38];
    }
    else if (*(void *)(*(void *)(a1 + 32) + 40))
    {
      v5 = BSServiceBootstrapLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v6 = 0;
        _os_log_impl(&dword_19C754000, v5, OS_LOG_TYPE_DEFAULT, "automatic bootstrap completion has been extended", v6, 2u);
      }
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
}

- (void)service:(id)a3 didReceiveInheritances:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v21 = a4;
  BOOL v4 = BSServiceLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138543362;
    id v30 = v21;
    _os_log_debug_impl(&dword_19C754000, v4, OS_LOG_TYPE_DEBUG, "BSServiceMonitor received inheritances %{public}@", buf, 0xCu);
  }

  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = v21;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v26;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * v9);
        id v11 = BSServiceEndpointGrantNamespace();
        uint64_t v12 = [v10 endowmentNamespace];
        int v13 = [v11 isEqual:v12];

        if (v13)
        {
          uint64_t v14 = [v10 endowment];
          id v15 = +[BSServiceConnectionEndpoint _endpointFromEndowmentRepresentation:]((uint64_t)BSServiceConnectionEndpoint, v14);
          if (v15)
          {
            [v5 setObject:v15 forKey:v10];
          }
          else
          {
            uint64_t v16 = BSServiceLog();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412546;
              id v30 = v10;
              __int16 v31 = 2112;
              v32 = v14;
              _os_log_error_impl(&dword_19C754000, v16, OS_LOG_TYPE_ERROR, "Ignoring invalid service endowment : %@ -> %@", buf, 0x16u);
            }
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v7);
  }

  if ([v5 count])
  {
    os_unfair_lock_lock(&self->_callOutLock);
    os_unfair_lock_lock(&self->_lock);
    id v17 = [MEMORY[0x1E4F1CA80] set];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __51__BSServiceManager_service_didReceiveInheritances___block_invoke;
    v22[3] = &unk_1E58FC868;
    v22[4] = self;
    SEL v24 = a2;
    id v18 = v17;
    id v23 = v18;
    [v5 enumerateKeysAndObjectsUsingBlock:v22];
    os_unfair_lock_unlock(&self->_lock);
    -[BSServiceManager _callOutLock_noteEndpointsChangedForServices:]((os_unfair_lock_s *)self, v18);
    os_unfair_lock_unlock(&self->_callOutLock);
  }
}

- (id)registerMonitor:(uint64_t)a1
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      id v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"monitorToRegister"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_registerMonitor_);
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v20 = (objc_class *)objc_opt_class();
        id v21 = NSStringFromClass(v20);
        *(_DWORD *)long long buf = 138544642;
        id v30 = v19;
        __int16 v31 = 2114;
        v32 = v21;
        __int16 v33 = 2048;
        uint64_t v34 = a1;
        __int16 v35 = 2114;
        id v36 = @"BSServiceManager.m";
        __int16 v37 = 1024;
        int v38 = 380;
        __int16 v39 = 2114;
        uint64_t v40 = v18;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v18 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C779618);
    }
    v5 = [v3 service];
    if (!v5)
    {
      uint64_t v22 = [NSString stringWithFormat:@"asked to register a monitor with a nil service : monitor=%@", v4];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_registerMonitor_);
        id v23 = (id)objc_claimAutoreleasedReturnValue();
        SEL v24 = (objc_class *)objc_opt_class();
        long long v25 = NSStringFromClass(v24);
        *(_DWORD *)long long buf = 138544642;
        id v30 = v23;
        __int16 v31 = 2114;
        v32 = v25;
        __int16 v33 = 2048;
        uint64_t v34 = a1;
        __int16 v35 = 2114;
        id v36 = @"BSServiceManager.m";
        __int16 v37 = 1024;
        int v38 = 383;
        __int16 v39 = 2114;
        uint64_t v40 = v22;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v22 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C779710);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    id v6 = [*(id *)(a1 + 80) objectForKey:v5];
    uint64_t v7 = v6;
    if (v6)
    {
      if ([v6 containsObject:v4])
      {
        uint64_t v8 = [NSString stringWithFormat:@"already tracking monitor for service %@ : %@", v5, v4];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel_registerMonitor_);
          id v9 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v10 = (objc_class *)objc_opt_class();
          id v11 = NSStringFromClass(v10);
          *(_DWORD *)long long buf = 138544642;
          id v30 = v9;
          __int16 v31 = 2114;
          v32 = v11;
          __int16 v33 = 2048;
          uint64_t v34 = a1;
          __int16 v35 = 2114;
          id v36 = @"BSServiceManager.m";
          __int16 v37 = 1024;
          int v38 = 389;
          __int16 v39 = 2114;
          uint64_t v40 = v8;
          _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v8 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19C77939CLL);
      }
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
      objc_msgSend(*(id *)(a1 + 80), "setObject:forKey:");
    }
    [v7 addObject:v4];
    objc_initWeak((id *)buf, v4);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
    uint64_t v12 = [*(id *)(a1 + 96) objectForKey:v5];
    int v13 = (void *)v12;
    if (v12) {
      uint64_t v14 = v12;
    }
    else {
      uint64_t v14 = MEMORY[0x1E4F1CC08];
    }
    objc_msgSend(v4, "serialCallOut_didUpdateEndpointEnvironments:", v14);

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    id v15 = objc_alloc(MEMORY[0x1E4F4F838]);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __36__BSServiceManager_registerMonitor___block_invoke;
    v26[3] = &unk_1E58FC7A8;
    v26[4] = a1;
    objc_copyWeak(&v28, (id *)buf);
    id v16 = v5;
    id v27 = v16;
    a1 = [v15 initWithIdentifier:@"com.apple.boardservices.manager.monitor" forReason:v16 invalidationBlock:v26];

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }

  return (id)a1;
}

void __96__BSServiceManager__lock_rootConnectionWithEndpoint_oneshot_nonLaunching_targetPID_description___block_invoke_174(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = *(_DWORD *)(v4 + 36) + 1;
  *(_DWORD *)(v4 + 36) = v5;
  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  uint64_t v7 = dispatch_get_global_queue(17, 0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __96__BSServiceManager__lock_rootConnectionWithEndpoint_oneshot_nonLaunching_targetPID_description___block_invoke_2_175;
  v10[3] = &unk_1E58FC7F0;
  uint64_t v8 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  int v13 = v5;
  id v11 = v8;
  id v12 = v3;
  id v9 = v3;
  dispatch_after(v6, v7, v10);

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
}

- (void)service:(id)a3 didLoseInheritances:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_callOutLock);
  os_unfair_lock_lock(&self->_lock);
  uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v43 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        int v13 = [(NSMutableDictionary *)self->_lock_inheritanceToEndpoint objectForKey:v12];
        if (v13)
        {
          uint64_t v14 = [(NSMutableDictionary *)self->_lock_endpointToInheritances objectForKey:v13];
          if (([v14 containsObject:v12] & 1) == 0)
          {
            id v17 = [NSString stringWithFormat:@"endpointToInheritances is missing an entry for an inheritance in inheritanceToEndpoint : inheritance=%@ endpoint=%@", v12, v13];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(a2);
              id v18 = (id)objc_claimAutoreleasedReturnValue();
              id v19 = (objc_class *)objc_opt_class();
              uint64_t v20 = NSStringFromClass(v19);
              *(_DWORD *)long long buf = 138544642;
              id v32 = v18;
              __int16 v33 = 2114;
              uint64_t v34 = v20;
              __int16 v35 = 2048;
              id v36 = self;
              __int16 v37 = 2114;
              int v38 = @"BSServiceManager.m";
              __int16 v39 = 1024;
              int v40 = 594;
              __int16 v41 = 2114;
              uint64_t v42 = v17;
              _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
            }
            [v17 UTF8String];
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x19C77C36CLL);
          }
          [(NSMutableDictionary *)self->_lock_inheritanceToEndpoint removeObjectForKey:v12];
          if ((unint64_t)[v14 count] < 2)
          {
            [(NSMutableDictionary *)self->_lock_endpointToInheritances removeObjectForKey:v13];
            id v15 = [v13 service];
            id v16 = [(NSMutableDictionary *)self->_lock_serviceIdentifierToEndpoints objectForKey:v15];
            if (([v16 containsObject:v13] & 1) == 0)
            {
              id v21 = [NSString stringWithFormat:@"serviceIdentifierToEndpoints is missing an entry for a lost endpoint : service=%@ endpoint=%@", v15, v13];
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                NSStringFromSelector(a2);
                id v22 = (id)objc_claimAutoreleasedReturnValue();
                id v23 = (objc_class *)objc_opt_class();
                SEL v24 = NSStringFromClass(v23);
                *(_DWORD *)long long buf = 138544642;
                id v32 = v22;
                __int16 v33 = 2114;
                uint64_t v34 = v24;
                __int16 v35 = 2048;
                id v36 = self;
                __int16 v37 = 2114;
                int v38 = @"BSServiceManager.m";
                __int16 v39 = 1024;
                int v40 = 605;
                __int16 v41 = 2114;
                uint64_t v42 = v21;
                _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
              }
              [v21 UTF8String];
              _bs_set_crash_log_message();
              __break(0);
              JUMPOUT(0x19C77C464);
            }
            if ((unint64_t)[v16 count] < 2) {
              [(NSMutableDictionary *)self->_lock_serviceIdentifierToEndpoints removeObjectForKey:v15];
            }
            else {
              [v16 removeObject:v13];
            }
            [v7 addObject:v15];
          }
          else
          {
            [v14 removeObject:v12];
            id v15 = [v13 service];
            [v7 addObject:v15];
          }
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v43 count:16];
    }
    while (v9);
  }

  os_unfair_lock_unlock(&self->_lock);
  -[BSServiceManager _callOutLock_noteEndpointsChangedForServices:]((os_unfair_lock_s *)self, v7);
  os_unfair_lock_unlock(&self->_callOutLock);
}

- (void)_callOutLock_noteEndpointsChangedForServices:(os_unfair_lock_s *)a1
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v26 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner(a1 + 22);
    long long v25 = [MEMORY[0x1E4F1CA60] dictionary];
    __int16 v35 = a1;
    locuint64_t k = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    obuint64_t j = v26;
    uint64_t v28 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
    if (!v28) {
      goto LABEL_37;
    }
    uint64_t v29 = *(void *)v47;
    while (1)
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v47 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = *(void *)(*((void *)&v46 + 1) + 8 * i);
        long long v30 = [*(id *)&v35[18]._os_unfair_lock_opaque objectForKey:lock];
        uint64_t v3 = [v30 count];
        uint64_t v4 = *(void **)&v35[24]._os_unfair_lock_opaque;
        if (v3)
        {
          id v32 = [v4 objectForKey:v33];
          int v5 = (void *)[v32 mutableCopy];
          id v6 = v5;
          if (v5)
          {
            id v7 = v5;
          }
          else
          {
            id v7 = [MEMORY[0x1E4F1CA60] dictionary];
          }
          id v36 = v7;

          long long v44 = 0u;
          long long v45 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          id v34 = v30;
          uint64_t v8 = [v34 countByEnumeratingWithState:&v42 objects:v51 count:16];
          if (v8)
          {
            uint64_t v9 = *(void *)v43;
            do
            {
              for (uint64_t j = 0; j != v8; ++j)
              {
                if (*(void *)v43 != v9) {
                  objc_enumerationMutation(v34);
                }
                uint64_t v11 = *(void *)(*((void *)&v42 + 1) + 8 * j);
                uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
                long long v40 = 0u;
                long long v41 = 0u;
                long long v38 = 0u;
                long long v39 = 0u;
                int v13 = [*(id *)&v35[16]._os_unfair_lock_opaque objectForKey:v11];
                uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v50 count:16];
                if (v14)
                {
                  uint64_t v15 = *(void *)v39;
                  do
                  {
                    for (uint64_t k = 0; k != v14; ++k)
                    {
                      if (*(void *)v39 != v15) {
                        objc_enumerationMutation(v13);
                      }
                      id v17 = [*(id *)(*((void *)&v38 + 1) + 8 * k) environment];
                      if (v17) {
                        [v12 addObject:v17];
                      }
                    }
                    uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v50 count:16];
                  }
                  while (v14);
                }

                id v18 = [v36 objectForKey:v11];
                char v19 = BSEqualObjects();

                if ((v19 & 1) == 0)
                {
                  uint64_t v20 = (void *)[v12 copy];
                  [v36 setObject:v20 forKey:v11];
                }
              }
              uint64_t v8 = [v34 countByEnumeratingWithState:&v42 objects:v51 count:16];
            }
            while (v8);
          }

          id v21 = v36;
          if (BSEqualObjects()) {
            goto LABEL_34;
          }
          id v22 = *(void **)&v35[24]._os_unfair_lock_opaque;
          id v23 = (void *)[v36 copy];
          [v22 setObject:v23 forKey:v33];
        }
        else
        {
          [v4 removeObjectForKey:v33];
        }
        id v32 = [*(id *)&v35[20]._os_unfair_lock_opaque objectForKey:v33];
        if (![v32 count]) {
          goto LABEL_35;
        }
        id v21 = (void *)[v32 copy];
        [v25 setObject:v21 forKey:v33];
LABEL_34:

LABEL_35:
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
      if (!v28)
      {
LABEL_37:

        os_unfair_lock_unlock(lock);
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __65__BSServiceManager__callOutLock_noteEndpointsChangedForServices___block_invoke;
        v37[3] = &unk_1E58FC840;
        v37[4] = v35;
        [v25 enumerateKeysAndObjectsUsingBlock:v37];

        break;
      }
    }
  }
}

- (BSServiceManager)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [NSString stringWithFormat:@"init is not allowed on BSServiceManager"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2048;
    uint64_t v14 = self;
    __int16 v15 = 2114;
    id v16 = @"BSServiceManager.m";
    __int16 v17 = 1024;
    int v18 = 126;
    __int16 v19 = 2114;
    uint64_t v20 = v4;
    _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BSServiceManager *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

void __52__BSServiceManager__initWithBootstrapConfiguration___block_invoke_35(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3;
  id v6 = v3;
  if (!v3 || (uint64_t v4 = v3[1]) == 0 || (v5 = v4[7], v4, !v5)) {
    -[BSServiceDomain _enforceListenerRegistrationForReason:]((uint64_t)v6, @"automatic bootstrap complete");
  }
}

+ (id)debugDescription
{
  uint64_t v2 = (void *)MEMORY[0x19F3998C0](a1, a2);
  uint64_t v3 = +[BSServiceManager sharedInstanceCreatingIfNecessary:]((uint64_t)BSServiceManager, 0);
  uint64_t v4 = [v3 debugDescription];

  return v4;
}

- (NSString)debugDescription
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  lock_identifierToDomain = self->_lock_identifierToDomain;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __36__BSServiceManager_debugDescription__block_invoke;
  v29[3] = &unk_1E58FC6A0;
  v29[4] = self;
  id v7 = v5;
  id v30 = v7;
  id v8 = v4;
  id v31 = v8;
  [(NSMutableDictionary *)lock_identifierToDomain enumerateKeysAndObjectsUsingBlock:v29];
  [v8 sortUsingComparator:&__block_literal_global_45];
  [v7 sortUsingComparator:&__block_literal_global_45];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __36__BSServiceManager_debugDescription__block_invoke_3;
  v24[3] = &unk_1E58FC6E8;
  id v9 = v3;
  id v25 = v9;
  id v10 = v7;
  id v26 = v10;
  id v11 = v8;
  id v27 = v11;
  uint64_t v28 = self;
  id v12 = (id)[v9 modifyProem:v24];
  __int16 v13 = [v9 activeMultilinePrefix];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __36__BSServiceManager_debugDescription__block_invoke_4;
  v19[3] = &unk_1E58FC6E8;
  id v14 = v9;
  id v20 = v14;
  id v15 = v10;
  id v21 = v15;
  id v16 = v11;
  id v22 = v16;
  id v23 = self;
  [v14 appendBodySectionWithName:0 multilinePrefix:v13 block:v19];

  os_unfair_lock_unlock(&self->_lock);
  __int16 v17 = [v14 build];

  return (NSString *)v17;
}

void __36__BSServiceManager_debugDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [*(id *)(*(void *)(a1 + 32) + 8) domainForIdentifier:v8];

  uint64_t v7 = 40;
  if (!v6) {
    uint64_t v7 = 48;
  }
  [*(id *)(a1 + v7) addObject:v5];
}

uint64_t __36__BSServiceManager_debugDescription__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a3;
  if (a2) {
    id v5 = *(void **)(a2 + 8);
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  uint64_t v7 = [v6 identifier];
  if (v4) {
    id v8 = (void *)v4[1];
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  id v10 = [v9 identifier];
  uint64_t v11 = [v7 compare:v10];

  return v11;
}

id __36__BSServiceManager_debugDescription__block_invoke_3(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "count"), @"bootstrapDomains");
  id v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 48), "count"), @"dynamicDomains");
  uint64_t v4 = *(void *)(a1 + 56);
  if (*(unsigned char *)(v4 + 32))
  {
    if (*(void *)(v4 + 40)) {
      id v5 = @"extended";
    }
    else {
      id v5 = @"complete";
    }
  }
  else
  {
    id v5 = @"initialized";
  }
  return (id)[*(id *)(a1 + 32) appendObject:v5 withName:@"automaticStart"];
}

void __36__BSServiceManager_debugDescription__block_invoke_4(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = (id *)(a1 + 32);
  id v2 = *(void **)(a1 + 32);
  uint64_t v4 = [v2 activeMultilinePrefix];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __36__BSServiceManager_debugDescription__block_invoke_5;
  v40[3] = &unk_1E58FC4E0;
  id v41 = *(id *)(a1 + 40);
  id v42 = *v3;
  [v2 appendBodySectionWithName:@"bootstrapDomains" multilinePrefix:v4 block:v40];

  id v5 = *(void **)(a1 + 32);
  id v6 = [v5 activeMultilinePrefix];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __36__BSServiceManager_debugDescription__block_invoke_6;
  v37[3] = &unk_1E58FC4E0;
  id v38 = *(id *)(a1 + 48);
  id v39 = *(id *)(a1 + 32);
  [v5 appendBodySectionWithName:@"dynamicDomains" multilinePrefix:v6 block:v37];

  uint64_t v7 = [*(id *)(*(void *)(a1 + 56) + 64) allKeys];
  id v27 = (void *)[v7 mutableCopy];

  [v27 sortUsingSelector:sel_compare_];
  id v8 = *(void **)(a1 + 32);
  id v9 = [v8 activeMultilinePrefix];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __36__BSServiceManager_debugDescription__block_invoke_7;
  v33[3] = &unk_1E58FC508;
  id v10 = v27;
  id v34 = v10;
  id v11 = *(id *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 56);
  id v35 = v11;
  uint64_t v36 = v12;
  [v8 appendBodySectionWithName:@"inheritedEndpoints" multilinePrefix:v9 block:v33];

  __int16 v13 = [*(id *)(*(void *)(a1 + 56) + 48) allKeys];
  id v14 = (void *)[v13 mutableCopy];

  [v14 sortUsingComparator:&__block_literal_global_71];
  id v15 = *(void **)(a1 + 32);
  id v16 = [v15 activeMultilinePrefix];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __36__BSServiceManager_debugDescription__block_invoke_9;
  v32[3] = &unk_1E58FC730;
  v32[4] = *(void *)(a1 + 56);
  [v15 appendArraySection:v14 withName:@"outgoingRootConnections" multilinePrefix:v16 skipIfEmpty:0 objectTransformer:v32];

  __int16 v17 = [MEMORY[0x1E4F1CA48] array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  int v18 = [*(id *)(*(void *)(a1 + 56) + 80) allKeys];
  __int16 v19 = [v18 sortedArrayUsingSelector:sel_compare_];

  uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v43 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(v19);
        }
        id v23 = [*(id *)(*(void *)(a1 + 56) + 80) objectForKey:*(void *)(*((void *)&v28 + 1) + 8 * i)];
        SEL v24 = [v23 allObjects];
        [v17 addObjectsFromArray:v24];
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v43 count:16];
    }
    while (v20);
  }

  id v25 = *(void **)(a1 + 32);
  id v26 = [v25 activeMultilinePrefix];
  [v25 appendArraySection:v17 withName:@"monitors" multilinePrefix:v26 skipIfEmpty:0];
}

void __36__BSServiceManager_debugDescription__block_invoke_5(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v7 = *(void **)(a1 + 40);
        id v8 = objc_msgSend(v7, "activeMultilinePrefix", (void)v11);
        id v9 = -[BSServiceDomain _debugDescriptionWithMultilinePrefix:](v6, v8);
        id v10 = (id)[v7 appendObject:v9 withName:0];
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v3);
  }
}

void __36__BSServiceManager_debugDescription__block_invoke_6(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v7 = *(void **)(a1 + 40);
        id v8 = objc_msgSend(v7, "activeMultilinePrefix", (void)v11);
        id v9 = -[BSServiceDomain _debugDescriptionWithMultilinePrefix:](v6, v8);
        id v10 = (id)[v7 appendObject:v9 withName:0];
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v3);
  }
}

void __36__BSServiceManager_debugDescription__block_invoke_7(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v7 = *(void **)(a1 + 40);
        id v8 = objc_msgSend(*(id *)(*(void *)(a1 + 48) + 64), "objectForKey:", v6, (void)v12);
        id v9 = [v8 allObjects];
        id v10 = [v6 description];
        long long v11 = [*(id *)(a1 + 40) activeMultilinePrefix];
        [v7 appendArraySection:v9 withName:v10 multilinePrefix:v11 skipIfEmpty:0];
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v3);
  }
}

uint64_t __36__BSServiceManager_debugDescription__block_invoke_8(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  int v2 = xpc_endpoint_compare();
  uint64_t v3 = -1;
  if (v2 >= 0) {
    uint64_t v3 = 1;
  }
  if (v2) {
    return v3;
  }
  else {
    return 0;
  }
}

id __36__BSServiceManager_debugDescription__block_invoke_9(uint64_t a1, uint64_t a2)
{
  int v2 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKey:a2];
  uint64_t v3 = [v2 description];

  return v3;
}

- (id)domainWithIdentifier:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    a1 = [*(id *)(a1 + 24) objectForKey:v3];
    os_unfair_lock_unlock(v4);
  }

  return (id)a1;
}

- (os_unfair_lock_s)extendAutomaticBootstrapCompletion
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v1 = a1;
    BSDispatchQueueAssertMain();
    os_unfair_lock_lock(v1 + 4);
    if (LOBYTE(v1[8]._os_unfair_lock_opaque))
    {
      uint64_t v4 = [NSString stringWithFormat:@"must call before automatic bootstrapping would complete without extensions"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_extendAutomaticBootstrapCompletion);
        id v5 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v6 = (objc_class *)objc_opt_class();
        uint64_t v7 = NSStringFromClass(v6);
        *(_DWORD *)long long buf = 138544642;
        id v10 = v5;
        __int16 v11 = 2114;
        long long v12 = v7;
        __int16 v13 = 2048;
        long long v14 = v1;
        __int16 v15 = 2114;
        uint64_t v16 = @"BSServiceManager.m";
        __int16 v17 = 1024;
        int v18 = 288;
        __int16 v19 = 2114;
        uint64_t v20 = v4;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v4 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C78A828);
    }
    ++*(void *)&v1[10]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v1 + 4);
    id v2 = objc_alloc(MEMORY[0x1E4F4F838]);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__BSServiceManager_extendAutomaticBootstrapCompletion__block_invoke;
    v8[3] = &unk_1E58FC758;
    v8[4] = v1;
    v8[5] = sel_extendAutomaticBootstrapCompletion;
    a1 = (os_unfair_lock_s *)[v2 initWithIdentifier:@"com.apple.boardservices.bootstrap" forReason:@"extend" invalidationBlock:v8];
  }

  return a1;
}

void __54__BSServiceManager_extendAutomaticBootstrapCompletion__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 40);
  if (!v5)
  {
    id v8 = [NSString stringWithFormat:@"bootstrap extension underflow"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v10 = (objc_class *)objc_opt_class();
      __int16 v11 = NSStringFromClass(v10);
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = 138544642;
      id v14 = v9;
      __int16 v15 = 2114;
      uint64_t v16 = v11;
      __int16 v17 = 2048;
      uint64_t v18 = v12;
      __int16 v19 = 2114;
      uint64_t v20 = @"BSServiceManager.m";
      __int16 v21 = 1024;
      int v22 = 294;
      __int16 v23 = 2114;
      SEL v24 = v8;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v13, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C78AA64);
  }
  uint64_t v6 = v5 - 1;
  *(void *)(v4 + 40) = v6;
  if (!v6)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 32) = 1;
    if ([*(id *)(*(void *)(a1 + 32) + 24) count])
    {
      uint64_t v7 = BSServiceBootstrapLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_19C754000, v7, OS_LOG_TYPE_DEFAULT, "extended automatic bootstrapping is complete", (uint8_t *)&v13, 2u);
      }

      [*(id *)(*(void *)(a1 + 32) + 24) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_96];
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
}

void __54__BSServiceManager_extendAutomaticBootstrapCompletion__block_invoke_94(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  uint64_t v6 = v3;
  if (!v3 || (uint64_t v4 = v3[1]) == 0 || (v5 = v4[7], v4, !v5)) {
    -[BSServiceDomain _enforceListenerRegistrationForReason:]((uint64_t)v6, @"automatic bootstrap complete");
  }
}

- (id)registerDynamicConfiguration:(uint64_t)a1
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v43 = v3;
  if (a1)
  {
    uint64_t v4 = [v3 domains];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v4, "count"));
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v47 objects:v63 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v48 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          __int16 v11 = [v10 machName];
          BOOL v12 = v11 == 0;

          if (!v12)
          {
            id v27 = [NSString stringWithFormat:@"dynamic domains may not specificy a mach name : %@", v10];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(sel_registerDynamicConfiguration_);
              id v28 = (id)objc_claimAutoreleasedReturnValue();
              long long v29 = (objc_class *)objc_opt_class();
              long long v30 = NSStringFromClass(v29);
              *(_DWORD *)long long buf = 138544642;
              id v52 = v28;
              __int16 v53 = 2114;
              long long v54 = v30;
              __int16 v55 = 2048;
              uint64_t v56 = a1;
              __int16 v57 = 2114;
              objc_super v58 = @"BSServiceManager.m";
              __int16 v59 = 1024;
              int v60 = 316;
              __int16 v61 = 2114;
              v62 = v27;
              _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
            }
            [v27 UTF8String];
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x19C78AFE8);
          }
          if (!v10) {
            goto LABEL_24;
          }
          uint64_t v13 = v10[7];
          if (v13 != 2)
          {
            if (v13 == 3)
            {
              __int16 v23 = [NSString stringWithFormat:@"dynamic domains cannot be an XPCService : %@", v10];
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                NSStringFromSelector(sel_registerDynamicConfiguration_);
                id v24 = (id)objc_claimAutoreleasedReturnValue();
                uint64_t v25 = (objc_class *)objc_opt_class();
                id v26 = NSStringFromClass(v25);
                *(_DWORD *)long long buf = 138544642;
                id v52 = v24;
                __int16 v53 = 2114;
                long long v54 = v26;
                __int16 v55 = 2048;
                uint64_t v56 = a1;
                __int16 v57 = 2114;
                objc_super v58 = @"BSServiceManager.m";
                __int16 v59 = 1024;
                int v60 = 318;
                __int16 v61 = 2114;
                v62 = v23;
                _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
              }
              [v23 UTF8String];
              _bs_set_crash_log_message();
              __break(0);
              JUMPOUT(0x19C78AEECLL);
            }
LABEL_24:
            long long v31 = [NSString stringWithFormat:@"dynamic domains must specify Start to be ManualSession : %@", v10];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(sel_registerDynamicConfiguration_);
              id v32 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v33 = (objc_class *)objc_opt_class();
              id v34 = NSStringFromClass(v33);
              *(_DWORD *)long long buf = 138544642;
              id v52 = v32;
              __int16 v53 = 2114;
              long long v54 = v34;
              __int16 v55 = 2048;
              uint64_t v56 = a1;
              __int16 v57 = 2114;
              objc_super v58 = @"BSServiceManager.m";
              __int16 v59 = 1024;
              int v60 = 319;
              __int16 v61 = 2114;
              v62 = v31;
              _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
            }
            [v31 UTF8String];
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x19C78B0E4);
          }
          id v14 = *(void **)(a1 + 24);
          __int16 v15 = [v10 identifier];
          uint64_t v16 = [v14 objectForKey:v15];
          LOBYTE(v14) = v16 == 0;

          if ((v14 & 1) == 0)
          {
            id v35 = NSString;
            uint64_t v36 = *(void **)(a1 + 24);
            __int16 v37 = [v10 identifier];
            id v38 = [v36 objectForKey:v37];
            id v39 = [v35 stringWithFormat:@"connot register dynamic domain due to identifier collision : new=%@ existing=%@", v10, v38];

            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(sel_registerDynamicConfiguration_);
              id v40 = (id)objc_claimAutoreleasedReturnValue();
              id v41 = (objc_class *)objc_opt_class();
              id v42 = NSStringFromClass(v41);
              *(_DWORD *)long long buf = 138544642;
              id v52 = v40;
              __int16 v53 = 2114;
              long long v54 = v42;
              __int16 v55 = 2048;
              uint64_t v56 = a1;
              __int16 v57 = 2114;
              objc_super v58 = @"BSServiceManager.m";
              __int16 v59 = 1024;
              int v60 = 320;
              __int16 v61 = 2114;
              v62 = v39;
              _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
            }
            [v39 UTF8String];
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x19C78B214);
          }
          __int16 v17 = -[BSServiceDomain _initWithSpecification:]((BSService *)[BSServiceDomain alloc], v10);
          [v5 addObject:v17];
          uint64_t v18 = *(void **)(a1 + 24);
          __int16 v19 = [v10 identifier];
          [v18 setObject:v17 forKey:v19];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v47 objects:v63 count:16];
      }
      while (v7);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
    id v20 = objc_alloc(MEMORY[0x1E4F4F838]);
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __49__BSServiceManager_registerDynamicConfiguration___block_invoke;
    v44[3] = &unk_1E58FC780;
    v44[4] = a1;
    id v21 = v5;
    id v45 = v21;
    long long v46 = sel_registerDynamicConfiguration_;
    a1 = [v20 initWithIdentifier:@"com.apple.boardservices.register" forReason:@"dynamic" invalidationBlock:v44];
  }

  return (id)a1;
}

void __49__BSServiceManager_registerDynamicConfiguration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v42 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v27;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v26 + 1) + 8 * v7);
        if (v8) {
          id v9 = *(void **)(v8 + 8);
        }
        else {
          id v9 = 0;
        }
        id v10 = v9;
        __int16 v11 = *(void **)(*(void *)(a1 + 32) + 24);
        BOOL v12 = [v10 identifier];
        uint64_t v13 = [v11 objectForKey:v12];
        LOBYTE(v11) = v13 == (void *)v8;

        if ((v11 & 1) == 0)
        {
          __int16 v17 = NSString;
          uint64_t v18 = *(void **)(*(void *)(a1 + 32) + 24);
          __int16 v19 = [v10 identifier];
          id v20 = [v18 objectForKey:v19];
          id v21 = [v17 stringWithFormat:@"domain registration stomping : removing=%@ existing=%@", v8, v20, (void)v26];

          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(*(SEL *)(a1 + 48));
            id v22 = (id)objc_claimAutoreleasedReturnValue();
            __int16 v23 = (objc_class *)objc_opt_class();
            id v24 = NSStringFromClass(v23);
            uint64_t v25 = *(void *)(a1 + 32);
            *(_DWORD *)long long buf = 138544642;
            id v31 = v22;
            __int16 v32 = 2114;
            uint64_t v33 = v24;
            __int16 v34 = 2048;
            uint64_t v35 = v25;
            __int16 v36 = 2114;
            __int16 v37 = @"BSServiceManager.m";
            __int16 v38 = 1024;
            int v39 = 332;
            __int16 v40 = 2114;
            id v41 = v21;
            _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          [v21 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x19C78B620);
        }
        -[BSServiceDomain _invalidate](v8);
        id v14 = *(void **)(*(void *)(a1 + 32) + 24);
        __int16 v15 = [v10 identifier];
        [v14 removeObjectForKey:v15];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v16 = [v4 countByEnumeratingWithState:&v26 objects:v42 count:16];
      uint64_t v5 = v16;
    }
    while (v16);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
}

- (id)activateManualDomain:(uint64_t)a1
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = v3;
    NSClassFromString(&cfstr_Nsstring.isa);
    if (!v5)
    {
      __int16 v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_activateManualDomain_);
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v17 = (objc_class *)objc_opt_class();
        uint64_t v18 = NSStringFromClass(v17);
        *(_DWORD *)long long buf = 138544642;
        id v32 = v16;
        __int16 v33 = 2114;
        __int16 v34 = v18;
        __int16 v35 = 2048;
        uint64_t v36 = a1;
        __int16 v37 = 2114;
        __int16 v38 = @"BSServiceManager.m";
        __int16 v39 = 1024;
        int v40 = 341;
        __int16 v41 = 2114;
        id v42 = v15;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v15 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C78B9C8);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __int16 v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_activateManualDomain_);
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        id v21 = (objc_class *)objc_opt_class();
        id v22 = NSStringFromClass(v21);
        *(_DWORD *)long long buf = 138544642;
        id v32 = v20;
        __int16 v33 = 2114;
        __int16 v34 = v22;
        __int16 v35 = 2048;
        uint64_t v36 = a1;
        __int16 v37 = 2114;
        __int16 v38 = @"BSServiceManager.m";
        __int16 v39 = 1024;
        int v40 = 341;
        __int16 v41 = 2114;
        id v42 = v19;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v19 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C78BAC8);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    uint64_t v6 = [*(id *)(a1 + 24) objectForKey:v5];
    uint64_t v7 = (os_unfair_lock_s *)v6;
    if (!v6)
    {
      __int16 v23 = [NSString stringWithFormat:@"attempt to activate unknown domain %@", v5];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_activateManualDomain_);
        id v24 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v25 = (objc_class *)objc_opt_class();
        long long v26 = NSStringFromClass(v25);
        *(_DWORD *)long long buf = 138544642;
        id v32 = v24;
        __int16 v33 = 2114;
        __int16 v34 = v26;
        __int16 v35 = 2048;
        uint64_t v36 = a1;
        __int16 v37 = 2114;
        __int16 v38 = @"BSServiceManager.m";
        __int16 v39 = 1024;
        int v40 = 344;
        __int16 v41 = 2114;
        id v42 = v23;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v23 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C78BBC0);
    }
    uint64_t v8 = *(id *)(v6 + 8);
    if (v8)
    {
      uint64_t v9 = v8[7];

      if (v9 == 1)
      {
        if (*(unsigned char *)(a1 + 32))
        {
          long long v27 = [NSString stringWithFormat:@"manual bootstrap must occur before automatic bootstrapping would complete without extensions"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(sel_activateManualDomain_);
            id v28 = (id)objc_claimAutoreleasedReturnValue();
            long long v29 = (objc_class *)objc_opt_class();
            long long v30 = NSStringFromClass(v29);
            *(_DWORD *)long long buf = 138544642;
            id v32 = v28;
            __int16 v33 = 2114;
            __int16 v34 = v30;
            __int16 v35 = 2048;
            uint64_t v36 = a1;
            __int16 v37 = 2114;
            __int16 v38 = @"BSServiceManager.m";
            __int16 v39 = 1024;
            int v40 = 347;
            __int16 v41 = 2114;
            id v42 = v27;
            _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          [v27 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x19C78BCB4);
        }
      }
      else if (v9 == 3)
      {
        id v10 = [NSString stringWithFormat:@"XPCService domain cannot be activated via this call"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel_activateManualDomain_);
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          BOOL v12 = (objc_class *)objc_opt_class();
          uint64_t v13 = NSStringFromClass(v12);
          *(_DWORD *)long long buf = 138544642;
          id v32 = v11;
          __int16 v33 = 2114;
          __int16 v34 = v13;
          __int16 v35 = 2048;
          uint64_t v36 = a1;
          __int16 v37 = 2114;
          __int16 v38 = @"BSServiceManager.m";
          __int16 v39 = 1024;
          int v40 = 349;
          __int16 v41 = 2114;
          id v42 = v10;
          _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v10 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19C78B858);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
    a1 = -[BSServiceDomain _activate](v7);
  }

  return (id)a1;
}

- (void)enforceXPCServiceListenerRegistration
{
  if (a1)
  {
    id v2 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    [*(id *)(a1 + 24) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_146];
    os_unfair_lock_unlock(v2);
  }
}

void __57__BSServiceManager_enforceXPCServiceListenerRegistration__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  uint64_t v6 = v3;
  if (v3)
  {
    id v4 = v3[1];
    if (v4)
    {
      uint64_t v5 = v4[7];

      if (v5 == 3) {
        -[BSServiceDomain _enforceListenerRegistrationForReason:]((uint64_t)v6, @"activateXPCService");
      }
    }
  }
}

void __36__BSServiceManager_registerMonitor___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = *(void **)(a1 + 40);
  id v7 = WeakRetained;
  id v5 = v4;
  if (v2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(v2 + 16));
    uint64_t v6 = [*(id *)(v2 + 80) objectForKey:v5];
    if (v7) {
      [v6 removeObject:v7];
    }
    if (![v6 count]) {
      [*(id *)(v2 + 80) removeObjectForKey:v5];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 16));
  }
}

void __96__BSServiceManager__lock_rootConnectionWithEndpoint_oneshot_nonLaunching_targetPID_description___block_invoke_2_175(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  if (*(_DWORD *)(a1 + 56) == *(_DWORD *)(*(void *)(a1 + 40) + 36)
    && (-[BSXPCServiceConnection hasChildren](*(os_unfair_lock_s **)(a1 + 48)) & 1) == 0
    && (uint64_t v2 = *(void **)(a1 + 48),
        [*(id *)(*(void *)(a1 + 32) + 48) objectForKey:*(void *)(a1 + 40)],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v2 == v3))
  {
    [*(id *)(*(void *)(a1 + 32) + 48) removeObjectForKey:*(void *)(a1 + 40)];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
    id v5 = *(void **)(a1 + 48);
    [v5 invalidate];
  }
  else
  {
    id v4 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 16);
    os_unfair_lock_unlock(v4);
  }
}

void __96__BSServiceManager__lock_rootConnectionWithEndpoint_oneshot_nonLaunching_targetPID_description___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = BSServiceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v6 succinctDescription];
    int v9 = 138543618;
    id v10 = v5;
    __int16 v11 = 2114;
    BOOL v12 = v8;
    _os_log_impl(&dword_19C754000, v7, OS_LOG_TYPE_DEFAULT, "Error on outgoing connection %{public}@: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  if ([v6 isBSServiceConnectionError]
    && [v6 code] == 1
    && (-[BSXPCServiceConnection hasChildren](v5) & 1) != 0)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 48) removeObjectForKey:*(void *)(a1 + 40)];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
    [(os_unfair_lock_s *)v5 invalidate];
  }
}

void __65__BSServiceManager__callOutLock_noteEndpointsChangedForServices___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 96) objectForKey:a2];
  id v7 = (void *)v6;
  uint64_t v8 = (void *)MEMORY[0x1E4F1CC08];
  if (v6) {
    uint64_t v8 = (void *)v6;
  }
  id v9 = v8;

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "serialCallOut_didUpdateEndpointEnvironments:", v9, (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

void __51__BSServiceManager_service_didReceiveInheritances___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v27 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:v27];

  if (v6)
  {
    id v20 = NSString;
    id v21 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:v27];
    id v22 = [v20 stringWithFormat:@"already have an endpoint for inheritance=%@ : old=%@ new=%@", v27, v21, v5];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      id v24 = (objc_class *)objc_opt_class();
      uint64_t v25 = NSStringFromClass(v24);
      uint64_t v26 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138544642;
      id v29 = v23;
      __int16 v30 = 2114;
      id v31 = v25;
      __int16 v32 = 2048;
      uint64_t v33 = v26;
      __int16 v34 = 2114;
      __int16 v35 = @"BSServiceManager.m";
      __int16 v36 = 1024;
      int v37 = 560;
      __int16 v38 = 2114;
      __int16 v39 = v22;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C78C66CLL);
  }
  id v7 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKey:v5];
  uint64_t v8 = [v7 count];
  uint64_t v9 = *(void *)(a1 + 32);
  if (v8)
  {
    id v10 = *(void **)(v9 + 56);
    uint64_t v11 = [v7 anyObject];
    uint64_t v12 = [v10 objectForKey:v11];

    [*(id *)(*(void *)(a1 + 32) + 56) setObject:v12 forKey:v27];
    [v7 addObject:v27];
    uint64_t v13 = *(void **)(a1 + 40);
    long long v14 = [v12 service];
    [v13 addObject:v14];
  }
  else
  {
    long long v15 = *(void **)(v9 + 64);
    long long v16 = [MEMORY[0x1E4F1CA80] setWithObject:v27];
    [v15 setObject:v16 forKey:v5];

    [*(id *)(*(void *)(a1 + 32) + 56) setObject:v5 forKey:v27];
    uint64_t v12 = [v5 service];
    [*(id *)(a1 + 40) addObject:v12];
    long long v17 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKey:v12];
    long long v14 = v17;
    if (v17)
    {
      [v17 addObject:v5];
    }
    else
    {
      uint64_t v18 = *(void **)(*(void *)(a1 + 32) + 72);
      uint64_t v19 = [MEMORY[0x1E4F1CA80] setWithObject:v5];
      [v18 setObject:v19 forKey:v12];

      long long v14 = 0;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_RBSService, 0);
  objc_storeStrong((id *)&self->_callOutLock_serviceIdentifierToEndpointsToEnvironments, 0);
  objc_storeStrong((id *)&self->_lock_serviceIdentifierToMonitors, 0);
  objc_storeStrong((id *)&self->_lock_serviceIdentifierToEndpoints, 0);
  objc_storeStrong((id *)&self->_lock_endpointToInheritances, 0);
  objc_storeStrong((id *)&self->_lock_inheritanceToEndpoint, 0);
  objc_storeStrong((id *)&self->_lock_endpointToOutgoingRootConnections, 0);
  objc_storeStrong((id *)&self->_lock_identifierToDomain, 0);

  objc_storeStrong((id *)&self->_bootstrapConfiguration, 0);
}

@end