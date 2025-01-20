@interface WFCalculateStatisticsAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
- (id)outputName;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFCalculateStatisticsAction

- (id)outputName
{
  v3 = [(WFCalculateStatisticsAction *)self parameterStateForKey:@"WFStatisticsOperation"];
  v4 = [v3 value];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    v6 = [(WFCalculateStatisticsAction *)self parameterForKey:@"WFStatisticsOperation"];
    v7 = [v6 localizedLabelForPossibleState:v3];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)WFCalculateStatisticsAction;
    v7 = [(WFCalculateStatisticsAction *)&v9 outputName];
  }

  return v7;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFCalculateStatisticsAction *)self parameterValueForKey:@"WFStatisticsOperation" ofClass:objc_opt_class()];
  if ([v5 isEqualToString:@"Average"])
  {
    uint64_t v6 = 1;
  }
  else if ([v5 isEqualToString:@"Minimum"])
  {
    uint64_t v6 = 2;
  }
  else if ([v5 isEqualToString:@"Maximum"])
  {
    uint64_t v6 = 3;
  }
  else if ([v5 isEqualToString:@"Sum"])
  {
    uint64_t v6 = 4;
  }
  else if ([v5 isEqualToString:@"Median"])
  {
    uint64_t v6 = 5;
  }
  else if ([v5 isEqualToString:@"Mode"])
  {
    uint64_t v6 = 6;
  }
  else if ([v5 isEqualToString:@"Range"])
  {
    uint64_t v6 = 7;
  }
  else if ([v5 isEqualToString:@"Standard Deviation"])
  {
    uint64_t v6 = 8;
  }
  else
  {
    uint64_t v6 = 0;
  }
  v7 = objc_alloc_init(WFStatisticsEngine);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__WFCalculateStatisticsAction_runAsynchronouslyWithInput___block_invoke;
  aBlock[3] = &unk_264E5E3B0;
  id v8 = v4;
  id v18 = v8;
  v19 = self;
  objc_super v9 = v7;
  v20 = v9;
  uint64_t v21 = v6;
  v10 = (void (**)(void))_Block_copy(aBlock);
  if ([v8 numberOfItems] == 1)
  {
    uint64_t v11 = objc_opt_class();
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __58__WFCalculateStatisticsAction_runAsynchronouslyWithInput___block_invoke_5;
    v14[3] = &unk_264E5E3D8;
    v15 = v9;
    uint64_t v16 = v6;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __58__WFCalculateStatisticsAction_runAsynchronouslyWithInput___block_invoke_7;
    v12[3] = &unk_264E5E400;
    v12[4] = self;
    v13 = v10;
    [v8 transformFirstObjectRepresentationForClass:v11 usingBlock:v14 completionHandler:v12];
  }
  else
  {
    v10[2](v10);
  }
}

void __58__WFCalculateStatisticsAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__WFCalculateStatisticsAction_runAsynchronouslyWithInput___block_invoke_2;
  v6[3] = &unk_264E5E388;
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 48);
  v6[4] = *(void *)(a1 + 40);
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 56);
  id v7 = v4;
  uint64_t v9 = v5;
  id v8 = *(id *)(a1 + 32);
  [v2 getObjectRepresentations:v6 forClass:objc_opt_class()];
}

void __58__WFCalculateStatisticsAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  v16[1] = *MEMORY[0x263EF8340];
  id v7 = a5;
  uint64_t v9 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  v16[0] = a2;
  v10 = (void *)MEMORY[0x263EFF8C0];
  id v11 = a2;
  v12 = [v10 arrayWithObjects:v16 count:1];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __58__WFCalculateStatisticsAction_runAsynchronouslyWithInput___block_invoke_6;
  v14[3] = &unk_264E5E5B8;
  id v15 = v7;
  id v13 = v7;
  [v9 applyOperation:v8 onStatisticsSampleProviders:v12 completion:v14];
}

uint64_t __58__WFCalculateStatisticsAction_runAsynchronouslyWithInput___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v4();
  }
  else
  {
    [*(id *)(a1 + 32) setOutput:a2];
    uint64_t v6 = *(void **)(a1 + 32);
    return [v6 finishRunningWithError:0];
  }
}

void __58__WFCalculateStatisticsAction_runAsynchronouslyWithInput___block_invoke_6(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 count])
  {
    v3 = [v6 firstObject];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = [v3 sampleProvider];
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v5, 0);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __58__WFCalculateStatisticsAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = objc_msgSend(v6, "if_objectsPassingTest:", &__block_literal_global_53468);

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __58__WFCalculateStatisticsAction_runAsynchronouslyWithInput___block_invoke_4;
    v11[3] = &unk_264E5E360;
    uint64_t v9 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 56);
    id v12 = *(id *)(a1 + 48);
    [v9 applyOperation:v10 onNumbers:v8 completion:v11];

    id v6 = (id)v8;
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v7];
  }
}

void __58__WFCalculateStatisticsAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v18 = v3;
      id v4 = v3;
      uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v20;
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v20 != v7) {
              objc_enumerationMutation(v4);
            }
            uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * v8);
            uint64_t v10 = [*(id *)(a1 + 32) output];
            id v11 = (void *)MEMORY[0x263F337C8];
            id v12 = [*(id *)(a1 + 40) attributionSet];
            id v13 = [v11 itemWithObject:v9 attributionSet:v12];
            [v10 addItem:v13];

            ++v8;
          }
          while (v6 != v8);
          uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v6);
      }

      id v3 = v18;
    }
    else
    {
      v14 = [*(id *)(a1 + 32) output];
      id v15 = (void *)MEMORY[0x263F337C8];
      uint64_t v16 = [*(id *)(a1 + 40) attributionSet];
      v17 = [v15 itemWithObject:v3 attributionSet:v16];
      [v14 addItem:v17];
    }
  }
  [*(id *)(a1 + 32) finishRunningWithError:0];
}

BOOL __58__WFCalculateStatisticsAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  id v3 = a2;
  id v4 = [v2 numberWithBool:1];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

@end