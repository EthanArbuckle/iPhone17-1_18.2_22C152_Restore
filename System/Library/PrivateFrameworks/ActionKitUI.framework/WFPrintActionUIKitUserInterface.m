@interface WFPrintActionUIKitUserInterface
- (UIPrintInteractionController)printController;
- (id)completionHandler;
- (void)cancelPresentationWithCompletionHandler:(id)a3;
- (void)finishWithError:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setPrintController:(id)a3;
- (void)showWithFile:(id)a3 completionHandler:(id)a4;
@end

@implementation WFPrintActionUIKitUserInterface

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_printController, 0);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setPrintController:(id)a3
{
}

- (UIPrintInteractionController)printController
{
  return self->_printController;
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__WFPrintActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v7[3] = &unk_264900EB0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)WFPrintActionUIKitUserInterface;
  id v5 = v4;
  [(WFActionUserInterface *)&v6 cancelPresentationWithCompletionHandler:v7];
}

uint64_t __75__WFPrintActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) printController];
  [v2 dismissAnimated:1];

  v3 = *(void **)(a1 + 32);
  id v4 = [MEMORY[0x263F087E8] userCancelledError];
  [v3 finishWithError:v4];

  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v5();
}

- (void)finishWithError:(id)a3
{
  id v6 = a3;
  id v4 = [(WFPrintActionUIKitUserInterface *)self completionHandler];

  if (v4)
  {
    id v5 = [(WFPrintActionUIKitUserInterface *)self completionHandler];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
  [(WFPrintActionUIKitUserInterface *)self setCompletionHandler:0];
  [(WFPrintActionUIKitUserInterface *)self setPrintController:0];
}

- (void)showWithFile:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFPrintActionUIKitUserInterface.m", 24, @"Invalid parameter not satisfying: %@", @"file" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFPrintActionUIKitUserInterface.m", 25, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  [(WFPrintActionUIKitUserInterface *)self setCompletionHandler:v9];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__WFPrintActionUIKitUserInterface_showWithFile_completionHandler___block_invoke;
  block[3] = &unk_264900E88;
  block[4] = self;
  id v14 = v7;
  id v10 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __66__WFPrintActionUIKitUserInterface_showWithFile_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F61090] sharedPrintController];
  [v2 setDelegate:*(void *)(a1 + 32)];
  uint64_t v3 = [*(id *)(a1 + 40) representationType];
  id v4 = *(void **)(a1 + 40);
  if (v3) {
    [v4 fileURL];
  }
  else {
  id v5 = [v4 data];
  }
  [v2 setPrintingItem:v5];

  id v6 = [*(id *)(a1 + 32) viewControllerForPresenting];
  id v7 = [v6 view];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [v6 view];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __66__WFPrintActionUIKitUserInterface_showWithFile_completionHandler___block_invoke_2;
  v17[3] = &unk_2648FFF38;
  v17[4] = *(void *)(a1 + 32);
  objc_msgSend(v2, "presentFromRect:inView:animated:completionHandler:", v16, 1, v17, v9, v11, v13, v15);

  [*(id *)(a1 + 32) setPrintController:v2];
}

uint64_t __66__WFPrintActionUIKitUserInterface_showWithFile_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) finishWithError:a4];
}

@end