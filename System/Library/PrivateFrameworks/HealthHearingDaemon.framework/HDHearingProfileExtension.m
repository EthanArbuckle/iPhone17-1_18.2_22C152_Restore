@interface HDHearingProfileExtension
- (HDHeadphoneDoseManager)headphoneDoseManager;
- (HDHearingProfileExtension)initWithProfile:(id)a3;
- (id)dailyAnalyticsEventManagerWithProfile:(id)a3;
- (id)featureAvailabilityExtensionForFeatureIdentifier:(id)a3;
@end

@implementation HDHearingProfileExtension

- (id)featureAvailabilityExtensionForFeatureIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x263F09768]])
  {
    uint64_t v5 = 24;
LABEL_7:
    id v6 = *(id *)((char *)&self->super.isa + v5);
    goto LABEL_8;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F09758]])
  {
    uint64_t v5 = 40;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F09760]])
  {
    uint64_t v5 = 56;
    goto LABEL_7;
  }
  id v6 = 0;
LABEL_8:

  return v6;
}

- (HDHearingProfileExtension)initWithProfile:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)HDHearingProfileExtension;
  uint64_t v5 = [(HDHearingProfileExtension *)&v35 init];
  if (v5)
  {
    id v6 = [[HDAudioAnalyticsManager alloc] initWithProfile:v4];
    analyticsManager = v5->_analyticsManager;
    v5->_analyticsManager = v6;

    v8 = [[HDHeadphoneDoseManager alloc] initWithProfile:v4];
    headphoneDoseManager = v5->_headphoneDoseManager;
    v5->_headphoneDoseManager = v8;

    v10 = [v4 daemon];
    v11 = [v10 behavior];
    v12 = [v11 features];
    int v13 = [v12 yodel];

    uint64_t v14 = [MEMORY[0x263F431E8] hearingTestFeatureAvailabilityManagerWithProfile:v4];
    hearingTestFeatureAvailabilityManager = v5->_hearingTestFeatureAvailabilityManager;
    v5->_hearingTestFeatureAvailabilityManager = (HDFeatureAvailabilityManager *)v14;

    v16 = (os_log_t *)MEMORY[0x263F09910];
    if (v13)
    {
      uint64_t v17 = [objc_alloc(MEMORY[0x263F43178]) initWithProfile:v4 featureAvailabilityExtension:v5->_hearingTestFeatureAvailabilityManager loggingCategory:*MEMORY[0x263F09910]];
      hearingTestBackgroundFeatureDeliveryManager = v5->_hearingTestBackgroundFeatureDeliveryManager;
      v5->_hearingTestBackgroundFeatureDeliveryManager = (HDBackgroundFeatureDeliveryManager *)v17;
    }
    uint64_t v19 = [MEMORY[0x263F431E8] hearingAidFeatureAvailabilityManagerWithProfile:v4];
    hearingAidFeatureAvailabilityManager = v5->_hearingAidFeatureAvailabilityManager;
    v5->_hearingAidFeatureAvailabilityManager = (HDFeatureAvailabilityManager *)v19;

    if (v13)
    {
      uint64_t v21 = [objc_alloc(MEMORY[0x263F43178]) initWithProfile:v4 featureAvailabilityExtension:v5->_hearingAidFeatureAvailabilityManager loggingCategory:*v16];
      hearingAidBackgroundFeatureDeliveryManager = v5->_hearingAidBackgroundFeatureDeliveryManager;
      v5->_hearingAidBackgroundFeatureDeliveryManager = (HDBackgroundFeatureDeliveryManager *)v21;
    }
    uint64_t v23 = [MEMORY[0x263F431E8] hearingProtectionFeatureAvailabilityManagerWithProfile:v4];
    hearingProtectionFeatureAvailabilityManager = v5->_hearingProtectionFeatureAvailabilityManager;
    v5->_hearingProtectionFeatureAvailabilityManager = (HDFeatureAvailabilityManager *)v23;

    if (v13)
    {
      uint64_t v25 = [objc_alloc(MEMORY[0x263F43178]) initWithProfile:v4 featureAvailabilityExtension:v5->_hearingProtectionFeatureAvailabilityManager loggingCategory:*v16];
      hearingProtectionBackgroundFeatureDeliveryManager = v5->_hearingProtectionBackgroundFeatureDeliveryManager;
      v5->_hearingProtectionBackgroundFeatureDeliveryManager = (HDBackgroundFeatureDeliveryManager *)v25;
    }
    uint64_t v27 = [(HDHearingProfileExtension *)v5 dailyAnalyticsEventManagerWithProfile:v4];
    dailyAnalyticsEventManager = v5->_dailyAnalyticsEventManager;
    v5->_dailyAnalyticsEventManager = (HDAnalyticsDailyEventManager *)v27;

    _HKInitializeLogging();
    os_log_t v29 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
    {
      v30 = v29;
      uint64_t v31 = objc_opt_class();
      uint64_t v32 = [v4 profileType];
      *(_DWORD *)buf = 138543618;
      uint64_t v37 = v31;
      __int16 v38 = 2048;
      uint64_t v39 = v32;
      _os_log_impl(&dword_22615C000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ Plugin loaded for profileType %ld", buf, 0x16u);
    }
    v33 = v5;
  }

  return v5;
}

- (id)dailyAnalyticsEventManagerWithProfile:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F0A980] sharedBehavior];
  char v5 = [v4 isAppleWatch];

  if ((v5 & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v10 = 0;
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x263F43158]);
    id v7 = objc_alloc(MEMORY[0x263F0A0C0]);
    v8 = (void *)MEMORY[0x263F09910];
    v9 = (void *)[v7 initWithLoggingCategory:*MEMORY[0x263F09910] healthDataSource:v3];
    v10 = (void *)[v6 initWithProfile:v3 eventSubmissionManager:v9 logCategory:*v8 eventConstructor:&__block_literal_global_5];
  }
  return v10;
}

_TtC19HealthHearingDaemon32HDHearingTestDailyAnalyticsEvent *__67__HDHearingProfileExtension_dailyAnalyticsEventManagerWithProfile___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[_TtC19HealthHearingDaemon32HDHearingTestDailyAnalyticsEvent alloc] initWithProfile:v2];

  return v3;
}

- (HDHeadphoneDoseManager)headphoneDoseManager
{
  return self->_headphoneDoseManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dailyAnalyticsEventManager, 0);
  objc_storeStrong((id *)&self->_hearingProtectionBackgroundFeatureDeliveryManager, 0);
  objc_storeStrong((id *)&self->_hearingProtectionFeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_hearingAidBackgroundFeatureDeliveryManager, 0);
  objc_storeStrong((id *)&self->_hearingAidFeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_hearingTestBackgroundFeatureDeliveryManager, 0);
  objc_storeStrong((id *)&self->_hearingTestFeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_headphoneDoseManager, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
}

@end