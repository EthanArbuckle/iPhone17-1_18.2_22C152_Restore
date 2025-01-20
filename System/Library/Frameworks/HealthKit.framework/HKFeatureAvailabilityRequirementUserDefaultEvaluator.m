@interface HKFeatureAvailabilityRequirementUserDefaultEvaluator
+ (BOOL)supportsSecureCoding;
+ (NSString)requirementIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSatisfiedForValue:(id)a3;
- (HKFeatureAvailabilityRequirementUserDefaultEvaluator)initWithCoder:(id)a3;
- (HKFeatureAvailabilityRequirementUserDefaultEvaluator)initWithUserDefaultsKey:(id)a3;
- (NSString)requirementDescription;
- (NSString)userDefaultsKey;
- (id)defaultValueWhenKeyIsMissing;
- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4;
- (id)whichUserDefaultsDataSourceInDataSource:(id)a3;
- (unint64_t)hash;
- (void)_notifyObserver:(void *)a3 forNewValue:;
- (void)encodeWithCoder:(id)a3;
- (void)registerObserver:(id)a3 forDataSource:(id)a4;
- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4;
@end

@implementation HKFeatureAvailabilityRequirementUserDefaultEvaluator

- (HKFeatureAvailabilityRequirementUserDefaultEvaluator)initWithUserDefaultsKey:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKFeatureAvailabilityRequirementUserDefaultEvaluator;
  v5 = [(HKFeatureAvailabilityRequirementUserDefaultEvaluator *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    userDefaultsKey = v5->_userDefaultsKey;
    v5->_userDefaultsKey = (NSString *)v6;
  }
  return v5;
}

- (id)defaultValueWhenKeyIsMissing
{
  return 0;
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  v5 = NSNumber;
  uint64_t v6 = -[HKFeatureAvailabilityRequirementUserDefaultEvaluator whichUserDefaultsDataSourceInDataSource:](self, "whichUserDefaultsDataSourceInDataSource:", a3, a4);
  v7 = [v6 userDefaults];
  v8 = [v7 objectForKey:self->_userDefaultsKey];
  objc_super v9 = v8;
  if (!v8)
  {
    objc_super v9 = [(HKFeatureAvailabilityRequirementUserDefaultEvaluator *)self defaultValueWhenKeyIsMissing];
  }
  v10 = objc_msgSend(v5, "numberWithBool:", -[HKFeatureAvailabilityRequirementUserDefaultEvaluator isSatisfiedForValue:](self, "isSatisfiedForValue:", v9));
  if (!v8) {

  }
  return v10;
}

- (void)registerObserver:(id)a3 forDataSource:(id)a4
{
  id v6 = a3;
  v7 = [(HKFeatureAvailabilityRequirementUserDefaultEvaluator *)self whichUserDefaultsDataSourceInDataSource:a4];
  userDefaultsKey = self->_userDefaultsKey;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__HKFeatureAvailabilityRequirementUserDefaultEvaluator_registerObserver_forDataSource___block_invoke;
  v9[3] = &unk_1E58BEC28;
  v9[4] = self;
  [v7 registerObserver:v6 forKey:userDefaultsKey newValueHandler:v9];
}

void __87__HKFeatureAvailabilityRequirementUserDefaultEvaluator_registerObserver_forDataSource___block_invoke(uint64_t a1, void *a2, void *a3)
{
}

- (void)_notifyObserver:(void *)a3 forNewValue:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    if (v6)
    {
      uint64_t v7 = [a1 isSatisfiedForValue:v6];
    }
    else
    {
      v8 = [a1 defaultValueWhenKeyIsMissing];
      uint64_t v7 = [a1 isSatisfiedForValue:v8];
    }
    _HKInitializeLogging();
    objc_super v9 = HKLogInfrastructure();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);

    if (v10)
    {
      v11 = HKLogInfrastructure();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = objc_opt_class();
        uint64_t v13 = a1[1];
        v14 = NSNumber;
        id v15 = v12;
        v16 = [v14 numberWithBool:v7];
        int v17 = 138544130;
        v18 = v12;
        __int16 v19 = 2114;
        id v20 = v5;
        __int16 v21 = 2114;
        uint64_t v22 = v13;
        __int16 v23 = 2114;
        v24 = v16;
        _os_log_impl(&dword_19C023000, v11, OS_LOG_TYPE_INFO, "[%{public}@] Notifying %{public}@ of satisfaction for key %{public}@: %{public}@", (uint8_t *)&v17, 0x2Au);
      }
    }
    [v5 featureAvailabilityRequirement:a1 didUpdateSatisfaction:v7];
  }
}

- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4
{
  id v6 = a3;
  id v7 = [(HKFeatureAvailabilityRequirementUserDefaultEvaluator *)self whichUserDefaultsDataSourceInDataSource:a4];
  [v7 unregisterObserver:v6 forKey:self->_userDefaultsKey];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(NSString *)self->_userDefaultsKey isEqualToString:v4[1]];

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_userDefaultsKey hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (HKFeatureAvailabilityRequirementUserDefaultEvaluator)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKFeatureAvailabilityRequirementUserDefaultEvaluator;
  BOOL v5 = [(HKFeatureAvailabilityRequirementUserDefaultEvaluator *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UserDefaultsKey"];
    userDefaultsKey = v5->_userDefaultsKey;
    v5->_userDefaultsKey = (NSString *)v6;
  }
  return v5;
}

- (NSString)userDefaultsKey
{
  return self->_userDefaultsKey;
}

- (void).cxx_destruct
{
}

- (BOOL)isSatisfiedForValue:(id)a3
{
  return 0;
}

- (id)whichUserDefaultsDataSourceInDataSource:(id)a3
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3();
  v3 = [HKUserDefaultsDataSource alloc];
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  BOOL v5 = [(HKUserDefaultsDataSource *)v3 initWithUserDefaults:v4];

  return v5;
}

+ (NSString)requirementIdentifier
{
  return (NSString *)&stru_1EEC60288;
}

- (NSString)requirementDescription
{
  return (NSString *)&stru_1EEC60288;
}

@end