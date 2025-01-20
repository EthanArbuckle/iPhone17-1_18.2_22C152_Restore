@interface WFSetDictionaryValueAction
- (void)finishWithInput:(id)a3 key:(id)a4 value:(id)a5;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFSetDictionaryValueAction

- (void)finishWithInput:(id)a3 key:(id)a4 value:(id)a5
{
  v29[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v9 length])
  {
    v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F870B8];
    v28[0] = *MEMORY[0x263F08338];
    v13 = WFLocalizedString(@"No Key Provided");
    v29[0] = v13;
    v28[1] = *MEMORY[0x263F08320];
    v14 = NSString;
    v15 = WFLocalizedString(@"No key was provided to the Set Dictionary Value action for the value “%@”.");
    v16 = objc_msgSend(v14, "stringWithFormat:", v15, v10);
    v29[1] = v16;
    v17 = NSDictionary;
    v18 = v29;
    v19 = v28;
LABEL_6:
    v21 = [v17 dictionaryWithObjects:v18 forKeys:v19 count:2];
    v22 = [v11 errorWithDomain:v12 code:5 userInfo:v21];
    [(WFSetDictionaryValueAction *)self finishRunningWithError:v22];

    goto LABEL_7;
  }
  if (!v10)
  {
    v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F870B8];
    v26[0] = *MEMORY[0x263F08338];
    v13 = WFLocalizedString(@"No Value Provided");
    v27[0] = v13;
    v26[1] = *MEMORY[0x263F08320];
    v20 = NSString;
    v15 = WFLocalizedString(@"No value was provided to the Set Dictionary Value action for the key “%@”.");
    v16 = objc_msgSend(v20, "stringWithFormat:", v15, v9);
    v27[1] = v16;
    v17 = NSDictionary;
    v18 = v27;
    v19 = v26;
    goto LABEL_6;
  }
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __56__WFSetDictionaryValueAction_finishWithInput_key_value___block_invoke;
  v23[3] = &unk_264E5B870;
  v23[4] = self;
  id v24 = v10;
  id v25 = v9;
  [v8 getObjectRepresentation:v23 forClass:objc_opt_class()];

LABEL_7:
}

void __56__WFSetDictionaryValueAction_finishWithInput_key_value___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    v5 = *(void **)(a1 + 32);
    [v5 finishRunningWithError:a4];
  }
  else
  {
    v6 = (void *)[a2 mutableCopy];
    v7 = v6;
    if (v6) {
      id v8 = v6;
    }
    else {
      id v8 = (id)objc_opt_new();
    }
    id v11 = v8;

    [v11 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
    id v9 = [*(id *)(a1 + 32) output];
    id v10 = (void *)[v11 copy];
    [v9 addObject:v10];

    [*(id *)(a1 + 32) finishRunningWithError:0];
  }
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  v5 = [(WFSetDictionaryValueAction *)self parameterValueForKey:@"WFDictionaryKey" ofClass:objc_opt_class()];
  v6 = [(WFSetDictionaryValueAction *)self parameterForKey:@"WFDictionaryKey"];
  v7 = [(WFSetDictionaryValueAction *)self parameterStateForKey:@"WFDictionaryValue"];
  id v8 = [v7 variableString];
  id v9 = [(WFSetDictionaryValueAction *)self inputParameterKey];
  uint64_t v10 = [v9 isEqualToString:@"WFDictionaryKey"];

  if ([v8 representsSingleContentVariable])
  {
    id v23 = objc_alloc(MEMORY[0x263F86D80]);
    [(WFSetDictionaryValueAction *)self variableSource];
    v11 = id v25 = v8;
    uint64_t v12 = [(WFSetDictionaryValueAction *)self workflow];
    id v24 = v7;
    v13 = v5;
    uint64_t v14 = [v12 environment];
    v15 = [(WFSetDictionaryValueAction *)self contentAttributionTracker];
    [(WFSetDictionaryValueAction *)self widgetSizeClass];
    v17 = id v16 = v4;
    uint64_t v18 = v14;
    v5 = v13;
    v7 = v24;
    v19 = (void *)[v23 initWithVariableSource:v11 parameter:v6 isInputParameter:v10 environment:v18 contentAttributionTracker:v15 widgetSizeClass:v17];

    id v4 = v16;
    id v8 = v25;
    v20 = [v25 variables];
    v21 = [v20 firstObject];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    void v26[2] = __57__WFSetDictionaryValueAction_runAsynchronouslyWithInput___block_invoke;
    v26[3] = &unk_264E5B848;
    v26[4] = self;
    id v27 = v4;
    id v28 = v5;
    [v21 getContentWithContext:v19 completionHandler:v26];
  }
  else
  {
    v22 = [(WFSetDictionaryValueAction *)self parameterValueForKey:@"WFDictionaryValue" ofClass:objc_opt_class()];
    [(WFSetDictionaryValueAction *)self finishWithInput:v4 key:v5 value:v22];
  }
}

void __57__WFSetDictionaryValueAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  v9[4] = *MEMORY[0x263EF8340];
  id v3 = a2;
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  v9[2] = objc_opt_class();
  v9[3] = objc_opt_class();
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:4];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__WFSetDictionaryValueAction_runAsynchronouslyWithInput___block_invoke_2;
  v6[3] = &unk_264E5DF58;
  v5 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  id v8 = *(id *)(a1 + 48);
  [v3 generateCollectionByCoercingToItemClasses:v4 completionHandler:v6];
}

void __57__WFSetDictionaryValueAction_runAsynchronouslyWithInput___block_invoke_2(void *a1, void *a2)
{
  id v3 = [a2 items];
  objc_msgSend(v3, "if_compactMap:", &__block_literal_global_41620);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  unint64_t v4 = [v9 count];
  v5 = (void *)a1[4];
  uint64_t v6 = a1[5];
  uint64_t v7 = a1[6];
  if (v4 < 2)
  {
    id v8 = [v9 firstObject];
    [v5 finishWithInput:v6 key:v7 value:v8];
  }
  else
  {
    [v5 finishWithInput:v6 key:v7 value:v9];
  }
}

id __57__WFSetDictionaryValueAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 string];
LABEL_8:
    unint64_t v4 = (void *)v3;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 dictionary];
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v3 = [v2 number];
    goto LABEL_8;
  }
  unint64_t v4 = 0;
LABEL_9:

  return v4;
}

@end