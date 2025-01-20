@interface HMDNotificationConditionConverter
+ (BOOL)_isTimePredicate:(id)a3;
+ (id)_presencePredicatesFromPredicate:(id)a3;
+ (id)_sunriseSunsetTimePeriodElementFromComparisonPredicate:(id)a3;
+ (id)_timeOfDayTimePeriodElementFromComparisonPredicate:(id)a3;
+ (id)_timePredicatesFromPredicate:(id)a3;
+ (id)conditionsFromPredicate:(id)a3;
+ (id)logCategory;
+ (id)negateOffsetDateComponents:(id)a3;
+ (id)predicateFromPresenceCondition:(id)a3;
+ (id)predicateFromTimePeriodCondition:(id)a3;
+ (id)predicatesFromConditions:(id)a3;
+ (id)presenceNotificationConditionFromPredicate:(id)a3;
+ (id)timePeriodNotificationConditionFromPredicate:(id)a3;
@end

@implementation HMDNotificationConditionConverter

+ (id)logCategory
{
  if (logCategory__hmf_once_t21_191174 != -1) {
    dispatch_once(&logCategory__hmf_once_t21_191174, &__block_literal_global_38_191175);
  }
  v2 = (void *)logCategory__hmf_once_v22_191176;
  return v2;
}

void __48__HMDNotificationConditionConverter_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v22_191176;
  logCategory__hmf_once_v22_191176 = v0;
}

+ (id)predicateFromTimePeriodCondition:(id)a3
{
  v61[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 startElement];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v7 = [v4 startElement];
  if (isKindOfClass)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
    id v9 = v8;

    v10 = [v4 endElement];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
    id v12 = v11;

    uint64_t v13 = [v9 hour];
    unint64_t v14 = [v9 minute] + 60 * v13;
    uint64_t v15 = [v12 hour];
    unint64_t v16 = [v12 minute] + 60 * v15;
    id v17 = objc_alloc_init(MEMORY[0x263EFF918]);
    objc_msgSend(v17, "setHour:", objc_msgSend(v9, "hour"));
    uint64_t v18 = [v9 minute];

    [v17 setMinute:v18];
    id v19 = objc_alloc_init(MEMORY[0x263EFF918]);
    objc_msgSend(v19, "setHour:", objc_msgSend(v12, "hour"));
    uint64_t v20 = [v12 minute];

    [v19 setMinute:v20];
    v21 = [MEMORY[0x263F0E310] predicateForEvaluatingTriggerOccurringAfterDateWithComponents:v17];
    v22 = [MEMORY[0x263F0E310] predicateForEvaluatingTriggerOccurringBeforeDateWithComponents:v19];
    uint64_t v56 = MEMORY[0x263EF8330];
    unint64_t v57 = v14;
    if (v14 <= v16) {
      uint64_t v23 = 1;
    }
    else {
      uint64_t v23 = 2;
    }
    id v24 = objc_alloc(MEMORY[0x263F08730]);
    v61[0] = v21;
    v61[1] = v22;
    v25 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v61, 2, v56, 3221225472, __70__HMDNotificationConditionConverter_predicateFromTimePeriodCondition___block_invoke, &__block_descriptor_48_e5_Q8__0l, v57, v16);
    v26 = (void *)[v24 initWithType:v23 subpredicates:v25];

    goto LABEL_12;
  }
  objc_opt_class();
  char v27 = objc_opt_isKindOfClass();

  if (v27)
  {
    v28 = [v4 startElement];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v29 = v28;
    }
    else {
      v29 = 0;
    }
    id v17 = v29;

    v30 = [v4 endElement];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v31 = v30;
    }
    else {
      v31 = 0;
    }
    id v19 = v31;

    v32 = [v17 significantEvent];
    uint64_t v33 = *MEMORY[0x263F0D8F8];
    if ([v32 isEqualToString:*MEMORY[0x263F0D8F8]])
    {
      v34 = [v19 significantEvent];
      uint64_t v35 = *MEMORY[0x263F0D908];
      char v36 = [v34 isEqualToString:*MEMORY[0x263F0D908]];

      if (v36)
      {
        uint64_t v37 = 1;
LABEL_32:
        id v42 = objc_alloc(MEMORY[0x263F0E788]);
        v43 = [v17 significantEvent];
        v44 = [v17 offset];
        v21 = (void *)[v42 initWithSignificantEvent:v43 offset:v44];

        v22 = [MEMORY[0x263F0E310] predicateForEvaluatingTriggerOccurringAfterSignificantEvent:v21];
        id v45 = objc_alloc(MEMORY[0x263F0E788]);
        v46 = [v19 significantEvent];
        v47 = [v19 offset];
        v48 = (void *)[v45 initWithSignificantEvent:v46 offset:v47];

        v49 = [MEMORY[0x263F0E310] predicateForEvaluatingTriggerOccurringBeforeSignificantEvent:v48];
        id v50 = objc_alloc(MEMORY[0x263F08730]);
        v58[0] = v22;
        v58[1] = v49;
        v51 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:2];
        v26 = (void *)[v50 initWithType:v37 subpredicates:v51];

LABEL_12:
LABEL_13:

        goto LABEL_25;
      }
    }
    else
    {

      uint64_t v35 = *MEMORY[0x263F0D908];
    }
    v39 = [v17 significantEvent];
    if ([v39 isEqualToString:v35])
    {
      v40 = [v19 significantEvent];
      char v41 = [v40 isEqualToString:v33];

      if (v41)
      {
        uint64_t v37 = 2;
        goto LABEL_32;
      }
    }
    else
    {
    }
    v52 = (void *)MEMORY[0x230FBD990]();
    id v53 = a1;
    v54 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      v55 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v60 = v55;
      _os_log_impl(&dword_22F52A000, v54, OS_LOG_TYPE_ERROR, "%{public}@Start & end are either both sunrise or both sunset, this is unsupported", buf, 0xCu);
    }
    v26 = 0;
    goto LABEL_13;
  }
  v26 = 0;
LABEL_25:

  return v26;
}

uint64_t __70__HMDNotificationConditionConverter_predicateFromTimePeriodCondition___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32) <= *(void *)(a1 + 40)) {
    return 1;
  }
  else {
    return 2;
  }
}

+ (id)predicateFromPresenceCondition:(id)a3
{
  v21[5] = *MEMORY[0x263EF8340];
  id v3 = a3;
  [v3 presenceEventType];
  [v3 presenceEventUserType];
  id v4 = [v3 userUUIDs];

  v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_25_191191);

  v6 = presenceTypeForEventTypeAndGranularity();
  v7 = [MEMORY[0x263F0E680] activationGranularityWithValue:granularityForEventType()];
  v8 = (void *)MEMORY[0x263EFF9A0];
  v20[0] = @"kEventUUIDKey";
  id v9 = objc_msgSend(MEMORY[0x263F08C38], "hmf_zeroUUID");
  v10 = [v9 UUIDString];
  v21[0] = v10;
  v21[1] = &unk_26E472868;
  v20[1] = @"kEventTriggerEndEvent";
  v20[2] = @"kEventTriggerTypeKey";
  v21[2] = @"kEventTriggerTypePresenceEventKey";
  v21[3] = v6;
  v20[3] = @"kPresenceEventPresence";
  v20[4] = @"kPresenceEventActivationGranularity";
  v11 = [v7 number];
  v21[4] = v11;
  id v12 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:5];
  uint64_t v13 = [v8 dictionaryWithDictionary:v12];

  if ((objc_msgSend(v5, "hmf_isEmpty") & 1) == 0)
  {
    unint64_t v14 = [v5 allObjects];
    [v13 setObject:v14 forKeyedSubscript:@"kPresenceEventUsers"];
  }
  uint64_t v15 = (void *)MEMORY[0x263F08A98];
  uint64_t v16 = *MEMORY[0x263F0D4A8];
  id v17 = (void *)[v13 copy];
  uint64_t v18 = [v15 predicateWithFormat:@"%K = %@", v16, v17];

  return v18;
}

uint64_t __68__HMDNotificationConditionConverter_predicateFromPresenceCondition___block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

+ (id)negateOffsetDateComponents:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF918]);
  if ([v3 minute] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v4, "setMinute:", -objc_msgSend(v3, "minute"));
  }
  if ([v3 hour] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v4, "setHour:", -objc_msgSend(v3, "hour"));
  }

  return v4;
}

+ (id)_timeOfDayTimePeriodElementFromComparisonPredicate:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 predicateOperatorType] > 4)
  {
    v7 = 0;
    goto LABEL_12;
  }
  id v4 = [v3 leftExpression];
  v5 = [v3 rightExpression];
  if ([v4 expressionType] != 4) {
    goto LABEL_10;
  }
  v6 = [v4 function];
  if ([v6 isEqualToString:@"now"] && !objc_msgSend(v5, "expressionType"))
  {
    v8 = [v5 constantValue];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v6 = [v5 constantValue];
      v7 = -[HMDTimeOfDayTimePeriodElement initWithHour:minute:]([HMDTimeOfDayTimePeriodElement alloc], "initWithHour:minute:", [v6 hour], objc_msgSend(v6, "minute"));
      goto LABEL_6;
    }
LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
  v7 = 0;
LABEL_6:

LABEL_11:
LABEL_12:

  return v7;
}

+ (id)_sunriseSunsetTimePeriodElementFromComparisonPredicate:(id)a3
{
  v27[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((unint64_t)[v4 predicateOperatorType] > 3)
  {
    uint64_t v23 = 0;
  }
  else
  {
    v5 = [v4 leftExpression];
    if ([v5 expressionType] != 3) {
      goto LABEL_21;
    }
    uint64_t v6 = *MEMORY[0x263F0D908];
    v27[0] = *MEMORY[0x263F0D8F8];
    v27[1] = v6;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
    v8 = [v5 keyPath];
    int v9 = [v7 containsObject:v8];

    if (v9)
    {
      v10 = [v5 keyPath];
      id v11 = objc_alloc_init(MEMORY[0x263EFF918]);
      id v12 = [v4 rightExpression];
      if ([v12 expressionType] == 4)
      {
        uint64_t v13 = [v12 function];
        int v14 = [v13 isEqualToString:@"add:to:"];

        if (v14)
        {
          uint64_t v15 = [v12 arguments];
          uint64_t v16 = [v15 firstObject];
          if ([v16 expressionType] == 4)
          {
            id v17 = [v16 function];
            int v18 = [v17 isEqualToString:@"now"];

            if (v18)
            {
              id v19 = [v15 lastObject];
              if (![v19 expressionType])
              {
                [v19 constantValue];
                uint64_t v20 = v26 = v19;
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();

                if (isKindOfClass)
                {
                  id v19 = v26;
                  v25 = [v26 constantValue];
                  if ([v25 hour] != 0x7FFFFFFFFFFFFFFFLL
                    || [v25 minute] != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    v22 = [v26 constantValue];

                    if ([v22 hour] != 0x7FFFFFFFFFFFFFFFLL && !objc_msgSend(v22, "hour")) {
                      [v22 setHour:0x7FFFFFFFFFFFFFFFLL];
                    }
                    if ([v22 minute] != 0x7FFFFFFFFFFFFFFFLL && !objc_msgSend(v22, "minute")) {
                      [v22 setMinute:0x7FFFFFFFFFFFFFFFLL];
                    }
                    id v11 = [a1 negateOffsetDateComponents:v22];

                    id v19 = v26;
                  }
                }
                else
                {
                  id v19 = v26;
                }
              }
            }
          }
        }
      }
      uint64_t v23 = [[HMDSunriseSunsetTimePeriodElement alloc] initWithSignificantEvent:v10 offset:v11];
    }
    else
    {
LABEL_21:
      uint64_t v23 = 0;
    }
  }
  return v23;
}

+ (id)_timePredicatesFromPredicate:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9C0] set];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
    if ([a1 _isTimePredicate:v6])
    {
      [v5 addObject:v6];
    }
    else
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      v7 = objc_msgSend(v6, "subpredicates", 0);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = [a1 _timePredicatesFromPredicate:*(void *)(*((void *)&v15 + 1) + 8 * i)];
            [v5 unionSet:v12];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v9);
      }
    }
  }
  uint64_t v13 = (void *)[v5 copy];

  return v13;
}

+ (BOOL)_isTimePredicate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  id v6 = v5;
  if (v5
    && ([v5 subpredicates],
        v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        v8 == 2))
  {
    uint64_t v9 = [v6 subpredicates];
    uint64_t v10 = objc_msgSend(v9, "na_filter:", &__block_literal_global_14_191211);

    BOOL v11 = [v10 count] == 2;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

uint64_t __54__HMDNotificationConditionConverter__isTimePredicate___block_invoke(uint64_t a1, void *a2)
{
  v17[2] = *MEMORY[0x263EF8340];
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 leftExpression];
    v7 = [v5 rightExpression];
    if ([v6 expressionType] == 4)
    {
      uint64_t v8 = [v6 function];
      if ([v8 isEqualToString:@"now"] && !objc_msgSend(v7, "expressionType"))
      {
        long long v16 = [v7 constantValue];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
      }
      else
      {
        char isKindOfClass = 0;
      }
    }
    else
    {
      char isKindOfClass = 0;
    }
    if ([v6 expressionType] == 3)
    {
      uint64_t v11 = *MEMORY[0x263F0D908];
      v17[0] = *MEMORY[0x263F0D8F8];
      v17[1] = v11;
      id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
      uint64_t v13 = [v6 keyPath];
      char v14 = [v12 containsObject:v13];
    }
    else
    {
      char v14 = 0;
    }
    char v10 = isKindOfClass | v14;
  }
  else
  {
    char v10 = 0;
  }

  return v10 & 1;
}

+ (id)_presencePredicatesFromPredicate:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9C0] set];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v6 = objc_msgSend(v4, "subpredicates", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [a1 _presencePredicatesFromPredicate:*(void *)(*((void *)&v21 + 1) + 8 * i)];
          [v5 unionSet:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v8);
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v4;
      uint64_t v13 = [v12 rightExpression];
      char v14 = [v12 leftExpression];
      if ([v14 expressionType] == 3)
      {
        long long v15 = [v14 keyPath];
        int v16 = [v15 isEqualToString:*MEMORY[0x263F0D4A8]];

        if (v16)
        {
          if (![v13 expressionType])
          {
            long long v17 = [v13 constantValue];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass) {
              [v5 addObject:v12];
            }
          }
        }
      }
    }
  }
  id v19 = (void *)[v5 copy];

  return v19;
}

+ (id)timePeriodNotificationConditionFromPredicate:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [a1 _timePredicatesFromPredicate:v4];
  if (objc_msgSend(v5, "hmf_isEmpty"))
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = a1;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v35 = v9;
      char v10 = "%{public}@No time predicate found to convert.";
      uint64_t v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_INFO;
      uint32_t v13 = 12;
LABEL_7:
      _os_log_impl(&dword_22F52A000, v11, v12, v10, buf, v13);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if ((unint64_t)[v5 count] >= 2)
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = a1;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v35 = v9;
      __int16 v36 = 2112;
      uint64_t v37 = v5;
      char v10 = "%{public}@Expected at most 1 time predicate, found: %@";
      uint64_t v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 22;
      goto LABEL_7;
    }
LABEL_8:

    char v14 = 0;
    goto LABEL_30;
  }
  long long v15 = [v5 allObjects];
  int v16 = [v15 firstObject];

  long long v17 = (void *)MEMORY[0x230FBD990]();
  id v18 = a1;
  id v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    uint64_t v20 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v35 = v20;
    __int16 v36 = 2112;
    uint64_t v37 = v16;
    _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Converting time range predicate: %@", buf, 0x16u);
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__HMDNotificationConditionConverter_timePeriodNotificationConditionFromPredicate___block_invoke;
  aBlock[3] = &__block_descriptor_40_e53___HMDTimePeriodElement_16__0__NSComparisonPredicate_8l;
  aBlock[4] = v18;
  long long v21 = (void (**)(void *, id))_Block_copy(aBlock);
  long long v22 = [v16 subpredicates];
  long long v23 = [v22 objectAtIndexedSubscript:0];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    long long v24 = v23;
  }
  else {
    long long v24 = 0;
  }
  id v25 = v24;

  if (v25)
  {
    uint64_t v26 = v21[2](v21, v25);
    if (v26)
    {
      char v27 = [v16 subpredicates];
      v28 = [v27 objectAtIndexedSubscript:1];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v29 = v28;
      }
      else {
        v29 = 0;
      }
      id v30 = v29;

      if (v30)
      {
        v31 = v21[2](v21, v30);
        if (v31) {
          char v14 = [[HMDTimePeriodNotificationCondition alloc] initWithStartElement:v26 endElement:v31];
        }
        else {
          char v14 = 0;
        }
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

LABEL_30:
  return v14;
}

id __82__HMDNotificationConditionConverter_timePeriodNotificationConditionFromPredicate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _timeOfDayTimePeriodElementFromComparisonPredicate:v3];
  if (!v4)
  {
    id v4 = [*(id *)(a1 + 32) _sunriseSunsetTimePeriodElementFromComparisonPredicate:v3];
  }

  return v4;
}

+ (id)presenceNotificationConditionFromPredicate:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [a1 _presencePredicatesFromPredicate:v4];
  if (objc_msgSend(v5, "hmf_isEmpty"))
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = a1;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v35 = v9;
      char v10 = "%{public}@No presence predicate found to convert.";
      uint64_t v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_INFO;
      uint32_t v13 = 12;
LABEL_7:
      _os_log_impl(&dword_22F52A000, v11, v12, v10, buf, v13);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if ((unint64_t)[v5 count] >= 2)
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = a1;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v35 = v9;
      __int16 v36 = 2112;
      uint64_t v37 = v5;
      char v10 = "%{public}@Expected at most 1 presence predicate, found: %@";
      uint64_t v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 22;
      goto LABEL_7;
    }
LABEL_8:

    char v14 = 0;
    goto LABEL_12;
  }
  id v33 = v4;
  long long v15 = [v5 allObjects];
  int v16 = [v15 firstObject];

  long long v17 = (void *)MEMORY[0x230FBD990]();
  id v18 = a1;
  id v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    uint64_t v20 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v35 = v20;
    __int16 v36 = 2112;
    uint64_t v37 = v16;
    _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Converting presence predicate: %@", buf, 0x16u);
  }
  long long v21 = [v16 rightExpression];
  long long v22 = [v21 constantValue];

  long long v23 = objc_msgSend(v22, "hmf_stringForKey:", @"kPresenceEventPresence");
  v32 = [MEMORY[0x263F0E680] activationGranularityWithDict:v22];
  [v32 value];
  long long v24 = objc_msgSend(v22, "hmf_arrayForKey:", @"kPresenceEventUsers");
  id v25 = objc_msgSend(v24, "na_map:", &__block_literal_global_191224);
  uint64_t v26 = eventTypeForPresenceTypeAndGranularity();
  uint64_t v27 = userTypeForPresenceTypeAndGranularity();
  v28 = [HMDPresenceNotificationCondition alloc];
  [MEMORY[0x263EFFA08] setWithArray:v25];
  id v30 = v29 = v16;
  char v14 = [(HMDPresenceNotificationCondition *)v28 initWithPresenceEventType:v26 presenceEventUserType:v27 userUUIDs:v30];

  id v4 = v33;
LABEL_12:

  return v14;
}

id __80__HMDNotificationConditionConverter_presenceNotificationConditionFromPredicate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x263F08C38];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithUUIDString:v3];

  return v4;
}

+ (id)predicatesFromConditions:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__HMDNotificationConditionConverter_predicatesFromConditions___block_invoke;
  v11[3] = &__block_descriptor_40_e34__16__0__HMDNotificationCondition_8l;
  v11[4] = a1;
  id v5 = objc_msgSend(v4, "na_map:", v11);
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = a1;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    uint32_t v13 = v9;
    __int16 v14 = 2112;
    id v15 = v4;
    __int16 v16 = 2112;
    long long v17 = v5;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Converted conditions: %@ to predicates: %@", buf, 0x20u);
  }

  return v5;
}

id __62__HMDNotificationConditionConverter_predicatesFromConditions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;

    uint64_t v8 = [v4 predicateFromTimePeriodCondition:v7];
LABEL_11:
    os_log_type_t v12 = (void *)v8;

    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = *(void **)(a1 + 32);
    id v10 = v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    id v7 = v11;

    uint64_t v8 = [v9 predicateFromPresenceCondition:v7];
    goto LABEL_11;
  }
  uint32_t v13 = (void *)MEMORY[0x230FBD990]();
  id v14 = *(id *)(a1 + 32);
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    __int16 v16 = HMFGetLogIdentifier();
    int v18 = 138543618;
    id v19 = v16;
    __int16 v20 = 2112;
    id v21 = v3;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unsupported condition: %@ when converting to predicate", (uint8_t *)&v18, 0x16u);
  }
  os_log_type_t v12 = 0;
LABEL_15:

  return v12;
}

+ (id)conditionsFromPredicate:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x263EFF9C0] set];
    id v6 = [a1 presenceNotificationConditionFromPredicate:v4];
    if (v6) {
      [v5 addObject:v6];
    }
    uint64_t v7 = [a1 timePeriodNotificationConditionFromPredicate:v4];
    uint64_t v8 = (void *)v7;
    if (v7) {
      uint64_t v7 = [v5 addObject:v7];
    }
    uint64_t v9 = (void *)MEMORY[0x230FBD990](v7);
    id v10 = a1;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      os_log_type_t v12 = HMFGetLogIdentifier();
      int v19 = 138543874;
      __int16 v20 = v12;
      __int16 v21 = 2112;
      id v22 = v4;
      __int16 v23 = 2112;
      long long v24 = v5;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Converted predicate: %@ to conditions: %@", (uint8_t *)&v19, 0x20u);
    }
    uint32_t v13 = (void *)[v5 copy];
  }
  else
  {
    id v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = a1;
    __int16 v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      long long v17 = HMFGetLogIdentifier();
      int v19 = 138543362;
      __int16 v20 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Predicate is nil, nothing to convert", (uint8_t *)&v19, 0xCu);
    }
    uint32_t v13 = [MEMORY[0x263EFFA08] set];
  }

  return v13;
}

@end