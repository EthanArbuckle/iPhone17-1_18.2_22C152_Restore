@interface NSMutableDictionary(MCUtilities)
- (void)MCDeepCopyEntriesFromDictionary:()MCUtilities;
- (void)MCDeepCopyMissingEntriesFromDictionary:()MCUtilities;
- (void)MCDeleteBoolRestriction:()MCUtilities;
- (void)MCFilterRestrictionPayloadKeys:()MCUtilities;
- (void)MCFixUpRestrictionsDictionaryForMDMReporting;
- (void)MCSanitizeRestrictions;
- (void)MCSetBoolRestriction:()MCUtilities value:;
- (void)MCSetIntersectionRestriction:()MCUtilities values:;
- (void)MCSetIntersectionSetting:()MCUtilities values:;
- (void)MCSetObjectIfNotNil:()MCUtilities forKey:;
- (void)MCSetUnionRestriction:()MCUtilities values:;
- (void)MCSetUnionSetting:()MCUtilities values:;
- (void)MCSetValueRestriction:()MCUtilities value:;
@end

@implementation NSMutableDictionary(MCUtilities)

- (void)MCDeepCopyEntriesFromDictionary:()MCUtilities
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v10 = [v4 objectForKey:v9];
        uint64_t v11 = [a1 objectForKey:v9];
        v12 = (void *)v11;
        if (v10) {
          BOOL v13 = v11 == 0;
        }
        else {
          BOOL v13 = 1;
        }
        if (!v13)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v12 MCDeepCopyEntriesFromDictionary:v10];
              goto LABEL_18;
            }
          }
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v14 = [v10 MCMutableDeepCopy];
        }
        else
        {
          if (!v10) {
            goto LABEL_18;
          }
          uint64_t v14 = [v10 copy];
        }
        v15 = (void *)v14;
        [a1 setObject:v14 forKey:v9];

LABEL_18:
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

- (void)MCDeepCopyMissingEntriesFromDictionary:()MCUtilities
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v10 = [a1 objectForKey:v9];
        uint64_t v11 = [v4 objectForKey:v9];
        if (v11) {
          BOOL v12 = v10 == 0;
        }
        else {
          BOOL v12 = 1;
        }
        if (v12)
        {
          if (v10) {
            goto LABEL_20;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v13 = [v11 MCMutableDeepCopy];
          }
          else
          {
            if (!v11) {
              goto LABEL_20;
            }
            uint64_t v13 = [v11 copy];
          }
          v15 = (void *)v13;
          [a1 setObject:v13 forKey:v9];
        }
        else
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          if (isKindOfClass)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v10 MCDeepCopyMissingEntriesFromDictionary:v11];
            }
          }
        }
LABEL_20:
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

- (void)MCSetObjectIfNotNil:()MCUtilities forKey:
{
  if (a3) {
    return objc_msgSend(a1, "setObject:forKey:");
  }
  return a1;
}

- (void)MCSetBoolRestriction:()MCUtilities value:
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = +[MCRestrictionManager sharedManager];
  v8 = [v7 defaultRestrictions];

  uint64_t v9 = [v8 objectForKeyedSubscript:@"restrictedBool"];
  v10 = [v9 objectForKeyedSubscript:v6];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"preference"];

  if (!v11)
  {
    long long v16 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *MEMORY[0x1E4F1C3C8];
    long long v18 = [NSString stringWithFormat:@"%@ is not a BOOL restriction.", v6];
    id v19 = [v16 exceptionWithName:v17 reason:v18 userInfo:0];

    objc_exception_throw(v19);
  }
  BOOL v12 = [a1 objectForKeyedSubscript:@"restrictedBool"];
  uint64_t v13 = (void *)[v12 mutableCopy];

  if (!v13)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  v20[0] = @"preference";
  v20[1] = @"value";
  v21[0] = v11;
  uint64_t v14 = [MEMORY[0x1E4F28ED0] numberWithBool:a4];
  v21[1] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  [v13 setObject:v15 forKeyedSubscript:v6];

  [a1 setObject:v13 forKeyedSubscript:@"restrictedBool"];
}

- (void)MCDeleteBoolRestriction:()MCUtilities
{
  id v6 = a3;
  id v4 = [a1 objectForKeyedSubscript:@"restrictedBool"];
  uint64_t v5 = (void *)[v4 mutableCopy];

  if (v5)
  {
    [v5 removeObjectForKey:v6];
    [a1 setObject:v5 forKeyedSubscript:@"restrictedBool"];
  }
}

- (void)MCSetValueRestriction:()MCUtilities value:
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = +[MCRestrictionManager sharedManager];
    uint64_t v9 = [v8 defaultRestrictions];

    v10 = [v9 objectForKeyedSubscript:@"restrictedValue"];
    uint64_t v11 = [v10 objectForKeyedSubscript:v6];
    BOOL v12 = [v11 objectForKeyedSubscript:@"preferSmallerValues"];

    if (!v12)
    {
      long long v18 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v19 = *MEMORY[0x1E4F1C3C8];
      v20 = [NSString stringWithFormat:@"%@ is not a value restriction.", v6];
      id v21 = [v18 exceptionWithName:v19 reason:v20 userInfo:0];

      objc_exception_throw(v21);
    }
    uint64_t v13 = [a1 objectForKeyedSubscript:@"restrictedValue"];
    uint64_t v14 = (void *)[v13 mutableCopy];

    if (!v14)
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    v22[0] = @"preferSmallerValues";
    v22[1] = @"value";
    v23[0] = v12;
    v23[1] = v7;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
    [v14 setObject:v15 forKeyedSubscript:v6];

    [a1 setObject:v14 forKeyedSubscript:@"restrictedValue"];
  }
  else
  {
    long long v16 = [a1 objectForKeyedSubscript:@"restrictedValue"];
    uint64_t v17 = (void *)[v16 mutableCopy];

    if (v17)
    {
      [v17 removeObjectForKey:v6];
      [a1 setObject:v17 forKeyedSubscript:@"restrictedValue"];
    }
  }
}

- (void)MCSetIntersectionRestriction:()MCUtilities values:
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = +[MCRestrictionManager sharedManager];
    uint64_t v9 = [v8 defaultRestrictions];

    v10 = [v9 objectForKeyedSubscript:@"intersection"];
    uint64_t v11 = [v10 objectForKeyedSubscript:v6];

    if (!v11)
    {
      uint64_t v17 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v18 = *MEMORY[0x1E4F1C3C8];
      uint64_t v19 = [NSString stringWithFormat:@"%@ is not an intersection restriction.", v6];
      id v20 = [v17 exceptionWithName:v18 reason:v19 userInfo:0];

      objc_exception_throw(v20);
    }
    BOOL v12 = [a1 objectForKeyedSubscript:@"intersection"];
    uint64_t v13 = (void *)[v12 mutableCopy];

    if (!v13)
    {
      uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    id v21 = @"values";
    v22[0] = v7;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    [v13 setObject:v14 forKeyedSubscript:v6];

    [a1 setObject:v13 forKeyedSubscript:@"intersection"];
  }
  else
  {
    v15 = [a1 objectForKeyedSubscript:@"intersection"];
    long long v16 = (void *)[v15 mutableCopy];

    if (v16)
    {
      [v16 removeObjectForKey:v6];
      [a1 setObject:v16 forKeyedSubscript:@"intersection"];
    }
  }
}

- (void)MCSetUnionRestriction:()MCUtilities values:
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = +[MCRestrictionManager sharedManager];
    uint64_t v9 = [v8 defaultRestrictions];

    v10 = [v9 objectForKeyedSubscript:@"union"];
    uint64_t v11 = [v10 objectForKeyedSubscript:v6];

    if (!v11)
    {
      uint64_t v17 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v18 = *MEMORY[0x1E4F1C3C8];
      uint64_t v19 = [NSString stringWithFormat:@"%@ is not an union restriction.", v6];
      id v20 = [v17 exceptionWithName:v18 reason:v19 userInfo:0];

      objc_exception_throw(v20);
    }
    BOOL v12 = [a1 objectForKeyedSubscript:@"union"];
    uint64_t v13 = (void *)[v12 mutableCopy];

    if (!v13)
    {
      uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    id v21 = @"values";
    v22[0] = v7;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    [v13 setObject:v14 forKeyedSubscript:v6];

    [a1 setObject:v13 forKeyedSubscript:@"union"];
  }
  else
  {
    v15 = [a1 objectForKeyedSubscript:@"union"];
    long long v16 = (void *)[v15 mutableCopy];

    if (v16)
    {
      [v16 removeObjectForKey:v6];
      [a1 setObject:v16 forKeyedSubscript:@"union"];
    }
  }
}

- (void)MCSetIntersectionSetting:()MCUtilities values:
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = +[MCRestrictionManager sharedManager];
    uint64_t v9 = [v8 defaultSettings];

    v10 = [v9 objectForKeyedSubscript:@"intersection"];
    uint64_t v11 = [v10 objectForKeyedSubscript:v6];

    if (!v11)
    {
      uint64_t v17 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v18 = *MEMORY[0x1E4F1C3C8];
      uint64_t v19 = [NSString stringWithFormat:@"%@ is not an intersection setting.", v6];
      id v20 = [v17 exceptionWithName:v18 reason:v19 userInfo:0];

      objc_exception_throw(v20);
    }
    BOOL v12 = [a1 objectForKeyedSubscript:@"intersection"];
    uint64_t v13 = (void *)[v12 mutableCopy];

    if (!v13)
    {
      uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    id v21 = @"values";
    v22[0] = v7;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    [v13 setObject:v14 forKeyedSubscript:v6];

    [a1 setObject:v13 forKeyedSubscript:@"intersection"];
  }
  else
  {
    v15 = [a1 objectForKeyedSubscript:@"intersection"];
    long long v16 = (void *)[v15 mutableCopy];

    if (v16)
    {
      [v16 removeObjectForKey:v6];
      [a1 setObject:v16 forKeyedSubscript:@"intersection"];
    }
  }
}

- (void)MCSetUnionSetting:()MCUtilities values:
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = +[MCRestrictionManager sharedManager];
    uint64_t v9 = [v8 defaultSettings];

    v10 = [v9 objectForKeyedSubscript:@"union"];
    uint64_t v11 = [v10 objectForKeyedSubscript:v6];

    if (!v11)
    {
      uint64_t v17 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v18 = *MEMORY[0x1E4F1C3C8];
      uint64_t v19 = [NSString stringWithFormat:@"%@ is not an union setting.", v6];
      id v20 = [v17 exceptionWithName:v18 reason:v19 userInfo:0];

      objc_exception_throw(v20);
    }
    BOOL v12 = [a1 objectForKeyedSubscript:@"union"];
    uint64_t v13 = (void *)[v12 mutableCopy];

    if (!v13)
    {
      uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    id v21 = @"values";
    v22[0] = v7;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    [v13 setObject:v14 forKeyedSubscript:v6];

    [a1 setObject:v13 forKeyedSubscript:@"union"];
  }
  else
  {
    v15 = [a1 objectForKeyedSubscript:@"union"];
    long long v16 = (void *)[v15 mutableCopy];

    if (v16)
    {
      [v16 removeObjectForKey:v6];
      [a1 setObject:v16 forKeyedSubscript:@"union"];
    }
  }
}

- (void)MCFilterRestrictionPayloadKeys:()MCUtilities
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __67__NSMutableDictionary_MCUtilities__MCFilterRestrictionPayloadKeys___block_invoke;
    v7[3] = &unk_1E5A659E8;
    v7[4] = a1;
    id v8 = v4;
    id v6 = (void (**)(void, void))MEMORY[0x1A6232FE0](v7);
    ((void (**)(void, __CFString *))v6)[2](v6, @"restrictedBool");
    ((void (**)(void, __CFString *))v6)[2](v6, @"restrictedValue");
    ((void (**)(void, __CFString *))v6)[2](v6, @"intersection");
    ((void (**)(void, __CFString *))v6)[2](v6, @"union");
  }
}

- (void)MCFixUpRestrictionsDictionaryForMDMReporting
{
  v1 = a1;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v2 = [a1 objectForKey:@"restrictedValue"];
  v3 = v2;
  if (v2)
  {
    id v4 = (void *)[v2 mutableCopy];
    uint64_t v5 = [v4 objectForKey:@"maxGracePeriod"];
    id v6 = v5;
    if (v5)
    {
      id v7 = (void *)[v5 mutableCopy];
      id v8 = [v7 valueForKey:@"value"];
      uint64_t v9 = v8;
      if (v8)
      {
        v10 = v1;
        uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLong:", objc_msgSend(v8, "longValue") / 60);
        [v7 setObject:v11 forKey:@"value"];

        v1 = v10;
      }
      [v4 setObject:v7 forKey:@"maxGracePeriod"];
    }
    BOOL v12 = [v4 objectForKey:@"maxInactivity"];
    uint64_t v13 = v12;
    if (v12)
    {
      uint64_t v14 = (void *)[v12 mutableCopy];
      v15 = [v14 valueForKey:@"value"];
      long long v16 = v15;
      if (v15)
      {
        uint64_t v17 = v1;
        uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLong:", objc_msgSend(v15, "longValue") / 60);
        [v14 setObject:v18 forKey:@"value"];

        v1 = v17;
      }
      [v4 setObject:v14 forKey:@"maxInactivity"];
    }
    [v1 setObject:v4 forKey:@"restrictedValue"];
  }
  uint64_t v19 = [v1 objectForKey:@"intersection"];
  if (v19)
  {
    id v34 = v19;
    v35 = v1;
    v36 = v3;
    id v20 = (void *)[v19 mutableCopy];
    +[MCRestrictionUtilities intersectionFeaturesWithPayloadRestictionKeyAlias];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v45;
      uint64_t v37 = *(void *)v45;
      do
      {
        uint64_t v24 = 0;
        uint64_t v38 = v22;
        do
        {
          if (*(void *)v45 != v23) {
            objc_enumerationMutation(obj);
          }
          uint64_t v25 = *(void *)(*((void *)&v44 + 1) + 8 * v24);
          v26 = +[MCRestrictionUtilities intersectionPayloadRestrictionKeysForFeature:v25];
          v27 = [v20 objectForKey:v25];
          if (v27) {
            BOOL v28 = v26 == 0;
          }
          else {
            BOOL v28 = 1;
          }
          if (!v28)
          {
            long long v42 = 0u;
            long long v43 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            id v29 = v26;
            uint64_t v30 = [v29 countByEnumeratingWithState:&v40 objects:v48 count:16];
            if (v30)
            {
              uint64_t v31 = v30;
              uint64_t v32 = *(void *)v41;
              do
              {
                for (uint64_t i = 0; i != v31; ++i)
                {
                  if (*(void *)v41 != v32) {
                    objc_enumerationMutation(v29);
                  }
                  [v20 setObject:v27 forKey:*(void *)(*((void *)&v40 + 1) + 8 * i)];
                }
                uint64_t v31 = [v29 countByEnumeratingWithState:&v40 objects:v48 count:16];
              }
              while (v31);
            }

            [v20 removeObjectForKey:v25];
            uint64_t v23 = v37;
            uint64_t v22 = v38;
          }

          ++v24;
        }
        while (v24 != v22);
        uint64_t v22 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v22);
    }

    [v35 setObject:v20 forKey:@"intersection"];
    v3 = v36;
    uint64_t v19 = v34;
  }
}

- (void)MCSanitizeRestrictions
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  v2 = +[MCRestrictionManager sharedManager];
  v3 = [v2 defaultRestrictions];

  id v4 = [a1 objectForKeyedSubscript:@"restrictedBool"];
  uint64_t v5 = (void *)[v4 mutableCopy];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v56 objects:v63 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v57 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v56 + 1) + 8 * i);
        if (([a1 MCValidateBoolRestriction:v11 inRestrictions:v6 defaultRestrictions:v3] & 1) == 0) {
          [v5 setObject:0 forKeyedSubscript:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v56 objects:v63 count:16];
    }
    while (v8);
  }
  long long v42 = v6;

  BOOL v12 = (void *)[v5 copy];
  [a1 setObject:v12 forKeyedSubscript:@"restrictedBool"];

  uint64_t v13 = [a1 objectForKeyedSubscript:@"restrictedValue"];
  uint64_t v14 = (void *)[v13 mutableCopy];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v15 = v13;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v52 objects:v62 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v53;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v53 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v52 + 1) + 8 * j);
        if (([a1 MCValidateValueRestriction:v20 inRestrictions:v15 defaultRestrictions:v3] & 1) == 0) {
          [v14 setObject:0 forKeyedSubscript:v20];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v52 objects:v62 count:16];
    }
    while (v17);
  }
  long long v43 = v5;

  long long v41 = v14;
  uint64_t v21 = (void *)[v14 copy];
  [a1 setObject:v21 forKeyedSubscript:@"restrictedValue"];

  uint64_t v22 = [a1 objectForKeyedSubscript:@"intersection"];
  uint64_t v23 = (void *)[v22 mutableCopy];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v24 = v22;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v48 objects:v61 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v49;
    do
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        if (*(void *)v49 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v48 + 1) + 8 * k);
        if (([a1 MCValidateIntersectionRestriction:v29 inRestrictions:v24 defaultRestrictions:v3] & 1) == 0) {
          [v23 setObject:0 forKeyedSubscript:v29];
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v48 objects:v61 count:16];
    }
    while (v26);
  }

  long long v40 = v23;
  uint64_t v30 = (void *)[v23 copy];
  [a1 setObject:v30 forKeyedSubscript:@"intersection"];

  uint64_t v31 = objc_msgSend(a1, "objectForKeyedSubscript:");
  uint64_t v32 = (void *)[v31 mutableCopy];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v33 = v31;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v44 objects:v60 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v45;
    do
    {
      for (uint64_t m = 0; m != v35; ++m)
      {
        if (*(void *)v45 != v36) {
          objc_enumerationMutation(v33);
        }
        uint64_t v38 = *(void *)(*((void *)&v44 + 1) + 8 * m);
        if (([a1 MCValidateUnionRestriction:v38 inRestrictions:v33 defaultRestrictions:v3] & 1) == 0) {
          [v32 setObject:0 forKeyedSubscript:v38];
        }
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v44 objects:v60 count:16];
    }
    while (v35);
  }

  v39 = (void *)[v32 copy];
  [a1 setObject:v39 forKeyedSubscript:@"union"];
}

@end