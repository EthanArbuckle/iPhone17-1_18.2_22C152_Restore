@interface WFContentAttributionSetDebuggerActionUIKitUserInterface
- (id)completionHandler;
- (void)cancelPresentationWithCompletionHandler:(id)a3;
- (void)done;
- (void)finish;
- (void)setCompletionHandler:(id)a3;
- (void)showWithInput:(id)a3 completionHandler:(id)a4;
@end

@implementation WFContentAttributionSetDebuggerActionUIKitUserInterface

- (void).cxx_destruct
{
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)finish
{
  v3 = [(WFContentAttributionSetDebuggerActionUIKitUserInterface *)self completionHandler];

  if (v3)
  {
    v4 = [(WFContentAttributionSetDebuggerActionUIKitUserInterface *)self completionHandler];
    v5 = [MEMORY[0x263F087E8] userCancelledError];
    ((void (**)(void, void *))v4)[2](v4, v5);
  }
  [(WFContentAttributionSetDebuggerActionUIKitUserInterface *)self setCompletionHandler:0];
}

- (void)done
{
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __99__WFContentAttributionSetDebuggerActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v7[3] = &unk_264900EB0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)WFContentAttributionSetDebuggerActionUIKitUserInterface;
  id v5 = v4;
  [(WFEmbeddableActionUserInterface *)&v6 cancelPresentationWithCompletionHandler:v7];
}

uint64_t __99__WFContentAttributionSetDebuggerActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) finish];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)showWithInput:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFContentAttributionSetDebuggerActionUIKitUserInterface.m", 24, @"Invalid parameter not satisfying: %@", @"input" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFContentAttributionSetDebuggerActionUIKitUserInterface.m", 25, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  [(WFContentAttributionSetDebuggerActionUIKitUserInterface *)self setCompletionHandler:v9];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __91__WFContentAttributionSetDebuggerActionUIKitUserInterface_showWithInput_completionHandler___block_invoke;
  block[3] = &unk_264900E88;
  id v14 = v7;
  v15 = self;
  id v10 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __91__WFContentAttributionSetDebuggerActionUIKitUserInterface_showWithInput_completionHandler___block_invoke(uint64_t a1)
{
  objc_super v6 = [[WFContentAttributionSetDebuggerViewController alloc] initWithStyle:0];
  v2 = [*(id *)(a1 + 32) items];
  [(WFContentAttributionSetDebuggerViewController *)v6 setContentItems:v2];

  v3 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:*(void *)(a1 + 40) action:sel_done];
  id v4 = [(WFContentAttributionSetDebuggerViewController *)v6 navigationItem];
  [v4 setRightBarButtonItem:v3];

  id v5 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v6];
  [*(id *)(a1 + 40) presentContent:v5];
}

@end