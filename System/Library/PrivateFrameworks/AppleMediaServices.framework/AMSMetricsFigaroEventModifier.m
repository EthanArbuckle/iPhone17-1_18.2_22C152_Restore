@interface AMSMetricsFigaroEventModifier
- (AMSMetricsFigaroEventModifier)initWithMetricsDictionary:(id)a3 overrideDictionary:(id)a4;
- (BOOL)_shouldSampleEvent:(id)a3;
- (BOOL)fieldFiltersMatchEvent:(id)a3;
- (BOOL)shouldDropEvent:(id)a3;
- (BOOL)shouldSkipEvent:(id)a3;
- (NSDictionary)fieldFilters;
- (NSDictionary)metricsDictionary;
- (NSDictionary)overrideDictionary;
- (NSString)sampleSessionKey;
- (double)flushInterval;
- (id)_createSampleSessionKey;
- (id)_fieldFiltersFromOverrides:(id)a3;
- (id)_overridePropertyForKey:(id)a3;
- (id)preparedEventPromiseWithEvent:(id)a3;
- (id)reportingURLForEvent:(id)a3;
@end

@implementation AMSMetricsFigaroEventModifier

void __56__AMSMetricsFigaroEventModifier_fieldFiltersMatchEvent___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v13 = a3;
  v7 = [*(id *)(a1 + 32) propertyForBodyKey:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
  }
  else
  {
    if (!v7) {
      goto LABEL_10;
    }
    id v8 = [NSString stringWithFormat:@"%@", v7];
  }
  v9 = v8;
  if (v8)
  {
    char v10 = [v13 containsObject:v8];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    if (*(unsigned char *)(v11 + 24)) {
      char v12 = v10;
    }
    else {
      char v12 = 0;
    }
    *(unsigned char *)(v11 + 24) = v12;
    goto LABEL_11;
  }
LABEL_10:
  v9 = 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  *a4 = 1;
LABEL_11:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDictionary, 0);
  objc_storeStrong((id *)&self->_metricsDictionary, 0);
  objc_storeStrong((id *)&self->_sampleSessionKey, 0);
  objc_storeStrong((id *)&self->_fieldFilters, 0);
}

- (AMSMetricsFigaroEventModifier)initWithMetricsDictionary:(id)a3 overrideDictionary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AMSMetricsFigaroEventModifier;
  v9 = [(AMSMetricsFigaroEventModifier *)&v16 init];
  char v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_overrideDictionary, a4);
    objc_storeStrong((id *)&v10->_metricsDictionary, a3);
    uint64_t v11 = [(AMSMetricsFigaroEventModifier *)v10 _fieldFiltersFromOverrides:v8];
    fieldFilters = v10->_fieldFilters;
    v10->_fieldFilters = (NSDictionary *)v11;

    if ([(NSDictionary *)v10->_fieldFilters count])
    {
      uint64_t v13 = [(AMSMetricsFigaroEventModifier *)v10 _createSampleSessionKey];
      sampleSessionKey = v10->_sampleSessionKey;
      v10->_sampleSessionKey = (NSString *)v13;
    }
  }

  return v10;
}

- (id)_fieldFiltersFromOverrides:(id)a3
{
  if (a3)
  {
    v3 = (void *)MEMORY[0x1E4F1CAD0];
    id v4 = a3;
    v5 = [v3 setWithArray:&unk_1EDD019A8];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = [v4 objectForKeyedSubscript:@"fieldFilters"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__AMSMetricsFigaroEventModifier__fieldFiltersFromOverrides___block_invoke;
    v14[3] = &unk_1E55A4528;
    id v15 = v5;
    id v10 = v6;
    id v16 = v10;
    id v11 = v5;
    [v8 enumerateKeysAndObjectsUsingBlock:v14];
    char v12 = v16;
    id v9 = v10;
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (double)flushInterval
{
  v3 = [(AMSMetricsFigaroEventModifier *)self _overridePropertyForKey:@"postFrequency"];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(AMSMetricsFigaroEventModifier *)self _overridePropertyForKey:@"postFrequency"];
    [v4 doubleValue];
    double v6 = v5;

    if (v6 != 0.0) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v7 = [(AMSMetricsFigaroEventModifier *)self metricsDictionary];
  id v8 = [v7 objectForKeyedSubscript:@"postFrequency"];
  double v6 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    id v9 = [(AMSMetricsFigaroEventModifier *)self metricsDictionary];
    id v10 = [v9 objectForKeyedSubscript:@"postFrequency"];
    [v10 doubleValue];
    double v6 = v11;
  }
LABEL_8:
  char v12 = [MEMORY[0x1E4F28ED0] numberWithDouble:v6];
  +[AMSMetrics timeIntervalFromServerTime:v12];
  if (v13 == 0.0) {
    double v14 = 0.0;
  }
  else {
    double v14 = v13;
  }

  return v14;
}

- (NSDictionary)metricsDictionary
{
  return self->_metricsDictionary;
}

- (id)_overridePropertyForKey:(id)a3
{
  id v4 = a3;
  double v5 = [(AMSMetricsFigaroEventModifier *)self overrideDictionary];
  double v6 = [v5 objectForKeyedSubscript:@"properties"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  id v8 = [v7 objectForKeyedSubscript:v4];

  return v8;
}

- (NSDictionary)overrideDictionary
{
  return self->_overrideDictionary;
}

- (id)_createSampleSessionKey
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v31 = self;
  id v4 = [(AMSMetricsFigaroEventModifier *)self fieldFilters];
  double v5 = [v4 allKeys];
  double v6 = objc_msgSend(v5, "sortedArrayUsingSelector:");

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = v6;
  uint64_t v32 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v32)
  {
    v33 = 0;
    v34 = 0;
    uint64_t v30 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v40 != v30) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        [v3 appendFormat:@"%@:", v8];
        id v9 = [(AMSMetricsFigaroEventModifier *)v31 fieldFilters];
        id v10 = [v9 objectForKeyedSubscript:v8];

        double v11 = [v10 allObjects];
        char v12 = [v11 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];

        if (!v34)
        {
          if ([v8 isEqualToString:@"topic"])
          {
            v34 = [v12 firstObject];
          }
          else
          {
            v34 = 0;
          }
        }
        if (!v33)
        {
          if ([v8 isEqualToString:@"eventType"])
          {
            v33 = [v12 firstObject];
          }
          else
          {
            v33 = 0;
          }
        }
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v36;
          char v17 = 1;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v36 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v19 = *(void *)(*((void *)&v35 + 1) + 8 * j);
              if ((v17 & 1) == 0) {
                [v3 appendString:@","];
              }
              [v3 appendString:v19];
              char v17 = 0;
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v35 objects:v43 count:16];
            char v17 = 0;
          }
          while (v15);
        }

        [v3 appendString:@";"];
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v32);
  }
  else
  {
    v33 = 0;
    v34 = 0;
  }

  v20 = [v3 dataUsingEncoding:4];
  v21 = objc_msgSend(v20, "ams_SHA1");
  v22 = [v21 base64EncodedStringWithOptions:0];
  if ([v22 hasSuffix:@"="])
  {
    do
    {
      v23 = objc_msgSend(v22, "substringToIndex:", objc_msgSend(v22, "length") - 1);

      v22 = v23;
    }
    while (([v23 hasSuffix:@"="] & 1) != 0);
  }
  else
  {
    v23 = v22;
  }
  if (v34) {
    v24 = v34;
  }
  else {
    v24 = v33;
  }
  v25 = v24;
  if (v25) {
    v26 = v25;
  }
  else {
    v26 = @"Figaro";
  }
  v27 = [NSString stringWithFormat:@"%@:%@", v26, v23];

  return v27;
}

- (BOOL)fieldFiltersMatchEvent:(id)a3
{
  id v4 = a3;
  double v5 = [(AMSMetricsFigaroEventModifier *)self fieldFilters];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 1;
    id v7 = [(AMSMetricsFigaroEventModifier *)self fieldFilters];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__AMSMetricsFigaroEventModifier_fieldFiltersMatchEvent___block_invoke;
    v10[3] = &unk_1E55A4500;
    id v11 = v4;
    char v12 = &v13;
    [v7 enumerateKeysAndObjectsUsingBlock:v10];

    BOOL v8 = *((unsigned char *)v14 + 24) != 0;
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (NSDictionary)fieldFilters
{
  return self->_fieldFilters;
}

void __60__AMSMetricsFigaroEventModifier__fieldFiltersFromOverrides___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) containsObject:v5])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__AMSMetricsFigaroEventModifier__fieldFiltersFromOverrides___block_invoke_2;
    aBlock[3] = &unk_1E559E310;
    id v8 = v7;
    id v20 = v8;
    id v9 = (void (**)(void *, void))_Block_copy(aBlock);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v10 = v6;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v21 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v16;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v16 != v13) {
              objc_enumerationMutation(v10);
            }
            v9[2](v9, *(void *)(*((void *)&v15 + 1) + 8 * v14++));
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v21 count:16];
        }
        while (v12);
      }
    }
    else
    {
      ((void (**)(void *, id))v9)[2](v9, v6);
    }
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v5, (void)v15);
  }
}

void __60__AMSMetricsFigaroEventModifier__fieldFiltersFromOverrides___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 32) addObject:v6];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = *(void **)(a1 + 32);
      id v4 = [v6 stringValue];
      id v5 = v3;
    }
    else
    {
      id v4 = [NSString stringWithFormat:@"%@", v6];
      id v5 = *(void **)(a1 + 32);
    }
    [v5 addObject:v4];
  }
}

- (id)preparedEventPromiseWithEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSMetricsFigaroEventModifier *)self metricsDictionary];
  if (v5)
  {
    id v6 = [(AMSMetricsFigaroEventModifier *)self _overridePropertyForKey:@"blacklistedFields"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    if ([v7 count]) {
      [v4 removePropertiesForKeys:v7];
    }
    id v9 = [v5 objectForKeyedSubscript:@"blacklistedFields"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    if ([v10 count]) {
      [v4 removePropertiesForKeys:v10];
    }
    id v8 = +[AMSPromise promiseWithResult:v4];
  }
  else
  {
    id v8 = +[AMSPromise promiseWithResult:v4];
  }

  return v8;
}

- (id)reportingURLForEvent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 topic];

  if (!v5)
  {
    id v8 = 0;
    goto LABEL_15;
  }
  id v6 = [(AMSMetricsFigaroEventModifier *)self _overridePropertyForKey:@"metricsUrl"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;

    if (v7) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  id v9 = [(AMSMetricsFigaroEventModifier *)self metricsDictionary];
  id v10 = [v9 objectForKeyedSubscript:@"metricsUrl"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = 0;
    long long v15 = 0;
    goto LABEL_12;
  }
  id v7 = v10;

  if (!v7)
  {
LABEL_13:
    long long v15 = 0;
    goto LABEL_14;
  }
LABEL_9:
  uint64_t v11 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
  if (!v11) {
    goto LABEL_13;
  }
  uint64_t v12 = v11;
  uint64_t v13 = [v11 URLByAppendingPathComponent:@"2"];

  uint64_t v14 = [v4 topic];
  id v10 = [v13 URLByAppendingPathComponent:v14];

  long long v15 = [v10 absoluteString];
LABEL_12:

LABEL_14:
  id v8 = v15;

LABEL_15:
  return v8;
}

- (BOOL)shouldDropEvent:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 topic];
  uint64_t v6 = [v5 length];

  id v7 = [(AMSMetricsFigaroEventModifier *)self _overridePropertyForKey:@"disabled"];
  if (!v6 || (objc_opt_respondsToSelector() & 1) != 0 && [v7 BOOLValue])
  {
    id v8 = [v4 eventType];
LABEL_16:
    LOBYTE(v19) = 1;
    goto LABEL_17;
  }
  BOOL v9 = [(AMSMetricsFigaroEventModifier *)self _shouldSampleEvent:v4];
  id v10 = [v4 eventType];
  id v8 = v10;
  if (!v9) {
    goto LABEL_16;
  }
  if ([v10 length])
  {
    uint64_t v11 = [(AMSMetricsFigaroEventModifier *)self _overridePropertyForKey:@"blacklistedEvents"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    if ([v12 containsObject:v8])
    {
      uint64_t v13 = +[AMSLogConfig sharedMetricsConfig];
      if (!v13)
      {
        uint64_t v13 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v14 = [v13 OSLogObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        long long v15 = objc_opt_class();
        id v16 = v15;
        long long v17 = AMSLogKey();
        long long v18 = [v4 topic];
        *(_DWORD *)buf = 138544130;
        v31 = v15;
        __int16 v32 = 2114;
        v33 = v17;
        __int16 v34 = 2114;
        long long v35 = v8;
        __int16 v36 = 2114;
        long long v37 = v18;
        _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Override blacklisted eventType: %{public}@ (topic: %{public}@)", buf, 0x2Au);
      }
      goto LABEL_16;
    }
  }
  if ([v8 length])
  {
    v21 = [(AMSMetricsFigaroEventModifier *)self metricsDictionary];
    uint64_t v22 = [v21 objectForKeyedSubscript:@"blacklistedEvents"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v23 = v22;
    }
    else {
      id v23 = 0;
    }

    int v19 = [v23 containsObject:v8];
    if (v19)
    {
      v24 = +[AMSLogConfig sharedMetricsConfig];
      if (!v24)
      {
        v24 = +[AMSLogConfig sharedConfig];
      }
      v25 = [v24 OSLogObject];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = objc_opt_class();
        id v29 = v26;
        v27 = AMSLogKey();
        v28 = [v4 topic];
        *(_DWORD *)buf = 138544130;
        v31 = v26;
        __int16 v32 = 2114;
        v33 = v27;
        __int16 v34 = 2114;
        long long v35 = v8;
        __int16 v36 = 2114;
        long long v37 = v28;
        _os_log_impl(&dword_18D554000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Blacklisted eventType: %{public}@ (topic: %{public}@)", buf, 0x2Au);
      }
    }
  }
  else
  {
    LOBYTE(v19) = 0;
  }
LABEL_17:

  return v19;
}

- (BOOL)shouldSkipEvent:(id)a3
{
  id v3 = [(AMSMetricsFigaroEventModifier *)self _overridePropertyForKey:@"sendDisabled"];
  BOOL v4 = (objc_opt_respondsToSelector() & 1) != 0 && ([v3 BOOLValue] & 1) != 0;

  return v4;
}

- (BOOL)_shouldSampleEvent:(id)a3
{
  if (([a3 preventSampling] & 1) == 0)
  {
    id v5 = [(AMSMetricsFigaroEventModifier *)self _overridePropertyForKey:@"sampling"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;

      if (!v6)
      {
        BOOL v4 = 1;
        goto LABEL_12;
      }
      id v5 = [v6 objectForKeyedSubscript:@"percentage"];
      id v7 = [v6 objectForKeyedSubscript:@"duration"];
      if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
      {
        [v5 doubleValue];
        double v9 = v8;
        [v7 doubleValue];
        double v11 = v10;
        id v12 = [(AMSMetricsFigaroEventModifier *)self sampleSessionKey];
        BOOL v4 = +[AMSDefaults shouldSampleWithPercentage:v12 sessionDuration:v9 identifier:v11];
      }
      else
      {
        BOOL v4 = 0;
      }
    }
    else
    {
      id v6 = 0;
      BOOL v4 = 1;
    }

LABEL_12:
    return v4;
  }
  return 1;
}

- (NSString)sampleSessionKey
{
  return self->_sampleSessionKey;
}

@end