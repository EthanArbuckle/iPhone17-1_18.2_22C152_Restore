@interface HMPredicateUtilities
+ (BOOL)areOnlyHourAndMinuteSet:(id)a3;
+ (BOOL)containsPresenceEvents:(id)a3;
+ (BOOL)validatePredicate:(id)a3;
+ (id)audioAnalysisNotificationOptionsInPredicate:(id)a3;
+ (id)bitwiseAndValueWithKeyPath:(id)a3 inComparisonPredicate:(id)a4 validValues:(int64_t)a5;
+ (id)bitwiseAndValueWithKeyPath:(id)a3 inPredicate:(id)a4 validValues:(int64_t)a5;
+ (id)personFamiliarityOptionsInComparisonPredicate:(id)a3;
+ (id)rewritePredicateForClient:(id)a3 home:(id)a4;
+ (id)rewritePredicateForDaemon:(id)a3;
+ (id)rewritePredicateForDaemon:(id)a3 characteristicIsInvalid:(BOOL *)a4;
+ (id)significantEventTypesInComparisonPredicate:(id)a3;
@end

@implementation HMPredicateUtilities

+ (id)rewritePredicateForClient:(id)a3 home:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v44 = v5;
    id v7 = v5;
    v8 = [MEMORY[0x1E4F1CA48] array];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v9 = [v7 subpredicates];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v47 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = +[HMPredicateUtilities rewritePredicateForClient:*(void *)(*((void *)&v46 + 1) + 8 * i) home:v6];
          [v8 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v46 objects:v50 count:16];
      }
      while (v11);
    }

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28BA0]), "initWithType:subpredicates:", objc_msgSend(v7, "compoundPredicateType"), v8);
    id v5 = v44;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v17 = v5;
    v15 = v17;
    if (isKindOfClass)
    {
      v18 = [v17 leftExpression];
      v19 = [v15 rightExpression];
      if ([v18 expressionType] == 3)
      {
        v20 = [v18 keyPath];
        int v21 = [v20 isEqualToString:@"characteristic"];

        if (v21)
        {
          v22 = [v15 rightExpression];

          if (![v22 expressionType])
          {
            v23 = [v22 constantValue];
            objc_opt_class();
            char v24 = objc_opt_isKindOfClass();

            if (v24)
            {
              v25 = [v22 constantValue];
              v26 = objc_msgSend(v25, "hmf_UUIDForKey:", @"kAccessoryUUID");
              uint64_t v27 = objc_msgSend(v25, "hmf_numberForKey:", @"kServiceInstanceID");
              v28 = objc_msgSend(v25, "hmf_numberForKey:", @"kCharacteristicInstanceID");
              v45 = (void *)v27;
              v29 = [v6 _findCharacteristic:v28 forService:v27 accessoryUUID:v26];
              if (v29)
              {
                [MEMORY[0x1E4F28C68] expressionForConstantValue:v29];
                uint64_t v30 = v43 = v26;

                v22 = (void *)v30;
                v26 = v43;
              }
            }
          }
          v19 = v22;
        }
      }
      if (objc_msgSend(v18, "expressionType", v43) == 3)
      {
        v31 = [v18 keyPath];
        int v32 = [v31 isEqualToString:@"presence"];

        if (v32)
        {
          v33 = [v15 rightExpression];

          if (![v33 expressionType])
          {
            v34 = [v33 constantValue];
            objc_opt_class();
            char v35 = objc_opt_isKindOfClass();

            if (v35)
            {
              v36 = [v33 constantValue];
              v37 = +[HMPresenceEvent createWithDictionary:v36 home:v6];
              if (v37)
              {
                uint64_t v38 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v37];

                v33 = (void *)v38;
              }
            }
          }
          v19 = v33;
        }
      }
      id v39 = objc_alloc(MEMORY[0x1E4F28B98]);
      v40 = [v15 leftExpression];
      uint64_t v41 = objc_msgSend(v39, "initWithLeftExpression:rightExpression:modifier:type:options:", v40, v19, objc_msgSend(v15, "comparisonPredicateModifier"), objc_msgSend(v15, "predicateOperatorType"), objc_msgSend(v15, "options"));

      v15 = (void *)v41;
    }
  }

  return v15;
}

+ (id)bitwiseAndValueWithKeyPath:(id)a3 inComparisonPredicate:(id)a4 validValues:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v8 leftExpression];
  uint64_t v10 = [v8 rightExpression];
  uint64_t v11 = [v8 predicateOperatorType];

  if (v11 != 5) {
    goto LABEL_11;
  }
  if ([v10 expressionType]) {
    goto LABEL_11;
  }
  uint64_t v12 = [v10 constantValue];
  int v13 = [v12 isEqual:&unk_1EEF07A70];

  if (!v13 || [v9 expressionType] != 4) {
    goto LABEL_11;
  }
  v14 = [v9 function];
  if (![v14 isEqualToString:@"bitwiseAnd:with:"]) {
    goto LABEL_15;
  }
  v15 = [v9 arguments];
  uint64_t v16 = [v15 count];

  if (v16 != 2)
  {
LABEL_11:
    id v22 = 0;
    goto LABEL_12;
  }
  id v17 = [v9 arguments];
  v14 = [v17 objectAtIndexedSubscript:0];

  if ([v14 expressionType] == 3)
  {
    v18 = [v14 keyPath];
    int v19 = [v18 isEqualToString:v7];

    if (v19)
    {
      v20 = [v9 arguments];
      int v21 = [v20 objectAtIndexedSubscript:1];

      if ([v21 expressionType])
      {
        id v22 = 0;
      }
      else
      {
        char v24 = [v21 constantValue];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v25 = v24;
        }
        else {
          v25 = 0;
        }
        id v26 = v25;

        id v22 = 0;
        if (([v26 unsignedIntegerValue] & ~a5) == 0) {
          id v22 = v26;
        }
      }
      goto LABEL_16;
    }
  }
LABEL_15:
  id v22 = 0;
LABEL_16:

LABEL_12:

  return v22;
}

+ (id)bitwiseAndValueWithKeyPath:(id)a3 inPredicate:(id)a4 validValues:(int64_t)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = v10;
  uint64_t v12 = v11;
  if (v11)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    objc_msgSend(v11, "subpredicates", 0);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
LABEL_7:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = [a1 bitwiseAndValueWithKeyPath:v8 inPredicate:*(void *)(*((void *)&v23 + 1) + 8 * v17) validValues:a5];
        if (v18) {
          goto LABEL_19;
        }
        if (v15 == ++v17)
        {
          uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v15) {
            goto LABEL_7;
          }
          break;
        }
      }
    }
  }
  else
  {
    id v19 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v20 = v19;
    }
    else {
      v20 = 0;
    }
    id v13 = v20;

    if (v13)
    {
      uint64_t v18 = [a1 bitwiseAndValueWithKeyPath:v8 inComparisonPredicate:v13 validValues:a5];
LABEL_19:
      int v21 = (void *)v18;
      goto LABEL_21;
    }
  }
  int v21 = 0;
LABEL_21:

  return v21;
}

+ (id)audioAnalysisNotificationOptionsInPredicate:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() bitwiseAndValueWithKeyPath:@"audioAnalysisEventNotificationOptions" inPredicate:v3 validValues:-1];

  return v4;
}

+ (id)personFamiliarityOptionsInComparisonPredicate:(id)a3
{
  return (id)[a1 bitwiseAndValueWithKeyPath:@"personFamiliarityOptions" inComparisonPredicate:a3 validValues:7];
}

+ (id)significantEventTypesInComparisonPredicate:(id)a3
{
  return (id)[a1 bitwiseAndValueWithKeyPath:@"cameraSignificantEvent" inComparisonPredicate:a3 validValues:31];
}

+ (BOOL)containsPresenceEvents:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = objc_msgSend(v4, "subpredicates", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      char v8 = 0;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v5);
          }
          if (v8) {
            char v8 = 1;
          }
          else {
            char v8 = [a1 containsPresenceEvents:*(void *)(*((void *)&v14 + 1) + 8 * i)];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = [v4 leftExpression];
      if ([v11 expressionType] == 3)
      {
        uint64_t v12 = [v11 keyPath];
        char v8 = [v12 isEqualToString:@"presence"];
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

+ (id)rewritePredicateForDaemon:(id)a3 characteristicIsInvalid:(BOOL *)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    char v8 = [v6 subpredicates];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v47 objects:v53 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v48 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = +[HMPredicateUtilities rewritePredicateForDaemon:*(void *)(*((void *)&v47 + 1) + 8 * i) characteristicIsInvalid:a4];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v47 objects:v53 count:16];
      }
      while (v10);
    }

    if ([v7 count]) {
      long long v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28BA0]), "initWithType:subpredicates:", objc_msgSend(v6, "compoundPredicateType"), v7);
    }
    else {
      long long v14 = 0;
    }
    goto LABEL_37;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v16 = v5;
  long long v14 = v16;
  if ((isKindOfClass & 1) == 0) {
    goto LABEL_38;
  }
  uint64_t v7 = [v16 leftExpression];
  long long v17 = [v14 rightExpression];
  if ([v7 expressionType] == 3)
  {
    uint64_t v18 = [v7 keyPath];
    int v19 = [v18 isEqualToString:@"characteristic"];

    if (v19)
    {
      if (![v17 expressionType])
      {
        v20 = [v17 constantValue];
        objc_opt_class();
        char v21 = objc_opt_isKindOfClass();

        if (v21)
        {
          id v22 = [v17 constantValue];
          long long v23 = [v22 service];
          long long v24 = [v23 accessory];
          if (!v24
            || ([v23 accessoryUUID],
                long long v25 = objc_claimAutoreleasedReturnValue(),
                v25,
                !v22)
            || !v23
            || !v25)
          {
            if (a4) {
              *a4 = 1;
            }

            long long v14 = 0;
            goto LABEL_36;
          }
          v43 = (void *)MEMORY[0x1E4F28C68];
          v51[0] = @"kAccessoryUUID";
          long long v46 = [v23 accessoryUUID];
          v45 = [v46 UUIDString];
          v52[0] = v45;
          v51[1] = @"kServiceInstanceID";
          v42 = [v23 instanceID];
          v52[1] = v42;
          v51[2] = @"kCharacteristicInstanceID";
          long long v26 = [v22 instanceID];
          v52[2] = v26;
          uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:3];
          uint64_t v44 = [v43 expressionForConstantValue:v27];

          long long v17 = (void *)v44;
        }
      }
      goto LABEL_35;
    }
  }
  if ([v7 expressionType] != 3
    || ([v7 keyPath],
        uint64_t v28 = objc_claimAutoreleasedReturnValue(),
        int v29 = [v28 isEqualToString:@"characteristicValue"],
        v28,
        !v29))
  {
    if ([v7 expressionType] == 3)
    {
      v31 = [v7 keyPath];
      int v32 = [v31 isEqualToString:@"presence"];

      if (v32)
      {
        if (![v17 expressionType])
        {
          v33 = [v17 constantValue];
          objc_opt_class();
          char v34 = objc_opt_isKindOfClass();

          if (v34)
          {
            char v35 = [v17 constantValue];
            v36 = (void *)MEMORY[0x1E4F28C68];
            v37 = [v35 _serializeForAdd];
            uint64_t v38 = [v36 expressionForConstantValue:v37];

            long long v17 = (void *)v38;
          }
        }
      }
    }
    goto LABEL_35;
  }
  uint64_t v30 = [v17 expressionType];
  if (!a4 || v30 || !*a4)
  {
LABEL_35:
    id v39 = objc_alloc(MEMORY[0x1E4F28B98]);
    v40 = [v14 leftExpression];
    long long v14 = objc_msgSend(v39, "initWithLeftExpression:rightExpression:modifier:type:options:", v40, v17, objc_msgSend(v14, "comparisonPredicateModifier"), objc_msgSend(v14, "predicateOperatorType"), objc_msgSend(v14, "options"));

    goto LABEL_36;
  }
  long long v14 = 0;
  *a4 = 0;
LABEL_36:

LABEL_37:
LABEL_38:

  return v14;
}

+ (id)rewritePredicateForDaemon:(id)a3
{
  char v5 = 0;
  id v3 = [a1 rewritePredicateForDaemon:a3 characteristicIsInvalid:&v5];

  return v3;
}

+ (BOOL)areOnlyHourAndMinuteSet:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1C9D8];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setMinute:", objc_msgSend(v4, "minute"));
  objc_msgSend(v5, "setHour:", objc_msgSend(v4, "hour"));
  id v6 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v7 = objc_msgSend(v6, "hmf_dateComponents");

  objc_msgSend(v7, "setMinute:", objc_msgSend(v4, "minute"));
  objc_msgSend(v7, "setHour:", objc_msgSend(v4, "hour"));
  LODWORD(v6) = [v4 isEqual:v5];

  if (v6)
  {
    char v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    char v9 = [v7 isValidDateInCalendar:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

+ (BOOL)validatePredicate:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3) {
    goto LABEL_80;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_82;
    }
    id v10 = v3;
    uint64_t v11 = +[HMHAPMetadata getSharedInstance];
    uint64_t v12 = [v10 leftExpression];
    id v13 = [v10 rightExpression];
    if ([v12 expressionType] != 3 || objc_msgSend(v10, "comparisonPredicateModifier")) {
      goto LABEL_25;
    }
    id v14 = [v12 keyPath];
    if ([v14 isEqualToString:@"characteristic"])
    {
      uint64_t v15 = [v10 predicateOperatorType];

      if (v15 != 4) {
        goto LABEL_25;
      }
      if ([v13 expressionType]) {
        goto LABEL_25;
      }
      id v16 = [v13 constantValue];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_25;
      }
      uint64_t v18 = [v13 constantValue];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        int v19 = v18;
      }
      else {
        int v19 = 0;
      }
      id v14 = v19;

      v20 = [v14 characteristicType];
      if (([v11 shouldNotCacheCharacteristicOfType:v20] & 1) == 0)
      {
        v58 = [v14 properties];
        char v59 = [v58 containsObject:@"HMCharacteristicPropertyReadable"];

        if (v59) {
          goto LABEL_79;
        }
LABEL_26:
        id v21 = v10;
        id v22 = [v21 leftExpression];
        long long v23 = [v21 rightExpression];
        if ([v22 expressionType] == 3 && !objc_msgSend(v21, "comparisonPredicateModifier"))
        {
          long long v24 = [v22 keyPath];
          if ([v24 isEqualToString:@"characteristicValue"])
          {
            if (![v21 predicateOperatorType]
              || [v21 predicateOperatorType] == 1
              || [v21 predicateOperatorType] == 2
              || [v21 predicateOperatorType] == 3
              || [v21 predicateOperatorType] == 4)
            {
            }
            else
            {
              uint64_t v60 = [v21 predicateOperatorType];

              if (v60 != 5) {
                goto LABEL_40;
              }
            }
            if (![v23 expressionType]) {
              goto LABEL_71;
            }
          }
          else
          {
          }
        }
LABEL_40:

        id v25 = v21;
        id v22 = [v25 leftExpression];
        long long v23 = [v25 rightExpression];
        if ([v22 expressionType] == 3 && !objc_msgSend(v25, "comparisonPredicateModifier"))
        {
          v37 = [v22 keyPath];
          if ([v37 isEqualToString:@"sunrise"])
          {
          }
          else
          {
            uint64_t v38 = [v22 keyPath];
            int v39 = [v38 isEqualToString:@"sunset"];

            if (!v39) {
              goto LABEL_42;
            }
          }
          if ([v25 predicateOperatorType] == 2 || objc_msgSend(v25, "predicateOperatorType") == 1)
          {
            if ([v23 expressionType] == 4
              && ([v23 function],
                  v40 = objc_claimAutoreleasedReturnValue(),
                  int v41 = [v40 isEqualToString:@"add:to:"],
                  v40,
                  v41))
            {
              v42 = [v23 arguments];
              v43 = [v42 objectAtIndexedSubscript:0];
              if ([v43 expressionType] == 4)
              {
                uint64_t v44 = [v43 function];
                int v45 = [v44 isEqualToString:@"now"];

                if (v45)
                {
                  long long v46 = [v42 objectAtIndexedSubscript:1];
                  if ([v46 expressionType])
                  {
                  }
                  else
                  {
                    v61 = [v46 constantValue];
                    objc_opt_class();
                    char v63 = objc_opt_isKindOfClass();

                    if (v63)
                    {

                      goto LABEL_71;
                    }
                  }
                }
              }
            }
            else if ([v23 expressionType] == 4)
            {
              uint64_t v51 = [v23 function];
              char v52 = [v51 isEqualToString:@"now"];

              if (v52) {
                goto LABEL_71;
              }
            }
          }
        }
LABEL_42:

        id v21 = v25;
        id v22 = [v21 leftExpression];
        long long v23 = [v21 rightExpression];
        if ([v22 expressionType] != 3 || objc_msgSend(v21, "comparisonPredicateModifier")) {
          goto LABEL_76;
        }
        long long v26 = [v22 keyPath];
        if ([v26 isEqualToString:@"presence"])
        {
          uint64_t v27 = [v21 predicateOperatorType];

          if (v27 == 4)
          {
            if (![v23 expressionType])
            {
              uint64_t v28 = [v23 constantValue];
              objc_opt_class();
              char v29 = objc_opt_isKindOfClass();

              if (v29)
              {
                uint64_t v30 = [v23 constantValue];
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  v31 = v30;
                }
                else {
                  v31 = 0;
                }
                id v32 = v31;

                uint64_t v33 = [v32 presenceEventType];
                if ((unint64_t)(v33 - 3) >= 2)
                {
                  if ((unint64_t)(v33 - 1) > 1)
                  {
                    char v34 = (void *)MEMORY[0x19F3A64A0]();
                    char v35 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                    {
                      v36 = HMFGetLogIdentifier();
                      objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v32, "presenceEventType"));
                      *(_DWORD *)buf = 138543618;
                      v70 = v36;
                      v72 = __int16 v71 = 2112;
                      v62 = (void *)v72;
                      _os_log_impl(&dword_19D1A8000, v35, OS_LOG_TYPE_ERROR, "%{public}@Unsupported presence eventType: %@", buf, 0x16u);

                      goto LABEL_94;
                    }
                  }
                  else
                  {
                    char v34 = (void *)MEMORY[0x19F3A64A0]();
                    char v35 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
                    {
                      v36 = HMFGetLogIdentifier();
                      *(_DWORD *)buf = 138543362;
                      v70 = v36;
                      _os_log_impl(&dword_19D1A8000, v35, OS_LOG_TYPE_INFO, "%{public}@Every entry or exit is not supported in presence events in predicate", buf, 0xCu);
LABEL_94:
                    }
                  }

LABEL_76:

                  v53 = +[HMPredicateUtilities significantEventTypesInComparisonPredicate:v21];

                  if (v53) {
                    goto LABEL_79;
                  }
                  uint64_t v54 = +[HMPredicateUtilities personFamiliarityOptionsInComparisonPredicate:v21];

                  if (v54) {
                    goto LABEL_79;
                  }
                  v55 = +[HMPredicateUtilities audioAnalysisNotificationOptionsInPredicate:v21];

                  if (v55) {
                    goto LABEL_79;
                  }
                  BOOL valid = isValidTimeComparison(v21);

                  if (valid) {
                    goto LABEL_80;
                  }
LABEL_82:
                  BOOL v9 = 0;
                  goto LABEL_83;
                }

LABEL_71:
LABEL_79:

LABEL_80:
                BOOL v9 = 1;
                goto LABEL_83;
              }
            }
            long long v47 = (void *)MEMORY[0x19F3A64A0]();
            long long v48 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              long long v49 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v70 = v49;
              __int16 v71 = 2112;
              uint64_t v72 = (uint64_t)v21;
              long long v50 = "%{public}@Invalid presence right condition: %@";
              goto LABEL_74;
            }
            goto LABEL_75;
          }
        }
        else
        {
        }
        long long v47 = (void *)MEMORY[0x19F3A64A0]();
        long long v48 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          long long v49 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v70 = v49;
          __int16 v71 = 2112;
          uint64_t v72 = (uint64_t)v21;
          long long v50 = "%{public}@Invalid presence left condition: %@";
LABEL_74:
          _os_log_impl(&dword_19D1A8000, v48, OS_LOG_TYPE_ERROR, v50, buf, 0x16u);
        }
LABEL_75:

        goto LABEL_76;
      }
    }
LABEL_25:

    goto LABEL_26;
  }
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v4 = [v3 subpredicates];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v64 objects:v68 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v65;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v65 != v7) {
          objc_enumerationMutation(v4);
        }
        if (!+[HMPredicateUtilities validatePredicate:*(void *)(*((void *)&v64 + 1) + 8 * i)])
        {
          BOOL v9 = 0;
          goto LABEL_38;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v64 objects:v68 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_38:

LABEL_83:
  return v9;
}

@end