@interface WFShowDefinitionActionUIKitUserInterface
- (id)completionHandler;
- (void)cancelPresentationWithCompletionHandler:(id)a3;
- (void)finishWithError:(id)a3;
- (void)libraryControllerDidDismiss:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)showWithString:(id)a3 completionHandler:(id)a4;
@end

@implementation WFShowDefinitionActionUIKitUserInterface

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
  [(WFShowDefinitionActionUIKitUserInterface *)self finishWithError:v4];
}

- (void)libraryControllerDidDismiss:(id)a3
{
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __84__WFShowDefinitionActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v7[3] = &unk_264900EB0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)WFShowDefinitionActionUIKitUserInterface;
  id v5 = v4;
  [(WFEmbeddableActionUserInterface *)&v6 cancelPresentationWithCompletionHandler:v7];
}

uint64_t __84__WFShowDefinitionActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
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
  id v4 = [(WFShowDefinitionActionUIKitUserInterface *)self completionHandler];

  if (v4)
  {
    id v5 = [(WFShowDefinitionActionUIKitUserInterface *)self completionHandler];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
  [(WFShowDefinitionActionUIKitUserInterface *)self setCompletionHandler:0];
}

- (void)showWithString:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFShowDefinitionActionUIKitUserInterface.m", 26, @"Invalid parameter not satisfying: %@", @"string" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFShowDefinitionActionUIKitUserInterface.m", 27, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  [(WFShowDefinitionActionUIKitUserInterface *)self setCompletionHandler:v9];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__WFShowDefinitionActionUIKitUserInterface_showWithString_completionHandler___block_invoke;
  block[3] = &unk_264900E88;
  id v14 = v7;
  v15 = self;
  id v10 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __77__WFShowDefinitionActionUIKitUserInterface_showWithString_completionHandler___block_invoke(uint64_t a1)
{
  v12[2] = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F82AF8] dictionaryHasDefinitionForTerm:*(void *)(a1 + 32)])
  {
    id v10 = [(UIReferenceLibraryViewController *)[WFReferenceLibraryViewController alloc] initWithTerm:*(void *)(a1 + 32)];
    [(WFReferenceLibraryViewController *)v10 setDelegate:*(void *)(a1 + 40)];
    [(WFReferenceLibraryViewController *)v10 setModalPresentationStyle:1];
    uint64_t v2 = *(void *)(a1 + 40);
    v3 = [(WFReferenceLibraryViewController *)v10 presentationController];
    [v3 setDelegate:v2];

    [*(id *)(a1 + 40) presentContent:v10];
  }
  else
  {
    id v4 = (void *)MEMORY[0x263F087E8];
    uint64_t v5 = *MEMORY[0x263F870B8];
    v11[0] = *MEMORY[0x263F08338];
    id v6 = WFLocalizedString(@"A definition could not be found for that term.");
    v12[0] = v6;
    v11[1] = *MEMORY[0x263F08320];
    id v7 = WFLocalizedString(@"This may happen if no dictionaries are installed. To manage your dictionaries, select a word in any app and choose “Look Up”. Then, tap “Manage”.");
    v12[1] = v7;
    id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
    v9 = [v4 errorWithDomain:v5 code:6 userInfo:v8];

    [*(id *)(a1 + 40) finishWithError:v9];
  }
}

@end