@interface WFMakeVideoFromGIFAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
- (id)cancelBlock;
- (void)cancel;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)setCancelBlock:(id)a3;
@end

@implementation WFMakeVideoFromGIFAction

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
  v3 = [(WFMakeVideoFromGIFAction *)self cancelBlock];

  if (v3)
  {
    v4 = [(WFMakeVideoFromGIFAction *)self cancelBlock];
    v4[2]();

    [(WFMakeVideoFromGIFAction *)self setCancelBlock:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)WFMakeVideoFromGIFAction;
  [(WFMakeVideoFromGIFAction *)&v5 cancel];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v4 = (void *)MEMORY[0x263F852B8];
  uint64_t v5 = *MEMORY[0x263F1DAD0];
  id v6 = a3;
  v7 = [v4 typeWithUTType:v5];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__WFMakeVideoFromGIFAction_runAsynchronouslyWithInput___block_invoke;
  v9[3] = &unk_264E59DC8;
  v9[4] = self;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__WFMakeVideoFromGIFAction_runAsynchronouslyWithInput___block_invoke_3;
  v8[3] = &unk_264E5E840;
  v8[4] = self;
  [v6 transformFirstFileRepresentationForType:v7 usingBlock:v9 completionHandler:v8];
}

void __55__WFMakeVideoFromGIFAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (v7)
  {
    v9 = [*(id *)(a1 + 32) parameterValueForKey:@"WFMakeVideoFromGIFActionLoopCount" ofClass:objc_opt_class()];
    [v9 integerValue];

    v10 = [v7 wfName];
    uint64_t v13 = MEMORY[0x263EF8330];
    id v11 = v8;
    uint64_t v14 = *(void *)(a1 + 32);
    id v15 = v11;
    v12 = WFGenerateVideoFromGIF();
    objc_msgSend(*(id *)(a1 + 32), "setCancelBlock:", v12, v13, 3221225472, __55__WFMakeVideoFromGIFAction_runAsynchronouslyWithInput___block_invoke_2, &unk_264E5E098, v14);
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:a3];
  }
}

void __55__WFMakeVideoFromGIFAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

void __55__WFMakeVideoFromGIFAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v19[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    [*(id *)(a1 + 32) setCancelBlock:0];
    id v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    v9 = [v6 domain];
    if ([v9 isEqualToString:*MEMORY[0x263F33A08]])
    {
      uint64_t v10 = [v7 code];

      if (!v10)
      {
        id v11 = WFLocalizedString(@"GIF Not Animated");
        v12 = WFLocalizedString(@"Make Video from GIF failed because the GIF passed as input was not an animated GIF.");
        uint64_t v13 = (void *)MEMORY[0x263F087E8];
        uint64_t v14 = *MEMORY[0x263F870B8];
        uint64_t v15 = *MEMORY[0x263F08320];
        v18[0] = *MEMORY[0x263F08338];
        v18[1] = v15;
        v19[0] = v11;
        v19[1] = v12;
        v16 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
        uint64_t v17 = [v13 errorWithDomain:v14 code:6 userInfo:v16];

        id v7 = (void *)v17;
      }
    }
    else
    {
    }
    id v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v8();
}

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

@end