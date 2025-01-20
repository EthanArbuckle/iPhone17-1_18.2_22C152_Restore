@interface DNDSWorkoutTriggerManager
- (BOOL)_isWorkoutDNDNanoPreferenceEnabled;
- (BOOL)_isWorkoutTriggerEnabledForModeConfiguration:(id)a3;
- (DNDSWorkoutTriggerManager)init;
- (DNDSWorkoutTriggerManagerDataSource)dataSource;
- (id)_accessor;
- (id)_assertionIdentifierForHealthKitWorkoutEvent:(id)a3;
- (void)_configureWorkoutTriggerWithMode:(id)a3;
- (void)_migrateWorkoutDNDNanoPreference;
- (void)_npsQueue_refreshForNanoPreferenceChange;
- (void)_refresh;
- (void)_refreshForNanoPreferenceChange;
- (void)_refreshMigratingIfNecessary;
- (void)_refreshWithMode:(id)a3 event:(id)a4;
- (void)_setWorkoutDNDNanoPreferenceEnabled:(BOOL)a3;
- (void)_updateNanoPreferencesForRefreshWithModeConfiguration:(id)a3;
- (void)dealloc;
- (void)pairedDeviceDidChange;
- (void)refresh;
- (void)refreshMigratingIfNecessary;
- (void)setDataSource:(id)a3;
@end

@implementation DNDSWorkoutTriggerManager

- (DNDSWorkoutTriggerManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)DNDSWorkoutTriggerManager;
  v2 = [(DNDSWorkoutTriggerManager *)&v14 init];
  if (v2)
  {
    uint64_t v3 = +[DNDSWorkloop serialQueueTargetingSharedWorkloop:@"com.apple.donotdisturb.private.biome-workout.queue"];
    biomeQueue = v2->_biomeQueue;
    v2->_biomeQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    sinks = v2->_sinks;
    v2->_sinks = (NSMutableDictionary *)v5;

    v2->_lock._os_unfair_lock_opaque = 0;
    v7 = (NPSManager *)objc_alloc_init(MEMORY[0x1E4F79CE0]);
    npsManager = v2->_npsManager;
    v2->_npsManager = v7;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)DNDWorkoutStateObserverCallback, @"WorkoutDNDStateChangedNotification", 0, CFNotificationSuspensionBehaviorDrop);
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.donotdisturb.private.nps-workout.queue", v10);
    npsQueue = v2->_npsQueue;
    v2->_npsQueue = (OS_dispatch_queue *)v11;
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"WorkoutDNDStateChangedNotification", 0);
  v4.receiver = self;
  v4.super_class = (Class)DNDSWorkoutTriggerManager;
  [(DNDSWorkoutTriggerManager *)&v4 dealloc];
}

- (void)refreshMigratingIfNecessary
{
  npsQueue = self->_npsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__DNDSWorkoutTriggerManager_refreshMigratingIfNecessary__block_invoke;
  block[3] = &unk_1E6973540;
  block[4] = self;
  dispatch_async(npsQueue, block);
}

uint64_t __56__DNDSWorkoutTriggerManager_refreshMigratingIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _refreshMigratingIfNecessary];
}

- (void)_refreshMigratingIfNecessary
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_npsQueue);
  [(DNDSWorkoutTriggerManager *)self _migrateWorkoutDNDNanoPreference];
  [(DNDSWorkoutTriggerManager *)self _refresh];
}

- (void)refresh
{
  npsQueue = self->_npsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__DNDSWorkoutTriggerManager_refresh__block_invoke;
  block[3] = &unk_1E6973540;
  block[4] = self;
  dispatch_async(npsQueue, block);
}

uint64_t __36__DNDSWorkoutTriggerManager_refresh__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _refresh];
}

- (void)_refresh
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_super v4 = [WeakRetained workoutModeForWorkoutTriggerManager:self];

  LODWORD(WeakRetained) = [(DNDSWorkoutTriggerManager *)self _isWorkoutTriggerEnabledForModeConfiguration:v4];
  [(DNDSWorkoutTriggerManager *)self _updateNanoPreferencesForRefreshWithModeConfiguration:v4];
  if (WeakRetained)
  {
    uint64_t v5 = [v4 mode];
  }
  else
  {
    uint64_t v5 = 0;
  }
  [(DNDSWorkoutTriggerManager *)self _configureWorkoutTriggerWithMode:v5];
  [(DNDSWorkoutTriggerManager *)self _refreshWithMode:v5 event:0];
  v6 = DNDSLogWorkoutTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1D3052000, v6, OS_LOG_TYPE_DEFAULT, "Refresh workout trigger for system: mode=%{public}@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)pairedDeviceDidChange
{
  objc_initWeak(&location, self);
  npsQueue = self->_npsQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__DNDSWorkoutTriggerManager_pairedDeviceDidChange__block_invoke;
  v4[3] = &unk_1E6974258;
  objc_copyWeak(&v5, &location);
  dispatch_async(npsQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __50__DNDSWorkoutTriggerManager_pairedDeviceDidChange__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[4];
    WeakRetained[4] = 0;
    id v3 = WeakRetained;

    [v3 _refresh];
    id WeakRetained = v3;
  }
}

- (void)_refreshWithMode:(id)a3 event:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = [(DNDSWorkoutTriggerManager *)self dataSource];
  uint64_t v9 = [v7 modeIdentifier];

  id v66 = 0;
  v10 = [v8 triggerManager:self assertionsWithClientIdentifer:@"com.apple.donotdisturb.private.workout-trigger" error:&v66];
  id v11 = v66;
  if (v6)
  {
    if (v9)
    {
      v12 = [v6 eventBody];
      uint64_t v13 = [v12 eventType];

      v58 = [(DNDSWorkoutTriggerManager *)self _assertionIdentifierForHealthKitWorkoutEvent:v6];
      objc_super v14 = [v10 firstObject];
      v15 = [v14 details];
      uint64_t v16 = [v15 identifier];

      if (v13 == 1)
      {
        if ([v10 count])
        {
          v18 = v58;
          v17 = (void *)v16;
          if ([v58 isEqualToString:v16])
          {
            v61[0] = MEMORY[0x1E4F143A8];
            v61[1] = 3221225472;
            v61[2] = __52__DNDSWorkoutTriggerManager__refreshWithMode_event___block_invoke;
            v61[3] = &unk_1E6973720;
            id v62 = v9;
            v37 = objc_msgSend(v10, "bs_filter:", v61);
            v38 = [v37 firstObject];

            if (v38)
            {
              v39 = [v38 UUID];
              id v60 = v11;
              id v40 = (id)[v8 triggerManager:self invalidateModeAssertionWithUUID:v39 reason:2 reasonOverride:0 clientIdentifier:@"com.apple.donotdisturb.private.workout-trigger" error:&v60];
              id v21 = v60;

              v41 = (void *)DNDSLogWorkoutTrigger;
              if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
              {
                v42 = v41;
                v43 = [v38 details];
                v44 = [v43 modeIdentifier];
                *(_DWORD *)buf = 138543362;
                v68 = v44;
                _os_log_impl(&dword_1D3052000, v42, OS_LOG_TYPE_DEFAULT, "Invalidating active assertion workout trigger in response to event; previousModeID=%{public}@",
                  buf,
                  0xCu);

                v17 = (void *)v16;
              }
            }
            else
            {
              id v21 = v11;
            }
            v18 = v58;

            id v19 = v62;
LABEL_30:

            id v11 = v21;
          }
LABEL_31:

          goto LABEL_32;
        }
      }
      else if (!v13)
      {
        v17 = (void *)v16;
        v18 = v58;
        if ([v10 count] && (objc_msgSend(v58, "isEqualToString:", v16) & 1) != 0) {
          goto LABEL_31;
        }
        id v19 = objc_alloc_init(MEMORY[0x1E4F5F700]);
        [v19 setIdentifier:v58];
        [v19 setLifetime:0];
        [v19 setModeIdentifier:v9];
        [v19 setReason:1];
        id v63 = v11;
        id v20 = (id)[v8 triggerManager:self takeModeAssertionWithDetails:v19 clientIdentifier:@"com.apple.donotdisturb.private.workout-trigger" error:&v63];
        id v21 = v63;

        v22 = DNDSLogWorkoutTrigger;
        if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v68 = v9;
          _os_log_impl(&dword_1D3052000, v22, OS_LOG_TYPE_DEFAULT, "Acquiring assertion for workout trigger in response to event; modeID=%{public}@",
            buf,
            0xCu);
        }
        goto LABEL_30;
      }
      v17 = (void *)v16;
      v18 = v58;
      goto LABEL_31;
    }
    if ([v10 count])
    {
      v29 = [v10 firstObject];
      v30 = [v29 UUID];
      id v59 = v11;
      id v31 = (id)[v8 triggerManager:self invalidateModeAssertionWithUUID:v30 reason:3 reasonOverride:0 clientIdentifier:@"com.apple.donotdisturb.private.workout-trigger" error:&v59];
      id v28 = v59;

      v32 = (void *)DNDSLogWorkoutTrigger;
      if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
      {
        v33 = v32;
        v34 = [v10 firstObject];
        v35 = [v34 details];
        v36 = [v35 modeIdentifier];
        *(_DWORD *)buf = 138543362;
        v68 = v36;
        _os_log_impl(&dword_1D3052000, v33, OS_LOG_TYPE_DEFAULT, "Invalidating active assertion no mode identifer for workout trigger in response to event; previousModeID=%{public}@",
          buf,
          0xCu);
      }
      goto LABEL_33;
    }
LABEL_32:
    id v28 = v11;
    goto LABEL_33;
  }
  if (![v10 count]) {
    goto LABEL_32;
  }
  v23 = [v10 firstObject];
  v24 = v23;
  if (v9)
  {
    v25 = [v23 details];
    v26 = [v25 modeIdentifier];
    char v27 = [v9 isEqualToString:v26];

    if (v27)
    {
      id v28 = v11;
    }
    else
    {
      v51 = [v24 details];
      v52 = (void *)[v51 mutableCopy];

      [v52 setModeIdentifier:v9];
      id v64 = v11;
      id v53 = (id)[v8 triggerManager:self takeModeAssertionWithDetails:v52 clientIdentifier:@"com.apple.donotdisturb.private.workout-trigger" error:&v64];
      id v28 = v64;

      v54 = (void *)DNDSLogWorkoutTrigger;
      if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
      {
        v55 = v54;
        v56 = [v24 details];
        v57 = [v56 modeIdentifier];
        *(_DWORD *)buf = 138543618;
        v68 = v9;
        __int16 v69 = 2114;
        v70 = v57;
        _os_log_impl(&dword_1D3052000, v55, OS_LOG_TYPE_DEFAULT, "Updating active assertion to new mode identifer for workout trigger; modeID=%{public}@ previousModeID=%{public}@",
          buf,
          0x16u);
      }
    }
  }
  else
  {
    v45 = [v23 UUID];
    id v65 = v11;
    id v46 = (id)[v8 triggerManager:self invalidateModeAssertionWithUUID:v45 reason:2 reasonOverride:0 clientIdentifier:@"com.apple.donotdisturb.private.workout-trigger" error:&v65];
    id v28 = v65;

    v47 = (void *)DNDSLogWorkoutTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v48 = v47;
      v49 = [v24 details];
      v50 = [v49 modeIdentifier];
      *(_DWORD *)buf = 138543362;
      v68 = v50;
      _os_log_impl(&dword_1D3052000, v48, OS_LOG_TYPE_DEFAULT, "Invalidating active assertion no mode identifer for workout trigger; previousModeID=%{public}@",
        buf,
        0xCu);
    }
  }

LABEL_33:
}

uint64_t __52__DNDSWorkoutTriggerManager__refreshWithMode_event___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 details];
  objc_super v4 = [v3 modeIdentifier];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

- (id)_assertionIdentifierForHealthKitWorkoutEvent:(id)a3
{
  id v3 = NSString;
  objc_super v4 = [a3 eventBody];
  uint64_t v5 = [v4 activityUUID];
  id v6 = [v3 stringWithFormat:@"%@.%@", @"com.apple.donotdisturb.trigger.workout", v5];

  return v6;
}

- (void)_configureWorkoutTriggerWithMode:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = [(NSMutableDictionary *)self->_sinks objectForKeyedSubscript:@"system"];
  id v6 = v5;
  if (!v4 || v5)
  {
    if (!v4 && v5)
    {
      [v5 cancel];
      [(NSMutableDictionary *)self->_sinks removeObjectForKey:@"system"];
    }
  }
  else
  {
    id v7 = DNDSLogWorkoutTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v4;
      _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Adding biome workout event monitor; mode=%{public}@",
        buf,
        0xCu);
    }
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F502E8]) initWithIdentifier:@"com.apple.donotdisturb.workoutTrigger" targetQueue:self->_biomeQueue];
    uint64_t v9 = [MEMORY[0x1E4F504C8] healthKitWorkoutStream];
    v10 = [v9 publisher];
    id v11 = [v10 subscribeOn:v8];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    objc_super v14 = __62__DNDSWorkoutTriggerManager__configureWorkoutTriggerWithMode___block_invoke_37;
    v15 = &unk_1E6974280;
    uint64_t v16 = self;
    id v17 = v4;
    id v6 = [v11 sinkWithCompletion:&__block_literal_global_14 receiveInput:&v12];

    [(NSMutableDictionary *)self->_sinks setObject:v6, @"system", v12, v13, v14, v15, v16 forKeyedSubscript];
  }
  os_unfair_lock_unlock(&self->_lock);
}

void __62__DNDSWorkoutTriggerManager__configureWorkoutTriggerWithMode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)DNDSLogWorkoutTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    id v5 = a2;
    uint64_t v6 = [v5 state];
    id v7 = [v5 error];

    int v8 = 134218242;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    id v11 = v7;
    _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "Workout subscription completed: state=%ld error=%{public}@", (uint8_t *)&v8, 0x16u);
  }
}

void __62__DNDSWorkoutTriggerManager__configureWorkoutTriggerWithMode___block_invoke_37(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)DNDSLogWorkoutTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    uint64_t v6 = [v3 eventBody];
    unint64_t v7 = [v6 eventType];
    if (v7 > 3) {
      int v8 = @"unspecified";
    }
    else {
      int v8 = off_1E69742A0[v7];
    }
    int v12 = 138543362;
    uint64_t v13 = v8;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Received workout event: eventType=%{public}@", (uint8_t *)&v12, 0xCu);
  }
  [*(id *)(a1 + 32) _refreshWithMode:*(void *)(a1 + 40) event:v3];
  uint64_t v9 = (void *)DNDSLogWorkoutTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v10 = v9;
    id v11 = [v3 eventBody];
    int v12 = 138543362;
    uint64_t v13 = v11;
    _os_log_impl(&dword_1D3052000, v10, OS_LOG_TYPE_DEFAULT, "Updated assertions for workout event: event=%{public}@", (uint8_t *)&v12, 0xCu);
  }
}

- (BOOL)_isWorkoutTriggerEnabledForModeConfiguration:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = objc_msgSend(a3, "triggers", 0);
  id v4 = (id)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        unint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  char v8 = [v4 isEnabled];
  return v8;
}

- (void)_migrateWorkoutDNDNanoPreference
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = [(DNDSWorkoutTriggerManager *)self _accessor];

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    uint64_t v5 = [WeakRetained workoutModeForWorkoutTriggerManager:self];
    BOOL v6 = [(DNDSWorkoutTriggerManager *)self _isWorkoutDNDNanoPreferenceEnabled];
    if (!v5 && v6)
    {
      unint64_t v7 = DNDSLogWorkoutTrigger;
      if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Create mode for workout trigger to match existing nano preferences setting.", (uint8_t *)&v11, 2u);
      }
      uint64_t v5 = [WeakRetained createWorkoutModeForWorkoutTriggerManager:self];
      char v8 = (void *)DNDSLogWorkoutTrigger;
      if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = v8;
        long long v10 = [v5 mode];
        int v11 = 138543362;
        long long v12 = v10;
        _os_log_impl(&dword_1D3052000, v9, OS_LOG_TYPE_DEFAULT, "Created mode for workout trigger: mode=%{public}@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
}

- (void)_refreshForNanoPreferenceChange
{
  npsQueue = self->_npsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__DNDSWorkoutTriggerManager__refreshForNanoPreferenceChange__block_invoke;
  block[3] = &unk_1E6973540;
  block[4] = self;
  dispatch_async(npsQueue, block);
}

uint64_t __60__DNDSWorkoutTriggerManager__refreshForNanoPreferenceChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_npsQueue_refreshForNanoPreferenceChange");
}

- (void)_npsQueue_refreshForNanoPreferenceChange
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = [(DNDSWorkoutTriggerManager *)self _accessor];

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    id v4 = [WeakRetained workoutModeForWorkoutTriggerManager:self];
    BOOL v5 = [(DNDSWorkoutTriggerManager *)self _isWorkoutDNDNanoPreferenceEnabled];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    BOOL v6 = [v4 triggers];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(v6);
          }
          long long v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v13 = v12;

            uint64_t v9 = v13;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v8);
    }
    else
    {
      uint64_t v9 = 0;
    }

    int v14 = [v9 isEnabled];
    if (v4) {
      BOOL v15 = 0;
    }
    else {
      BOOL v15 = v5;
    }
    if (v15)
    {
      uint64_t v16 = DNDSLogWorkoutTrigger;
      id v17 = WeakRetained;
      if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D3052000, v16, OS_LOG_TYPE_DEFAULT, "Create mode for workout trigger in response to nano preference update.", buf, 2u);
      }
      id v4 = [WeakRetained createWorkoutModeForWorkoutTriggerManager:self];
      int v18 = 1;
    }
    else
    {
      int v19 = !v5;
      if (!v4) {
        int v19 = 1;
      }
      id v17 = WeakRetained;
      if ((v19 | v14) != 1 || ((v18 = 0, !v4) ? (char v20 = 1) : (char v20 = v5), (v20 & 1) == 0 && ((v14 ^ 1) & 1) == 0))
      {
        id v21 = (void *)DNDSLogWorkoutTrigger;
        if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
        {
          if (v5) {
            v22 = @"Y";
          }
          else {
            v22 = @"N";
          }
          v23 = v21;
          v24 = [v4 mode];
          *(_DWORD *)buf = 138543618;
          v35 = v22;
          __int16 v36 = 2114;
          v37 = v24;
          _os_log_impl(&dword_1D3052000, v23, OS_LOG_TYPE_DEFAULT, "Update workout trigger for mode in response to nano preference update: enabled=%{public}@ mode=%{public}@", buf, 0x16u);
        }
        [WeakRetained setWorkoutTriggerEnabled:v5 forWorkoutTriggerManager:self];
        uint64_t v25 = [WeakRetained workoutModeForWorkoutTriggerManager:self];

        int v18 = 1;
        id v4 = (void *)v25;
      }
    }
    if (v5)
    {
      v26 = [v4 mode];
      if (!v18) {
        goto LABEL_36;
      }
    }
    else
    {
      v26 = 0;
      if (!v18)
      {
LABEL_36:
        char v27 = DNDSLogWorkoutTrigger;
        if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v35 = v26;
          id v28 = "Workout trigger already matches nano preferences update: mode=%{public}@";
LABEL_41:
          _os_log_impl(&dword_1D3052000, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 0xCu);
          goto LABEL_42;
        }
        goto LABEL_42;
      }
    }
    [(DNDSWorkoutTriggerManager *)self _configureWorkoutTriggerWithMode:v26];
    [(DNDSWorkoutTriggerManager *)self _refreshWithMode:v26 event:0];
    char v27 = DNDSLogWorkoutTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v35 = v26;
      id v28 = "Refreshed workout trigger for nano preferences update: mode=%{public}@";
      goto LABEL_41;
    }
LABEL_42:
  }
}

- (void)_updateNanoPreferencesForRefreshWithModeConfiguration:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(DNDSWorkoutTriggerManager *)self _accessor];

  if (v5)
  {
    BOOL v6 = [(DNDSWorkoutTriggerManager *)self _isWorkoutDNDNanoPreferenceEnabled];
    BOOL v7 = [(DNDSWorkoutTriggerManager *)self _isWorkoutTriggerEnabledForModeConfiguration:v4];
    if (!v4 && v6)
    {
      uint64_t v8 = DNDSLogWorkoutTrigger;
      BOOL v9 = os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT);
      uint64_t v10 = 0;
      if (v9)
      {
        __int16 v19 = 0;
        int v11 = "Disable workout DND preference for workout trigger mode deletion.";
        long long v12 = (uint8_t *)&v19;
LABEL_19:
        _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
        uint64_t v10 = 0;
        goto LABEL_20;
      }
      goto LABEL_20;
    }
    int v13 = !v6;
    if (!v4) {
      int v13 = 1;
    }
    if (((v13 | v7) & 1) == 0)
    {
      uint64_t v8 = DNDSLogWorkoutTrigger;
      BOOL v16 = os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT);
      uint64_t v10 = 0;
      if (v16)
      {
        *(_WORD *)buf = 0;
        int v11 = "Disable workout DND preference to match disabled workout trigger.";
        long long v12 = buf;
        goto LABEL_19;
      }
LABEL_20:
      [(DNDSWorkoutTriggerManager *)self _setWorkoutDNDNanoPreferenceEnabled:v10];
      goto LABEL_21;
    }
    if (v4) {
      char v14 = v6;
    }
    else {
      char v14 = 1;
    }
    if ((v14 & 1) == 0 && v7)
    {
      BOOL v15 = DNDSLogWorkoutTrigger;
      if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v17 = 0;
        _os_log_impl(&dword_1D3052000, v15, OS_LOG_TYPE_DEFAULT, "Enable workout DND preference to match enabled workout trigger.", v17, 2u);
      }
      uint64_t v10 = 1;
      goto LABEL_20;
    }
  }
LABEL_21:
}

- (id)_accessor
{
  dispatch_assert_queue_not_V2(MEMORY[0x1E4F14428]);
  accessor = self->_accessor;
  if (!accessor)
  {
    id v4 = [MEMORY[0x1E4F5F5C8] currentDevice];
    if ([v4 deviceClass] == 1 || objc_msgSend(v4, "deviceClass") == 5)
    {
      BOOL v5 = (NPSDomainAccessor *)[objc_alloc(MEMORY[0x1E4F79CD8]) initWithDomain:@"com.apple.nano"];
      BOOL v6 = self->_accessor;
      self->_accessor = v5;
    }
    accessor = self->_accessor;
  }
  return accessor;
}

- (BOOL)_isWorkoutDNDNanoPreferenceEnabled
{
  v2 = [(DNDSWorkoutTriggerManager *)self _accessor];
  id v3 = (id)[v2 synchronize];
  char v7 = 0;
  char v4 = [v2 BOOLForKey:@"workoutDND" keyExistsAndHasValidFormat:&v7];
  if (v7) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_setWorkoutDNDNanoPreferenceEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(DNDSWorkoutTriggerManager *)self _accessor];

  if (v5)
  {
    id v10 = [(DNDSWorkoutTriggerManager *)self _accessor];
    [v10 setBool:v3 forKey:@"workoutDND"];
    id v6 = (id)[v10 synchronize];
    npsManager = self->_npsManager;
    uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithObject:@"workoutDND"];
    [(NPSManager *)npsManager synchronizeNanoDomain:@"com.apple.nano" keys:v8];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"WorkoutDNDStateChangedNotification", 0, 0, 0);
  }
}

- (DNDSWorkoutTriggerManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (DNDSWorkoutTriggerManagerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_npsQueue, 0);
  objc_storeStrong((id *)&self->_npsManager, 0);
  objc_storeStrong((id *)&self->_accessor, 0);
  objc_storeStrong((id *)&self->_sinks, 0);
  objc_storeStrong((id *)&self->_biomeQueue, 0);
}

@end