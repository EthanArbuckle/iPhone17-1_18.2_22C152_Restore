@interface HRAtrialFibrillationOnboardingManager
- (HKFeatureAvailabilityStore)featureAvailabilityStore;
- (HKOnboardingManager)onboardingManager;
- (HRAtrialFibrillationOnboardingManager)initWithOnboardingType:(int64_t)a3 isFirstTimeOnboarding:(BOOL)a4 healthStore:(id)a5 dateCache:(id)a6 provenance:(int64_t)a7 delegate:(id)a8;
- (HRAtrialFibrillationOnboardingManagerDelegate)delegate;
- (NSNumber)hasAtrialFibrillationDiagnosis;
- (_HRAtrialFibrillationOnboardingNavigationController)navigationController;
- (id)availableOnboardingStepsForOnboardingManager:(id)a3;
- (id)onboardingManager:(id)a3 customViewControllerForPage:(id)a4;
- (id)onboardingManager:(id)a3 sequenceForStep:(int64_t)a4 onboardingType:(int64_t)a5;
- (id)onboardingNavigationController;
- (int64_t)provenance;
- (void)_setOnboardingCompletedForCountryCode:(id)a3;
- (void)_submitTipsDiscoverabilitySignal;
- (void)_wrapUpOnboardingWithNotificationsEnabled:(BOOL)a3;
- (void)didBeginOnboardingForOnboardingManager:(id)a3;
- (void)didCancelOnboardingForOnboardingManager:(id)a3;
- (void)didCompleteOnboardingForOnboardingManager:(id)a3;
- (void)dismissOnboarding;
- (void)onboardingManager:(id)a3 willMoveToPage:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setHasAtrialFibrillationDiagnosis:(id)a3;
@end

@implementation HRAtrialFibrillationOnboardingManager

- (HRAtrialFibrillationOnboardingManager)initWithOnboardingType:(int64_t)a3 isFirstTimeOnboarding:(BOOL)a4 healthStore:(id)a5 dateCache:(id)a6 provenance:(int64_t)a7 delegate:(id)a8
{
  BOOL v11 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  v27.receiver = self;
  v27.super_class = (Class)HRAtrialFibrillationOnboardingManager;
  v17 = [(HRAtrialFibrillationOnboardingManager *)&v27 init];
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_delegate, v16);
    v18->_provenance = a7;
    v19 = objc_alloc_init(_HRAtrialFibrillationOnboardingNavigationController);
    navigationController = v18->_navigationController;
    v18->_navigationController = v19;

    uint64_t v21 = [objc_alloc(MEMORY[0x263F46888]) initWithOnboardingType:a3 isFirstTimeOnboarding:v11 healthStore:v14 dateCache:v15 navigationController:v18->_navigationController];
    onboardingManager = v18->_onboardingManager;
    v18->_onboardingManager = (HKOnboardingManager *)v21;

    [(HKOnboardingManager *)v18->_onboardingManager setDataSource:v18];
    [(HKOnboardingManager *)v18->_onboardingManager setDelegate:v18];
    id v23 = objc_alloc(MEMORY[0x263F0A3B8]);
    uint64_t v24 = [v23 initWithFeatureIdentifier:*MEMORY[0x263F09778] healthStore:v14];
    featureAvailabilityStore = v18->_featureAvailabilityStore;
    v18->_featureAvailabilityStore = (HKFeatureAvailabilityStore *)v24;

    [(_HRAtrialFibrillationOnboardingNavigationController *)v18->_navigationController setOnboardingManager:v18];
  }

  return v18;
}

- (id)onboardingNavigationController
{
  v2 = [(HRAtrialFibrillationOnboardingManager *)self onboardingManager];
  v3 = [v2 onboardingNavigationController];

  return v3;
}

- (void)dismissOnboarding
{
  v3 = [(HRAtrialFibrillationOnboardingManager *)self onboardingManager];
  [v3 dismissOnboarding];

  navigationController = self->_navigationController;
  [(_HRAtrialFibrillationOnboardingNavigationController *)navigationController setOnboardingManager:0];
}

- (id)availableOnboardingStepsForOnboardingManager:(id)a3
{
  return &unk_26D2BF348;
}

- (id)onboardingManager:(id)a3 sequenceForStep:(int64_t)a4 onboardingType:(int64_t)a5
{
  id v8 = a3;
  if (a4 == 2)
  {
    if (a5 != 1)
    {
      if (a5) {
        goto LABEL_15;
      }
      uint64_t v9 = [MEMORY[0x263F46898] firstTimeAtrialFibrillationOnboardingSequence];
      goto LABEL_9;
    }
    _HKInitializeLogging();
    v10 = *MEMORY[0x263F09920];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
  }
  else
  {
    if (a4 != 1) {
      goto LABEL_15;
    }
    if (a5 != 1)
    {
      if (a5) {
        goto LABEL_15;
      }
      uint64_t v9 = [MEMORY[0x263F46898] firstTimeAtrialFibrillationAvailabilitySequence];
LABEL_9:
      v5 = (void *)v9;
      goto LABEL_15;
    }
    _HKInitializeLogging();
    v10 = *MEMORY[0x263F09920];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR)) {
LABEL_13:
    }
      -[HRAtrialFibrillationOnboardingManager onboardingManager:sequenceForStep:onboardingType:](v10);
  }
  v5 = 0;
LABEL_15:

  return v5;
}

- (id)onboardingManager:(id)a3 customViewControllerForPage:(id)a4
{
  if (objc_msgSend(a4, "sequencePage", a3) == 1)
  {
    v5 = [HROnboardingAtrialFibrillationGateViewController alloc];
    v6 = [(HRAtrialFibrillationOnboardingManager *)self hasAtrialFibrillationDiagnosis];
    id v7 = [(HROnboardingAtrialFibrillationGateViewController *)v5 initForOnboarding:1 hasAtrialFibrillationDiagnosis:v6];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (void)didBeginOnboardingForOnboardingManager:(id)a3
{
  id v4 = +[HRUIAnalyticsManager sharedManager];
  objc_msgSend(v4, "trackAtrialFibrillationDetectionOnboardingStep:forOnboardingVersion:countryCode:provenance:", 0, 1, 0, -[HRAtrialFibrillationOnboardingManager provenance](self, "provenance"));
}

- (void)onboardingManager:(id)a3 willMoveToPage:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "sequencePage", a3);
  if (v5 == 4)
  {
    v13 = [(HRAtrialFibrillationOnboardingManager *)self onboardingManager];
    id v14 = [v13 userInfo];
    id v15 = [v14 objectForKeyedSubscript:@"HROnboardingAtrialFibrillationCountryCodeKey"];

    [(HRAtrialFibrillationOnboardingManager *)self _setOnboardingCompletedForCountryCode:v15];
    v6 = +[HRUIAnalyticsManager sharedManager];
    id v7 = [v15 ISOCode];
    objc_msgSend(v6, "trackAtrialFibrillationDetectionOnboardingStep:forOnboardingVersion:countryCode:provenance:", 3, 1, v7, -[HRAtrialFibrillationOnboardingManager provenance](self, "provenance"));
  }
  else
  {
    if (v5 == 2)
    {
      id v15 = +[HRUIAnalyticsManager sharedManager];
      v6 = [(HRAtrialFibrillationOnboardingManager *)self onboardingManager];
      id v7 = [v6 userInfo];
      id v8 = [v7 objectForKeyedSubscript:@"HROnboardingAtrialFibrillationCountryCodeKey"];
      uint64_t v9 = [v8 ISOCode];
      int64_t v10 = [(HRAtrialFibrillationOnboardingManager *)self provenance];
      BOOL v11 = v15;
      uint64_t v12 = 2;
    }
    else
    {
      if (v5 != 1) {
        return;
      }
      id v15 = +[HRUIAnalyticsManager sharedManager];
      v6 = [(HRAtrialFibrillationOnboardingManager *)self onboardingManager];
      id v7 = [v6 userInfo];
      id v8 = [v7 objectForKeyedSubscript:@"HROnboardingAtrialFibrillationCountryCodeKey"];
      uint64_t v9 = [v8 ISOCode];
      int64_t v10 = [(HRAtrialFibrillationOnboardingManager *)self provenance];
      BOOL v11 = v15;
      uint64_t v12 = 1;
    }
    [v11 trackAtrialFibrillationDetectionOnboardingStep:v12 forOnboardingVersion:1 countryCode:v9 provenance:v10];
  }
}

- (void)_setOnboardingCompletedForCountryCode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HRAtrialFibrillationOnboardingManager *)self featureAvailabilityStore];
  v6 = [v4 ISOCode];
  uint64_t v7 = [v4 provenance];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __79__HRAtrialFibrillationOnboardingManager__setOnboardingCompletedForCountryCode___block_invoke;
  v8[3] = &unk_2645811E8;
  v8[4] = self;
  [v5 setCurrentOnboardingVersionCompletedForCountryCode:v6 countryCodeProvenance:v7 date:0 settings:0 completion:v8];
}

void __79__HRAtrialFibrillationOnboardingManager__setOnboardingCompletedForCountryCode___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x263F09920];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR)) {
      __79__HRAtrialFibrillationOnboardingManager__setOnboardingCompletedForCountryCode___block_invoke_cold_1(a1, v6);
    }
  }
}

- (void)didCancelOnboardingForOnboardingManager:(id)a3
{
  id v4 = [(HRAtrialFibrillationOnboardingManager *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(HRAtrialFibrillationOnboardingManager *)self delegate];
    [v6 didDismissOnboarding];
  }
  navigationController = self->_navigationController;
  [(_HRAtrialFibrillationOnboardingNavigationController *)navigationController setOnboardingManager:0];
}

- (void)didCompleteOnboardingForOnboardingManager:(id)a3
{
  id v4 = [(HRAtrialFibrillationOnboardingManager *)self onboardingManager];
  uint64_t v5 = [v4 userInfo];
  id v8 = [(id)v5 objectForKeyedSubscript:@"HROnboardingAtrialFibrillationEnableNotificationsKey"];

  -[HRAtrialFibrillationOnboardingManager _wrapUpOnboardingWithNotificationsEnabled:](self, "_wrapUpOnboardingWithNotificationsEnabled:", [v8 BOOLValue]);
  v6 = [(HRAtrialFibrillationOnboardingManager *)self delegate];
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v7 = [(HRAtrialFibrillationOnboardingManager *)self delegate];
    [v7 didCompleteOnboarding];
  }
}

- (void)_wrapUpOnboardingWithNotificationsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(HRAtrialFibrillationOnboardingManager *)self featureAvailabilityStore];
  v6 = [NSNumber numberWithBool:v3];
  uint64_t v7 = *MEMORY[0x263F09820];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __83__HRAtrialFibrillationOnboardingManager__wrapUpOnboardingWithNotificationsEnabled___block_invoke;
  v13[3] = &unk_2645811E8;
  v13[4] = self;
  [v5 setFeatureSettingNumber:v6 forKey:v7 completion:v13];

  id v8 = +[HRUIAnalyticsManager sharedManager];
  uint64_t v9 = [(HRAtrialFibrillationOnboardingManager *)self onboardingManager];
  int64_t v10 = [v9 userInfo];
  BOOL v11 = [v10 objectForKeyedSubscript:@"HROnboardingAtrialFibrillationCountryCodeKey"];
  uint64_t v12 = [v11 ISOCode];
  objc_msgSend(v8, "trackAtrialFibrillationDetectionOnboardingStep:forOnboardingVersion:countryCode:provenance:", 4, 1, v12, -[HRAtrialFibrillationOnboardingManager provenance](self, "provenance"));

  [(HRAtrialFibrillationOnboardingManager *)self _submitTipsDiscoverabilitySignal];
}

void __83__HRAtrialFibrillationOnboardingManager__wrapUpOnboardingWithNotificationsEnabled___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x263F09920];
  uint64_t v7 = *MEMORY[0x263F09920];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v6;
      *(_DWORD *)buf = 138543362;
      id v14 = (id)objc_opt_class();
      id v9 = v14;
      _os_log_impl(&dword_220CA3000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Successfully set IRN setting", buf, 0xCu);
    }
    int64_t v10 = [*(id *)(a1 + 32) delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __83__HRAtrialFibrillationOnboardingManager__wrapUpOnboardingWithNotificationsEnabled___block_invoke_299;
      block[3] = &unk_264581110;
      block[4] = *(void *)(a1 + 32);
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __83__HRAtrialFibrillationOnboardingManager__wrapUpOnboardingWithNotificationsEnabled___block_invoke_cold_1(a1, v6);
  }
}

void __83__HRAtrialFibrillationOnboardingManager__wrapUpOnboardingWithNotificationsEnabled___block_invoke_299(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 didEnableAtrialFibrillationNotifications];
}

- (void)_submitTipsDiscoverabilitySignal
{
  v2 = BiomeLibrary();
  BOOL v3 = [v2 Discoverability];
  id v6 = [v3 Signals];

  id v4 = [v6 source];
  id v5 = (void *)[objc_alloc(MEMORY[0x263F2A0D8]) initWithContentIdentifier:@"com.apple.health.heart.irregular-rhythm-notifications-onboarding-completed" context:0 osBuild:0 userInfo:0];
  [v4 sendEvent:v5];
}

- (int64_t)provenance
{
  return self->_provenance;
}

- (NSNumber)hasAtrialFibrillationDiagnosis
{
  return self->_hasAtrialFibrillationDiagnosis;
}

- (void)setHasAtrialFibrillationDiagnosis:(id)a3
{
}

- (HKOnboardingManager)onboardingManager
{
  return self->_onboardingManager;
}

- (_HRAtrialFibrillationOnboardingNavigationController)navigationController
{
  return self->_navigationController;
}

- (HRAtrialFibrillationOnboardingManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HRAtrialFibrillationOnboardingManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HKFeatureAvailabilityStore)featureAvailabilityStore
{
  return self->_featureAvailabilityStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureAvailabilityStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_onboardingManager, 0);
  objc_storeStrong((id *)&self->_hasAtrialFibrillationDiagnosis, 0);
}

- (void)onboardingManager:(os_log_t)log sequenceForStep:onboardingType:.cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_220CA3000, log, OS_LOG_TYPE_ERROR, "Error, there is no upgrade sequence for atrial fibrillation.", v1, 2u);
}

void __79__HRAtrialFibrillationOnboardingManager__setOnboardingCompletedForCountryCode___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = objc_opt_class();
  id v4 = OUTLINED_FUNCTION_0_2(v3);
  OUTLINED_FUNCTION_1_1(&dword_220CA3000, v5, v6, "%{public}@: Failed to complete IRN onboarding with error: %{public}@", v7, v8, v9, v10, v11);
}

void __83__HRAtrialFibrillationOnboardingManager__wrapUpOnboardingWithNotificationsEnabled___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = objc_opt_class();
  id v4 = OUTLINED_FUNCTION_0_2(v3);
  OUTLINED_FUNCTION_1_1(&dword_220CA3000, v5, v6, "[%{public}@]: Failed to set IRN setting: %{public}@", v7, v8, v9, v10, v11);
}

@end