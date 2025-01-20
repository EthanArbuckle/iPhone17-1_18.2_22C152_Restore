@interface CCSRemoteServiceProvider
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)_init;
- (void)dealloc;
- (void)enumerateEndpointsUsingBlock:(id)a3;
- (void)getEnabledStateOfModuleWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)handleControlCenterOperationType:(int64_t)a3 completionHandler:(id)a4;
- (void)handleIconElementRequest:(id)a3 completionHandler:(id)a4;
- (void)invalidate;
- (void)presentModuleWithIdentifier:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)registerEndpoint:(id)a3;
- (void)requestAvailableModuleIdentifiersWithCompletionHandler:(id)a3;
- (void)requestDisableModuleWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)requestEnableModuleWithIdentifier:(id)a3 force:(BOOL)a4 completionHandler:(id)a5;
- (void)requestIconElementState:(id)a3 completionHandler:(id)a4;
- (void)resetToDefaultLayoutWithCompletionHandler:(id)a3;
- (void)resume;
- (void)setVisibility:(BOOL)a3 forModuleWithIdentifier:(id)a4 completionHandler:(id)a5;
@end

@implementation CCSRemoteServiceProvider

- (void)setVisibility:(BOOL)a3 forModuleWithIdentifier:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a4;
  v9 = (void (**)(id, void, void *))a5;
  v10 = CCSLogRemoteService;
  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v36 = v6;
    *(_WORD *)&v36[4] = 2114;
    *(void *)&v36[6] = v8;
    _os_log_impl(&dword_221518000, v10, OS_LOG_TYPE_DEFAULT, "Requesting setting of visibility %{BOOL}d for module with identifier '%{public}@'", buf, 0x12u);
  }
  v11 = [MEMORY[0x263F08D68] currentConnection];
  if ((objc_msgSend(v11, "ccs_hasEntitlementForModuleIdentifier:", v8) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
    {
      -[CCSRemoteServiceProvider getEnabledStateOfModuleWithIdentifier:completionHandler:]();
      if (!v9) {
        goto LABEL_13;
      }
    }
    else if (!v9)
    {
LABEL_13:
      [v11 invalidate];
      goto LABEL_25;
    }
    v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v33 = *MEMORY[0x263F07F80];
    v19 = [NSString stringWithFormat:@"Missing entitlement for module with identifier '%@'", v8];
    v34 = v19;
    v20 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    v21 = [v18 errorWithDomain:@"CCSControlCenterServicesErrorDomain" code:0 userInfo:v20];
    v9[2](v9, 0, v21);

    goto LABEL_13;
  }
  v12 = [(CCSModuleRepository *)self->_moduleRepository moduleMetadataForModuleIdentifier:v8];

  if (!v12)
  {
    if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
    {
      -[CCSRemoteServiceProvider setVisibility:forModuleWithIdentifier:completionHandler:]();
      if (!v9) {
        goto LABEL_25;
      }
    }
    else if (!v9)
    {
      goto LABEL_25;
    }
    v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v31 = *MEMORY[0x263F07F80];
    v23 = [NSString stringWithFormat:@"Cannot set visibility of module with identifier '%@' as it's not found", v8];
    v32 = v23;
    v24 = NSDictionary;
    v25 = &v32;
    v26 = &v31;
LABEL_20:
    v27 = [v24 dictionaryWithObjects:v25 forKeys:v26 count:1];
    v28 = [v22 errorWithDomain:@"CCSControlCenterServicesErrorDomain" code:0 userInfo:v27];
    v9[2](v9, 0, v28);

    goto LABEL_25;
  }
  v13 = [(CCSModuleRepository *)self->_moduleRepository moduleMetadataForModuleIdentifier:v8];
  uint64_t v14 = [v13 visibilityPreference];

  if (!v14)
  {
    if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
    {
      -[CCSRemoteServiceProvider setVisibility:forModuleWithIdentifier:completionHandler:]();
      if (!v9) {
        goto LABEL_25;
      }
    }
    else if (!v9)
    {
      goto LABEL_25;
    }
    v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v29 = *MEMORY[0x263F07F80];
    v23 = [NSString stringWithFormat:@"Cannot set visibility of module with identifier '%@' as it's unsupported", v8];
    v30 = v23;
    v24 = NSDictionary;
    v25 = &v30;
    v26 = &v29;
    goto LABEL_20;
  }
  BOOL v15 = [(CCSModuleRepository *)self->_moduleRepository visibilityForModuleIdentifier:v8];
  v16 = CCSLogRemoteService;
  BOOL v17 = os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_DEFAULT);
  if (v15 == v6)
  {
    if (v17)
    {
      *(_DWORD *)buf = 138543618;
      *(void *)v36 = v8;
      *(_WORD *)&v36[8] = 1024;
      *(_DWORD *)&v36[10] = v6;
      _os_log_impl(&dword_221518000, v16, OS_LOG_TYPE_DEFAULT, "Cannot set visibility with identifier '%{public}@' as it's already %{BOOL}d", buf, 0x12u);
    }
  }
  else
  {
    if (v17)
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v36 = v6;
      *(_WORD *)&v36[4] = 2114;
      *(void *)&v36[6] = v8;
      _os_log_impl(&dword_221518000, v16, OS_LOG_TYPE_DEFAULT, "Setting visibility %{BOOL}d for module with identifier '%{public}@'", buf, 0x12u);
    }
    [(CCSModuleRepository *)self->_moduleRepository setVisibility:v6 forModuleIdentifier:v8];
  }
  if (v9) {
    v9[2](v9, 1, 0);
  }
LABEL_25:
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

uint64_t __42__CCSRemoteServiceProvider_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = [[CCSRemoteServiceProvider alloc] _init];

  return MEMORY[0x270F9A758]();
}

- (id)_init
{
  v12.receiver = self;
  v12.super_class = (Class)CCSRemoteServiceProvider;
  v2 = [(CCSRemoteServiceProvider *)&v12 init];
  if (v2)
  {
    uint64_t v3 = +[CCSModuleRepository repositoryWithDefaults];
    moduleRepository = v2->_moduleRepository;
    v2->_moduleRepository = (CCSModuleRepository *)v3;

    uint64_t v5 = +[CCSModuleSettingsProvider sharedProvider];
    settingsProvider = v2->_settingsProvider;
    v2->_settingsProvider = (CCSModuleSettingsProvider *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.controlcenter.remoteservice"];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v7;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    uint64_t v9 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    presentationEndpoints = v2->_presentationEndpoints;
    v2->_presentationEndpoints = (NSHashTable *)v9;
  }
  return v2;
}

- (void)dealloc
{
  [(CCSRemoteServiceProvider *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CCSRemoteServiceProvider;
  [(CCSRemoteServiceProvider *)&v3 dealloc];
}

- (void)registerEndpoint:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v8 = v5;
    BOOL v6 = self->_presentationEndpoints;
    objc_sync_enter(v6);
    if ([(NSHashTable *)self->_presentationEndpoints count])
    {
      uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"CCSRemoteServiceProvider.m" lineNumber:84 description:@"The primary presentation endpoint already exists."];
    }
    [(NSHashTable *)self->_presentationEndpoints addObject:v8];
    objc_sync_exit(v6);

    id v5 = v8;
  }
}

- (void)resume
{
}

- (void)invalidate
{
  [(CCSModuleRepository *)self->_moduleRepository invalidate];
  listener = self->_listener;

  [(NSXPCListener *)listener invalidate];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  BOOL v6 = CCSRemoteServiceServerInterface();
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__CCSRemoteServiceProvider_listener_shouldAcceptNewConnection___block_invoke;
  v9[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  v9[4] = v5;
  [v5 setInterruptionHandler:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__CCSRemoteServiceProvider_listener_shouldAcceptNewConnection___block_invoke_21;
  v8[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  v8[4] = v5;
  [v5 setInvalidationHandler:v8];
  [v5 resume];

  return 1;
}

void __63__CCSRemoteServiceProvider_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = CCSLogRemoteService;
  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_221518000, v2, OS_LOG_TYPE_DEFAULT, "connection interrupted, %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __63__CCSRemoteServiceProvider_listener_shouldAcceptNewConnection___block_invoke_21(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = CCSLogRemoteService;
  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_221518000, v2, OS_LOG_TYPE_DEFAULT, "connection invalidated, %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)getEnabledStateOfModuleWithIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = a4;
  id v8 = CCSLogRemoteService;
  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138543362;
    id v22 = v6;
    _os_log_impl(&dword_221518000, v8, OS_LOG_TYPE_DEFAULT, "Getting enabled state of module with identifier '%{public}@'", (uint8_t *)&v21, 0xCu);
  }
  uint64_t v9 = [MEMORY[0x263F08D68] currentConnection];
  if (objc_msgSend(v9, "ccs_hasEntitlementForModuleIdentifier:", v6))
  {
    if (v7)
    {
      v10 = [(CCSModuleRepository *)self->_moduleRepository loadableModuleIdentifiers];
      int v11 = [v10 containsObject:v6];

      if (v11)
      {
        objc_super v12 = [(CCSModuleSettingsProvider *)self->_settingsProvider orderedFixedModuleIdentifiers];
        int v13 = [v12 containsObject:v6];

        if (v13
          || (-[CCSModuleSettingsProvider orderedUserEnabledFixedModuleIdentifiers](self->_settingsProvider, "orderedUserEnabledFixedModuleIdentifiers"), uint64_t v14 = objc_claimAutoreleasedReturnValue(), v15 = [v14 containsObject:v6], v14, v15))
        {
          v16 = (void (*)(void *, uint64_t))v7[2];
        }
        else
        {
          v19 = [(CCSModuleSettingsProvider *)self->_settingsProvider orderedUserEnabledModuleIdentifiers];
          int v20 = [v19 containsObject:v6];

          v16 = (void (*)(void *, uint64_t))v7[2];
          if (!v20)
          {
            BOOL v17 = v7;
            uint64_t v18 = 2;
            goto LABEL_14;
          }
        }
        BOOL v17 = v7;
        uint64_t v18 = 3;
      }
      else
      {
        v16 = (void (*)(void *, uint64_t))v7[2];
        BOOL v17 = v7;
        uint64_t v18 = 1;
      }
LABEL_14:
      v16(v17, v18);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR)) {
      -[CCSRemoteServiceProvider getEnabledStateOfModuleWithIdentifier:completionHandler:]();
    }
    [v9 invalidate];
  }
}

- (void)requestEnableModuleWithIdentifier:(id)a3 force:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void, void *))a5;
  v10 = CCSLogRemoteService;
  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v50 = v8;
    _os_log_impl(&dword_221518000, v10, OS_LOG_TYPE_DEFAULT, "Requesting enable of module with identifier '%{public}@'", buf, 0xCu);
  }
  int v11 = [MEMORY[0x263F08D68] currentConnection];
  int v12 = objc_msgSend(v11, "ccs_hasEntitlementForForciblyEnablingModules");
  if ((objc_msgSend(v11, "ccs_hasEntitlementForModuleIdentifier:", v8) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
    {
      -[CCSRemoteServiceProvider getEnabledStateOfModuleWithIdentifier:completionHandler:]();
      if (!v9) {
        goto LABEL_12;
      }
    }
    else if (!v9)
    {
LABEL_12:
      [v11 invalidate];
      goto LABEL_26;
    }
    id v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v47 = *MEMORY[0x263F07F80];
    uint64_t v23 = [NSString stringWithFormat:@"Missing entitlement for module with identifier '%@'", v8];
    v48 = v23;
    v24 = [NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    v25 = [v22 errorWithDomain:@"CCSControlCenterServicesErrorDomain" code:0 userInfo:v24];
    v9[2](v9, 0, v25);

    goto LABEL_12;
  }
  int v13 = [(CCSModuleRepository *)self->_moduleRepository loadableModuleIdentifiers];
  char v14 = [v13 containsObject:v8];

  if ((v14 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
    {
      -[CCSRemoteServiceProvider requestEnableModuleWithIdentifier:force:completionHandler:]();
      if (!v9) {
        goto LABEL_26;
      }
    }
    else if (!v9)
    {
      goto LABEL_26;
    }
    BOOL v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v45 = *MEMORY[0x263F07F80];
    uint64_t v18 = [NSString stringWithFormat:@"Cannot enable module with identifier '%@' as it's unsupported", v8];
    v46 = v18;
    v19 = NSDictionary;
    int v20 = &v46;
    int v21 = &v45;
    goto LABEL_16;
  }
  int v15 = [(CCSModuleSettingsProvider *)self->_settingsProvider orderedFixedModuleIdentifiers];
  int v16 = [v15 containsObject:v8];

  if (!v16)
  {
    v28 = [(CCSModuleSettingsProvider *)self->_settingsProvider orderedUserEnabledFixedModuleIdentifiers];
    int v29 = [v28 containsObject:v8];

    if (v29)
    {
      v30 = CCSLogRemoteService;
      if (!os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      *(_DWORD *)buf = 138543362;
      id v50 = v8;
    }
    else
    {
      uint64_t v31 = [(CCSModuleSettingsProvider *)self->_settingsProvider orderedUserEnabledModuleIdentifiers];
      int v32 = [v31 containsObject:v8];

      if (!v32)
      {
        uint64_t v33 = [(CCSModuleSettingsProvider *)self->_settingsProvider userDisabledModuleIdentifiers];
        int v34 = [v33 containsObject:v8];

        v35 = CCSLogRemoteService;
        if (v34 && (v6 & v12 & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
          {
            -[CCSRemoteServiceProvider requestEnableModuleWithIdentifier:force:completionHandler:]();
            if (!v9) {
              goto LABEL_26;
            }
          }
          else if (!v9)
          {
            goto LABEL_26;
          }
          BOOL v17 = (void *)MEMORY[0x263F087E8];
          uint64_t v41 = *MEMORY[0x263F07F80];
          uint64_t v18 = [NSString stringWithFormat:@"Cannot enable module with identifier '%@' as it's been user disabled", v8];
          v42 = v18;
          v19 = NSDictionary;
          int v20 = &v42;
          int v21 = &v41;
          goto LABEL_16;
        }
        if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v50 = v8;
          _os_log_impl(&dword_221518000, v35, OS_LOG_TYPE_DEFAULT, "Enabling module with identifier '%{public}@'", buf, 0xCu);
        }
        int v36 = [v8 isEqualToString:@"com.apple.Home.ControlCenter"];
        settingsProvider = self->_settingsProvider;
        if (v36)
        {
          v38 = [(CCSModuleSettingsProvider *)settingsProvider orderedUserEnabledFixedModuleIdentifiers];
          v39 = [v38 arrayByAddingObject:v8];

          [(CCSModuleSettingsProvider *)self->_settingsProvider setAndSaveOrderedUserEnabledFixedModuleIdentifiers:v39];
        }
        else
        {
          v40 = [(CCSModuleSettingsProvider *)settingsProvider orderedUserEnabledModuleIdentifiers];
          v39 = [v40 arrayByAddingObject:v8];

          [(CCSModuleSettingsProvider *)self->_settingsProvider setAndSaveOrderedUserEnabledModuleIdentifiers:v39];
        }

        if (!v9) {
          goto LABEL_26;
        }
LABEL_25:
        v9[2](v9, 1, 0);
        goto LABEL_26;
      }
      v30 = CCSLogRemoteService;
      if (!os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_DEFAULT))
      {
LABEL_24:
        if (!v9) {
          goto LABEL_26;
        }
        goto LABEL_25;
      }
      *(_DWORD *)buf = 138543362;
      id v50 = v8;
    }
    _os_log_impl(&dword_221518000, v30, OS_LOG_TYPE_DEFAULT, "Cannot enable module with identifier '%{public}@' as it's already enabled", buf, 0xCu);
    goto LABEL_24;
  }
  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
  {
    -[CCSRemoteServiceProvider requestEnableModuleWithIdentifier:force:completionHandler:]();
    if (!v9) {
      goto LABEL_26;
    }
    goto LABEL_8;
  }
  if (v9)
  {
LABEL_8:
    BOOL v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v43 = *MEMORY[0x263F07F80];
    uint64_t v18 = [NSString stringWithFormat:@"Cannot enable module with identifier '%@' as it's not user configurable", v8];
    v44 = v18;
    v19 = NSDictionary;
    int v20 = &v44;
    int v21 = &v43;
LABEL_16:
    v26 = [v19 dictionaryWithObjects:v20 forKeys:v21 count:1];
    v27 = [v17 errorWithDomain:@"CCSControlCenterServicesErrorDomain" code:0 userInfo:v26];
    v9[2](v9, 0, v27);
  }
LABEL_26:
}

- (void)requestDisableModuleWithIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  id v8 = CCSLogRemoteService;
  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v38 = v6;
    _os_log_impl(&dword_221518000, v8, OS_LOG_TYPE_DEFAULT, "Requesting disable of module with identifier '%{public}@'", buf, 0xCu);
  }
  uint64_t v9 = [MEMORY[0x263F08D68] currentConnection];
  if ((objc_msgSend(v9, "ccs_hasEntitlementForModuleIdentifier:", v6) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
    {
      -[CCSRemoteServiceProvider getEnabledStateOfModuleWithIdentifier:completionHandler:]();
      if (!v7) {
        goto LABEL_12;
      }
    }
    else if (!v7)
    {
LABEL_12:
      [v9 invalidate];
      goto LABEL_18;
    }
    v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v35 = *MEMORY[0x263F07F80];
    int v20 = [NSString stringWithFormat:@"Missing entitlement for module with identifier '%@'", v6];
    int v36 = v20;
    int v21 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    id v22 = [v19 errorWithDomain:@"CCSControlCenterServicesErrorDomain" code:0 userInfo:v21];
    v7[2](v7, 0, v22);

    goto LABEL_12;
  }
  v10 = [(CCSModuleRepository *)self->_moduleRepository loadableModuleIdentifiers];
  char v11 = [v10 containsObject:v6];

  if ((v11 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
    {
      -[CCSRemoteServiceProvider requestDisableModuleWithIdentifier:completionHandler:]();
      if (!v7) {
        goto LABEL_18;
      }
    }
    else if (!v7)
    {
      goto LABEL_18;
    }
    char v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v33 = *MEMORY[0x263F07F80];
    int v15 = [NSString stringWithFormat:@"Cannot disable module with identifier '%@' as it's unsupported", v6];
    int v34 = v15;
    int v16 = NSDictionary;
    BOOL v17 = &v34;
    uint64_t v18 = &v33;
    goto LABEL_16;
  }
  int v12 = [(CCSModuleSettingsProvider *)self->_settingsProvider orderedFixedModuleIdentifiers];
  int v13 = [v12 containsObject:v6];

  if (v13)
  {
    if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
    {
      -[CCSRemoteServiceProvider requestDisableModuleWithIdentifier:completionHandler:]();
      if (!v7) {
        goto LABEL_18;
      }
      goto LABEL_8;
    }
    if (v7)
    {
LABEL_8:
      char v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v31 = *MEMORY[0x263F07F80];
      int v15 = [NSString stringWithFormat:@"Cannot disable module with identifier '%@' as it's not user configurable", v6];
      int v32 = v15;
      int v16 = NSDictionary;
      BOOL v17 = &v32;
      uint64_t v18 = &v31;
LABEL_16:
      uint64_t v23 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:1];
      v24 = [v14 errorWithDomain:@"CCSControlCenterServicesErrorDomain" code:0 userInfo:v23];
      v7[2](v7, 0, v24);

LABEL_17:
    }
  }
  else
  {
    v25 = [(CCSModuleSettingsProvider *)self->_settingsProvider userDisabledModuleIdentifiers];
    int v26 = [v25 containsObject:v6];

    v27 = CCSLogRemoteService;
    BOOL v28 = os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_DEFAULT);
    if (!v26)
    {
      if (v28)
      {
        *(_DWORD *)buf = 138543362;
        id v38 = v6;
        _os_log_impl(&dword_221518000, v27, OS_LOG_TYPE_DEFAULT, "Disabling module with identifier '%{public}@'", buf, 0xCu);
      }
      int v29 = [(CCSModuleSettingsProvider *)self->_settingsProvider orderedUserEnabledModuleIdentifiers];
      v30 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF != %@", v6];
      int v15 = [v29 filteredArrayUsingPredicate:v30];

      [(CCSModuleSettingsProvider *)self->_settingsProvider setAndSaveOrderedUserEnabledModuleIdentifiers:v15];
      if (v7) {
        v7[2](v7, 1, 0);
      }
      goto LABEL_17;
    }
    if (v28)
    {
      *(_DWORD *)buf = 138543362;
      id v38 = v6;
      _os_log_impl(&dword_221518000, v27, OS_LOG_TYPE_DEFAULT, "Cannot disable module with identifier '%{public}@' as it's already disabled", buf, 0xCu);
    }
    if (v7) {
      v7[2](v7, 1, 0);
    }
  }
LABEL_18:
}

- (void)requestAvailableModuleIdentifiersWithCompletionHandler:(id)a3
{
  int v4 = (void (**)(id, void *, void))a3;
  uint64_t v5 = CCSLogRemoteService;
  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_221518000, v5, OS_LOG_TYPE_DEFAULT, "Request list of available module identifiers", v9, 2u);
  }
  id v6 = [MEMORY[0x263F08D68] currentConnection];
  if (objc_msgSend(v6, "ccs_hasEntitlementForListingModuleIdentifiers"))
  {
    uint64_t v7 = [(CCSModuleRepository *)self->_moduleRepository loadableModuleIdentifiers];
    id v8 = [v7 allObjects];
    v4[2](v4, v8, 0);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR)) {
      -[CCSRemoteServiceProvider requestAvailableModuleIdentifiersWithCompletionHandler:]();
    }
    [v6 invalidate];
  }
}

- (void)presentModuleWithIdentifier:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = [MEMORY[0x263F08D68] currentConnection];
  if (objc_msgSend(v11, "ccs_hasEntitlementForModuleIdentifier:", v8))
  {
    int v12 = [(CCSModuleRepository *)self->_moduleRepository loadableModuleIdentifiers];
    int v13 = [v12 containsObject:v8];

    char v14 = CCSLogRemoteService;
    if (v13)
    {
      if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v8;
        _os_log_impl(&dword_221518000, v14, OS_LOG_TYPE_DEFAULT, "Present module with identifier'%{public}@'", (uint8_t *)&buf, 0xCu);
      }
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v35 = 0x2020000000;
      char v36 = 0;
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __82__CCSRemoteServiceProvider_presentModuleWithIdentifier_options_completionHandler___block_invoke;
      v25[3] = &unk_2645B6320;
      id v15 = v8;
      id v26 = v15;
      id v27 = v9;
      id v16 = v10;
      id v28 = v16;
      p_long long buf = &buf;
      [(CCSRemoteServiceProvider *)self enumerateEndpointsUsingBlock:v25];
      if (!*(unsigned char *)(*((void *)&buf + 1) + 24))
      {
        BOOL v17 = (void *)MEMORY[0x263F087E8];
        uint64_t v32 = *MEMORY[0x263F07F80];
        objc_msgSend(NSString, "stringWithFormat:", @"Cannot present module with identifier '%@'; could not find an endpoint to present",
        uint64_t v18 = v15);
        uint64_t v33 = v18;
        v19 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
        int v20 = [v17 errorWithDomain:@"CCSControlCenterServicesErrorDomain" code:0 userInfo:v19];
        (*((void (**)(id, void, void *))v16 + 2))(v16, 0, v20);
      }
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR)) {
        -[CCSRemoteServiceProvider presentModuleWithIdentifier:options:completionHandler:]();
      }
      if (v10)
      {
        int v21 = (void *)MEMORY[0x263F087E8];
        uint64_t v30 = *MEMORY[0x263F07F80];
        id v22 = [NSString stringWithFormat:@"Cannot present module with identifier '%@' as it's unsupported", v8];
        uint64_t v31 = v22;
        uint64_t v23 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
        v24 = [v21 errorWithDomain:@"CCSControlCenterServicesErrorDomain" code:0 userInfo:v23];
        (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v24);
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR)) {
      -[CCSRemoteServiceProvider getEnabledStateOfModuleWithIdentifier:completionHandler:]();
    }
    [v11 invalidate];
  }
}

void __82__CCSRemoteServiceProvider_presentModuleWithIdentifier_options_completionHandler___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __82__CCSRemoteServiceProvider_presentModuleWithIdentifier_options_completionHandler___block_invoke_2;
  v11[3] = &unk_2645B62F8;
  id v12 = v5;
  id v13 = *(id *)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  id v16 = v7;
  uint64_t v17 = v8;
  id v15 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v11);
  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
}

void __82__CCSRemoteServiceProvider_presentModuleWithIdentifier_options_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __82__CCSRemoteServiceProvider_presentModuleWithIdentifier_options_completionHandler___block_invoke_3;
  v7[3] = &unk_2645B62D0;
  id v10 = *(id *)(a1 + 64);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 72);
  id v8 = v5;
  uint64_t v11 = v6;
  id v9 = *(id *)(a1 + 56);
  [v2 presentModuleWithIdentifier:v3 options:v4 completion:v7];
}

void __82__CCSRemoteServiceProvider_presentModuleWithIdentifier_options_completionHandler___block_invoke_3(uint64_t a1, char a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v4 = (void *)MEMORY[0x263F087E8];
    objc_msgSend(NSString, "stringWithFormat:", @"Cannot present module with identifier '%@'; endpoint unable to present",
      *(void *)(a1 + 32),
    id v5 = *MEMORY[0x263F07F80]);
    v9[0] = v5;
    uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    id v7 = [v4 errorWithDomain:@"CCSControlCenterServicesErrorDomain" code:0 userInfo:v6];
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v7);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)handleIconElementRequest:(id)a3 completionHandler:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x263F08D68];
  id v7 = a4;
  uint64_t v8 = [v6 currentConnection];
  if (objc_msgSend(v8, "ccs_hasEntitlementForForciblyEnablingModules"))
  {
    id v9 = +[CCSControlCenterOperationService sharedService];
    [v9 handleIconElementRequest:v5 completionHandler:v7];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR)) {
      -[CCSRemoteServiceProvider handleIconElementRequest:completionHandler:]();
    }
    id v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F07F80];
    v14[0] = @"The application-identifier in your entitlements file is not allow-listed for this SPI. Please contact the Control Center team.";
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    id v12 = [v10 errorWithDomain:@"CCSControlCenterServicesErrorDomain" code:0 userInfo:v11];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);

    [v8 invalidate];
  }
}

- (void)handleControlCenterOperationType:(int64_t)a3 completionHandler:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x263F08D68];
  id v6 = a4;
  id v7 = [v5 currentConnection];
  if (objc_msgSend(v7, "ccs_hasEntitlementForHandlingControlCenterOperation"))
  {
    uint64_t v8 = +[CCSControlCenterOperationService sharedService];
    [v8 handleControlCenterOperationType:a3 completionHandler:v6];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR)) {
      -[CCSRemoteServiceProvider handleControlCenterOperationType:completionHandler:]();
    }
    id v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F07F80];
    v13[0] = @"The application-identifier in your entitlements file is not allow-listed for this SPI. Please contact the Control Center team.";
    id v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint64_t v11 = [v9 errorWithDomain:@"CCSControlCenterServicesErrorDomain" code:0 userInfo:v10];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v11);

    [v7 invalidate];
  }
}

- (void)requestIconElementState:(id)a3 completionHandler:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x263F08D68];
  id v7 = a4;
  uint64_t v8 = [v6 currentConnection];
  if (objc_msgSend(v8, "ccs_hasEntitlementForForciblyEnablingModules"))
  {
    id v9 = +[CCSControlCenterOperationService sharedService];
    [v9 requestIconElementState:v5 completionHandler:v7];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR)) {
      -[CCSRemoteServiceProvider requestIconElementState:completionHandler:]();
    }
    id v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F07F80];
    v14[0] = @"The application-identifier in your entitlements file is not allow-listed for this SPI. Please contact the Control Center team.";
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    uint64_t v12 = [v10 errorWithDomain:@"CCSControlCenterServicesErrorDomain" code:0 userInfo:v11];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);

    [v8 invalidate];
  }
}

- (void)resetToDefaultLayoutWithCompletionHandler:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263F08D68];
  id v4 = a3;
  id v5 = [v3 currentConnection];
  if (objc_msgSend(v5, "ccs_hasEntitlementToResetToDefaultLayout"))
  {
    id v6 = +[CCSControlCenterOperationService sharedService];
    [v6 resetToDefaultLayoutWithCompletionHandler:v4];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR)) {
      -[CCSRemoteServiceProvider resetToDefaultLayoutWithCompletionHandler:]();
    }
    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F07F80];
    v11[0] = @"The application-identifier in your entitlements file is not allow-listed for this SPI. Please contact the Control Center team.";
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    id v9 = [v7 errorWithDomain:@"CCSControlCenterServicesErrorDomain" code:0 userInfo:v8];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v9);

    [v5 invalidate];
  }
}

- (void)enumerateEndpointsUsingBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, uint64_t, char *))a3;
  id v5 = self->_presentationEndpoints;
  objc_sync_enter(v5);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_presentationEndpoints;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v6);
      }
      uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
      char v11 = 0;
      v4[2](v4, v10, &v11);
      if (v11) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  objc_sync_exit(v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationEndpoints, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_controlCenterOperationService, 0);
  objc_storeStrong((id *)&self->_settingsProvider, 0);

  objc_storeStrong((id *)&self->_moduleRepository, 0);
}

- (void)getEnabledStateOfModuleWithIdentifier:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_221518000, v0, v1, "Missing entitlement for module with identifier '%{public}@'", v2, v3, v4, v5, v6);
}

- (void)requestEnableModuleWithIdentifier:force:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_221518000, v0, v1, "Cannot enable module with identifier '%{public}@' as it's not user configurable", v2, v3, v4, v5, v6);
}

- (void)requestEnableModuleWithIdentifier:force:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_221518000, v0, v1, "Cannot enable module with identifier '%{public}@' as it's been user disabled", v2, v3, v4, v5, v6);
}

- (void)requestEnableModuleWithIdentifier:force:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_221518000, v0, v1, "Cannot enable module with identifier '%{public}@' as it's unsupported", v2, v3, v4, v5, v6);
}

- (void)requestDisableModuleWithIdentifier:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_221518000, v0, v1, "Cannot disable module with identifier '%{public}@' as it's not user configurable", v2, v3, v4, v5, v6);
}

- (void)requestDisableModuleWithIdentifier:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_221518000, v0, v1, "Cannot disable module with identifier '%{public}@' as it's unsupported", v2, v3, v4, v5, v6);
}

- (void)setVisibility:forModuleWithIdentifier:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_221518000, v0, v1, "Cannot set visibility of module with identifier '%{public}@' as it's not found", v2, v3, v4, v5, v6);
}

- (void)setVisibility:forModuleWithIdentifier:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_221518000, v0, v1, "Cannot set visibility of module with identifier '%{public}@' as it's not unsupported", v2, v3, v4, v5, v6);
}

- (void)requestAvailableModuleIdentifiersWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_221518000, v0, v1, "Missing entitlement for listing module identifiers", v2, v3, v4, v5, v6);
}

- (void)presentModuleWithIdentifier:options:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_221518000, v0, v1, "Cannot present module with identifier '%{public}@' as it's unsupported", v2, v3, v4, v5, v6);
}

- (void)handleIconElementRequest:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_221518000, v0, v1, "The application-identifier in your entitlements file is not allow-listed for handling CCSIconElementRequest", v2, v3, v4, v5, v6);
}

- (void)handleControlCenterOperationType:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_221518000, v0, v1, "The application-identifier in your entitlements file is not allow-listed for handling CCSControlCenterOperationRequest", v2, v3, v4, v5, v6);
}

- (void)requestIconElementState:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_221518000, v0, v1, "The application-identifier in your entitlements file is not allow-listed for requesting CCSIconElementState for CCSControlCenterOperationRequest", v2, v3, v4, v5, v6);
}

- (void)resetToDefaultLayoutWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_221518000, v0, v1, "The application-identifier in your entitlements file is not allow-listed to reset default Control Center layout", v2, v3, v4, v5, v6);
}

@end