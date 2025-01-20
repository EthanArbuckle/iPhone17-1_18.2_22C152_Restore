@interface HKRemoteFeatureAvailabilityCompoundRule
+ (id)ruleIdentifier;
- (BOOL)evaluate;
- (NSMutableArray)rules;
- (NSString)grouping;
- (void)processUserInfo:(id)a3;
- (void)setGrouping:(id)a3;
- (void)setRules:(id)a3;
@end

@implementation HKRemoteFeatureAvailabilityCompoundRule

+ (id)ruleIdentifier
{
  return @"CompoundRule";
}

- (void)processUserInfo:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"grouping"];
  [(HKRemoteFeatureAvailabilityCompoundRule *)self setGrouping:v5];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(HKRemoteFeatureAvailabilityCompoundRule *)self setRules:v6];

  v24 = v4;
  uint64_t v7 = [v4 objectForKeyedSubscript:@"rules"];
  v8 = (void *)v7;
  v9 = (void *)MEMORY[0x1E4F1CBF0];
  if (v7) {
    v9 = (void *)v7;
  }
  id v10 = v9;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        v17 = +[HKRemoteFeatureAvailabilityBaseRule ruleClassForRawValue:v16];
        if (v17)
        {
          v18 = v17;
          v19 = [(HKRemoteFeatureAvailabilityCompoundRule *)self rules];
          id v20 = [v18 alloc];
          v21 = [(HKRemoteFeatureAvailabilityBaseRule *)self dataSource];
          v22 = (void *)[v20 initWithRawValue:v16 dataSource:v21];
          [v19 addObject:v22];
        }
        else
        {
          _HKInitializeLogging();
          v23 = HKLogDefault;
          if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v30 = v16;
            _os_log_impl(&dword_19C023000, v23, OS_LOG_TYPE_INFO, "Unknown HKRemoteFeatureAvailabilityRule for raw payload: %{public}@", buf, 0xCu);
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v13);
  }
}

- (BOOL)evaluate
{
  v3 = [(HKRemoteFeatureAvailabilityCompoundRule *)self rules];
  id v4 = [v3 firstObject];
  int v5 = [v4 evaluate];

  id v6 = [(HKRemoteFeatureAvailabilityCompoundRule *)self rules];
  unint64_t v7 = [v6 count];

  if (v7 >= 2)
  {
    unint64_t v8 = 1;
    do
    {
      v9 = [(HKRemoteFeatureAvailabilityCompoundRule *)self rules];
      id v10 = [v9 objectAtIndexedSubscript:v8];

      int v11 = [v10 evaluate];
      uint64_t v12 = [(HKRemoteFeatureAvailabilityCompoundRule *)self grouping];
      int v13 = [v12 isEqualToString:@"AND"];

      if (v13)
      {
        v5 &= v11;
      }
      else
      {
        uint64_t v14 = [(HKRemoteFeatureAvailabilityCompoundRule *)self grouping];
        int v15 = [v14 isEqualToString:@"OR"];

        if (v15) {
          v5 |= v11;
        }
      }

      ++v8;
      uint64_t v16 = [(HKRemoteFeatureAvailabilityCompoundRule *)self rules];
      unint64_t v17 = [v16 count];
    }
    while (v8 < v17);
  }
  return v5 & 1;
}

- (NSString)grouping
{
  return self->_grouping;
}

- (void)setGrouping:(id)a3
{
}

- (NSMutableArray)rules
{
  return self->_rules;
}

- (void)setRules:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rules, 0);

  objc_storeStrong((id *)&self->_grouping, 0);
}

@end