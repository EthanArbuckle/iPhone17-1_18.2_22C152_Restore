@interface WFMakeGIFAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
- (id)cancelBlock;
- (void)cancel;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)setCancelBlock:(id)a3;
@end

@implementation WFMakeGIFAction

- (void).cxx_destruct
{
}

- (void)setCancelBlock:(id)a3
{
}

- (id)cancelBlock
{
  return self->_cancelBlock;
}

- (void)cancel
{
  v3 = [(WFMakeGIFAction *)self cancelBlock];

  if (v3)
  {
    v4 = [(WFMakeGIFAction *)self cancelBlock];
    v4[2]();

    [(WFMakeGIFAction *)self setCancelBlock:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)WFMakeGIFAction;
  [(WFMakeGIFAction *)&v5 cancel];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v25[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [(WFMakeGIFAction *)self parameterValueForKey:@"WFMakeGIFActionDelayTime" ofClass:objc_opt_class()];
  [v5 floatValue];
  float v7 = v6;

  if (v7 >= 0.01) {
    double v8 = v7;
  }
  else {
    double v8 = 0.01;
  }
  v9 = [(WFMakeGIFAction *)self parameterValueForKey:@"WFMakeGIFActionLoopCount" ofClass:objc_opt_class()];
  uint64_t v10 = [v9 integerValue];

  v11 = [(WFMakeGIFAction *)self parameterValueForKey:@"WFMakeGIFActionLoopEnabled" ofClass:objc_opt_class()];
  int v12 = [v11 BOOLValue];

  v13 = [(WFMakeGIFAction *)self parameterValueForKey:@"WFMakeGIFActionAutoSize" ofClass:objc_opt_class()];
  char v14 = [v13 BOOLValue];

  v15 = [(WFMakeGIFAction *)self parameterValueForKey:@"WFMakeGIFActionManualSizeWidth" ofClass:objc_opt_class()];
  [v15 doubleValue];
  double v17 = v16;

  v18 = [(WFMakeGIFAction *)self parameterValueForKey:@"WFMakeGIFActionManualSizeHeight" ofClass:objc_opt_class()];
  [v18 doubleValue];
  double v20 = v19;

  if (v17 < 0.0) {
    double v17 = 0.0;
  }
  if (v20 < 0.0) {
    double v20 = 0.0;
  }
  if (v12) {
    uint64_t v21 = 0;
  }
  else {
    uint64_t v21 = v10;
  }
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  v25[2] = objc_opt_class();
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:3];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __46__WFMakeGIFAction_runAsynchronouslyWithInput___block_invoke;
  v23[3] = &unk_264E5CF18;
  v23[4] = self;
  char v24 = v14;
  *(double *)&v23[5] = v17;
  *(double *)&v23[6] = v20;
  v23[7] = v21;
  *(double *)&v23[8] = v8;
  [v4 generateCollectionByCoercingToItemClasses:v22 completionHandler:v23];
}

void __46__WFMakeGIFAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if ([v6 numberOfItems])
  {
    double v8 = [v6 items];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __46__WFMakeGIFAction_runAsynchronouslyWithInput___block_invoke_6;
    v9[3] = &unk_264E5CEF0;
    v9[4] = *(void *)(a1 + 32);
    id v10 = v6;
    char v14 = *(unsigned char *)(a1 + 72);
    long long v11 = *(_OWORD *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 64);
    objc_msgSend(v8, "if_flatMapAsynchronously:completionHandler:", &__block_literal_global_48650, v9);
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v7];
  }
}

void __46__WFMakeGIFAction_runAsynchronouslyWithInput___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) isRunning])
  {
    if ([v5 count])
    {
      id v7 = objc_msgSend(v5, "if_objectsPassingTest:", &__block_literal_global_197);
      uint64_t v16 = MEMORY[0x263EF8330];
      uint64_t v17 = 3221225472;
      v18 = __46__WFMakeGIFAction_runAsynchronouslyWithInput___block_invoke_8;
      double v19 = &unk_264E5D368;
      id v8 = *(id *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 32);
      id v20 = v8;
      uint64_t v21 = v9;
      id v10 = _Block_copy(&v16);
      if (objc_msgSend(v7, "count", v16, v17, v18, v19))
      {
        if ([v7 count] == 1)
        {
          long long v11 = [v7 firstObject];
          uint64_t v12 = [v11 filename];
        }
        else
        {
          uint64_t v12 = 0;
        }
        char v14 = [v7 firstObject];
        v15 = WFGenerateGIFFromVideo();
        [*(id *)(a1 + 32) setCancelBlock:v15];
      }
      else
      {
        if ([v5 count] == 1)
        {
          uint64_t v13 = [v5 firstObject];
          uint64_t v12 = [v13 filename];
        }
        else
        {
          uint64_t v12 = 0;
        }
        char v14 = WFGenerateGIFFromImageFiles();
        [*(id *)(a1 + 32) setCancelBlock:v14];
      }
    }
    else
    {
      [*(id *)(a1 + 32) finishRunningWithError:v6];
    }
  }
}

void __46__WFMakeGIFAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a2;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v15 = 0;
LABEL_9:
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __46__WFMakeGIFAction_runAsynchronouslyWithInput___block_invoke_5;
    v19[3] = &unk_264E5DBC8;
    id v20 = v6;
    id v13 = v6;
    [v5 getFileRepresentation:v19 forType:v15];
    id v14 = v20;
    id v7 = (void *)v15;
    goto LABEL_10;
  }
  id v7 = [v5 asset];
  id v8 = [v7 burstIdentifier];

  if (!v8)
  {
    if (([v7 mediaSubtypes] & 8) != 0)
    {
      uint64_t v16 = [v5 supportedTypes];
      uint64_t v17 = [v16 array];
      v18 = objc_msgSend(v17, "if_objectsPassingTest:", &__block_literal_global_193);
      uint64_t v15 = [v18 firstObject];
    }
    else
    {
      uint64_t v15 = 0;
    }

    goto LABEL_9;
  }
  uint64_t v9 = (void *)MEMORY[0x263F337B0];
  id v10 = (void *)MEMORY[0x263F33938];
  long long v11 = [v7 burstIdentifier];
  uint64_t v12 = [v10 itemsWithBurstIdentifier:v11];
  id v13 = [v9 collectionWithItems:v12];

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __46__WFMakeGIFAction_runAsynchronouslyWithInput___block_invoke_3;
  v21[3] = &unk_264E5CE88;
  id v22 = v6;
  id v14 = v6;
  [v13 getFileRepresentations:v21 forType:0];

LABEL_10:
}

uint64_t __46__WFMakeGIFAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __46__WFMakeGIFAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = (void *)MEMORY[0x263EFF8C0];
  id v6 = a3;
  objc_msgSend(v5, "arrayWithObjects:", a2, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);
}

uint64_t __46__WFMakeGIFAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 conformsToUTType:*MEMORY[0x263F1D9C0]];
}

void __46__WFMakeGIFAction_runAsynchronouslyWithInput___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v11 = a3;
  if (a2)
  {
    id v5 = (void *)MEMORY[0x263F337C8];
    id v6 = *(void **)(a1 + 32);
    id v7 = a2;
    id v8 = [v6 attributionSet];
    uint64_t v9 = [v5 itemWithFile:v7 attributionSet:v8];

    id v10 = [*(id *)(a1 + 40) output];
    [v10 addItem:v9];
  }
  [*(id *)(a1 + 40) finishRunningWithError:v11];
}

uint64_t __46__WFMakeGIFAction_runAsynchronouslyWithInput___block_invoke_7(uint64_t a1, void *a2)
{
  v2 = [a2 wfType];
  uint64_t v3 = [v2 conformsToUTType:*MEMORY[0x263F1D9C0]];

  return v3;
}

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

@end