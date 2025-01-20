@interface HDAgeGatingManager
- (HDAgeGatingManager)initWithProfile:(id)a3;
- (HDAgeGatingManager)initWithProfile:(id)a3 userDefaults:(id)a4 queue:(id)a5;
- (id)ageInYearsWithError:(id *)a3;
- (void)_queue_updateAgeGating;
- (void)_updateAgeGatingOnQueue;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)dealloc;
- (void)didReceiveDayChangeNotification:(id)a3;
- (void)profileDidBecomeReady:(id)a3;
- (void)unitTesting_updateAgeGates;
@end

@implementation HDAgeGatingManager

- (HDAgeGatingManager)initWithProfile:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = (void *)[v6 initWithSuiteName:*MEMORY[0x1E4F2BC98]];
  v8 = HKCreateSerialDispatchQueue();
  v9 = [(HDAgeGatingManager *)self initWithProfile:v5 userDefaults:v7 queue:v8];

  return v9;
}

- (HDAgeGatingManager)initWithProfile:(id)a3 userDefaults:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HDAgeGatingManager;
  v12 = [(HDAgeGatingManager *)&v16 init];
  if (v12)
  {
    if (!v9)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, v12, @"HDAgeGatingManager.m", 51, @"Invalid parameter not satisfying: %@", @"profile != nil" object file lineNumber description];
    }
    objc_storeWeak((id *)&v12->_profile, v9);
    objc_storeStrong((id *)&v12->_userDefaults, a4);
    objc_storeStrong((id *)&v12->_queue, a5);
    id WeakRetained = objc_loadWeakRetained((id *)&v12->_profile);
    [WeakRetained registerProfileReadyObserver:v12 queue:0];
  }
  return v12;
}

- (void)dealloc
{
  if (self)
  {
    if (notify_is_valid_token(self->_significantTimeChangeNotificationToken)) {
      notify_cancel(self->_significantTimeChangeNotificationToken);
    }
    if (notify_is_valid_token(self->_userCharacteristicsDidChangeNotificationToken)) {
      notify_cancel(self->_userCharacteristicsDidChangeNotificationToken);
    }
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self name:*MEMORY[0x1E4F1C2E0] object:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)HDAgeGatingManager;
  [(HDAgeGatingManager *)&v4 dealloc];
}

- (void)profileDidBecomeReady:(id)a3
{
  if (self)
  {
    objc_initWeak(&location, self);
    objc_super v4 = objc_opt_class();
    queue = self->_queue;
    uint64_t handler = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __47__HDAgeGatingManager__registerForNotifications__block_invoke;
    v20 = &unk_1E62F8738;
    v21[1] = v4;
    objc_copyWeak(v21, &location);
    notify_register_dispatch("SignificantTimeChangeNotification", &self->_significantTimeChangeNotificationToken, queue, &handler);
    id v6 = (const char *)*MEMORY[0x1E4F2BF80];
    v7 = self->_queue;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __47__HDAgeGatingManager__registerForNotifications__block_invoke_297;
    v15[3] = &unk_1E62F8738;
    v16[1] = v4;
    objc_copyWeak(v16, &location);
    notify_register_dispatch(v6, &self->_userCharacteristicsDidChangeNotificationToken, v7, v15);
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:self selector:sel_didReceiveDayChangeNotification_ name:*MEMORY[0x1E4F1C2E0] object:0];

    objc_destroyWeak(v16);
    objc_destroyWeak(v21);
    objc_destroyWeak(&location);
    id v9 = [NSString stringWithCString:"-[HDAgeGatingManager _updateAgeGatingViaMaintenanceWorkCoordinator]" encoding:4];
    id v10 = self->_queue;
    uint64_t handler = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __67__HDAgeGatingManager__updateAgeGatingViaMaintenanceWorkCoordinator__block_invoke;
    v20 = &unk_1E62F3208;
    v21[0] = self;
    id v11 = +[HDMaintenanceOperation maintenanceOperationWithName:v9 queue:v10 synchronousBlock:&handler];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v13 = [WeakRetained daemon];
    v14 = [v13 maintenanceWorkCoordinator];
    [v14 enqueueMaintenanceOperation:v11];
  }
}

- (void)didReceiveDayChangeNotification:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  objc_super v4 = HKLogInfrastructure();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    id v7 = (id)objc_opt_class();
    __int16 v8 = 2082;
    id v9 = "-[HDAgeGatingManager didReceiveDayChangeNotification:]";
    id v5 = v7;
    _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}s] received day change notification", (uint8_t *)&v6, 0x16u);
  }
  -[HDAgeGatingManager _updateAgeGatingOnQueue]((uint64_t)self);
}

- (void)_updateAgeGatingOnQueue
{
  if (a1)
  {
    v1 = *(NSObject **)(a1 + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__HDAgeGatingManager__updateAgeGatingOnQueue__block_invoke;
    block[3] = &unk_1E62F3208;
    block[4] = a1;
    dispatch_async(v1, block);
  }
}

- (void)unitTesting_updateAgeGates
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__HDAgeGatingManager_unitTesting_updateAgeGates__block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __48__HDAgeGatingManager_unitTesting_updateAgeGates__block_invoke(uint64_t a1)
{
}

- (void)_queue_updateAgeGating
{
  v65[11] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    id v45 = 0;
    v2 = [(id)a1 ageInYearsWithError:&v45];
    id v3 = v45;
    objc_super v4 = v3;
    v44 = v2;
    if (v2 || !v3)
    {
      id v42 = v3;
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      v12 = [WeakRetained database];
      [v12 removeProtectedDataObserver:a1];

      id v13 = v2;
      v64[0] = *MEMORY[0x1E4F2BCB0];
      v14 = [NSNumber numberWithInteger:*MEMORY[0x1E4F2BE50]];
      v65[0] = v14;
      v64[1] = *MEMORY[0x1E4F2BCB8];
      v43 = [NSNumber numberWithInteger:*MEMORY[0x1E4F2BF10]];
      v65[1] = v43;
      v64[2] = *MEMORY[0x1E4F2BCA8];
      v41 = [NSNumber numberWithInteger:*MEMORY[0x1E4F2BCF8]];
      v65[2] = v41;
      v64[3] = *MEMORY[0x1E4F29EB0];
      v40 = [NSNumber numberWithInteger:*MEMORY[0x1E4F2BD58]];
      v65[3] = v40;
      v64[4] = *MEMORY[0x1E4F29EC0];
      v39 = [NSNumber numberWithInteger:*MEMORY[0x1E4F2BF18]];
      v65[4] = v39;
      v64[5] = *MEMORY[0x1E4F2BCC8];
      v15 = [NSNumber numberWithInteger:*MEMORY[0x1E4F2BF58]];
      v65[5] = v15;
      v64[6] = *MEMORY[0x1E4F2BCD0];
      objc_super v16 = [NSNumber numberWithInteger:*MEMORY[0x1E4F2BF60]];
      v65[6] = v16;
      v64[7] = *MEMORY[0x1E4F2BCA0];
      v17 = [NSNumber numberWithInteger:*MEMORY[0x1E4F2BC88]];
      v65[7] = v17;
      v64[8] = *MEMORY[0x1E4F2BCD8];
      uint64_t v18 = [NSNumber numberWithInteger:*MEMORY[0x1E4F2BF88]];
      v65[8] = v18;
      v64[9] = *MEMORY[0x1E4F2BCC0];
      v19 = [NSNumber numberWithInteger:*MEMORY[0x1E4F2BF38]];
      v65[9] = v19;
      v64[10] = *MEMORY[0x1E4F29ED0];
      v20 = [NSNumber numberWithInteger:*MEMORY[0x1E4F2BFD0]];
      v65[10] = v20;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:11];

      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v22 = v21;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v46 objects:buf count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v47 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void *)(*((void *)&v46 + 1) + 8 * i);
            v28 = [v22 objectForKeyedSubscript:v27];
            if (v44)
            {
              uint64_t v29 = [v13 integerValue];
              BOOL v30 = v29 < [v28 integerValue];
            }
            else
            {
              BOOL v30 = 0;
            }
            [*(id *)(a1 + 32) setBool:v30 forKey:v27];
            _HKInitializeLogging();
            v31 = HKLogInfrastructure();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              v32 = objc_opt_class();
              *(_DWORD *)v50 = 138544130;
              v51 = v32;
              __int16 v52 = 2082;
              v53 = "-[HDAgeGatingManager _updateUserDefaultsWithAge:]";
              __int16 v54 = 2114;
              uint64_t v55 = v27;
              __int16 v56 = 1026;
              BOOL v57 = v30;
              id v33 = v32;
              _os_log_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}s] %{public}@ age gating enabled: %{public}d", v50, 0x26u);
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v46 objects:buf count:16];
        }
        while (v24);
      }

      _HKInitializeLogging();
      int v6 = HKLogInfrastructure();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v34 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v59 = v34;
        __int16 v60 = 2082;
        v61 = "-[HDAgeGatingManager _queue_updateAgeGating]";
        id v35 = v34;
        _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}s] processed", buf, 0x16u);
      }
      objc_super v4 = v42;
    }
    else
    {
      int v5 = objc_msgSend(v3, "hk_isDatabaseAccessibilityError");
      _HKInitializeLogging();
      int v6 = HKLogInfrastructure();
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if (v5)
      {
        if (v7)
        {
          __int16 v8 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v59 = v8;
          __int16 v60 = 2082;
          v61 = "-[HDAgeGatingManager _queue_updateAgeGating]";
          id v9 = v8;
          _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}s] Protected data not accessible. Adding observer.", buf, 0x16u);
        }
        int v6 = objc_loadWeakRetained((id *)(a1 + 8));
        uint64_t v10 = [v6 database];
        [v10 addProtectedDataObserver:a1];
      }
      else if (v7)
      {
        v36 = objc_opt_class();
        id v37 = v36;
        v38 = [v4 localizedDescription];
        *(_DWORD *)buf = 138543874;
        v59 = v36;
        __int16 v60 = 2082;
        v61 = "-[HDAgeGatingManager _queue_updateAgeGating]";
        __int16 v62 = 2114;
        v63 = v38;
        _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}s] While fetching date of birth components, received error: %{public}@", buf, 0x20u);
      }
    }
  }
}

- (id)ageInYearsWithError:(id *)a3
{
  int v5 = [MEMORY[0x1E4F2B2C0] characteristicTypeForIdentifier:*MEMORY[0x1E4F298B8]];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  BOOL v7 = [WeakRetained userCharacteristicsManager];
  id v19 = 0;
  __int16 v8 = [v7 userCharacteristicForType:v5 error:&v19];
  id v9 = v19;

  if (v8) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v9 == 0;
  }
  if (v10)
  {
    id v11 = 0;
    if (self && v8)
    {
      v12 = (void *)MEMORY[0x1E4F1C9A8];
      id v13 = v8;
      v14 = objc_msgSend(v12, "hk_gregorianCalendarWithLocalTimeZone");
      v15 = [MEMORY[0x1E4F1C9C8] date];
      objc_super v16 = objc_msgSend(v14, "hk_dateOfBirthDateComponentsWithDate:", v15);

      v17 = [v14 components:4 fromDateComponents:v13 toDateComponents:v16 options:0];

      id v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v17, "year"));
    }
  }
  else if (a3)
  {
    id v11 = 0;
    *a3 = v9;
  }
  else
  {
    _HKLogDroppedError();
    id v11 = 0;
  }

  return v11;
}

void __67__HDAgeGatingManager__updateAgeGatingViaMaintenanceWorkCoordinator__block_invoke(uint64_t a1)
{
}

void __45__HDAgeGatingManager__updateAgeGatingOnQueue__block_invoke(uint64_t a1)
{
}

void __47__HDAgeGatingManager__registerForNotifications__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = HKLogInfrastructure();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating age gating due to significant time change.", (uint8_t *)&v5, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HDAgeGatingManager _updateAgeGatingOnQueue]((uint64_t)WeakRetained);
}

void __47__HDAgeGatingManager__registerForNotifications__block_invoke_297(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = HKLogInfrastructure();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating age gating due to user characteristics change.", (uint8_t *)&v5, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HDAgeGatingManager _updateAgeGatingOnQueue]((uint64_t)WeakRetained);
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  if (a4) {
    -[HDAgeGatingManager _updateAgeGatingOnQueue]((uint64_t)self);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end