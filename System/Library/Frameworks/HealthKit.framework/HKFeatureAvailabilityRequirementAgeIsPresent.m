@interface HKFeatureAvailabilityRequirementAgeIsPresent
+ (BOOL)supportsSecureCoding;
+ (NSString)requirementIdentifier;
- (BOOL)isEqual:(id)a3;
- (NSString)requirementDescription;
- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)registerObserver:(id)a3 forDataSource:(id)a4;
- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4;
@end

@implementation HKFeatureAvailabilityRequirementAgeIsPresent

+ (NSString)requirementIdentifier
{
  return (NSString *)@"AgeIsPresent";
}

- (NSString)requirementDescription
{
  return (NSString *)@"An age must be set in Health Details";
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierDateOfBirth"];
  v7 = [v5 healthDataSource];

  id v13 = 0;
  v8 = [v7 userCharacteristicForDataType:v6 error:&v13];
  id v9 = v13;

  if (v9)
  {
    _HKInitializeLogging();
    v10 = HKLogInfrastructure();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[HKFeatureAvailabilityRequirementAgeIsPresent isSatisfiedWithDataSource:error:]();
    }

    if (a4) {
      *a4 = v9;
    }
    else {
      _HKLogDroppedError(v9);
    }
    v11 = (void *)MEMORY[0x1E4F1CC28];
  }
  else
  {
    v11 = [NSNumber numberWithInt:v8 != 0];
  }

  return v11;
}

- (void)registerObserver:(id)a3 forDataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [NSString stringWithUTF8String:"com.apple.healthd.user-characteristics.did-change"];
  objc_initWeak(&location, v7);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__HKFeatureAvailabilityRequirementAgeIsPresent_registerObserver_forDataSource___block_invoke;
  aBlock[3] = &unk_1E58BF060;
  objc_copyWeak(&v15, &location);
  aBlock[4] = self;
  id v9 = _Block_copy(aBlock);
  v10 = [v7 darwinNotificationDataSource];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__HKFeatureAvailabilityRequirementAgeIsPresent_registerObserver_forDataSource___block_invoke_10;
  v12[3] = &unk_1E58C0CA8;
  id v11 = v9;
  id v13 = v11;
  [v10 registerObserver:v6 forKey:v8 newValueHandler:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __79__HKFeatureAvailabilityRequirementAgeIsPresent_registerObserver_forDataSource___block_invoke(uint64_t a1, void *a2)
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
      id v9 = HKLogInfrastructure();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __79__HKFeatureAvailabilityRequirementAgeIsPresent_registerObserver_forDataSource___block_invoke_cold_1();
      }
    }
  }
}

uint64_t __79__HKFeatureAvailabilityRequirementAgeIsPresent_registerObserver_forDataSource___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4
{
  id v5 = NSString;
  id v6 = a4;
  id v7 = a3;
  id v9 = [v5 stringWithUTF8String:"com.apple.healthd.user-characteristics.did-change"];
  id v8 = [v6 darwinNotificationDataSource];

  [v8 unregisterObserver:v7 forKey:v9];
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

- (void)isSatisfiedWithDataSource:error:.cold.1()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_8(v0);
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v2, v3, "[%{public}@] Error while pulling date of birth characteristic: %{public}@", v4, v5, v6, v7, v8);
}

void __79__HKFeatureAvailabilityRequirementAgeIsPresent_registerObserver_forDataSource___block_invoke_cold_1()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_8(v0);
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v2, v3, "[%{public}@]: Error determining satisfaction in response to change in feature availability: %{public}@", v4, v5, v6, v7, v8);
}

@end