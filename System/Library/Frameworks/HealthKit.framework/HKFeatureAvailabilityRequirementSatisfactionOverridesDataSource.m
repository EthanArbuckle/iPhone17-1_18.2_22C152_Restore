@interface HKFeatureAvailabilityRequirementSatisfactionOverridesDataSource
+ (id)requirementSatisfactionOverridesDataSource;
- (void)registerObserver:(id)a3 forFeature:(id)a4 requirement:(id)a5 newValueHandler:(id)a6;
- (void)unregisterObserver:(id)a3 forFeature:(id)a4 requirement:(id)a5;
@end

@implementation HKFeatureAvailabilityRequirementSatisfactionOverridesDataSource

+ (id)requirementSatisfactionOverridesDataSource
{
  id v2 = objc_alloc((Class)a1);
  v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "hk_featureAvailabilityRequirementEvaluationOverridesUserDefaults");
  v4 = (void *)[v2 initWithUserDefaults:v3];

  return v4;
}

- (void)registerObserver:(id)a3 forFeature:(id)a4 requirement:(id)a5 newValueHandler:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  v12 = [(id)objc_opt_class() requirementIdentifier];
  HKRequirementSatisfactionOverrideKeyForFeatureAndRequirement((uint64_t)v10, (uint64_t)v12);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  [(HKObserverBridge *)self registerObserver:v11 forKey:v13 newValueHandler:v9];
}

- (void)unregisterObserver:(id)a3 forFeature:(id)a4 requirement:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(id)objc_opt_class() requirementIdentifier];
  HKRequirementSatisfactionOverrideKeyForFeatureAndRequirement((uint64_t)v7, (uint64_t)v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  [(HKObserverBridge *)self unregisterObserver:v8 forKey:v10];
}

@end