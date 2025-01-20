@interface HKFeatureAvailabilityRequirementSatisfactionOverrides
- (HKFeatureAvailabilityRequirementSatisfactionOverrides)initWithFeatureIdentifier:(id)a3;
- (HKFeatureAvailabilityRequirementSatisfactionOverrides)initWithUserDefaults:(id)a3 featureIdentifier:(id)a4;
- (HKFeatureAvailabilityRequirementSatisfactionOverrides)initWithUserDefaults:(id)a3 featureIdentifier:(id)a4 requirementOverridableEvaluator:(id)a5;
- (NSString)featureIdentifier;
- (NSUserDefaults)userDefaults;
- (id)overriddenRequirementIdentifiers;
- (id)overriddenSatisfactionOfRequirementWithIdentifier:(id)a3;
- (id)requirementOverridableEvaluator;
- (void)overrideSatisfactionOfRequirementWithIdentifier:(id)a3 isSatisfied:(id)a4;
- (void)resetAllRequirementSatisfactionOverrides;
@end

@implementation HKFeatureAvailabilityRequirementSatisfactionOverrides

- (HKFeatureAvailabilityRequirementSatisfactionOverrides)initWithFeatureIdentifier:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CB18];
  id v5 = a3;
  v6 = objc_msgSend(v4, "hk_featureAvailabilityRequirementEvaluationOverridesUserDefaults");
  v7 = [(HKFeatureAvailabilityRequirementSatisfactionOverrides *)self initWithUserDefaults:v6 featureIdentifier:v5];

  return v7;
}

- (HKFeatureAvailabilityRequirementSatisfactionOverrides)initWithUserDefaults:(id)a3 featureIdentifier:(id)a4
{
  return [(HKFeatureAvailabilityRequirementSatisfactionOverrides *)self initWithUserDefaults:a3 featureIdentifier:a4 requirementOverridableEvaluator:&__block_literal_global_116];
}

uint64_t __96__HKFeatureAvailabilityRequirementSatisfactionOverrides_initWithUserDefaults_featureIdentifier___block_invoke()
{
  return 1;
}

- (HKFeatureAvailabilityRequirementSatisfactionOverrides)initWithUserDefaults:(id)a3 featureIdentifier:(id)a4 requirementOverridableEvaluator:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKFeatureAvailabilityRequirementSatisfactionOverrides;
  v12 = [(HKFeatureAvailabilityRequirementSatisfactionOverrides *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_userDefaults, a3);
    uint64_t v14 = [v10 copy];
    featureIdentifier = v13->_featureIdentifier;
    v13->_featureIdentifier = (NSString *)v14;

    v16 = _Block_copy(v11);
    id requirementOverridableEvaluator = v13->_requirementOverridableEvaluator;
    v13->_id requirementOverridableEvaluator = v16;
  }
  return v13;
}

- (id)overriddenSatisfactionOfRequirementWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[_HKBehavior sharedBehavior];
  v6 = [v5 featureRequirementOverrides];

  v7 = +[_HKBehavior sharedBehavior];
  char v8 = [v7 isAppleInternalInstall];

  if ((v8 & 1) == 0)
  {
    if (!v6) {
      goto LABEL_15;
    }
    _HKInitializeLogging();
    v23 = HKLogInfrastructure();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);

    if (!v24) {
      goto LABEL_15;
    }
    v25 = HKLogInfrastructure();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      -[HKFeatureAvailabilityRequirementSatisfactionOverrides overriddenSatisfactionOfRequirementWithIdentifier:](v25);
    }
    goto LABEL_14;
  }
  id v9 = [(HKFeatureAvailabilityRequirementSatisfactionOverrides *)self requirementOverridableEvaluator];
  char v10 = ((uint64_t (**)(void, NSString *, id))v9)[2](v9, self->_featureIdentifier, v4);

  if ((v10 & 1) == 0)
  {
    _HKInitializeLogging();
    v26 = HKLogInfrastructure();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG);

    if (!v27)
    {
LABEL_15:
      id v22 = 0;
      goto LABEL_22;
    }
    v25 = HKLogInfrastructure();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      -[HKFeatureAvailabilityRequirementSatisfactionOverrides overriddenSatisfactionOfRequirementWithIdentifier:](v25);
    }
LABEL_14:

    goto LABEL_15;
  }
  if (!v6) {
    goto LABEL_17;
  }
  id v11 = +[_HKBehavior sharedBehavior];
  v12 = [v11 featureRequirementOverrides];
  uint64_t v13 = [v12 objectForKeyedSubscript:self->_featureIdentifier];
  if (!v13)
  {

    goto LABEL_17;
  }
  uint64_t v14 = (void *)v13;
  v15 = +[_HKBehavior sharedBehavior];
  v16 = [v15 featureRequirementOverrides];
  v17 = [v16 objectForKeyedSubscript:self->_featureIdentifier];
  v18 = [v17 objectForKeyedSubscript:v4];

  if (!v18)
  {
LABEL_17:
    objc_super v19 = [NSString stringWithFormat:@"%@_%@", self->_featureIdentifier, v4];
    v20 = [(NSUserDefaults *)self->_userDefaults objectForKey:v19];
    if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v22 = v20;
    }
    else {
      id v22 = 0;
    }
    goto LABEL_21;
  }
  objc_super v19 = +[_HKBehavior sharedBehavior];
  v20 = [v19 featureRequirementOverrides];
  v21 = [v20 objectForKeyedSubscript:self->_featureIdentifier];
  id v22 = [v21 objectForKeyedSubscript:v4];

LABEL_21:
LABEL_22:

  return v22;
}

- (id)overriddenRequirementIdentifiers
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v18 = [MEMORY[0x1E4F1CA80] set];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v3 = [(NSUserDefaults *)self->_userDefaults dictionaryRepresentation];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        featureIdentifier = self->_featureIdentifier;
        id v9 = NSString;
        id v10 = *(id *)(*((void *)&v19 + 1) + 8 * i);
        id v11 = [v9 stringWithFormat:@"%@_", featureIdentifier];
        LODWORD(featureIdentifier) = [v10 hasPrefix:v11];

        if (featureIdentifier)
        {
          v12 = [v10 componentsSeparatedByString:@"_"];
          if ([v12 count] == 2)
          {
            uint64_t v13 = [v12 objectAtIndexedSubscript:1];

            if (v13)
            {
              uint64_t v14 = [(HKFeatureAvailabilityRequirementSatisfactionOverrides *)self requirementOverridableEvaluator];
              int v15 = ((uint64_t (**)(void, NSString *, void *))v14)[2](v14, self->_featureIdentifier, v13);

              if (v15) {
                [v18 addObject:v13];
              }
            }
          }
          else
          {

            uint64_t v13 = 0;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }

  v16 = [MEMORY[0x1E4F1CAD0] setWithSet:v18];

  return v16;
}

- (void)overrideSatisfactionOfRequirementWithIdentifier:(id)a3 isSatisfied:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = +[_HKBehavior sharedBehavior];
  int v9 = [v8 isAppleInternalInstall];

  if (v9)
  {
    id v10 = [(HKFeatureAvailabilityRequirementSatisfactionOverrides *)self requirementOverridableEvaluator];
    char v11 = ((uint64_t (**)(void, NSString *, id))v10)[2](v10, self->_featureIdentifier, v6);

    if (v11)
    {
      v12 = [NSString stringWithFormat:@"%@_%@", self->_featureIdentifier, v6];
      [(NSUserDefaults *)self->_userDefaults setObject:v7 forKey:v12];
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v13 = HKLogInfrastructure();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);

      if (v14)
      {
        int v15 = HKLogInfrastructure();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          -[HKFeatureAvailabilityRequirementSatisfactionOverrides overrideSatisfactionOfRequirementWithIdentifier:isSatisfied:]((uint64_t)v6, v15);
        }
      }
    }
  }
}

- (void)resetAllRequirementSatisfactionOverrides
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(NSUserDefaults *)self->_userDefaults dictionaryRepresentation];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        featureIdentifier = self->_featureIdentifier;
        int v9 = NSString;
        id v10 = *(id *)(*((void *)&v12 + 1) + 8 * v7);
        char v11 = [v9 stringWithFormat:@"%@_", featureIdentifier];
        LODWORD(featureIdentifier) = [v10 hasPrefix:v11];

        if (featureIdentifier) {
          [(NSUserDefaults *)self->_userDefaults removeObjectForKey:v10];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (id)requirementOverridableEvaluator
{
  return self->_requirementOverridableEvaluator;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requirementOverridableEvaluator, 0);
  objc_storeStrong((id *)&self->_featureIdentifier, 0);

  objc_storeStrong((id *)&self->_userDefaults, 0);
}

- (void)overriddenSatisfactionOfRequirementWithIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19C023000, log, OS_LOG_TYPE_DEBUG, "Override ignored since this is not an overridable requirement.", v1, 2u);
}

- (void)overriddenSatisfactionOfRequirementWithIdentifier:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19C023000, log, OS_LOG_TYPE_DEBUG, "Feature availability overrides ignored since this is not an internal installation.", v1, 2u);
}

- (void)overrideSatisfactionOfRequirementWithIdentifier:(uint64_t)a1 isSatisfied:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_19C023000, a2, OS_LOG_TYPE_DEBUG, "Override for %@ is ignored since it is not an overridable requirement.", (uint8_t *)&v2, 0xCu);
}

@end