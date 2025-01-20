@interface WFViewContentGraphActionUIKitUserInterface
- (id)completionHandler;
- (void)cancelPresentationWithCompletionHandler:(id)a3;
- (void)done;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)showWithContentItems:(id)a3 completionHandler:(id)a4;
@end

@implementation WFViewContentGraphActionUIKitUserInterface

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

- (void)presentationControllerDidDismiss:(id)a3
{
  v4 = [(WFViewContentGraphActionUIKitUserInterface *)self completionHandler];

  if (v4)
  {
    v5 = [(WFViewContentGraphActionUIKitUserInterface *)self completionHandler];
    v5[2](v5, 0);
  }
  [(WFViewContentGraphActionUIKitUserInterface *)self setCompletionHandler:0];
}

- (void)done
{
  v3 = [(WFViewContentGraphActionUIKitUserInterface *)self completionHandler];

  if (v3)
  {
    v4 = [(WFViewContentGraphActionUIKitUserInterface *)self completionHandler];
    v4[2](v4, 0);
  }
  [(WFViewContentGraphActionUIKitUserInterface *)self setCompletionHandler:0];
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __86__WFViewContentGraphActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v7[3] = &unk_264900EB0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)WFViewContentGraphActionUIKitUserInterface;
  id v5 = v4;
  [(WFEmbeddableActionUserInterface *)&v6 cancelPresentationWithCompletionHandler:v7];
}

uint64_t __86__WFViewContentGraphActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) completionHandler];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) completionHandler];
    id v4 = [MEMORY[0x263F087E8] userCancelledError];
    ((void (**)(void, void *))v3)[2](v3, v4);
  }
  [*(id *)(a1 + 32) setCompletionHandler:0];
  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v5();
}

- (void)showWithContentItems:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFViewContentGraphActionUIKitUserInterface.m", 24, @"Invalid parameter not satisfying: %@", @"items" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFViewContentGraphActionUIKitUserInterface.m", 25, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  [(WFViewContentGraphActionUIKitUserInterface *)self setCompletionHandler:v9];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__WFViewContentGraphActionUIKitUserInterface_showWithContentItems_completionHandler___block_invoke;
  block[3] = &unk_264900E88;
  id v14 = v7;
  v15 = self;
  id v10 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __85__WFViewContentGraphActionUIKitUserInterface_showWithContentItems_completionHandler___block_invoke(uint64_t a1)
{
  id v8 = [[WFContentItemsViewController alloc] initWithStyle:0];
  v2 = [*(id *)(a1 + 32) items];
  [(WFContentItemsViewController *)v8 setContentItems:v2];

  [(WFContentItemsViewController *)v8 setAllowsCoercion:1];
  v3 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:*(void *)(a1 + 40) action:sel_done];
  id v4 = [(WFContentItemsViewController *)v8 navigationItem];
  [v4 setRightBarButtonItem:v3];

  id v5 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v8];
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [v5 presentationController];
  [v7 setDelegate:v6];

  [*(id *)(a1 + 40) presentContent:v5];
}

@end