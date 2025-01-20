@interface WFShowInStoreAction
- (id)contentDestinationWithError:(id *)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFShowInStoreAction

- (id)contentDestinationWithError:(id *)a3
{
  return (id)[MEMORY[0x263F33708] locationWithSystemAppBundleIdentifier:*MEMORY[0x263F854C8]];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__WFShowInStoreAction_runAsynchronouslyWithInput___block_invoke;
  v4[3] = &unk_264E5EF10;
  v4[4] = self;
  id v3 = a3;
  [v3 getObjectRepresentation:v4 forClass:objc_opt_class()];
}

void __50__WFShowInStoreAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  v8 = [v6 identifier];

  if (v8)
  {
    v9 = [MEMORY[0x263F33718] sharedContext];
    v10 = [v6 viewURL];
    v11 = [*(id *)(a1 + 32) userInterface];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __50__WFShowInStoreAction_runAsynchronouslyWithInput___block_invoke_2;
    v12[3] = &unk_264E5BF28;
    v12[4] = *(void *)(a1 + 32);
    [v9 openURL:v10 userInterface:v11 completionHandler:v12];
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v7];
  }
}

uint64_t __50__WFShowInStoreAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

@end