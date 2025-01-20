@interface HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn
+ (BOOL)supportsSecureCoding;
+ (NSString)requirementIdentifier;
- (BOOL)isEqual:(id)a3;
- (HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn)initWithCoder:(id)a3;
- (HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn)initWithPrerequisiteFeatureSettings:(id)a3;
- (NSArray)prerequisiteFeatureSettings;
- (NSString)requirementDescription;
- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)registerObserver:(id)a3 forDataSource:(id)a4;
- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4;
@end

@implementation HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn

- (HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn)initWithPrerequisiteFeatureSettings:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn;
  v6 = [(HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_prerequisiteFeatureSettings, a3);
  }

  return v7;
}

+ (NSString)requirementIdentifier
{
  return (NSString *)@"PrerequisiteFeaturesAreOn";
}

- (NSString)requirementDescription
{
  if ([(NSArray *)self->_prerequisiteFeatureSettings count] == 1)
  {
    v3 = NSString;
    v4 = [(NSArray *)self->_prerequisiteFeatureSettings firstObject];
    id v5 = [v4 featureIdentifier];
    [v3 stringWithFormat:@"%@ must be on", v5];
  }
  else
  {
    v4 = [(NSArray *)self->_prerequisiteFeatureSettings hk_map:&__block_literal_global_48];
    v6 = NSString;
    id v5 = [v4 componentsJoinedByString:@", "];
    [v6 stringWithFormat:@"%@ must all be on", v5];
  v7 = };

  return (NSString *)v7;
}

uint64_t __83__HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn_requirementDescription__block_invoke(uint64_t a1, void *a2)
{
  return [a2 featureIdentifier];
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obj = self->_prerequisiteFeatureSettings;
  uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v12 = [v11 featureIdentifier];
        v13 = [v6 onboardingRecordForFeatureWithIdentifier:v12 error:a4];

        v14 = [v13 featureSettings];
        if (v14)
        {
        }
        else if (([v11 isOnWhenSettingIsAbsent] & 1) == 0)
        {
          goto LABEL_17;
        }
        v15 = [v13 featureSettings];
        v16 = [v11 settingsOnKey];
        v17 = [v15 numberForKey:v16];

        if (v17)
        {
          if (([v17 BOOLValue] & 1) == 0) {
            goto LABEL_16;
          }
        }
        else if (([v11 isOnWhenSettingIsAbsent] & 1) == 0)
        {
LABEL_16:

LABEL_17:
          v18 = (void *)MEMORY[0x1E4F1CC28];
          goto LABEL_18;
        }
      }
      uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  v18 = (void *)MEMORY[0x1E4F1CC38];
LABEL_18:

  return v18;
}

- (void)registerObserver:(id)a3 forDataSource:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, v7);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn_registerObserver_forDataSource___block_invoke;
  aBlock[3] = &unk_1E58BF060;
  objc_copyWeak(&v23, &location);
  aBlock[4] = self;
  uint64_t v8 = _Block_copy(aBlock);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obj = self->_prerequisiteFeatureSettings;
  uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v18 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v13 = [v7 featureAvailabilityProvidingDataSource];
        v14 = [v12 featureIdentifier];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __92__HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn_registerObserver_forDataSource___block_invoke_15;
        v16[3] = &unk_1E58C2730;
        id v17 = v8;
        [v13 registerObserver:v6 forKey:v14 newValueHandler:v16];
      }
      uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v18 objects:v25 count:16];
    }
    while (v9);
  }

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __92__HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn_registerObserver_forDataSource___block_invoke(uint64_t a1, void *a2)
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
      uint64_t v9 = HKLogInfrastructure();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __92__HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn_registerObserver_forDataSource___block_invoke_cold_1((uint64_t)v5, (uint64_t)v8, v9);
      }
    }
  }
}

uint64_t __92__HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn_registerObserver_forDataSource___block_invoke_15(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = self->_prerequisiteFeatureSettings;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * v12);
        v14 = objc_msgSend(v7, "featureAvailabilityProvidingDataSource", (void)v16);
        v15 = [v13 featureIdentifier];
        [v14 unregisterObserver:v6 forKey:v15];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [(NSArray *)self->_prerequisiteFeatureSettings isEqual:v4[1]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_prerequisiteFeatureSettings hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  id v8 = [v5 decodeObjectOfClasses:v7 forKey:@"prerequisiteFeatureSettings"];

  uint64_t v9 = [(HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn *)self initWithPrerequisiteFeatureSettings:v8];
  return v9;
}

- (NSArray)prerequisiteFeatureSettings
{
  return self->_prerequisiteFeatureSettings;
}

- (void).cxx_destruct
{
}

void __92__HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn_registerObserver_forDataSource___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  id v5 = v7;
  _os_log_error_impl(&dword_19C023000, a3, OS_LOG_TYPE_ERROR, "[%{public}@]: Error determining satisfaction in response to change in feature availability: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end