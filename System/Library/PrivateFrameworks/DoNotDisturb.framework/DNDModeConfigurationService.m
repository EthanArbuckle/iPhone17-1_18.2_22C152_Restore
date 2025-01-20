@interface DNDModeConfigurationService
+ (id)serviceForClientIdentifier:(id)a3;
- (BOOL)_queue_registerForUpdatesIfRequired;
- (BOOL)canRemoveModeConfigurationForModeIdentifier:(id)a3;
- (BOOL)clearAppActionWithIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 error:(id *)a6;
- (BOOL)clearAppConfigurationActionWithIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 error:(id *)a6;
- (BOOL)clearSystemActionWithIdentifier:(id)a3 forModeIdentifier:(id)a4 error:(id *)a5;
- (BOOL)clearSystemConfigurationActionWithIdentifier:(id)a3 modeIdentifier:(id)a4 error:(id *)a5;
- (BOOL)getSyncAvailableReturningError:(id *)a3;
- (BOOL)getSyncEnabledReturningError:(id *)a3;
- (BOOL)getSyncPreferenceEnabledReturningError:(id *)a3;
- (BOOL)hasActivelyConfiguredModes:(BOOL *)a3 error:(id *)a4;
- (BOOL)hasActivelyConfiguredModesReturningError:(id *)a3;
- (BOOL)isLocalUserAvailableForContactInActiveMode:(id)a3 error:(id *)a4;
- (BOOL)removeModeConfigurationForModeIdentifier:(id)a3 deletePlaceholder:(BOOL)a4 error:(id *)a5;
- (BOOL)removeModeConfigurationForModeIdentifier:(id)a3 error:(id *)a4;
- (BOOL)setAppAction:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 error:(id *)a6;
- (BOOL)setAppConfigurationAction:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 error:(id *)a6;
- (BOOL)setAppConfigurationPredicate:(id)a3 forActionIdentifier:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6 error:(id *)a7;
- (BOOL)setAppConfigurationTargetContentIdentifierPrefix:(id)a3 forActionIdentifier:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6 error:(id *)a7;
- (BOOL)setModeConfiguration:(id)a3 error:(id *)a4;
- (BOOL)setSyncPreferenceEnabled:(BOOL)a3 error:(id *)a4;
- (BOOL)setSystemAction:(id)a3 forModeIdentifier:(id)a4 error:(id *)a5;
- (BOOL)setSystemConfigurationAction:(id)a3 modeIdentifier:(id)a4 error:(id *)a5;
- (BOOL)syncModeConfigurationsReturningError:(id *)a3;
- (NSString)clientIdentifier;
- (id)_createDefaultModeConfigurationForIdentifier:(id)a3 withRequestDetails:(id)a4 error:(id *)a5;
- (id)_createEmptyModeConfigurationForMode:(id)a3 withRequestDetails:(id)a4 error:(id *)a5;
- (id)_createModeSpecificConfigurationForModeSemanticType:(int64_t)a3 withIdentifier:(id)a4;
- (id)_createTriggersForFocusWithIdentifier:(id)a3;
- (id)_initWithClientIdentifier:(id)a3;
- (id)_setModeConfigurationDefaultsForModeConfiguration:(id)a3 withIdentifier:(id)a4;
- (id)allModesReturningError:(id *)a3;
- (id)allowedModesForContactHandle:(id)a3 error:(id *)a4;
- (id)availableModesReturningError:(id *)a3;
- (id)createDefaultDrivingModeConfigurationWithError:(id *)a3;
- (id)createDefaultSleepingModeConfigurationWithError:(id *)a3;
- (id)createDefaultWorkoutModeConfigurationWithError:(id *)a3;
- (id)createEmptyModeConfigurationForMode:(id)a3 error:(id *)a4;
- (id)createModeConfigurationUsingTemplateForModeIdentifier:(id)a3 error:(id *)a4;
- (id)createModeConfigurationUsingTemplateForModeSemanticType:(int64_t)a3 error:(id *)a4;
- (id)getAppActionsForModeIdentifier:(id)a3 error:(id *)a4;
- (id)getAppConfigurationActionsForModeIdentifier:(id)a3 error:(id *)a4;
- (id)getAppConfigurationPredicateForActionIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 error:(id *)a6;
- (id)getAppConfigurationTargetContentIdentifierPrefixesForCurrentModeReturningError:(id *)a3;
- (id)getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:(id)a3 error:(id *)a4;
- (id)getSystemActionsForModeIdentifier:(id)a3 error:(id *)a4;
- (id)getSystemConfigurationActionsForModeIdentifier:(id)a3 error:(id *)a4;
- (id)modeConfigurationForModeIdentifier:(id)a3 error:(id *)a4;
- (id)modeConfigurationsReturningError:(id *)a3;
- (id)publishCurrentStatusKitAvailabilityReturningError:(id *)a3;
- (id)silencedModesForContactHandle:(id)a3 error:(id *)a4;
- (unint64_t)_defaultConfigurationTypeForModeSemanticType:(int64_t)a3;
- (void)_queue_registerForUpdatesIfRequired;
- (void)addListener:(id)a3 withCompletionHandler:(id)a4;
- (void)remoteService:(id)a3 didReceiveAppConfigurationContextUpdateForModeIdentifier:(id)a4;
- (void)remoteService:(id)a3 didReceiveUpdatedAvailableModeIdentifiers:(id)a4;
- (void)removeListener:(id)a3;
@end

@implementation DNDModeConfigurationService

- (id)_initWithClientIdentifier:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DNDModeConfigurationService;
  v5 = [(DNDModeConfigurationService *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.donotdisturb.DNDModeConfigurationService", v8);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.donotdisturb.DNDModeConfigurationService.call-out", v11);
    calloutQueue = v5->_calloutQueue;
    v5->_calloutQueue = (OS_dispatch_queue *)v12;

    uint64_t v14 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    listeners = v5->_listeners;
    v5->_listeners = (NSHashTable *)v14;

    v16 = +[DNDRemoteServiceConnection sharedInstance];
    [v16 addEventListener:v5];
  }
  return v5;
}

void __72__DNDModeConfigurationService_modeConfigurationForModeIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)addListener:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.addListener", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__DNDModeConfigurationService_addListener_withCompletionHandler___block_invoke;
  v13[3] = &unk_1E5911598;
  uint64_t v14 = v8;
  id v15 = v6;
  v16 = self;
  id v17 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_queue_t v12 = v8;
  dispatch_sync(queue, v13);

  os_activity_scope_leave(&state);
}

void __58__DNDModeConfigurationService_serviceForClientIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [(id)serviceForClientIdentifier__serviceByClientIdentifier_3 objectForKey:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v5 = [objc_alloc(*(Class *)(a1 + 48)) _initWithClientIdentifier:*(void *)(a1 + 32)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    v8 = (void *)serviceForClientIdentifier__serviceByClientIdentifier_3;
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [v8 setObject:v10 forKey:v9];
  }
}

void __65__DNDModeConfigurationService_addListener_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  uint64_t v2 = DNDLogModeConfiguration;
  if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = v3;
    _os_log_impl(&dword_19CC2C000, v2, OS_LOG_TYPE_DEFAULT, "Adding update listener: listener=%{public}@", buf, 0xCu);
  }
  [*(id *)(*(void *)(a1 + 48) + 24) addObject:*(void *)(a1 + 40)];
  int v4 = objc_msgSend(*(id *)(a1 + 48), "_queue_registerForUpdatesIfRequired");
  uint64_t v5 = DNDLogModeConfiguration;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v14 = v6;
      _os_log_impl(&dword_19CC2C000, v5, OS_LOG_TYPE_DEFAULT, "Registered for updates: listener=%{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR)) {
      __65__DNDModeConfigurationService_addListener_withCompletionHandler___block_invoke_cold_1((uint64_t *)(a1 + 40), v5);
    }
    [*(id *)(*(void *)(a1 + 48) + 24) removeObject:*(void *)(a1 + 40)];
  }
  id v7 = *(void **)(a1 + 56);
  if (v7)
  {
    v8 = *(NSObject **)(*(void *)(a1 + 48) + 16);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__DNDModeConfigurationService_addListener_withCompletionHandler___block_invoke_56;
    v9[3] = &unk_1E5911058;
    id v10 = v7;
    char v11 = v4;
    dispatch_async(v8, v9);
  }
  os_activity_scope_leave(&state);
}

- (BOOL)_queue_registerForUpdatesIfRequired
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NSHashTable *)self->_listeners count] && !self->_registeredForUpdates)
  {
    uint64_t v3 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.registerForUpdates", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v3, &state);
    int v4 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
    uint64_t v5 = DNDLogSettings;
    if (os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_19CC2C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Registering update listener", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__3;
    id v17 = __Block_byref_object_dispose__3;
    id v18 = 0;
    uint64_t v6 = +[DNDRemoteServiceConnection sharedInstance];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __66__DNDModeConfigurationService__queue_registerForUpdatesIfRequired__block_invoke;
    v8[3] = &unk_1E59115C0;
    v8[4] = &v9;
    v8[5] = &buf;
    [v6 registerForModeSelectionUpdatesWithRequestDetails:v4 completionHandler:v8];

    if (*(void *)(*((void *)&buf + 1) + 40) && os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_ERROR)) {
      -[DNDModeConfigurationService _queue_registerForUpdatesIfRequired]();
    }
    self->_registeredForUpdates = *((unsigned char *)v10 + 24);
    _Block_object_dispose(&buf, 8);

    _Block_object_dispose(&v9, 8);
    os_activity_scope_leave(&state);
  }
  return ![(NSHashTable *)self->_listeners count] || self->_registeredForUpdates;
}

- (id)modeConfigurationForModeIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.getModeConfiguration", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v8 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__3;
  v25 = __Block_byref_object_dispose__3;
  id v26 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__3;
  uint64_t v19 = __Block_byref_object_dispose__3;
  id v20 = 0;
  uint64_t v9 = +[DNDRemoteServiceConnection sharedInstance];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__DNDModeConfigurationService_modeConfigurationForModeIdentifier_error___block_invoke;
  v14[3] = &unk_1E5911480;
  v14[4] = &v21;
  v14[5] = &v15;
  [v9 getModeConfigurationForModeIdentifier:v6 withRequestDetails:v8 completionHandler:v14];

  id v10 = DNDLogModeConfiguration;
  if (v16[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR)) {
      -[DNDModeConfigurationService modeConfigurationsReturningError:]();
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    v29 = v8;
    __int16 v30 = 2114;
    id v31 = v6;
    _os_log_impl(&dword_19CC2C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Get mode configuration, identifier=%{public}@", buf, 0x16u);
  }
  if (a4)
  {
    uint64_t v11 = (void *)v16[5];
    if (v11) {
      *a4 = v11;
    }
  }
  id v12 = (id)v22[5];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  os_activity_scope_leave(&state);

  return v12;
}

uint64_t __65__DNDModeConfigurationService_addListener_withCompletionHandler___block_invoke_56(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

+ (id)serviceForClientIdentifier:(id)a3
{
  id v4 = a3;
  if (serviceForClientIdentifier__onceToken_3 != -1) {
    dispatch_once(&serviceForClientIdentifier__onceToken_3, &__block_literal_global_6);
  }
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  uint64_t v17 = __Block_byref_object_dispose__3;
  id v18 = 0;
  uint64_t v5 = serviceForClientIdentifier__lockQueue_3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__DNDModeConfigurationService_serviceForClientIdentifier___block_invoke_2;
  block[3] = &unk_1E5910F18;
  id v10 = v4;
  uint64_t v11 = &v13;
  id v12 = a1;
  id v6 = v4;
  dispatch_sync(v5, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __66__DNDModeConfigurationService__queue_registerForUpdatesIfRequired__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 BOOLValue];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

uint64_t __58__DNDModeConfigurationService_serviceForClientIdentifier___block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.donotdisturb.DNDModeConfigurationService.service.lock", v0);
  uint64_t v2 = (void *)serviceForClientIdentifier__lockQueue_3;
  serviceForClientIdentifier__lockQueue_3 = (uint64_t)v1;

  uint64_t v3 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:517];
  uint64_t v4 = serviceForClientIdentifier__serviceByClientIdentifier_3;
  serviceForClientIdentifier__serviceByClientIdentifier_3 = v3;
  return MEMORY[0x1F41817F8](v3, v4);
}

- (BOOL)hasActivelyConfiguredModesReturningError:(id *)a3
{
  BOOL v9 = 0;
  id v8 = 0;
  [(DNDModeConfigurationService *)self hasActivelyConfiguredModes:&v9 error:&v8];
  id v4 = v8;
  uint64_t v5 = v4;
  if (a3) {
    *a3 = v4;
  }
  BOOL v6 = v9;

  return v6;
}

- (BOOL)hasActivelyConfiguredModes:(BOOL *)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.hasActivelyConfiguredModes", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  id v8 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__3;
  v35 = __Block_byref_object_dispose__3;
  id v36 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__3;
  v29 = __Block_byref_object_dispose__3;
  id v30 = 0;
  BOOL v9 = +[DNDRemoteServiceConnection sharedInstance];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __64__DNDModeConfigurationService_hasActivelyConfiguredModes_error___block_invoke;
  v24[3] = &unk_1E5911458;
  v24[4] = &v31;
  v24[5] = &v25;
  [v9 getModeConfigurationsWithRequestDetails:v8 completionHandler:v24];

  if (v26[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR)) {
      -[DNDModeConfigurationService hasActivelyConfiguredModes:error:]();
    }
    LOBYTE(v10) = 0;
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = (id)v32[5];
    uint64_t v10 = [v11 countByEnumeratingWithState:&v20 objects:v42 count:16];
    if (v10)
    {
      uint64_t v12 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v11);
          }
          if ((objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "isAutomaticallyGenerated", (void)v20) & 1) == 0)
          {
            LODWORD(v10) = 1;
            goto LABEL_15;
          }
        }
        uint64_t v10 = [v11 countByEnumeratingWithState:&v20 objects:v42 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_15:

    uint64_t v14 = DNDLogModeConfiguration;
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = @"NO";
      if (v10) {
        uint64_t v15 = @"YES";
      }
      *(_DWORD *)long long buf = 138543618;
      v39 = v8;
      __int16 v40 = 2114;
      v41 = v15;
      _os_log_impl(&dword_19CC2C000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Determined if modes have been actively configured, hasActivelyConfiguredModes=%{public}@", buf, 0x16u);
    }
  }
  v16 = v26;
  if (a4)
  {
    uint64_t v17 = (void *)v26[5];
    if (v17)
    {
      *a4 = v17;
      v16 = v26;
    }
  }
  *a3 = v10;
  BOOL v18 = v16[5] == 0;
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  os_activity_scope_leave(&state);

  return v18;
}

void __64__DNDModeConfigurationService_hasActivelyConfiguredModes_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)createModeConfigurationUsingTemplateForModeSemanticType:(int64_t)a3 error:(id *)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  int64_t v5 = a3 - 1;
  if (unint64_t)(a3 - 1) < 9 && ((0x1FDu >> v5))
  {
    id v8 = [(DNDModeConfigurationService *)self createModeConfigurationUsingTemplateForModeIdentifier:off_1E5911630[v5] error:a4];
  }
  else
  {
    if (a4)
    {
      id v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = *MEMORY[0x1E4F28568];
      v11[0] = @"Mode not supported.";
      uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
      *a4 = [v6 errorWithDomain:@"DNDErrorDomain" code:1006 userInfo:v7];
    }
    id v8 = 0;
  }
  return v8;
}

- (BOOL)setModeConfiguration:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.setModeConfiguration", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  id v8 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__3;
  long long v20 = __Block_byref_object_dispose__3;
  id v21 = 0;
  uint64_t v9 = (void *)[v6 copy];
  uint64_t v10 = +[DNDRemoteServiceConnection sharedInstance];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__DNDModeConfigurationService_setModeConfiguration_error___block_invoke;
  v15[3] = &unk_1E5910F40;
  v15[4] = &v22;
  v15[5] = &v16;
  [v10 setModeConfiguration:v9 withRequestDetails:v8 completionHandler:v15];

  id v11 = DNDLogModeConfiguration;
  if (*((unsigned char *)v23 + 24))
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543618;
      v28 = v8;
      __int16 v29 = 2114;
      id v30 = v9;
      _os_log_impl(&dword_19CC2C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set mode configuration, configuration=%{public}@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDModeConfigurationService setModeConfiguration:error:]();
  }
  if (a4)
  {
    uint64_t v12 = (void *)v17[5];
    if (v12) {
      *a4 = v12;
    }
  }
  BOOL v13 = *((unsigned char *)v23 + 24) != 0;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  os_activity_scope_leave(&state);
  return v13;
}

void __58__DNDModeConfigurationService_setModeConfiguration_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 BOOLValue];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (BOOL)removeModeConfigurationForModeIdentifier:(id)a3 error:(id *)a4
{
  return [(DNDModeConfigurationService *)self removeModeConfigurationForModeIdentifier:a3 deletePlaceholder:0 error:a4];
}

- (BOOL)canRemoveModeConfigurationForModeIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.removeModeConfiguration", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v4, &v7);
  int v5 = [v3 isEqualToString:@"com.apple.donotdisturb.mode.default"] ^ 1;
  os_activity_scope_leave(&v7);

  return v5;
}

- (id)modeConfigurationsReturningError:(id *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int v5 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.getModeConfigurations", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  uint64_t v6 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__3;
  long long v23 = __Block_byref_object_dispose__3;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__3;
  uint64_t v17 = __Block_byref_object_dispose__3;
  id v18 = 0;
  os_activity_scope_state_s v7 = +[DNDRemoteServiceConnection sharedInstance];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__DNDModeConfigurationService_modeConfigurationsReturningError___block_invoke;
  v12[3] = &unk_1E5911458;
  v12[4] = &v19;
  v12[5] = &v13;
  [v7 getModeConfigurationsWithRequestDetails:v6 completionHandler:v12];

  id v8 = DNDLogModeConfiguration;
  if (v14[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR)) {
      -[DNDModeConfigurationService modeConfigurationsReturningError:]();
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    uint64_t v27 = v6;
    _os_log_impl(&dword_19CC2C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Get mode configurations", buf, 0xCu);
  }
  if (a3)
  {
    uint64_t v9 = (void *)v14[5];
    if (v9) {
      *a3 = v9;
    }
  }
  id v10 = (id)v20[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  os_activity_scope_leave(&state);

  return v10;
}

void __64__DNDModeConfigurationService_modeConfigurationsReturningError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  os_activity_scope_state_s v7 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "mode", (void)v21);
        uint64_t v15 = [v14 modeIdentifier];
        [v7 setObject:v13 forKeyedSubscript:v15];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v7;
  id v18 = v7;

  uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v6;
}

- (BOOL)isLocalUserAvailableForContactInActiveMode:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_activity_scope_state_s v7 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.getIsLocalUserAvailable", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  id v8 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__3;
  long long v20 = __Block_byref_object_dispose__3;
  id v21 = 0;
  uint64_t v9 = +[DNDRemoteServiceConnection sharedInstance];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__DNDModeConfigurationService_isLocalUserAvailableForContactInActiveMode_error___block_invoke;
  v15[3] = &unk_1E5910F40;
  v15[4] = &v22;
  v15[5] = &v16;
  [v9 getUserAvailabilityInActiveModeForContactHandle:v6 withRequestDetails:v8 completionHandler:v15];

  if (v17[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR)) {
      -[DNDModeConfigurationService isLocalUserAvailableForContactInActiveMode:error:]();
    }
  }
  else
  {
    uint64_t v10 = (id)DNDLogModeConfiguration;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [NSNumber numberWithBool:*((unsigned __int8 *)v23 + 24)];
      *(_DWORD *)long long buf = 138543875;
      uint64_t v28 = v8;
      __int16 v29 = 2114;
      id v30 = v11;
      __int16 v31 = 2113;
      id v32 = v6;
      _os_log_impl(&dword_19CC2C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Get user availability in current mode for contact, availability=%{public}@, handle=%{private}@", buf, 0x20u);
    }
  }
  if (a4)
  {
    uint64_t v12 = (void *)v17[5];
    if (v12) {
      *a4 = v12;
    }
  }
  BOOL v13 = *((unsigned char *)v23 + 24) != 0;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  os_activity_scope_leave(&state);

  return v13;
}

void __80__DNDModeConfigurationService_isLocalUserAvailableForContactInActiveMode_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 BOOLValue];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  os_activity_scope_state_s v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)allowedModesForContactHandle:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_activity_scope_state_s v7 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.getAllowedModesForContact", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  id v8 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__3;
  char v25 = __Block_byref_object_dispose__3;
  id v26 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__3;
  uint64_t v19 = __Block_byref_object_dispose__3;
  id v20 = 0;
  uint64_t v9 = +[DNDRemoteServiceConnection sharedInstance];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__DNDModeConfigurationService_allowedModesForContactHandle_error___block_invoke;
  v14[3] = &unk_1E5911458;
  v14[4] = &v21;
  v14[5] = &v15;
  [v9 getAllowedModesForContactHandle:v6 withRequestDetails:v8 completionHandler:v14];

  uint64_t v10 = DNDLogModeConfiguration;
  if (v16[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR)) {
      -[DNDModeConfigurationService allowedModesForContactHandle:error:]();
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543619;
    __int16 v29 = v8;
    __int16 v30 = 2113;
    id v31 = v6;
    _os_log_impl(&dword_19CC2C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Get allowed modes for contact, handle=%{private}@", buf, 0x16u);
  }
  if (a4)
  {
    uint64_t v11 = (void *)v16[5];
    if (v11) {
      *a4 = v11;
    }
  }
  id v12 = (id)v22[5];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  os_activity_scope_leave(&state);

  return v12;
}

void __66__DNDModeConfigurationService_allowedModesForContactHandle_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)silencedModesForContactHandle:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.getSilencedModesForContact", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  id v8 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__3;
  char v25 = __Block_byref_object_dispose__3;
  id v26 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__3;
  uint64_t v19 = __Block_byref_object_dispose__3;
  id v20 = 0;
  uint64_t v9 = +[DNDRemoteServiceConnection sharedInstance];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__DNDModeConfigurationService_silencedModesForContactHandle_error___block_invoke;
  v14[3] = &unk_1E5911458;
  v14[4] = &v21;
  v14[5] = &v15;
  [v9 getSilencedModesForContactHandle:v6 withRequestDetails:v8 completionHandler:v14];

  uint64_t v10 = DNDLogModeConfiguration;
  if (v16[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR)) {
      -[DNDModeConfigurationService silencedModesForContactHandle:error:]();
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543619;
    __int16 v29 = v8;
    __int16 v30 = 2113;
    id v31 = v6;
    _os_log_impl(&dword_19CC2C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Get silenced modes for contact, handle=%{private}@", buf, 0x16u);
  }
  if (a4)
  {
    id v11 = (void *)v16[5];
    if (v11) {
      *a4 = v11;
    }
  }
  id v12 = (id)v22[5];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  os_activity_scope_leave(&state);

  return v12;
}

void __67__DNDModeConfigurationService_silencedModesForContactHandle_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)publishCurrentStatusKitAvailabilityReturningError:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.publishCurrentStatusKitAvailability", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__3;
  uint64_t v24 = __Block_byref_object_dispose__3;
  id v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__3;
  uint64_t v18 = __Block_byref_object_dispose__3;
  id v19 = 0;
  uint64_t v7 = +[DNDRemoteServiceConnection sharedInstance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__DNDModeConfigurationService_publishCurrentStatusKitAvailabilityReturningError___block_invoke;
  v13[3] = &unk_1E59114A8;
  void v13[4] = &v20;
  v13[5] = &v14;
  [v7 publishStatusKitAvailabilityWithRequestDetails:v6 completionHandler:v13];

  id v8 = DNDLogModeConfiguration;
  if (v15[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR)) {
      -[DNDModeConfigurationService publishCurrentStatusKitAvailabilityReturningError:]();
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v21[5];
    *(_DWORD *)long long buf = 138543618;
    uint64_t v28 = v6;
    __int16 v29 = 2114;
    uint64_t v30 = v9;
    _os_log_impl(&dword_19CC2C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request to publish statuskit availability succeeded: %{public}@", buf, 0x16u);
  }
  if (a3)
  {
    uint64_t v10 = (void *)v15[5];
    if (v10) {
      *a3 = v10;
    }
  }
  id v11 = (id)v21[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  os_activity_scope_leave(&state);

  return v11;
}

void __81__DNDModeConfigurationService_publishCurrentStatusKitAvailabilityReturningError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)allModesReturningError:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.allModes", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__3;
  uint64_t v24 = __Block_byref_object_dispose__3;
  id v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__3;
  uint64_t v18 = __Block_byref_object_dispose__3;
  id v19 = 0;
  uint64_t v7 = +[DNDRemoteServiceConnection sharedInstance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__DNDModeConfigurationService_allModesReturningError___block_invoke;
  v13[3] = &unk_1E59114D0;
  void v13[4] = &v20;
  v13[5] = &v14;
  [v7 getAllModesWithRequestDetails:v6 completionHandler:v13];

  if (a3)
  {
    id v8 = (void *)v15[5];
    if (v8) {
      *a3 = v8;
    }
  }
  uint64_t v9 = DNDLogModeConfiguration;
  if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = v21[5];
    *(_DWORD *)long long buf = 138543618;
    uint64_t v28 = v6;
    __int16 v29 = 2114;
    uint64_t v30 = v10;
    _os_log_impl(&dword_19CC2C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got all modes, modes=%{public}@", buf, 0x16u);
  }
  id v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v21[5]];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  os_activity_scope_leave(&state);

  return v11;
}

void __54__DNDModeConfigurationService_allModesReturningError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)availableModesReturningError:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.availableModes", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__3;
  uint64_t v24 = __Block_byref_object_dispose__3;
  id v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__3;
  uint64_t v18 = __Block_byref_object_dispose__3;
  id v19 = 0;
  uint64_t v7 = +[DNDRemoteServiceConnection sharedInstance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__DNDModeConfigurationService_availableModesReturningError___block_invoke;
  v13[3] = &unk_1E59114D0;
  void v13[4] = &v20;
  v13[5] = &v14;
  [v7 getAvailableModesWithRequestDetails:v6 completionHandler:v13];

  if (a3)
  {
    id v8 = (void *)v15[5];
    if (v8) {
      *a3 = v8;
    }
  }
  uint64_t v9 = DNDLogModeConfiguration;
  if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = v21[5];
    *(_DWORD *)long long buf = 138543618;
    uint64_t v28 = v6;
    __int16 v29 = 2114;
    uint64_t v30 = v10;
    _os_log_impl(&dword_19CC2C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got available modes, modes=%{public}@", buf, 0x16u);
  }
  id v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v21[5]];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  os_activity_scope_leave(&state);

  return v11;
}

void __60__DNDModeConfigurationService_availableModesReturningError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)setAppConfigurationPredicate:(id)a3 forActionIdentifier:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6 error:(id *)a7
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.setAppConfigurationPredicate", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v16, &state);
  uint64_t v17 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__3;
  uint64_t v28 = __Block_byref_object_dispose__3;
  id v29 = 0;
  uint64_t v18 = +[DNDRemoteServiceConnection sharedInstance];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __126__DNDModeConfigurationService_setAppConfigurationPredicate_forActionIdentifier_forApplicationIdentifier_modeIdentifier_error___block_invoke;
  v23[3] = &unk_1E5910F40;
  v23[4] = &v30;
  v23[5] = &v24;
  [v18 setAppConfigurationPredicate:v12 forActionIdentifier:v13 forApplicationIdentifier:v14 modeIdentifier:v15 withRequestDetails:v17 completionHandler:v23];

  id v19 = DNDLogModeConfiguration;
  if (*((unsigned char *)v31 + 24))
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138544130;
      id v36 = v17;
      __int16 v37 = 2114;
      id v38 = v12;
      __int16 v39 = 2114;
      id v40 = v14;
      __int16 v41 = 2114;
      id v42 = v15;
      _os_log_impl(&dword_19CC2C000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set app configuration predicate, predicate=%{public}@ applicationIdentifier=%{public}@ modeIdentifier=%{public}@", buf, 0x2Au);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDModeConfigurationService setAppConfigurationPredicate:forActionIdentifier:forApplicationIdentifier:modeIdentifier:error:]();
  }
  if (a7)
  {
    uint64_t v20 = (void *)v25[5];
    if (v20) {
      *a7 = v20;
    }
  }
  BOOL v21 = *((unsigned char *)v31 + 24) != 0;
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  os_activity_scope_leave(&state);

  return v21;
}

void __126__DNDModeConfigurationService_setAppConfigurationPredicate_forActionIdentifier_forApplicationIdentifier_modeIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 BOOLValue];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)getAppConfigurationPredicateForActionIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 error:(id *)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.getAppConfigurationPredicate", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  id v14 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__3;
  uint64_t v32 = __Block_byref_object_dispose__3;
  id v33 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__3;
  uint64_t v26 = __Block_byref_object_dispose__3;
  id v27 = 0;
  id v15 = +[DNDRemoteServiceConnection sharedInstance];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __125__DNDModeConfigurationService_getAppConfigurationPredicateForActionIdentifier_forApplicationIdentifier_modeIdentifier_error___block_invoke;
  v21[3] = &unk_1E59114F8;
  v21[4] = &v28;
  v21[5] = &v22;
  [v15 getAppConfigurationPredicateForActionIdentifier:v10 forApplicationIdentifier:v11 modeIdentifier:v12 withRequestDetails:v14 completionHandler:v21];

  uint64_t v16 = DNDLogModeConfiguration;
  if (v23[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR)) {
      -[DNDModeConfigurationService getAppConfigurationPredicateForActionIdentifier:forApplicationIdentifier:modeIdentifier:error:]();
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = v29[5];
    *(_DWORD *)long long buf = 138544130;
    id v36 = v14;
    __int16 v37 = 2114;
    uint64_t v38 = v17;
    __int16 v39 = 2114;
    id v40 = v11;
    __int16 v41 = 2114;
    id v42 = v12;
    _os_log_impl(&dword_19CC2C000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got app configuration predicate, predicate=%{public}@ applicationIdentifier=%{public}@ modeIdentifier=%{public}@", buf, 0x2Au);
  }
  if (a6)
  {
    uint64_t v18 = (void *)v23[5];
    if (v18) {
      *a6 = v18;
    }
  }
  id v19 = (id)v29[5];
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  os_activity_scope_leave(&state);

  return v19;
}

void __125__DNDModeConfigurationService_getAppConfigurationPredicateForActionIdentifier_forApplicationIdentifier_modeIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)setAppConfigurationTargetContentIdentifierPrefix:(id)a3 forActionIdentifier:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6 error:(id *)a7
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.setAppConfigurationTargetContentIdentifierPrefix", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v16, &state);
  uint64_t v17 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__3;
  uint64_t v28 = __Block_byref_object_dispose__3;
  id v29 = 0;
  uint64_t v18 = +[DNDRemoteServiceConnection sharedInstance];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __146__DNDModeConfigurationService_setAppConfigurationTargetContentIdentifierPrefix_forActionIdentifier_forApplicationIdentifier_modeIdentifier_error___block_invoke;
  v23[3] = &unk_1E5910F40;
  v23[4] = &v30;
  v23[5] = &v24;
  [v18 setAppConfigurationTargetContentIdentifierPrefix:v12 forActionIdentifier:v13 forApplicationIdentifier:v14 modeIdentifier:v15 withRequestDetails:v17 completionHandler:v23];

  id v19 = DNDLogModeConfiguration;
  if (*((unsigned char *)v31 + 24))
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138544130;
      id v36 = v17;
      __int16 v37 = 2114;
      id v38 = v12;
      __int16 v39 = 2114;
      id v40 = v14;
      __int16 v41 = 2114;
      id v42 = v15;
      _os_log_impl(&dword_19CC2C000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set target content identifier prefix, prefix=%{public}@ applicationIdentifier=%{public}@ modeIdentifier=%{public}@", buf, 0x2Au);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDModeConfigurationService setAppConfigurationTargetContentIdentifierPrefix:forActionIdentifier:forApplicationIdentifier:modeIdentifier:error:]();
  }
  if (a7)
  {
    uint64_t v20 = (void *)v25[5];
    if (v20) {
      *a7 = v20;
    }
  }
  BOOL v21 = *((unsigned char *)v31 + 24) != 0;
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  os_activity_scope_leave(&state);

  return v21;
}

void __146__DNDModeConfigurationService_setAppConfigurationTargetContentIdentifierPrefix_forActionIdentifier_forApplicationIdentifier_modeIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 BOOLValue];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.getAppConfigurationTargetContentIdentifierPrefixes", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  id v8 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__3;
  uint64_t v26 = __Block_byref_object_dispose__3;
  id v27 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__3;
  uint64_t v20 = __Block_byref_object_dispose__3;
  id v21 = 0;
  uint64_t v9 = +[DNDRemoteServiceConnection sharedInstance];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __105__DNDModeConfigurationService_getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier_error___block_invoke;
  v15[3] = &unk_1E5911520;
  v15[4] = &v22;
  v15[5] = &v16;
  [v9 getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:v6 withRequestDetails:v8 completionHandler:v15];

  if (v23[5])
  {
    id v10 = (id)DNDLogModeConfiguration;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend((id)v23[5], "count"));
      *(_DWORD *)long long buf = 138543874;
      uint64_t v30 = v8;
      __int16 v31 = 2112;
      uint64_t v32 = v11;
      __int16 v33 = 2114;
      id v34 = v6;
      _os_log_impl(&dword_19CC2C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got %@ target content identifier prefixes for modeIdentifier %{public}@", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDModeConfigurationService getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:error:]();
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

void __105__DNDModeConfigurationService_getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 appConfigurationTargetContentIdentifierPrefixesForModeIdentifier];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

- (id)getAppConfigurationTargetContentIdentifierPrefixesForCurrentModeReturningError:(id *)a3
{
  return [(DNDModeConfigurationService *)self getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:@"com.apple.focus.current-sentinel" error:a3];
}

- (BOOL)setAppConfigurationAction:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.setAppConfigurationAction", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v16.opaque[0] = 0;
  v16.opaque[1] = 0;
  os_activity_scope_enter(v13, &v16);
  id v14 = [[DNDAppAction alloc] initWithAction:v10 enabled:1];
  LOBYTE(a6) = [(DNDModeConfigurationService *)self setAppAction:v14 forApplicationIdentifier:v11 modeIdentifier:v12 error:a6];

  os_activity_scope_leave(&v16);
  return (char)a6;
}

- (BOOL)clearAppConfigurationActionWithIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.clearAppConfigurationAction", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v15.opaque[0] = 0;
  v15.opaque[1] = 0;
  os_activity_scope_enter(v13, &v15);
  LOBYTE(a6) = [(DNDModeConfigurationService *)self clearAppActionWithIdentifier:v10 forApplicationIdentifier:v11 modeIdentifier:v12 error:a6];
  os_activity_scope_leave(&v15);

  return (char)a6;
}

- (id)getAppConfigurationActionsForModeIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v25 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.getAppConfigurationActions", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v25, &state);
  uint64_t v24 = v6;
  uint64_t v7 = [(DNDModeConfigurationService *)self getAppActionsForModeIdentifier:v6 error:a4];
  id v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v10)
  {
    uint64_t v26 = *(void *)v33;
    do
    {
      uint64_t v27 = v10;
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v33 != v26) {
          objc_enumerationMutation(v9);
        }
        uint64_t v12 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        id v13 = [v9 objectForKeyedSubscript:v12];
        id v14 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v13, "count"));
        [v8 setObject:v14 forKeyedSubscript:v12];

        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v15 = v13;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v37 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v29;
          do
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v29 != v17) {
                objc_enumerationMutation(v15);
              }
              id v19 = *(void **)(*((void *)&v28 + 1) + 8 * j);
              uint64_t v20 = [v19 action];

              if (v20)
              {
                id v21 = [v8 objectForKeyedSubscript:v12];
                uint64_t v22 = [v19 action];
                [v21 addObject:v22];
              }
            }
            uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v37 count:16];
          }
          while (v16);
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v10);
  }

  os_activity_scope_leave(&state);
  return v8;
}

- (BOOL)setAppAction:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 error:(id *)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.setAppAction", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  id v14 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__3;
  id v25 = __Block_byref_object_dispose__3;
  id v26 = 0;
  id v15 = +[DNDRemoteServiceConnection sharedInstance];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __90__DNDModeConfigurationService_setAppAction_forApplicationIdentifier_modeIdentifier_error___block_invoke;
  v20[3] = &unk_1E5910F40;
  v20[4] = &v27;
  v20[5] = &v21;
  [v15 setAppAction:v10 forApplicationIdentifier:v11 modeIdentifier:v12 withRequestDetails:v14 completionHandler:v20];

  uint64_t v16 = DNDLogModeConfiguration;
  if (*((unsigned char *)v28 + 24))
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543874;
      long long v33 = v14;
      __int16 v34 = 2114;
      id v35 = v10;
      __int16 v36 = 2114;
      id v37 = v12;
      _os_log_impl(&dword_19CC2C000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set app action, action=%{public}@; modeIdentifier=%{public}@",
        buf,
        0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDModeConfigurationService setAppAction:forApplicationIdentifier:modeIdentifier:error:]();
  }
  if (a6)
  {
    uint64_t v17 = (void *)v22[5];
    if (v17) {
      *a6 = v17;
    }
  }
  BOOL v18 = *((unsigned char *)v28 + 24) != 0;
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  os_activity_scope_leave(&state);

  return v18;
}

void __90__DNDModeConfigurationService_setAppAction_forApplicationIdentifier_modeIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 BOOLValue];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (BOOL)clearAppActionWithIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 error:(id *)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.clearAppAction", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  id v14 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__3;
  id v25 = __Block_byref_object_dispose__3;
  id v26 = 0;
  id v15 = +[DNDRemoteServiceConnection sharedInstance];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __106__DNDModeConfigurationService_clearAppActionWithIdentifier_forApplicationIdentifier_modeIdentifier_error___block_invoke;
  v20[3] = &unk_1E5910F40;
  v20[4] = &v27;
  v20[5] = &v21;
  [v15 clearAppActionWithIdentifier:v10 forApplicationIdentifier:v11 modeIdentifier:v12 withRequestDetails:v14 completionHandler:v20];

  uint64_t v16 = DNDLogModeConfiguration;
  if (*((unsigned char *)v28 + 24))
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138544130;
      long long v33 = v14;
      __int16 v34 = 2114;
      id v35 = v10;
      __int16 v36 = 2114;
      id v37 = v11;
      __int16 v38 = 2114;
      id v39 = v12;
      _os_log_impl(&dword_19CC2C000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Clear app action, identifier=%{public}@ applicationIdentifier=%{public}@ modeIdentifier=%{public}@", buf, 0x2Au);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDModeConfigurationService clearAppActionWithIdentifier:forApplicationIdentifier:modeIdentifier:error:]();
  }
  if (a6)
  {
    uint64_t v17 = (void *)v22[5];
    if (v17) {
      *a6 = v17;
    }
  }
  BOOL v18 = *((unsigned char *)v28 + 24) != 0;
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  os_activity_scope_leave(&state);

  return v18;
}

void __106__DNDModeConfigurationService_clearAppActionWithIdentifier_forApplicationIdentifier_modeIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 BOOLValue];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)getAppActionsForModeIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.getAppActionsForModeIdentifier", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  id v8 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__3;
  uint64_t v27 = __Block_byref_object_dispose__3;
  id v28 = 0;
  uint64_t v17 = 0;
  BOOL v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__3;
  uint64_t v21 = __Block_byref_object_dispose__3;
  id v22 = 0;
  id v9 = +[DNDRemoteServiceConnection sharedInstance];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __68__DNDModeConfigurationService_getAppActionsForModeIdentifier_error___block_invoke;
  v16[3] = &unk_1E5911548;
  v16[4] = &v23;
  v16[5] = &v17;
  [v9 getAppActionsForModeIdentifier:v6 withRequestDetails:v8 completionHandler:v16];

  if (v24[5])
  {
    id v10 = (id)DNDLogModeConfiguration;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend((id)v24[5], "count"));
      uint64_t v12 = v24[5];
      *(_DWORD *)long long buf = 138544130;
      long long v31 = v8;
      __int16 v32 = 2112;
      long long v33 = v11;
      __int16 v34 = 2114;
      id v35 = v6;
      __int16 v36 = 2112;
      uint64_t v37 = v12;
      _os_log_impl(&dword_19CC2C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got %@ app actions for modeIdentifier %{public}@. actions = %@", buf, 0x2Au);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDModeConfigurationService getAppActionsForModeIdentifier:error:]();
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

void __68__DNDModeConfigurationService_getAppActionsForModeIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 appActionsForModeIdentifier];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

- (BOOL)setSystemAction:(id)a3 forModeIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.setSystemAction", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  id v11 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__3;
  id v22 = __Block_byref_object_dispose__3;
  id v23 = 0;
  uint64_t v12 = +[DNDRemoteServiceConnection sharedInstance];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __71__DNDModeConfigurationService_setSystemAction_forModeIdentifier_error___block_invoke;
  v17[3] = &unk_1E5910F40;
  v17[4] = &v24;
  v17[5] = &v18;
  [v12 setSystemAction:v8 forModeIdentifier:v9 withRequestDetails:v11 completionHandler:v17];

  id v13 = DNDLogModeConfiguration;
  if (*((unsigned char *)v25 + 24))
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543874;
      char v30 = v11;
      __int16 v31 = 2114;
      id v32 = v8;
      __int16 v33 = 2114;
      id v34 = v9;
      _os_log_impl(&dword_19CC2C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set system action, action=%{public}@; modeIdentifier=%{public}@",
        buf,
        0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDModeConfigurationService setSystemAction:forModeIdentifier:error:]();
  }
  if (a5)
  {
    id v14 = (void *)v19[5];
    if (v14) {
      *a5 = v14;
    }
  }
  BOOL v15 = *((unsigned char *)v25 + 24) != 0;
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  os_activity_scope_leave(&state);

  return v15;
}

void __71__DNDModeConfigurationService_setSystemAction_forModeIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 BOOLValue];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (BOOL)clearSystemActionWithIdentifier:(id)a3 forModeIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.clearSystemAction", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  id v11 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__3;
  id v22 = __Block_byref_object_dispose__3;
  id v23 = 0;
  uint64_t v12 = +[DNDRemoteServiceConnection sharedInstance];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __87__DNDModeConfigurationService_clearSystemActionWithIdentifier_forModeIdentifier_error___block_invoke;
  v17[3] = &unk_1E5910F40;
  v17[4] = &v24;
  v17[5] = &v18;
  [v12 clearSystemActionWithIdentifier:v8 forModeIdentifier:v9 withRequestDetails:v11 completionHandler:v17];

  id v13 = DNDLogModeConfiguration;
  if (*((unsigned char *)v25 + 24))
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543874;
      char v30 = v11;
      __int16 v31 = 2114;
      id v32 = v8;
      __int16 v33 = 2114;
      id v34 = v9;
      _os_log_impl(&dword_19CC2C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Clear system action, identifier=%{public}@ modeIdentifier=%{public}@", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDModeConfigurationService clearSystemActionWithIdentifier:forModeIdentifier:error:]();
  }
  if (a5)
  {
    id v14 = (void *)v19[5];
    if (v14) {
      *a5 = v14;
    }
  }
  BOOL v15 = *((unsigned char *)v25 + 24) != 0;
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  os_activity_scope_leave(&state);

  return v15;
}

void __87__DNDModeConfigurationService_clearSystemActionWithIdentifier_forModeIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 BOOLValue];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)getSystemActionsForModeIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.getSystemActionsForModeIdentifier", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  id v8 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__3;
  uint64_t v26 = __Block_byref_object_dispose__3;
  id v27 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__3;
  uint64_t v20 = __Block_byref_object_dispose__3;
  id v21 = 0;
  id v9 = +[DNDRemoteServiceConnection sharedInstance];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__DNDModeConfigurationService_getSystemActionsForModeIdentifier_error___block_invoke;
  v15[3] = &unk_1E5911570;
  v15[4] = &v22;
  v15[5] = &v16;
  [v9 getSystemActionsForModeIdentifier:v6 withRequestDetails:v8 completionHandler:v15];

  if (v23[5])
  {
    id v10 = (id)DNDLogModeConfiguration;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend((id)v23[5], "count"));
      *(_DWORD *)long long buf = 138543874;
      char v30 = v8;
      __int16 v31 = 2112;
      id v32 = v11;
      __int16 v33 = 2114;
      id v34 = v6;
      _os_log_impl(&dword_19CC2C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got %@ system actions for modeIdentifier %{public}@", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDModeConfigurationService getSystemActionsForModeIdentifier:error:]();
  }
  if (a4)
  {
    uint64_t v12 = (void *)v17[5];
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

void __71__DNDModeConfigurationService_getSystemActionsForModeIdentifier_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithArray:a2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

- (BOOL)setSystemConfigurationAction:(id)a3 modeIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.setSystemConfigurationAction", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v10, &v13);
  id v11 = [[DNDSystemAction alloc] initWithAction:v8 enabled:1];
  LOBYTE(a5) = [(DNDModeConfigurationService *)self setSystemAction:v11 forModeIdentifier:v9 error:a5];

  os_activity_scope_leave(&v13);
  return (char)a5;
}

- (BOOL)clearSystemConfigurationActionWithIdentifier:(id)a3 modeIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.clearSystemConfigurationAction", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v10, &v12);
  LOBYTE(a5) = [(DNDModeConfigurationService *)self clearSystemActionWithIdentifier:v8 forModeIdentifier:v9 error:a5];
  os_activity_scope_leave(&v12);

  return (char)a5;
}

- (id)getSystemConfigurationActionsForModeIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.getSystemConfigurationActions", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  id v8 = [(DNDModeConfigurationService *)self getSystemActionsForModeIdentifier:v6 error:a4];
  id v9 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v8, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        BOOL v15 = objc_msgSend(v14, "action", (void)v18);

        if (v15)
        {
          uint64_t v16 = [v14 action];
          [v9 addObject:v16];
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v11);
  }

  os_activity_scope_leave(&state);
  return v9;
}

- (BOOL)getSyncPreferenceEnabledReturningError:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.getSyncPreferenceEnabled", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy__3;
  long long v19 = __Block_byref_object_dispose__3;
  id v20 = 0;
  uint64_t v7 = +[DNDRemoteServiceConnection sharedInstance];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__DNDModeConfigurationService_getSyncPreferenceEnabledReturningError___block_invoke;
  v14[3] = &unk_1E5910F40;
  v14[4] = &v21;
  v14[5] = &v15;
  [v7 getCloudSyncStateWithRequestDetails:v6 completionHandler:v14];

  id v8 = v16;
  if (a3)
  {
    id v9 = (void *)v16[5];
    if (v9)
    {
      *a3 = v9;
      id v8 = v16;
    }
  }
  if (v8[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR)) {
      -[DNDModeConfigurationService getSyncPreferenceEnabledReturningError:]();
    }
  }
  else
  {
    id v10 = (id)DNDLogModeConfiguration;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [NSNumber numberWithBool:*((unsigned __int8 *)v22 + 24)];
      *(_DWORD *)long long buf = 138543618;
      id v27 = v6;
      __int16 v28 = 2114;
      uint64_t v29 = v11;
      _os_log_impl(&dword_19CC2C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got sync preference enabled=%{public}@", buf, 0x16u);
    }
  }
  BOOL v12 = *((unsigned char *)v22 + 24) != 0;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  os_activity_scope_leave(&state);

  return v12;
}

void __70__DNDModeConfigurationService_getSyncPreferenceEnabledReturningError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 unsignedIntegerValue] & 1;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (BOOL)getSyncAvailableReturningError:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.getSyncAvailable", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  uint64_t v6 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy__3;
  long long v19 = __Block_byref_object_dispose__3;
  id v20 = 0;
  uint64_t v7 = +[DNDRemoteServiceConnection sharedInstance];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__DNDModeConfigurationService_getSyncAvailableReturningError___block_invoke;
  v14[3] = &unk_1E5910F40;
  v14[4] = &v21;
  v14[5] = &v15;
  [v7 getCloudSyncStateWithRequestDetails:v6 completionHandler:v14];

  id v8 = v16;
  if (a3)
  {
    id v9 = (void *)v16[5];
    if (v9)
    {
      *a3 = v9;
      id v8 = v16;
    }
  }
  if (v8[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR)) {
      -[DNDModeConfigurationService getSyncAvailableReturningError:]();
    }
  }
  else
  {
    id v10 = (id)DNDLogModeConfiguration;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [NSNumber numberWithBool:*((unsigned __int8 *)v22 + 24)];
      *(_DWORD *)long long buf = 138543618;
      id v27 = v6;
      __int16 v28 = 2114;
      uint64_t v29 = v11;
      _os_log_impl(&dword_19CC2C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got sync available=%{public}@", buf, 0x16u);
    }
  }
  BOOL v12 = *((unsigned char *)v22 + 24) != 0;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  os_activity_scope_leave(&state);

  return v12;
}

void __62__DNDModeConfigurationService_getSyncAvailableReturningError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = (~[a2 unsignedIntegerValue] & 0xE) == 0;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (BOOL)getSyncEnabledReturningError:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.getSyncEnabled", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  uint64_t v6 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy__3;
  long long v19 = __Block_byref_object_dispose__3;
  id v20 = 0;
  uint64_t v7 = +[DNDRemoteServiceConnection sharedInstance];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__DNDModeConfigurationService_getSyncEnabledReturningError___block_invoke;
  v14[3] = &unk_1E5910F40;
  v14[4] = &v21;
  v14[5] = &v15;
  [v7 getCloudSyncStateWithRequestDetails:v6 completionHandler:v14];

  id v8 = v16;
  if (a3)
  {
    id v9 = (void *)v16[5];
    if (v9)
    {
      *a3 = v9;
      id v8 = v16;
    }
  }
  if (v8[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR)) {
      -[DNDModeConfigurationService getSyncEnabledReturningError:]();
    }
  }
  else
  {
    id v10 = (id)DNDLogModeConfiguration;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [NSNumber numberWithBool:*((unsigned __int8 *)v22 + 24)];
      *(_DWORD *)long long buf = 138543618;
      id v27 = v6;
      __int16 v28 = 2114;
      uint64_t v29 = v11;
      _os_log_impl(&dword_19CC2C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got sync enabled=%{public}@", buf, 0x16u);
    }
  }
  BOOL v12 = *((unsigned char *)v22 + 24) != 0;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  os_activity_scope_leave(&state);

  return v12;
}

void __60__DNDModeConfigurationService_getSyncEnabledReturningError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 unsignedIntegerValue] & 1;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (BOOL)setSyncPreferenceEnabled:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.setSyncPreferenceEnabled", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  id v8 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v23 = 0;
  char v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__3;
  uint64_t v21 = __Block_byref_object_dispose__3;
  id v22 = 0;
  id v9 = +[DNDRemoteServiceConnection sharedInstance];
  id v10 = [NSNumber numberWithBool:v5];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __62__DNDModeConfigurationService_setSyncPreferenceEnabled_error___block_invoke;
  v16[3] = &unk_1E5910F40;
  v16[4] = &v23;
  v16[5] = &v17;
  [v9 setCloudSyncPreferenceEnabled:v10 withRequestDetails:v8 completionHandler:v16];

  if (a4)
  {
    uint64_t v11 = (void *)v18[5];
    if (v11) {
      *a4 = v11;
    }
  }
  if (*((unsigned char *)v24 + 24))
  {
    BOOL v12 = (id)DNDLogModeConfiguration;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      os_activity_scope_state_s v13 = [NSNumber numberWithBool:v5];
      *(_DWORD *)long long buf = 138543618;
      uint64_t v29 = v8;
      __int16 v30 = 2114;
      __int16 v31 = v13;
      _os_log_impl(&dword_19CC2C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set sync preference enabled=%{public}@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDModeConfigurationService setSyncPreferenceEnabled:error:]();
  }
  BOOL v14 = *((unsigned char *)v24 + 24) != 0;
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  os_activity_scope_leave(&state);

  return v14;
}

void __62__DNDModeConfigurationService_setSyncPreferenceEnabled_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 BOOLValue];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)removeListener:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.removeListener", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__DNDModeConfigurationService_removeListener___block_invoke;
  block[3] = &unk_1E59110A8;
  id v10 = v5;
  id v11 = v4;
  BOOL v12 = self;
  id v7 = v4;
  id v8 = v5;
  dispatch_sync(queue, block);

  os_activity_scope_leave(&state);
}

void __46__DNDModeConfigurationService_removeListener___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v4);
  uint64_t v2 = DNDLogModeConfiguration;
  if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19CC2C000, v2, OS_LOG_TYPE_DEFAULT, "Removing update listener: listener=%{public}@", buf, 0xCu);
  }
  [*(id *)(*(void *)(a1 + 48) + 24) removeObject:*(void *)(a1 + 40)];
  os_activity_scope_leave(&v4);
}

- (void)remoteService:(id)a3 didReceiveUpdatedAvailableModeIdentifiers:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__DNDModeConfigurationService_remoteService_didReceiveUpdatedAvailableModeIdentifiers___block_invoke;
  v8[3] = &unk_1E5911080;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_sync(queue, v8);
}

void __87__DNDModeConfigurationService_remoteService_didReceiveUpdatedAvailableModeIdentifiers___block_invoke(int8x16_t *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = DNDLogModeConfiguration;
  if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[2].i64[0];
    *(_DWORD *)long long buf = 138543362;
    uint64_t v13 = v3;
    _os_log_impl(&dword_19CC2C000, v2, OS_LOG_TYPE_DEFAULT, "received updated available mode identifiers: identifiers=%{public}@", buf, 0xCu);
  }
  os_activity_scope_state_s v4 = (void *)[*(id *)(a1[2].i64[1] + 24) copy];
  id v5 = *(NSObject **)(a1[2].i64[1] + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__DNDModeConfigurationService_remoteService_didReceiveUpdatedAvailableModeIdentifiers___block_invoke_57;
  block[3] = &unk_1E59110A8;
  id v10 = v4;
  int8x16_t v8 = a1[2];
  id v6 = (id)v8.i64[0];
  int8x16_t v11 = vextq_s8(v8, v8, 8uLL);
  id v7 = v4;
  dispatch_async(v5, block);
}

void __87__DNDModeConfigurationService_remoteService_didReceiveUpdatedAvailableModeIdentifiers___block_invoke_57(uint64_t a1)
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
          objc_msgSend(v7, "modeConfigurationService:didReceiveAvailableModesUpdate:", *(void *)(a1 + 40), *(void *)(a1 + 48), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)remoteService:(id)a3 didReceiveAppConfigurationContextUpdateForModeIdentifier:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __102__DNDModeConfigurationService_remoteService_didReceiveAppConfigurationContextUpdateForModeIdentifier___block_invoke;
  v8[3] = &unk_1E5911080;
  id v9 = v5;
  long long v10 = self;
  id v7 = v5;
  dispatch_sync(queue, v8);
}

void __102__DNDModeConfigurationService_remoteService_didReceiveAppConfigurationContextUpdateForModeIdentifier___block_invoke(int8x16_t *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = DNDLogModeConfiguration;
  if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[2].i64[0];
    *(_DWORD *)long long buf = 138543362;
    uint64_t v13 = v3;
    _os_log_impl(&dword_19CC2C000, v2, OS_LOG_TYPE_DEFAULT, "received updated app configuration context for mode identifier: identifier=%{public}@", buf, 0xCu);
  }
  uint64_t v4 = (void *)[*(id *)(a1[2].i64[1] + 24) copy];
  id v5 = *(NSObject **)(a1[2].i64[1] + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__DNDModeConfigurationService_remoteService_didReceiveAppConfigurationContextUpdateForModeIdentifier___block_invoke_58;
  block[3] = &unk_1E59110A8;
  id v10 = v4;
  int8x16_t v8 = a1[2];
  id v6 = (id)v8.i64[0];
  int8x16_t v11 = vextq_s8(v8, v8, 8uLL);
  id v7 = v4;
  dispatch_async(v5, block);
}

void __102__DNDModeConfigurationService_remoteService_didReceiveAppConfigurationContextUpdateForModeIdentifier___block_invoke_58(uint64_t a1)
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
          objc_msgSend(v7, "modeConfigurationService:didReceiveAppConfigurationContextUpdateForModeIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (BOOL)syncModeConfigurationsReturningError:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.syncModeConfigurations", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  uint64_t v6 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__3;
  uint64_t v17 = __Block_byref_object_dispose__3;
  id v18 = 0;
  id v7 = +[DNDRemoteServiceConnection sharedInstance];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__DNDModeConfigurationService_syncModeConfigurationsReturningError___block_invoke;
  v12[3] = &unk_1E5910F40;
  v12[4] = &v19;
  v12[5] = &v13;
  [v7 syncModeConfigurationsWithRequestDetails:v6 completionHandler:v12];

  if (a3)
  {
    long long v8 = (void *)v14[5];
    if (v8) {
      *a3 = v8;
    }
  }
  long long v9 = DNDLogModeConfiguration;
  if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    uint64_t v25 = v6;
    _os_log_impl(&dword_19CC2C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Synced mode configurations", buf, 0xCu);
  }
  BOOL v10 = *((unsigned char *)v20 + 24) != 0;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  os_activity_scope_leave(&state);

  return v10;
}

void __68__DNDModeConfigurationService_syncModeConfigurationsReturningError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 BOOLValue];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)createDefaultDrivingModeConfigurationWithError:(id *)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.createDefaultDrivingModeConfiguration", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v5, &v10);
  uint64_t v6 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  id v7 = DNDLogSettings;
  if (os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    BOOL v12 = v6;
    _os_log_impl(&dword_19CC2C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Creating Driving mode configuration from template", buf, 0xCu);
  }
  long long v8 = [(DNDModeConfigurationService *)self _createDefaultModeConfigurationForIdentifier:@"com.apple.donotdisturb.mode.driving" withRequestDetails:v6 error:a3];

  os_activity_scope_leave(&v10);
  return v8;
}

- (id)createDefaultSleepingModeConfigurationWithError:(id *)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.createDefaultSleepingModeConfiguration", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v5, &v10);
  uint64_t v6 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  id v7 = DNDLogSettings;
  if (os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    BOOL v12 = v6;
    _os_log_impl(&dword_19CC2C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Creating Sleeping mode configuration from template", buf, 0xCu);
  }
  long long v8 = [(DNDModeConfigurationService *)self _createDefaultModeConfigurationForIdentifier:@"com.apple.sleep.sleep-mode" withRequestDetails:v6 error:a3];

  os_activity_scope_leave(&v10);
  return v8;
}

- (id)createDefaultWorkoutModeConfigurationWithError:(id *)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.createDefaultWorkoutModeConfiguration", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v5, &v10);
  uint64_t v6 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  id v7 = DNDLogSettings;
  if (os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    BOOL v12 = v6;
    _os_log_impl(&dword_19CC2C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Creating Workout mode configuration from template", buf, 0xCu);
  }
  long long v8 = [(DNDModeConfigurationService *)self _createDefaultModeConfigurationForIdentifier:@"com.apple.donotdisturb.mode.workout" withRequestDetails:v6 error:a3];

  os_activity_scope_leave(&v10);
  return v8;
}

- (id)createModeConfigurationUsingTemplateForModeIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.createModeConfigurationUsingTemplateForModeIdentifier", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v7, &v12);
  long long v8 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  long long v9 = DNDLogSettings;
  if (os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_19CC2C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Creating mode configuration from template for identifier: identifier=%{pubic}@", buf, 0x16u);
  }
  os_activity_scope_state_s v10 = [(DNDModeConfigurationService *)self _createDefaultModeConfigurationForIdentifier:v6 withRequestDetails:v8 error:a4];

  os_activity_scope_leave(&v12);
  return v10;
}

- (id)createEmptyModeConfigurationForMode:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.createEmptyModeConfigurationForMode", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v7, &v13);
  long long v8 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  long long v9 = (id)DNDLogSettings;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    os_activity_scope_state_s v10 = [v6 modeIdentifier];
    *(_DWORD *)long long buf = 138543618;
    __int16 v15 = v8;
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    _os_log_impl(&dword_19CC2C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Creating mode configuration from template for identifier: identifier=%{pubic}@", buf, 0x16u);
  }
  long long v11 = [(DNDModeConfigurationService *)self _createEmptyModeConfigurationForMode:v6 withRequestDetails:v8 error:a4];

  os_activity_scope_leave(&v13);
  return v11;
}

- (BOOL)removeModeConfigurationForModeIdentifier:(id)a3 deletePlaceholder:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v9 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.removeModeConfiguration", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  os_activity_scope_state_s v10 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = __Block_byref_object_copy__3;
  uint64_t v23 = __Block_byref_object_dispose__3;
  id v24 = 0;
  if ([(DNDModeConfigurationService *)self canRemoveModeConfigurationForModeIdentifier:v8])
  {
    long long v11 = +[DNDRemoteServiceConnection sharedInstance];
    os_activity_scope_state_s v12 = [NSNumber numberWithBool:v6];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __96__DNDModeConfigurationService_removeModeConfigurationForModeIdentifier_deletePlaceholder_error___block_invoke;
    v18[3] = &unk_1E5910F40;
    v18[4] = &v25;
    v18[5] = &v19;
    [v11 removeModeConfigurationForModeIdentifier:v8 deletePlaceholder:v12 withRequestDetails:v10 completionHandler:v18];

    os_activity_scope_state_s v13 = DNDLogModeConfiguration;
    if (*((unsigned char *)v26 + 24))
    {
      if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543618;
        __int16 v31 = v10;
        __int16 v32 = 2114;
        id v33 = v8;
        _os_log_impl(&dword_19CC2C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Remove mode configuration, identifier=%{public}@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
    {
      -[DNDModeConfigurationService removeModeConfigurationForModeIdentifier:deletePlaceholder:error:]();
    }
    if (a5)
    {
      __int16 v15 = (void *)v20[5];
      if (v15) {
        *a5 = v15;
      }
    }
  }
  else
  {
    *((unsigned char *)v26 + 24) = 0;
    uint64_t v14 = DNDLogModeConfiguration;
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR)) {
      -[DNDModeConfigurationService removeModeConfigurationForModeIdentifier:deletePlaceholder:error:]((uint64_t)v10, (uint64_t)v8, v14);
    }
  }
  BOOL v16 = *((unsigned char *)v26 + 24) != 0;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  os_activity_scope_leave(&state);

  return v16;
}

void __96__DNDModeConfigurationService_removeModeConfigurationForModeIdentifier_deletePlaceholder_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 BOOLValue];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (unint64_t)_defaultConfigurationTypeForModeSemanticType:(int64_t)a3
{
  if ((unint64_t)a3 > 9) {
    return 2;
  }
  else {
    return qword_19CC79830[a3];
  }
}

- (id)_createDefaultModeConfigurationForIdentifier:(id)a3 withRequestDetails:(id)a4 error:(id *)a5
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  os_activity_scope_state_s v10 = [(DNDModeConfigurationService *)self allModesReturningError:a5];
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  uint64_t v31 = 0;
  __int16 v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__3;
  uint64_t v35 = __Block_byref_object_dispose__3;
  id v36 = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __101__DNDModeConfigurationService__createDefaultModeConfigurationForIdentifier_withRequestDetails_error___block_invoke;
  v27[3] = &unk_1E59115E8;
  id v11 = v8;
  id v28 = v11;
  uint64_t v29 = &v37;
  __int16 v30 = &v31;
  [v10 enumerateObjectsUsingBlock:v27];
  if (!*((unsigned char *)v38 + 24))
  {
    if (v32[5])
    {
      if ([v11 isEqualToString:@"com.apple.focus.reduce-interruptions"])
      {
        BOOL v16 = +[DNDModeConfiguration defaultReduceInterruptionsMode];
        uint64_t v17 = (void *)[v16 mutableCopy];
        os_activity_scope_state_s v13 = 0;
      }
      else
      {
        uint64_t v19 = [DNDMode alloc];
        id v20 = [(id)v32[5] name];
        uint64_t v21 = [(id)v32[5] modeIdentifier];
        char v22 = [(id)v32[5] symbolImageName];
        uint64_t v23 = [(id)v32[5] tintColorName];
        os_activity_scope_state_s v13 = -[DNDMode initWithName:modeIdentifier:symbolImageName:tintColorName:semanticType:](v19, "initWithName:modeIdentifier:symbolImageName:tintColorName:semanticType:", v20, v21, v22, v23, [(id)v32[5] semanticType]);

        BOOL v16 = [(DNDModeConfigurationService *)self _createModeSpecificConfigurationForModeSemanticType:[(DNDMode *)v13 semanticType] withIdentifier:v11];
        id v24 = [(DNDModeConfigurationService *)self _createTriggersForFocusWithIdentifier:v11];
        uint64_t v25 = [(DNDModeConfiguration *)[DNDMutableModeConfiguration alloc] initWithMode:v13 configuration:v16 triggers:v24];
        uint64_t v17 = [(DNDModeConfigurationService *)self _setModeConfigurationDefaultsForModeConfiguration:v25 withIdentifier:v11];
      }
      if ([(DNDModeConfigurationService *)self setModeConfiguration:v17 error:a5]) {
        __int16 v15 = (void *)[v17 copy];
      }
      else {
        __int16 v15 = 0;
      }

      goto LABEL_16;
    }
    if (a5)
    {
      uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v43 = *MEMORY[0x1E4F28568];
      v44[0] = @"No template found for mode identifier.";
      os_activity_scope_state_s v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:&v43 count:1];
      id v14 = [v18 errorWithDomain:@"DNDErrorDomain" code:1002 userInfo:v13];
      goto LABEL_4;
    }
LABEL_10:
    __int16 v15 = 0;
    goto LABEL_17;
  }
  if (!a5) {
    goto LABEL_10;
  }
  os_activity_scope_state_s v12 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v41 = *MEMORY[0x1E4F28568];
  id v42 = @"Mode configuration already exists for mode identifier.";
  os_activity_scope_state_s v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
  id v14 = [v12 errorWithDomain:@"DNDErrorDomain" code:1001 userInfo:v13];
LABEL_4:
  __int16 v15 = 0;
  *a5 = v14;
LABEL_16:

LABEL_17:
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  return v15;
}

void __101__DNDModeConfigurationService__createDefaultModeConfigurationForIdentifier_withRequestDetails_error___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  uint64_t v6 = [v8 modeIdentifier];
  int v7 = [v6 isEqualToString:a1[4]];

  if (v7)
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = [v8 isPlaceholder] ^ 1;
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    *a3 = 1;
  }
}

- (id)_createModeSpecificConfigurationForModeSemanticType:(int64_t)a3 withIdentifier:(id)a4
{
  id v6 = a4;
  int v7 = +[DNDMutableConfiguration configurationOfType:[(DNDModeConfigurationService *)self _defaultConfigurationTypeForModeSemanticType:a3]];
  if ([v6 isEqualToString:@"com.apple.sleep.sleep-mode"])
  {
    [v7 setHideApplicationBadges:2];
  }
  else if ([v6 isEqualToString:@"com.apple.focus.reduce-interruptions"])
  {
    id v8 = +[DNDModeConfiguration defaultReduceInterruptionsMode];
    uint64_t v9 = [v8 mutableCopy];

    int v7 = (void *)v9;
  }

  return v7;
}

- (id)_createTriggersForFocusWithIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  if ([v3 isEqualToString:@"com.apple.sleep.sleep-mode"])
  {
    id v5 = DNDModeConfigurationSleepingTrigger;
LABEL_11:
    id v6 = (DNDModeConfigurationSmartTrigger *)objc_alloc_init(v5);
    goto LABEL_12;
  }
  if ([v3 isEqualToString:@"com.apple.donotdisturb.mode.driving"])
  {
    id v5 = DNDModeConfigurationDrivingTrigger;
    goto LABEL_11;
  }
  if ([v3 isEqualToString:@"com.apple.donotdisturb.mode.workout"])
  {
    id v5 = DNDModeConfigurationWorkoutTrigger;
    goto LABEL_11;
  }
  if ([v3 isEqualToString:@"com.apple.focus.gaming"])
  {
    id v5 = DNDModeConfigurationGameControllerTrigger;
    goto LABEL_11;
  }
  if ([v3 isEqualToString:@"com.apple.focus.mindfulness"])
  {
    id v5 = DNDModeConfigurationMindfulnessTrigger;
    goto LABEL_11;
  }
  id v6 = [(DNDModeConfigurationTrigger *)[DNDModeConfigurationSmartTrigger alloc] initWithEnabledSetting:1];
LABEL_12:
  int v7 = v6;
  [v4 addObject:v6];

  return v4;
}

- (id)_setModeConfigurationDefaultsForModeConfiguration:(id)a3 withIdentifier:(id)a4
{
  id v5 = a3;
  if ([a4 isEqualToString:@"com.apple.sleep.sleep-mode"]) {
    [v5 setDimsLockScreen:2];
  }
  [v5 setAutomaticallyGenerated:1];
  return v5;
}

- (id)_createEmptyModeConfigurationForMode:(id)a3 withRequestDetails:(id)a4 error:(id *)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  os_activity_scope_state_s v10 = [(DNDModeConfigurationService *)self allModesReturningError:a5];
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __93__DNDModeConfigurationService__createEmptyModeConfigurationForMode_withRequestDetails_error___block_invoke;
  v19[3] = &unk_1E5911610;
  id v11 = v8;
  id v20 = v11;
  uint64_t v21 = &v22;
  [v10 enumerateObjectsUsingBlock:v19];
  if (*((unsigned char *)v23 + 24))
  {
    if (!a5)
    {
      id v14 = 0;
      goto LABEL_10;
    }
    os_activity_scope_state_s v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F28568];
    v27[0] = @"Mode configuration already exists for mode identifier.";
    os_activity_scope_state_s v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    [v12 errorWithDomain:@"DNDErrorDomain" code:1001 userInfo:v13];
    id v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    os_activity_scope_state_s v13 = +[DNDMutableConfiguration configurationOfType:2];
    __int16 v15 = [MEMORY[0x1E4F1CA48] array];
    BOOL v16 = [(DNDModeConfigurationTrigger *)[DNDModeConfigurationSmartTrigger alloc] initWithEnabledSetting:1];
    [v15 addObject:v16];

    uint64_t v17 = [(DNDModeConfiguration *)[DNDMutableModeConfiguration alloc] initWithMode:v11 configuration:v13 triggers:v15];
    [(DNDMutableModeConfiguration *)v17 setAutomaticallyGenerated:1];
    if ([(DNDModeConfigurationService *)self setModeConfiguration:v17 error:a5]) {
      id v14 = (void *)[(DNDMutableModeConfiguration *)v17 copy];
    }
    else {
      id v14 = 0;
    }
  }
LABEL_10:

  _Block_object_dispose(&v22, 8);
  return v14;
}

void __93__DNDModeConfigurationService__createEmptyModeConfigurationForMode_withRequestDetails_error___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  id v5 = [v8 modeIdentifier];
  id v6 = [*(id *)(a1 + 32) modeIdentifier];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v8 isPlaceholder] ^ 1;
    *a3 = 1;
  }
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)hasActivelyConfiguredModes:error:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error determining if modes have been actively configured, error='%{public}@'");
}

- (void)setModeConfiguration:error:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when setting mode configuration, error='%{public}@'");
}

- (void)modeConfigurationsReturningError:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when getting mode configurations, error='%{public}@'");
}

- (void)isLocalUserAvailableForContactInActiveMode:error:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when getting user availability in current mode for contact, error='%{public}@'");
}

- (void)allowedModesForContactHandle:error:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when getting allowed modes for contact, error='%{public}@'");
}

- (void)silencedModesForContactHandle:error:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when getting silenced modes for contact, error='%{public}@'");
}

- (void)publishCurrentStatusKitAvailabilityReturningError:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when publishing statuskit availability, error='%{public}@'");
}

- (void)setAppConfigurationPredicate:forActionIdentifier:forApplicationIdentifier:modeIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when setting app configuration predicate, error='%{public}@'");
}

- (void)getAppConfigurationPredicateForActionIdentifier:forApplicationIdentifier:modeIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when getting app configuration predicate, error='%{public}@'");
}

- (void)setAppConfigurationTargetContentIdentifierPrefix:forActionIdentifier:forApplicationIdentifier:modeIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when setting target content identifier prefix, error='%{public}@'");
}

- (void)getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when getting target content identifier prefixes, error='%{public}@'");
}

- (void)setAppAction:forApplicationIdentifier:modeIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when setting app configuration action, error='%{public}@'");
}

- (void)clearAppActionWithIdentifier:forApplicationIdentifier:modeIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when clearing app action, error='%{public}@'");
}

- (void)getAppActionsForModeIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when getting app actions, error='%{public}@'");
}

- (void)setSystemAction:forModeIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when setting system configuration action, error='%{public}@'");
}

- (void)clearSystemActionWithIdentifier:forModeIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when clearing system action, error='%{public}@'");
}

- (void)getSystemActionsForModeIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when getting system actions, error='%{public}@'");
}

- (void)getSyncPreferenceEnabledReturningError:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when getting sync preference enabled, error='%{public}@'");
}

- (void)getSyncAvailableReturningError:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when getting sync available, error='%{public}@'");
}

- (void)getSyncEnabledReturningError:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when getting sync enabled, error='%{public}@'");
}

- (void)setSyncPreferenceEnabled:error:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when setting sync enabled, error='%{public}@'");
}

void __65__DNDModeConfigurationService_addListener_withCompletionHandler___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_19CC2C000, a2, OS_LOG_TYPE_ERROR, "Did not register for updates, will remove listener: listener=%{public}@", (uint8_t *)&v3, 0xCu);
}

- (void)removeModeConfigurationForModeIdentifier:deletePlaceholder:error:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when removing mode configuration, error='%{public}@'");
}

- (void)removeModeConfigurationForModeIdentifier:(uint64_t)a1 deletePlaceholder:(uint64_t)a2 error:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_19CC2C000, a2, a3, "[%{public}@] Error mode configuration for identifier cannot be removed, identifier=%{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)_queue_registerForUpdatesIfRequired
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when registering update listener, error='%{public}@'");
}

@end