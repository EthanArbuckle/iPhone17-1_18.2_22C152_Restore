@interface HKFeatureAvailabilityRequirementFitnessTrackingIsEnabledInPrivacy
+ (BOOL)supportsSecureCoding;
+ (NSString)requirementIdentifier;
- (BOOL)isEqual:(id)a3;
- (NSString)requirementDescription;
- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)registerObserver:(id)a3 forDataSource:(id)a4;
- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4;
@end

@implementation HKFeatureAvailabilityRequirementFitnessTrackingIsEnabledInPrivacy

+ (NSString)requirementIdentifier
{
  return (NSString *)@"FitnessTrackingEnabled";
}

- (NSString)requirementDescription
{
  return (NSString *)@"Fitness Tracking must be enabled in Motion & Fitness in Settings";
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  v4 = NSNumber;
  v5 = [a3 privacyPreferencesDataSource];
  v6 = [v5 userDefaults];
  v7 = [v4 numberWithBool:HKIsFitnessTrackingEnabledWithUserDefaults(v6)];

  return v7;
}

- (void)registerObserver:(id)a3 forDataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, v7);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __100__HKFeatureAvailabilityRequirementFitnessTrackingIsEnabledInPrivacy_registerObserver_forDataSource___block_invoke;
  aBlock[3] = &unk_1E58BF060;
  objc_copyWeak(&v19, &location);
  aBlock[4] = self;
  v8 = _Block_copy(aBlock);
  v9 = +[_HKBehavior sharedBehavior];
  int v10 = [v9 isAppleWatch];

  if (v10)
  {
    v11 = [v7 privacyPreferencesDataSource];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __100__HKFeatureAvailabilityRequirementFitnessTrackingIsEnabledInPrivacy_registerObserver_forDataSource___block_invoke_9;
    v16[3] = &unk_1E58C4610;
    id v17 = v8;
    [v11 registerObserver:v6 forKey:@"EnableFitnessTracking" newValueHandler:v16];

    v12 = v17;
  }
  else
  {
    v12 = [NSString stringWithUTF8String:"com.apple.tcc.access.changed"];
    v13 = [v7 darwinNotificationDataSource];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __100__HKFeatureAvailabilityRequirementFitnessTrackingIsEnabledInPrivacy_registerObserver_forDataSource___block_invoke_2;
    v14[3] = &unk_1E58C0CA8;
    id v15 = v8;
    [v13 registerObserver:v6 forKey:v12 newValueHandler:v14];
  }
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __100__HKFeatureAvailabilityRequirementFitnessTrackingIsEnabledInPrivacy_registerObserver_forDataSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = *(void **)(a1 + 32);
    v5 = (void *)(a1 + 32);
    id v10 = 0;
    id v7 = [v6 isSatisfiedWithDataSource:WeakRetained error:&v10];
    id v8 = v10;
    if (v7)
    {
      objc_msgSend(v3, "featureAvailabilityRequirement:didUpdateSatisfaction:", *v5, objc_msgSend(v7, "BOOLValue"));
    }
    else
    {
      _HKInitializeLogging();
      v9 = HKLogInfrastructure();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __92__HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn_registerObserver_forDataSource___block_invoke_cold_1((uint64_t)v5, (uint64_t)v8, v9);
      }
    }
  }
}

uint64_t __100__HKFeatureAvailabilityRequirementFitnessTrackingIsEnabledInPrivacy_registerObserver_forDataSource___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __100__HKFeatureAvailabilityRequirementFitnessTrackingIsEnabledInPrivacy_registerObserver_forDataSource___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4
{
  id v10 = a4;
  id v5 = a3;
  id v6 = +[_HKBehavior sharedBehavior];
  int v7 = [v6 isAppleWatch];

  if (v7)
  {
    id v8 = [v10 privacyPreferencesDataSource];
    [v8 unregisterObserver:v5 forKey:@"EnableFitnessTracking"];
  }
  else
  {
    id v8 = [NSString stringWithUTF8String:"com.apple.tcc.access.changed"];
    v9 = [v10 darwinNotificationDataSource];
    [v9 unregisterObserver:v5 forKey:v8];

    id v5 = v9;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  unint64_t v4 = [v3 hash];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end