@interface SRAuthorizationClient
+ (SRAuthorizationClient)authClient;
+ (SRAuthorizationClient)sharedInstance;
+ (void)initialize;
+ (void)setAuthClient:(id)a3;
- (BOOL)dataCollectionEnabled;
- (BOOL)firstRunOnboardingCompleted;
- (BOOL)initialAuthNeeded;
- (NSArray)legacyResearchStudyBundleIDs;
- (NSDictionary)authorizedServices;
- (NSString)legacyResearchStudyEntitlement;
- (SRAuthorizationClient)init;
- (SRAuthorizationClient)initWithConnection:(id)a3;
- (uint64_t)authorizedServicesForBundleId:(void *)a1;
- (uint64_t)deniedServicesForBundleId:(void *)a1;
- (uint64_t)syncProxy;
- (void)addListener:(id)a3;
- (void)addListener:(id)a3 forBundleId:(id)a4;
- (void)authorizedServicesDidChange:(id)a3 deniedServices:(id)a4 prerequisites:(int64_t)a5 lastModifiedTimes:(id)a6 bundleIdentifier:(id)a7;
- (void)dealloc;
- (void)initialAuthorizationStateForBundleId:(id)a3 authorizationState:(id)a4;
- (void)invalidate;
- (void)lastModifiedTimesForBundleId:(void *)result;
- (void)notifyListener:(uint64_t)a3 withAuthorizationChangeForBundleIdentifier:;
- (void)removeListener:(id)a3;
- (void)reregisterAfterInterruption:(id)a3 effectiveBundleId:(id)a4;
- (void)setDataCollectionEnabled:(BOOL)a3;
- (void)setFirstRunOnboardingCompleted:(BOOL)a3;
- (void)setInitialAuthNeeded:(BOOL)a3;
- (void)updateInitialAuthorizationStateIfNeeded;
@end

@implementation SRAuthorizationClient

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    SRLogAuthorizationClient = (uint64_t)os_log_create("com.apple.SensorKit", "AuthorizationClient");
  }
}

+ (SRAuthorizationClient)authClient
{
  return (SRAuthorizationClient *)_MergedGlobals_10;
}

+ (void)setAuthClient:(id)a3
{
  if ((id)_MergedGlobals_10 != a3)
  {

    _MergedGlobals_10 = (uint64_t)a3;
  }
}

+ (SRAuthorizationClient)sharedInstance
{
  result = (SRAuthorizationClient *)_MergedGlobals_10;
  if (!_MergedGlobals_10)
  {
    if (qword_26AB1A160 != -1) {
      dispatch_once(&qword_26AB1A160, &__block_literal_global_12);
    }
    return (SRAuthorizationClient *)qword_26AB1A158;
  }
  return result;
}

SRAuthorizationClient *__39__SRAuthorizationClient_sharedInstance__block_invoke()
{
  result = objc_alloc_init(SRAuthorizationClient);
  qword_26AB1A158 = (uint64_t)result;
  return result;
}

- (SRAuthorizationClient)init
{
  id v3 = (id)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.SensorKit.authorization" options:4096];

  return [(SRAuthorizationClient *)self initWithConnection:v3];
}

- (SRAuthorizationClient)initWithConnection:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v25.receiver = self;
  v25.super_class = (Class)SRAuthorizationClient;
  v4 = [(SRAuthorizationClient *)&v25 init];
  v5 = v4;
  if (v4)
  {
    [(SRAuthorizationClient *)v4 setInitialAuthNeeded:1];
    v6 = (void *)[MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    objc_setProperty_nonatomic(v5, v7, v6, 24);
    v8 = (void *)[MEMORY[0x263EFF9A0] dictionary];
    objc_setProperty_atomic(v5, v9, v8, 32);
    v10 = (void *)[MEMORY[0x263EFF9A0] dictionary];
    objc_setProperty_atomic(v5, v11, v10, 40);
    v12 = (void *)[MEMORY[0x263EFF9A0] dictionary];
    objc_setProperty_atomic(v5, v13, v12, 48);
    objc_setProperty_nonatomic(v5, v14, a3, 16);
    -[NSXPCConnection setRemoteObjectInterface:](v5->_connection, "setRemoteObjectInterface:", [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D181658]);
    -[NSXPCConnection setExportedInterface:](v5->_connection, "setExportedInterface:", [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D17C760]);
    [(NSXPCConnection *)v5->_connection setExportedObject:v5];
    objc_initWeak(&location, v5);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __44__SRAuthorizationClient_initWithConnection___block_invoke;
    v22[3] = &unk_26452ED40;
    objc_copyWeak(&v23, &location);
    v22[4] = a3;
    [(NSXPCConnection *)v5->_connection setInterruptionHandler:v22];
    [(NSXPCConnection *)v5->_connection resume];
    v15 = SRLogAuthorizationClient;
    if (os_log_type_enabled((os_log_t)SRLogAuthorizationClient, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(handler[0]) = 0;
      _os_log_debug_impl(&dword_21FCA3000, v15, OS_LOG_TYPE_DEBUG, "Registering for prerequisites notification", (uint8_t *)handler, 2u);
    }
    objc_initWeak(&from, v5);
    v5->_registrationToken = -1;
    p_registrationToken = &v5->_registrationToken;
    v17 = (const char *)[@"com.apple.SensorKit.prerequisitesUpdated" UTF8String];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __56__SRAuthorizationClient_registerForPrerequisitesUpdated__block_invoke;
    handler[3] = &unk_26452E270;
    objc_copyWeak(&v27, &from);
    uint32_t v18 = notify_register_dispatch(v17, &v5->_registrationToken, MEMORY[0x263EF83A0], handler);
    if (v18 || *p_registrationToken == -1)
    {
      v19 = SRLogAuthorizationClient;
      if (os_log_type_enabled((os_log_t)SRLogAuthorizationClient, OS_LOG_TYPE_ERROR))
      {
        int v20 = *p_registrationToken;
        *(_DWORD *)buf = 67240448;
        uint32_t v30 = v18;
        __int16 v31 = 1026;
        int v32 = v20;
        _os_log_error_impl(&dword_21FCA3000, v19, OS_LOG_TYPE_ERROR, "Failed to register for prerequisites notification status %{public}d, registration token %{public}d", buf, 0xEu);
      }
    }
    objc_destroyWeak(&v27);
    objc_destroyWeak(&from);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  return v5;
}

id *__44__SRAuthorizationClient_initWithConnection___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  result = (id *)objc_loadWeak((id *)(a1 + 40));
  if (result)
  {
    id v3 = result;
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = (void *)[MEMORY[0x263EFF9C0] set];
    id v6 = v3[3];
    objc_sync_enter(v6);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v3[3];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(v5, "addObject:", objc_msgSend(v3[3], "objectForKey:", *(void *)(*((void *)&v20 + 1) + 8 * i)));
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v8);
    }
    objc_sync_exit(v6);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    result = (id *)[v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
    SEL v11 = result;
    if (result)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        SEL v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v5);
          }
          SEL v14 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v13);
          if (objc_msgSend(v14, "isEqualToString:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "bundleIdentifier")))v15 = 0; {
          else
          }
            v15 = v14;
          [v3 reregisterAfterInterruption:v4 effectiveBundleId:v15];
          SEL v13 = (id *)((char *)v13 + 1);
        }
        while (v11 != v13);
        result = (id *)[v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
        SEL v11 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)invalidate
{
  self->_connection = 0;
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (self)
  {
    int registrationToken = self->_registrationToken;
    if (registrationToken != -1)
    {
      uint64_t v4 = SRLogAuthorizationClient;
      if (os_log_type_enabled((os_log_t)SRLogAuthorizationClient, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_DEBUG, "Unregistering for prerequisites notification", buf, 2u);
        int registrationToken = self->_registrationToken;
      }
      if (notify_cancel(registrationToken))
      {
        v5 = SRLogAuthorizationClient;
        if (os_log_type_enabled((os_log_t)SRLogAuthorizationClient, OS_LOG_TYPE_ERROR))
        {
          int v9 = self->_registrationToken;
          *(_DWORD *)buf = 67240192;
          int v12 = v9;
          _os_log_error_impl(&dword_21FCA3000, v5, OS_LOG_TYPE_ERROR, "Failed to cancel notification status %{public}d", buf, 8u);
        }
      }
      self->_int registrationToken = -1;
    }
  }

  self->_listeners = 0;
  self->_actualAuthorizedServices = 0;
  objc_setProperty_atomic(self, v6, 0, 56);
  objc_setProperty_atomic(self, v7, 0, 40);

  self->_connection = 0;
  objc_setProperty_atomic(self, v8, 0, 48);
  v10.receiver = self;
  v10.super_class = (Class)SRAuthorizationClient;
  [(SRAuthorizationClient *)&v10 dealloc];
}

- (void)reregisterAfterInterruption:(id)a3 effectiveBundleId:(id)a4
{
  v5 = (void *)[a3 remoteObjectProxy];

  [v5 registerForAuthorizationChangeNotificationsWithEffectiveBundleId:a4];
}

- (void)updateInitialAuthorizationStateIfNeeded
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    result = (void *)[result initialAuthNeeded];
    if (result)
    {
      v2 = SRLogAuthorizationClient;
      if (os_log_type_enabled((os_log_t)SRLogAuthorizationClient, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21FCA3000, v2, OS_LOG_TYPE_INFO, "Retrieving initial authorization state", buf, 2u);
      }
      id v3 = (void *)-[SRAuthorizationClient syncProxy](v1);
      v4[0] = MEMORY[0x263EF8330];
      v4[1] = 3221225472;
      v4[2] = __64__SRAuthorizationClient_updateInitialAuthorizationStateIfNeeded__block_invoke;
      v4[3] = &unk_26452ED68;
      v4[4] = v1;
      return (void *)[v3 retrieveCurrentAuthorizedServicesWithReply:v4];
    }
  }
  return result;
}

- (uint64_t)syncProxy
{
  if (!a1) {
    return 0;
  }
  uint64_t v9 = 0;
  objc_super v10 = &v9;
  uint64_t v11 = 0x3052000000;
  int v12 = __Block_byref_object_copy__2;
  uint64_t v13 = __Block_byref_object_dispose__2;
  uint64_t v14 = 0;
  v2 = *(void **)(a1 + 16);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __34__SRAuthorizationClient_syncProxy__block_invoke;
  v8[3] = &unk_26452ED90;
  v8[4] = &v9;
  uint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v8];
  if (!v3)
  {
    uint64_t v4 = (void *)[(id)v10[5] domain];
    if ([v4 isEqualToString:*MEMORY[0x263F07F70]]
      && [(id)v10[5] code] == 4097)
    {

      v5 = SRLogAuthorizationClient;
      if (os_log_type_enabled((os_log_t)SRLogAuthorizationClient, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)SEL v7 = 0;
        _os_log_impl(&dword_21FCA3000, v5, OS_LOG_TYPE_DEFAULT, "Connection was interrupted, retrying...", v7, 2u);
      }
      uint64_t v3 = [*(id *)(a1 + 16) synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_35];
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  _Block_object_dispose(&v9, 8);
  return v3;
}

uint64_t __64__SRAuthorizationClient_updateInitialAuthorizationStateIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    SEL v8 = *(void **)(v7 + 24);
  }
  else {
    SEL v8 = 0;
  }
  id v49 = v8;
  objc_sync_enter(v8);
  objc_super v10 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithDictionary:a2];
  uint64_t v11 = *(void **)(a1 + 32);
  if (v11) {
    objc_setProperty_atomic(v11, v9, v10, 32);
  }
  uint64_t v13 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithDictionary:a3];
  uint64_t v14 = *(void **)(a1 + 32);
  if (v14) {
    objc_setProperty_atomic(v14, v12, v13, 40);
  }
  long long v16 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithDictionary:a4];
  long long v17 = *(void **)(a1 + 32);
  if (v17) {
    objc_setProperty_atomic(v17, v15, v16, 48);
  }
  long long v19 = (void *)[NSNumber numberWithInteger:a5];
  long long v20 = *(void **)(a1 + 32);
  if (v20) {
    objc_setProperty_atomic(v20, v18, v19, 56);
  }
  long long v21 = SRLogAuthorizationClient;
  if (os_log_type_enabled((os_log_t)SRLogAuthorizationClient, OS_LOG_TYPE_INFO))
  {
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v22, 56, 1);
    }
    *(_DWORD *)buf = 134217984;
    uint64_t v68 = [Property integerValue];
    _os_log_impl(&dword_21FCA3000, v21, OS_LOG_TYPE_INFO, "Retrieved initial authorization state. prerequisites: %ld", buf, 0xCu);
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v24 = [a2 countByEnumeratingWithState:&v61 objects:v71 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v62 != v25) {
          objc_enumerationMutation(a2);
        }
        uint64_t v27 = *(void *)(*((void *)&v61 + 1) + 8 * i);
        v28 = SRLogAuthorizationClient;
        if (os_log_type_enabled((os_log_t)SRLogAuthorizationClient, OS_LOG_TYPE_INFO))
        {
          id v30 = *(id *)(a1 + 32);
          if (v30) {
            id v30 = objc_getProperty(v30, v29, 32, 1);
          }
          uint64_t v31 = [v30 objectForKeyedSubscript:v27];
          *(_DWORD *)buf = 138543619;
          uint64_t v68 = v27;
          __int16 v69 = 2113;
          uint64_t v70 = v31;
          _os_log_impl(&dword_21FCA3000, v28, OS_LOG_TYPE_INFO, "%{public}@ authorized: %{private}@", buf, 0x16u);
        }
      }
      uint64_t v24 = [a2 countByEnumeratingWithState:&v61 objects:v71 count:16];
    }
    while (v24);
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v32 = [a3 countByEnumeratingWithState:&v57 objects:v66 count:16];
  if (v32)
  {
    uint64_t v33 = *(void *)v58;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v58 != v33) {
          objc_enumerationMutation(a3);
        }
        uint64_t v35 = *(void *)(*((void *)&v57 + 1) + 8 * j);
        v36 = SRLogAuthorizationClient;
        if (os_log_type_enabled((os_log_t)SRLogAuthorizationClient, OS_LOG_TYPE_INFO))
        {
          id v38 = *(id *)(a1 + 32);
          if (v38) {
            id v38 = objc_getProperty(v38, v37, 40, 1);
          }
          uint64_t v39 = [v38 objectForKeyedSubscript:v35];
          *(_DWORD *)buf = 138543619;
          uint64_t v68 = v35;
          __int16 v69 = 2113;
          uint64_t v70 = v39;
          _os_log_impl(&dword_21FCA3000, v36, OS_LOG_TYPE_INFO, "%{public}@ denied: %{private}@", buf, 0x16u);
        }
      }
      uint64_t v32 = [a3 countByEnumeratingWithState:&v57 objects:v66 count:16];
    }
    while (v32);
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v40 = [a4 countByEnumeratingWithState:&v53 objects:v65 count:16];
  if (v40)
  {
    uint64_t v41 = *(void *)v54;
    do
    {
      for (uint64_t k = 0; k != v40; ++k)
      {
        if (*(void *)v54 != v41) {
          objc_enumerationMutation(a4);
        }
        uint64_t v43 = *(void *)(*((void *)&v53 + 1) + 8 * k);
        v44 = SRLogAuthorizationClient;
        if (os_log_type_enabled((os_log_t)SRLogAuthorizationClient, OS_LOG_TYPE_INFO))
        {
          id v46 = *(id *)(a1 + 32);
          if (v46) {
            id v46 = objc_getProperty(v46, v45, 48, 1);
          }
          uint64_t v47 = [v46 objectForKeyedSubscript:v43];
          *(_DWORD *)buf = 138543619;
          uint64_t v68 = v43;
          __int16 v69 = 2113;
          uint64_t v70 = v47;
          _os_log_impl(&dword_21FCA3000, v44, OS_LOG_TYPE_INFO, "%{public}@ last modified times: %{private}@", buf, 0x16u);
        }
      }
      uint64_t v40 = [a4 countByEnumeratingWithState:&v53 objects:v65 count:16];
    }
    while (v40);
  }
  [*(id *)(a1 + 32) setInitialAuthNeeded:0];
  return objc_sync_exit(v49);
}

void __56__SRAuthorizationClient_registerForPrerequisitesUpdated__block_invoke(uint64_t a1)
{
  [objc_loadWeak((id *)(a1 + 32)) setInitialAuthNeeded:1];
  uint64_t v1 = SRLogAuthorizationClient;
  if (os_log_type_enabled((os_log_t)SRLogAuthorizationClient, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v2 = 0;
    _os_log_debug_impl(&dword_21FCA3000, v1, OS_LOG_TYPE_DEBUG, "Received notification of prerequisite change", v2, 2u);
  }
}

- (NSDictionary)authorizedServices
{
  -[SRAuthorizationClient updateInitialAuthorizationStateIfNeeded](self);
  if (self)
  {
    listeners = self->_listeners;
    objc_sync_enter(listeners);
    uint64_t v4 = NSDictionary;
    id Property = objc_getProperty(self, v5, 32, 1);
  }
  else
  {
    objc_sync_enter(0);
    listeners = 0;
    id Property = 0;
    uint64_t v4 = NSDictionary;
  }
  uint64_t v7 = (NSDictionary *)objc_msgSend(v4, "dictionaryWithDictionary:", (id)objc_msgSend(Property, "copy"));
  objc_sync_exit(listeners);
  return v7;
}

- (BOOL)dataCollectionEnabled
{
  -[SRAuthorizationClient updateInitialAuthorizationStateIfNeeded](self);
  if (self) {
    id Property = objc_getProperty(self, v3, 56, 1);
  }
  else {
    id Property = 0;
  }
  return [Property integerValue] & 1;
}

- (void)setDataCollectionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  [(SRAuthorizationClient *)self setInitialAuthNeeded:1];
  SEL v5 = (void *)-[SRAuthorizationClient syncProxy]((uint64_t)self);

  [v5 setDataCollectionEnabled:v3];
}

- (BOOL)firstRunOnboardingCompleted
{
  -[SRAuthorizationClient updateInitialAuthorizationStateIfNeeded](self);
  if (self) {
    id Property = objc_getProperty(self, v3, 56, 1);
  }
  else {
    id Property = 0;
  }
  return ((unint64_t)[Property integerValue] >> 1) & 1;
}

- (void)setFirstRunOnboardingCompleted:(BOOL)a3
{
  BOOL v3 = a3;
  [(SRAuthorizationClient *)self setInitialAuthNeeded:1];
  SEL v5 = (void *)-[SRAuthorizationClient syncProxy]((uint64_t)self);

  [v5 setFirstRunOnboardingCompleted:v3];
}

id __34__SRAuthorizationClient_syncProxy__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v4 = SRLogAuthorizationClient;
  if (os_log_type_enabled((os_log_t)SRLogAuthorizationClient, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    uint64_t v7 = a2;
    _os_log_error_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_ERROR, "Failed to get sync proxy to daemon, error %{public}@", (uint8_t *)&v6, 0xCu);
  }
  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

void __34__SRAuthorizationClient_syncProxy__block_invoke_33(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  BOOL v3 = SRLogAuthorizationClient;
  if (os_log_type_enabled((os_log_t)SRLogAuthorizationClient, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    uint64_t v5 = a2;
    _os_log_error_impl(&dword_21FCA3000, v3, OS_LOG_TYPE_ERROR, "Failed to get sync proxy to daemon, error %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (NSArray)legacyResearchStudyBundleIDs
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__2;
  objc_super v10 = __Block_byref_object_dispose__2;
  uint64_t v11 = 0;
  v2 = (void *)-[SRAuthorizationClient syncProxy]((uint64_t)self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__SRAuthorizationClient_legacyResearchStudyBundleIDs__block_invoke;
  v5[3] = &unk_26452EDB8;
  v5[4] = &v6;
  [v2 legacyResearchStudyBundleIDs:v5];
  BOOL v3 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __53__SRAuthorizationClient_legacyResearchStudyBundleIDs__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 copy];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (NSString)legacyResearchStudyEntitlement
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__2;
  objc_super v10 = __Block_byref_object_dispose__2;
  uint64_t v11 = 0;
  v2 = (void *)-[SRAuthorizationClient syncProxy]((uint64_t)self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__SRAuthorizationClient_legacyResearchStudyEntitlement__block_invoke;
  v5[3] = &unk_26452EDE0;
  v5[4] = &v6;
  [v2 legacyResearchStudyEntitlement:v5];
  BOOL v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __55__SRAuthorizationClient_legacyResearchStudyEntitlement__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 copy];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)addListener:(id)a3
{
}

- (void)addListener:(id)a3 forBundleId:(id)a4
{
  if (self) {
    listeners = self->_listeners;
  }
  else {
    listeners = 0;
  }
  objc_sync_enter(listeners);
  id v8 = [(NSMapTable *)self->_listeners objectForKey:a3];
  uint64_t v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "bundleIdentifier");
  uint64_t v10 = v9;
  if (a4) {
    id v11 = a4;
  }
  else {
    id v11 = (id)v9;
  }
  [(NSMapTable *)self->_listeners setObject:v11 forKey:a3];
  if ((!v8 || [v8 isEqualToString:v11])
    && ((int v12 = [a4 isEqualToString:v10],
         id v13 = [(NSXPCConnection *)self->_connection remoteObjectProxy],
         !v12)
      ? (id v14 = a4)
      : (id v14 = 0),
        [v13 registerForAuthorizationChangeNotificationsWithEffectiveBundleId:v14],
        [(SRAuthorizationClient *)self initialAuthNeeded]))
  {
    v15 = SRLogAuthorizationClient;
    if (os_log_type_enabled((os_log_t)SRLogAuthorizationClient, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v18 = 0;
      _os_log_impl(&dword_21FCA3000, v15, OS_LOG_TYPE_DEFAULT, "Authorization state has not yet been sent from the daemon.", v18, 2u);
    }
    objc_sync_exit(listeners);
  }
  else
  {
    objc_sync_exit(listeners);
    long long v16 = (void *)-[SRAuthorizationClient authorizedServicesForBundleId:](self, (uint64_t)v11);
    long long v17 = (void *)-[SRAuthorizationClient deniedServicesForBundleId:](self, (uint64_t)v11);
    if ([v16 count] || objc_msgSend(v17, "count"))
    {
      -[SRAuthorizationClient notifyListener:withAuthorizationChangeForBundleIdentifier:](self, a3, (uint64_t)v11);
    }
  }
}

- (uint64_t)authorizedServicesForBundleId:(void *)a1
{
  if (!a1) {
    return 0;
  }
  int v4 = (void *)a1[3];
  objc_sync_enter(v4);
  id v6 = (id)objc_msgSend((id)objc_msgSend(objc_getProperty(a1, v5, 32, 1), "objectForKeyedSubscript:", a2), "copy");
  objc_sync_exit(v4);
  if (v6) {
    return (uint64_t)v6;
  }
  id v8 = (void *)MEMORY[0x263EFFA08];

  return [v8 set];
}

- (uint64_t)deniedServicesForBundleId:(void *)a1
{
  if (!a1) {
    return 0;
  }
  int v4 = (void *)a1[3];
  objc_sync_enter(v4);
  id v6 = (id)objc_msgSend((id)objc_msgSend(objc_getProperty(a1, v5, 40, 1), "objectForKeyedSubscript:", a2), "copy");
  objc_sync_exit(v4);
  if (v6) {
    return (uint64_t)v6;
  }
  id v8 = (void *)MEMORY[0x263EFFA08];

  return [v8 set];
}

- (void)notifyListener:(uint64_t)a3 withAuthorizationChangeForBundleIdentifier:
{
  if (result)
  {
    SEL v5 = result;
    uint64_t v6 = -[SRAuthorizationClient authorizedServicesForBundleId:](result, a3);
    uint64_t v7 = -[SRAuthorizationClient deniedServicesForBundleId:](v5, a3);
    uint64_t v8 = [v5 dataCollectionEnabled];
    uint64_t v9 = [v5 firstRunOnboardingCompleted];
    uint64_t v10 = -[SRAuthorizationClient lastModifiedTimesForBundleId:](v5, a3);
    return (void *)[a2 authorizedServicesDidChange:v6 deniedServices:v7 dataCollectionEnabled:v8 onboardingCompleted:v9 lastModifiedTimes:v10 forBundleIdentifier:a3];
  }
  return result;
}

- (void)removeListener:(id)a3
{
  if (self)
  {
    listeners = self->_listeners;
    objc_sync_enter(listeners);
    uint64_t v6 = self->_listeners;
  }
  else
  {
    objc_sync_enter(0);
    listeners = 0;
    uint64_t v6 = 0;
  }
  [(NSMapTable *)v6 removeObjectForKey:a3];

  objc_sync_exit(listeners);
}

- (void)lastModifiedTimesForBundleId:(void *)result
{
  if (result)
  {
    BOOL v3 = result;
    int v4 = (void *)result[3];
    objc_sync_enter(v4);
    id v6 = (id)objc_msgSend((id)objc_msgSend(objc_getProperty(v3, v5, 48, 1), "objectForKeyedSubscript:", a2), "copy");
    objc_sync_exit(v4);
    if (v6) {
      return v6;
    }
    else {
      return (void *)MEMORY[0x263EFFA78];
    }
  }
  return result;
}

- (void)initialAuthorizationStateForBundleId:(id)a3 authorizationState:(id)a4
{
  -[SRAuthorizationClient updateInitialAuthorizationStateIfNeeded](self);
  uint64_t v7 = -[SRAuthorizationClient authorizedServicesForBundleId:](self, (uint64_t)a3);
  uint64_t v8 = -[SRAuthorizationClient deniedServicesForBundleId:](self, (uint64_t)a3);
  BOOL v9 = [(SRAuthorizationClient *)self dataCollectionEnabled];
  BOOL v10 = [(SRAuthorizationClient *)self firstRunOnboardingCompleted];
  id v11 = -[SRAuthorizationClient lastModifiedTimesForBundleId:](self, (uint64_t)a3);
  int v12 = (void (*)(id, uint64_t, uint64_t, BOOL, BOOL, void *))*((void *)a4 + 2);

  v12(a4, v7, v8, v9, v10, v11);
}

- (void)authorizedServicesDidChange:(id)a3 deniedServices:(id)a4 prerequisites:(int64_t)a5 lastModifiedTimes:(id)a6 bundleIdentifier:(id)a7
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v13 = SRLogAuthorizationClient;
  if (os_log_type_enabled((os_log_t)SRLogAuthorizationClient, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544387;
    id v38 = a7;
    __int16 v39 = 2050;
    int64_t v40 = a5;
    __int16 v41 = 2114;
    id v42 = a3;
    __int16 v43 = 2114;
    id v44 = a4;
    __int16 v45 = 2113;
    id v46 = a6;
    _os_log_impl(&dword_21FCA3000, v13, OS_LOG_TYPE_DEFAULT, "Daemon authorization update for bundle: %{public}@, prerequisites: %{public}ld, authorized: %{public}@, denied: %{public}@, last modified times: %{private}@", buf, 0x34u);
  }
  if (self)
  {
    listeners = self->_listeners;
    objc_sync_enter(listeners);
    id Property = objc_getProperty(self, v15, 32, 1);
  }
  else
  {
    objc_sync_enter(0);
    listeners = 0;
    id Property = 0;
  }
  if (objc_msgSend((id)objc_msgSend(Property, "objectForKeyedSubscript:", a7), "isEqual:", a3)
    && (!self ? (id v18 = 0) : (id v18 = objc_getProperty(self, v17, 40, 1)),
        objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", a7), "isEqualToSet:", a4)))
  {
    if (self)
    {
      if (objc_getProperty(self, v17, 56, 1)
        && objc_msgSend(objc_getProperty(self, v17, 56, 1), "integerValue") == a5)
      {
        long long v19 = SRLogAuthorizationClient;
        if (os_log_type_enabled((os_log_t)SRLogAuthorizationClient, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21FCA3000, v19, OS_LOG_TYPE_DEFAULT, "Ignoring duplicate daemon authorization update", buf, 2u);
        }
        objc_sync_exit(listeners);
        return;
      }
      goto LABEL_16;
    }
  }
  else if (self)
  {
LABEL_16:
    id v20 = objc_getProperty(self, v17, 32, 1);
    goto LABEL_17;
  }
  id v20 = 0;
LABEL_17:
  [v20 setObject:a3 forKeyedSubscript:a7];
  if (self) {
    id v22 = objc_getProperty(self, v21, 40, 1);
  }
  else {
    id v22 = 0;
  }
  [v22 setObject:a4 forKeyedSubscript:a7];
  long long v23 = (void *)[NSNumber numberWithInteger:a5];
  if (self)
  {
    objc_setProperty_atomic(self, v24, v23, 56);
    id v26 = objc_getProperty(self, v25, 48, 1);
  }
  else
  {
    id v26 = 0;
  }
  [v26 setObject:a6 forKeyedSubscript:a7];
  objc_sync_exit(listeners);
  [(SRAuthorizationClient *)self setInitialAuthNeeded:0];
  if (self)
  {
    uint64_t v27 = self->_listeners;
    objc_sync_enter(v27);
    v28 = (void *)[(NSMapTable *)self->_listeners copy];
    objc_sync_exit(v27);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v33 objects:buf count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v34 != v30) {
            objc_enumerationMutation(v28);
          }
          uint64_t v32 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v28, "objectForKey:", v32), "isEqual:", a7)) {
            -[SRAuthorizationClient notifyListener:withAuthorizationChangeForBundleIdentifier:](self, v32, (uint64_t)a7);
          }
        }
        uint64_t v29 = [v28 countByEnumeratingWithState:&v33 objects:buf count:16];
      }
      while (v29);
    }
  }
}

- (BOOL)initialAuthNeeded
{
  return self->_initialAuthNeeded;
}

- (void)setInitialAuthNeeded:(BOOL)a3
{
  self->_initialAuthNeeded = a3;
}

@end