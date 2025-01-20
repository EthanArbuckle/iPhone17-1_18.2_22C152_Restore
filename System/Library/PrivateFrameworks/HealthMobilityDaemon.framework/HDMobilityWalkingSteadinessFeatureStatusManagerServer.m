@interface HDMobilityWalkingSteadinessFeatureStatusManagerServer
+ (BOOL)_hasWriteEntitlement:(id)a3 withError:(id *)a4;
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)configurationClass;
+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (HDMobilityWalkingSteadinessFeatureStatusManagerServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 classificationsFeatureAvailabilityExtension:(id)a7 mobilitySettingsDefaults:(id)a8 featureStatusProvider:(id)a9;
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
- (void)remote_fitnessTrackingEnabledWithCompletion:(id)a3;
- (void)remote_notificationStatusWithCompletion:(id)a3;
- (void)remote_onboardingStatusWithCompletion:(id)a3;
- (void)remote_resetOnboardingWithCompletion:(id)a3;
- (void)remote_setNotificationsEnabled:(BOOL)a3 withCompletion:(id)a4;
- (void)remote_startObservingChangesWithCompletion:(id)a3;
- (void)remote_stopObservingChanges;
@end

@implementation HDMobilityWalkingSteadinessFeatureStatusManagerServer

- (HDMobilityWalkingSteadinessFeatureStatusManagerServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 classificationsFeatureAvailabilityExtension:(id)a7 mobilitySettingsDefaults:(id)a8 featureStatusProvider:(id)a9
{
  id v24 = a7;
  id v16 = a8;
  id v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)HDMobilityWalkingSteadinessFeatureStatusManagerServer;
  v18 = [(HDStandardTaskServer *)&v25 initWithUUID:a3 configuration:a4 client:a5 delegate:a6];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_classificationsFeatureAvailabilityExtension, a7);
    uint64_t v20 = HKCreateSerialDispatchQueue();
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v20;

    objc_storeStrong((id *)&v19->_mobilitySettingsDefaults, a8);
    v19->_observing = 0;
    objc_storeStrong((id *)&v19->_featureStatusProvider, a9);
    v22 = v19;
  }

  return v19;
}

- (void)dealloc
{
  [(HDMobilityWalkingSteadinessFeatureStatusManagerServer *)self _stopObservingChangesAndExpectToBeObserving:0];
  v3.receiver = self;
  v3.super_class = (Class)HDMobilityWalkingSteadinessFeatureStatusManagerServer;
  [(HDMobilityWalkingSteadinessFeatureStatusManagerServer *)&v3 dealloc];
}

- (void)remote_onboardingStatusWithCompletion:(id)a3
{
  id v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  v5 = [(HDMobilityWalkingSteadinessFeatureStatusManagerServer *)self _getOnboardingStatusWithError:&v7];
  id v6 = v7;
  v4[2](v4, v5, v6);
}

- (void)remote_notificationStatusWithCompletion:(id)a3
{
  id v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  v5 = [(HDMobilityWalkingSteadinessFeatureStatusManagerServer *)self _getNotificationStatusWithError:&v7];
  id v6 = v7;
  v4[2](v4, v5, v6);
}

- (void)remote_fitnessTrackingEnabledWithCompletion:(id)a3
{
  featureStatusProvider = self->_featureStatusProvider;
  id v8 = 0;
  v4 = (void (**)(id, uint64_t, id))a3;
  v5 = [(HKFeatureStatusProviding *)featureStatusProvider featureStatusWithError:&v8];
  id v6 = v8;
  if (v5)
  {
    id v7 = [v5 objectForKeyedSubscript:*MEMORY[0x263F45258]];
    v4[2](v4, [v7 isRequirementSatisfiedWithIdentifier:*MEMORY[0x263F09680]], v6);

    v4 = (void (**)(id, uint64_t, id))v7;
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_ERROR)) {
      -[HDMobilityWalkingSteadinessFeatureStatusManagerServer remote_fitnessTrackingEnabledWithCompletion:]();
    }
    v4[2](v4, 0, v6);
  }
}

+ (BOOL)_hasWriteEntitlement:(id)a3 withError:(id *)a4
{
  char v5 = [a3 hasEntitlement:*MEMORY[0x263F09BA8]];
  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_error:format:", 4, @"Unauthorized access to modify Walking Steadiness feature status");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (a4) {
        *a4 = v6;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v5;
}

- (void)remote_setNotificationsEnabled:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = (void (**)(id, uint64_t, void))a4;
  id v7 = objc_opt_class();
  id v8 = [(HDStandardTaskServer *)self client];
  v9 = [v8 entitlements];
  id v28 = 0;
  char v10 = [v7 _hasWriteEntitlement:v9 withError:&v28];
  id v11 = v28;

  if (v10)
  {
    [(NSUserDefaults *)self->_mobilitySettingsDefaults setBool:v4 forKey:@"EnableWalkingSteadinessNotifications"];
    v12 = [(HDStandardTaskServer *)self client];
    v13 = [v12 profile];
    v14 = [v13 featureSettingsManager];
    v15 = [NSNumber numberWithBool:v4];
    uint64_t v16 = *MEMORY[0x263F09820];
    uint64_t v17 = *MEMORY[0x263F09810];
    id v27 = v11;
    char v18 = [v14 setFeatureSettingsNumber:v15 forKey:v16 featureIdentifier:v17 suppressNotificationsToObserver:0 error:&v27];
    id v19 = v27;

    _HKInitializeLogging();
    uint64_t v20 = *MEMORY[0x263F09940];
    BOOL v21 = os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v21)
      {
        *(_DWORD *)buf = 138543362;
        v30 = self;
        _os_log_impl(&dword_221A40000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notification defaults written", buf, 0xCu);
      }
      v6[2](v6, 1, 0);
    }
    else
    {
      if (v21)
      {
        objc_super v25 = v20;
        uint64_t v26 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v30 = (HDMobilityWalkingSteadinessFeatureStatusManagerServer *)v26;
        __int16 v31 = 2114;
        id v32 = v19;
        _os_log_impl(&dword_221A40000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] Failed to set feature setting with error: %{public}@", buf, 0x16u);
      }
      ((void (**)(id, uint64_t, id))v6)[2](v6, 0, v19);
    }
    id v11 = v19;
  }
  else
  {
    _HKInitializeLogging();
    v22 = (void *)*MEMORY[0x263F09940];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_DEFAULT))
    {
      v23 = v22;
      uint64_t v24 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v30 = (HDMobilityWalkingSteadinessFeatureStatusManagerServer *)v24;
      __int16 v31 = 2114;
      id v32 = v11;
      _os_log_impl(&dword_221A40000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unauthorized call to set notifications enabled with error: %{public}@", buf, 0x16u);
    }
    ((void (**)(id, uint64_t, id))v6)[2](v6, 0, v11);
  }
}

- (void)remote_resetOnboardingWithCompletion:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = objc_opt_class();
  id v6 = [(HDStandardTaskServer *)self client];
  id v7 = [v6 entitlements];
  id v20 = 0;
  char v8 = [v5 _hasWriteEntitlement:v7 withError:&v20];
  id v9 = v20;

  _HKInitializeLogging();
  char v10 = (void *)*MEMORY[0x263F09940];
  BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v11)
    {
      v12 = v10;
      v13 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = (uint64_t)v13;
      id v14 = v13;
      _os_log_impl(&dword_221A40000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Resetting onboarding", buf, 0xCu);
    }
    classificationsFeatureAvailabilityExtension = self->_classificationsFeatureAvailabilityExtension;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __94__HDMobilityWalkingSteadinessFeatureStatusManagerServer_remote_resetOnboardingWithCompletion___block_invoke;
    v18[3] = &unk_2645D7C08;
    v18[4] = self;
    id v19 = v4;
    [(HDFeatureAvailabilityExtension *)classificationsFeatureAvailabilityExtension resetOnboardingWithCompletion:v18];
  }
  else
  {
    if (v11)
    {
      uint64_t v16 = v10;
      uint64_t v17 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = v17;
      _os_log_impl(&dword_221A40000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unauthorized call to reset onboarding", buf, 0xCu);
    }
    (*((void (**)(id, void, id))v4 + 2))(v4, 0, v9);
  }
}

void __94__HDMobilityWalkingSteadinessFeatureStatusManagerServer_remote_resetOnboardingWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    [*(id *)(*(void *)(a1 + 32) + 64) removeObjectForKey:@"EnableWalkingSteadinessNotifications"];
    id v6 = [*(id *)(a1 + 32) client];
    id v7 = [v6 profile];
    char v8 = [v7 featureSettingsManager];
    uint64_t v9 = *MEMORY[0x263F09810];
    id v12 = 0;
    [v8 resetFeatureSettingsForFeatureIdentifier:v9 suppressNotificationsToObserver:0 error:&v12];
    id v10 = v12;

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    BOOL v11 = (void *)*MEMORY[0x263F09940];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_ERROR)) {
      __94__HDMobilityWalkingSteadinessFeatureStatusManagerServer_remote_resetOnboardingWithCompletion___block_invoke_cold_1(a1, v11, (uint64_t)v5);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)remote_startObservingChangesWithCompletion:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, uint64_t, void))a3;
  if (self->_observing)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_ERROR)) {
      -[HDMobilityWalkingSteadinessFeatureStatusManagerServer remote_startObservingChangesWithCompletion:]();
    }
  }
  else
  {
    self->_observing = 1;
    _HKInitializeLogging();
    id v5 = *MEMORY[0x263F09940];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = self;
      _os_log_impl(&dword_221A40000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting observation of changes", (uint8_t *)&v6, 0xCu);
    }
    [(HKFeatureStatusProviding *)self->_featureStatusProvider registerObserver:self queue:self->_queue];
    v4[2](v4, 1, 0);
  }
}

- (void)remote_stopObservingChanges
{
}

- (id)_getOnboardingStatusWithError:(id *)a3
{
  featureStatusProvider = self->_featureStatusProvider;
  id v11 = 0;
  int v6 = [(HKFeatureStatusProviding *)featureStatusProvider featureStatusWithError:&v11];
  id v7 = v11;
  if (v6)
  {
    uint64_t v8 = [(HDMobilityWalkingSteadinessFeatureStatusManagerServer *)self _determineOnboardingStatusWithFeatureStatus:v6];
    goto LABEL_12;
  }
  _HKInitializeLogging();
  uint64_t v9 = *MEMORY[0x263F09940];
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[HDMobilityWalkingSteadinessFeatureStatusManagerServer remote_fitnessTrackingEnabledWithCompletion:]();
    }
    if (a3)
    {
      uint64_t v8 = 0;
      *a3 = v7;
      goto LABEL_12;
    }
    _HKLogDroppedError();
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    -[HDMobilityWalkingSteadinessFeatureStatusManagerServer _getOnboardingStatusWithError:]();
  }
  uint64_t v8 = 0;
LABEL_12:

  return v8;
}

- (id)_determineOnboardingStatusWithFeatureStatus:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v27 = [v4 objectForKeyedSubscript:*MEMORY[0x263F45250]];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F095A8]];
  int v6 = [v4 objectForKeyedSubscript:*MEMORY[0x263F45258]];
  objc_super v25 = v6;
  if ([v6 isRequirementSatisfiedWithIdentifier:*MEMORY[0x263F096D8]])
  {
    id v7 = v5;
    uint64_t v8 = objc_msgSend(v4, "onboardingRecord", v25);
    uint64_t v9 = [v8 earliestDateOfAnyOnboardingCompletion];

    uint64_t v10 = 0;
    uint64_t v11 = 1;
    goto LABEL_27;
  }
  char v12 = objc_msgSend(v6, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x263F096B0], v6);
  v13 = (os_log_t *)MEMORY[0x263F09940];
  if (v12)
  {
    uint64_t v10 = 0;
  }
  else
  {
    _HKInitializeLogging();
    id v14 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v29 = self;
      _os_log_impl(&dword_221A40000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] User is age gated, marking unavailability reason", buf, 0xCu);
    }
    uint64_t v10 = 1;
  }
  if (([v5 isRequirementSatisfiedWithIdentifier:*MEMORY[0x263F09710]] & 1) == 0)
  {
    _HKInitializeLogging();
    v15 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v29 = self;
      _os_log_impl(&dword_221A40000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Local device cannot support walking steadiness, marking unavailability reason", buf, 0xCu);
    }
    v10 |= 2uLL;
  }
  if (([v6 isRequirementSatisfiedWithIdentifier:*MEMORY[0x263F09680]] & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v16 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v29 = self;
      _os_log_impl(&dword_221A40000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] User has motion & fitness disabled, marking onboarding unavailability reason", buf, 0xCu);
    }
    v10 |= 4uLL;
  }
  if ([v5 isRequirementSatisfiedWithIdentifier:*MEMORY[0x263F09688]])
  {
    if (!v10)
    {
      id v7 = v5;
      _HKInitializeLogging();
      uint64_t v17 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v29 = self;
        _os_log_impl(&dword_221A40000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] User not onboarded but no reason why they couldn't onboard", buf, 0xCu);
      }
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      uint64_t v11 = 2;
      goto LABEL_27;
    }
  }
  else
  {
    _HKInitializeLogging();
    char v18 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v29 = self;
      _os_log_impl(&dword_221A40000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] User has health app hidden, marking onboarding unavailability reason", buf, 0xCu);
    }
    v10 |= 8uLL;
  }
  id v7 = v5;
  _HKInitializeLogging();
  id v19 = *v13;
  if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v29 = self;
    _os_log_impl(&dword_221A40000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] User not onboarded but onboarding unavailable", buf, 0xCu);
  }
  uint64_t v9 = 0;
  uint64_t v11 = 0;
LABEL_27:
  id v20 = [v4 objectForKeyedSubscript:*MEMORY[0x263F095B0]];
  id v21 = objc_alloc(MEMORY[0x263F452E8]);
  uint64_t v22 = [v20 areAllRequirementsSatisfied];
  uint64_t v23 = objc_msgSend(v21, "initWithState:unavailableReasons:dateOnboarded:shouldOnboardingTileBeAdvertised:isLocaleValidOnLocalDevice:isClassificationAvailable:", v11, v10, v9, v22, objc_msgSend(v20, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x263F09650]), objc_msgSend(v27, "areAllRequirementsSatisfied"));

  return v23;
}

- (id)_getNotificationStatusWithError:(id *)a3
{
  featureStatusProvider = self->_featureStatusProvider;
  id v11 = 0;
  int v6 = [(HKFeatureStatusProviding *)featureStatusProvider featureStatusWithError:&v11];
  id v7 = v11;
  if (v6)
  {
    uint64_t v8 = [(HDMobilityWalkingSteadinessFeatureStatusManagerServer *)self _determineNotificationStatusWithFeatureStatus:v6];
    goto LABEL_12;
  }
  _HKInitializeLogging();
  uint64_t v9 = *MEMORY[0x263F09940];
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[HDMobilityWalkingSteadinessFeatureStatusManagerServer remote_fitnessTrackingEnabledWithCompletion:]();
    }
    if (a3)
    {
      uint64_t v8 = 0;
      *a3 = v7;
      goto LABEL_12;
    }
    _HKLogDroppedError();
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    -[HDMobilityWalkingSteadinessFeatureStatusManagerServer _getOnboardingStatusWithError:]();
  }
  uint64_t v8 = 0;
LABEL_12:

  return v8;
}

- (id)_determineNotificationStatusWithFeatureStatus:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F0A980] sharedBehavior];
  char v6 = [v5 isAppleWatch];

  if (v6)
  {
    id v7 = 0;
    goto LABEL_47;
  }
  uint64_t v8 = [v4 objectForKeyedSubscript:*MEMORY[0x263F45258]];
  uint64_t v9 = [v4 objectForKeyedSubscript:*MEMORY[0x263F45268]];
  uint64_t v10 = [v9 isRequirementSatisfiedWithIdentifier:*MEMORY[0x263F09680]];
  uint64_t v11 = *MEMORY[0x263F096C8];
  int v12 = [v9 isRequirementSatisfiedWithIdentifier:*MEMORY[0x263F096C8]];
  int v13 = [v8 areAllRequirementsSatisfied];
  id v14 = (os_log_t *)MEMORY[0x263F09940];
  if (v13)
  {
    _HKInitializeLogging();
    v15 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v44 = self;
      _os_log_impl(&dword_221A40000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifications enabled, sending back enabled notification status", buf, 0xCu);
    }
    id v16 = objc_alloc(MEMORY[0x263F452E0]);
    uint64_t v17 = v12 ^ 1u;
    uint64_t v18 = 1;
    uint64_t v19 = 0;
    uint64_t v20 = v10;
  }
  else
  {
    v41 = v9;
    id v21 = self;
    uint64_t v22 = [v8 unsatisfiedRequirementIdentifiers];
    uint64_t v42 = *MEMORY[0x263F09678];
    uint64_t v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v42 count:1];
    int v24 = [v22 isEqualToArray:v23];

    if (v24)
    {
      _HKInitializeLogging();
      objc_super v25 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v44 = v21;
        _os_log_impl(&dword_221A40000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifications disabled but otherwise clear, sending back disabled notification status", buf, 0xCu);
      }
      id v7 = (void *)[objc_alloc(MEMORY[0x263F452E0]) initWithState:2 unavailableReasons:0 fitnessTrackingEnabled:v10 healthNotificationsDisabled:v12 ^ 1u];
      uint64_t v9 = v41;
      goto LABEL_46;
    }
    uint64_t v26 = v14;
    if ([v8 isRequirementSatisfiedWithIdentifier:*MEMORY[0x263F096B0]])
    {
      uint64_t v27 = 0;
      uint64_t v28 = v10;
      v29 = v21;
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v30 = *v14;
      BOOL v31 = os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT);
      uint64_t v28 = v10;
      v29 = v21;
      if (v31)
      {
        *(_DWORD *)buf = 138543362;
        v44 = v21;
        _os_log_impl(&dword_221A40000, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@] User is age gated, marking notification unavailability reason", buf, 0xCu);
      }
      uint64_t v27 = 1;
    }
    uint64_t v9 = v41;
    if (([v8 isRequirementSatisfiedWithIdentifier:*MEMORY[0x263F09628]] & 1) == 0)
    {
      _HKInitializeLogging();
      id v32 = *v26;
      if (os_log_type_enabled(*v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v44 = v29;
        _os_log_impl(&dword_221A40000, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@] Age is not present, marking notification unavailability reason", buf, 0xCu);
      }
      v27 |= 2uLL;
    }
    if (([v8 isRequirementSatisfiedWithIdentifier:*MEMORY[0x263F09710]] & 1) == 0)
    {
      _HKInitializeLogging();
      uint64_t v33 = *v26;
      if (os_log_type_enabled(*v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v44 = v29;
        _os_log_impl(&dword_221A40000, v33, OS_LOG_TYPE_DEFAULT, "[%{public}@] Device not capable of walking steadiness, marking notification unavailability reason", buf, 0xCu);
      }
      v27 |= 4uLL;
    }
    if ((v28 & 1) == 0)
    {
      _HKInitializeLogging();
      v34 = *v26;
      if (os_log_type_enabled(*v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v44 = v29;
        _os_log_impl(&dword_221A40000, v34, OS_LOG_TYPE_DEFAULT, "[%{public}@] User has fitness tracking disabled, marking notification unavailability reason", buf, 0xCu);
      }
      v27 |= 8uLL;
    }
    if (([v8 isRequirementSatisfiedWithIdentifier:*MEMORY[0x263F09688]] & 1) == 0)
    {
      _HKInitializeLogging();
      v35 = *v26;
      if (os_log_type_enabled(*v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v44 = v29;
        _os_log_impl(&dword_221A40000, v35, OS_LOG_TYPE_DEFAULT, "[%{public}@] User has health app hidden, marking notification unavailability reason", buf, 0xCu);
      }
      v27 |= 0x10uLL;
    }
    if (([v8 isRequirementSatisfiedWithIdentifier:*MEMORY[0x263F09698]] & 1) == 0)
    {
      _HKInitializeLogging();
      v36 = *v26;
      if (os_log_type_enabled(*v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v44 = v29;
        _os_log_impl(&dword_221A40000, v36, OS_LOG_TYPE_DEFAULT, "[%{public}@] User no longer has any values for Height set, marking notification unavailability reason", buf, 0xCu);
      }
      v27 |= 0x40uLL;
    }
    if (([v8 isRequirementSatisfiedWithIdentifier:*MEMORY[0x263F096E0]] & 1) == 0)
    {
      _HKInitializeLogging();
      v37 = *v26;
      if (os_log_type_enabled(*v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v44 = v29;
        _os_log_impl(&dword_221A40000, v37, OS_LOG_TYPE_DEFAULT, "[%{public}@] User has not onboarded, marking notification unavailability reason", buf, 0xCu);
      }
      v27 |= 0x20uLL;
    }
    if (([v8 isRequirementSatisfiedWithIdentifier:*MEMORY[0x263F096D8]] & 1) == 0)
    {
      _HKInitializeLogging();
      v38 = *v26;
      if (os_log_type_enabled(*v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v44 = v29;
        _os_log_impl(&dword_221A40000, v38, OS_LOG_TYPE_DEFAULT, "[%{public}@] User has not onboarded, marking notification unavailability reason", buf, 0xCu);
      }
      v27 |= 0x20uLL;
    }
    uint64_t v39 = [v41 isRequirementSatisfiedWithIdentifier:v11] ^ 1;
    id v16 = objc_alloc(MEMORY[0x263F452E0]);
    uint64_t v18 = 0;
    uint64_t v19 = v27;
    uint64_t v20 = v28;
    uint64_t v17 = v39;
  }
  id v7 = (void *)[v16 initWithState:v18 unavailableReasons:v19 fitnessTrackingEnabled:v20 healthNotificationsDisabled:v17];
LABEL_46:

LABEL_47:
  return v7;
}

- (void)_stopObservingChangesAndExpectToBeObserving:(BOOL)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (self->_observing)
  {
    [(HKFeatureStatusProviding *)self->_featureStatusProvider unregisterObserver:self];
    self->_observing = 0;
    _HKInitializeLogging();
    id v4 = *MEMORY[0x263F09940];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      char v6 = self;
      _os_log_impl(&dword_221A40000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Stopping observation of changes", (uint8_t *)&v5, 0xCu);
    }
  }
  else if (a3)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_ERROR)) {
      -[HDMobilityWalkingSteadinessFeatureStatusManagerServer _stopObservingChangesAndExpectToBeObserving:]();
    }
  }
}

- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4
{
  id v5 = a4;
  id v9 = [(HDMobilityWalkingSteadinessFeatureStatusManagerServer *)self _determineOnboardingStatusWithFeatureStatus:v5];
  char v6 = [(HDMobilityWalkingSteadinessFeatureStatusManagerServer *)self _clientRemoteObjectProxy];
  objc_msgSend(v6, "client_didUpdateOnboardingStatus:", v9);

  uint64_t v7 = [(HDMobilityWalkingSteadinessFeatureStatusManagerServer *)self _determineNotificationStatusWithFeatureStatus:v5];

  uint64_t v8 = [(HDMobilityWalkingSteadinessFeatureStatusManagerServer *)self _clientRemoteObjectProxy];
  objc_msgSend(v8, "client_didUpdateNotificationStatus:", v7);
}

- (id)_clientRemoteObjectProxy
{
  v2 = [(HDStandardTaskServer *)self client];
  objc_super v3 = [v2 connection];
  id v4 = [v3 remoteObjectProxy];

  return v4;
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v11 profile];
  v15 = [v14 profileExtensionWithIdentifier:*MEMORY[0x263F45290]];

  id v16 = [v15 featureAvailabilityExtensionForFeatureIdentifier:*MEMORY[0x263F09810]];
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.Mobility.notifications"];
  id v18 = objc_alloc(MEMORY[0x263F0A3D0]);
  uint64_t v19 = [v11 profile];
  uint64_t v20 = (void *)[v18 initWithFeatureAvailabilityProviding:v16 healthDataSource:v19 countryCodeSource:1];

  id v21 = [[HDMobilityWalkingSteadinessFeatureStatusManagerServer alloc] initWithUUID:v13 configuration:v12 client:v11 delegate:v10 classificationsFeatureAvailabilityExtension:v16 mobilitySettingsDefaults:v17 featureStatusProvider:v20];
  return v21;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x263EFFA68];
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  id v7 = a4;
  uint64_t v8 = [v7 entitlements];
  LOBYTE(a1) = [a1 _hasWriteEntitlement:v8 withError:0];

  if ((a1 & 1) != 0
    || ([v7 entitlements],
        id v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 hasEntitlement:*MEMORY[0x263F09B28]],
        v9,
        (v10 & 1) != 0))
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_error:format:", 4, @"Unauthorized access of Walking Steadiness feature status");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if (a5) {
        *a5 = v12;
      }
      else {
        _HKLogDroppedError();
      }
    }

    BOOL v11 = 0;
  }

  return v11;
}

- (id)exportedInterface
{
  return (id)MEMORY[0x270F35E08](self, a2);
}

- (id)remoteInterface
{
  return (id)MEMORY[0x270F35E00](self, a2);
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x263F452A0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobilitySettingsDefaults, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_featureStatusProvider, 0);
  objc_storeStrong((id *)&self->_classificationsFeatureAvailabilityExtension, 0);
}

- (void)remote_fitnessTrackingEnabledWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_221A40000, v0, v1, "[%{public}@] Error when retrieving feature status: %{public}@");
}

void __94__HDMobilityWalkingSteadinessFeatureStatusManagerServer_remote_resetOnboardingWithCompletion___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a2;
  int v5 = 138543618;
  uint64_t v6 = objc_opt_class();
  __int16 v7 = 2114;
  uint64_t v8 = a3;
  _os_log_error_impl(&dword_221A40000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error resetting onboarding: %{public}@", (uint8_t *)&v5, 0x16u);
}

- (void)remote_startObservingChangesWithCompletion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_221A40000, v0, OS_LOG_TYPE_ERROR, "[%{public}@] Asked to start observation of changes but we already started.", v1, 0xCu);
}

- (void)_getOnboardingStatusWithError:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_221A40000, v0, OS_LOG_TYPE_FAULT, "[%{public}@] Nil feature status given without error", v1, 0xCu);
}

- (void)_stopObservingChangesAndExpectToBeObserving:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_221A40000, v0, OS_LOG_TYPE_ERROR, "[%{public}@] Asked to stop observation of changes but we are not observing.", v1, 0xCu);
}

@end