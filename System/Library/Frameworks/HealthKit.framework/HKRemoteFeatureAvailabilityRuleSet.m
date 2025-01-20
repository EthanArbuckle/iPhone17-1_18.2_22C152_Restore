@interface HKRemoteFeatureAvailabilityRuleSet
- (HKRemoteFeatureAvailabilityRuleSet)initWithRawValue:(id)a3 dataSource:(id)a4 supportedConditions:(id)a5;
- (NSMutableDictionary)conditions;
- (NSSet)supportedConditions;
- (id)evaluateAll;
- (void)_parseRulesFromRawValue:(id)a3 dataSource:(id)a4;
- (void)setConditions:(id)a3;
- (void)setSupportedConditions:(id)a3;
@end

@implementation HKRemoteFeatureAvailabilityRuleSet

- (HKRemoteFeatureAvailabilityRuleSet)initWithRawValue:(id)a3 dataSource:(id)a4 supportedConditions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HKRemoteFeatureAvailabilityRuleSet;
  v11 = [(HKRemoteFeatureAvailabilityRuleSet *)&v17 init];
  if (v11)
  {
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    conditions = v11->_conditions;
    v11->_conditions = v12;

    uint64_t v14 = [v10 copy];
    supportedConditions = v11->_supportedConditions;
    v11->_supportedConditions = (NSSet *)v14;

    [(HKRemoteFeatureAvailabilityRuleSet *)v11 _parseRulesFromRawValue:v8 dataSource:v9];
  }

  return v11;
}

- (void)_parseRulesFromRawValue:(id)a3 dataSource:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v22;
    *(void *)&long long v9 = 138543362;
    long long v20 = v9;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * v12);
        uint64_t v14 = [(HKRemoteFeatureAvailabilityRuleSet *)self supportedConditions];
        int v15 = [v14 containsObject:v13];

        if (v15)
        {
          v16 = [v6 objectForKeyedSubscript:v13];
          if (+[HKRemoteFeatureAvailabilityBaseRule ruleClassForRawValue:v16])
          {
            objc_super v17 = (void *)[objc_alloc((Class)objc_opt_class()) initWithRawValue:v16 dataSource:v7];
            v18 = [(HKRemoteFeatureAvailabilityRuleSet *)self conditions];
            [v18 setObject:v17 forKeyedSubscript:v13];
          }
          else
          {
            _HKInitializeLogging();
            v19 = HKLogDefault;
            if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v20;
              v26 = v16;
              _os_log_impl(&dword_19C023000, v19, OS_LOG_TYPE_INFO, "Unknown HKRemoteFeatureAvailabilityRule for raw payload: %{public}@", buf, 0xCu);
            }
          }
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v6 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v10);
  }
}

- (id)evaluateAll
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [(HKRemoteFeatureAvailabilityRuleSet *)self conditions];
  uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        long long v9 = NSNumber;
        uint64_t v10 = [(HKRemoteFeatureAvailabilityRuleSet *)self conditions];
        uint64_t v11 = [v10 objectForKeyedSubscript:v8];
        uint64_t v12 = objc_msgSend(v9, "numberWithBool:", objc_msgSend(v11, "evaluate"));
        [v3 setObject:v12 forKeyedSubscript:v8];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  return v3;
}

- (NSMutableDictionary)conditions
{
  return self->_conditions;
}

- (void)setConditions:(id)a3
{
}

- (NSSet)supportedConditions
{
  return self->_supportedConditions;
}

- (void)setSupportedConditions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedConditions, 0);

  objc_storeStrong((id *)&self->_conditions, 0);
}

@end