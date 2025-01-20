@interface HDHRAFibBurdenProfileExtensionComponents
+ (id)determineDeviceCapability;
+ (id)makeComponentsForProfile:(id)a3;
+ (id)makeComponentsForTesting;
- (HDAnalyticsDailyEventManager)dailyAnalyticsEventManager;
- (HDFeatureAvailabilityExtension)featureAvailabilityManager;
- (HDHRAFibBurdenNotificationManaging)notificationManager;
- (HDHRAFibBurdenProfileExtensionComponents)init;
- (HDHRAFibBurdenProfileExtensionComponents)initWithProfile:(id)a3;
- (HDHRAFibBurdenRescindedNotificationManager)notificationsRescindedManager;
- (HKFeatureStatusManager)featureStatusManager;
- (HKHRAFibBurdenAnalyzer)analyzer;
- (HKHRAFibBurdenSevenDayAnalysisScheduling)sevenDayAnalysisScheduler;
- (id)_initForTesting;
- (unint64_t)stateHandlerHandle;
- (void)dealloc;
- (void)setAnalyzer:(id)a3;
- (void)setDailyAnalyticsEventManager:(id)a3;
- (void)setFeatureAvailabilityManager:(id)a3;
- (void)setFeatureStatusManager:(id)a3;
- (void)setNotificationManager:(id)a3;
- (void)setNotificationsRescindedManager:(id)a3;
- (void)setSevenDayAnalysisScheduler:(id)a3;
- (void)setStateHandlerHandle:(unint64_t)a3;
@end

@implementation HDHRAFibBurdenProfileExtensionComponents

- (HDFeatureAvailabilityExtension)featureAvailabilityManager
{
  return self->_featureAvailabilityManager;
}

- (HDHRAFibBurdenProfileExtensionComponents)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDHRAFibBurdenProfileExtensionComponents)initWithProfile:(id)a3
{
  v58[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)HDHRAFibBurdenProfileExtensionComponents;
  v5 = [(HDHRAFibBurdenProfileExtensionComponents *)&v57 init];
  if (v5)
  {
    uint64_t v6 = HKHRAFibBurdenLogForCategory();
    id v7 = (id)*MEMORY[0x1E4F29D10];
    uint64_t v8 = [MEMORY[0x1E4F2AE70] localAvailabilityForAFibBurden];
    id v9 = objc_alloc(MEMORY[0x1E4F65B38]);
    v10 = [v4 daemon];
    v54 = (void *)v8;
    uint64_t v11 = [v9 initWithFeatureIdentifier:v7 defaultCountrySet:v8 healthDaemon:v10];

    id v12 = objc_alloc(MEMORY[0x1E4F65BA8]);
    v13 = HKHRAFibBurdenLocalFeatureAttributes();
    v53 = (void *)v11;
    v51 = (void *)[v12 initWithFeatureIdentifier:v7 localFeatureAttributes:v13 localCountrySetAvailabilityProvider:v11];

    id v14 = objc_alloc(MEMORY[0x1E4F65B80]);
    v15 = [v4 daemon];
    v16 = (void *)[v14 initWithDaemon:v15 featureIdentifier:v7];

    v17 = +[HDHRAFibBurdenProfileExtensionComponents determineDeviceCapability];
    v55 = (void *)v6;
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F65C38]) initWithAllowedCountriesDataSource:v51 profile:v4 featureCapability:v17 loggingCategory:v6];
    id v19 = objc_alloc(MEMORY[0x1E4F65B18]);
    v20 = [v4 daemon];
    v21 = [v20 nanoRegistryDeviceCapabilityProvider];
    v22 = (void *)[v19 initWithFeatureIdentifier:v7 currentOnboardingVersion:1 pairedDeviceCapability:v17 pairedDeviceCapabilityProvider:v21 regionAvailabilityProvider:v18 disableAndExpiryProvider:v16 loggingCategory:v6];

    id v23 = objc_alloc(MEMORY[0x1E4F65BD8]);
    v58[0] = *MEMORY[0x1E4F29DE0];
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:1];
    uint64_t v25 = [v23 initWithRequiredSettingsKeys:v24];

    id v26 = objc_alloc(MEMORY[0x1E4F65B10]);
    uint64_t v27 = [MEMORY[0x1E4F67D98] requirementSet];
    v52 = (void *)v25;
    uint64_t v28 = [v26 initWithProfile:v4 featureIdentifier:v7 availabilityRequirements:v27 currentOnboardingVersion:1 pairedDeviceCapability:v17 pairedFeatureAttributesProvider:v51 regionAvailabilityProvider:v18 disableAndExpiryProvider:v16 onboardingEligibilityDeterminer:v22 featureSettingsAtOnboardingTimeValidator:v25 loggingCategory:v55];
    featureAvailabilityManager = v5->_featureAvailabilityManager;
    v5->_featureAvailabilityManager = (HDFeatureAvailabilityExtension *)v28;

    [v51 synchronizeLocalProperties];
    v30 = [MEMORY[0x1E4F2B860] sharedBehavior];
    LOBYTE(v27) = [v30 isAppleWatch];

    if ((v27 & 1) == 0)
    {
      v31 = [[HKHRAFibBurdenAnalyzer alloc] initWithProfile:v4];
      analyzer = v5->_analyzer;
      v5->_analyzer = v31;

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v33 = (objc_class *)MEMORY[0x1E4F2B068];
        id v34 = v4;
        uint64_t v35 = [[v33 alloc] initWithFeatureAvailabilityProviding:v5->_featureAvailabilityManager healthDataSource:v34];
        featureStatusManager = v5->_featureStatusManager;
        v5->_featureStatusManager = (HKFeatureStatusManager *)v35;

        v37 = [[HKHRAFibBurdenSevenDayAnalysisScheduler alloc] initWithProfile:v34 featureStatusManager:v5->_featureStatusManager onboardingEligibilityDeterminer:v22 analyzer:v5->_analyzer];
        sevenDayAnalysisScheduler = v5->_sevenDayAnalysisScheduler;
        v5->_sevenDayAnalysisScheduler = (HKHRAFibBurdenSevenDayAnalysisScheduling *)v37;
        v50 = v37;

        v39 = [[HDHRAFibBurdenNotificationManager alloc] initWithProfile:v34];
        notificationManager = v5->_notificationManager;
        v5->_notificationManager = (HDHRAFibBurdenNotificationManaging *)v39;
        v49 = v39;

        v41 = [[HDHRAFibBurdenRescindedNotificationManager alloc] initWithProfile:v34 featureStatusProvider:v5->_featureStatusManager];
        notificationsRescindedManager = v5->_notificationsRescindedManager;
        v5->_notificationsRescindedManager = v41;

        [(HKHRAFibBurdenSevenDayAnalysisScheduler *)v50 setDelegate:v49];
        id v43 = objc_alloc(MEMORY[0x1E4F65A80]);
        v44 = (void *)[objc_alloc(MEMORY[0x1E4F2ABE8]) initWithLoggingCategory:v55 healthDataSource:v34];
        uint64_t v45 = [v43 initWithProfile:v34 eventSubmissionManager:v44 logCategory:v55 eventConstructor:&__block_literal_global_0];

        dailyAnalyticsEventManager = v5->_dailyAnalyticsEventManager;
        v5->_dailyAnalyticsEventManager = (HDAnalyticsDailyEventManager *)v45;
      }
    }
    v47 = HKCreateSerialDispatchQueue();
    v56 = v5;
    v56->_stateHandlerHandle = HDAddStateHandler();
  }
  return v5;
}

HDHRAFibBurdenDailyAnalyticsEvent *__60__HDHRAFibBurdenProfileExtensionComponents_initWithProfile___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HDHRAFibBurdenDailyAnalyticsEvent alloc] initWithProfile:v2];

  return v3;
}

id __60__HDHRAFibBurdenProfileExtensionComponents_initWithProfile___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v3 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v4 = [v3 showSensitiveLogItems];

  if (v4) {
    v5 = @"Enabled";
  }
  else {
    v5 = @"Disabled";
  }
  [v2 setObject:v5 forKey:@"Sensitive Logging"];
  uint64_t v6 = [(id)GSSystemRootDirectory() stringByAppendingPathComponent:@"/System/Library/Preferences/Logging/Subsystems/com.apple.Health.AFibBurden.plist"];
  id v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6];
  id v17 = 0;
  uint64_t v8 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v7 options:0 error:&v17];
  id v9 = v17;
  if (v8)
  {
    id v16 = 0;
    v10 = [MEMORY[0x1E4F28F98] propertyListWithData:v8 options:0 format:0 error:&v16];
    id v11 = v16;

    if (v10)
    {
      id v12 = [NSString stringWithFormat:@"%@", v10];
      [v2 setObject:v12 forKey:@"AFib History Logging Plist"];
    }
    else
    {
      _HKInitializeLogging();
      id v12 = HKHRAFibBurdenLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v19 = v14;
        __int16 v20 = 2112;
        id v21 = v11;
        _os_log_impl(&dword_1D3AC6000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Failed to read AFib History logging plist: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    v10 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v13;
      __int16 v20 = 2112;
      id v21 = v9;
      _os_log_impl(&dword_1D3AC6000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Failed to fetch AFib History logging plist: %@", buf, 0x16u);
    }
    id v11 = v9;
  }

  return v2;
}

- (id)_initForTesting
{
  v3.receiver = self;
  v3.super_class = (Class)HDHRAFibBurdenProfileExtensionComponents;
  return [(HDHRAFibBurdenProfileExtensionComponents *)&v3 init];
}

- (void)dealloc
{
  if (self->_stateHandlerHandle) {
    os_state_remove_handler();
  }
  v3.receiver = self;
  v3.super_class = (Class)HDHRAFibBurdenProfileExtensionComponents;
  [(HDHRAFibBurdenProfileExtensionComponents *)&v3 dealloc];
}

+ (id)makeComponentsForProfile:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 profileType] == 1
    || [MEMORY[0x1E4F2B860] isAppleInternalInstall]
    && [v4 profileType] == 100)
  {
    v5 = [[HDHRAFibBurdenProfileExtensionComponents alloc] initWithProfile:v4];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v6 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543618;
      id v9 = a1;
      __int16 v10 = 2114;
      id v11 = v4;
      _os_log_impl(&dword_1D3AC6000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Not creating AFib Burden components for profile %{public}@", (uint8_t *)&v8, 0x16u);
    }

    v5 = 0;
  }

  return v5;
}

+ (id)makeComponentsForTesting
{
  id v2 = [[HDHRAFibBurdenProfileExtensionComponents alloc] _initForTesting];

  return v2;
}

+ (id)determineDeviceCapability
{
  id v2 = [MEMORY[0x1E4F2B860] sharedBehavior];
  if ([v2 isAppleWatch]) {
    objc_super v3 = 0;
  }
  else {
    objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"46D9FF45-6717-4357-9B04-2E06E1095260"];
  }

  return v3;
}

- (void)setFeatureAvailabilityManager:(id)a3
{
}

- (HKFeatureStatusManager)featureStatusManager
{
  return self->_featureStatusManager;
}

- (void)setFeatureStatusManager:(id)a3
{
}

- (HDAnalyticsDailyEventManager)dailyAnalyticsEventManager
{
  return self->_dailyAnalyticsEventManager;
}

- (void)setDailyAnalyticsEventManager:(id)a3
{
}

- (unint64_t)stateHandlerHandle
{
  return self->_stateHandlerHandle;
}

- (void)setStateHandlerHandle:(unint64_t)a3
{
  self->_stateHandlerHandle = a3;
}

- (HDHRAFibBurdenNotificationManaging)notificationManager
{
  return self->_notificationManager;
}

- (void)setNotificationManager:(id)a3
{
}

- (HDHRAFibBurdenRescindedNotificationManager)notificationsRescindedManager
{
  return self->_notificationsRescindedManager;
}

- (void)setNotificationsRescindedManager:(id)a3
{
}

- (HKHRAFibBurdenSevenDayAnalysisScheduling)sevenDayAnalysisScheduler
{
  return self->_sevenDayAnalysisScheduler;
}

- (void)setSevenDayAnalysisScheduler:(id)a3
{
}

- (HKHRAFibBurdenAnalyzer)analyzer
{
  return self->_analyzer;
}

- (void)setAnalyzer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyzer, 0);
  objc_storeStrong((id *)&self->_sevenDayAnalysisScheduler, 0);
  objc_storeStrong((id *)&self->_notificationsRescindedManager, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_dailyAnalyticsEventManager, 0);
  objc_storeStrong((id *)&self->_featureStatusManager, 0);

  objc_storeStrong((id *)&self->_featureAvailabilityManager, 0);
}

@end