@interface WFGetDictionaryValueAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)setOutputWithValue:(id)a3 preferredDictionaryType:(id)a4 contentAttributionSet:(id)a5;
@end

@implementation WFGetDictionaryValueAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (void)setOutputWithValue:(id)a3 preferredDictionaryType:(id)a4 contentAttributionSet:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a3)
  {
    v6 = [MEMORY[0x263F33850] itemsWithPropertyListObject:a3 preferredDictionaryType:a4 attributionSet:a5];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
          v12 = [(WFGetDictionaryValueAction *)self output];
          [v12 addItem:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__WFGetDictionaryValueAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_264E5DBA0;
  v6[4] = self;
  [v4 generateCollectionByCoercingToItemClass:v5 completionHandler:v6];
}

void __57__WFGetDictionaryValueAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [a2 items];
  uint64_t v8 = [v7 firstObject];

  uint64_t v9 = [v8 dictionary];
  if (v9)
  {
    uint64_t v10 = [*(id *)(a1 + 32) parameterValueForKey:@"WFGetDictionaryValueType" ofClass:objc_opt_class()];
    if ([v10 isEqualToString:@"All Values"])
    {
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      uint64_t v11 = [v9 allValues];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v55 objects:v62 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        id v47 = v6;
        v48 = v10;
        v46 = v9;
        uint64_t v14 = *(void *)v56;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v56 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v55 + 1) + 8 * i);
            v17 = *(void **)(a1 + 32);
            uint64_t v18 = objc_msgSend(v8, "preferredFileType", v46, v47);
            v19 = [v8 attributionSet];
            [v17 setOutputWithValue:v16 preferredDictionaryType:v18 contentAttributionSet:v19];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v55 objects:v62 count:16];
        }
        while (v13);
LABEL_20:
        uint64_t v9 = v46;
        id v6 = v47;
LABEL_21:
        uint64_t v10 = v48;
        goto LABEL_22;
      }
      goto LABEL_22;
    }
    if ([v10 isEqualToString:@"All Keys"])
    {
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      uint64_t v11 = [v9 allKeys];
      uint64_t v20 = [v11 countByEnumeratingWithState:&v51 objects:v61 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        id v47 = v6;
        v48 = v10;
        v46 = v9;
        uint64_t v22 = *(void *)v52;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v52 != v22) {
              objc_enumerationMutation(v11);
            }
            uint64_t v24 = *(void *)(*((void *)&v51 + 1) + 8 * j);
            v25 = *(void **)(a1 + 32);
            v26 = objc_msgSend(v8, "preferredFileType", v46, v47);
            v27 = [v8 attributionSet];
            [v25 setOutputWithValue:v24 preferredDictionaryType:v26 contentAttributionSet:v27];
          }
          uint64_t v21 = [v11 countByEnumeratingWithState:&v51 objects:v61 count:16];
        }
        while (v21);
        goto LABEL_20;
      }
LABEL_22:

LABEL_23:
      [*(id *)(a1 + 32) finishRunningWithError:0];
LABEL_24:

      goto LABEL_25;
    }
    if (![v10 isEqualToString:@"Value"]) {
      goto LABEL_23;
    }
    uint64_t v11 = [*(id *)(a1 + 32) parameterValueForKey:@"WFDictionaryKey" ofClass:objc_opt_class()];
    if ([v11 length]
      || ([v9 objectForKey:v11],
          v28 = objc_claimAutoreleasedReturnValue(),
          v28,
          v28))
    {
      uint64_t v29 = [v9 objectForKey:v11];
      if (v29)
      {
        v30 = (void *)v29;
        v48 = v10;
        v31 = v9;
        id v32 = v6;
        id v33 = 0;
LABEL_33:
        v34 = *(void **)(a1 + 32);
        v35 = [v8 preferredFileType];
        v36 = [v8 attributionSet];
        [v34 setOutputWithValue:v30 preferredDictionaryType:v35 contentAttributionSet:v36];

        id v6 = v32;
        uint64_t v9 = v31;
        goto LABEL_21;
      }
      id v50 = 0;
      v30 = [MEMORY[0x263F338C0] evaluateKeyPath:v11 onObject:v9 error:&v50];
      id v33 = v50;
      if (v30)
      {
        v48 = v10;
        v31 = v9;
        id v32 = v6;
        goto LABEL_33;
      }
      [*(id *)(a1 + 32) finishRunningWithError:v33];
    }
    else
    {
      v49 = *(void **)(a1 + 32);
      v37 = (void *)MEMORY[0x263F087E8];
      uint64_t v38 = *MEMORY[0x263F870B8];
      v59[0] = *MEMORY[0x263F08338];
      v39 = WFLocalizedString(@"No Key Provided");
      v60[0] = v39;
      v59[1] = *MEMORY[0x263F08320];
      WFLocalizedString(@"No key was provided to the Get Dictionary Value action.");
      v41 = id v40 = v6;
      v60[1] = v41;
      [NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:2];
      v42 = v10;
      v44 = v43 = v9;
      v45 = [v37 errorWithDomain:v38 code:5 userInfo:v44];
      [v49 finishRunningWithError:v45];

      uint64_t v9 = v43;
      uint64_t v10 = v42;

      id v6 = v40;
    }

    goto LABEL_24;
  }
  [*(id *)(a1 + 32) finishRunningWithError:v6];
LABEL_25:
}

@end