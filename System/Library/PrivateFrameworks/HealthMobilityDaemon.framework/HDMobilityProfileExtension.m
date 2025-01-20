@interface HDMobilityProfileExtension
- (HDMobilityProfileExtension)initWithProfile:(id)a3;
- (id)featureAvailabilityExtensionForFeatureIdentifier:(id)a3;
- (void)_triggerImmediateSyncWithReason:(id)a3;
- (void)onboardingAcknowledgementMigrationManager:(id)a3 didCompleteMigrationWithDidUpdate:(BOOL)a4;
- (void)settingsMigrationManagerDidCompleteMigration:(id)a3 didRunMigrationSteps:(BOOL)a4;
@end

@implementation HDMobilityProfileExtension

- (id)featureAvailabilityExtensionForFeatureIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x263F09818]])
  {
    uint64_t v5 = 40;
LABEL_5:
    id v6 = *(id *)((char *)&self->super.isa + v5);
    goto LABEL_7;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F09810]])
  {
    uint64_t v5 = 24;
    goto LABEL_5;
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

- (HDMobilityProfileExtension)initWithProfile:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)HDMobilityProfileExtension;
  uint64_t v5 = [(HDMobilityProfileExtension *)&v37 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v7 = [MEMORY[0x263F0A980] sharedBehavior];
    char v8 = [v7 isAppleWatch];

    v9 = (os_log_t *)MEMORY[0x263F09940];
    if ((v8 & 1) == 0)
    {
      id v10 = objc_alloc_init(MEMORY[0x263F431F0]);
      v11 = [MEMORY[0x263F43300] anyCountryAvailability];
      id v12 = objc_alloc(MEMORY[0x263F431E8]);
      uint64_t v13 = *MEMORY[0x263F09810];
      v14 = [MEMORY[0x263F452D8] requirementSet];
      uint64_t v15 = [v12 initWithProfile:v4 featureIdentifier:v13 availabilityRequirements:v14 currentOnboardingVersion:1 pairedDeviceCapability:0 regionAvailabilityProvider:v11 disableAndExpiryProvider:v10 loggingCategory:*v9];
      walkingSteadinessClassificationsAvailabilityManager = v6->_walkingSteadinessClassificationsAvailabilityManager;
      v6->_walkingSteadinessClassificationsAvailabilityManager = (HDFeatureAvailabilityManager *)v15;

      v17 = [[HDMobilityNotificationManager alloc] initWithProfile:v4 walkingSteadinessAvailabilityManager:v6->_walkingSteadinessClassificationsAvailabilityManager];
      notificationManager = v6->_notificationManager;
      v6->_notificationManager = v17;

      v19 = [v4 daemon];
      v20 = [v19 behavior];
      LODWORD(v14) = [v20 isCompanionCapable];

      if (v14)
      {
        uint64_t v21 = [objc_alloc(MEMORY[0x263F43178]) initWithProfile:v4 featureAvailabilityExtension:v6->_walkingSteadinessClassificationsAvailabilityManager loggingCategory:*v9];
        walkingSteadinessClassificationsBackgroundFeatureDeliveryManager = v6->_walkingSteadinessClassificationsBackgroundFeatureDeliveryManager;
        v6->_walkingSteadinessClassificationsBackgroundFeatureDeliveryManager = (HDBackgroundFeatureDeliveryManager *)v21;

        if ([v4 profileType] == 1)
        {
          uint64_t v23 = [objc_alloc(MEMORY[0x263F43328]) initForWalkingSteadinessWithProfile:v4 delegate:v6];
          settingsMigrationManager = v6->_settingsMigrationManager;
          v6->_settingsMigrationManager = (HDSettingsMigrationManager *)v23;
        }
      }
      v25 = [[HDMobilityWalkingSteadinessFeatureAvailabilityManager alloc] initWithProfile:v4 regionAvailabilityProvider:v11];
      walkingSteadinessNotificationsAvailabilityManager = v6->_walkingSteadinessNotificationsAvailabilityManager;
      v6->_walkingSteadinessNotificationsAvailabilityManager = v25;

      id v27 = objc_alloc(MEMORY[0x263F43158]);
      v28 = (void *)[objc_alloc(MEMORY[0x263F0A0C0]) initWithLoggingCategory:*v9 healthDataSource:v4];
      uint64_t v29 = [v27 initWithProfile:v4 eventSubmissionManager:v28 logCategory:*v9 eventConstructor:&__block_literal_global];
      walkingSteadinessDailyAnalyticsEventManager = v6->_walkingSteadinessDailyAnalyticsEventManager;
      v6->_walkingSteadinessDailyAnalyticsEventManager = (HDAnalyticsDailyEventManager *)v29;
    }
    _HKInitializeLogging();
    os_log_t v31 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      v32 = v31;
      uint64_t v33 = objc_opt_class();
      uint64_t v34 = [v4 profileType];
      *(_DWORD *)buf = 138543618;
      uint64_t v39 = v33;
      __int16 v40 = 2048;
      uint64_t v41 = v34;
      _os_log_impl(&dword_221A40000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ Plugin loaded for profileType %ld", buf, 0x16u);
    }
    v35 = v6;
  }

  return v6;
}

id __46__HDMobilityProfileExtension_initWithProfile___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource alloc] initWithProfile:v2];

  id v4 = (void *)[objc_alloc(MEMORY[0x263F452B8]) initWithDataSource:v3];
  return v4;
}

- (void)settingsMigrationManagerDidCompleteMigration:(id)a3 didRunMigrationSteps:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x263F09940];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    int v14 = 138543362;
    id v15 = (id)objc_opt_class();
    id v8 = v15;
    _os_log_impl(&dword_221A40000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Settings migration finished, initiating onboarding acknowledgement migration manager", (uint8_t *)&v14, 0xCu);
  }
  settingsMigrationManager = self->_settingsMigrationManager;
  self->_settingsMigrationManager = 0;

  id v10 = [HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v12 = [(HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager *)v10 initWithProfile:WeakRetained delegate:self];
  walkingSteadinessOnboardingAcknowledgementMigrationManager = self->_walkingSteadinessOnboardingAcknowledgementMigrationManager;
  self->_walkingSteadinessOnboardingAcknowledgementMigrationManager = v12;

  if (v4) {
    [(HDMobilityProfileExtension *)self _triggerImmediateSyncWithReason:@"HDMobilityProfileExtension.settingsMigrationManagerDidRunMigrationSteps"];
  }
}

- (void)onboardingAcknowledgementMigrationManager:(id)a3 didCompleteMigrationWithDidUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v11 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x263F09940];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    int v9 = 138543362;
    id v10 = (id)objc_opt_class();
    id v8 = v10;
    _os_log_impl(&dword_221A40000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Onboarding acknowledgement migration completed", (uint8_t *)&v9, 0xCu);
  }
  if (v4) {
    [(HDMobilityProfileExtension *)self _triggerImmediateSyncWithReason:@"HDMobilityProfileExtension.onboardingAcknowledgementMigrationManagerDidRunMigrationSteps"];
  }
}

- (void)_triggerImmediateSyncWithReason:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v6 = [WeakRetained cloudSyncManager];
  id v7 = objc_alloc(MEMORY[0x263F0A1C8]);
  id v8 = (void *)[objc_alloc(MEMORY[0x263F0A160]) initWithPush:1 pull:0 lite:1];
  int v9 = (void *)[v7 initWithChangesSyncRequest:v8];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__HDMobilityProfileExtension__triggerImmediateSyncWithReason___block_invoke;
  v11[3] = &unk_2645D7C50;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [v6 syncWithRequest:v9 reason:v10 completion:v11];
}

void __62__HDMobilityProfileExtension__triggerImmediateSyncWithReason___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x263F09940];
  id v7 = *MEMORY[0x263F09940];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v6;
      int v9 = objc_opt_class();
      uint64_t v10 = *(void *)(a1 + 40);
      int v12 = 138543618;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      uint64_t v15 = v10;
      id v11 = v9;
      _os_log_impl(&dword_221A40000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cloud sync request completed for %{public}@", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __62__HDMobilityProfileExtension__triggerImmediateSyncWithReason___block_invoke_cold_1(a1, v6, (uint64_t)v5);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walkingSteadinessOnboardingAcknowledgementMigrationManager, 0);
  objc_storeStrong((id *)&self->_settingsMigrationManager, 0);
  objc_storeStrong((id *)&self->_walkingSteadinessDailyAnalyticsEventManager, 0);
  objc_storeStrong((id *)&self->_walkingSteadinessNotificationsAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_walkingSteadinessClassificationsBackgroundFeatureDeliveryManager, 0);
  objc_storeStrong((id *)&self->_walkingSteadinessClassificationsAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_destroyWeak((id *)&self->_profile);
}

void __62__HDMobilityProfileExtension__triggerImmediateSyncWithReason___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = objc_opt_class();
  uint64_t v7 = *(void *)(a1 + 40);
  int v9 = 138543874;
  uint64_t v10 = v6;
  __int16 v11 = 2114;
  uint64_t v12 = v7;
  __int16 v13 = 2114;
  uint64_t v14 = a3;
  id v8 = v6;
  _os_log_error_impl(&dword_221A40000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Cloud sync request for %{public}@ failed: %{public}@", (uint8_t *)&v9, 0x20u);
}

@end