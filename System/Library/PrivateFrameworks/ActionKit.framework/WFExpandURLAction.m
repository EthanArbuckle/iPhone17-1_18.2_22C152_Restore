@interface WFExpandURLAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)getContentDestinationWithCompletionHandler:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFExpandURLAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [v7 length];
  v11 = NSString;
  if (v10)
  {
    v12 = WFLocalizedString(@"Allow “%1$@” to open “%2$@” with %3$@?");
    objc_msgSend(v11, "localizedStringWithFormat:", v12, v8, v9, v7);
  }
  else
  {
    v12 = WFLocalizedString(@"Allow “%1$@” to open “%2$@”?");
    objc_msgSend(v11, "localizedStringWithFormat:", v12, v8, v9, v15);
  v13 = };

  return v13;
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(WFExpandURLAction *)self input];
  id v7 = v4;
  id v6 = v4;
  WFGetContentLocationFromURLActionInput();
}

void __64__WFExpandURLAction_getContentDestinationWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    v3 = *(void (**)(uint64_t))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4);
  }
  else
  {
    id v5 = [MEMORY[0x263F33708] webpagesLocation];
    (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v5, 0);
  }
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__WFExpandURLAction_runAsynchronouslyWithInput___block_invoke_3;
  v6[3] = &unk_264E5E840;
  v6[4] = self;
  [v4 transformObjectRepresentationsForClass:v5 usingBlock:&__block_literal_global_3606 completionHandler:v6];
}

void __48__WFExpandURLAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

void __48__WFExpandURLAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = (void *)MEMORY[0x263F86F58];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__WFExpandURLAction_runAsynchronouslyWithInput___block_invoke_2;
  v9[3] = &unk_264E57F88;
  id v10 = v6;
  id v8 = v6;
  [v7 expandURL:a2 completionHandler:v9];
}

uint64_t __48__WFExpandURLAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end