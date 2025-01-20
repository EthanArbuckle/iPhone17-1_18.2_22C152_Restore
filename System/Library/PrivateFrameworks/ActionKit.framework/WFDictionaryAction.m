@interface WFDictionaryAction
- (BOOL)hasReplacedArrayOrDictionaryWithVariable;
- (BOOL)hasReplacedArrayOrDictionaryWithVariableInState:(id)a3;
- (id)minimumSupportedClientVersion;
- (void)runWithInput:(id)a3 error:(id *)a4;
@end

@implementation WFDictionaryAction

- (BOOL)hasReplacedArrayOrDictionaryWithVariableInState:(id)a3
{
  v3 = [MEMORY[0x263EFF980] arrayWithObject:a3];
  if ([v3 count])
  {
    while (1)
    {
      v4 = [v3 lastObject];
      [v3 removeLastObject];
      v5 = [v4 variable];

      if (v5) {
        break;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = [v4 values];
        v7 = objc_msgSend(v6, "if_compactMap:", &__block_literal_global_33482);
        [v3 addObjectsFromArray:v7];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v8 = [v4 keyValuePairs];
        v9 = objc_msgSend(v8, "if_compactMap:", &__block_literal_global_178);
        [v3 addObjectsFromArray:v9];
      }
      if (![v3 count]) {
        goto LABEL_8;
      }
    }

    BOOL v10 = 1;
  }
  else
  {
LABEL_8:
    BOOL v10 = 0;
  }

  return v10;
}

id __70__WFDictionaryAction_hasReplacedArrayOrDictionaryWithVariableInState___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 value];
  v3 = [v2 state];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

id __70__WFDictionaryAction_hasReplacedArrayOrDictionaryWithVariableInState___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 state];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)hasReplacedArrayOrDictionaryWithVariable
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  [(WFDictionaryAction *)self parameterStateForKey:@"WFItems"];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v21 = long long v27 = 0u;
  v2 = [v21 keyValuePairs];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    BOOL v5 = 0;
    uint64_t v6 = *(void *)v25;
    unint64_t v7 = 0x263F86000uLL;
    while (1)
    {
      uint64_t v8 = 0;
      uint64_t v22 = v4;
      do
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(v2);
        }
        if (v5)
        {
          BOOL v5 = 1;
          goto LABEL_13;
        }
        v9 = *(void **)(*((void *)&v24 + 1) + 8 * v8);
        BOOL v10 = [v9 value];
        v11 = [v10 state];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {

LABEL_11:
          v18 = [v9 value];
          v19 = [v18 state];
          BOOL v5 = [(WFDictionaryAction *)self hasReplacedArrayOrDictionaryWithVariableInState:v19];

          goto LABEL_13;
        }
        [v9 value];
        uint64_t v12 = v6;
        v13 = v2;
        v15 = unint64_t v14 = v7;
        v16 = [v15 state];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        unint64_t v7 = v14;
        v2 = v13;
        uint64_t v6 = v12;
        uint64_t v4 = v22;

        if (isKindOfClass) {
          goto LABEL_11;
        }
        BOOL v5 = 0;
LABEL_13:
        ++v8;
      }
      while (v4 != v8);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (!v4) {
        goto LABEL_17;
      }
    }
  }
  BOOL v5 = 0;
LABEL_17:

  return v5;
}

- (id)minimumSupportedClientVersion
{
  if ([(WFDictionaryAction *)self hasReplacedArrayOrDictionaryWithVariable])
  {
    v7.receiver = self;
    v7.super_class = (Class)WFDictionaryAction;
    uint64_t v3 = [(WFDictionaryAction *)&v7 minimumSupportedClientVersion];
    uint64_t v4 = WFMaximumBundleVersion();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WFDictionaryAction;
    uint64_t v4 = [(WFDictionaryAction *)&v6 minimumSupportedClientVersion];
  }
  return v4;
}

- (void)runWithInput:(id)a3 error:(id *)a4
{
  id v6 = [(WFDictionaryAction *)self parameterValueForKey:@"WFItems" ofClass:objc_opt_class()];
  if (v6)
  {
    BOOL v5 = [(WFDictionaryAction *)self output];
    [v5 addObject:v6];
  }
}

@end