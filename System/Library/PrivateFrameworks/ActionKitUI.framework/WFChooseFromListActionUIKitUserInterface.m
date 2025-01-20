@interface WFChooseFromListActionUIKitUserInterface
- (id)completionHandler;
- (void)cancelPresentationWithCompletionHandler:(id)a3;
- (void)chooseImageController:(id)a3 didSelectItems:(id)a4;
- (void)chooseImageControllerDidCancel:(id)a3;
- (void)finishWithContent:(id)a3 error:(id)a4;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)showImagesWithPrompt:(id)a3 canSelectAll:(BOOL)a4 canSelectMultiple:(BOOL)a5 inputItems:(id)a6 completionHandler:(id)a7;
@end

@implementation WFChooseFromListActionUIKitUserInterface

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
  [(WFChooseFromListActionUIKitUserInterface *)self finishWithContent:0 error:v4];
}

- (void)chooseImageControllerDidCancel:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __75__WFChooseFromListActionUIKitUserInterface_chooseImageControllerDidCancel___block_invoke;
  v3[3] = &unk_264900E20;
  v3[4] = self;
  [a3 dismissViewControllerAnimated:1 completion:v3];
}

void __75__WFChooseFromListActionUIKitUserInterface_chooseImageControllerDidCancel___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] userCancelledError];
  [v1 finishWithContent:0 error:v2];
}

- (void)chooseImageController:(id)a3 didSelectItems:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __81__WFChooseFromListActionUIKitUserInterface_chooseImageController_didSelectItems___block_invoke;
  v8[3] = &unk_264900E88;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [a3 dismissViewControllerAnimated:1 completion:v8];
}

uint64_t __81__WFChooseFromListActionUIKitUserInterface_chooseImageController_didSelectItems___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithContent:*(void *)(a1 + 40) error:0];
}

- (void)finishWithContent:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(WFChooseFromListActionUIKitUserInterface *)self completionHandler];

  if (v7)
  {
    v8 = [(WFChooseFromListActionUIKitUserInterface *)self completionHandler];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
  [(WFChooseFromListActionUIKitUserInterface *)self setCompletionHandler:0];
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __84__WFChooseFromListActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v7[3] = &unk_264900EB0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)WFChooseFromListActionUIKitUserInterface;
  id v5 = v4;
  [(WFEmbeddableActionUserInterface *)&v6 cancelPresentationWithCompletionHandler:v7];
}

uint64_t __84__WFChooseFromListActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3 = [MEMORY[0x263F087E8] userCancelledError];
  [v2 finishWithContent:0 error:v3];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)showImagesWithPrompt:(id)a3 canSelectAll:(BOOL)a4 canSelectMultiple:(BOOL)a5 inputItems:(id)a6 completionHandler:(id)a7
{
  BOOL v10 = a4;
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  if (!v15)
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"WFChooseFromListActionUIKitUserInterface.m", 24, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  [(WFChooseFromListActionUIKitUserInterface *)self setCompletionHandler:v15];
  v16 = (void *)MEMORY[0x263F088D0];
  if (v10 && a5)
  {
    v17 = [v14 items];
    v18 = objc_msgSend(v16, "indexSetWithIndexesInRange:", 0, objc_msgSend(v17, "count"));
  }
  else
  {
    v18 = objc_opt_new();
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __125__WFChooseFromListActionUIKitUserInterface_showImagesWithPrompt_canSelectAll_canSelectMultiple_inputItems_completionHandler___block_invoke;
  block[3] = &unk_264900878;
  id v24 = v14;
  id v25 = v18;
  BOOL v28 = a5;
  v26 = self;
  id v27 = v13;
  id v19 = v13;
  id v20 = v18;
  id v21 = v14;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __125__WFChooseFromListActionUIKitUserInterface_showImagesWithPrompt_canSelectAll_canSelectMultiple_inputItems_completionHandler___block_invoke(uint64_t a1)
{
  id v7 = [[WFChooseImageViewController alloc] initWithCollection:*(void *)(a1 + 32) selectedIndexes:*(void *)(a1 + 40)];
  [(WFChooseImageViewController *)v7 setDelegate:*(void *)(a1 + 48)];
  [(WFChooseImageViewController *)v7 setMaximumNumberOfItems:*(unsigned char *)(a1 + 64) == 0];
  uint64_t v2 = *(void *)(a1 + 56);
  v3 = [(WFChooseImageViewController *)v7 navigationItem];
  [v3 setPrompt:v2];

  id v4 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v7];
  [v4 setModalPresentationStyle:1];
  uint64_t v5 = *(void *)(a1 + 48);
  objc_super v6 = [v4 presentationController];
  [v6 setDelegate:v5];

  [*(id *)(a1 + 48) presentContent:v4];
}

@end