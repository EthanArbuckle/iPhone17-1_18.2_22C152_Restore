@interface WFGetTextFromPDFAction
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFGetTextFromPDFAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  v5 = [(WFGetTextFromPDFAction *)self parameterValueForKey:@"WFGetTextFromPDFTextType" ofClass:objc_opt_class()];
  if (([v5 isEqualToString:@"Text"] & 1) != 0
    || [v5 isEqualToString:@"Rich Text"])
  {
    uint64_t v6 = objc_opt_class();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v8 = [(WFGetTextFromPDFAction *)self parameterValueForKey:@"WFGetTextFromPDFPageHeader" ofClass:objc_opt_class()];
  v9 = [(WFGetTextFromPDFAction *)self parameterValueForKey:@"WFGetTextFromPDFPageFooter" ofClass:objc_opt_class()];
  if (v8) {
    [v7 setObject:v8 forKey:*MEMORY[0x263F33A60]];
  }
  if (v9) {
    [v7 setObject:v9 forKey:*MEMORY[0x263F33A58]];
  }
  v10 = [(WFGetTextFromPDFAction *)self parameterValueForKey:@"WFCombinePages" ofClass:objc_opt_class()];
  char v11 = [v10 BOOLValue];

  v12 = (void *)MEMORY[0x263F33770];
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  v18 = __53__WFGetTextFromPDFAction_runAsynchronouslyWithInput___block_invoke;
  v19 = &unk_264E5E490;
  char v23 = v11;
  v21 = self;
  uint64_t v22 = v6;
  id v20 = v4;
  id v13 = v4;
  v14 = [v12 requestForCoercingToObjectClass:v6 completionHandler:&v16];
  v15 = objc_msgSend(MEMORY[0x263F33768], "optionsWithDictionary:", v7, v16, v17, v18, v19);
  [v14 setOptions:v15];

  [v13 performCoercion:v14];
}

void __53__WFGetTextFromPDFAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  if (*(unsigned char *)(a1 + 56))
  {
    v8 = [*(id *)(a1 + 32) items];
    v9 = [v8 firstObject];
    v10 = [v9 name];

    uint64_t v11 = *(void *)(a1 + 48);
    if (v11 == objc_opt_class())
    {
      id v14 = [v6 componentsJoinedByString:@"\n"];
      uint64_t v22 = [*(id *)(a1 + 40) output];
      [v22 addObject:v14 named:v10];
    }
    else
    {
      uint64_t v12 = *(void *)(a1 + 48);
      if (v12 != objc_opt_class())
      {
LABEL_15:

        goto LABEL_16;
      }
      id v13 = objc_alloc_init(MEMORY[0x263F089B8]);
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __53__WFGetTextFromPDFAction_runAsynchronouslyWithInput___block_invoke_2;
      v27[3] = &unk_264E5E468;
      id v28 = v13;
      id v14 = v13;
      [v6 enumerateObjectsUsingBlock:v27];
      v15 = [*(id *)(a1 + 40) output];
      [v15 addObject:v14 named:v10];
    }
    goto LABEL_15;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v16 = [v6 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v6);
        }
        uint64_t v20 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v21 = [*(id *)(a1 + 40) output];
        [v21 addObject:v20];
      }
      uint64_t v17 = [v6 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v17);
  }
LABEL_16:
  [*(id *)(a1 + 40) finishRunningWithError:v7];
}

void __53__WFGetTextFromPDFAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  if (a3)
  {
    v5 = *(void **)(a1 + 32);
    id v6 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@"\n"];
    [v5 appendAttributedString:v6];
  }
  [*(id *)(a1 + 32) appendAttributedString:v7];
}

@end