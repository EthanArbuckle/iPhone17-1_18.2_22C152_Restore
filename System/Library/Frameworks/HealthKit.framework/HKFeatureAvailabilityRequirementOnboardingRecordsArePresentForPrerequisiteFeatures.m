@interface HKFeatureAvailabilityRequirementOnboardingRecordsArePresentForPrerequisiteFeatures
+ (BOOL)supportsSecureCoding;
+ (NSString)requirementIdentifier;
- (BOOL)isEqual:(id)a3;
- (HKFeatureAvailabilityRequirementOnboardingRecordsArePresentForPrerequisiteFeatures)initWithCoder:(id)a3;
- (HKFeatureAvailabilityRequirementOnboardingRecordsArePresentForPrerequisiteFeatures)initWithPrerequisiteFeatureIdentifiers:(id)a3;
- (NSArray)prerequisiteFeatureIdentifiers;
- (NSString)requirementDescription;
- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)registerObserver:(id)a3 forDataSource:(id)a4;
- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4;
@end

@implementation HKFeatureAvailabilityRequirementOnboardingRecordsArePresentForPrerequisiteFeatures

- (HKFeatureAvailabilityRequirementOnboardingRecordsArePresentForPrerequisiteFeatures)initWithPrerequisiteFeatureIdentifiers:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKFeatureAvailabilityRequirementOnboardingRecordsArePresentForPrerequisiteFeatures;
  v6 = [(HKFeatureAvailabilityRequirementOnboardingRecordsArePresentForPrerequisiteFeatures *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_prerequisiteFeatureIdentifiers, a3);
  }

  return v7;
}

+ (NSString)requirementIdentifier
{
  return (NSString *)@"OnboardingRecordsArePresentForPrerequisiteFeatures";
}

- (NSString)requirementDescription
{
  NSUInteger v3 = [(NSArray *)self->_prerequisiteFeatureIdentifiers count];
  v4 = NSString;
  prerequisiteFeatureIdentifiers = self->_prerequisiteFeatureIdentifiers;
  if (v3 == 1)
  {
    v6 = [(NSArray *)prerequisiteFeatureIdentifiers firstObject];
    [v4 stringWithFormat:@"An onboarding record must be present for %@", v6];
  }
  else
  {
    v6 = [(NSArray *)prerequisiteFeatureIdentifiers componentsJoinedByString:@", "];
    [v4 stringWithFormat:@"Onboarding records must be present for %@", v6];
  v7 = };

  return (NSString *)v7;
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v7 = self->_prerequisiteFeatureIdentifiers;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v8)
  {
    v12 = (void *)MEMORY[0x1E4F1CC38];
    goto LABEL_15;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v18;
  v11 = (void *)MEMORY[0x1E4F1CC28];
  v12 = (void *)MEMORY[0x1E4F1CC38];
  while (2)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v18 != v10) {
        objc_enumerationMutation(v7);
      }
      v14 = objc_msgSend(v6, "onboardingRecordForFeatureWithIdentifier:error:", *(void *)(*((void *)&v17 + 1) + 8 * i), a4, (void)v17);
      v15 = v14;
      if (!v14)
      {
        v12 = 0;
LABEL_14:

        goto LABEL_15;
      }
      if ([v14 onboardingState] == 1)
      {
        v12 = v11;
        goto LABEL_14;
      }
    }
    uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9) {
      continue;
    }
    break;
  }
LABEL_15:

  return v12;
}

- (void)registerObserver:(id)a3 forDataSource:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v6 = a4;
  objc_initWeak(&location, v6);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __117__HKFeatureAvailabilityRequirementOnboardingRecordsArePresentForPrerequisiteFeatures_registerObserver_forDataSource___block_invoke;
  aBlock[3] = &unk_1E58BF060;
  v13 = &v23;
  objc_copyWeak(&v23, &location);
  aBlock[4] = self;
  v7 = _Block_copy(aBlock);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obj = self->_prerequisiteFeatureIdentifiers;
  uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v18 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v19;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * v10);
        v12 = objc_msgSend(v6, "featureAvailabilityProvidingDataSource", v13);
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __117__HKFeatureAvailabilityRequirementOnboardingRecordsArePresentForPrerequisiteFeatures_registerObserver_forDataSource___block_invoke_14;
        v16[3] = &unk_1E58C2730;
        id v17 = v7;
        [v12 registerObserver:v15 forKey:v11 newValueHandler:v16];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v18 objects:v25 count:16];
    }
    while (v8);
  }

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

void __117__HKFeatureAvailabilityRequirementOnboardingRecordsArePresentForPrerequisiteFeatures_registerObserver_forDataSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = *(void **)(a1 + 32);
    id v5 = (void *)(a1 + 32);
    id v10 = 0;
    v7 = [v6 isSatisfiedWithDataSource:WeakRetained error:&v10];
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

uint64_t __117__HKFeatureAvailabilityRequirementOnboardingRecordsArePresentForPrerequisiteFeatures_registerObserver_forDataSource___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = self->_prerequisiteFeatureIdentifiers;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * v12);
        v14 = objc_msgSend(v7, "featureAvailabilityProvidingDataSource", (void)v15);
        [v14 unregisterObserver:v6 forKey:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [(NSArray *)self->_prerequisiteFeatureIdentifiers isEqual:v4[1]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_prerequisiteFeatureIdentifiers hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (HKFeatureAvailabilityRequirementOnboardingRecordsArePresentForPrerequisiteFeatures)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  id v8 = [v5 decodeObjectOfClasses:v7 forKey:@"prerequisiteFeatureIdentifiers"];

  uint64_t v9 = [(HKFeatureAvailabilityRequirementOnboardingRecordsArePresentForPrerequisiteFeatures *)self initWithPrerequisiteFeatureIdentifiers:v8];
  return v9;
}

- (NSArray)prerequisiteFeatureIdentifiers
{
  return self->_prerequisiteFeatureIdentifiers;
}

- (void).cxx_destruct
{
}

@end