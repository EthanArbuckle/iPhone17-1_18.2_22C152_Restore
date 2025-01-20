@interface DNDSettingsService
+ (id)serviceForClientIdentifier:(id)a3;
- (BOOL)_queue_registerForSettingsUpdatesIfRequired;
- (BOOL)addSettingsUpdateListener:(id)a3 error:(id *)a4;
- (BOOL)removeSettingsUpdateListener:(id)a3 error:(id *)a4;
- (BOOL)setBehaviorSettings:(id)a3 error:(id *)a4;
- (BOOL)setConfiguration:(id)a3 forModeIdentifier:(id)a4 error:(id *)a5;
- (BOOL)setPhoneCallBypassSettings:(id)a3 error:(id *)a4;
- (BOOL)setScheduleSettings:(id)a3 error:(id *)a4;
- (NSString)clientIdentifier;
- (id)_initWithClientIdentifier:(id)a3;
- (id)behaviorSettingsReturningError:(id *)a3;
- (id)configurationForModeIdentifier:(id)a3 error:(id *)a4;
- (id)phoneCallBypassSettingsReturningError:(id *)a3;
- (id)scheduleSettingsReturningError:(id *)a3;
- (void)_queue_registerForSettingsUpdatesIfRequired;
- (void)addSettingsUpdateListener:(id)a3 withCompletionHandler:(id)a4;
- (void)remoteService:(id)a3 didReceiveUpdatedBehaviorSettings:(id)a4;
- (void)remoteService:(id)a3 didReceiveUpdatedPhoneCallBypassSettings:(id)a4;
- (void)remoteService:(id)a3 didReceiveUpdatedScheduleSettings:(id)a4;
- (void)removeSettingsUpdateListener:(id)a3;
@end

@implementation DNDSettingsService

+ (id)serviceForClientIdentifier:(id)a3
{
  id v4 = a3;
  if (serviceForClientIdentifier__onceToken_11 != -1) {
    dispatch_once(&serviceForClientIdentifier__onceToken_11, &__block_literal_global_17);
  }
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__11;
  v17 = __Block_byref_object_dispose__11;
  id v18 = 0;
  v5 = serviceForClientIdentifier__lockQueue_10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__DNDSettingsService_serviceForClientIdentifier___block_invoke_2;
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

uint64_t __49__DNDSettingsService_serviceForClientIdentifier___block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.donotdisturb.DNDSettingsService.service.lock", v0);
  v2 = (void *)serviceForClientIdentifier__lockQueue_10;
  serviceForClientIdentifier__lockQueue_10 = (uint64_t)v1;

  uint64_t v3 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:517];
  uint64_t v4 = serviceForClientIdentifier__serviceByClientIdentifier_11;
  serviceForClientIdentifier__serviceByClientIdentifier_11 = v3;
  return MEMORY[0x1F41817F8](v3, v4);
}

void __49__DNDSettingsService_serviceForClientIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [(id)serviceForClientIdentifier__serviceByClientIdentifier_11 objectForKey:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v5 = [objc_alloc(*(Class *)(a1 + 48)) _initWithClientIdentifier:*(void *)(a1 + 32)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    v8 = (void *)serviceForClientIdentifier__serviceByClientIdentifier_11;
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [v8 setObject:v10 forKey:v9];
  }
}

- (id)_initWithClientIdentifier:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DNDSettingsService;
  uint64_t v5 = [(DNDSettingsService *)&v22 init];
  if (v5)
  {
    uint64_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.donotdisturb.SettingsService", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.donotdisturb.SettingsService.call-out", v9);
    calloutQueue = v5->_calloutQueue;
    v5->_calloutQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = [v4 copy];
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v12;

    uint64_t v14 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    settingsUpdateListeners = v5->_settingsUpdateListeners;
    v5->_settingsUpdateListeners = (NSHashTable *)v14;

    uint64_t v16 = +[DNDModeConfigurationService serviceForClientIdentifier:v4];
    modeConfigurationService = v5->_modeConfigurationService;
    v5->_modeConfigurationService = (DNDModeConfigurationService *)v16;

    uint64_t v18 = +[DNDGlobalConfigurationService serviceForClientIdentifier:v4];
    globalConfigurationService = v5->_globalConfigurationService;
    v5->_globalConfigurationService = (DNDGlobalConfigurationService *)v18;

    v20 = +[DNDRemoteServiceConnection sharedInstance];
    [v20 addEventListener:v5];
  }
  return v5;
}

- (id)behaviorSettingsReturningError:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDSettingsService.behaviorSettings", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  uint64_t v6 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__11;
  v24 = __Block_byref_object_dispose__11;
  id v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__11;
  uint64_t v18 = __Block_byref_object_dispose__11;
  id v19 = 0;
  dispatch_queue_t v7 = +[DNDRemoteServiceConnection sharedInstance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__DNDSettingsService_behaviorSettingsReturningError___block_invoke;
  v13[3] = &unk_1E59120D8;
  v13[4] = &v20;
  v13[5] = &v14;
  [v7 getBehaviorSettingsWithRequestDetails:v6 completionHandler:v13];

  if (!v21[5] && os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_ERROR)) {
    -[DNDSettingsService behaviorSettingsReturningError:]();
  }
  if (a3)
  {
    v8 = (void *)v15[5];
    if (v8) {
      *a3 = v8;
    }
  }
  uint64_t v9 = DNDLogSettings;
  if (os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = v21[5];
    *(_DWORD *)buf = 138543618;
    v28 = v6;
    __int16 v29 = 2114;
    uint64_t v30 = v10;
    _os_log_impl(&dword_19CC2C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got behavior settings, settings=%{public}@", buf, 0x16u);
  }
  id v11 = (id)v21[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  os_activity_scope_leave(&state);

  return v11;
}

void __53__DNDSettingsService_behaviorSettingsReturningError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)setBehaviorSettings:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDSettingsService.setBehaviorSettings", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v8 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__11;
  uint64_t v20 = __Block_byref_object_dispose__11;
  id v21 = 0;
  uint64_t v9 = +[DNDRemoteServiceConnection sharedInstance];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __48__DNDSettingsService_setBehaviorSettings_error___block_invoke;
  v15[3] = &unk_1E5910F40;
  v15[4] = &v22;
  v15[5] = &v16;
  [v9 setBehaviorSettings:v6 withRequestDetails:v8 completionHandler:v15];

  uint64_t v10 = DNDLogSettings;
  if (*((unsigned char *)v23 + 24))
  {
    if (os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v28 = v8;
      __int16 v29 = 2114;
      id v30 = v6;
      _os_log_impl(&dword_19CC2C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set behavior settings, settings=%{public}@", buf, 0x16u);
      if (!a4) {
        goto LABEL_9;
      }
      goto LABEL_7;
    }
LABEL_6:
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if (!os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_ERROR)) {
    goto LABEL_6;
  }
  uint64_t v14 = v17[5];
  *(_DWORD *)buf = 138543874;
  v28 = v8;
  __int16 v29 = 2114;
  id v30 = v6;
  __int16 v31 = 2114;
  uint64_t v32 = v14;
  _os_log_error_impl(&dword_19CC2C000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] Error setting behavior settings, settings=%{public}@, error='%{public}@'", buf, 0x20u);
  if (!a4) {
    goto LABEL_9;
  }
LABEL_7:
  id v11 = (void *)v17[5];
  if (v11) {
    *a4 = v11;
  }
LABEL_9:
  BOOL v12 = *((unsigned char *)v23 + 24) != 0;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  os_activity_scope_leave(&state);

  return v12;
}

void __48__DNDSettingsService_setBehaviorSettings_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 BOOLValue];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)phoneCallBypassSettingsReturningError:(id *)a3
{
  return [(DNDGlobalConfigurationService *)self->_globalConfigurationService getPhoneCallBypassSettingsReturningError:a3];
}

- (BOOL)setPhoneCallBypassSettings:(id)a3 error:(id *)a4
{
  return [(DNDGlobalConfigurationService *)self->_globalConfigurationService setPhoneCallBypassSettings:a3 error:a4];
}

- (id)scheduleSettingsReturningError:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDSettingsService.scheduleSettings", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  uint64_t v6 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__11;
  uint64_t v24 = __Block_byref_object_dispose__11;
  id v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__11;
  uint64_t v18 = __Block_byref_object_dispose__11;
  id v19 = 0;
  uint64_t v7 = +[DNDRemoteServiceConnection sharedInstance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__DNDSettingsService_scheduleSettingsReturningError___block_invoke;
  v13[3] = &unk_1E5912100;
  v13[4] = &v20;
  v13[5] = &v14;
  [v7 getScheduleSettingsWithRequestDetails:v6 completionHandler:v13];

  if (!v21[5] && os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_ERROR)) {
    -[DNDSettingsService scheduleSettingsReturningError:]();
  }
  if (a3)
  {
    v8 = (void *)v15[5];
    if (v8) {
      *a3 = v8;
    }
  }
  uint64_t v9 = DNDLogSettings;
  if (os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = v21[5];
    *(_DWORD *)buf = 138543618;
    v28 = v6;
    __int16 v29 = 2114;
    uint64_t v30 = v10;
    _os_log_impl(&dword_19CC2C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got schedule settings, settings=%{public}@", buf, 0x16u);
  }
  id v11 = (id)v21[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  os_activity_scope_leave(&state);

  return v11;
}

void __53__DNDSettingsService_scheduleSettingsReturningError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)setScheduleSettings:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDSettingsService.setScheduleSettings", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v8 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__11;
  uint64_t v20 = __Block_byref_object_dispose__11;
  id v21 = 0;
  uint64_t v9 = +[DNDRemoteServiceConnection sharedInstance];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __48__DNDSettingsService_setScheduleSettings_error___block_invoke;
  v15[3] = &unk_1E5910F40;
  v15[4] = &v22;
  v15[5] = &v16;
  [v9 setScheduleSettings:v6 withRequestDetails:v8 completionHandler:v15];

  uint64_t v10 = DNDLogSettings;
  if (*((unsigned char *)v23 + 24))
  {
    if (os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v28 = v8;
      __int16 v29 = 2114;
      id v30 = v6;
      _os_log_impl(&dword_19CC2C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set schedule settings, settings=%{public}@", buf, 0x16u);
      if (!a4) {
        goto LABEL_9;
      }
      goto LABEL_7;
    }
LABEL_6:
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if (!os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_ERROR)) {
    goto LABEL_6;
  }
  uint64_t v14 = v17[5];
  *(_DWORD *)buf = 138543874;
  v28 = v8;
  __int16 v29 = 2114;
  id v30 = v6;
  __int16 v31 = 2114;
  uint64_t v32 = v14;
  _os_log_error_impl(&dword_19CC2C000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] Error setting schedule settings, settings=%{public}@, error='%{public}@'", buf, 0x20u);
  if (!a4) {
    goto LABEL_9;
  }
LABEL_7:
  id v11 = (void *)v17[5];
  if (v11) {
    *a4 = v11;
  }
LABEL_9:
  BOOL v12 = *((unsigned char *)v23 + 24) != 0;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  os_activity_scope_leave(&state);

  return v12;
}

void __48__DNDSettingsService_setScheduleSettings_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 BOOLValue];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)configurationForModeIdentifier:(id)a3 error:(id *)a4
{
  id v4 = [(DNDModeConfigurationService *)self->_modeConfigurationService modeConfigurationForModeIdentifier:a3 error:a4];
  id v5 = [v4 configuration];

  return v5;
}

- (BOOL)setConfiguration:(id)a3 forModeIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [(DNDModeConfigurationService *)self->_modeConfigurationService modeConfigurationForModeIdentifier:a4 error:a5];
  uint64_t v10 = v9;
  BOOL v11 = 0;
  if (!a5 && v9)
  {
    BOOL v12 = (void *)[v9 mutableCopy];
    [v12 setConfiguration:v8];
    BOOL v11 = [(DNDModeConfigurationService *)self->_modeConfigurationService setModeConfiguration:v12 error:0];
  }
  return v11;
}

- (void)addSettingsUpdateListener:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDSettingsService.addSettingsUpdateListener", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__DNDSettingsService_addSettingsUpdateListener_withCompletionHandler___block_invoke;
  block[3] = &unk_1E5911030;
  id v13 = v6;
  uint64_t v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(queue, block);

  os_activity_scope_leave(&state);
}

void __70__DNDSettingsService_addSettingsUpdateListener_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = DNDLogSettings;
  if (os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = v3;
    _os_log_impl(&dword_19CC2C000, v2, OS_LOG_TYPE_DEFAULT, "Adding settings update listener: listener=%{public}@", buf, 0xCu);
  }
  [*(id *)(*(void *)(a1 + 40) + 24) addObject:*(void *)(a1 + 32)];
  int v4 = objc_msgSend(*(id *)(a1 + 40), "_queue_registerForSettingsUpdatesIfRequired");
  char v5 = v4;
  id v6 = DNDLogSettings;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v14 = v7;
      _os_log_impl(&dword_19CC2C000, v6, OS_LOG_TYPE_DEFAULT, "Registered for settings updates: listener=%{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_ERROR)) {
      __70__DNDSettingsService_addSettingsUpdateListener_withCompletionHandler___block_invoke_cold_1((uint64_t *)(a1 + 32), v6);
    }
    [*(id *)(*(void *)(a1 + 40) + 24) removeObject:*(void *)(a1 + 32)];
  }
  id v8 = *(void **)(a1 + 48);
  if (v8)
  {
    uint64_t v9 = *(NSObject **)(*(void *)(a1 + 40) + 16);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __70__DNDSettingsService_addSettingsUpdateListener_withCompletionHandler___block_invoke_13;
    v10[3] = &unk_1E5911058;
    id v11 = v8;
    char v12 = v5;
    dispatch_async(v9, v10);
  }
}

uint64_t __70__DNDSettingsService_addSettingsUpdateListener_withCompletionHandler___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

- (void)removeSettingsUpdateListener:(id)a3
{
  id v4 = a3;
  char v5 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDSettingsService.removeSettingsUpdateListener", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__DNDSettingsService_removeSettingsUpdateListener___block_invoke;
  v8[3] = &unk_1E5911080;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_sync(queue, v8);

  os_activity_scope_leave(&state);
}

uint64_t __51__DNDSettingsService_removeSettingsUpdateListener___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = DNDLogSettings;
  if (os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19CC2C000, v2, OS_LOG_TYPE_DEFAULT, "Removing settings update listener: listener=%{public}@", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(*(void *)(a1 + 40) + 24) removeObject:*(void *)(a1 + 32)];
}

- (void)remoteService:(id)a3 didReceiveUpdatedBehaviorSettings:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__DNDSettingsService_remoteService_didReceiveUpdatedBehaviorSettings___block_invoke;
  v8[3] = &unk_1E5911080;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(queue, v8);
}

void __70__DNDSettingsService_remoteService_didReceiveUpdatedBehaviorSettings___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(NSObject **)(v3 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__DNDSettingsService_remoteService_didReceiveUpdatedBehaviorSettings___block_invoke_2;
  block[3] = &unk_1E59110A8;
  id v7 = v2;
  uint64_t v8 = v3;
  id v9 = *(id *)(a1 + 40);
  id v5 = v2;
  dispatch_async(v4, block);
}

void __70__DNDSettingsService_remoteService_didReceiveUpdatedBehaviorSettings___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "settingsService:didReceiveUpdatedBehaviorSettings:", *(void *)(a1 + 40), *(void *)(a1 + 48), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)remoteService:(id)a3 didReceiveUpdatedPhoneCallBypassSettings:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__DNDSettingsService_remoteService_didReceiveUpdatedPhoneCallBypassSettings___block_invoke;
  v8[3] = &unk_1E5911080;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(queue, v8);
}

void __77__DNDSettingsService_remoteService_didReceiveUpdatedPhoneCallBypassSettings___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(v3 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__DNDSettingsService_remoteService_didReceiveUpdatedPhoneCallBypassSettings___block_invoke_2;
  block[3] = &unk_1E59110A8;
  id v7 = v2;
  uint64_t v8 = v3;
  id v9 = *(id *)(a1 + 40);
  id v5 = v2;
  dispatch_async(v4, block);
}

void __77__DNDSettingsService_remoteService_didReceiveUpdatedPhoneCallBypassSettings___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "settingsService:didReceiveUpdatedPhoneCallBypassSettings:", *(void *)(a1 + 40), *(void *)(a1 + 48), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)remoteService:(id)a3 didReceiveUpdatedScheduleSettings:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__DNDSettingsService_remoteService_didReceiveUpdatedScheduleSettings___block_invoke;
  v8[3] = &unk_1E5911080;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(queue, v8);
}

void __70__DNDSettingsService_remoteService_didReceiveUpdatedScheduleSettings___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(v3 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__DNDSettingsService_remoteService_didReceiveUpdatedScheduleSettings___block_invoke_2;
  block[3] = &unk_1E59110A8;
  id v7 = v2;
  uint64_t v8 = v3;
  id v9 = *(id *)(a1 + 40);
  id v5 = v2;
  dispatch_async(v4, block);
}

void __70__DNDSettingsService_remoteService_didReceiveUpdatedScheduleSettings___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "settingsService:didReceiveUpdatedScheduleSettings:", *(void *)(a1 + 40), *(void *)(a1 + 48), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (BOOL)_queue_registerForSettingsUpdatesIfRequired
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NSHashTable *)self->_settingsUpdateListeners count] && !self->_registeredForUpdates)
  {
    uint64_t v3 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDSettingsService.registerForSettingsUpdates", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v3, &state);
    uint64_t v4 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
    uint64_t v5 = DNDLogSettings;
    if (os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_19CC2C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Registering settings update listener", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v9 = 0;
    long long v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v15 = 0x3032000000;
    uint64_t v16 = __Block_byref_object_copy__11;
    v17 = __Block_byref_object_dispose__11;
    id v18 = 0;
    uint64_t v6 = +[DNDRemoteServiceConnection sharedInstance];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__DNDSettingsService__queue_registerForSettingsUpdatesIfRequired__block_invoke;
    v8[3] = &unk_1E5910F40;
    void v8[4] = &v9;
    void v8[5] = &buf;
    [v6 registerForSettingsUpdatesWithRequestDetails:v4 completionHandler:v8];

    if (*(void *)(*((void *)&buf + 1) + 40) && os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_ERROR)) {
      -[DNDSettingsService _queue_registerForSettingsUpdatesIfRequired]();
    }
    self->_registeredForUpdates = *((unsigned char *)v10 + 24);
    _Block_object_dispose(&buf, 8);

    _Block_object_dispose(&v9, 8);
    os_activity_scope_leave(&state);
  }
  return ![(NSHashTable *)self->_settingsUpdateListeners count] || self->_registeredForUpdates;
}

void __65__DNDSettingsService__queue_registerForSettingsUpdatesIfRequired__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 BOOLValue];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_globalConfigurationService, 0);
  objc_storeStrong((id *)&self->_modeConfigurationService, 0);
  objc_storeStrong((id *)&self->_settingsUpdateListeners, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (BOOL)addSettingsUpdateListener:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)removeSettingsUpdateListener:(id)a3 error:(id *)a4
{
  return 1;
}

- (void)behaviorSettingsReturningError:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when getting behavior settings, error='%{public}@'");
}

- (void)scheduleSettingsReturningError:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when getting schedule settings, error='%{public}@'");
}

void __70__DNDSettingsService_addSettingsUpdateListener_withCompletionHandler___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_19CC2C000, a2, OS_LOG_TYPE_ERROR, "Did not register for settings updates, will remove listener: listener=%{public}@", (uint8_t *)&v3, 0xCu);
}

- (void)_queue_registerForSettingsUpdatesIfRequired
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when registering settings update listener, error='%{public}@'");
}

@end