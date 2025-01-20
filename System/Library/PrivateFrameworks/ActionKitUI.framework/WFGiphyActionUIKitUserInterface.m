@interface WFGiphyActionUIKitUserInterface
- (id)completionHandler;
- (void)cancelPresentationWithCompletionHandler:(id)a3;
- (void)finishWithContent:(id)a3 error:(id)a4;
- (void)giphyViewController:(id)a3 didSelectObjects:(id)a4;
- (void)giphyViewControllerDidCancel:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)showWithQuery:(id)a3 selectMultiple:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation WFGiphyActionUIKitUserInterface

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
  [(WFGiphyActionUIKitUserInterface *)self finishWithContent:0 error:v4];
}

- (void)giphyViewController:(id)a3 didSelectObjects:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __72__WFGiphyActionUIKitUserInterface_giphyViewController_didSelectObjects___block_invoke;
  v8[3] = &unk_264900E88;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [a3 dismissViewControllerAnimated:1 completion:v8];
}

uint64_t __72__WFGiphyActionUIKitUserInterface_giphyViewController_didSelectObjects___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithContent:*(void *)(a1 + 40) error:0];
}

- (void)giphyViewControllerDidCancel:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __64__WFGiphyActionUIKitUserInterface_giphyViewControllerDidCancel___block_invoke;
  v3[3] = &unk_264900E20;
  v3[4] = self;
  [a3 dismissViewControllerAnimated:1 completion:v3];
}

void __64__WFGiphyActionUIKitUserInterface_giphyViewControllerDidCancel___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] userCancelledError];
  [v1 finishWithContent:0 error:v2];
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__WFGiphyActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v7[3] = &unk_264900EB0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)WFGiphyActionUIKitUserInterface;
  id v5 = v4;
  [(WFEmbeddableActionUserInterface *)&v6 cancelPresentationWithCompletionHandler:v7];
}

uint64_t __75__WFGiphyActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3 = [MEMORY[0x263F087E8] userCancelledError];
  [v2 finishWithContent:0 error:v3];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)finishWithContent:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(WFGiphyActionUIKitUserInterface *)self completionHandler];

  if (v7)
  {
    id v8 = [(WFGiphyActionUIKitUserInterface *)self completionHandler];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
  [(WFGiphyActionUIKitUserInterface *)self setCompletionHandler:0];
}

- (void)showWithQuery:(id)a3 selectMultiple:(BOOL)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v11 = v10;
  if (!v9)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WFGiphyActionUIKitUserInterface.m", 24, @"Invalid parameter not satisfying: %@", @"query" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
LABEL_5:
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFGiphyActionUIKitUserInterface.m", 25, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  [(WFGiphyActionUIKitUserInterface *)self setCompletionHandler:v11];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__WFGiphyActionUIKitUserInterface_showWithQuery_selectMultiple_completionHandler___block_invoke;
  block[3] = &unk_264900CF0;
  BOOL v18 = a4;
  id v16 = v9;
  v17 = self;
  id v12 = v9;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __82__WFGiphyActionUIKitUserInterface_showWithQuery_selectMultiple_completionHandler___block_invoke(uint64_t a1)
{
  id v5 = [[WFGiphyViewController alloc] initWithQuery:*(void *)(a1 + 32) selectMultiple:*(unsigned __int8 *)(a1 + 48)];
  [(WFGiphyViewController *)v5 setDelegate:*(void *)(a1 + 40)];
  id v2 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v5];
  [v2 setModalPresentationStyle:2];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [v2 presentationController];
  [v4 setDelegate:v3];

  [*(id *)(a1 + 40) presentContent:v2];
}

@end