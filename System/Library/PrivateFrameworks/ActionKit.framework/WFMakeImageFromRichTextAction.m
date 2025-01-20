@interface WFMakeImageFromRichTextAction
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFMakeImageFromRichTextAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__WFMakeImageFromRichTextAction_runAsynchronouslyWithInput___block_invoke;
  v8[3] = &unk_264E5CAB8;
  v8[4] = self;
  id v9 = v4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__WFMakeImageFromRichTextAction_runAsynchronouslyWithInput___block_invoke_3;
  v7[3] = &unk_264E5E840;
  v7[4] = self;
  id v6 = v4;
  [v6 transformFirstObjectRepresentationForClass:v5 usingBlock:v8 completionHandler:v7];
}

void __60__WFMakeImageFromRichTextAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a5;
  v8 = *(void **)(a1 + 32);
  id v9 = a2;
  v10 = [v8 parameterValueForKey:@"WFWidth" ofClass:objc_opt_class()];
  v11 = [*(id *)(a1 + 32) parameterValueForKey:@"WFHeight" ofClass:objc_opt_class()];
  [v10 doubleValue];
  double v13 = v12;
  [v11 doubleValue];
  double v15 = v14;
  v16 = (void *)MEMORY[0x263F339F8];
  v17 = [*(id *)(a1 + 40) defaultCoercionOptions];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __60__WFMakeImageFromRichTextAction_runAsynchronouslyWithInput___block_invoke_2;
  v19[3] = &unk_264E5E670;
  id v20 = v7;
  id v18 = v7;
  objc_msgSend(v16, "getImageRepresentationForWebResource:atSize:coercionOptions:completionHandler:", v9, v17, v19, v13, v15);
}

void __60__WFMakeImageFromRichTextAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

void __60__WFMakeImageFromRichTextAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    id v6 = [MEMORY[0x263F338B0] itemWithObject:a2 named:a3];
    (*(void (**)(uint64_t, id, void))(v3 + 16))(v3, v6, 0);
  }
  else
  {
    id v4 = *(void (**)(uint64_t))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 32);
    v4(v5);
  }
}

@end