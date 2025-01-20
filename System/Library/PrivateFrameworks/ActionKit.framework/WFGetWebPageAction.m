@interface WFGetWebPageAction
- (void)getContentDestinationWithCompletionHandler:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFGetWebPageAction

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(WFGetWebPageAction *)self input];
  WFGetContentLocationFromURLActionInput();
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__WFGetWebPageAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_264E5DBA0;
  v6[4] = self;
  [v4 generateCollectionByCoercingToItemClass:v5 completionHandler:v6];
}

void __49__WFGetWebPageAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  if (v6)
  {
    uint64_t v7 = objc_opt_class();
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __49__WFGetWebPageAction_runAsynchronouslyWithInput___block_invoke_2;
    v8[3] = &unk_264E5DBA0;
    v8[4] = *(void *)(a1 + 32);
    [v6 generateCollectionByCoercingToItemClass:v7 completionHandler:v8];
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:a4];
  }
}

void __49__WFGetWebPageAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id v6 = (void *)[a2 copy];
  [*(id *)(a1 + 32) setOutput:v6];

  [*(id *)(a1 + 32) finishRunningWithError:v7];
}

@end