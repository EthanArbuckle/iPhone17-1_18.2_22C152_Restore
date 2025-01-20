@interface HKFeatureStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)includesContext:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOnboardingRecordPresent;
- (HKFeatureOnboardingRecord)onboardingRecord;
- (HKFeatureStatus)initWithCoder:(id)a3;
- (HKFeatureStatus)initWithOnboardingRecord:(id)a3 requirementsEvaluationByContext:(id)a4;
- (NSDictionary)requirementsEvaluationByContext;
- (id)copyUpdatingRequirement:(id)a3 fromRequirements:(id)a4 isSatisfied:(BOOL)a5;
- (id)description;
- (id)objectForKeyedSubscript:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKFeatureStatus

- (HKFeatureStatus)initWithOnboardingRecord:(id)a3 requirementsEvaluationByContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKFeatureStatus;
  v8 = [(HKFeatureStatus *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    onboardingRecord = v8->_onboardingRecord;
    v8->_onboardingRecord = (HKFeatureOnboardingRecord *)v9;

    uint64_t v11 = [v7 copy];
    requirementsEvaluationByContext = v8->_requirementsEvaluationByContext;
    v8->_requirementsEvaluationByContext = (NSDictionary *)v11;
  }
  return v8;
}

- (BOOL)isOnboardingRecordPresent
{
  return [(HKFeatureOnboardingRecord *)self->_onboardingRecord isOnboardingPresent];
}

- (BOOL)includesContext:(id)a3
{
  v3 = [(NSDictionary *)self->_requirementsEvaluationByContext objectForKeyedSubscript:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  v5 = [(NSDictionary *)self->_requirementsEvaluationByContext objectForKeyedSubscript:v4];

  if (v5)
  {
    id v6 = [(NSDictionary *)self->_requirementsEvaluationByContext objectForKeyedSubscript:v4];
  }
  else
  {
    _HKInitializeLogging();
    id v7 = HKLogInfrastructure();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      [(HKFeatureStatus *)(uint64_t)self objectForKeyedSubscript:v7];
    }

    v8 = [HKFeatureAvailabilityRequirementsEvaluation alloc];
    uint64_t v9 = [MEMORY[0x1E4F1CAA0] orderedSetWithObject:@"InvalidRequirement"];
    id v6 = [(HKFeatureAvailabilityRequirementsEvaluation *)v8 initWithRequirementIdentifiersOrderedByPriority:v9 satisfactionByRequirementIdentifier:&unk_1EECE61A8];
  }

  return v6;
}

- (id)copyUpdatingRequirement:(id)a3 fromRequirements:(id)a4 isSatisfied:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc((Class)objc_opt_class());
  onboardingRecord = self->_onboardingRecord;
  requirementsEvaluationByContext = self->_requirementsEvaluationByContext;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __72__HKFeatureStatus_copyUpdatingRequirement_fromRequirements_isSatisfied___block_invoke;
  v18[3] = &unk_1E58BFC60;
  id v19 = v9;
  id v20 = v8;
  BOOL v21 = a5;
  id v13 = v8;
  id v14 = v9;
  v15 = [(NSDictionary *)requirementsEvaluationByContext hk_map:v18];
  v16 = (void *)[v10 initWithOnboardingRecord:onboardingRecord requirementsEvaluationByContext:v15];

  return v16;
}

void __72__HKFeatureStatus_copyUpdatingRequirement_fromRequirements_isSatisfied___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v14 = a2;
  id v7 = a3;
  id v8 = a4;
  id v9 = [*(id *)(a1 + 32) requirementsByContext];
  id v10 = [v9 objectForKeyedSubscript:v14];
  int v11 = [v10 containsObject:*(void *)(a1 + 40)];

  if (v11)
  {
    v12 = [(id)objc_opt_class() requirementIdentifier];
    id v13 = (void *)[v7 copyUpdatingRequirementForIdentifier:v12 isSatisfied:*(unsigned __int8 *)(a1 + 48)];

    v8[2](v8, v14, v13);
  }
  else
  {
    v8[2](v8, v14, v7);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    if ([(HKFeatureOnboardingRecord *)self->_onboardingRecord isEqual:v5[1]]) {
      BOOL v6 = [(NSDictionary *)self->_requirementsEvaluationByContext isEqualToDictionary:v5[2]];
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKFeatureOnboardingRecord *)self->_onboardingRecord hash];
  return [(NSDictionary *)self->_requirementsEvaluationByContext hash] ^ v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p record:%@ evaluationByContext:%@>", objc_opt_class(), self, self->_onboardingRecord, self->_requirementsEvaluationByContext];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKFeatureStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"featureOnboardingRecord"];
  BOOL v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v6, "hk_typesForDictionaryMapping:to:", v7, objc_opt_class());
  id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"requirementsEvaluationByContext"];

  id v10 = [(HKFeatureStatus *)self initWithOnboardingRecord:v5 requirementsEvaluationByContext:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  onboardingRecord = self->_onboardingRecord;
  id v5 = a3;
  [v5 encodeObject:onboardingRecord forKey:@"featureOnboardingRecord"];
  [v5 encodeObject:self->_requirementsEvaluationByContext forKey:@"requirementsEvaluationByContext"];
}

- (HKFeatureOnboardingRecord)onboardingRecord
{
  return self->_onboardingRecord;
}

- (NSDictionary)requirementsEvaluationByContext
{
  return self->_requirementsEvaluationByContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requirementsEvaluationByContext, 0);

  objc_storeStrong((id *)&self->_onboardingRecord, 0);
}

- (void)objectForKeyedSubscript:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  id v5 = v7;
  _os_log_fault_impl(&dword_19C023000, a3, OS_LOG_TYPE_FAULT, "[%{public}@]: Subscripted with unknown context %{public}@", (uint8_t *)&v6, 0x16u);
}

@end