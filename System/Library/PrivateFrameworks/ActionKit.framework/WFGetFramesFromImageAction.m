@interface WFGetFramesFromImageAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
- (id)cancelBlock;
- (void)cancel;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)setCancelBlock:(id)a3;
@end

@implementation WFGetFramesFromImageAction

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
  v3 = [(WFGetFramesFromImageAction *)self cancelBlock];

  if (v3)
  {
    v4 = [(WFGetFramesFromImageAction *)self cancelBlock];
    v4[2]();

    [(WFGetFramesFromImageAction *)self setCancelBlock:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)WFGetFramesFromImageAction;
  [(WFGetFramesFromImageAction *)&v5 cancel];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v7[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  objc_super v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__WFGetFramesFromImageAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_264E5DBA0;
  v6[4] = self;
  [v4 generateCollectionByCoercingToItemClasses:v5 completionHandler:v6];
}

void __57__WFGetFramesFromImageAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v19[2] = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  if ([v6 numberOfItems])
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __57__WFGetFramesFromImageAction_runAsynchronouslyWithInput___block_invoke_2;
    v16[3] = &unk_264E57C58;
    uint64_t v17 = *(void *)(a1 + 32);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __57__WFGetFramesFromImageAction_runAsynchronouslyWithInput___block_invoke_5;
    v15[3] = &unk_264E5E840;
    v15[4] = v17;
    [v6 transformItemsAndFlattenUsingBlock:v16 completionHandler:v15];
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    if (v7)
    {
      [v8 finishRunningWithError:v7];
    }
    else
    {
      v9 = (void *)MEMORY[0x263F087E8];
      uint64_t v10 = *MEMORY[0x263F870B8];
      v18[0] = *MEMORY[0x263F08338];
      v11 = WFLocalizedString(@"No Image Provided");
      v19[0] = v11;
      v18[1] = *MEMORY[0x263F08320];
      v12 = WFLocalizedString(@"No GIF was passed as input to Get Frames from Image.");
      v19[1] = v12;
      v13 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
      v14 = [v9 errorWithDomain:v10 code:6 userInfo:v13];
      [v8 finishRunningWithError:v14];
    }
  }
}

void __57__WFGetFramesFromImageAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  id v7 = [v5 asset];
  v8 = [v7 burstIdentifier];

  if (!v8)
  {

LABEL_5:
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __57__WFGetFramesFromImageAction_runAsynchronouslyWithInput___block_invoke_3;
    v13[3] = &unk_264E5E098;
    uint64_t v14 = *(void *)(a1 + 32);
    id v15 = v6;
    v12 = objc_msgSend(MEMORY[0x263F852B8], "typeWithUTType:", *MEMORY[0x263F1DAD0], v13[0], 3221225472, __57__WFGetFramesFromImageAction_runAsynchronouslyWithInput___block_invoke_3, &unk_264E5E098, v14);
    [v5 getFileRepresentation:v13 forType:v12];

    goto LABEL_6;
  }
  v9 = (void *)MEMORY[0x263F33938];
  uint64_t v10 = [v7 burstIdentifier];
  v11 = [v9 itemsWithBurstIdentifier:v10];
  (*((void (**)(id, void *, void))v6 + 2))(v6, v11, 0);

LABEL_6:
}

void __57__WFGetFramesFromImageAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v7 = a3;
  id v6 = a2;
  [v5 setCancelBlock:0];
  [*(id *)(a1 + 32) setOutput:v6];

  [*(id *)(a1 + 32) finishRunningWithError:v7];
}

void __57__WFGetFramesFromImageAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 wfName];
  id v6 = *(id *)(a1 + 40);
  id v5 = WFGenerateImageFilesFromGIF();

  [*(id *)(a1 + 32) setCancelBlock:v5];
}

uint64_t __57__WFGetFramesFromImageAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

@end