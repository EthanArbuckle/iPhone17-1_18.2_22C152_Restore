@interface HKFeatureAvailabilityRequirementBooleanUserDefaultEvaluator
- (BOOL)defaultBoolValueWhenKeyIsMissing;
- (BOOL)isSatisfiedForBoolValue:(BOOL)a3;
- (BOOL)isSatisfiedForValue:(id)a3;
- (id)defaultValueWhenKeyIsMissing;
- (id)whichUserDefaultsDataSourceInDataSource:(id)a3;
@end

@implementation HKFeatureAvailabilityRequirementBooleanUserDefaultEvaluator

- (id)defaultValueWhenKeyIsMissing
{
  v2 = NSNumber;
  BOOL v3 = [(HKFeatureAvailabilityRequirementBooleanUserDefaultEvaluator *)self defaultBoolValueWhenKeyIsMissing];

  return (id)[v2 numberWithBool:v3];
}

- (BOOL)isSatisfiedForValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 BOOLValue];
  }
  else
  {
    _HKInitializeLogging();
    v6 = HKLogInfrastructure();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(HKFeatureAvailabilityRequirementBooleanUserDefaultEvaluator *)self isSatisfiedForValue:v6];
    }

    uint64_t v5 = [(HKFeatureAvailabilityRequirementBooleanUserDefaultEvaluator *)self defaultBoolValueWhenKeyIsMissing];
  }
  BOOL v7 = [(HKFeatureAvailabilityRequirementBooleanUserDefaultEvaluator *)self isSatisfiedForBoolValue:v5];

  return v7;
}

- (BOOL)defaultBoolValueWhenKeyIsMissing
{
  return 0;
}

- (BOOL)isSatisfiedForBoolValue:(BOOL)a3
{
  return 0;
}

- (id)whichUserDefaultsDataSourceInDataSource:(id)a3
{
  objc_opt_class();
  OUTLINED_FUNCTION_0_3();
  BOOL v3 = [HKUserDefaultsDataSource alloc];
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v5 = [(HKUserDefaultsDataSource *)v3 initWithUserDefaults:v4];

  return v5;
}

- (void)isSatisfiedForValue:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v6 = objc_opt_class();
  id v7 = v6;
  v8 = [a1 userDefaultsKey];
  int v9 = 138543874;
  v10 = v6;
  __int16 v11 = 2114;
  uint64_t v12 = a2;
  __int16 v13 = 2114;
  v14 = v8;
  _os_log_error_impl(&dword_19C023000, a3, OS_LOG_TYPE_ERROR, "[%{public}@]: Unexpected value %{public}@ for key %{public}@", (uint8_t *)&v9, 0x20u);
}

@end