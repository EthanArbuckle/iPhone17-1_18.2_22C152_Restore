@interface HKFeatureAvailabilityRequirementActiveWatchIsNotUnderInternalDevelopmentImportExclusion
+ (BOOL)supportsSecureCoding;
+ (NSString)requirementIdentifier;
- (BOOL)isEqual:(id)a3;
- (HKFeatureAvailabilityRequirementActiveWatchIsNotUnderInternalDevelopmentImportExclusion)initWithCoder:(id)a3;
- (HKFeatureAvailabilityRequirementActiveWatchIsNotUnderInternalDevelopmentImportExclusion)initWithFeatureIdentifier:(id)a3;
- (NSString)featureIdentifier;
- (NSString)requirementDescription;
- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)registerObserver:(id)a3 forDataSource:(id)a4;
- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4;
@end

@implementation HKFeatureAvailabilityRequirementActiveWatchIsNotUnderInternalDevelopmentImportExclusion

- (HKFeatureAvailabilityRequirementActiveWatchIsNotUnderInternalDevelopmentImportExclusion)initWithFeatureIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKFeatureAvailabilityRequirementActiveWatchIsNotUnderInternalDevelopmentImportExclusion;
  v5 = [(HKFeatureAvailabilityRequirementActiveWatchIsNotUnderInternalDevelopmentImportExclusion *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    featureIdentifier = v5->_featureIdentifier;
    v5->_featureIdentifier = (NSString *)v6;
  }
  return v5;
}

+ (NSString)requirementIdentifier
{
  return (NSString *)@"ActiveWatchIsNotUnderInternalDevelopmentImportExclusion";
}

- (NSString)requirementDescription
{
  v2 = +[_HKBehavior sharedBehavior];
  int v3 = [v2 isAppleWatch];

  if (v3) {
    return (NSString *)@"Current watch must not be excluded from import for internal development";
  }
  else {
    return (NSString *)@"The active watch must not be excluded from import for internal development";
  }
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [(HKFeatureAvailabilityRequirementActiveWatchIsNotUnderInternalDevelopmentImportExclusion *)self featureIdentifier];
  int v7 = [v6 isEqualToString:@"OxygenSaturationRecording"];

  if (v7)
  {
    v8 = [v5 importExclusionDeviceDataSource];
    objc_super v9 = [v5 behavior];
    v10 = [v8 isActiveWatchProdFusedWithBehavior:v9];

    if (v10)
    {
      if ([v10 BOOLValue])
      {
        v11 = (void *)MEMORY[0x1E4F1CC38];
      }
      else
      {
        v12 = [v5 importExclusionDeviceDataSource];
        v13 = [v5 behavior];
        v14 = [v12 isImportAllowedForActiveWatchWithBehavior:v13 featureIdentifier:self->_featureIdentifier];

        if (v14 && ([v14 BOOLValue] & 1) != 0) {
          v11 = (void *)MEMORY[0x1E4F1CC38];
        }
        else {
          v11 = (void *)MEMORY[0x1E4F1CC28];
        }
      }
    }
    else
    {
      v11 = (void *)MEMORY[0x1E4F1CC28];
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CC38];
  }

  return v11;
}

- (void)registerObserver:(id)a3 forDataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, v7);
  v8 = [v7 devicePairingAndSwitchingNotificationDataSource];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __122__HKFeatureAvailabilityRequirementActiveWatchIsNotUnderInternalDevelopmentImportExclusion_registerObserver_forDataSource___block_invoke;
  v9[3] = &unk_1E58BF060;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  [v8 registerObserverForDevicePairingChanges:v6 block:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __122__HKFeatureAvailabilityRequirementActiveWatchIsNotUnderInternalDevelopmentImportExclusion_registerObserver_forDataSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = *(void **)(a1 + 32);
    id v5 = (void *)(a1 + 32);
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
      objc_super v9 = HKLogInfrastructure();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __109__HKFeatureAvailabilityOnboardingEligibilityObservingRemoteDeviceRequirement_registerObserver_forDataSource___block_invoke_cold_1((uint64_t)v5, (uint64_t)v8, v9);
      }
    }
  }
}

- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4
{
  id v5 = a3;
  id v6 = [a4 devicePairingAndSwitchingNotificationDataSource];
  [v6 unregisterObserverForDevicePairingChanges:v5];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(HKFeatureAvailabilityRequirementActiveWatchIsNotUnderInternalDevelopmentImportExclusion *)self featureIdentifier];
    id v7 = [v5 featureIdentifier];

    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [v4 hash];
  id v6 = [(HKFeatureAvailabilityRequirementActiveWatchIsNotUnderInternalDevelopmentImportExclusion *)self featureIdentifier];
  unint64_t v7 = [v6 hash] ^ v5;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (HKFeatureAvailabilityRequirementActiveWatchIsNotUnderInternalDevelopmentImportExclusion)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"featureIdentifier"];

  id v6 = [(HKFeatureAvailabilityRequirementActiveWatchIsNotUnderInternalDevelopmentImportExclusion *)self initWithFeatureIdentifier:v5];
  return v6;
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void).cxx_destruct
{
}

@end