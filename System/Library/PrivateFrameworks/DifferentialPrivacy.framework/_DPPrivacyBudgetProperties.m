@interface _DPPrivacyBudgetProperties
+ (_DPPrivacyBudgetProperties)budgetPropertiesWithName:(id)a3 fromDictionary:(id)a4;
+ (id)allBudgetPropertiesKeys;
+ (id)budgetMaintenanceSchedule;
+ (id)budgetPropertiesForKey:(id)a3;
+ (id)budgetPropertiesFromFile:(id)a3;
+ (void)initializeAllBudgetProperties;
- (NSNumber)interval;
- (NSNumber)intervalBudgetValue;
- (NSNumber)intervalChunksValue;
- (NSNumber)intervalCohortAggregateBudgetValue;
- (NSNumber)refillAmount;
- (NSNumber)refillInterval;
- (NSString)name;
- (_DPPrivacyBudgetProperties)init;
- (_DPPrivacyBudgetProperties)initWithName:(id)a3 dictionary:(id)a4;
- (id)description;
- (void)setInterval:(id)a3;
- (void)setIntervalBudgetValue:(id)a3;
- (void)setIntervalChunksValue:(id)a3;
- (void)setIntervalCohortAggregateBudgetValue:(id)a3;
- (void)setRefillAmount:(id)a3;
- (void)setRefillInterval:(id)a3;
@end

@implementation _DPPrivacyBudgetProperties

- (_DPPrivacyBudgetProperties)init
{
  return 0;
}

- (_DPPrivacyBudgetProperties)initWithName:(id)a3 dictionary:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v57.receiver = self;
  v57.super_class = (Class)_DPPrivacyBudgetProperties;
  v9 = [(_DPPrivacyBudgetProperties *)&v57 init];
  v10 = v9;
  if (!v9) {
    goto LABEL_19;
  }
  id v56 = v7;
  p_name = &v9->_name;
  objc_storeStrong((id *)&v9->_name, a3);
  [v8 objectForKeyedSubscript:@"SessionSeconds"];
  v55 = p_interval = (id *)&v10->_interval;
  objc_storeStrong((id *)&v10->_interval, v55);
  [v8 objectForKeyedSubscript:@"SessionAmount"];
  v54 = p_intervalBudgetValue = (id *)&v10->_intervalBudgetValue;
  objc_storeStrong((id *)&v10->_intervalBudgetValue, v54);
  [v8 objectForKeyedSubscript:@"RefillInterval"];
  v53 = p_refillInterval = (id *)&v10->_refillInterval;
  objc_storeStrong((id *)&v10->_refillInterval, v53);
  v15 = [v8 objectForKeyedSubscript:@"RefillAmount"];
  p_refillAmount = (id *)&v10->_refillAmount;
  objc_storeStrong((id *)&v10->_refillAmount, v15);
  uint64_t v17 = [v8 objectForKeyedSubscript:@"CohortAggregateSessionAmount"];
  v18 = (void *)v17;
  if (v17) {
    v19 = (void *)v17;
  }
  else {
    v19 = &unk_1F37A0668;
  }
  p_intervalCohortAggregateBudgetValue = (id *)&v10->_intervalCohortAggregateBudgetValue;
  objc_storeStrong((id *)&v10->_intervalCohortAggregateBudgetValue, v19);
  if (!v10->_name || !*p_interval || !*p_intervalBudgetValue || !*p_refillInterval || !*p_refillAmount)
  {
    int v28 = 1;
    v29 = v55;
    id v7 = v56;
    v31 = v53;
    v30 = v54;
    goto LABEL_17;
  }
  uint64_t v21 = [v8 objectForKeyedSubscript:@"SessionChunks"];
  v52 = (void *)v21;
  if (v21) {
    v22 = (void *)v21;
  }
  else {
    v22 = &unk_1F37A0358;
  }
  p_uint64_t intervalChunksValue = (id *)&v10->_intervalChunksValue;
  objc_storeStrong((id *)&v10->_intervalChunksValue, v22);
  unint64_t v23 = [(NSNumber *)v10->_interval unsignedLongLongValue];
  if (v23 >= kSecondsInOneDay)
  {
    if ((unint64_t)[*p_intervalBudgetValue unsignedLongLongValue] < 0xB)
    {
      if ([*p_intervalChunksValue unsignedLongLongValue]
        && (unint64_t)[*p_intervalChunksValue unsignedLongLongValue] < 0x12D)
      {
        if (![*p_refillInterval unsignedLongLongValue]
          || (unint64_t v41 = [*p_interval unsignedIntegerValue],
              v41 < [*p_refillInterval unsignedIntegerValue]))
        {
          v42 = +[_DPLog framework];
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            v43 = *p_name;
            id v44 = *p_interval;
            id v45 = *p_refillInterval;
            *(_DWORD *)buf = 138412802;
            v59 = v43;
            __int16 v60 = 2112;
            uint64_t v61 = (uint64_t)v44;
            __int16 v62 = 2112;
            uint64_t v63 = (uint64_t)v45;
            _os_log_impl(&dword_1DC55E000, v42, OS_LOG_TYPE_INFO, "%@:  _interval=%@ ; _refillInterval=%@", buf, 0x20u);
          }
          v24 = v42;
          goto LABEL_30;
        }
        if ((unint64_t)[*p_refillAmount unsignedIntegerValue] >= 0x65)
        {
          v24 = +[_DPLog framework];
          if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
            goto LABEL_30;
          }
          v46 = *p_name;
          id v47 = *p_refillAmount;
          *(_DWORD *)buf = 138412802;
          v59 = v46;
          __int16 v60 = 2048;
          uint64_t v61 = 100;
          __int16 v62 = 2112;
          uint64_t v63 = (uint64_t)v47;
          v27 = "%@: _kDPMaxRefillAmount=%lu ; _refillAmount=%@";
          goto LABEL_28;
        }
        [*p_intervalCohortAggregateBudgetValue doubleValue];
        if (v48 >= 0.0)
        {
          int v28 = 0;
          v29 = v55;
          id v7 = v56;
          v31 = v53;
          v30 = v54;
          v40 = v52;
          goto LABEL_31;
        }
        v24 = +[_DPLog framework];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v49 = *p_name;
          id v50 = *p_intervalCohortAggregateBudgetValue;
          *(_DWORD *)buf = 138412546;
          v59 = v49;
          __int16 v60 = 2112;
          uint64_t v61 = (uint64_t)v50;
          v27 = "%@: _intervalCohortAggregateBudgetValue=%@";
          v38 = v24;
          uint32_t v39 = 22;
          goto LABEL_29;
        }
      }
      else
      {
        v24 = +[_DPLog framework];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v36 = *p_name;
          uint64_t intervalChunksValue = (uint64_t)v10->_intervalChunksValue;
          *(_DWORD *)buf = 138412802;
          v59 = v36;
          __int16 v60 = 2112;
          uint64_t v61 = intervalChunksValue;
          __int16 v62 = 2048;
          uint64_t v63 = 300;
          v27 = "%@: _intervalChunksValue=%@ ; chunksValueInIntervalMAX()=%lld";
          goto LABEL_28;
        }
      }
    }
    else
    {
      v24 = +[_DPLog framework];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v34 = *p_name;
        id v35 = *p_intervalBudgetValue;
        *(_DWORD *)buf = 138412802;
        v59 = v34;
        __int16 v60 = 2112;
        uint64_t v61 = (uint64_t)v35;
        __int16 v62 = 2048;
        uint64_t v63 = 10;
        v27 = "%@: _intervalBudgetValue=%@ ; budgetValueInIntervalMAX()=%lld";
        goto LABEL_28;
      }
    }
  }
  else
  {
    v24 = +[_DPLog framework];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = *p_name;
      id v26 = *p_interval;
      *(_DWORD *)buf = 138412802;
      v59 = v25;
      __int16 v60 = 2112;
      uint64_t v61 = (uint64_t)v26;
      __int16 v62 = 2048;
      uint64_t v63 = kSecondsInOneDay;
      v27 = "%@: _interval=%@ ; budgetIntervalSecondsMIN()=%lld";
LABEL_28:
      v38 = v24;
      uint32_t v39 = 32;
LABEL_29:
      _os_log_impl(&dword_1DC55E000, v38, OS_LOG_TYPE_INFO, v27, buf, v39);
    }
  }
LABEL_30:
  v29 = v55;
  id v7 = v56;
  v31 = v53;
  v30 = v54;
  v40 = v52;

  int v28 = 1;
LABEL_31:

LABEL_17:
  if (!v28)
  {
LABEL_19:
    v32 = v10;
    goto LABEL_20;
  }
  v32 = 0;
LABEL_20:

  return v32;
}

+ (_DPPrivacyBudgetProperties)budgetPropertiesWithName:(id)a3 fromDictionary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithName:v7 dictionary:v6];

  return (_DPPrivacyBudgetProperties *)v8;
}

+ (void)initializeAllBudgetProperties
{
  v2 = (void *)MEMORY[0x1E019F810](a1, a2);
  v3 = +[_DPStrings budgetPropertiesPath];
  id v4 = +[_DPPrivacyBudgetProperties budgetPropertiesFromFile:v3];
}

+ (id)budgetPropertiesForKey:(id)a3
{
  id v3 = a3;
  id v4 = +[_DPStrings budgetPropertiesPath];
  v5 = +[_DPPrivacyBudgetProperties budgetPropertiesFromFile:v4];

  id v6 = [v5 objectForKeyedSubscript:v3];

  return v6;
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"%@: { name=%@ ; interval=%@ ; intervalBudgetValue=%@ ; intervalCohortAggregateBudgetValue=%@ ; refillInterval=%@ ; refillAmount=%@ }",
    v5,
    self->_name,
    self->_interval,
    self->_intervalBudgetValue,
    self->_intervalCohortAggregateBudgetValue,
    self->_refillInterval,
  id v6 = self->_refillAmount);

  return v6;
}

+ (id)budgetPropertiesFromFile:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55___DPPrivacyBudgetProperties_budgetPropertiesFromFile___block_invoke;
  v9[3] = &unk_1E6C43EF0;
  id v10 = v4;
  id v11 = a1;
  uint64_t v5 = budgetPropertiesFromFile__onceToken;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&budgetPropertiesFromFile__onceToken, v9);
  }
  id v7 = (id)gAllBudgetProperties;

  return v7;
}

+ (id)allBudgetPropertiesKeys
{
  return (id)[(id)gAllBudgetProperties allKeys];
}

+ (id)budgetMaintenanceSchedule
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = objc_msgSend((id)gAllBudgetProperties, "allValues", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v9 = [v8 interval];
        id v10 = [v8 name];
        if (v10)
        {
          id v11 = [v2 objectForKeyedSubscript:v9];
          if (v11)
          {
            v12 = v11;
            [v11 addObject:v10];
          }
          else
          {
            v12 = [MEMORY[0x1E4F1CA80] setWithObject:v10];
            [v2 setObject:v12 forKeyedSubscript:v9];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  return v2;
}

- (NSString)name
{
  return self->_name;
}

- (NSNumber)interval
{
  return self->_interval;
}

- (void)setInterval:(id)a3
{
}

- (NSNumber)intervalBudgetValue
{
  return self->_intervalBudgetValue;
}

- (void)setIntervalBudgetValue:(id)a3
{
}

- (NSNumber)intervalCohortAggregateBudgetValue
{
  return self->_intervalCohortAggregateBudgetValue;
}

- (void)setIntervalCohortAggregateBudgetValue:(id)a3
{
}

- (NSNumber)intervalChunksValue
{
  return self->_intervalChunksValue;
}

- (void)setIntervalChunksValue:(id)a3
{
}

- (NSNumber)refillInterval
{
  return self->_refillInterval;
}

- (void)setRefillInterval:(id)a3
{
}

- (NSNumber)refillAmount
{
  return self->_refillAmount;
}

- (void)setRefillAmount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refillAmount, 0);
  objc_storeStrong((id *)&self->_refillInterval, 0);
  objc_storeStrong((id *)&self->_intervalChunksValue, 0);
  objc_storeStrong((id *)&self->_intervalCohortAggregateBudgetValue, 0);
  objc_storeStrong((id *)&self->_intervalBudgetValue, 0);
  objc_storeStrong((id *)&self->_interval, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end