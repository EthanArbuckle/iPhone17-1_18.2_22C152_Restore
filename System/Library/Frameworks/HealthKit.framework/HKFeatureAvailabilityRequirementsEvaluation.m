@interface HKFeatureAvailabilityRequirementsEvaluation
+ (BOOL)supportsSecureCoding;
+ (id)emptyEvaluation;
+ (id)evaluationOfRequirements:(id)a3 dataSource:(id)a4 overrides:(id)a5 error:(id *)a6;
- (BOOL)areAllRequirementsSatisfied;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRequirementSatisfiedWithIdentifier:(id)a3;
- (HKFeatureAvailabilityRequirementsEvaluation)initWithCoder:(id)a3;
- (HKFeatureAvailabilityRequirementsEvaluation)initWithRequirementIdentifiersOrderedByPriority:(id)a3 satisfactionByRequirementIdentifier:(id)a4;
- (NSArray)unsatisfiedRequirementIdentifiers;
- (NSDictionary)satisfactionByRequirementIdentifier;
- (NSOrderedSet)requirementIdentifiersOrderedByPriority;
- (NSString)highestPriorityUnsatisfiedRequirement;
- (id)copyUpdatingRequirementForIdentifier:(id)a3 isSatisfied:(BOOL)a4;
- (id)description;
- (id)objectForKeyedSubscript:(id)a3;
- (id)unsatisfiedRequirementIdentifiersDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKFeatureAvailabilityRequirementsEvaluation

- (HKFeatureAvailabilityRequirementsEvaluation)initWithRequirementIdentifiersOrderedByPriority:(id)a3 satisfactionByRequirementIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKFeatureAvailabilityRequirementsEvaluation;
  v8 = [(HKFeatureAvailabilityRequirementsEvaluation *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    requirementIdentifiersOrderedByPriority = v8->_requirementIdentifiersOrderedByPriority;
    v8->_requirementIdentifiersOrderedByPriority = (NSOrderedSet *)v9;

    uint64_t v11 = [v7 copy];
    satisfactionByRequirementIdentifier = v8->_satisfactionByRequirementIdentifier;
    v8->_satisfactionByRequirementIdentifier = (NSDictionary *)v11;
  }
  return v8;
}

+ (id)evaluationOfRequirements:(id)a3 dataSource:(id)a4 overrides:(id)a5 error:(id *)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v44 = a4;
  id v9 = a5;
  v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v47;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v47 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        v17 = [(id)objc_opt_class() requirementIdentifier];
        v18 = [v9 overriddenSatisfactionOfRequirementWithIdentifier:v17];
        v19 = v18;
        if (v18)
        {
          id v20 = v18;
          v21 = 0;
        }
        else
        {
          id v45 = 0;
          id v20 = [v16 isSatisfiedWithDataSource:v44 error:&v45];
          id v22 = v45;
          v21 = v22;
          if (!v20)
          {
            v28 = (void *)MEMORY[0x1E4F28C58];
            if (v22)
            {
              Class v43 = [v22 domain];
              uint64_t v29 = [v21 code];
              v40 = [v21 userInfo];
              v52 = @"HKFeatureAvailabilityRequirementIdentifier";
              v53 = v17;
              v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
              v31 = objc_msgSend(v40, "hk_dictionaryByAddingEntriesFromDictionary:", v30);
              v32 = v28;
              v33 = v43;
              v34 = [v32 errorWithDomain:v43 code:v29 userInfo:v31];
            }
            else
            {
              v50 = @"HKFeatureAvailabilityRequirementIdentifier";
              v51 = v17;
              uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
              v36 = v28;
              v33 = (void *)v35;
              v34 = objc_msgSend(v36, "hk_error:userInfo:", 2000, v35);
            }

            id v37 = v34;
            v38 = v37;
            if (v37)
            {
              if (a6) {
                *a6 = v37;
              }
              else {
                _HKLogDroppedError(v37);
              }
            }

            v27 = 0;
            v25 = v11;
            goto LABEL_20;
          }
        }
        [v10 setObject:v20 forKeyedSubscript:v17];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v46 objects:v54 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  id v23 = objc_alloc(MEMORY[0x1E4F1CAA0]);
  v24 = objc_msgSend(v11, "hk_map:", &__block_literal_global_16);
  v25 = (void *)[v23 initWithArray:v24];

  id v26 = objc_alloc((Class)a1);
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v10];
  v27 = (void *)[v26 initWithRequirementIdentifiersOrderedByPriority:v25 satisfactionByRequirementIdentifier:v17];
LABEL_20:

  return v27;
}

uint64_t __99__HKFeatureAvailabilityRequirementsEvaluation_evaluationOfRequirements_dataSource_overrides_error___block_invoke()
{
  v0 = objc_opt_class();

  return [v0 requirementIdentifier];
}

+ (id)emptyEvaluation
{
  id v2 = objc_alloc((Class)a1);
  v3 = [MEMORY[0x1E4F1CAA0] orderedSet];
  v4 = (void *)[v2 initWithRequirementIdentifiersOrderedByPriority:v3 satisfactionByRequirementIdentifier:MEMORY[0x1E4F1CC08]];

  return v4;
}

- (NSString)highestPriorityUnsatisfiedRequirement
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = self->_requirementIdentifiersOrderedByPriority;
  uint64_t v4 = [(NSOrderedSet *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v9 = -[NSDictionary objectForKeyedSubscript:](self->_satisfactionByRequirementIdentifier, "objectForKeyedSubscript:", v8, (void)v13);
        int v10 = [v9 BOOLValue];

        if (!v10)
        {
          id v11 = v8;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSOrderedSet *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return (NSString *)v11;
}

- (id)objectForKeyedSubscript:(id)a3
{
  v3 = NSNumber;
  BOOL v4 = [(HKFeatureAvailabilityRequirementsEvaluation *)self isRequirementSatisfiedWithIdentifier:a3];

  return (id)[v3 numberWithBool:v4];
}

- (BOOL)isRequirementSatisfiedWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSDictionary *)self->_satisfactionByRequirementIdentifier objectForKeyedSubscript:v4];

  if (v5)
  {
    uint64_t v6 = [(NSDictionary *)self->_satisfactionByRequirementIdentifier objectForKeyedSubscript:v4];
    char v7 = [v6 BOOLValue];
  }
  else
  {
    _HKInitializeLogging();
    id v8 = HKLogInfrastructure();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[HKFeatureAvailabilityRequirementsEvaluation isRequirementSatisfiedWithIdentifier:]((uint64_t)v4, v8);
    }

    char v7 = 0;
  }

  return v7;
}

- (BOOL)areAllRequirementsSatisfied
{
  id v2 = [(HKFeatureAvailabilityRequirementsEvaluation *)self highestPriorityUnsatisfiedRequirement];
  BOOL v3 = v2 == 0;

  return v3;
}

- (NSArray)unsatisfiedRequirementIdentifiers
{
  BOOL v3 = [(NSOrderedSet *)self->_requirementIdentifiersOrderedByPriority array];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__HKFeatureAvailabilityRequirementsEvaluation_unsatisfiedRequirementIdentifiers__block_invoke;
  v6[3] = &unk_1E58BEF40;
  v6[4] = self;
  id v4 = objc_msgSend(v3, "hk_filter:", v6);

  return (NSArray *)v4;
}

uint64_t __80__HKFeatureAvailabilityRequirementsEvaluation_unsatisfiedRequirementIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:a2];
  uint64_t v3 = [v2 BOOLValue] ^ 1;

  return v3;
}

- (id)copyUpdatingRequirementForIdentifier:(id)a3 isSatisfied:(BOOL)a4
{
  BOOL v4 = a4;
  satisfactionByRequirementIdentifier = self->_satisfactionByRequirementIdentifier;
  id v7 = a3;
  id v8 = [(NSDictionary *)satisfactionByRequirementIdentifier objectForKeyedSubscript:v7];

  if (!v8)
  {
    _HKInitializeLogging();
    id v9 = HKLogInfrastructure();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[HKFeatureAvailabilityRequirementsEvaluation copyUpdatingRequirementForIdentifier:isSatisfied:](v9);
    }
  }
  int v10 = (void *)[(NSDictionary *)self->_satisfactionByRequirementIdentifier mutableCopy];
  id v11 = [NSNumber numberWithBool:v4];
  [v10 setObject:v11 forKeyedSubscript:v7];

  id v12 = objc_alloc((Class)objc_opt_class());
  requirementIdentifiersOrderedByPriority = self->_requirementIdentifiersOrderedByPriority;
  long long v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v10];
  long long v15 = (void *)[v12 initWithRequirementIdentifiersOrderedByPriority:requirementIdentifiersOrderedByPriority satisfactionByRequirementIdentifier:v14];

  return v15;
}

- (id)unsatisfiedRequirementIdentifiersDescription
{
  id v2 = [(HKFeatureAvailabilityRequirementsEvaluation *)self unsatisfiedRequirementIdentifiers];
  uint64_t v3 = objc_msgSend(v2, "hk_map:", &__block_literal_global_15);
  BOOL v4 = [v3 componentsJoinedByString:@", "];

  return v4;
}

__CFString *__91__HKFeatureAvailabilityRequirementsEvaluation_unsatisfiedRequirementIdentifiersDescription__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (HKFeatureAvailabilityRequirementIdentifierReflectsSensitiveData(v2)
    && !HKShowSensitiveLogItems())
  {
    uint64_t v3 = @"<sensitive>";
  }
  else
  {
    uint64_t v3 = (__CFString *)v2;
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = v4;
    if ([(NSOrderedSet *)self->_requirementIdentifiersOrderedByPriority isEqualToOrderedSet:v5[1]])
    {
      BOOL v6 = [(NSDictionary *)self->_satisfactionByRequirementIdentifier isEqualToDictionary:v5[2]];
    }
    else
    {
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
  uint64_t v3 = [(NSOrderedSet *)self->_requirementIdentifiersOrderedByPriority hash];
  return [(NSDictionary *)self->_satisfactionByRequirementIdentifier hash] ^ v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p %@>", objc_opt_class(), self, self->_satisfactionByRequirementIdentifier];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKFeatureAvailabilityRequirementsEvaluation)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  id v8 = [v5 decodeObjectOfClasses:v7 forKey:@"requirementIdentifiersOrderedByPriority"];

  id v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  id v11 = objc_msgSend(v9, "hk_typesForDictionaryMapping:to:", v10, objc_opt_class());
  id v12 = [v5 decodeObjectOfClasses:v11 forKey:@"satisfactionByRequirementIdentifier"];

  long long v13 = [(HKFeatureAvailabilityRequirementsEvaluation *)self initWithRequirementIdentifiersOrderedByPriority:v8 satisfactionByRequirementIdentifier:v12];
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  requirementIdentifiersOrderedByPriority = self->_requirementIdentifiersOrderedByPriority;
  id v5 = a3;
  [v5 encodeObject:requirementIdentifiersOrderedByPriority forKey:@"requirementIdentifiersOrderedByPriority"];
  [v5 encodeObject:self->_satisfactionByRequirementIdentifier forKey:@"satisfactionByRequirementIdentifier"];
}

- (NSOrderedSet)requirementIdentifiersOrderedByPriority
{
  return self->_requirementIdentifiersOrderedByPriority;
}

- (NSDictionary)satisfactionByRequirementIdentifier
{
  return self->_satisfactionByRequirementIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_satisfactionByRequirementIdentifier, 0);

  objc_storeStrong((id *)&self->_requirementIdentifiersOrderedByPriority, 0);
}

- (void)isRequirementSatisfiedWithIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_19C023000, a2, OS_LOG_TYPE_FAULT, "Requesting satisfaction of unknown requirement with identifier %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)copyUpdatingRequirementForIdentifier:(os_log_t)log isSatisfied:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19C023000, log, OS_LOG_TYPE_FAULT, "Update requirements evaluation with a requirement not originally present", v1, 2u);
}

@end