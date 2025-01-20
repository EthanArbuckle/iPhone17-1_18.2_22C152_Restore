@interface WFAddNewContactActionUIKitUserInterface
- (id)completionHandler;
- (void)cancelPresentationWithCompletionHandler:(id)a3;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)finishWithContactIdentifier:(id)a3 error:(id)a4;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)showWithContactParameters:(id)a3 completionHandler:(id)a4;
@end

@implementation WFAddNewContactActionUIKitUserInterface

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
  objc_msgSend(MEMORY[0x263F087E8], "userCancelledError", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(WFAddNewContactActionUIKitUserInterface *)self finishWithContactIdentifier:0 error:v4];
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__WFAddNewContactActionUIKitUserInterface_contactViewController_didCompleteWithContact___block_invoke;
  block[3] = &unk_264900940;
  id v11 = v6;
  id v12 = v7;
  v13 = self;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __88__WFAddNewContactActionUIKitUserInterface_contactViewController_didCompleteWithContact___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __88__WFAddNewContactActionUIKitUserInterface_contactViewController_didCompleteWithContact___block_invoke_2;
  v5[3] = &unk_264900940;
  id v6 = v2;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v7 = v3;
  uint64_t v8 = v4;
  [v6 dismissViewControllerAnimated:1 completion:v5];
}

void __88__WFAddNewContactActionUIKitUserInterface_contactViewController_didCompleteWithContact___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:0];
  v2 = *(void **)(a1 + 40);
  id v3 = *(void **)(a1 + 48);
  if (v2)
  {
    uint64_t v4 = [v2 identifier];
    v5 = v3;
    id v7 = (id)v4;
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [MEMORY[0x263F087E8] userCancelledError];
    v5 = v3;
    uint64_t v4 = 0;
    id v7 = (id)v6;
  }
  [v5 finishWithContactIdentifier:v4 error:v6];
}

- (void)finishWithContactIdentifier:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(WFAddNewContactActionUIKitUserInterface *)self completionHandler];

  if (v7)
  {
    uint64_t v8 = [(WFAddNewContactActionUIKitUserInterface *)self completionHandler];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
  [(WFAddNewContactActionUIKitUserInterface *)self setCompletionHandler:0];
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __83__WFAddNewContactActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v7[3] = &unk_264900EB0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)WFAddNewContactActionUIKitUserInterface;
  id v5 = v4;
  [(WFEmbeddableActionUserInterface *)&v6 cancelPresentationWithCompletionHandler:v7];
}

uint64_t __83__WFAddNewContactActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x263F087E8] userCancelledError];
  [v2 finishWithContactIdentifier:0 error:v3];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)showWithContactParameters:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"WFAddNewContactActionUIKitUserInterface.m", 29, @"Invalid parameter not satisfying: %@", @"contactParameters" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    id v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFAddNewContactActionUIKitUserInterface.m", 30, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  [(WFAddNewContactActionUIKitUserInterface *)self setCompletionHandler:v9];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __87__WFAddNewContactActionUIKitUserInterface_showWithContactParameters_completionHandler___block_invoke;
  v12[3] = &unk_264900810;
  v12[4] = self;
  [MEMORY[0x263F231D8] contactFromParameters:v7 completionHandler:v12];
}

void __87__WFAddNewContactActionUIKitUserInterface_showWithContactParameters_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __87__WFAddNewContactActionUIKitUserInterface_showWithContactParameters_completionHandler___block_invoke_2;
  v6[3] = &unk_264900E88;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __87__WFAddNewContactActionUIKitUserInterface_showWithContactParameters_completionHandler___block_invoke_2(uint64_t a1)
{
  id v5 = [MEMORY[0x263EFEBF8] viewControllerForNewContact:*(void *)(a1 + 32)];
  [v5 setDelegate:*(void *)(a1 + 40)];
  v2 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v5];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [v2 presentationController];
  [v4 setDelegate:v3];

  [*(id *)(a1 + 40) presentContent:v2];
}

@end