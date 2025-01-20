@interface WFOpenInActionUIKitUserInterface
- (UIDocumentInteractionController)documentController;
- (id)completionHandler;
- (id)excludedActivityTypesForDocumentInteractionController:(id)a3;
- (void)cancelPresentationWithCompletionHandler:(id)a3;
- (void)documentInteractionControllerDidDismissOpenInMenu:(id)a3;
- (void)finishWithError:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDocumentController:(id)a3;
- (void)showWithFile:(id)a3 contentManaged:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation WFOpenInActionUIKitUserInterface

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentController, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

- (void)setDocumentController:(id)a3
{
}

- (UIDocumentInteractionController)documentController
{
  return self->_documentController;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (id)excludedActivityTypesForDocumentInteractionController:(id)a3
{
  v5[1] = *MEMORY[0x263EF8340];
  v5[0] = *MEMORY[0x263F6BCD8];
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  return v3;
}

- (void)documentInteractionControllerDidDismissOpenInMenu:(id)a3
{
  [(WFOpenInActionUIKitUserInterface *)self setDocumentController:0];
  [(WFOpenInActionUIKitUserInterface *)self finishWithError:0];
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __76__WFOpenInActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v7[3] = &unk_264900EB0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)WFOpenInActionUIKitUserInterface;
  id v5 = v4;
  [(WFActionUserInterface *)&v6 cancelPresentationWithCompletionHandler:v7];
}

uint64_t __76__WFOpenInActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [MEMORY[0x263F087E8] userCancelledError];
  [v2 finishWithError:v3];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)finishWithError:(id)a3
{
  id v6 = a3;
  id v4 = [(WFOpenInActionUIKitUserInterface *)self completionHandler];

  if (v4)
  {
    id v5 = [(WFOpenInActionUIKitUserInterface *)self completionHandler];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
  [(WFOpenInActionUIKitUserInterface *)self setCompletionHandler:0];
}

- (void)showWithFile:(id)a3 contentManaged:(BOOL)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v11 = v10;
  if (!v9)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WFOpenInActionUIKitUserInterface.m", 27, @"Invalid parameter not satisfying: %@", @"file" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
LABEL_5:
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFOpenInActionUIKitUserInterface.m", 28, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  [(WFOpenInActionUIKitUserInterface *)self setCompletionHandler:v11];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__WFOpenInActionUIKitUserInterface_showWithFile_contentManaged_completionHandler___block_invoke;
  block[3] = &unk_264900CF0;
  id v16 = v9;
  v17 = self;
  BOOL v18 = a4;
  id v12 = v9;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __82__WFOpenInActionUIKitUserInterface_showWithFile_contentManaged_completionHandler___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F6BCB0];
  v3 = [*(id *)(a1 + 32) wrappedURL];
  id v4 = [v3 url];
  id v18 = [v2 interactionControllerWithURL:v4];

  [v18 setDelegate:*(void *)(a1 + 40)];
  [v18 setIsContentManaged:*(unsigned __int8 *)(a1 + 48)];
  id v5 = [*(id *)(a1 + 40) viewControllerForPresenting];
  id v6 = [v5 view];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = [v5 view];
  char v16 = objc_msgSend(v18, "presentOpenInMenuFromRect:inView:animated:", v15, 1, v8, v10, v12, v14);

  v17 = *(void **)(a1 + 40);
  if (v16) {
    [v17 setDocumentController:v18];
  }
  else {
    [v17 finishWithError:0];
  }
}

@end