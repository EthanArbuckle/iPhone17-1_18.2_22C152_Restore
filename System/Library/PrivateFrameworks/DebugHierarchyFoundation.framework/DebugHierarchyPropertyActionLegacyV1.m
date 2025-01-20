@interface DebugHierarchyPropertyActionLegacyV1
- (id)_serializePropertyDescription:(id)a3;
- (void)performInContext:(id)a3 withObject:(id)a4;
@end

@implementation DebugHierarchyPropertyActionLegacyV1

- (void)performInContext:(id)a3 withObject:(id)a4
{
  id v26 = a3;
  id v6 = a4;
  if ([(DebugHierarchyPropertyAction *)self isTargetingObject:v6]
    && DBHIsInstanceOverridingNSObjectSelector(v6, (uint64_t)"debugHierarchyPropertyDescriptions"))
  {
    v27 = v6;
    v7 = [v6 debugHierarchyPropertyDescriptions];
    v29 = +[NSMutableArray array];
    v8 = [(DebugHierarchyPropertyAction *)self propertyNames];
    id v31 = [v8 count];

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v7;
    id v9 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (!v9) {
      goto LABEL_27;
    }
    uint64_t v30 = *(void *)v37;
    while (1)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v37 != v30) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(id *)(*((void *)&v36 + 1) + 8 * i);
        v12 = [v11 objectForKeyedSubscript:@"propertyName"];
        if (v31)
        {
          unsigned int v13 = [(DebugHierarchyPropertyAction *)self propertyNamesAreExclusive];
          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          v14 = [(DebugHierarchyPropertyAction *)self propertyNames];
          id v15 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v15)
          {
            uint64_t v16 = *(void *)v33;
LABEL_11:
            uint64_t v17 = 0;
            while (1)
            {
              if (*(void *)v33 != v16) {
                objc_enumerationMutation(v14);
              }
              if ([*(id *)(*((void *)&v32 + 1) + 8 * v17) isEqualToString:v12]) {
                break;
              }
              if (v15 == (id)++v17)
              {
                id v15 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
                if (v15) {
                  goto LABEL_11;
                }
                goto LABEL_17;
              }
            }
            unsigned __int8 v18 = [(DebugHierarchyPropertyAction *)self propertyNamesAreExclusive];

            if (v18) {
              goto LABEL_25;
            }
          }
          else
          {
LABEL_17:

            if (!v13) {
              goto LABEL_25;
            }
          }
        }
        v19 = [v11 objectForKeyedSubscript:@"propertyOptions"];
        id v20 = [v19 unsignedIntegerValue];

        if (DebugHierarchyBitMaskComparison((uint64_t)v20, [(DebugHierarchyPropertyAction *)self options], [(DebugHierarchyPropertyAction *)self optionsComparisonStyle])&& DBHIsInstanceOverridingNSObjectSelector(v27, (uint64_t)"debugHierarchyValueForPropertyWithName:"))
        {
          v21 = [v27 debugHierarchyValueForPropertyWithName:v12];
          if (v21)
          {
            id v22 = [v11 mutableCopy];
            [v22 setObject:v21 forKeyedSubscript:@"propertyValue"];
            id v23 = [v22 copy];

            id v11 = v23;
          }
        }
        v24 = [(DebugHierarchyPropertyActionLegacyV1 *)self _serializePropertyDescription:v11];
        [v29 addObject:v24];

LABEL_25:
      }
      id v9 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (!v9)
      {
LABEL_27:

        id v25 = [v29 copy];
        [v26 addProperties:v25 toObject:v27];

        id v6 = v27;
        break;
      }
    }
  }
}

- (id)_serializePropertyDescription:(id)a3
{
  id v3 = a3;
  id v4 = [v3 copy];
  id v17 = 0;
  v5 = DBGSerializePropertyDescriptionAsJSON(v4, &v17);
  id v6 = v17;

  if (v6)
  {
    uint64_t v7 = [v3 objectForKeyedSubscript:@"propertyName"];
    id v8 = (id)v7;
    id v9 = @"<nil>";
    if (v7) {
      id v9 = (__CFString *)v7;
    }
    v19[0] = &off_2DEF0;
    v18[0] = @"fetchStatus";
    v18[1] = @"errorDescription";
    v10 = v9;
    id v11 = [v6 description];
    v18[2] = @"propertyName";
    v19[1] = v11;
    v19[2] = v10;
    id v12 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
  }
  else
  {
    id v8 = [v5 mutableCopy];
    unsigned int v13 = [v5 objectForKeyedSubscript:@"propertyValue"];

    if (v13) {
      uint64_t v14 = 4;
    }
    else {
      uint64_t v14 = 1;
    }
    id v15 = +[NSNumber numberWithLong:v14];
    [v8 setObject:v15 forKeyedSubscript:@"fetchStatus"];

    id v12 = [v8 copy];
  }

  return v12;
}

@end