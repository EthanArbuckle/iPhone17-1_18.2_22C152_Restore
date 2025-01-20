@interface WFAddFrameToGIFAction
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFAddFrameToGIFAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  v5 = [(WFAddFrameToGIFAction *)self parameterValueForKey:@"WFImage" ofClass:objc_opt_class()];
  uint64_t v6 = objc_opt_class();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__WFAddFrameToGIFAction_runAsynchronouslyWithInput___block_invoke;
  v8[3] = &unk_264E5B908;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 generateCollectionByCoercingToItemClass:v6 completionHandler:v8];
}

void __52__WFAddFrameToGIFAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if ([v6 numberOfItems])
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __52__WFAddFrameToGIFAction_runAsynchronouslyWithInput___block_invoke_2;
    v9[3] = &unk_264E5D368;
    v8 = *(void **)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    id v10 = v8;
    [v6 getFileRepresentation:v9 forType:0];
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v7];
  }
}

void __52__WFAddFrameToGIFAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) parameterValueForKey:@"WFGIFDelayTime" ofClass:objc_opt_class()];
    [v6 floatValue];
    float v8 = v7;

    if (v8 >= 0.0001) {
      double v9 = v8;
    }
    else {
      double v9 = 0.0001;
    }
    id v10 = [*(id *)(a1 + 32) parameterValueForKey:@"WFGIFAutoSize" ofClass:objc_opt_class()];
    char v11 = [v10 BOOLValue];

    v12 = [*(id *)(a1 + 32) parameterValueForKey:@"WFGIFManualSizeWidth" ofClass:objc_opt_class()];
    [v12 doubleValue];
    double v14 = v13;

    if (v14 >= 0.0) {
      double v15 = v14;
    }
    else {
      double v15 = 0.0;
    }
    v16 = [*(id *)(a1 + 32) parameterValueForKey:@"WFGIFManualSizeHeight" ofClass:objc_opt_class()];
    [v16 doubleValue];
    double v18 = v17;

    if (v18 < 0.0) {
      double v18 = 0.0;
    }
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__WFAddFrameToGIFAction_runAsynchronouslyWithInput___block_invoke_3;
    aBlock[3] = &unk_264E5D390;
    aBlock[4] = *(void *)(a1 + 32);
    v19 = _Block_copy(aBlock);
    v20 = *(void **)(a1 + 40);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __52__WFAddFrameToGIFAction_runAsynchronouslyWithInput___block_invoke_4;
    v25[3] = &unk_264E5A2F0;
    char v31 = v11;
    double v28 = v9;
    double v29 = v15;
    double v30 = v18;
    id v26 = v5;
    id v27 = v19;
    v21 = (void *)MEMORY[0x263F852B8];
    uint64_t v22 = *MEMORY[0x263F1DAD0];
    id v23 = v19;
    v24 = [v21 typeWithUTType:v22];
    [v20 getFileRepresentation:v25 forType:v24];
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:a3];
  }
}

void __52__WFAddFrameToGIFAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  if (a2)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = a2;
    float v7 = [v5 output];
    [v7 addFile:v6];
  }
  [*(id *)(a1 + 32) finishRunningWithError:v8];
}

void __52__WFAddFrameToGIFAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5
    && ([v5 mappedData],
        float v7 = objc_claimAutoreleasedReturnValue(),
        int IsAnimatedGIF = WFImageDataIsAnimatedGIF(),
        v7,
        IsAnimatedGIF))
  {
    WFImageSizeFromFile();
    char v11 = [v5 wfName];
    WFAddImageFileToGIF();
  }
  else
  {
    v12[0] = *(void *)(a1 + 32);
    double v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    id v10 = (id)WFGenerateGIFFromImageFiles();
  }
}

@end