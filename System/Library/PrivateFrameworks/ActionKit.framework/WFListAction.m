@interface WFListAction
- (id)inheritedOutputContentClassesInWorkflow:(id)a3 context:(id)a4;
- (id)outputContentClasses;
- (void)runWithInput:(id)a3 error:(id *)a4;
@end

@implementation WFListAction

- (id)outputContentClasses
{
  v3 = [(WFListAction *)self workflow];

  if (v3)
  {
    v4 = [(WFListAction *)self workflow];
    v5 = [(WFListAction *)self inheritedOutputContentClassesInWorkflow:v4];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)WFListAction;
    v5 = [(WFListAction *)&v7 outputContentClasses];
  }
  return v5;
}

- (id)inheritedOutputContentClassesInWorkflow:(id)a3 context:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if ([v5 containsObject:self])
  {
    v6 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    id v26 = v5;
    [v5 addObject:self];
    objc_super v7 = objc_opt_new();
    [(WFListAction *)self parameterStateForKey:@"WFItems"];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v25 = long long v30 = 0u;
    v8 = [v25 values];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v27 + 1) + 8 * i) state];
          uint64_t v14 = objc_opt_class();
          id v15 = v13;
          if (v15 && (objc_opt_isKindOfClass() & 1) == 0)
          {
            v17 = getWFGeneralLogObject();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
            {
              v18 = objc_opt_class();
              *(_DWORD *)buf = 136315906;
              v33 = "WFEnforceClass";
              __int16 v34 = 2114;
              id v35 = v15;
              __int16 v36 = 2114;
              v37 = v18;
              __int16 v38 = 2114;
              uint64_t v39 = v14;
              id v19 = v18;
              _os_log_impl(&dword_23C364000, v17, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);
            }
            id v16 = 0;
          }
          else
          {
            id v16 = v15;
          }

          v20 = [v16 variableString];
          if ([v20 representsSingleContentVariable])
          {
            v21 = [v20 variables];
            v22 = [v21 firstObject];

            v23 = [v22 possibleAggrandizedContentClassesWithContext:v26];
            [v7 unionOrderedSet:v23];
          }
          else
          {
            [v7 addObject:objc_opt_class()];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v10);
    }

    v6 = [v7 array];

    id v5 = v26;
  }

  return v6;
}

- (void)runWithInput:(id)a3 error:(id *)a4
{
  id v5 = [(WFListAction *)self parameterValueForKey:@"WFItems" ofClass:objc_opt_class()];
  [(WFListAction *)self setOutput:v5];
}

@end