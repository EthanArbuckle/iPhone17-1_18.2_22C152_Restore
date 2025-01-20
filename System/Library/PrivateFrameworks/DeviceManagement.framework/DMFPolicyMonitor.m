@interface DMFPolicyMonitor
+ (BOOL)hasFirstUnlocked;
+ (const)mobileKeyBagFirstUnlockNotificationName;
+ (id)policyMonitor;
+ (id)remoteInterface;
- (DMFPolicyMonitor)init;
- (DMFPolicyMonitor)initWithXPCConnection:(id)a3;
- (NSMutableArray)pendingRequests;
- (NSMutableDictionary)notificationTokensByPolicyMonitorIdentifier;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)firstUnlockQueue;
- (OS_dispatch_queue)registrationCallbackQueue;
- (id)requestCommunicationPoliciesForBundleIdentifiers:(id)a3 withError:(id *)a4;
- (id)requestPoliciesForBundleIdentifiers:(id)a3 withError:(id *)a4;
- (id)requestPoliciesForTypes:(id)a3 withError:(id *)a4;
- (int)firstUnlockToken;
- (void)_dispatchRequest:(id)a3;
- (void)addRegistration:(id)a3 forPolicyMonitorIdentifier:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)invalidatePolicyMonitor:(id)a3;
- (void)requestCommunicationPoliciesForBundleIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)requestPoliciesForBundleIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)requestPoliciesForCategoryIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)requestPoliciesForTypes:(id)a3 completionHandler:(id)a4;
- (void)requestPoliciesForWebsiteURLs:(id)a3 completionHandler:(id)a4;
@end

@implementation DMFPolicyMonitor

uint64_t __81__DMFPolicyMonitor_addRegistration_forPolicyMonitorIdentifier_completionHandler___block_invoke_117(uint64_t a1)
{
  return [*(id *)(a1 + 32) addRegistration:*(void *)(a1 + 40) replyHandler:*(void *)(a1 + 48)];
}

uint64_t __33__DMFPolicyMonitor_policyMonitor__block_invoke()
{
  policyMonitor_policyMonitor = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (DMFPolicyMonitor)init
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.dmd.policy" options:4096];
  v4 = [(DMFPolicyMonitor *)self initWithXPCConnection:v3];

  return v4;
}

void __35__DMFPolicyMonitor_remoteInterface__block_invoke()
{
  v13[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F18B5878];
  v1 = (void *)remoteInterface_remoteInterface_0;
  remoteInterface_remoteInterface_0 = v0;

  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v13[2] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  v4 = [v2 setWithArray:v3];

  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v7 = [v5 setWithArray:v6];

  v8 = (void *)MEMORY[0x1E4F1CAD0];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v11[2] = objc_opt_class();
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
  v10 = [v8 setWithArray:v9];

  [(id)remoteInterface_remoteInterface_0 setClasses:v4 forSelector:sel_addRegistration_replyHandler_ argumentIndex:0 ofReply:1];
  [(id)remoteInterface_remoteInterface_0 setClasses:v4 forSelector:sel_requestPoliciesForTypes_replyHandler_ argumentIndex:0 ofReply:1];
  [(id)remoteInterface_remoteInterface_0 setClasses:v7 forSelector:sel_requestPoliciesForWebsiteURLs_replyHandler_ argumentIndex:0 ofReply:0];
  [(id)remoteInterface_remoteInterface_0 setClasses:v10 forSelector:sel_requestPoliciesForWebsiteURLs_replyHandler_ argumentIndex:0 ofReply:1];
}

+ (id)policyMonitor
{
  if (policyMonitor_onceToken != -1) {
    dispatch_once(&policyMonitor_onceToken, &__block_literal_global_17);
  }
  v2 = (void *)policyMonitor_policyMonitor;
  return v2;
}

- (void)requestPoliciesForTypes:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(DMFPolicyMonitor *)self xpcConnection];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __62__DMFPolicyMonitor_requestPoliciesForTypes_completionHandler___block_invoke;
  v25[3] = &unk_1E6372C60;
  id v9 = v6;
  id v26 = v9;
  id v10 = v7;
  id v27 = v10;
  v11 = [v8 remoteObjectProxyWithErrorHandler:v25];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __62__DMFPolicyMonitor_requestPoliciesForTypes_completionHandler___block_invoke_118;
  v22[3] = &unk_1E6372D00;
  v22[4] = self;
  id v12 = v9;
  id v23 = v12;
  id v24 = v10;
  id v13 = v10;
  v14 = (void *)MEMORY[0x1C188B2F0](v22);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __62__DMFPolicyMonitor_requestPoliciesForTypes_completionHandler___block_invoke_122;
  v18[3] = &unk_1E6372CD8;
  id v19 = v11;
  id v20 = v12;
  id v21 = v14;
  id v15 = v14;
  id v16 = v12;
  id v17 = v11;
  [(DMFPolicyMonitor *)self _dispatchRequest:v18];
}

- (DMFPolicyMonitor)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)DMFPolicyMonitor;
  id v6 = [(DMFPolicyMonitor *)&v28 init];
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    notificationTokensByPolicyMonitorIdentifier = v6->_notificationTokensByPolicyMonitorIdentifier;
    v6->_notificationTokensByPolicyMonitorIdentifier = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    pendingRequests = v6->_pendingRequests;
    v6->_pendingRequests = (NSMutableArray *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.dmf.policy.first-unlock", v12);
    firstUnlockQueue = v6->_firstUnlockQueue;
    v6->_firstUnlockQueue = (OS_dispatch_queue *)v13;

    id v15 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.dmf.policy.registration-callback", v16);
    registrationCallbackQueue = v6->_registrationCallbackQueue;
    v6->_registrationCallbackQueue = (OS_dispatch_queue *)v17;

    id v19 = +[DMFPolicyMonitor mobileKeyBagFirstUnlockNotificationName];
    if (!+[DMFPolicyMonitor hasFirstUnlocked] && v19)
    {
      int out_token = 0;
      id v20 = v6->_firstUnlockQueue;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __42__DMFPolicyMonitor_initWithXPCConnection___block_invoke;
      v25[3] = &unk_1E6372C38;
      id v21 = v6;
      id v26 = v21;
      if (notify_register_dispatch(v19, &out_token, v20, v25))
      {
        v22 = DMFPolicyLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
          -[DMFPolicyMonitor initWithXPCConnection:](v22);
        }
      }
      else
      {
        v21->_firstUnlockToken = out_token;
      }
    }
    objc_storeStrong((id *)&v6->_xpcConnection, a3);
    id v23 = [(id)objc_opt_class() remoteInterface];
    [(NSXPCConnection *)v6->_xpcConnection setRemoteObjectInterface:v23];

    [(NSXPCConnection *)v6->_xpcConnection resume];
  }

  return v6;
}

void __37__DMFPolicyMonitor__dispatchRequest___block_invoke(uint64_t a1)
{
  if (+[DMFPolicyMonitor hasFirstUnlocked])
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) pendingRequests];
    v3 = (void *)MEMORY[0x1C188B2F0](*(void *)(a1 + 40));
    [v4 addObject:v3];
  }
}

+ (BOOL)hasFirstUnlocked
{
  return MKBUserUnlockedSinceBoot() != 0;
}

+ (id)remoteInterface
{
  if (remoteInterface_onceToken_0 != -1) {
    dispatch_once(&remoteInterface_onceToken_0, &__block_literal_global_51);
  }
  v2 = (void *)remoteInterface_remoteInterface_0;
  return v2;
}

+ (const)mobileKeyBagFirstUnlockNotificationName
{
  return "com.apple.mobile.keybagd.first_unlock";
}

void __62__DMFPolicyMonitor_requestPoliciesForTypes_completionHandler___block_invoke_118(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = DMFPolicyLog();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v5 allKeys];
      id v10 = [v9 componentsJoinedByString:@","];
      int v14 = 138543362;
      id v15 = v10;
      _os_log_impl(&dword_1BE0E2000, v8, OS_LOG_TYPE_DEFAULT, "Successfully requested policy for types %{public}@", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v11 = *(void *)(a1 + 48);
    if (v11)
    {
      id v12 = *(void (**)(void))(v11 + 16);
LABEL_10:
      v12();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __62__DMFPolicyMonitor_requestPoliciesForTypes_completionHandler___block_invoke_118_cold_1();
    }

    uint64_t v13 = *(void *)(a1 + 48);
    if (v13)
    {
      id v12 = *(void (**)(void))(v13 + 16);
      goto LABEL_10;
    }
  }
}

- (NSMutableDictionary)notificationTokensByPolicyMonitorIdentifier
{
  return self->_notificationTokensByPolicyMonitorIdentifier;
}

- (OS_dispatch_queue)registrationCallbackQueue
{
  return self->_registrationCallbackQueue;
}

- (void)addRegistration:(id)a3 forPolicyMonitorIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 identifier];
  id v12 = [(DMFPolicyMonitor *)self xpcConnection];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __81__DMFPolicyMonitor_addRegistration_forPolicyMonitorIdentifier_completionHandler___block_invoke;
  v33[3] = &unk_1E6372C60;
  id v13 = v11;
  id v34 = v13;
  id v14 = v10;
  id v35 = v14;
  id v15 = [v12 remoteObjectProxyWithErrorHandler:v33];

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __81__DMFPolicyMonitor_addRegistration_forPolicyMonitorIdentifier_completionHandler___block_invoke_114;
  v28[3] = &unk_1E6372CB0;
  v28[4] = self;
  id v29 = v13;
  id v32 = v14;
  id v16 = v8;
  id v30 = v16;
  id v31 = v9;
  id v17 = v9;
  id v18 = v14;
  id v19 = v13;
  id v20 = (void *)MEMORY[0x1C188B2F0](v28);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __81__DMFPolicyMonitor_addRegistration_forPolicyMonitorIdentifier_completionHandler___block_invoke_117;
  v24[3] = &unk_1E6372CD8;
  id v25 = v15;
  id v26 = v16;
  id v27 = v20;
  id v21 = v20;
  id v22 = v16;
  id v23 = v15;
  [(DMFPolicyMonitor *)self _dispatchRequest:v24];
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)_dispatchRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(DMFPolicyMonitor *)self firstUnlockQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__DMFPolicyMonitor__dispatchRequest___block_invoke;
  v7[3] = &unk_1E6372460;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (OS_dispatch_queue)firstUnlockQueue
{
  return self->_firstUnlockQueue;
}

uint64_t __62__DMFPolicyMonitor_requestPoliciesForTypes_completionHandler___block_invoke_122(uint64_t a1)
{
  return [*(id *)(a1 + 32) requestPoliciesForTypes:*(void *)(a1 + 40) replyHandler:*(void *)(a1 + 48)];
}

void __42__DMFPolicyMonitor_initWithXPCConnection___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) pendingRequests];
  uint64_t v3 = [v2 count];

  id v4 = DMFPolicyLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE0E2000, v4, OS_LOG_TYPE_DEFAULT, "Policy monitor detected first-unlock with pending requests", buf, 2u);
    }

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = objc_msgSend(*(id *)(a1 + 32), "pendingRequests", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10++) + 16))();
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v8);
    }

    id v4 = [*(id *)(a1 + 32) pendingRequests];
    [v4 removeAllObjects];
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE0E2000, v4, OS_LOG_TYPE_DEFAULT, "Policy monitor dectected first-unlock without pending requests", buf, 2u);
  }
}

- (void)dealloc
{
  if (notify_is_valid_token(self->_firstUnlockToken)) {
    notify_cancel(self->_firstUnlockToken);
  }
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)DMFPolicyMonitor;
  [(DMFPolicyMonitor *)&v3 dealloc];
}

void __81__DMFPolicyMonitor_addRegistration_forPolicyMonitorIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DMFPolicyLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __81__DMFPolicyMonitor_addRegistration_forPolicyMonitorIdentifier_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __81__DMFPolicyMonitor_addRegistration_forPolicyMonitorIdentifier_completionHandler___block_invoke_114(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    int out_token = 0;
    uint64_t v7 = (const char *)[*(id *)(a1 + 40) UTF8String];
    uint64_t v8 = [*(id *)(a1 + 32) registrationCallbackQueue];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __81__DMFPolicyMonitor_addRegistration_forPolicyMonitorIdentifier_completionHandler___block_invoke_115;
    handler[3] = &unk_1E6372C88;
    id v21 = *(id *)(a1 + 40);
    id v22 = *(id *)(a1 + 48);
    LODWORD(v7) = notify_register_dispatch(v7, &out_token, v8, handler);

    if (v7)
    {
      uint64_t v9 = DMFPolicyLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __81__DMFPolicyMonitor_addRegistration_forPolicyMonitorIdentifier_completionHandler___block_invoke_114_cold_2();
      }

      uint64_t v10 = *(void *)(a1 + 64);
      if (v10)
      {
        long long v11 = DMFErrorWithCodeAndUserInfo(3904, 0);
        (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);
      }
    }
    else
    {
      long long v14 = [*(id *)(a1 + 32) notificationTokensByPolicyMonitorIdentifier];
      objc_sync_enter(v14);
      id v15 = [NSNumber numberWithInt:out_token];
      id v16 = [*(id *)(a1 + 32) notificationTokensByPolicyMonitorIdentifier];
      [v16 setObject:v15 forKeyedSubscript:*(void *)(a1 + 56)];

      objc_sync_exit(v14);
      uint64_t v17 = DMFPolicyLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        uint64_t v25 = v18;
        _os_log_impl(&dword_1BE0E2000, v17, OS_LOG_TYPE_DEFAULT, "Successfully added registration with identifier %{public}@", buf, 0xCu);
      }

      uint64_t v19 = *(void *)(a1 + 64);
      if (v19) {
        (*(void (**)(uint64_t, id, void))(v19 + 16))(v19, v5, 0);
      }
    }
  }
  else
  {
    long long v12 = DMFPolicyLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __81__DMFPolicyMonitor_addRegistration_forPolicyMonitorIdentifier_completionHandler___block_invoke_114_cold_1();
    }

    uint64_t v13 = *(void *)(a1 + 64);
    if (v13) {
      (*(void (**)(uint64_t, void, id))(v13 + 16))(v13, 0, v6);
    }
  }
}

void __81__DMFPolicyMonitor_addRegistration_forPolicyMonitorIdentifier_completionHandler___block_invoke_115(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = DMFPolicyLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1BE0E2000, v2, OS_LOG_TYPE_DEFAULT, "Received policy changed notification for registration %{public}@", (uint8_t *)&v6, 0xCu);
  }

  id v4 = [*(id *)(a1 + 40) callback];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 40) callback];
    v5[2]();
  }
}

- (void)invalidatePolicyMonitor:(id)a3
{
  id v7 = a3;
  id v4 = [(DMFPolicyMonitor *)self notificationTokensByPolicyMonitorIdentifier];
  objc_sync_enter(v4);
  id v5 = [v4 objectForKeyedSubscript:v7];
  int v6 = v5;
  if (v5)
  {
    notify_cancel([v5 intValue]);
    [v4 removeObjectForKey:v7];
  }

  objc_sync_exit(v4);
}

void __62__DMFPolicyMonitor_requestPoliciesForTypes_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DMFPolicyLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__DMFPolicyMonitor_requestPoliciesForTypes_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (id)requestPoliciesForTypes:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v34 = 0;
  v35[0] = &v34;
  v35[1] = 0x3032000000;
  v35[2] = __Block_byref_object_copy__1;
  v35[3] = __Block_byref_object_dispose__1;
  id v36 = 0;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy__1;
  id v32 = __Block_byref_object_dispose__1;
  id v33 = 0;
  if (+[DMFPolicyMonitor hasFirstUnlocked])
  {
    id v7 = [(DMFPolicyMonitor *)self xpcConnection];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __54__DMFPolicyMonitor_requestPoliciesForTypes_withError___block_invoke;
    v25[3] = &unk_1E6372D28;
    uint64_t v8 = v6;
    uint64_t v26 = v8;
    id v27 = &v34;
    uint64_t v9 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v25];

    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __54__DMFPolicyMonitor_requestPoliciesForTypes_withError___block_invoke_123;
    id v20 = &unk_1E6372D50;
    id v21 = self;
    uint64_t v10 = v8;
    id v22 = v10;
    id v23 = &v34;
    id v24 = &v28;
    long long v11 = (void *)MEMORY[0x1C188B2F0](&v17);
    objc_msgSend(v9, "requestPoliciesForTypes:replyHandler:", v10, v11, v17, v18, v19, v20, v21);

    long long v12 = v26;
  }
  else
  {
    uint64_t v13 = DMFErrorWithCodeAndUserInfo(3950, 0);
    long long v14 = *(void **)(v35[0] + 40);
    *(void *)(v35[0] + 40) = v13;

    long long v12 = DMFPolicyLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[DMFPolicyMonitor requestPoliciesForTypes:withError:]((uint64_t)v6, (uint64_t)v35, v12);
    }
  }

  if (a4) {
    *a4 = *(id *)(v35[0] + 40);
  }
  id v15 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v15;
}

void __54__DMFPolicyMonitor_requestPoliciesForTypes_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DMFPolicyLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__DMFPolicyMonitor_requestPoliciesForTypes_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __54__DMFPolicyMonitor_requestPoliciesForTypes_withError___block_invoke_123(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = DMFPolicyLog();
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v5 allKeys];
      uint64_t v10 = [v9 componentsJoinedByString:@","];
      int v15 = 138543362;
      id v16 = v10;
      _os_log_impl(&dword_1BE0E2000, v8, OS_LOG_TYPE_DEFAULT, "Successfully requested policy for types %{public}@", (uint8_t *)&v15, 0xCu);
    }
    long long v11 = (void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    long long v12 = v5;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __62__DMFPolicyMonitor_requestPoliciesForTypes_completionHandler___block_invoke_118_cold_1();
    }

    long long v11 = (void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    long long v12 = v6;
  }
  id v13 = v12;
  long long v14 = *v11;
  void *v11 = v13;
}

- (void)requestPoliciesForBundleIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(DMFPolicyMonitor *)self xpcConnection];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __74__DMFPolicyMonitor_requestPoliciesForBundleIdentifiers_completionHandler___block_invoke;
  v25[3] = &unk_1E6372C60;
  id v9 = v6;
  id v26 = v9;
  id v10 = v7;
  id v27 = v10;
  long long v11 = [v8 remoteObjectProxyWithErrorHandler:v25];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __74__DMFPolicyMonitor_requestPoliciesForBundleIdentifiers_completionHandler___block_invoke_124;
  v22[3] = &unk_1E6372D00;
  v22[4] = self;
  id v12 = v9;
  id v23 = v12;
  id v24 = v10;
  id v13 = v10;
  long long v14 = (void *)MEMORY[0x1C188B2F0](v22);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __74__DMFPolicyMonitor_requestPoliciesForBundleIdentifiers_completionHandler___block_invoke_125;
  v18[3] = &unk_1E6372CD8;
  id v19 = v11;
  id v20 = v12;
  id v21 = v14;
  id v15 = v14;
  id v16 = v12;
  id v17 = v11;
  [(DMFPolicyMonitor *)self _dispatchRequest:v18];
}

void __74__DMFPolicyMonitor_requestPoliciesForBundleIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DMFPolicyLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __74__DMFPolicyMonitor_requestPoliciesForBundleIdentifiers_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __74__DMFPolicyMonitor_requestPoliciesForBundleIdentifiers_completionHandler___block_invoke_124(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = DMFPolicyLog();
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [*(id *)(a1 + 40) count];
      int v13 = 134217984;
      uint64_t v14 = v9;
      _os_log_impl(&dword_1BE0E2000, v8, OS_LOG_TYPE_DEFAULT, "Successfully requested policies for %lu bundleIdentifiers", (uint8_t *)&v13, 0xCu);
    }

    uint64_t v10 = *(void *)(a1 + 48);
    if (v10)
    {
      long long v11 = *(void (**)(void))(v10 + 16);
LABEL_10:
      v11();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __74__DMFPolicyMonitor_requestPoliciesForBundleIdentifiers_completionHandler___block_invoke_124_cold_1();
    }

    uint64_t v12 = *(void *)(a1 + 48);
    if (v12)
    {
      long long v11 = *(void (**)(void))(v12 + 16);
      goto LABEL_10;
    }
  }
}

uint64_t __74__DMFPolicyMonitor_requestPoliciesForBundleIdentifiers_completionHandler___block_invoke_125(uint64_t a1)
{
  return [*(id *)(a1 + 32) requestPoliciesForBundleIdentifiers:*(void *)(a1 + 40) replyHandler:*(void *)(a1 + 48)];
}

- (id)requestPoliciesForBundleIdentifiers:(id)a3 withError:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = __Block_byref_object_copy__1;
  uint64_t v34 = __Block_byref_object_dispose__1;
  id v35 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__1;
  uint64_t v28 = __Block_byref_object_dispose__1;
  id v29 = 0;
  if (+[DMFPolicyMonitor hasFirstUnlocked])
  {
    id v7 = [(DMFPolicyMonitor *)self xpcConnection];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __66__DMFPolicyMonitor_requestPoliciesForBundleIdentifiers_withError___block_invoke;
    v21[3] = &unk_1E6372D28;
    uint64_t v8 = v6;
    id v22 = v8;
    id v23 = &v30;
    uint64_t v9 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v21];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __66__DMFPolicyMonitor_requestPoliciesForBundleIdentifiers_withError___block_invoke_126;
    v17[3] = &unk_1E6372D78;
    uint64_t v10 = v8;
    uint64_t v18 = v10;
    id v19 = &v30;
    id v20 = &v24;
    long long v11 = (void *)MEMORY[0x1C188B2F0](v17);
    [v9 requestPoliciesForBundleIdentifiers:v10 replyHandler:v11];

    uint64_t v12 = v22;
  }
  else
  {
    uint64_t v13 = DMFErrorWithCodeAndUserInfo(3950, 0);
    uint64_t v14 = (void *)v31[5];
    v31[5] = v13;

    uint64_t v12 = DMFPolicyLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      [v6 count];
      -[DMFPolicyMonitor requestPoliciesForBundleIdentifiers:withError:]();
    }
  }

  if (a4) {
    *a4 = (id) v31[5];
  }
  id v15 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v15;
}

void __66__DMFPolicyMonitor_requestPoliciesForBundleIdentifiers_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DMFPolicyLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __74__DMFPolicyMonitor_requestPoliciesForBundleIdentifiers_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __66__DMFPolicyMonitor_requestPoliciesForBundleIdentifiers_withError___block_invoke_126(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = DMFPolicyLog();
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [*(id *)(a1 + 32) count];
      int v14 = 134217984;
      uint64_t v15 = v9;
      _os_log_impl(&dword_1BE0E2000, v8, OS_LOG_TYPE_DEFAULT, "Successfully requested policies for %lu bundleIdentifiers", (uint8_t *)&v14, 0xCu);
    }

    uint64_t v10 = (void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    long long v11 = v5;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __74__DMFPolicyMonitor_requestPoliciesForBundleIdentifiers_completionHandler___block_invoke_cold_1();
    }

    uint64_t v10 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    long long v11 = v6;
  }
  id v12 = v11;
  uint64_t v13 = *v10;
  NSObject *v10 = v12;
}

- (void)requestCommunicationPoliciesForBundleIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(DMFPolicyMonitor *)self xpcConnection];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __87__DMFPolicyMonitor_requestCommunicationPoliciesForBundleIdentifiers_completionHandler___block_invoke;
  v25[3] = &unk_1E6372C60;
  id v9 = v6;
  id v26 = v9;
  id v10 = v7;
  id v27 = v10;
  long long v11 = [v8 remoteObjectProxyWithErrorHandler:v25];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __87__DMFPolicyMonitor_requestCommunicationPoliciesForBundleIdentifiers_completionHandler___block_invoke_127;
  v22[3] = &unk_1E6372D00;
  v22[4] = self;
  id v12 = v9;
  id v23 = v12;
  id v24 = v10;
  id v13 = v10;
  int v14 = (void *)MEMORY[0x1C188B2F0](v22);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __87__DMFPolicyMonitor_requestCommunicationPoliciesForBundleIdentifiers_completionHandler___block_invoke_128;
  v18[3] = &unk_1E6372CD8;
  id v19 = v11;
  id v20 = v12;
  id v21 = v14;
  id v15 = v14;
  id v16 = v12;
  id v17 = v11;
  [(DMFPolicyMonitor *)self _dispatchRequest:v18];
}

void __87__DMFPolicyMonitor_requestCommunicationPoliciesForBundleIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DMFPolicyLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __87__DMFPolicyMonitor_requestCommunicationPoliciesForBundleIdentifiers_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __87__DMFPolicyMonitor_requestCommunicationPoliciesForBundleIdentifiers_completionHandler___block_invoke_127(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = DMFPolicyLog();
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [*(id *)(a1 + 40) count];
      int v13 = 134217984;
      uint64_t v14 = v9;
      _os_log_impl(&dword_1BE0E2000, v8, OS_LOG_TYPE_DEFAULT, "Successfully requested communication policies for %lu bundleIdentifiers", (uint8_t *)&v13, 0xCu);
    }

    uint64_t v10 = *(void *)(a1 + 48);
    if (v10)
    {
      long long v11 = *(void (**)(void))(v10 + 16);
LABEL_10:
      v11();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __87__DMFPolicyMonitor_requestCommunicationPoliciesForBundleIdentifiers_completionHandler___block_invoke_127_cold_1();
    }

    uint64_t v12 = *(void *)(a1 + 48);
    if (v12)
    {
      long long v11 = *(void (**)(void))(v12 + 16);
      goto LABEL_10;
    }
  }
}

uint64_t __87__DMFPolicyMonitor_requestCommunicationPoliciesForBundleIdentifiers_completionHandler___block_invoke_128(uint64_t a1)
{
  return [*(id *)(a1 + 32) requestCommunicationPoliciesForBundleIdentifiers:*(void *)(a1 + 40) replyHandler:*(void *)(a1 + 48)];
}

- (id)requestCommunicationPoliciesForBundleIdentifiers:(id)a3 withError:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = __Block_byref_object_copy__1;
  uint64_t v34 = __Block_byref_object_dispose__1;
  id v35 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__1;
  uint64_t v28 = __Block_byref_object_dispose__1;
  id v29 = 0;
  if (+[DMFPolicyMonitor hasFirstUnlocked])
  {
    id v7 = [(DMFPolicyMonitor *)self xpcConnection];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __79__DMFPolicyMonitor_requestCommunicationPoliciesForBundleIdentifiers_withError___block_invoke;
    v21[3] = &unk_1E6372D28;
    uint64_t v8 = v6;
    id v22 = v8;
    id v23 = &v30;
    uint64_t v9 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v21];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __79__DMFPolicyMonitor_requestCommunicationPoliciesForBundleIdentifiers_withError___block_invoke_129;
    v17[3] = &unk_1E6372D78;
    uint64_t v10 = v8;
    uint64_t v18 = v10;
    id v19 = &v30;
    id v20 = &v24;
    long long v11 = (void *)MEMORY[0x1C188B2F0](v17);
    [v9 requestCommunicationPoliciesForBundleIdentifiers:v10 replyHandler:v11];

    uint64_t v12 = v22;
  }
  else
  {
    uint64_t v13 = DMFErrorWithCodeAndUserInfo(3950, 0);
    uint64_t v14 = (void *)v31[5];
    v31[5] = v13;

    uint64_t v12 = DMFPolicyLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      [v6 count];
      -[DMFPolicyMonitor requestCommunicationPoliciesForBundleIdentifiers:withError:]();
    }
  }

  if (a4) {
    *a4 = (id) v31[5];
  }
  id v15 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v15;
}

void __79__DMFPolicyMonitor_requestCommunicationPoliciesForBundleIdentifiers_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DMFPolicyLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __87__DMFPolicyMonitor_requestCommunicationPoliciesForBundleIdentifiers_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __79__DMFPolicyMonitor_requestCommunicationPoliciesForBundleIdentifiers_withError___block_invoke_129(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = DMFPolicyLog();
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [*(id *)(a1 + 32) count];
      int v14 = 134217984;
      uint64_t v15 = v9;
      _os_log_impl(&dword_1BE0E2000, v8, OS_LOG_TYPE_DEFAULT, "Successfully requested communication policies for %lu bundleIdentifiers", (uint8_t *)&v14, 0xCu);
    }

    uint64_t v10 = (void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    long long v11 = v5;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __87__DMFPolicyMonitor_requestCommunicationPoliciesForBundleIdentifiers_completionHandler___block_invoke_cold_1();
    }

    uint64_t v10 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    long long v11 = v6;
  }
  id v12 = v11;
  uint64_t v13 = *v10;
  NSObject *v10 = v12;
}

- (void)requestPoliciesForCategoryIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(DMFPolicyMonitor *)self xpcConnection];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __76__DMFPolicyMonitor_requestPoliciesForCategoryIdentifiers_completionHandler___block_invoke;
  v25[3] = &unk_1E6372C60;
  id v9 = v6;
  id v26 = v9;
  id v10 = v7;
  id v27 = v10;
  long long v11 = [v8 remoteObjectProxyWithErrorHandler:v25];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __76__DMFPolicyMonitor_requestPoliciesForCategoryIdentifiers_completionHandler___block_invoke_130;
  v22[3] = &unk_1E6372D00;
  v22[4] = self;
  id v12 = v9;
  id v23 = v12;
  id v24 = v10;
  id v13 = v10;
  int v14 = (void *)MEMORY[0x1C188B2F0](v22);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __76__DMFPolicyMonitor_requestPoliciesForCategoryIdentifiers_completionHandler___block_invoke_131;
  v18[3] = &unk_1E6372CD8;
  id v19 = v11;
  id v20 = v12;
  id v21 = v14;
  id v15 = v14;
  id v16 = v12;
  id v17 = v11;
  [(DMFPolicyMonitor *)self _dispatchRequest:v18];
}

void __76__DMFPolicyMonitor_requestPoliciesForCategoryIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DMFPolicyLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__DMFPolicyMonitor_requestPoliciesForCategoryIdentifiers_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __76__DMFPolicyMonitor_requestPoliciesForCategoryIdentifiers_completionHandler___block_invoke_130(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = DMFPolicyLog();
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [*(id *)(a1 + 40) count];
      int v13 = 134217984;
      uint64_t v14 = v9;
      _os_log_impl(&dword_1BE0E2000, v8, OS_LOG_TYPE_DEFAULT, "Successfully requested policies for %lu categoryIdentifiers", (uint8_t *)&v13, 0xCu);
    }

    uint64_t v10 = *(void *)(a1 + 48);
    if (v10)
    {
      long long v11 = *(void (**)(void))(v10 + 16);
LABEL_10:
      v11();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __76__DMFPolicyMonitor_requestPoliciesForCategoryIdentifiers_completionHandler___block_invoke_130_cold_1();
    }

    uint64_t v12 = *(void *)(a1 + 48);
    if (v12)
    {
      long long v11 = *(void (**)(void))(v12 + 16);
      goto LABEL_10;
    }
  }
}

uint64_t __76__DMFPolicyMonitor_requestPoliciesForCategoryIdentifiers_completionHandler___block_invoke_131(uint64_t a1)
{
  return [*(id *)(a1 + 32) requestPoliciesForCategoryIdentifiers:*(void *)(a1 + 40) replyHandler:*(void *)(a1 + 48)];
}

- (void)requestPoliciesForWebsiteURLs:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(DMFPolicyMonitor *)self xpcConnection];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __68__DMFPolicyMonitor_requestPoliciesForWebsiteURLs_completionHandler___block_invoke;
  v25[3] = &unk_1E6372C60;
  id v9 = v6;
  id v26 = v9;
  id v10 = v7;
  id v27 = v10;
  long long v11 = [v8 remoteObjectProxyWithErrorHandler:v25];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __68__DMFPolicyMonitor_requestPoliciesForWebsiteURLs_completionHandler___block_invoke_132;
  v22[3] = &unk_1E6372D00;
  v22[4] = self;
  id v12 = v9;
  id v23 = v12;
  id v24 = v10;
  id v13 = v10;
  uint64_t v14 = (void *)MEMORY[0x1C188B2F0](v22);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __68__DMFPolicyMonitor_requestPoliciesForWebsiteURLs_completionHandler___block_invoke_133;
  v18[3] = &unk_1E6372CD8;
  id v19 = v11;
  id v20 = v12;
  id v21 = v14;
  id v15 = v14;
  id v16 = v12;
  id v17 = v11;
  [(DMFPolicyMonitor *)self _dispatchRequest:v18];
}

void __68__DMFPolicyMonitor_requestPoliciesForWebsiteURLs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DMFPolicyLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __68__DMFPolicyMonitor_requestPoliciesForWebsiteURLs_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __68__DMFPolicyMonitor_requestPoliciesForWebsiteURLs_completionHandler___block_invoke_132(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = DMFPolicyLog();
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [*(id *)(a1 + 40) count];
      int v13 = 134217984;
      uint64_t v14 = v9;
      _os_log_impl(&dword_1BE0E2000, v8, OS_LOG_TYPE_DEFAULT, "Successfully requested policies for %lu websiteURLs", (uint8_t *)&v13, 0xCu);
    }

    uint64_t v10 = *(void *)(a1 + 48);
    if (v10)
    {
      long long v11 = *(void (**)(void))(v10 + 16);
LABEL_10:
      v11();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __68__DMFPolicyMonitor_requestPoliciesForWebsiteURLs_completionHandler___block_invoke_132_cold_1();
    }

    uint64_t v12 = *(void *)(a1 + 48);
    if (v12)
    {
      long long v11 = *(void (**)(void))(v12 + 16);
      goto LABEL_10;
    }
  }
}

uint64_t __68__DMFPolicyMonitor_requestPoliciesForWebsiteURLs_completionHandler___block_invoke_133(uint64_t a1)
{
  return [*(id *)(a1 + 32) requestPoliciesForWebsiteURLs:*(void *)(a1 + 40) replyHandler:*(void *)(a1 + 48)];
}

- (int)firstUnlockToken
{
  return self->_firstUnlockToken;
}

- (NSMutableArray)pendingRequests
{
  return self->_pendingRequests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_notificationTokensByPolicyMonitorIdentifier, 0);
  objc_storeStrong((id *)&self->_registrationCallbackQueue, 0);
  objc_storeStrong((id *)&self->_firstUnlockQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)initWithXPCConnection:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1BE0E2000, log, OS_LOG_TYPE_FAULT, "Policy monitor failed to register for first-unlock notifications", v1, 2u);
}

void __81__DMFPolicyMonitor_addRegistration_forPolicyMonitorIdentifier_completionHandler___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1BE0E2000, v0, (uint64_t)v0, "Failed to add registration %{public}@ with error: %{public}@", v1);
}

void __81__DMFPolicyMonitor_addRegistration_forPolicyMonitorIdentifier_completionHandler___block_invoke_114_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1BE0E2000, v0, (uint64_t)v0, "Failed to add registration %{public}@ with error: %{public}@", v1);
}

void __81__DMFPolicyMonitor_addRegistration_forPolicyMonitorIdentifier_completionHandler___block_invoke_114_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1BE0E2000, v0, (uint64_t)v0, "Failed to add registration %{public}@ with error: %{public}@", v1);
}

void __62__DMFPolicyMonitor_requestPoliciesForTypes_completionHandler___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1BE0E2000, v0, (uint64_t)v0, "Failed to request policy for types %{public}@ with error: %{public}@", v1);
}

void __62__DMFPolicyMonitor_requestPoliciesForTypes_completionHandler___block_invoke_118_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1BE0E2000, v0, (uint64_t)v0, "Failed to request policy for types %{public}@ with error: %{public}@", v1);
}

- (void)requestPoliciesForTypes:(NSObject *)a3 withError:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)a2 + 40);
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  OUTLINED_FUNCTION_3(&dword_1BE0E2000, a3, (uint64_t)a3, "Failed to request policy for types %{public}@ with error: %{public}@", (uint8_t *)&v4);
}

void __74__DMFPolicyMonitor_requestPoliciesForBundleIdentifiers_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1BE0E2000, v1, v2, "Failed to request policies for %lu bundleIdentifiers with error: %{public}@", v3, v4, v5, v6, v7);
}

void __74__DMFPolicyMonitor_requestPoliciesForBundleIdentifiers_completionHandler___block_invoke_124_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1BE0E2000, v1, v2, "Failed to request policies for %lu bundleIdentifiers with error: %{public}@", v3, v4, v5, v6, v7);
}

- (void)requestPoliciesForBundleIdentifiers:withError:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(3.8521e-34, v0, v1, v2);
  OUTLINED_FUNCTION_3(&dword_1BE0E2000, v5, v3, "Failed to request policies for %lu bundleIdentifierswith error: %{public}@", v4);
}

void __87__DMFPolicyMonitor_requestCommunicationPoliciesForBundleIdentifiers_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1BE0E2000, v1, v2, "Failed to request communication policies for %lu bundleIdentifiers with error: %{public}@", v3, v4, v5, v6, v7);
}

void __87__DMFPolicyMonitor_requestCommunicationPoliciesForBundleIdentifiers_completionHandler___block_invoke_127_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1BE0E2000, v1, v2, "Failed to request communication policies for %lu bundleIdentifiers with error: %{public}@", v3, v4, v5, v6, v7);
}

- (void)requestCommunicationPoliciesForBundleIdentifiers:withError:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(3.8521e-34, v0, v1, v2);
  OUTLINED_FUNCTION_3(&dword_1BE0E2000, v5, v3, "Failed to request communication policies for %lu bundleIdentifierswith error: %{public}@", v4);
}

void __76__DMFPolicyMonitor_requestPoliciesForCategoryIdentifiers_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1BE0E2000, v1, v2, "Failed to request policies for %lu categoryIdentifiers with error: %{public}@", v3, v4, v5, v6, v7);
}

void __76__DMFPolicyMonitor_requestPoliciesForCategoryIdentifiers_completionHandler___block_invoke_130_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1BE0E2000, v1, v2, "Failed to request policies for %lu categoryIdentifiers with error: %{public}@", v3, v4, v5, v6, v7);
}

void __68__DMFPolicyMonitor_requestPoliciesForWebsiteURLs_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1BE0E2000, v1, v2, "Failed to request policies for %lu websiteURLs with error: %{public}@", v3, v4, v5, v6, v7);
}

void __68__DMFPolicyMonitor_requestPoliciesForWebsiteURLs_completionHandler___block_invoke_132_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1BE0E2000, v1, v2, "Failed to request policies for %lu websiteURLs with error: %{public}@", v3, v4, v5, v6, v7);
}

@end