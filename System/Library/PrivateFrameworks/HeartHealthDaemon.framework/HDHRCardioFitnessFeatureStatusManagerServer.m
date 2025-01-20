@interface HDHRCardioFitnessFeatureStatusManagerServer
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)configurationClass;
+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7;
+ (id)taskIdentifier;
- (HDHRCardioFitnessFeatureStatusManagerServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 featureAvailabilityProvider:(id)a7 featureStatusProvider:(id)a8 featureSettingsManager:(id)a9;
- (id)_clientRemoteObjectProxy;
- (id)_determineNotificationStatusWithFeatureStatus:(id)a3;
- (id)_determineOnboardingStatusWithFeatureStatus:(id)a3;
- (id)_getNotificationStatusWithError:(id *)a3;
- (id)_getOnboardingStatusWithError:(id *)a3;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)_stopObservingChangesAndExpectToBeObserving:(BOOL)a3;
- (void)dealloc;
- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4;
- (void)remote_notificationStatusWithCompletion:(id)a3;
- (void)remote_onboardingStatusWithCompletion:(id)a3;
- (void)remote_resetOnboardingWithCompletion:(id)a3;
- (void)remote_setNotificationsEnabled:(BOOL)a3 withCompletion:(id)a4;
- (void)remote_startObservingChangesWithCompletion:(id)a3;
- (void)remote_stopObservingChanges;
@end

@implementation HDHRCardioFitnessFeatureStatusManagerServer

- (HDHRCardioFitnessFeatureStatusManagerServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 featureAvailabilityProvider:(id)a7 featureStatusProvider:(id)a8 featureSettingsManager:(id)a9
{
  id v23 = a7;
  id v16 = a8;
  id v17 = a9;
  v24.receiver = self;
  v24.super_class = (Class)HDHRCardioFitnessFeatureStatusManagerServer;
  v18 = [(HDStandardTaskServer *)&v24 initWithUUID:a3 configuration:a4 client:a5 delegate:a6];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_featureAvailabilityProvider, a7);
    uint64_t v20 = HKCreateSerialDispatchQueue();
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v20;

    objc_storeStrong((id *)&v19->_featureStatusProvider, a8);
    objc_storeStrong((id *)&v19->_featureSettingsManager, a9);
    v19->_observing = 0;
    v19->_lock._os_unfair_lock_opaque = 0;
  }

  return v19;
}

- (void)dealloc
{
  [(HDHRCardioFitnessFeatureStatusManagerServer *)self _stopObservingChangesAndExpectToBeObserving:0];
  v3.receiver = self;
  v3.super_class = (Class)HDHRCardioFitnessFeatureStatusManagerServer;
  [(HDHRCardioFitnessFeatureStatusManagerServer *)&v3 dealloc];
}

- (void)remote_onboardingStatusWithCompletion:(id)a3
{
  id v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  v5 = [(HDHRCardioFitnessFeatureStatusManagerServer *)self _getOnboardingStatusWithError:&v7];
  id v6 = v7;
  v4[2](v4, v5, v6);
}

- (id)_getOnboardingStatusWithError:(id *)a3
{
  featureStatusProvider = self->_featureStatusProvider;
  id v11 = 0;
  id v6 = [(HKFeatureStatusProviding *)featureStatusProvider featureStatusWithError:&v11];
  id v7 = v11;
  if (v6)
  {
    v8 = [(HDHRCardioFitnessFeatureStatusManagerServer *)self _determineOnboardingStatusWithFeatureStatus:v6];
    goto LABEL_12;
  }
  _HKInitializeLogging();
  v9 = *MEMORY[0x1E4F29F48];
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[HDHRCardioFitnessFeatureStatusManagerServer _getOnboardingStatusWithError:]();
    }
    if (a3)
    {
      v8 = 0;
      *a3 = v7;
      goto LABEL_12;
    }
    _HKLogDroppedError();
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    -[HDHRCardioFitnessFeatureStatusManagerServer _getOnboardingStatusWithError:]();
  }
  v8 = 0;
LABEL_12:

  return v8;
}

- (id)_determineOnboardingStatusWithFeatureStatus:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F67D00]];
  if ([v5 areAllRequirementsSatisfied])
  {
    _HKInitializeLogging();
    id v6 = *MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
    {
      int v37 = 138543362;
      v38 = self;
      _os_log_impl(&dword_1D3AC6000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Classification context satisfied, reporting back clean onboarding status", (uint8_t *)&v37, 0xCu);
    }
    id v7 = objc_alloc(MEMORY[0x1E4F67DF8]);
    v8 = [v4 onboardingRecord];
    v9 = [v8 earliestDateOfAnyOnboardingCompletion];
    v10 = v7;
    uint64_t v11 = 1;
    uint64_t v12 = 0;
    v13 = v9;
    uint64_t v14 = 0;
    uint64_t v15 = 1;
    uint64_t v16 = 1;
  }
  else
  {
    int v17 = [v5 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29CE0]];
    v18 = (void *)MEMORY[0x1E4F29C70];
    if (v17 && [v5 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29C70]])
    {
      _HKInitializeLogging();
      v19 = *MEMORY[0x1E4F29F48];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
      {
        int v37 = 138543362;
        v38 = self;
        _os_log_impl(&dword_1D3AC6000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] User has valid onboarding but their age is either present or gated", (uint8_t *)&v37, 0xCu);
      }
      id v20 = objc_alloc(MEMORY[0x1E4F67DF8]);
      v8 = [v4 onboardingRecord];
      v9 = [v8 earliestDateOfAnyOnboardingCompletion];
      v10 = v20;
      uint64_t v11 = 1;
      uint64_t v12 = 0;
      v13 = v9;
      uint64_t v14 = 0;
      uint64_t v15 = 1;
    }
    else
    {
      v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F29BC0]];
      char v21 = [v8 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29CB8]];
      v22 = (os_log_t *)MEMORY[0x1E4F29F48];
      if (v21)
      {
        uint64_t v23 = 0;
      }
      else
      {
        _HKInitializeLogging();
        objc_super v24 = *v22;
        if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
        {
          int v37 = 138543362;
          v38 = self;
          _os_log_impl(&dword_1D3AC6000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] User is age gated, marking unavailability reason", (uint8_t *)&v37, 0xCu);
        }
        uint64_t v23 = 1;
      }
      if (([v8 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29C60]] & 1) == 0)
      {
        _HKInitializeLogging();
        v25 = *v22;
        if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
        {
          int v37 = 138543362;
          v38 = self;
          _os_log_impl(&dword_1D3AC6000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] User is age gated, marking unavailability reason", (uint8_t *)&v37, 0xCu);
        }
        v23 |= 2uLL;
      }
      if (([v8 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29CA8]] & 1) == 0)
      {
        _HKInitializeLogging();
        v26 = *v22;
        if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
        {
          int v37 = 138543362;
          v38 = self;
          _os_log_impl(&dword_1D3AC6000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] User has heart rate disabled, marking onboarding unavailability reason", (uint8_t *)&v37, 0xCu);
        }
        v23 |= 4uLL;
      }
      if (([v8 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29CA0]] & 1) == 0)
      {
        _HKInitializeLogging();
        v27 = *v22;
        if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
        {
          int v37 = 138543362;
          v38 = self;
          _os_log_impl(&dword_1D3AC6000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] User has health app hidden, marking onboarding unavailability reason", (uint8_t *)&v37, 0xCu);
        }
        v23 |= 8uLL;
      }
      if (([v8 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29D00]] & 1) == 0)
      {
        _HKInitializeLogging();
        v28 = *v22;
        if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
        {
          int v37 = 138543362;
          v38 = self;
          _os_log_impl(&dword_1D3AC6000, v28, OS_LOG_TYPE_DEFAULT, "[%{public}@] User has heart rate app uninstalled, marking onboarding unavailability reason", (uint8_t *)&v37, 0xCu);
        }
        v23 |= 0x10uLL;
      }
      int v29 = [v8 areAllRequirementsSatisfied];
      _HKInitializeLogging();
      v30 = *v22;
      BOOL v31 = os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT);
      if (v29)
      {
        if (v31)
        {
          int v37 = 138543362;
          v38 = self;
          _os_log_impl(&dword_1D3AC6000, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@] User not onboarded but no reason why they couldn't onboard", (uint8_t *)&v37, 0xCu);
        }
        uint64_t v32 = 2;
      }
      else
      {
        if (v31)
        {
          int v37 = 138543362;
          v38 = self;
          _os_log_impl(&dword_1D3AC6000, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@] User not onboarded but onboarding unavailable", (uint8_t *)&v37, 0xCu);
        }
        uint64_t v32 = 0;
      }
      v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F29BD8]];
      id v33 = objc_alloc(MEMORY[0x1E4F67DF8]);
      uint64_t v34 = [v9 areAllRequirementsSatisfied];
      uint64_t v15 = [v9 isRequirementSatisfiedWithIdentifier:*v18];
      v10 = v33;
      uint64_t v11 = v32;
      uint64_t v12 = v23;
      v13 = 0;
      uint64_t v14 = v34;
    }
    uint64_t v16 = 0;
  }
  v35 = (void *)[v10 initWithState:v11 unavailableReasons:v12 dateOnboarded:v13 shouldOnboardingTileBeAdvertised:v14 isLocaleValidOnLocalDevice:v15 isClassificationAvailable:v16];

  return v35;
}

- (void)remote_notificationStatusWithCompletion:(id)a3
{
  id v7 = 0;
  id v4 = (void (**)(id, void *, id))a3;
  v5 = [(HDHRCardioFitnessFeatureStatusManagerServer *)self _getNotificationStatusWithError:&v7];
  id v6 = v7;
  v4[2](v4, v5, v6);
}

- (id)_getNotificationStatusWithError:(id *)a3
{
  featureStatusProvider = self->_featureStatusProvider;
  id v11 = 0;
  id v6 = [(HKFeatureStatusProviding *)featureStatusProvider featureStatusWithError:&v11];
  id v7 = v11;
  if (v6)
  {
    v8 = [(HDHRCardioFitnessFeatureStatusManagerServer *)self _determineNotificationStatusWithFeatureStatus:v6];
    goto LABEL_12;
  }
  _HKInitializeLogging();
  v9 = *MEMORY[0x1E4F29F48];
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[HDHRCardioFitnessFeatureStatusManagerServer _getOnboardingStatusWithError:]();
    }
    if (a3)
    {
      v8 = 0;
      *a3 = v7;
      goto LABEL_12;
    }
    _HKLogDroppedError();
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    -[HDHRCardioFitnessFeatureStatusManagerServer _getOnboardingStatusWithError:]();
  }
  v8 = 0;
LABEL_12:

  return v8;
}

- (id)_determineNotificationStatusWithFeatureStatus:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F67D10];
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:v4];
  id v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F67D08]];

  uint64_t v8 = [v7 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29D08]];
  int v9 = [v6 areAllRequirementsSatisfied];
  v10 = (os_log_t *)MEMORY[0x1E4F29F48];
  if (v9)
  {
    _HKInitializeLogging();
    id v11 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v33 = self;
      _os_log_impl(&dword_1D3AC6000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifications enabled, sending back enabled notification status", buf, 0xCu);
    }
    id v12 = objc_alloc(MEMORY[0x1E4F67DF0]);
    uint64_t v13 = 1;
LABEL_9:
    uint64_t v18 = 0;
    goto LABEL_49;
  }
  uint64_t v14 = [v6 unsatisfiedRequirementIdentifiers];
  uint64_t v31 = *MEMORY[0x1E4F29C90];
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  int v16 = [v14 isEqualToArray:v15];

  if (v16)
  {
    _HKInitializeLogging();
    int v17 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v33 = self;
      _os_log_impl(&dword_1D3AC6000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifications disabled but otherwise clear, sending back disabled notification status", buf, 0xCu);
    }
    id v12 = objc_alloc(MEMORY[0x1E4F67DF0]);
    uint64_t v13 = 2;
    goto LABEL_9;
  }
  if ([v6 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29CB8]])
  {
    uint64_t v19 = 0;
  }
  else
  {
    _HKInitializeLogging();
    id v20 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v33 = self;
      _os_log_impl(&dword_1D3AC6000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] User is age gated, marking unavailability reason", buf, 0xCu);
    }
    uint64_t v19 = 1;
  }
  if (([v6 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29C50]] & 1) == 0)
  {
    _HKInitializeLogging();
    char v21 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v33 = self;
      _os_log_impl(&dword_1D3AC6000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Age is not present, marking unavailability reason", buf, 0xCu);
    }
    v19 |= 2uLL;
  }
  if (([v6 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29C60]] & 1) == 0)
  {
    _HKInitializeLogging();
    v22 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v33 = self;
      _os_log_impl(&dword_1D3AC6000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] Active paired device not supported, marking unavailability reason", buf, 0xCu);
    }
    v19 |= 4uLL;
  }
  if (([v6 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29CA8]] & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v23 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v33 = self;
      _os_log_impl(&dword_1D3AC6000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] User has heart rate disabled, marking unavailability reason", buf, 0xCu);
    }
    v19 |= 0x10uLL;
  }
  if (([v6 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29CA0]] & 1) == 0)
  {
    _HKInitializeLogging();
    objc_super v24 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v33 = self;
      _os_log_impl(&dword_1D3AC6000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] User has health app hidden, marking notification unavailability reason", buf, 0xCu);
    }
    v19 |= 0x20uLL;
  }
  if (([v6 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29D00]] & 1) == 0)
  {
    _HKInitializeLogging();
    v25 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v33 = self;
      _os_log_impl(&dword_1D3AC6000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] User has heart rate app uninstalled, marking notification unavailability reason", buf, 0xCu);
    }
    v19 |= 0x100uLL;
  }
  if (([v6 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29CD0]] & 1) == 0)
  {
    _HKInitializeLogging();
    v26 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v33 = self;
      _os_log_impl(&dword_1D3AC6000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] User needs to confirm medication details, marking notification unavailability reason", buf, 0xCu);
    }
    v19 |= 0x80uLL;
  }
  if (![v6 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29C68]]
    || ([v6 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29C70]] & 1) == 0)
  {
    _HKInitializeLogging();
    v27 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v33 = self;
      _os_log_impl(&dword_1D3AC6000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cardio Fitness not allowed for region in on either local or remote device, marking notification unavailability reason", buf, 0xCu);
    }
    v19 |= 8uLL;
  }
  if (([v6 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29CE0]] & 1) == 0)
  {
    _HKInitializeLogging();
    v28 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v33 = self;
      _os_log_impl(&dword_1D3AC6000, v28, OS_LOG_TYPE_DEFAULT, "[%{public}@] User has not onboarded, marking notification unavailability reason", buf, 0xCu);
    }
    v19 |= 0x40uLL;
  }
  id v12 = objc_alloc(MEMORY[0x1E4F67DF0]);
  uint64_t v13 = 0;
  uint64_t v18 = v19;
LABEL_49:
  int v29 = (void *)[v12 initWithState:v13 unavailableReasons:v18 wristDetectEnabled:v8];

  return v29;
}

- (void)remote_setNotificationsEnabled:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  objc_initWeak(&location, self);
  featureAvailabilityProvider = self->_featureAvailabilityProvider;
  uint64_t v8 = [NSNumber numberWithBool:v4];
  uint64_t v9 = *MEMORY[0x1E4F29DE0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __93__HDHRCardioFitnessFeatureStatusManagerServer_remote_setNotificationsEnabled_withCompletion___block_invoke;
  v11[3] = &unk_1E69B4B10;
  objc_copyWeak(&v13, &location);
  id v10 = v6;
  id v12 = v10;
  [(HKFeatureAvailabilityProviding *)featureAvailabilityProvider setFeatureSettingNumber:v8 forKey:v9 completion:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __93__HDHRCardioFitnessFeatureStatusManagerServer_remote_setNotificationsEnabled_withCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v7 = (void *)WeakRetained[5];
    uint64_t v8 = *MEMORY[0x1E4F67CE8];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __93__HDHRCardioFitnessFeatureStatusManagerServer_remote_setNotificationsEnabled_withCompletion___block_invoke_285;
    v10[3] = &unk_1E69B4B10;
    objc_copyWeak(&v12, (id *)(a1 + 40));
    id v11 = *(id *)(a1 + 32);
    [v7 setFeatureSettingNumber:MEMORY[0x1E4F1CC38] forKey:v8 completion:v10];

    objc_destroyWeak(&v12);
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v9 = (void *)*MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
      __93__HDHRCardioFitnessFeatureStatusManagerServer_remote_setNotificationsEnabled_withCompletion___block_invoke_cold_1(a1, v9, (uint64_t)v5);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __93__HDHRCardioFitnessFeatureStatusManagerServer_remote_setNotificationsEnabled_withCompletion___block_invoke_285(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
      __93__HDHRCardioFitnessFeatureStatusManagerServer_remote_setNotificationsEnabled_withCompletion___block_invoke_285_cold_1(a1, v6);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)remote_resetOnboardingWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    *(_DWORD *)buf = 138543362;
    id v13 = (id)objc_opt_class();
    id v7 = v13;
    _os_log_impl(&dword_1D3AC6000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Resetting onboarding", buf, 0xCu);
  }
  featureAvailabilityProvider = self->_featureAvailabilityProvider;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__HDHRCardioFitnessFeatureStatusManagerServer_remote_resetOnboardingWithCompletion___block_invoke;
  v10[3] = &unk_1E69B4190;
  void v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [(HKFeatureAvailabilityProviding *)featureAvailabilityProvider resetOnboardingWithCompletion:v10];
}

void __84__HDHRCardioFitnessFeatureStatusManagerServer_remote_resetOnboardingWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = *(void **)(*(void *)(a1 + 32) + 64);
    uint64_t v7 = *MEMORY[0x1E4F29D18];
    id v10 = v5;
    [v6 resetFeatureSettingsForFeatureIdentifier:v7 suppressNotificationsToObserver:0 error:&v10];
    id v8 = v10;

    (*(void (**)(void, BOOL, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v8 == 0, v8);
    id v5 = v8;
  }
  else
  {
    _HKInitializeLogging();
    id v9 = (void *)*MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
      __84__HDHRCardioFitnessFeatureStatusManagerServer_remote_resetOnboardingWithCompletion___block_invoke_cold_1(a1, v9);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)remote_startObservingChangesWithCompletion:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, void))a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_observing)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
      -[HDHRCardioFitnessFeatureStatusManagerServer remote_startObservingChangesWithCompletion:]();
    }
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    self->_observing = 1;
    _HKInitializeLogging();
    id v5 = *MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      uint64_t v7 = self;
      _os_log_impl(&dword_1D3AC6000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting observation of changes", (uint8_t *)&v6, 0xCu);
    }
    [(HKFeatureStatusProviding *)self->_featureStatusProvider registerObserver:self queue:self->_queue];
    os_unfair_lock_unlock(&self->_lock);
    v4[2](v4, 1, 0);
  }
}

- (void)remote_stopObservingChanges
{
}

- (void)_stopObservingChangesAndExpectToBeObserving:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_observing)
  {
    self->_observing = 0;
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEBUG)) {
      -[HDHRCardioFitnessFeatureStatusManagerServer _stopObservingChangesAndExpectToBeObserving:]();
    }
    [(HKFeatureStatusProviding *)self->_featureStatusProvider unregisterObserver:self];
  }
  else if (v3)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
      -[HDHRCardioFitnessFeatureStatusManagerServer _stopObservingChangesAndExpectToBeObserving:]();
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4
{
  id v5 = a4;
  id v9 = [(HDHRCardioFitnessFeatureStatusManagerServer *)self _determineOnboardingStatusWithFeatureStatus:v5];
  int v6 = [(HDHRCardioFitnessFeatureStatusManagerServer *)self _clientRemoteObjectProxy];
  objc_msgSend(v6, "client_didUpdateOnboardingStatus:", v9);

  uint64_t v7 = [(HDHRCardioFitnessFeatureStatusManagerServer *)self _determineNotificationStatusWithFeatureStatus:v5];

  uint64_t v8 = [(HDHRCardioFitnessFeatureStatusManagerServer *)self _clientRemoteObjectProxy];
  objc_msgSend(v8, "client_didUpdateNotificationStatus:", v7);
}

- (id)_clientRemoteObjectProxy
{
  v2 = [(HDStandardTaskServer *)self client];
  BOOL v3 = [v2 connection];
  id v4 = [v3 remoteObjectProxy];

  return v4;
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [v13 profile];
  uint64_t v16 = *MEMORY[0x1E4F29D18];
  int v17 = [v15 featureAvailabilityProvidingForFeatureIdentifier:*MEMORY[0x1E4F29D18]];

  if (v17)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F2B068]);
    uint64_t v19 = [v13 profile];
    id v20 = (void *)[v18 initWithFeatureAvailabilityProviding:v17 healthDataSource:v19 countryCodeSource:1];

    char v21 = [HDHRCardioFitnessFeatureStatusManagerServer alloc];
    id v22 = [v13 profile];
    uint64_t v23 = [v22 featureSettingsManager];
    objc_super v24 = [(HDHRCardioFitnessFeatureStatusManagerServer *)v21 initWithUUID:v11 configuration:v12 client:v13 delegate:v14 featureAvailabilityProvider:v17 featureStatusProvider:v20 featureSettingsManager:v23];

    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"No profile extension providing feature availability for %@", v16);
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  id v22 = v25;
  if (v25)
  {
    if (a7)
    {
      id v22 = v25;
      objc_super v24 = 0;
      *a7 = v22;
      id v20 = v22;
      goto LABEL_8;
    }
    _HKLogDroppedError();
  }
  objc_super v24 = 0;
  id v20 = v22;
LABEL_8:

  return v24;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  return 1;
}

- (id)exportedInterface
{
  return (id)MEMORY[0x1F4121730](self, a2);
}

- (id)remoteInterface
{
  return (id)MEMORY[0x1F4121728](self, a2);
}

+ (id)taskIdentifier
{
  return (id)[MEMORY[0x1E4F67DE8] taskIdentifier];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureSettingsManager, 0);
  objc_storeStrong((id *)&self->_featureStatusProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_featureAvailabilityProvider, 0);
}

- (void)_getOnboardingStatusWithError:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5_0();
  _os_log_fault_impl(&dword_1D3AC6000, v0, OS_LOG_TYPE_FAULT, "[%{public}@] Nil feature status given without error", v1, 0xCu);
}

- (void)_getOnboardingStatusWithError:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_0_6(&dword_1D3AC6000, v0, (uint64_t)v0, "[%{public}@] Error when retrieving feature status: %{public}@", v1);
}

void __93__HDHRCardioFitnessFeatureStatusManagerServer_remote_setNotificationsEnabled_withCompletion___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = (id *)(a1 + 40);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  int v9 = 138543618;
  id v10 = (id)objc_opt_class();
  __int16 v11 = 2114;
  uint64_t v12 = a3;
  id v7 = v10;
  OUTLINED_FUNCTION_0_6(&dword_1D3AC6000, v5, v8, "[%{public}@] Error when setting enablement key: %{public}@", (uint8_t *)&v9);
}

void __93__HDHRCardioFitnessFeatureStatusManagerServer_remote_setNotificationsEnabled_withCompletion___block_invoke_285_cold_1(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 40);
  BOOL v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = objc_opt_class();
  id v6 = OUTLINED_FUNCTION_0_0(v5);
  OUTLINED_FUNCTION_0_6(&dword_1D3AC6000, v3, v7, "[%{public}@] Error when setting notification details entered key: %{public}@", v8);
}

void __84__HDHRCardioFitnessFeatureStatusManagerServer_remote_resetOnboardingWithCompletion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a2;
  BOOL v3 = objc_opt_class();
  id v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_0_6(&dword_1D3AC6000, v2, v5, "[%{public}@] Error resetting onboarding: %{public}@", v6);
}

- (void)remote_startObservingChangesWithCompletion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5_0();
  _os_log_error_impl(&dword_1D3AC6000, v0, OS_LOG_TYPE_ERROR, "[%{public}@] Asked to start observation of changes but we already started.", v1, 0xCu);
}

- (void)_stopObservingChangesAndExpectToBeObserving:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5_0();
  _os_log_error_impl(&dword_1D3AC6000, v0, OS_LOG_TYPE_ERROR, "[%{public}@] Asked to stop observation of changes but we are not observing.", v1, 0xCu);
}

- (void)_stopObservingChangesAndExpectToBeObserving:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5_0();
  _os_log_debug_impl(&dword_1D3AC6000, v0, OS_LOG_TYPE_DEBUG, "[%{public}@] Stopping observation of changes", v1, 0xCu);
}

@end