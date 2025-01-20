@interface WFAddNewEventActionUIKitUserInterface
- (id)completionHandler;
- (void)cancelPresentationWithCompletionHandler:(id)a3;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)finishWithEventIdentifier:(id)a3 error:(id)a4;
- (void)setCompletionHandler:(id)a3;
- (void)showWithEventParameters:(id)a3 completionHandler:(id)a4;
@end

@implementation WFAddNewEventActionUIKitUserInterface

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

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  id v6 = a3;
  [v6 setEditViewDelegate:0];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __87__WFAddNewEventActionUIKitUserInterface_eventEditViewController_didCompleteWithAction___block_invoke;
  v8[3] = &unk_264900D80;
  v10 = self;
  int64_t v11 = a4;
  id v9 = v6;
  id v7 = v6;
  [v7 dismissViewControllerAnimated:1 completion:v8];
}

void __87__WFAddNewEventActionUIKitUserInterface_eventEditViewController_didCompleteWithAction___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) event];
  id v6 = v2;
  if (*(void *)(a1 + 48))
  {
    v3 = 0;
  }
  else
  {
    v3 = [MEMORY[0x263F087E8] userCancelledError];
    v2 = v6;
  }
  v4 = *(void **)(a1 + 40);
  v5 = [v2 eventIdentifier];
  [v4 finishWithEventIdentifier:v5 error:v3];
}

- (void)finishWithEventIdentifier:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(WFAddNewEventActionUIKitUserInterface *)self completionHandler];

  if (v7)
  {
    v8 = [(WFAddNewEventActionUIKitUserInterface *)self completionHandler];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
  [(WFAddNewEventActionUIKitUserInterface *)self setCompletionHandler:0];
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__WFAddNewEventActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v7[3] = &unk_264900EB0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)WFAddNewEventActionUIKitUserInterface;
  id v5 = v4;
  [(WFEmbeddableActionUserInterface *)&v6 cancelPresentationWithCompletionHandler:v7];
}

uint64_t __81__WFAddNewEventActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [MEMORY[0x263F087E8] userCancelledError];
  [v2 finishWithEventIdentifier:0 error:v3];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)showWithEventParameters:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFAddNewEventActionUIKitUserInterface.m", 24, @"Invalid parameter not satisfying: %@", @"eventParameters" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v13 = [MEMORY[0x263F08690] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"WFAddNewEventActionUIKitUserInterface.m", 25, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  [(WFAddNewEventActionUIKitUserInterface *)self setCompletionHandler:v9];
  id v17 = 0;
  v10 = [MEMORY[0x263F231E0] eventFromParameters:v7 requiringFullySpecifiedEvent:0 error:&v17];
  id v11 = v17;
  if (v11)
  {
    [(WFAddNewEventActionUIKitUserInterface *)self finishWithEventIdentifier:0 error:v11];
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __83__WFAddNewEventActionUIKitUserInterface_showWithEventParameters_completionHandler___block_invoke;
    block[3] = &unk_264900E88;
    id v15 = v10;
    v16 = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __83__WFAddNewEventActionUIKitUserInterface_showWithEventParameters_completionHandler___block_invoke(uint64_t a1)
{
  id v3 = objc_alloc_init(MEMORY[0x263F04C70]);
  v2 = WFGetWorkflowEventStore();
  [v3 setEventStore:v2];

  [v3 setEvent:*(void *)(a1 + 32)];
  [v3 setEditViewDelegate:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) presentContent:v3];
}

@end