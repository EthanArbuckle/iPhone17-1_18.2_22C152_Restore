@interface WFImageResizeAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFImageResizeAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__WFImageResizeAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_264E5DBA0;
  v6[4] = self;
  [v4 generateCollectionByCoercingToItemClass:v5 completionHandler:v6];
}

void __50__WFImageResizeAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if ([v6 numberOfItems])
  {
    v8 = [*(id *)(a1 + 32) parameterValueForKey:@"WFImageResizeWidth" ofClass:objc_opt_class()];
    [v8 floatValue];
    double v10 = v9;

    v11 = [*(id *)(a1 + 32) parameterValueForKey:@"WFImageResizeHeight" ofClass:objc_opt_class()];
    [v11 floatValue];
    double v13 = v12;

    v14 = [*(id *)(a1 + 32) parameterValueForKey:@"WFImageResizePercentage" ofClass:objc_opt_class()];
    [v14 floatValue];
    double v16 = v15;

    v17 = [*(id *)(a1 + 32) parameterValueForKey:@"WFImageResizeLength" ofClass:objc_opt_class()];
    [v17 floatValue];
    double v19 = v18;

    v20 = [*(id *)(a1 + 32) parameterValueForKey:@"WFImageResizeKey" ofClass:objc_opt_class()];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __50__WFImageResizeAction_runAsynchronouslyWithInput___block_invoke_2;
    v23[3] = &unk_264E55B68;
    double v25 = v10;
    double v26 = v13;
    id v24 = v20;
    double v27 = v16;
    double v28 = v19;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __50__WFImageResizeAction_runAsynchronouslyWithInput___block_invoke_4;
    v22[3] = &unk_264E5E840;
    v22[4] = *(void *)(a1 + 32);
    id v21 = v20;
    [v6 transformItemsUsingBlock:v23 completionHandler:v22];
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v7];
  }
}

void __50__WFImageResizeAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__WFImageResizeAction_runAsynchronouslyWithInput___block_invoke_3;
  v7[3] = &unk_264E55B40;
  id v9 = v5;
  long long v10 = *(_OWORD *)(a1 + 40);
  id v8 = *(id *)(a1 + 32);
  long long v11 = *(_OWORD *)(a1 + 56);
  id v6 = v5;
  [a2 getFileRepresentation:v7 forType:0];
}

void __50__WFImageResizeAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

void __50__WFImageResizeAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    WFImageSizeFromFile();
    if (![*(id *)(a1 + 32) isEqualToString:@"Size"]
      && ![*(id *)(a1 + 32) isEqualToString:@"Percentage"])
    {
      [*(id *)(a1 + 32) isEqualToString:@"Longest Edge"];
    }
    WFAsyncTransformedImageFromImage();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

@end