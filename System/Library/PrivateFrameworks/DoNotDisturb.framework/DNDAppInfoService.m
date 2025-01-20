@interface DNDAppInfoService
+ (id)serviceForClientIdentifier:(id)a3;
- (id)_initWithClientIdentifier:(id)a3;
- (id)getAppInfoForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)getAppInfoForBundleIdentifiers:(id)a3 error:(id *)a4;
@end

@implementation DNDAppInfoService

+ (id)serviceForClientIdentifier:(id)a3
{
  id v4 = a3;
  if (serviceForClientIdentifier__onceToken_10 != -1) {
    dispatch_once(&serviceForClientIdentifier__onceToken_10, &__block_literal_global_15);
  }
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__10;
  v17 = __Block_byref_object_dispose__10;
  id v18 = 0;
  v5 = serviceForClientIdentifier__lockQueue_9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__DNDAppInfoService_serviceForClientIdentifier___block_invoke_2;
  block[3] = &unk_1E5910F18;
  id v10 = v4;
  v11 = &v13;
  id v12 = a1;
  id v6 = v4;
  dispatch_sync(v5, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

uint64_t __48__DNDAppInfoService_serviceForClientIdentifier___block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.donotdisturb.DNDAppInfoService.service.lock", v0);
  v2 = (void *)serviceForClientIdentifier__lockQueue_9;
  serviceForClientIdentifier__lockQueue_9 = (uint64_t)v1;

  uint64_t v3 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:517];
  uint64_t v4 = serviceForClientIdentifier__serviceByClientIdentifier_10;
  serviceForClientIdentifier__serviceByClientIdentifier_10 = v3;
  return MEMORY[0x1F41817F8](v3, v4);
}

void __48__DNDAppInfoService_serviceForClientIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [(id)serviceForClientIdentifier__serviceByClientIdentifier_10 objectForKey:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v5 = [objc_alloc(*(Class *)(a1 + 48)) _initWithClientIdentifier:*(void *)(a1 + 32)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    v8 = (void *)serviceForClientIdentifier__serviceByClientIdentifier_10;
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [v8 setObject:v10 forKey:v9];
  }
}

- (id)getAppInfoForBundleIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDAppInfoService.getAppInfoForBundleIdentifier", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v8 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__10;
  v26 = __Block_byref_object_dispose__10;
  id v27 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__10;
  v20 = __Block_byref_object_dispose__10;
  id v21 = 0;
  uint64_t v9 = +[DNDRemoteServiceConnection sharedInstance];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__DNDAppInfoService_getAppInfoForBundleIdentifier_error___block_invoke;
  v15[3] = &unk_1E5911B90;
  v15[4] = &v22;
  v15[5] = &v16;
  [v9 getAppInfoForBundleIdentifier:v6 withRequestDetails:v8 completionHandler:v15];

  uint64_t v10 = DNDLogGlobalConfiguration;
  if (v17[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_ERROR)) {
      -[DNDAppInfoService getAppInfoForBundleIdentifier:error:]();
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = v23[5];
    *(_DWORD *)buf = 138543619;
    v30 = v8;
    __int16 v31 = 2113;
    uint64_t v32 = v11;
    _os_log_impl(&dword_19CC2C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] App info is %{private}@", buf, 0x16u);
  }
  if (a4)
  {
    id v12 = (void *)v17[5];
    if (v12) {
      *a4 = v12;
    }
  }
  id v13 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  os_activity_scope_leave(&state);

  return v13;
}

void __57__DNDAppInfoService_getAppInfoForBundleIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F28B50], "dnd_doNotDisturbLocalizationBundle");
    v8 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) displayName];
    uint64_t v9 = [v7 localizedStringForKey:v8 value:&stru_1EEDCFB98 table:0];

    if ([v9 length])
    {
      uint64_t v10 = (void *)[v16 mutableCopy];
      [v10 setDisplayName:v9];
      uint64_t v11 = [v10 copy];
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
      id v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
    }
  }
  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v6;
}

- (id)getAppInfoForBundleIdentifiers:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDAppInfoService.getAppInfoForBundleIdentifiers", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v8 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__10;
  id v27 = __Block_byref_object_dispose__10;
  id v28 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__10;
  id v21 = __Block_byref_object_dispose__10;
  id v22 = 0;
  uint64_t v9 = +[DNDRemoteServiceConnection sharedInstance];
  uint64_t v10 = [v6 allObjects];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58__DNDAppInfoService_getAppInfoForBundleIdentifiers_error___block_invoke;
  v16[3] = &unk_1E5911458;
  v16[4] = &v23;
  v16[5] = &v17;
  [v9 getAppInfoForBundleIdentifiers:v10 withRequestDetails:v8 completionHandler:v16];

  uint64_t v11 = DNDLogGlobalConfiguration;
  if (v18[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_ERROR)) {
      -[DNDAppInfoService getAppInfoForBundleIdentifier:error:]();
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v24[5];
    *(_DWORD *)buf = 138543619;
    __int16 v31 = v8;
    __int16 v32 = 2113;
    uint64_t v33 = v12;
    _os_log_impl(&dword_19CC2C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] App info is %{private}@", buf, 0x16u);
  }
  if (a4)
  {
    id v13 = (void *)v18[5];
    if (v13) {
      *a4 = v13;
    }
  }
  id v14 = (id)v24[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  os_activity_scope_leave(&state);

  return v14;
}

void __58__DNDAppInfoService_getAppInfoForBundleIdentifiers_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v25 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(id *)(*((void *)&v27 + 1) + 8 * v10);
        uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28B50], "dnd_doNotDisturbLocalizationBundle");
        id v13 = [v11 displayName];
        id v14 = [v12 localizedStringForKey:v13 value:&stru_1EEDCFB98 table:0];

        uint64_t v15 = v11;
        if ([v14 length])
        {
          id v16 = (void *)[v11 mutableCopy];
          [v16 setDisplayName:v14];
          uint64_t v15 = (void *)[v16 copy];
        }
        uint64_t v17 = [v11 applicationIdentifier];
        uint64_t v18 = [v17 bundleID];
        [v5 setObject:v15 forKeyedSubscript:v18];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v8);
  }
  uint64_t v19 = v6;

  uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 8);
  id v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v5;
  id v22 = v5;

  uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v25;
}

- (id)_initWithClientIdentifier:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DNDAppInfoService;
  uint64_t v5 = [(DNDAppInfoService *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v6;

    uint64_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.donotdisturb.DNDAppInfoService", v8);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v9;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)getAppInfoForBundleIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when getting app info, error='%{public}@'");
}

@end