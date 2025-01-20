@interface HMDPredicateUtilities
+ (NSSet)predicateCodingClasses;
+ (id)decodePredicateFromData:(id)a3 error:(id *)a4;
+ (id)encodePredicate:(id)a3 error:(id *)a4;
+ (id)filteredPredicate:(id)a3 withUserUUIDs:(id)a4;
+ (id)logCategory;
+ (id)unarchiveFromData:(id)a3 error:(id *)a4;
- (BOOL)containsPresenceEvents:(id)a3;
- (HMDHome)home;
- (HMDPredicateUtilities)initWithHome:(id)a3 logIdentifier:(id)a4;
- (HMDPredicateUtilities)initWithHome:(id)a3 logIdentifier:(id)a4 homePresenceProvider:(id)a5;
- (NSString)logIdentifier;
- (id)_updatePredicate:(id)a3 staleCharacteristicInCurrentPredicate:(BOOL *)a4 accessory:(id)a5 conditionModified:(BOOL *)a6;
- (id)addDeltaToNow:(id)a3;
- (id)comparePresence:(id)a3 operatorType:(id)a4 homePresence:(id)a5;
- (id)compareValueOfCharacteristic:(id)a3 againstValue:(id)a4 operatorType:(id)a5;
- (id)dateTodayMatchingComponents:(id)a3;
- (id)generateAnalyticsData:(id)a3;
- (id)homePresenceProvider;
- (id)predicateWithoutStaleCharacteristicsFromPredicate:(id)a3 accessory:(id)a4 conditionModified:(BOOL *)a5;
- (id)rewriteNowAdjustedForHomeTimeZone:(id)a3;
- (id)rewritePredicate:(id)a3 currentCharacteristicInPredicate:(id *)a4 characteristicsToRead:(id)a5 homePresence:(id)a6;
- (id)rewritePredicate:(id)a3 forDaemon:(BOOL)a4 message:(id)a5;
- (id)rewritePredicateForClient:(id)a3;
- (id)rewritePredicateForDaemon:(id)a3 message:(id)a4;
- (id)sunrise;
- (id)sunset;
- (id)updatePredicate:(id)a3 currentCharacteristicInPredicate:(id *)a4 conditionModified:(BOOL *)a5 removedCharacteristic:(id)a6 underService:(id)a7 underAccessory:(id)a8;
- (id)updatePredicate:(id)a3 removedUser:(id)a4 conditionModified:(BOOL *)a5;
- (unint64_t)audioAnalysisEventNotificationOptions;
- (unint64_t)cameraSignificantEvent;
- (unint64_t)personFamiliarityOptions;
- (void)fillAnalyticsData:(id)a3 forPredicate:(id)a4;
- (void)setAudioAnalysisEventNotificationOptions:(unint64_t)a3;
- (void)setCameraSignificantEvent:(unint64_t)a3;
- (void)setHome:(id)a3;
- (void)setPersonFamiliarityOptions:(unint64_t)a3;
@end

@implementation HMDPredicateUtilities

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong(&self->_homePresenceProvider, 0);
  objc_destroyWeak((id *)&self->_home);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (id)homePresenceProvider
{
  return self->_homePresenceProvider;
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (void)setAudioAnalysisEventNotificationOptions:(unint64_t)a3
{
  self->_audioAnalysisEventNotificationOptions = a3;
}

- (unint64_t)audioAnalysisEventNotificationOptions
{
  return self->_audioAnalysisEventNotificationOptions;
}

- (void)setPersonFamiliarityOptions:(unint64_t)a3
{
  self->_personFamiliarityOptions = a3;
}

- (unint64_t)personFamiliarityOptions
{
  return self->_personFamiliarityOptions;
}

- (void)setCameraSignificantEvent:(unint64_t)a3
{
  self->_cameraSignificantEvent = a3;
}

- (unint64_t)cameraSignificantEvent
{
  return self->_cameraSignificantEvent;
}

- (void)fillAnalyticsData:(id)a3 forPredicate:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v8 = [v7 subpredicates];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v50 objects:v54 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v51 != v11) {
            objc_enumerationMutation(v8);
          }
          [(HMDPredicateUtilities *)self fillAnalyticsData:v6 forPredicate:*(void *)(*((void *)&v50 + 1) + 8 * i)];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v50 objects:v54 count:16];
      }
      while (v10);
    }
    goto LABEL_53;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    v13 = [v8 rightExpression];
    v14 = [v8 leftExpression];
    if ([v13 expressionType] == 4)
    {
      v15 = [v13 function];
      int v16 = [v15 isEqualToString:@"add:to:"];

      if (v16)
      {
        v17 = [v13 arguments];
        v18 = [v17 objectAtIndexedSubscript:0];
        if ([v18 expressionType] != 4) {
          goto LABEL_51;
        }
        v19 = [v18 function];
        int v20 = [v19 isEqualToString:@"now"];

        if (!v20) {
          goto LABEL_51;
        }
        v21 = [v17 objectAtIndexedSubscript:1];
        if (![v21 expressionType])
        {
          v22 = [v21 constantValue];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0 && [v14 expressionType] == 3)
          {
            v24 = [v14 keyPath];
            if ([v24 isEqualToString:*MEMORY[0x1E4F2DF70]])
            {

              if (!v6) {
                goto LABEL_50;
              }
            }
            else
            {
              v47 = [v14 keyPath];
              int v49 = [v47 isEqualToString:*MEMORY[0x1E4F2DF78]];

              if (!v6 || !v49) {
                goto LABEL_50;
              }
            }
            v6[11] = 1;
            v6[10] = 1;
          }
        }
LABEL_50:

LABEL_51:
        goto LABEL_52;
      }
    }
    if ([v14 expressionType] == 4
      && ([v14 function],
          v25 = objc_claimAutoreleasedReturnValue(),
          int v26 = [v25 isEqualToString:@"now"],
          v25,
          v26))
    {
      if (v6)
      {
        uint64_t v27 = 8;
LABEL_46:
        v6[v27] = 1;
      }
    }
    else if ([v13 expressionType] == 4 {
           && ([v13 function],
    }
               v28 = objc_claimAutoreleasedReturnValue(),
               int v29 = [v28 isEqualToString:@"now"],
               v28,
               v29))
    {
      if ([v14 expressionType] == 3)
      {
        v30 = [v14 keyPath];
        if ([v30 isEqualToString:*MEMORY[0x1E4F2DF70]])
        {

          if (!v6) {
            goto LABEL_52;
          }
        }
        else
        {
          v45 = [v14 keyPath];
          int v46 = [v45 isEqualToString:*MEMORY[0x1E4F2DF78]];

          if (!v6 || !v46) {
            goto LABEL_52;
          }
        }
        uint64_t v27 = 10;
        goto LABEL_46;
      }
    }
    else
    {
      if ([v14 expressionType] != 3
        || ([v14 keyPath],
            v31 = objc_claimAutoreleasedReturnValue(),
            int v32 = [v31 isEqualToString:*MEMORY[0x1E4F2CDE8]],
            v31,
            !v32))
      {
        if ([v14 expressionType] == 3)
        {
          v33 = [v14 keyPath];
          int v34 = [v33 isEqualToString:*MEMORY[0x1E4F2DCA0]];

          if (v34)
          {
            v35 = [v8 rightExpression];

            if (![v35 expressionType])
            {
              v36 = [v35 constantValue];
              objc_opt_class();
              char v37 = objc_opt_isKindOfClass();

              if (v37)
              {
                v38 = [(HMDPredicateUtilities *)self home];
                uint64_t v39 = [v35 constantValue];
                v40 = +[HMDPresenceEventModel eventModelWithDictionary:v39 home:v38 eventTriggerUUID:0 message:0];
                v41 = [[HMDPresenceEvent alloc] initWithModel:v40 home:v38];
                v48 = (void *)v39;
                if (v6) {
                  v42 = (void *)*((void *)v6 + 2);
                }
                else {
                  v42 = 0;
                }
                id v43 = v42;
                v44 = [(HMDPresenceEvent *)v41 analyticsPresenceEventData];
                [v43 addObject:v44];
              }
            }
            v13 = v35;
          }
        }
        goto LABEL_52;
      }
      if (v6)
      {
        uint64_t v27 = 9;
        goto LABEL_46;
      }
    }
LABEL_52:

LABEL_53:
  }
}

- (id)generateAnalyticsData:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(HMDAnalyticsPredicateData);
  [(HMDPredicateUtilities *)self fillAnalyticsData:v5 forPredicate:v4];

  return v5;
}

- (BOOL)containsPresenceEvents:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v5 = objc_msgSend(v4, "subpredicates", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      char isKindOfClass = 0;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v5);
          }
          if (isKindOfClass) {
            char isKindOfClass = 1;
          }
          else {
            char isKindOfClass = [(HMDPredicateUtilities *)self containsPresenceEvents:*(void *)(*((void *)&v18 + 1) + 8 * i)];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }
    else
    {
      char isKindOfClass = 0;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v4;
      v12 = [v11 rightExpression];
      v13 = [v11 leftExpression];
      if ([v13 expressionType] == 3
        && ([v13 keyPath],
            v14 = objc_claimAutoreleasedReturnValue(),
            int v15 = [v14 isEqualToString:*MEMORY[0x1E4F2DCA0]],
            v14,
            v15)
        && ![v12 expressionType])
      {
        v17 = [v12 constantValue];
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
  }

  return isKindOfClass & 1;
}

- (id)rewritePredicate:(id)a3 forDaemon:(BOOL)a4 message:(id)a5
{
  BOOL v6 = a4;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v8;
    id v11 = [MEMORY[0x1E4F1CA48] array];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v36 = v10;
    v12 = [v10 subpredicates];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v39 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [(HMDPredicateUtilities *)self rewritePredicate:*(void *)(*((void *)&v38 + 1) + 8 * i) forDaemon:v6 message:v9];
          if (v17) {
            [v11 addObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v14);
    }

    if ([v11 count])
    {
      long long v18 = v36;
      id v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28BA0]), "initWithType:subpredicates:", objc_msgSend(v36, "compoundPredicateType"), v11);
    }
    else
    {
      id v19 = 0;
      long long v18 = v36;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v20 = v8;
      uint64_t v21 = [v20 predicateOperatorType];
      v22 = [v20 leftExpression];
      if ([v22 expressionType] == 3)
      {
        uint64_t v23 = [v22 keyPath];
        int v24 = [v23 isEqualToString:*MEMORY[0x1E4F2DCA0]];

        if (v24)
        {
          uint64_t v37 = v21;
          v25 = [v20 rightExpression];
          if (![v25 expressionType])
          {
            int v26 = [v25 constantValue];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              v28 = [(HMDPredicateUtilities *)self home];
              v35 = [v25 constantValue];
              int v34 = +[HMDPresenceEventModel eventModelWithDictionary:v35 home:v28 eventTriggerUUID:0 message:v9];
              int v29 = [[HMDPresenceEvent alloc] initWithModel:v34 home:v28];
              v30 = (void *)MEMORY[0x1E4F28C68];
              v31 = [(HMDPresenceEvent *)v29 createPresenceEventPayload:v6];
              int v32 = [v30 expressionForConstantValue:v31];

              id v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28B98]), "initWithLeftExpression:rightExpression:modifier:type:options:", v22, v32, objc_msgSend(v20, "comparisonPredicateModifier"), v37, objc_msgSend(v20, "options"));
              goto LABEL_24;
            }
          }
        }
      }
    }
    id v19 = v8;
  }
LABEL_24:

  return v19;
}

- (id)rewritePredicateForDaemon:(id)a3 message:(id)a4
{
  return [(HMDPredicateUtilities *)self rewritePredicate:a3 forDaemon:1 message:a4];
}

- (id)rewritePredicateForClient:(id)a3
{
  return [(HMDPredicateUtilities *)self rewritePredicate:a3 forDaemon:0 message:0];
}

- (id)dateTodayMatchingComponents:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a3;
  v5 = [v3 date];
  BOOL v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v7 = [v6 components:124 fromDate:v5];
  objc_msgSend(v7, "setHour:", objc_msgSend(v4, "hour"));
  uint64_t v8 = [v4 minute];

  [v7 setMinute:v8];
  id v9 = [v6 dateFromComponents:v7];

  return v9;
}

- (id)addDeltaToNow:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a3;
  v5 = [v3 date];
  BOOL v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v7 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  [v6 setTimeZone:v7];

  uint64_t v8 = [v6 dateByAddingComponents:v4 toDate:v5 options:0];

  return v8;
}

- (id)rewriteNowAdjustedForHomeTimeZone:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1C9D8];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  BOOL v6 = [MEMORY[0x1E4F1C9C8] date];
  id v7 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v7 setDateStyle:4];
  [v7 setTimeStyle:4];
  [v7 setTimeZone:v4];
  [v7 setDateFormat:@"HH"];
  uint64_t v8 = [v7 stringFromDate:v6];
  objc_msgSend(v5, "setHour:", (int)objc_msgSend(v8, "intValue"));

  [v7 setDateFormat:@"mm"];
  id v9 = [v7 stringFromDate:v6];
  objc_msgSend(v5, "setMinute:", (int)objc_msgSend(v9, "intValue"));

  [v5 setTimeZone:v4];
  id v10 = [MEMORY[0x1E4F28C68] expressionWithFormat:@"FUNCTION($THIS_OBJECT, 'dateTodayMatchingComponents:', %@)", v5];

  return v10;
}

- (id)_updatePredicate:(id)a3 staleCharacteristicInCurrentPredicate:(BOOL *)a4 accessory:(id)a5 conditionModified:(BOOL *)a6
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v22 = v10;
      uint64_t v23 = [v22 rightExpression];
      int v24 = [v22 leftExpression];
      if ([v24 expressionType] == 3
        && ([v24 keyPath],
            v25 = objc_claimAutoreleasedReturnValue(),
            int v26 = [v25 isEqualToString:*MEMORY[0x1E4F2CDE8]],
            v25,
            v26))
      {
        if (![v23 expressionType])
        {
          uint64_t v27 = [v23 constantValue];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            int v29 = [v23 constantValue];
            v48 = objc_msgSend(v29, "hmf_UUIDForKey:", @"kAccessoryUUID");
            v30 = objc_msgSend(v29, "hmf_numberForKey:", @"kServiceInstanceID");
            int v46 = HAPInstanceIDFromValue();

            v45 = v29;
            v31 = objc_msgSend(v29, "hmf_numberForKey:", @"kCharacteristicInstanceID");
            uint64_t v32 = HAPInstanceIDFromValue();

            v33 = [v11 uuid];
            v44 = (void *)v32;
            if ([v33 isEqual:v48])
            {
              int v34 = [v11 findCharacteristic:v32 forService:v46];

              if (!v34)
              {
                id v50 = v10;
                v35 = (void *)MEMORY[0x1D9452090]();
                v36 = self;
                uint64_t v37 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  long long v38 = v36;
                  v40 = long long v39 = v35;
                  *(_DWORD *)buf = 138543618;
                  v56 = v40;
                  __int16 v57 = 2112;
                  id v58 = v22;
                  _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_INFO, "%{public}@Removing predicate %@ because referenced characteristic no longer exists", buf, 0x16u);

                  v35 = v39;
                  v36 = v38;
                }

                *a4 = 1;
                *a6 = 1;

                id v10 = v50;
                goto LABEL_30;
              }
            }
            else
            {
            }
          }
        }
      }
      else if ([v24 expressionType] == 3)
      {
        long long v41 = [v24 keyPath];
        int v42 = [v41 isEqualToString:*MEMORY[0x1E4F2D058]];

        if (v42)
        {
          if (![v23 expressionType] && *a4)
          {
            *a4 = 0;
            *a6 = 1;
LABEL_30:

            id v21 = 0;
            goto LABEL_35;
          }
        }
      }
    }
    id v21 = v10;
    goto LABEL_35;
  }
  id v49 = v10;
  id v12 = v10;
  uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v47 = v12;
  uint64_t v14 = [v12 subpredicates];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v52 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = [(HMDPredicateUtilities *)self _updatePredicate:*(void *)(*((void *)&v51 + 1) + 8 * i) staleCharacteristicInCurrentPredicate:a4 accessory:v11 conditionModified:a6];
        if (v19) {
          [v13 addObject:v19];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v51 objects:v59 count:16];
    }
    while (v16);
  }

  if ([v13 count])
  {
    id v20 = v47;
    id v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28BA0]), "initWithType:subpredicates:", objc_msgSend(v47, "compoundPredicateType"), v13);
  }
  else
  {
    id v21 = 0;
    id v20 = v47;
  }

  id v10 = v49;
LABEL_35:

  return v21;
}

- (id)predicateWithoutStaleCharacteristicsFromPredicate:(id)a3 accessory:(id)a4 conditionModified:(BOOL *)a5
{
  char v7 = 0;
  id v5 = [(HMDPredicateUtilities *)self _updatePredicate:a3 staleCharacteristicInCurrentPredicate:&v7 accessory:a4 conditionModified:a5];
  return v5;
}

- (id)updatePredicate:(id)a3 removedUser:(id)a4 conditionModified:(BOOL *)a5
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HMDPredicateUtilities *)self home];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v50 = v8;
    long long v52 = v10;
    id v11 = v8;
    id v12 = [MEMORY[0x1E4F1CA48] array];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    uint64_t v13 = [v11 subpredicates];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v55 objects:v63 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v56 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = [(HMDPredicateUtilities *)self updatePredicate:*(void *)(*((void *)&v55 + 1) + 8 * i) removedUser:v9 conditionModified:a5];
          if (v18) {
            [v12 addObject:v18];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v55 objects:v63 count:16];
      }
      while (v15);
    }

    if ([v12 count]) {
      id v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28BA0]), "initWithType:subpredicates:", objc_msgSend(v11, "compoundPredicateType"), v12);
    }
    else {
      id v19 = 0;
    }
    id v10 = v52;

    id v8 = v50;
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_26:
    id v19 = v8;
    goto LABEL_27;
  }
  id v20 = v8;
  uint64_t v51 = [v20 predicateOperatorType];
  id v21 = [v20 leftExpression];
  if ([v21 expressionType] != 3
    || ([v21 keyPath],
        id v22 = objc_claimAutoreleasedReturnValue(),
        int v23 = [v22 isEqualToString:*MEMORY[0x1E4F2DCA0]],
        v22,
        !v23))
  {
LABEL_25:

    goto LABEL_26;
  }
  int v24 = [v20 rightExpression];
  if ([v24 expressionType]
    || ([v24 constantValue],
        id v49 = v24,
        v25 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v25,
        int v24 = v49,
        (isKindOfClass & 1) == 0))
  {

    goto LABEL_25;
  }
  v48 = [v49 constantValue];
  uint64_t v27 = (void *)MEMORY[0x1D9452090]();
  v28 = self;
  int v29 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v30 = long long v53 = v27;
    *(_DWORD *)buf = 138543618;
    uint64_t v60 = v30;
    __int16 v61 = 2112;
    v62 = v48;
    _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_INFO, "%{public}@presence event dictionary: %@", buf, 0x16u);

    uint64_t v27 = v53;
  }

  v31 = objc_msgSend(v48, "hmf_arrayForKey:", @"kPresenceEventUsers");
  uint64_t v32 = (void *)[v31 mutableCopy];

  v33 = [v9 uuid];
  int v34 = [v33 UUIDString];

  uint64_t v35 = [v32 indexOfObject:v34];
  v36 = v48;
  if (v35 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v19 = 0;
  }
  else
  {
    int v46 = v34;
    [v32 removeObjectAtIndex:v35];
    long long v38 = (void *)[v48 mutableCopy];
    v47 = v32;
    [v38 setObject:v32 forKey:@"kPresenceEventUsers"];
    v45 = v38;
    v44 = +[HMDPresenceEventModel eventModelWithDictionary:v38 home:v10 eventTriggerUUID:0 message:0];
    long long v54 = v10;
    long long v39 = [[HMDPresenceEvent alloc] initWithModel:v44 home:v10];
    long long v40 = (void *)MEMORY[0x1E4F28C68];
    long long v41 = v39;
    int v42 = [(HMDPresenceEvent *)v39 createPresenceEventPayload:1];
    uint64_t v43 = [v40 expressionForConstantValue:v42];

    id v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28B98]), "initWithLeftExpression:rightExpression:modifier:type:options:", v21, v43, objc_msgSend(v20, "comparisonPredicateModifier"), v51, objc_msgSend(v20, "options"));
    if (a5) {
      *a5 = 1;
    }

    id v10 = v54;
    uint64_t v32 = v47;
    v36 = v48;
    int v34 = v46;
  }

LABEL_27:
  return v19;
}

- (id)updatePredicate:(id)a3 currentCharacteristicInPredicate:(id *)a4 conditionModified:(BOOL *)a5 removedCharacteristic:(id)a6 underService:(id)a7 underAccessory:(id)a8
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v74 = a6;
  id v73 = a7;
  id v15 = a8;
  uint64_t v16 = [(HMDPredicateUtilities *)self home];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_53:
      id v26 = v14;
      goto LABEL_54;
    }
    id v27 = v14;
    v28 = [v27 rightExpression];
    int v29 = [v27 leftExpression];
    v68 = v28;
    if ([v29 expressionType] == 4)
    {
      v30 = [v29 function];
      if (![v30 isEqualToString:@"now"])
      {
LABEL_18:

        goto LABEL_19;
      }
      id v70 = v27;
      id v31 = v14;
      uint64_t v32 = [v16 homeLocationHandler];
      v33 = [v32 timeZone];

      if (v33)
      {
        v30 = [v16 homeLocationHandler];
        int v34 = [v30 timeZone];
        uint64_t v35 = [(HMDPredicateUtilities *)self rewriteNowAdjustedForHomeTimeZone:v34];

        int v29 = (void *)v35;
        id v14 = v31;
        v28 = v68;
        id v27 = v70;
        goto LABEL_18;
      }
      id v14 = v31;
      v28 = v68;
      id v27 = v70;
    }
LABEL_19:
    if ([v28 expressionType] == 4)
    {
      v36 = [v28 function];
      if ([v36 isEqualToString:@"now"])
      {
        id v71 = v27;
        id v37 = v14;
        long long v38 = [v16 homeLocationHandler];
        long long v39 = [v38 timeZone];

        if (!v39)
        {
          id v14 = v37;
          id v27 = v71;
          goto LABEL_24;
        }
        v36 = [v16 homeLocationHandler];
        long long v40 = [v36 timeZone];
        uint64_t v41 = [(HMDPredicateUtilities *)self rewriteNowAdjustedForHomeTimeZone:v40];

        v68 = (void *)v41;
        id v14 = v37;
        id v27 = v71;
      }
    }
LABEL_24:
    if ([v29 expressionType] != 3
      || ([v29 keyPath],
          int v42 = objc_claimAutoreleasedReturnValue(),
          int v43 = [v42 isEqualToString:*MEMORY[0x1E4F2CDE8]],
          v42,
          !v43))
    {
      if ([v29 expressionType] == 3)
      {
        long long v57 = [v29 keyPath];
        int v58 = [v57 isEqualToString:*MEMORY[0x1E4F2D058]];

        if (v58)
        {
          uint64_t v59 = [v68 expressionType];
          if (a4)
          {
            if (!v59 && *a4)
            {
              *a4 = 0;
              long long v56 = v68;
              if (a5) {
                *a5 = 1;
              }
              goto LABEL_46;
            }
          }
        }
      }
      goto LABEL_52;
    }
    if ([v68 expressionType]
      || ([v68 constantValue],
          v44 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v44,
          (isKindOfClass & 1) == 0))
    {
LABEL_52:

      goto LABEL_53;
    }
    int v46 = [v68 constantValue];
    v66 = objc_msgSend(v46, "hmf_UUIDForKey:", @"kAccessoryUUID");
    v47 = objc_msgSend(v46, "hmf_numberForKey:", @"kServiceInstanceID");
    v63 = HAPInstanceIDFromValue();

    v48 = objc_msgSend(v46, "hmf_numberForKey:", @"kCharacteristicInstanceID");
    uint64_t v64 = HAPInstanceIDFromValue();

    id v49 = [v15 uuid];
    if ([v66 isEqual:v49])
    {
      v62 = v46;
      id v50 = [v74 instanceID];
      if ([v64 isEqual:v50])
      {
        [v73 instanceID];
        uint64_t v51 = v72 = v14;
        int v61 = [v63 isEqual:v51];

        id v14 = v72;
        int v46 = v62;
        if (v61)
        {
          long long v52 = (void *)MEMORY[0x1D9452090]();
          long long v53 = self;
          long long v54 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
          {
            long long v55 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v80 = v55;
            __int16 v81 = 2112;
            id v82 = v74;
            _os_log_impl(&dword_1D49D5000, v54, OS_LOG_TYPE_INFO, "%{public}@Char %@ has been removed, and it has reference in the condition, updating the condition", buf, 0x16u);

            id v14 = v72;
          }

          int v46 = v62;
          if (a4)
          {
            *a4 = v74;
            if (a5) {
              *a5 = 1;
            }

            long long v56 = v68;
LABEL_46:

            id v26 = 0;
            goto LABEL_54;
          }
        }
        goto LABEL_51;
      }

      int v46 = v62;
    }

LABEL_51:
    goto LABEL_52;
  }
  v67 = v16;
  id v69 = v14;
  id v17 = v14;
  long long v18 = [MEMORY[0x1E4F1CA48] array];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  v65 = v17;
  id v19 = [v17 subpredicates];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v75 objects:v83 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v76;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v76 != v22) {
          objc_enumerationMutation(v19);
        }
        int v24 = [(HMDPredicateUtilities *)self updatePredicate:*(void *)(*((void *)&v75 + 1) + 8 * i) currentCharacteristicInPredicate:a4 conditionModified:a5 removedCharacteristic:v74 underService:v73 underAccessory:v15];
        if (v24) {
          [v18 addObject:v24];
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v75 objects:v83 count:16];
    }
    while (v21);
  }

  if ([v18 count])
  {
    v25 = v65;
    id v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28BA0]), "initWithType:subpredicates:", objc_msgSend(v65, "compoundPredicateType"), v18);
  }
  else
  {
    id v26 = 0;
    v25 = v65;
  }
  uint64_t v16 = v67;

  id v14 = v69;
LABEL_54:

  return v26;
}

- (id)comparePresence:(id)a3 operatorType:(id)a4 homePresence:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDPredicateUtilities *)self home];
  if (v11 && [v9 unsignedIntegerValue] == 4)
  {
    if (!v10)
    {
      id v12 = [(HMDPredicateUtilities *)self homePresenceProvider];
      ((void (**)(void, void *))v12)[2](v12, v11);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v13 = (void *)MEMORY[0x1D9452090]();
    id v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      int v20 = 138543874;
      uint64_t v21 = v16;
      __int16 v22 = 2112;
      id v23 = v10;
      __int16 v24 = 2112;
      id v25 = v8;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Checking whether the homePresence %@ agree with the presence events in condition: %@", (uint8_t *)&v20, 0x20u);
    }
    uint64_t v17 = [v8 evaluateWithHomePresence:v10];
  }
  else
  {
    uint64_t v17 = 0;
  }
  long long v18 = [NSNumber numberWithBool:v17];

  return v18;
}

- (id)compareValueOfCharacteristic:(id)a3 againstValue:(id)a4 operatorType:(id)a5
{
  return +[HMDCharacteristicEventBase compareValueOfCharacteristic:a3 againstValue:a4 operatorType:a5];
}

- (id)rewritePredicate:(id)a3 currentCharacteristicInPredicate:(id *)a4 characteristicsToRead:(id)a5 homePresence:(id)a6
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(HMDPredicateUtilities *)self home];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unint64_t v24 = 0x1E4F28000uLL;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v26 = v10;
    id v23 = v26;
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_63;
    }
    v95 = v13;
    uint64_t v90 = [v26 predicateOperatorType];
    id v27 = [v23 rightExpression];
    v28 = [v23 leftExpression];
    if ([v27 expressionType] == 4)
    {
      int v29 = [v27 function];
      int v30 = [v29 isEqualToString:@"add:to:"];

      if (v30)
      {
        id v31 = [v27 arguments];
        uint64_t v32 = [v31 objectAtIndexedSubscript:0];
        if ([v32 expressionType] != 4)
        {
LABEL_43:

          goto LABEL_60;
        }
        v33 = [v32 function];
        int v34 = [v33 isEqualToString:@"now"];

        if (!v34)
        {
          unint64_t v24 = 0x1E4F28000;
          goto LABEL_43;
        }
        uint64_t v35 = [v31 objectAtIndexedSubscript:1];
        if (![v35 expressionType])
        {
          [v35 constantValue];
          v36 = v86 = v35;
          objc_opt_class();
          char v37 = objc_opt_isKindOfClass();

          if ((v37 & 1) == 0)
          {
            unint64_t v24 = 0x1E4F28000;
            uint64_t v35 = v86;
            goto LABEL_22;
          }
          id v82 = (void *)MEMORY[0x1E4F28C68];
          uint64_t v35 = v86;
          long long v38 = [v86 constantValue];
          uint64_t v83 = [v82 expressionWithFormat:@"FUNCTION($THIS_OBJECT, 'addDeltaToNow:', %@)", v38];

          id v27 = (void *)v83;
        }
        unint64_t v24 = 0x1E4F28000;
LABEL_22:

        goto LABEL_43;
      }
    }
    if (![v27 expressionType])
    {
      long long v39 = [v27 constantValue];
      objc_opt_class();
      char v40 = objc_opt_isKindOfClass();

      if (v40)
      {
        uint64_t v41 = (void *)MEMORY[0x1E4F28C68];
        int v42 = [v27 constantValue];
        uint64_t v43 = [v41 expressionWithFormat:@"FUNCTION($THIS_OBJECT, 'dateTodayMatchingComponents:', %@)", v42];

        id v27 = (void *)v43;
        goto LABEL_59;
      }
    }
    if ([v28 expressionType] == 3)
    {
      v44 = [v28 keyPath];
      int v45 = [v44 isEqualToString:*MEMORY[0x1E4F2CDE8]];

      if (v45)
      {
        int v46 = [v23 rightExpression];

        unint64_t v24 = 0x1E4F28000;
        if ([v46 expressionType])
        {
          id v27 = v46;
LABEL_60:
          uint64_t v56 = v90;
          goto LABEL_61;
        }
        uint64_t v60 = [v46 constantValue];
        objc_opt_class();
        char v61 = objc_opt_isKindOfClass();

        if (v61)
        {
          v62 = [v46 constantValue];
          uint64_t v63 = objc_msgSend(v62, "hmf_UUIDForKey:", @"kAccessoryUUID");
          uint64_t v64 = objc_msgSend(v62, "hmf_numberForKey:", @"kServiceInstanceID");
          uint64_t v84 = HAPInstanceIDFromValue();

          v87 = v62;
          v65 = objc_msgSend(v62, "hmf_numberForKey:", @"kCharacteristicInstanceID");
          v66 = HAPInstanceIDFromValue();

          v92 = (void *)v63;
          v67 = [v95 accessoryWithUUID:v63];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v68 = v67;
          }
          else {
            v68 = 0;
          }
          id v69 = v68;

          if (v69)
          {
            __int16 v81 = v66;
            id v70 = [v69 findCharacteristic:v66 forService:v84];
            id v71 = v70;
            if (a4 && v70)
            {
              id v80 = v70;
              *a4 = v80;
              id v72 = [v11 objectForKey:v69];
              if (!v72)
              {
                id v72 = [MEMORY[0x1E4F1CA80] set];
                [v11 setObject:v72 forKey:v69];
              }
              [v72 addObject:v80];
            }
            v66 = v81;
          }

          uint64_t v50 = 0;
          goto LABEL_62;
        }
        id v27 = v46;
LABEL_59:
        unint64_t v24 = 0x1E4F28000uLL;
        goto LABEL_60;
      }
    }
    if ([v28 expressionType] == 3)
    {
      v47 = [v28 keyPath];
      int v48 = [v47 isEqualToString:*MEMORY[0x1E4F2D058]];

      if (v48)
      {
        int v46 = [v23 rightExpression];

        uint64_t v49 = [v46 expressionType];
        uint64_t v50 = 0;
        if (!a4 || v49) {
          goto LABEL_62;
        }
        id v91 = v10;
        id v51 = *a4;
        if (!*a4)
        {
          uint64_t v50 = 0;
          id v10 = v91;
          goto LABEL_62;
        }
        long long v52 = (void *)MEMORY[0x1E4F28C68];
        long long v53 = [v46 constantValue];
        long long v54 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v23, "predicateOperatorType"));
        uint64_t v55 = [v52 expressionWithFormat:@"FUNCTION($THIS_OBJECT, 'compareValueOfCharacteristic:againstValue:operatorType:', %@, %@, %@)", v51, v53, v54];

        id v27 = [MEMORY[0x1E4F28C68] expressionForConstantValue:MEMORY[0x1E4F1CC38]];

        *a4 = 0;
        uint64_t v56 = 4;
        v28 = (void *)v55;
        id v10 = v91;
        goto LABEL_68;
      }
    }
    if ([v28 expressionType] != 3) {
      goto LABEL_59;
    }
    long long v57 = [v28 keyPath];
    int v58 = [v57 isEqualToString:*MEMORY[0x1E4F2DCA0]];

    unint64_t v24 = 0x1E4F28000;
    uint64_t v56 = v90;
    if (v58)
    {
      uint64_t v59 = [v23 rightExpression];

      if (![v59 expressionType])
      {
        id v73 = [v59 constantValue];
        objc_opt_class();
        char v74 = objc_opt_isKindOfClass();

        if (v74)
        {
          v93 = [v59 constantValue];
          v88 = +[HMDPresenceEventModel eventModelWithDictionary:v93 home:v95 eventTriggerUUID:0 message:0];
          long long v75 = [[HMDPresenceEvent alloc] initWithModel:v88 home:v95];
          long long v76 = (void *)MEMORY[0x1E4F28C68];
          long long v77 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v23, "predicateOperatorType"));
          uint64_t v78 = [v76 expressionWithFormat:@"FUNCTION($THIS_OBJECT, 'comparePresence:operatorType:homePresence:', %@, %@, %@)", v75, v77, v12];

          id v27 = [MEMORY[0x1E4F28C68] expressionForConstantValue:MEMORY[0x1E4F1CC38]];

          v28 = (void *)v78;
          uint64_t v56 = 4;
        }
        else
        {
          id v27 = v59;
        }
LABEL_68:
        unint64_t v24 = 0x1E4F28000;
        goto LABEL_61;
      }
      id v27 = v59;
    }
LABEL_61:
    uint64_t v50 = objc_msgSend(objc_alloc(*(Class *)(v24 + 2968)), "initWithLeftExpression:rightExpression:modifier:type:options:", v28, v27, objc_msgSend(v23, "comparisonPredicateModifier"), v56, objc_msgSend(v23, "options"));
    int v46 = v27;
LABEL_62:

    id v23 = (void *)v50;
    uint64_t v13 = v95;
    goto LABEL_63;
  }
  id v89 = v10;
  v94 = v13;
  id v14 = v10;
  id v15 = [MEMORY[0x1E4F1CA48] array];
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  v85 = v14;
  uint64_t v16 = [v14 subpredicates];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v96 objects:v100 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v97;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v97 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = [(HMDPredicateUtilities *)self rewritePredicate:*(void *)(*((void *)&v96 + 1) + 8 * i) currentCharacteristicInPredicate:a4 characteristicsToRead:v11 homePresence:v12];
        if (v21) {
          [v15 addObject:v21];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v96 objects:v100 count:16];
    }
    while (v18);
  }

  if ([v15 count])
  {
    __int16 v22 = v85;
    id v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28BA0]), "initWithType:subpredicates:", objc_msgSend(v85, "compoundPredicateType"), v15);
    uint64_t v13 = v94;
  }
  else
  {
    id v23 = 0;
    uint64_t v13 = v94;
    __int16 v22 = v85;
  }

  id v10 = v89;
LABEL_63:

  return v23;
}

- (id)sunset
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDPredicateUtilities *)self home];
  id v4 = [v3 homeLocationHandler];
  id v5 = [v4 location];
  BOOL v6 = +[HMDLocation sunsetTimeForLocation:v5];

  char v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    id v11 = objc_msgSend(v6, "hmf_localTimeDescription");
    int v13 = 138543618;
    id v14 = v10;
    __int16 v15 = 2112;
    uint64_t v16 = v11;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Sunset time: %@", (uint8_t *)&v13, 0x16u);
  }
  return v6;
}

- (id)sunrise
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDPredicateUtilities *)self home];
  id v4 = [v3 homeLocationHandler];
  id v5 = [v4 location];
  BOOL v6 = +[HMDLocation sunriseTimeForLocation:v5];

  char v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    id v11 = objc_msgSend(v6, "hmf_localTimeDescription");
    int v13 = 138543618;
    id v14 = v10;
    __int16 v15 = 2112;
    uint64_t v16 = v11;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Sunrise time: %@", (uint8_t *)&v13, 0x16u);
  }
  return v6;
}

- (HMDPredicateUtilities)initWithHome:(id)a3 logIdentifier:(id)a4 homePresenceProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = v10;
    v23.receiver = self;
    v23.super_class = (Class)HMDPredicateUtilities;
    id v12 = [(HMDPredicateUtilities *)&v23 init];
    int v13 = v12;
    if (v12)
    {
      objc_storeWeak((id *)&v12->_home, v8);
      uint64_t v14 = [v9 copy];
      logIdentifier = v13->_logIdentifier;
      v13->_logIdentifier = (NSString *)v14;

      uint64_t v16 = _Block_copy(v11);
      id homePresenceProvider = v13->_homePresenceProvider;
      v13->_id homePresenceProvider = v16;
    }
    return v13;
  }
  else
  {
    uint64_t v19 = (HMDPredicateUtilities *)_HMFPreconditionFailure();
    return [(HMDPredicateUtilities *)v19 initWithHome:v21 logIdentifier:v22];
  }
}

- (HMDPredicateUtilities)initWithHome:(id)a3 logIdentifier:(id)a4
{
  return [(HMDPredicateUtilities *)self initWithHome:a3 logIdentifier:a4 homePresenceProvider:&__block_literal_global_134408];
}

id __52__HMDPredicateUtilities_initWithHome_logIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 presenceMonitor];
  v3 = [v2 currentHomePresence];

  return v3;
}

+ (id)unarchiveFromData:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  id v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  id v18 = 0;
  id v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v9 fromData:v6 error:&v18];
  id v11 = v18;
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v12 = v10;
  }
  else
  {
    int v13 = (void *)MEMORY[0x1D9452090]();
    id v14 = a1;
    __int16 v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      SEL v20 = v16;
      __int16 v21 = 2112;
      id v22 = v11;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive predicate: %@", buf, 0x16u);
    }
    id v12 = 0;
    if (a4) {
      *a4 = v11;
    }
  }

  return v12;
}

+ (id)filteredPredicate:(id)a3 withUserUUIDs:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    id v9 = [MEMORY[0x1E4F1CA48] array];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v10 = [v8 subpredicates];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      v36 = v8;
      id v39 = v6;
      char v13 = 0;
      uint64_t v14 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v44 != v14) {
            objc_enumerationMutation(v10);
          }
          uint64_t v16 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          uint64_t v17 = [a1 filteredPredicate:v16 withUserUUIDs:v7];
          if (v17) {
            [v9 addObject:v17];
          }
          v13 |= v17 != v16;
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v12);

      id v8 = v36;
      id v6 = v39;
      if (v13)
      {
        if (![v9 count])
        {
          id v34 = 0;
          goto LABEL_26;
        }
        id v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28BA0]), "initWithType:subpredicates:", objc_msgSend(v36, "compoundPredicateType"), v9);
LABEL_25:
        id v34 = v18;
LABEL_26:

        goto LABEL_33;
      }
    }
    else
    {
    }
    id v18 = v8;
    goto LABEL_25;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    id v9 = [v8 leftExpression];
    if ([v9 expressionType] == 3)
    {
      uint64_t v19 = [v9 keyPath];
      int v20 = [v19 isEqualToString:*MEMORY[0x1E4F2DCA0]];

      if (v20)
      {
        __int16 v21 = [v8 rightExpression];
        if (![v21 expressionType])
        {
          id v22 = [v21 constantValue];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            unint64_t v24 = [v21 constantValue];
            id v25 = objc_msgSend(v24, "hmf_arrayForKey:", @"kPresenceEventUsers");
            if ([v25 count])
            {
              v41[0] = MEMORY[0x1E4F143A8];
              v41[1] = 3221225472;
              v41[2] = __57__HMDPredicateUtilities_filteredPredicate_withUserUUIDs___block_invoke;
              v41[3] = &unk_1E6A11A48;
              id v42 = v7;
              id v26 = objc_msgSend(v25, "hmf_objectsPassingTest:", v41);
              unint64_t v27 = [v26 count];
              if (v27 < [v25 count])
              {
                if ([v26 count])
                {
                  char v40 = (void *)[v24 mutableCopy];
                  [v40 setObject:v26 forKeyedSubscript:@"kPresenceEventUsers"];
                  char v37 = (void *)MEMORY[0x1E4F28C68];
                  v28 = (void *)[v40 copy];
                  uint64_t v38 = [v37 expressionForConstantValue:v28];

                  id v29 = objc_alloc(MEMORY[0x1E4F28B98]);
                  uint64_t v30 = [v8 comparisonPredicateModifier];
                  uint64_t v31 = [v8 predicateOperatorType];
                  uint64_t v32 = [v8 options];
                  v33 = v29;
                  __int16 v21 = (void *)v38;
                  id v34 = (id)[v33 initWithLeftExpression:v9 rightExpression:v38 modifier:v30 type:v31 options:v32];
                }
                else
                {
                  id v34 = 0;
                }

                goto LABEL_26;
              }
            }
          }
        }
      }
    }
  }
  id v34 = v6;
LABEL_33:

  return v34;
}

uint64_t __57__HMDPredicateUtilities_filteredPredicate_withUserUUIDs___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = (objc_class *)MEMORY[0x1E4F29128];
  id v4 = a2;
  id v5 = (void *)[[v3 alloc] initWithUUIDString:v4];

  uint64_t v6 = [v2 containsObject:v5];
  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_134428 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_134428, &__block_literal_global_12_134429);
  }
  v2 = (void *)logCategory__hmf_once_v2_134430;
  return v2;
}

uint64_t __36__HMDPredicateUtilities_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v2_134430;
  logCategory__hmf_once_v2_134430 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)encodePredicate:(id)a3 error:(id *)a4
{
  if (a3)
  {
    id v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:a4];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

+ (id)decodePredicateFromData:(id)a3 error:(id *)a4
{
  if (a3)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28DC0];
    id v7 = a3;
    id v8 = [a1 predicateCodingClasses];
    id v9 = [v6 unarchivedObjectOfClasses:v8 fromData:v7 error:a4];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;
    }
    else if (a4)
    {
      [MEMORY[0x1E4F28C58] hmErrorWithCode:22];
      id v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

+ (NSSet)predicateCodingClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  return (NSSet *)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

@end