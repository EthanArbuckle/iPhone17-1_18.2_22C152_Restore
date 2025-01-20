@interface ASDUpdatesService
+ (BOOL)areAllAppsAuthorizedForAutomaticUpdates;
+ (BOOL)isAutomaticUpdateAuthorizationEnabled;
+ (BOOL)isAutomaticUpdateAuthorizationRequiredWhenEnabledForAppWithRecord:(id)a3;
+ (id)badgeCount;
+ (id)defaultService;
+ (id)interface;
+ (id)registerBadgeCountNotificationBlock:(id)a3;
- (ASDUpdatesService)init;
- (BOOL)autoUpdateEnabled;
- (BOOL)confirmAgentRequestedUpdateAll;
- (id)_failedJobResultsForBundleIDs:(uint64_t)a1;
- (id)reloadFromServer;
- (void)dealloc;
- (void)getManagedUpdatesWithCompletionBlock:(id)a3;
- (void)getMetricsWithCompletionBlock:(id)a3;
- (void)getUpdateMetricsEventsWithCompletionBlock:(id)a3;
- (void)getUpdatesIncludingMetricsWithCompletionBlock:(id)a3;
- (void)getUpdatesWithCompletionBlock:(id)a3;
- (void)hideApplicationBadgeForPendingUpdates;
- (void)refreshUpdateCountWithCompletionBlock:(id)a3;
- (void)refreshUpdateForApp:(int64_t)a3;
- (void)refreshUpdatesWithCompletionBlock:(id)a3 completionBlock:(id)a4;
- (void)reloadForSettingsFromServerWithCompletionBlock:(id)a3;
- (void)reloadFromServerInBackgroundWithCompletionBlock:(id)a3;
- (void)reloadFromServerWithCompletionBlock:(id)a3;
- (void)reloadManagedUpdatesWithCompletionBlock:(id)a3;
- (void)requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle:(id)a3 completion:(id)a4;
- (void)setAutoUpdateEnabled:(BOOL)a3;
- (void)shouldUseModernUpdatesWithCompletionBlock:(id)a3;
- (void)showApplicationBadgeForPendingUpdates;
- (void)updateAllWithCompletionBlock:(id)a3;
- (void)updateAllWithJobResultsCompletionBlock:(id)a3;
- (void)updateAllWithOrder:(id)a3 completionBlock:(id)a4;
@end

@implementation ASDUpdatesService

- (void)shouldUseModernUpdatesWithCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: shouldUseModernUpdatesWithCompletionBlock", buf, 0xCu);
  }
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__ASDUpdatesService_shouldUseModernUpdatesWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B4280;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(ASDServiceBroker *)serviceBroker getUpdatesServiceWithCompletionHandler:v9];
}

+ (id)interface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC6C2D8];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_getManagedUpdatesWithReplyHandler_ argumentIndex:0 ofReply:1];

  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_getUpdatesWithReplyHandler_ argumentIndex:0 ofReply:1];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  [v2 setClasses:v11 forSelector:sel_reloadFromServerWithReplyHandler_ argumentIndex:0 ofReply:1];

  id v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  [v2 setClasses:v14 forSelector:sel_reloadManagedUpdatesWithReplyHandler_ argumentIndex:0 ofReply:1];

  v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  [v2 setClasses:v17 forSelector:sel_updateAllWithOrder_replyHandler_ argumentIndex:1 ofReply:1];

  v18 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v19 = objc_opt_class();
  v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  [v2 setClasses:v20 forSelector:sel_reloadFromServerInBackgroundWithCompletionBlock_ argumentIndex:0 ofReply:1];

  v21 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v22 = objc_opt_class();
  v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  [v2 setClasses:v23 forSelector:sel_getUpdateMetricsEventsWithReplyHandler_ argumentIndex:0 ofReply:1];

  v24 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v25 = objc_opt_class();
  v26 = objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
  [v2 setClasses:v26 forSelector:sel_getUpdatesIncludingMetricsWithReplyHandler_ argumentIndex:0 ofReply:1];

  v27 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v28 = objc_opt_class();
  v29 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
  [v2 setClasses:v29 forSelector:sel_reloadForSettingsFromServerWithReplyHandler_ argumentIndex:0 ofReply:1];

  v30 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v31 = objc_opt_class();
  v32 = objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
  [v2 setClasses:v32 forSelector:sel_updateAllGettingJobResultsWithReplyHandler_ argumentIndex:1 ofReply:1];

  return v2;
}

+ (id)defaultService
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__ASDUpdatesService_defaultService__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB4D6528 != -1) {
    dispatch_once(&qword_1EB4D6528, block);
  }
  v2 = (void *)_MergedGlobals_39;
  return v2;
}

void __63__ASDUpdatesService_shouldUseModernUpdatesWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __63__ASDUpdatesService_shouldUseModernUpdatesWithCompletionBlock___block_invoke_2;
    v5[3] = &unk_1E58B2F08;
    v5[4] = *(void *)(a1 + 32);
    v3 = [a2 remoteObjectProxyWithErrorHandler:v5];
    [v3 shouldUseModernUpdatesWithReplyHandler:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

+ (BOOL)isAutomaticUpdateAuthorizationEnabled
{
  if (_os_feature_enabled_impl() & 1) != 0 || (ct_green_tea_logging_enabled())
  {
    v2 = (void *)MGGetStringAnswer();
    uint64_t v3 = [v2 caseInsensitiveCompare:@"CH"];

    if (v3)
    {
      uint64_t v4 = ASDLogHandleForCategory(13);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        __int16 v9 = 0;
        v5 = "This region is unsupported";
        id v6 = (uint8_t *)&v9;
LABEL_12:
        _os_log_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_INFO, v5, v6, 2u);
      }
    }
    else
    {
      if (MGGetBoolAnswer()) {
        return 1;
      }
      uint64_t v4 = ASDLogHandleForCategory(13);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        __int16 v8 = 0;
        v5 = "This device does not have cellular data capabilities.";
        id v6 = (uint8_t *)&v8;
        goto LABEL_12;
      }
    }
  }
  else
  {
    uint64_t v4 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      __int16 v10 = 0;
      v5 = "Feature flag not enabled";
      id v6 = (uint8_t *)&v10;
      goto LABEL_12;
    }
  }

  return 0;
}

uint64_t __35__ASDUpdatesService_defaultService__block_invoke(uint64_t a1)
{
  _MergedGlobals_39 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (ASDUpdatesService)init
{
  uint64_t v3 = +[ASDServiceBroker defaultBroker];
  id v4 = v3;
  if (self
    && (v17.receiver = self,
        v17.super_class = (Class)ASDUpdatesService,
        (v5 = [(ASDUpdatesService *)&v17 init]) != 0))
  {
    id v6 = v5;
    objc_storeStrong((id *)&v5->_serviceBroker, v3);

    uint64_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.appstored.ASDUpdatesService.access", v7);
    accessQueue = v6->_accessQueue;
    v6->_accessQueue = (OS_dispatch_queue *)v8;

    __int16 v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.appstored.ASDUpdatesService.callout", v10);
    calloutQueue = v6->_calloutQueue;
    v6->_calloutQueue = (OS_dispatch_queue *)v11;

    objc_initWeak(&v17.receiver, v6);
    v6->_storeChangedNotificationToken = -1;
    uint64_t v13 = dispatch_get_global_queue(21, 0);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __25__ASDUpdatesService_init__block_invoke;
    handler[3] = &unk_1E58B36F8;
    objc_copyWeak(&v16, &v17.receiver);
    notify_register_dispatch("com.apple.appstored.updatesstorechanged", &v6->_storeChangedNotificationToken, v13, handler);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v17.receiver);
  }
  else
  {

    return 0;
  }
  return v6;
}

void __25__ASDUpdatesService_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v1 postNotificationName:@"ASDSoftwareUpdatesStoreDidChangeNotification" object:WeakRetained];
}

- (void)dealloc
{
  int storeChangedNotificationToken = self->_storeChangedNotificationToken;
  if (storeChangedNotificationToken != -1) {
    notify_cancel(storeChangedNotificationToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)ASDUpdatesService;
  [(ASDUpdatesService *)&v4 dealloc];
}

+ (id)registerBadgeCountNotificationBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = dispatch_get_global_queue(21, 0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__ASDUpdatesService_registerBadgeCountNotificationBlock___block_invoke;
    v8[3] = &unk_1E58B41B8;
    id v9 = v4;
    id v10 = a1;
    notify_register_dispatch("com.apple.appstored.updatesstorechanged", &registerBadgeCountNotificationBlock__s_storeChangedNotificationToken, v5, v8);
  }
  else
  {
    notify_cancel(registerBadgeCountNotificationBlock__s_storeChangedNotificationToken);
    registerBadgeCountNotificationBlock__s_int storeChangedNotificationToken = -1;
  }
  id v6 = +[ASDUpdatesService badgeCount]();

  return v6;
}

void __57__ASDUpdatesService_registerBadgeCountNotificationBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  +[ASDUpdatesService badgeCount]();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

+ (id)badgeCount
{
  self;
  v0 = (void *)CFPreferencesCopyAppValue(@"BadgeCount", @"com.apple.appstored");
  uint64_t v1 = v0;
  if (!v0) {
    v0 = &unk_1EEC564F0;
  }
  id v2 = v0;

  return v2;
}

+ (BOOL)isAutomaticUpdateAuthorizationRequiredWhenEnabledForAppWithRecord:(id)a3
{
  uint64_t v3 = [a3 infoDictionary];
  id v4 = [v3 objectForKey:@"NSAppNeedsAutoUpdateConsent" ofClass:objc_opt_class()];
  char v5 = [v4 BOOLValue];

  return v5;
}

+ (BOOL)areAllAppsAuthorizedForAutomaticUpdates
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (_autoUpdatesEnabled())
  {
    if (+[ASDUpdatesService isAutomaticUpdateAuthorizationEnabled])
    {
      id v2 = (void *)CFPreferencesCopyValue(@"AutomaticUpdateAuthorizations", @"com.apple.appstored", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __60__ASDUpdatesService_areAllAppsAuthorizedForAutomaticUpdates__block_invoke;
      v32[3] = &unk_1E58B41E0;
      id v3 = v2;
      id v33 = v3;
      id v4 = (unsigned int (**)(void, void, void))MEMORY[0x19F393180](v32);
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      char v5 = [v3 allKeys];
      id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:7];
      [v6 addObjectsFromArray:&unk_1EEC56598];
      [v6 addObjectsFromArray:v5];
      uint64_t v7 = (void *)[v6 copy];

      uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v35 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v29;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v29 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v28 + 1) + 8 * i);
            uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v12 allowPlaceholder:0 error:0];
            if (v13 && !((unsigned int (**)(void, uint64_t, void *))v4)[2](v4, v12, v13))
            {

              LOBYTE(v21) = 0;
              goto LABEL_27;
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v35 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }

      v14 = ASDLogHandleForCategory(13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_19BF6A000, v14, OS_LOG_TYPE_DEBUG, "Checking all apps", buf, 2u);
      }

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4F223C8], "enumeratorWithOptions:", 0, 0);
      uint64_t v15 = [v7 countByEnumeratingWithState:&v23 objects:v34 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v24;
LABEL_16:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v7);
          }
          uint64_t v19 = *(void **)(*((void *)&v23 + 1) + 8 * v18);
          v20 = [v19 bundleIdentifier];
          unsigned int v21 = ((unsigned int (**)(void, void *, void *))v4)[2](v4, v20, v19);

          if (!v21) {
            break;
          }
          if (v16 == ++v18)
          {
            uint64_t v16 = [v7 countByEnumeratingWithState:&v23 objects:v34 count:16];
            LOBYTE(v21) = 1;
            if (v16) {
              goto LABEL_16;
            }
            break;
          }
        }
      }
      else
      {
        LOBYTE(v21) = 1;
      }
LABEL_27:
    }
    else
    {
      LOBYTE(v21) = 1;
    }
  }
  else
  {
    LOBYTE(v21) = 0;
  }
  return v21;
}

uint64_t __60__ASDUpdatesService_areAllAppsAuthorizedForAutomaticUpdates__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (+[ASDUpdatesService isAutomaticUpdateAuthorizationRequiredWhenEnabledForAppWithRecord:a3])
  {
    id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
    uint64_t v7 = [v6 BOOLValue];
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

- (void)requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v23 = (id)objc_opt_class();
    id v9 = v23;
    _os_log_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle", buf, 0xCu);
  }
  if (+[ASDUpdatesService isAutomaticUpdateAuthorizationEnabled])
  {
    uint64_t v10 = [v6 bundleIdentifier];
    if (_autoUpdatesEnabled()
      && (v11 = (void *)CFPreferencesCopyValue(@"AutomaticUpdateAuthorizations", @"com.apple.appstored", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]), [v11 objectForKeyedSubscript:v10], uint64_t v12 = objc_claimAutoreleasedReturnValue(), v12, v11, !v12))
    {
      accessQueue = self->_accessQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __95__ASDUpdatesService_requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle_completion___block_invoke;
      block[3] = &unk_1E58B4258;
      block[4] = self;
      id v21 = v7;
      id v20 = v6;
      uint64_t v17 = accessQueue;
      dispatch_block_t v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
      dispatch_async(v17, v18);
    }
    else
    {
      uint64_t v13 = ASDLogHandleForCategory(13);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19BF6A000, v13, OS_LOG_TYPE_DEFAULT, "Already asked for authorization or auto-updates are disabled", buf, 2u);
      }

      v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ASDErrorDomain" code:1300 userInfo:0];
      (*((void (**)(id, void *))v7 + 2))(v7, v14);
    }
  }
  else
  {
    uint64_t v15 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19BF6A000, v15, OS_LOG_TYPE_DEFAULT, "Automatic update authorization is disabled.", buf, 2u);
    }

    uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ASDErrorDomain" code:1300 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
  }
}

void __95__ASDUpdatesService_requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __95__ASDUpdatesService_requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle_completion___block_invoke_2;
  v4[3] = &unk_1E58B4230;
  v4[4] = v2;
  id v6 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  [v3 getUpdatesServiceWithCompletionHandler:v4];
}

void __95__ASDUpdatesService_requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle_completion___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __95__ASDUpdatesService_requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle_completion___block_invoke_3;
    v14[3] = &unk_1E58B3040;
    v14[4] = *(void *)(a1 + 32);
    id v15 = *(id *)(a1 + 48);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v14];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __95__ASDUpdatesService_requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle_completion___block_invoke_5;
    v12[3] = &unk_1E58B3040;
    uint64_t v5 = *(void *)(a1 + 40);
    v12[4] = *(void *)(a1 + 32);
    id v13 = *(id *)(a1 + 48);
    [v4 requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle:v5 completion:v12];

    id v6 = v15;
  }
  else
  {
    id v7 = *(void **)(*(void *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__ASDUpdatesService_requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle_completion___block_invoke_7;
    block[3] = &unk_1E58B4208;
    id v11 = *(id *)(a1 + 48);
    uint64_t v8 = v7;
    dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v8, v9);

    id v6 = v11;
  }
}

void __95__ASDUpdatesService_requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 24);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __95__ASDUpdatesService_requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle_completion___block_invoke_4;
  v9[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v5;
  id v6 = v4;
  id v7 = v3;
  dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v9);
  dispatch_async(v6, v8);
}

uint64_t __95__ASDUpdatesService_requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __95__ASDUpdatesService_requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 24);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __95__ASDUpdatesService_requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle_completion___block_invoke_6;
  v9[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v5;
  id v6 = v4;
  id v7 = v3;
  dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v9);
  dispatch_async(v6, v8);
}

uint64_t __95__ASDUpdatesService_requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __95__ASDUpdatesService_requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)autoUpdateEnabled
{
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__7;
  v13[4] = __Block_byref_object_dispose__7;
  id v14 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  serviceBroker = self->_serviceBroker;
  id obj = 0;
  id v3 = [(ASDServiceBroker *)serviceBroker getUpdatesServiceWithError:&obj];
  objc_storeStrong(&v14, obj);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__ASDUpdatesService_autoUpdateEnabled__block_invoke;
  v7[3] = &unk_1E58B3108;
  v7[4] = v13;
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__ASDUpdatesService_autoUpdateEnabled__block_invoke_2;
  v6[3] = &unk_1E58B3628;
  v6[4] = &v9;
  [v4 autoUpdateEnabled:v6];

  LOBYTE(v4) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(v13, 8);

  return (char)v4;
}

void __38__ASDUpdatesService_autoUpdateEnabled__block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __38__ASDUpdatesService_autoUpdateEnabled__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)confirmAgentRequestedUpdateAll
{
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__7;
  v13[4] = __Block_byref_object_dispose__7;
  id v14 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  serviceBroker = self->_serviceBroker;
  id obj = 0;
  id v3 = [(ASDServiceBroker *)serviceBroker getUpdatesServiceWithError:&obj];
  objc_storeStrong(&v14, obj);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__ASDUpdatesService_confirmAgentRequestedUpdateAll__block_invoke;
  v7[3] = &unk_1E58B3108;
  v7[4] = v13;
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__ASDUpdatesService_confirmAgentRequestedUpdateAll__block_invoke_2;
  v6[3] = &unk_1E58B3628;
  v6[4] = &v9;
  [v4 confirmAgentRequestedUpdateAll:v6];

  LOBYTE(v4) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(v13, 8);

  return (char)v4;
}

void __51__ASDUpdatesService_confirmAgentRequestedUpdateAll__block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __51__ASDUpdatesService_confirmAgentRequestedUpdateAll__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)getManagedUpdatesWithCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"nil block"];
  }
  id v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: getManagedUpdatesWithCompletionBlock", buf, 0xCu);
  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__ASDUpdatesService_getManagedUpdatesWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B33D0;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(accessQueue, v9);
}

void __58__ASDUpdatesService_getManagedUpdatesWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__ASDUpdatesService_getManagedUpdatesWithCompletionBlock___block_invoke_2;
  v3[3] = &unk_1E58B4280;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 getUpdatesServiceWithCompletionHandler:v3];
}

void __58__ASDUpdatesService_getManagedUpdatesWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __58__ASDUpdatesService_getManagedUpdatesWithCompletionBlock___block_invoke_3;
    v13[3] = &unk_1E58B3040;
    id v4 = *(void **)(a1 + 40);
    v13[4] = *(void *)(a1 + 32);
    id v14 = v4;
    id v5 = [a2 remoteObjectProxyWithErrorHandler:v13];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__ASDUpdatesService_getManagedUpdatesWithCompletionBlock___block_invoke_5;
    v11[3] = &unk_1E58B2E68;
    id v6 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v12 = v6;
    [v5 getManagedUpdatesWithReplyHandler:v11];

    id v7 = v14;
  }
  else
  {
    id v8 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__ASDUpdatesService_getManagedUpdatesWithCompletionBlock___block_invoke_7;
    block[3] = &unk_1E58B4208;
    id v10 = *(id *)(a1 + 40);
    dispatch_async(v8, block);
    id v7 = v10;
  }
}

void __58__ASDUpdatesService_getManagedUpdatesWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__ASDUpdatesService_getManagedUpdatesWithCompletionBlock___block_invoke_4;
  block[3] = &unk_1E58B4208;
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __58__ASDUpdatesService_getManagedUpdatesWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__ASDUpdatesService_getManagedUpdatesWithCompletionBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__ASDUpdatesService_getManagedUpdatesWithCompletionBlock___block_invoke_6;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __58__ASDUpdatesService_getManagedUpdatesWithCompletionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __58__ASDUpdatesService_getManagedUpdatesWithCompletionBlock___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getUpdatesWithCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"nil block"];
  }
  id v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: getUpdatesWithCompletionBlock", buf, 0xCu);
  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__ASDUpdatesService_getUpdatesWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B33D0;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(accessQueue, v9);
}

void __51__ASDUpdatesService_getUpdatesWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__ASDUpdatesService_getUpdatesWithCompletionBlock___block_invoke_2;
  v3[3] = &unk_1E58B4280;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 getUpdatesServiceWithCompletionHandler:v3];
}

void __51__ASDUpdatesService_getUpdatesWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__ASDUpdatesService_getUpdatesWithCompletionBlock___block_invoke_3;
    v13[3] = &unk_1E58B3040;
    id v4 = *(void **)(a1 + 40);
    v13[4] = *(void *)(a1 + 32);
    id v14 = v4;
    id v5 = [a2 remoteObjectProxyWithErrorHandler:v13];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __51__ASDUpdatesService_getUpdatesWithCompletionBlock___block_invoke_5;
    v11[3] = &unk_1E58B3FC8;
    id v6 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v12 = v6;
    [v5 getUpdatesWithReplyHandler:v11];

    id v7 = v14;
  }
  else
  {
    id v8 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__ASDUpdatesService_getUpdatesWithCompletionBlock___block_invoke_7;
    block[3] = &unk_1E58B4208;
    id v10 = *(id *)(a1 + 40);
    dispatch_async(v8, block);
    id v7 = v10;
  }
}

void __51__ASDUpdatesService_getUpdatesWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__ASDUpdatesService_getUpdatesWithCompletionBlock___block_invoke_4;
  block[3] = &unk_1E58B4208;
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __51__ASDUpdatesService_getUpdatesWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __51__ASDUpdatesService_getUpdatesWithCompletionBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__ASDUpdatesService_getUpdatesWithCompletionBlock___block_invoke_6;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __51__ASDUpdatesService_getUpdatesWithCompletionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __51__ASDUpdatesService_getUpdatesWithCompletionBlock___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)refreshUpdateForApp:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v10 = (id)objc_opt_class();
    __int16 v11 = 2050;
    int64_t v12 = a3;
    id v6 = v10;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: refreshUpdateForApp %{public}lld", buf, 0x16u);
  }
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__ASDUpdatesService_refreshUpdateForApp___block_invoke;
  v8[3] = &unk_1E58B42F8;
  void v8[4] = self;
  v8[5] = a3;
  dispatch_async(accessQueue, v8);
}

uint64_t __41__ASDUpdatesService_refreshUpdateForApp___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 8);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__ASDUpdatesService_refreshUpdateForApp___block_invoke_2;
  v5[3] = &unk_1E58B42D0;
  uint64_t v3 = *(void *)(a1 + 40);
  v5[4] = v1;
  void v5[5] = v3;
  return [v2 getUpdatesServiceWithCompletionHandler:v5];
}

void __41__ASDUpdatesService_refreshUpdateForApp___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __41__ASDUpdatesService_refreshUpdateForApp___block_invoke_3;
    v11[3] = &unk_1E58B42A8;
    uint64_t v6 = *(void *)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    void v11[5] = v6;
    id v7 = [a2 remoteObjectProxyWithErrorHandler:v11];
    -[NSObject refreshUpdateForApp:reply:](v7, "refreshUpdateForApp:reply:", MEMORY[0x1E4F143A8], 3221225472, __41__ASDUpdatesService_refreshUpdateForApp___block_invoke_35, &unk_1E58B42A8, *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  else
  {
    id v7 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = objc_opt_class();
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v13 = v8;
      __int16 v14 = 2050;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      id v17 = v5;
      id v10 = v8;
      _os_log_error_impl(&dword_19BF6A000, v7, OS_LOG_TYPE_ERROR, "[%{public}@]: refreshUpdateForApp %{public}lld failed with error: %{public}@", buf, 0x20u);
    }
  }
}

void __41__ASDUpdatesService_refreshUpdateForApp___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = objc_opt_class();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543874;
    uint64_t v9 = v5;
    __int16 v10 = 2050;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    id v13 = v3;
    id v7 = v5;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: refreshUpdateForApp %{public}lld failed with error: %{public}@", (uint8_t *)&v8, 0x20u);
  }
}

void __41__ASDUpdatesService_refreshUpdateForApp___block_invoke_35(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = objc_opt_class();
      uint64_t v6 = *(void *)(a1 + 40);
      int v8 = 138543874;
      uint64_t v9 = v5;
      __int16 v10 = 2050;
      uint64_t v11 = v6;
      __int16 v12 = 2114;
      id v13 = v3;
      id v7 = v5;
      _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: refreshUpdateForApp %{public}lld failed with error: %{public}@", (uint8_t *)&v8, 0x20u);
    }
  }
}

- (void)refreshUpdateCountWithCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"nil block"];
  }
  id v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: refreshUpdateCountWithCompletionBlock", buf, 0xCu);
  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__ASDUpdatesService_refreshUpdateCountWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B33D0;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(accessQueue, v9);
}

void __59__ASDUpdatesService_refreshUpdateCountWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__ASDUpdatesService_refreshUpdateCountWithCompletionBlock___block_invoke_2;
  v3[3] = &unk_1E58B4280;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 getUpdatesServiceWithCompletionHandler:v3];
}

void __59__ASDUpdatesService_refreshUpdateCountWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __59__ASDUpdatesService_refreshUpdateCountWithCompletionBlock___block_invoke_3;
    v16[3] = &unk_1E58B3040;
    id v6 = *(void **)(a1 + 40);
    v16[4] = *(void *)(a1 + 32);
    id v17 = v6;
    id v7 = [a2 remoteObjectProxyWithErrorHandler:v16];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __59__ASDUpdatesService_refreshUpdateCountWithCompletionBlock___block_invoke_5;
    v14[3] = &unk_1E58B4320;
    id v8 = *(void **)(a1 + 40);
    v14[4] = *(void *)(a1 + 32);
    id v15 = v8;
    [v7 refreshUpdateCountWithReplyHandler:v14];

    uint64_t v9 = v17;
  }
  else
  {
    id v10 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __59__ASDUpdatesService_refreshUpdateCountWithCompletionBlock___block_invoke_7;
    v11[3] = &unk_1E58B2E18;
    id v13 = *(id *)(a1 + 40);
    id v12 = v5;
    dispatch_async(v10, v11);

    uint64_t v9 = v13;
  }
}

void __59__ASDUpdatesService_refreshUpdateCountWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__ASDUpdatesService_refreshUpdateCountWithCompletionBlock___block_invoke_4;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __59__ASDUpdatesService_refreshUpdateCountWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __59__ASDUpdatesService_refreshUpdateCountWithCompletionBlock___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__ASDUpdatesService_refreshUpdateCountWithCompletionBlock___block_invoke_6;
  block[3] = &unk_1E58B3AC8;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = a2;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __59__ASDUpdatesService_refreshUpdateCountWithCompletionBlock___block_invoke_6(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

uint64_t __59__ASDUpdatesService_refreshUpdateCountWithCompletionBlock___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)refreshUpdatesWithCompletionBlock:(id)a3 completionBlock:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = (id)objc_opt_class();
    id v9 = v17;
    _os_log_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: refreshUpdatesWithCompletionBlock", buf, 0xCu);
  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__ASDUpdatesService_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke;
  block[3] = &unk_1E58B4258;
  id v14 = v6;
  id v15 = v7;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  dispatch_async(accessQueue, block);
}

void __71__ASDUpdatesService_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__ASDUpdatesService_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_2;
  v4[3] = &unk_1E58B4230;
  v4[4] = v2;
  id v6 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  [v3 getUpdatesServiceWithCompletionHandler:v4];
}

void __71__ASDUpdatesService_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __71__ASDUpdatesService_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_3;
    v16[3] = &unk_1E58B3040;
    v16[4] = *(void *)(a1 + 32);
    id v17 = *(id *)(a1 + 48);
    id v6 = [a2 remoteObjectProxyWithErrorHandler:v16];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __71__ASDUpdatesService_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_5;
    v14[3] = &unk_1E58B3358;
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = *(id *)(a1 + 48);
    v14[4] = *(void *)(a1 + 32);
    id v15 = v8;
    [v6 refreshUpdatesWithCompletionBlock:v7 completionBlock:v14];

    id v9 = v17;
  }
  else
  {
    id v10 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71__ASDUpdatesService_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_7;
    v11[3] = &unk_1E58B2E18;
    id v13 = *(id *)(a1 + 48);
    id v12 = v5;
    dispatch_async(v10, v11);

    id v9 = v13;
  }
}

void __71__ASDUpdatesService_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__ASDUpdatesService_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_4;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __71__ASDUpdatesService_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __71__ASDUpdatesService_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_5(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__ASDUpdatesService_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_6;
    block[3] = &unk_1E58B30B8;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __71__ASDUpdatesService_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __71__ASDUpdatesService_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (id)reloadFromServer
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__7;
  uint64_t v24 = __Block_byref_object_dispose__7;
  id v25 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__7;
  uint64_t v18 = __Block_byref_object_dispose__7;
  id v19 = (id)MEMORY[0x1E4F1CBF0];
  serviceBroker = self->_serviceBroker;
  id obj = 0;
  id v3 = [(ASDServiceBroker *)serviceBroker getUpdatesServiceWithError:&obj];
  objc_storeStrong(&v25, obj);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __37__ASDUpdatesService_reloadFromServer__block_invoke;
  v12[3] = &unk_1E58B3108;
  v12[4] = &v20;
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __37__ASDUpdatesService_reloadFromServer__block_invoke_2;
  v11[3] = &unk_1E58B4348;
  void v11[4] = &v20;
  void v11[5] = &v14;
  [v4 reloadFromServerWithReplyHandler:v11];

  if (v21[5])
  {
    id v5 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v8 = objc_opt_class();
      uint64_t v9 = v21[5];
      *(_DWORD *)buf = 138543618;
      v27 = v8;
      __int16 v28 = 2114;
      uint64_t v29 = v9;
      id v10 = v8;
      _os_log_error_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_ERROR, "[%{public}@]: error in reloadFromServer: %{public}@", buf, 0x16u);
    }
  }
  id v6 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v6;
}

void __37__ASDUpdatesService_reloadFromServer__block_invoke(uint64_t a1, void *a2)
{
}

void __37__ASDUpdatesService_reloadFromServer__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)reloadFromServerWithCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"nil block"];
  }
  id v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: reloadFromServerWithCompletionBlock", buf, 0xCu);
  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__ASDUpdatesService_reloadFromServerWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B33D0;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(accessQueue, v9);
}

void __57__ASDUpdatesService_reloadFromServerWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__ASDUpdatesService_reloadFromServerWithCompletionBlock___block_invoke_2;
  v3[3] = &unk_1E58B4280;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 getUpdatesServiceWithCompletionHandler:v3];
}

void __57__ASDUpdatesService_reloadFromServerWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __57__ASDUpdatesService_reloadFromServerWithCompletionBlock___block_invoke_3;
    v16[3] = &unk_1E58B3040;
    id v6 = *(void **)(a1 + 40);
    v16[4] = *(void *)(a1 + 32);
    id v17 = v6;
    uint64_t v7 = [a2 remoteObjectProxyWithErrorHandler:v16];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __57__ASDUpdatesService_reloadFromServerWithCompletionBlock___block_invoke_5;
    v14[3] = &unk_1E58B2E68;
    id v8 = *(void **)(a1 + 40);
    v14[4] = *(void *)(a1 + 32);
    id v15 = v8;
    [v7 reloadFromServerWithReplyHandler:v14];

    uint64_t v9 = v17;
  }
  else
  {
    id v10 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__ASDUpdatesService_reloadFromServerWithCompletionBlock___block_invoke_7;
    v11[3] = &unk_1E58B2E18;
    id v13 = *(id *)(a1 + 40);
    id v12 = v5;
    dispatch_async(v10, v11);

    uint64_t v9 = v13;
  }
}

void __57__ASDUpdatesService_reloadFromServerWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__ASDUpdatesService_reloadFromServerWithCompletionBlock___block_invoke_4;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __57__ASDUpdatesService_reloadFromServerWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __57__ASDUpdatesService_reloadFromServerWithCompletionBlock___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__ASDUpdatesService_reloadFromServerWithCompletionBlock___block_invoke_6;
  block[3] = &unk_1E58B3068;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __57__ASDUpdatesService_reloadFromServerWithCompletionBlock___block_invoke_6(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __57__ASDUpdatesService_reloadFromServerWithCompletionBlock___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)reloadManagedUpdatesWithCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"nil block"];
  }
  id v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: reloadManagedUpdatesWithCompletionBlock", buf, 0xCu);
  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__ASDUpdatesService_reloadManagedUpdatesWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B33D0;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(accessQueue, v9);
}

void __61__ASDUpdatesService_reloadManagedUpdatesWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__ASDUpdatesService_reloadManagedUpdatesWithCompletionBlock___block_invoke_2;
  v3[3] = &unk_1E58B4280;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 getUpdatesServiceWithCompletionHandler:v3];
}

void __61__ASDUpdatesService_reloadManagedUpdatesWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __61__ASDUpdatesService_reloadManagedUpdatesWithCompletionBlock___block_invoke_3;
    v16[3] = &unk_1E58B3040;
    id v6 = *(void **)(a1 + 40);
    v16[4] = *(void *)(a1 + 32);
    id v17 = v6;
    uint64_t v7 = [a2 remoteObjectProxyWithErrorHandler:v16];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __61__ASDUpdatesService_reloadManagedUpdatesWithCompletionBlock___block_invoke_5;
    v14[3] = &unk_1E58B2E68;
    id v8 = *(void **)(a1 + 40);
    v14[4] = *(void *)(a1 + 32);
    id v15 = v8;
    [v7 reloadManagedUpdatesWithReplyHandler:v14];

    id v9 = v17;
  }
  else
  {
    id v10 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __61__ASDUpdatesService_reloadManagedUpdatesWithCompletionBlock___block_invoke_7;
    v11[3] = &unk_1E58B2E18;
    id v13 = *(id *)(a1 + 40);
    id v12 = v5;
    dispatch_async(v10, v11);

    id v9 = v13;
  }
}

void __61__ASDUpdatesService_reloadManagedUpdatesWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__ASDUpdatesService_reloadManagedUpdatesWithCompletionBlock___block_invoke_4;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __61__ASDUpdatesService_reloadManagedUpdatesWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), MEMORY[0x1E4F1CBF0], *(void *)(a1 + 32));
}

void __61__ASDUpdatesService_reloadManagedUpdatesWithCompletionBlock___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__ASDUpdatesService_reloadManagedUpdatesWithCompletionBlock___block_invoke_6;
  block[3] = &unk_1E58B3068;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __61__ASDUpdatesService_reloadManagedUpdatesWithCompletionBlock___block_invoke_6(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __61__ASDUpdatesService_reloadManagedUpdatesWithCompletionBlock___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), MEMORY[0x1E4F1CBF0], *(void *)(a1 + 32));
}

- (void)setAutoUpdateEnabled:(BOOL)a3
{
  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__ASDUpdatesService_setAutoUpdateEnabled___block_invoke;
  v4[3] = &unk_1E58B3470;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(accessQueue, v4);
}

uint64_t __42__ASDUpdatesService_setAutoUpdateEnabled___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__ASDUpdatesService_setAutoUpdateEnabled___block_invoke_2;
  v3[3] = &__block_descriptor_33_e69_v24__0___ASDUpdatesServiceProtocol__NSXPCProxyCreating__8__NSError_16l;
  char v4 = *(unsigned char *)(a1 + 40);
  return [v1 getUpdatesServiceWithCompletionHandler:v3];
}

void __42__ASDUpdatesService_setAutoUpdateEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = [a2 remoteObjectProxyWithErrorHandler:&__block_literal_global_14];
    [v3 setAutoUpdateEnabled:*(unsigned __int8 *)(a1 + 32) withReplyHandler:&__block_literal_global_39];
  }
}

- (void)updateAllWithOrder:(id)a3 completionBlock:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = (id)objc_opt_class();
    id v9 = v17;
    _os_log_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: updateAllWithOrder", buf, 0xCu);
  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__ASDUpdatesService_updateAllWithOrder_completionBlock___block_invoke;
  block[3] = &unk_1E58B4258;
  id v14 = v6;
  id v15 = v7;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  dispatch_async(accessQueue, block);
}

void __56__ASDUpdatesService_updateAllWithOrder_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__ASDUpdatesService_updateAllWithOrder_completionBlock___block_invoke_2;
  v4[3] = &unk_1E58B4230;
  v4[4] = v2;
  id v6 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  [v3 getUpdatesServiceWithCompletionHandler:v4];
}

void __56__ASDUpdatesService_updateAllWithOrder_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __56__ASDUpdatesService_updateAllWithOrder_completionBlock___block_invoke_3;
    v20[3] = &unk_1E58B43B8;
    v20[4] = *(void *)(a1 + 32);
    id v22 = *(id *)(a1 + 48);
    id v21 = *(id *)(a1 + 40);
    id v6 = [a2 remoteObjectProxyWithErrorHandler:v20];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __56__ASDUpdatesService_updateAllWithOrder_completionBlock___block_invoke_5;
    v18[3] = &unk_1E58B43E0;
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = *(id *)(a1 + 48);
    v18[4] = *(void *)(a1 + 32);
    id v19 = v8;
    [v6 updateAllWithOrder:v7 replyHandler:v18];

    id v9 = v22;
  }
  else
  {
    id v10 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__ASDUpdatesService_updateAllWithOrder_completionBlock___block_invoke_7;
    block[3] = &unk_1E58B4390;
    id v11 = *(id *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(void **)(a1 + 40);
    id v17 = v11;
    void block[4] = v12;
    id v15 = v13;
    id v16 = v5;
    dispatch_async(v10, block);

    id v9 = v17;
  }
}

void __56__ASDUpdatesService_updateAllWithOrder_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__ASDUpdatesService_updateAllWithOrder_completionBlock___block_invoke_4;
  v9[3] = &unk_1E58B4390;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  id v12 = v5;
  void v9[4] = v6;
  id v10 = v7;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v4, v9);
}

void __56__ASDUpdatesService_updateAllWithOrder_completionBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  -[ASDUpdatesService _failedJobResultsForBundleIDs:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id, void))(v2 + 16))(v2, 0, v3, *(void *)(a1 + 48));
}

- (id)_failedJobResultsForBundleIDs:(uint64_t)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v15 = v3;
  if (a1)
  {
    char v4 = v3;
    id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count", v3));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id obj = v4;
    uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ASDErrorDomain" code:901 userInfo:0];
          id v12 = +[ASDJobResult resultWithPersistentID:0 bundleID:v10 status:1 error:v11];

          [v5 addObject:v12];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }

    id v13 = (void *)[v5 copy];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

void __56__ASDUpdatesService_updateAllWithOrder_completionBlock___block_invoke_5(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = *(void **)(a1 + 40);
  if (v9)
  {
    uint64_t v10 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__ASDUpdatesService_updateAllWithOrder_completionBlock___block_invoke_6;
    v11[3] = &unk_1E58B3498;
    id v14 = v9;
    char v15 = a2;
    id v12 = v7;
    id v13 = v8;
    dispatch_async(v10, v11);
  }
}

uint64_t __56__ASDUpdatesService_updateAllWithOrder_completionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __56__ASDUpdatesService_updateAllWithOrder_completionBlock___block_invoke_7(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  -[ASDUpdatesService _failedJobResultsForBundleIDs:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id, void))(v2 + 16))(v2, 0, v3, *(void *)(a1 + 48));
}

- (void)reloadFromServerInBackgroundWithCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: reloadFromServerInBackground", buf, 0xCu);
  }
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__ASDUpdatesService_reloadFromServerInBackgroundWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B4280;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(ASDServiceBroker *)serviceBroker getUpdatesServiceWithCompletionHandler:v9];
}

void __69__ASDUpdatesService_reloadFromServerInBackgroundWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __69__ASDUpdatesService_reloadFromServerInBackgroundWithCompletionBlock___block_invoke_2;
    v5[3] = &unk_1E58B2F08;
    v5[4] = *(void *)(a1 + 32);
    id v3 = [a2 remoteObjectProxyWithErrorHandler:v5];
    [v3 reloadFromServerInBackgroundWithCompletionBlock:*(void *)(a1 + 40)];
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

void __69__ASDUpdatesService_reloadFromServerInBackgroundWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543618;
    id v6 = (id)objc_opt_class();
    __int16 v7 = 2114;
    id v8 = v2;
    id v4 = v6;
    _os_log_error_impl(&dword_19BF6A000, v3, OS_LOG_TYPE_ERROR, "[%{public}@]: error: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

void __63__ASDUpdatesService_shouldUseModernUpdatesWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543618;
    id v6 = (id)objc_opt_class();
    __int16 v7 = 2114;
    id v8 = v2;
    id v4 = v6;
    _os_log_error_impl(&dword_19BF6A000, v3, OS_LOG_TYPE_ERROR, "[%{public}@]: error: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)getUpdateMetricsEventsWithCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: getUpdateMetricsEventsWithCompletionBlock", buf, 0xCu);
  }
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__ASDUpdatesService_getUpdateMetricsEventsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B4280;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(ASDServiceBroker *)serviceBroker getUpdatesServiceWithCompletionHandler:v9];
}

void __63__ASDUpdatesService_getUpdateMetricsEventsWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __63__ASDUpdatesService_getUpdateMetricsEventsWithCompletionBlock___block_invoke_2;
    v5[3] = &unk_1E58B2F08;
    v5[4] = *(void *)(a1 + 32);
    id v3 = [a2 remoteObjectProxyWithErrorHandler:v5];
    [v3 getUpdateMetricsEventsWithReplyHandler:*(void *)(a1 + 40)];
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

void __63__ASDUpdatesService_getUpdateMetricsEventsWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543618;
    id v6 = (id)objc_opt_class();
    __int16 v7 = 2114;
    id v8 = v2;
    id v4 = v6;
    _os_log_error_impl(&dword_19BF6A000, v3, OS_LOG_TYPE_ERROR, "[%{public}@]: error: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)getMetricsWithCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Get metrics with completion block", buf, 0xCu);
  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__ASDUpdatesService_getMetricsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B33D0;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(accessQueue, v9);
}

void __51__ASDUpdatesService_getMetricsWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__ASDUpdatesService_getMetricsWithCompletionBlock___block_invoke_2;
  v3[3] = &unk_1E58B4280;
  void v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 getUpdatesServiceWithCompletionHandler:v3];
}

void __51__ASDUpdatesService_getMetricsWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __51__ASDUpdatesService_getMetricsWithCompletionBlock___block_invoke_3;
    v18[3] = &unk_1E58B3040;
    id v6 = *(void **)(a1 + 40);
    v18[4] = *(void *)(a1 + 32);
    id v19 = v6;
    __int16 v7 = [a2 remoteObjectProxyWithErrorHandler:v18];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __51__ASDUpdatesService_getMetricsWithCompletionBlock___block_invoke_2_45;
    v16[3] = &unk_1E58B4408;
    id v8 = *(void **)(a1 + 40);
    v16[4] = *(void *)(a1 + 32);
    id v17 = v8;
    [v7 getMetricsWithReplyHandler:v16];

    uint64_t v9 = v19;
  }
  else
  {
    id v10 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v21 = (id)objc_opt_class();
      __int16 v22 = 2114;
      id v23 = v5;
      id v12 = v21;
      _os_log_error_impl(&dword_19BF6A000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", buf, 0x16u);
    }
    id v11 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__ASDUpdatesService_getMetricsWithCompletionBlock___block_invoke_48;
    v13[3] = &unk_1E58B2E18;
    id v15 = *(id *)(a1 + 40);
    id v14 = v5;
    dispatch_async(v11, v13);

    uint64_t v9 = v15;
  }
}

void __51__ASDUpdatesService_getMetricsWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v13 = (id)objc_opt_class();
    __int16 v14 = 2114;
    id v15 = v3;
    id v8 = v13;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", buf, 0x16u);
  }
  id v5 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__ASDUpdatesService_getMetricsWithCompletionBlock___block_invoke_44;
  v9[3] = &unk_1E58B2E18;
  id v6 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v6;
  id v7 = v3;
  dispatch_async(v5, v9);
}

uint64_t __51__ASDUpdatesService_getMetricsWithCompletionBlock___block_invoke_44(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __51__ASDUpdatesService_getMetricsWithCompletionBlock___block_invoke_2_45(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v18 = (id)objc_opt_class();
      __int16 v19 = 2114;
      id v20 = v6;
      id v12 = v18;
      _os_log_error_impl(&dword_19BF6A000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", buf, 0x16u);
    }
  }
  id v8 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__ASDUpdatesService_getMetricsWithCompletionBlock___block_invoke_46;
  block[3] = &unk_1E58B3068;
  id v9 = *(id *)(a1 + 40);
  id v15 = v6;
  id v16 = v9;
  id v14 = v5;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v8, block);
}

uint64_t __51__ASDUpdatesService_getMetricsWithCompletionBlock___block_invoke_46(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __51__ASDUpdatesService_getMetricsWithCompletionBlock___block_invoke_48(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)getUpdatesIncludingMetricsWithCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Get updates including metrics with completion block", buf, 0xCu);
  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__ASDUpdatesService_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B33D0;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(accessQueue, v9);
}

void __67__ASDUpdatesService_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__ASDUpdatesService_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_2;
  v3[3] = &unk_1E58B4280;
  void v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 getUpdatesServiceWithCompletionHandler:v3];
}

void __67__ASDUpdatesService_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __67__ASDUpdatesService_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_3;
    v17[3] = &unk_1E58B3040;
    id v6 = *(void **)(a1 + 40);
    v17[4] = *(void *)(a1 + 32);
    id v18 = v6;
    id v7 = [a2 remoteObjectProxyWithErrorHandler:v17];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __67__ASDUpdatesService_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_2_50;
    v15[3] = &unk_1E58B2E68;
    id v8 = *(void **)(a1 + 40);
    v15[4] = *(void *)(a1 + 32);
    id v16 = v8;
    [v7 getUpdatesIncludingMetricsWithReplyHandler:v15];

    id v9 = v18;
  }
  else
  {
    id v10 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v20 = (id)objc_opt_class();
      __int16 v21 = 2114;
      id v22 = v5;
      id v12 = v20;
      _os_log_error_impl(&dword_19BF6A000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", buf, 0x16u);
    }
    id v11 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__ASDUpdatesService_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_52;
    block[3] = &unk_1E58B4208;
    id v14 = *(id *)(a1 + 40);
    dispatch_async(v11, block);
    id v9 = v14;
  }
}

void __67__ASDUpdatesService_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v10 = (id)objc_opt_class();
    __int16 v11 = 2114;
    id v12 = v3;
    id v6 = v10;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", buf, 0x16u);
  }
  id v5 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__ASDUpdatesService_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_49;
  block[3] = &unk_1E58B4208;
  id v8 = *(id *)(a1 + 40);
  dispatch_async(v5, block);
}

uint64_t __67__ASDUpdatesService_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_49(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__ASDUpdatesService_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_2_50(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v16 = (id)objc_opt_class();
      __int16 v17 = 2114;
      id v18 = v6;
      id v11 = v16;
      _os_log_error_impl(&dword_19BF6A000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", buf, 0x16u);
    }
  }
  id v8 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__ASDUpdatesService_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_51;
  v12[3] = &unk_1E58B2E18;
  id v9 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v9;
  id v10 = v5;
  dispatch_async(v8, v12);
}

uint64_t __67__ASDUpdatesService_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_51(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __67__ASDUpdatesService_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_52(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)hideApplicationBadgeForPendingUpdates
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = (id)objc_opt_class();
    id v4 = v8;
    _os_log_impl(&dword_19BF6A000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Hide application badge for pending updates", buf, 0xCu);
  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__ASDUpdatesService_hideApplicationBadgeForPendingUpdates__block_invoke;
  block[3] = &unk_1E58B2EB8;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __58__ASDUpdatesService_hideApplicationBadgeForPendingUpdates__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__ASDUpdatesService_hideApplicationBadgeForPendingUpdates__block_invoke_2;
  v4[3] = &unk_1E58B4430;
  v4[4] = v1;
  return [v2 getUpdatesServiceWithCompletionHandler:v4];
}

void __58__ASDUpdatesService_hideApplicationBadgeForPendingUpdates__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__ASDUpdatesService_hideApplicationBadgeForPendingUpdates__block_invoke_3;
    v8[3] = &unk_1E58B2F08;
    void v8[4] = *(void *)(a1 + 32);
    id v6 = [a2 remoteObjectProxyWithErrorHandler:v8];
    [v6 hideApplicationBadgeForPendingUpdates];
  }
  else
  {
    id v6 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v10 = (id)objc_opt_class();
      __int16 v11 = 2114;
      id v12 = v5;
      id v7 = v10;
      _os_log_error_impl(&dword_19BF6A000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", buf, 0x16u);
    }
  }
}

void __58__ASDUpdatesService_hideApplicationBadgeForPendingUpdates__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543618;
    id v6 = (id)objc_opt_class();
    __int16 v7 = 2114;
    id v8 = v2;
    id v4 = v6;
    _os_log_error_impl(&dword_19BF6A000, v3, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)reloadForSettingsFromServerWithCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Reload for settings from server with completion block", buf, 0xCu);
  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__ASDUpdatesService_reloadForSettingsFromServerWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B33D0;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(accessQueue, v9);
}

void __68__ASDUpdatesService_reloadForSettingsFromServerWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__ASDUpdatesService_reloadForSettingsFromServerWithCompletionBlock___block_invoke_2;
  v3[3] = &unk_1E58B4280;
  void v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 getUpdatesServiceWithCompletionHandler:v3];
}

void __68__ASDUpdatesService_reloadForSettingsFromServerWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __68__ASDUpdatesService_reloadForSettingsFromServerWithCompletionBlock___block_invoke_3;
    v18[3] = &unk_1E58B3040;
    id v6 = *(void **)(a1 + 40);
    v18[4] = *(void *)(a1 + 32);
    id v19 = v6;
    __int16 v7 = [a2 remoteObjectProxyWithErrorHandler:v18];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __68__ASDUpdatesService_reloadForSettingsFromServerWithCompletionBlock___block_invoke_2_54;
    v16[3] = &unk_1E58B2E68;
    id v8 = *(void **)(a1 + 40);
    v16[4] = *(void *)(a1 + 32);
    id v17 = v8;
    [v7 reloadForSettingsFromServerWithReplyHandler:v16];

    uint64_t v9 = v19;
  }
  else
  {
    id v10 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v21 = (id)objc_opt_class();
      __int16 v22 = 2114;
      id v23 = v5;
      id v12 = v21;
      _os_log_error_impl(&dword_19BF6A000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", buf, 0x16u);
    }
    __int16 v11 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __68__ASDUpdatesService_reloadForSettingsFromServerWithCompletionBlock___block_invoke_56;
    v13[3] = &unk_1E58B2E18;
    id v15 = *(id *)(a1 + 40);
    id v14 = v5;
    dispatch_async(v11, v13);

    uint64_t v9 = v15;
  }
}

void __68__ASDUpdatesService_reloadForSettingsFromServerWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v13 = (id)objc_opt_class();
    __int16 v14 = 2114;
    id v15 = v3;
    id v8 = v13;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", buf, 0x16u);
  }
  id v5 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__ASDUpdatesService_reloadForSettingsFromServerWithCompletionBlock___block_invoke_53;
  v9[3] = &unk_1E58B2E18;
  id v6 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v6;
  id v7 = v3;
  dispatch_async(v5, v9);
}

uint64_t __68__ASDUpdatesService_reloadForSettingsFromServerWithCompletionBlock___block_invoke_53(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), MEMORY[0x1E4F1CBF0], *(void *)(a1 + 32));
}

void __68__ASDUpdatesService_reloadForSettingsFromServerWithCompletionBlock___block_invoke_2_54(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v18 = (id)objc_opt_class();
      __int16 v19 = 2114;
      id v20 = v6;
      id v12 = v18;
      _os_log_error_impl(&dword_19BF6A000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", buf, 0x16u);
    }
  }
  id v8 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__ASDUpdatesService_reloadForSettingsFromServerWithCompletionBlock___block_invoke_55;
  block[3] = &unk_1E58B3068;
  id v9 = *(id *)(a1 + 40);
  id v15 = v6;
  id v16 = v9;
  id v14 = v5;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v8, block);
}

uint64_t __68__ASDUpdatesService_reloadForSettingsFromServerWithCompletionBlock___block_invoke_55(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __68__ASDUpdatesService_reloadForSettingsFromServerWithCompletionBlock___block_invoke_56(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), MEMORY[0x1E4F1CBF0], *(void *)(a1 + 32));
}

- (void)showApplicationBadgeForPendingUpdates
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = (id)objc_opt_class();
    id v4 = v8;
    _os_log_impl(&dword_19BF6A000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Show application badge for pending updates", buf, 0xCu);
  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__ASDUpdatesService_showApplicationBadgeForPendingUpdates__block_invoke;
  block[3] = &unk_1E58B2EB8;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __58__ASDUpdatesService_showApplicationBadgeForPendingUpdates__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__ASDUpdatesService_showApplicationBadgeForPendingUpdates__block_invoke_2;
  v4[3] = &unk_1E58B4430;
  v4[4] = v1;
  return [v2 getUpdatesServiceWithCompletionHandler:v4];
}

void __58__ASDUpdatesService_showApplicationBadgeForPendingUpdates__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__ASDUpdatesService_showApplicationBadgeForPendingUpdates__block_invoke_3;
    v8[3] = &unk_1E58B2F08;
    void v8[4] = *(void *)(a1 + 32);
    id v6 = [a2 remoteObjectProxyWithErrorHandler:v8];
    [v6 showApplicationBadgeForPendingUpdates];
  }
  else
  {
    id v6 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v10 = (id)objc_opt_class();
      __int16 v11 = 2114;
      id v12 = v5;
      id v7 = v10;
      _os_log_error_impl(&dword_19BF6A000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", buf, 0x16u);
    }
  }
}

void __58__ASDUpdatesService_showApplicationBadgeForPendingUpdates__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543618;
    id v6 = (id)objc_opt_class();
    __int16 v7 = 2114;
    id v8 = v2;
    id v4 = v6;
    _os_log_error_impl(&dword_19BF6A000, v3, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)updateAllWithCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Update all with completion block", buf, 0xCu);
  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__ASDUpdatesService_updateAllWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B33D0;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(accessQueue, v9);
}

void __50__ASDUpdatesService_updateAllWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__ASDUpdatesService_updateAllWithCompletionBlock___block_invoke_2;
  v3[3] = &unk_1E58B4280;
  void v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 getUpdatesServiceWithCompletionHandler:v3];
}

void __50__ASDUpdatesService_updateAllWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __50__ASDUpdatesService_updateAllWithCompletionBlock___block_invoke_3;
    v18[3] = &unk_1E58B3040;
    id v6 = *(void **)(a1 + 40);
    v18[4] = *(void *)(a1 + 32);
    id v19 = v6;
    __int16 v7 = [a2 remoteObjectProxyWithErrorHandler:v18];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __50__ASDUpdatesService_updateAllWithCompletionBlock___block_invoke_2_58;
    v16[3] = &unk_1E58B4458;
    id v8 = *(void **)(a1 + 40);
    v16[4] = *(void *)(a1 + 32);
    id v17 = v8;
    [v7 updateAllWithReplyHandler:v16];

    uint64_t v9 = v19;
  }
  else
  {
    id v10 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v21 = (id)objc_opt_class();
      __int16 v22 = 2114;
      id v23 = v5;
      id v12 = v21;
      _os_log_error_impl(&dword_19BF6A000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", buf, 0x16u);
    }
    __int16 v11 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__ASDUpdatesService_updateAllWithCompletionBlock___block_invoke_60;
    v13[3] = &unk_1E58B2E18;
    id v15 = *(id *)(a1 + 40);
    id v14 = v5;
    dispatch_async(v11, v13);

    uint64_t v9 = v15;
  }
}

void __50__ASDUpdatesService_updateAllWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v13 = (id)objc_opt_class();
    __int16 v14 = 2114;
    id v15 = v3;
    id v8 = v13;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", buf, 0x16u);
  }
  id v5 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__ASDUpdatesService_updateAllWithCompletionBlock___block_invoke_57;
  v9[3] = &unk_1E58B2E18;
  id v6 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v6;
  id v7 = v3;
  dispatch_async(v5, v9);
}

uint64_t __50__ASDUpdatesService_updateAllWithCompletionBlock___block_invoke_57(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __50__ASDUpdatesService_updateAllWithCompletionBlock___block_invoke_2_58(uint64_t a1, char a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v16 = (id)objc_opt_class();
      __int16 v17 = 2114;
      id v18 = v5;
      id v10 = v16;
      _os_log_error_impl(&dword_19BF6A000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", buf, 0x16u);
    }
  }
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__ASDUpdatesService_updateAllWithCompletionBlock___block_invoke_59;
  block[3] = &unk_1E58B30B8;
  id v8 = *(id *)(a1 + 40);
  char v14 = a2;
  id v12 = v5;
  id v13 = v8;
  id v9 = v5;
  dispatch_async(v7, block);
}

uint64_t __50__ASDUpdatesService_updateAllWithCompletionBlock___block_invoke_59(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __50__ASDUpdatesService_updateAllWithCompletionBlock___block_invoke_60(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)updateAllWithJobResultsCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Update all with job results completion block", buf, 0xCu);
  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__ASDUpdatesService_updateAllWithJobResultsCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B33D0;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(accessQueue, v9);
}

void __60__ASDUpdatesService_updateAllWithJobResultsCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__ASDUpdatesService_updateAllWithJobResultsCompletionBlock___block_invoke_2;
  v3[3] = &unk_1E58B4280;
  void v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 getUpdatesServiceWithCompletionHandler:v3];
}

void __60__ASDUpdatesService_updateAllWithJobResultsCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __60__ASDUpdatesService_updateAllWithJobResultsCompletionBlock___block_invoke_3;
    v18[3] = &unk_1E58B3040;
    id v6 = *(void **)(a1 + 40);
    v18[4] = *(void *)(a1 + 32);
    id v19 = v6;
    id v7 = [a2 remoteObjectProxyWithErrorHandler:v18];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __60__ASDUpdatesService_updateAllWithJobResultsCompletionBlock___block_invoke_2_62;
    v16[3] = &unk_1E58B34C0;
    id v8 = *(void **)(a1 + 40);
    v16[4] = *(void *)(a1 + 32);
    id v17 = v8;
    [v7 updateAllGettingJobResultsWithReplyHandler:v16];

    id v9 = v19;
  }
  else
  {
    id v10 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v21 = (id)objc_opt_class();
      __int16 v22 = 2114;
      id v23 = v5;
      id v12 = v21;
      _os_log_error_impl(&dword_19BF6A000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", buf, 0x16u);
    }
    id v11 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __60__ASDUpdatesService_updateAllWithJobResultsCompletionBlock___block_invoke_64;
    v13[3] = &unk_1E58B2E18;
    id v15 = *(id *)(a1 + 40);
    id v14 = v5;
    dispatch_async(v11, v13);

    id v9 = v15;
  }
}

void __60__ASDUpdatesService_updateAllWithJobResultsCompletionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v13 = (id)objc_opt_class();
    __int16 v14 = 2114;
    id v15 = v3;
    id v8 = v13;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", buf, 0x16u);
  }
  id v5 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__ASDUpdatesService_updateAllWithJobResultsCompletionBlock___block_invoke_61;
  v9[3] = &unk_1E58B2E18;
  id v6 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v6;
  id v7 = v3;
  dispatch_async(v5, v9);
}

uint64_t __60__ASDUpdatesService_updateAllWithJobResultsCompletionBlock___block_invoke_61(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, MEMORY[0x1E4F1CBF0], *(void *)(a1 + 32));
}

void __60__ASDUpdatesService_updateAllWithJobResultsCompletionBlock___block_invoke_2_62(uint64_t a1, char a2, void *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v21 = (id)objc_opt_class();
      __int16 v22 = 2114;
      id v23 = v8;
      id v14 = v21;
      _os_log_error_impl(&dword_19BF6A000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", buf, 0x16u);
    }
  }
  id v10 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__ASDUpdatesService_updateAllWithJobResultsCompletionBlock___block_invoke_63;
  v15[3] = &unk_1E58B3498;
  id v11 = *(id *)(a1 + 40);
  id v17 = v8;
  id v18 = v11;
  char v19 = a2;
  id v16 = v7;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v10, v15);
}

uint64_t __60__ASDUpdatesService_updateAllWithJobResultsCompletionBlock___block_invoke_63(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __60__ASDUpdatesService_updateAllWithJobResultsCompletionBlock___block_invoke_64(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, MEMORY[0x1E4F1CBF0], *(void *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_serviceBroker, 0);
}

@end