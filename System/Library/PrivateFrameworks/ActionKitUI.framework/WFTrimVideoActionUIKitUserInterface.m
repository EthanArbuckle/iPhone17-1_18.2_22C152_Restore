@interface WFTrimVideoActionUIKitUserInterface
- (BOOL)hasSaved;
- (WFFileRepresentation)copiedFile;
- (id)completionHandler;
- (id)copyFileToDealWithBadUIVideoEditorControllerSandboxHandling:(id)a3;
- (void)cancelPresentationWithCompletionHandler:(id)a3;
- (void)dismissEditor:(id)a3 completionHandler:(id)a4;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setCopiedFile:(id)a3;
- (void)setHasSaved:(BOOL)a3;
- (void)showWithVideo:(id)a3 completionHandler:(id)a4;
- (void)videoEditorController:(id)a3 didFailWithError:(id)a4;
- (void)videoEditorController:(id)a3 didSaveEditedVideoToPath:(id)a4;
- (void)videoEditorControllerDidCancel:(id)a3;
@end

@implementation WFTrimVideoActionUIKitUserInterface

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_copiedFile, 0);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setHasSaved:(BOOL)a3
{
  self->_hasSaved = a3;
}

- (BOOL)hasSaved
{
  return self->_hasSaved;
}

- (void)setCopiedFile:(id)a3
{
}

- (WFFileRepresentation)copiedFile
{
  return self->_copiedFile;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  objc_msgSend(MEMORY[0x263F087E8], "userCancelledError", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(WFTrimVideoActionUIKitUserInterface *)self finishWithResult:0 error:v4];
}

- (void)videoEditorController:(id)a3 didFailWithError:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __78__WFTrimVideoActionUIKitUserInterface_videoEditorController_didFailWithError___block_invoke;
  v8[3] = &unk_264900E88;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(WFTrimVideoActionUIKitUserInterface *)self dismissEditor:a3 completionHandler:v8];
}

uint64_t __78__WFTrimVideoActionUIKitUserInterface_videoEditorController_didFailWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:0 error:*(void *)(a1 + 40)];
}

- (void)videoEditorControllerDidCancel:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __70__WFTrimVideoActionUIKitUserInterface_videoEditorControllerDidCancel___block_invoke;
  v3[3] = &unk_264900E20;
  v3[4] = self;
  [(WFTrimVideoActionUIKitUserInterface *)self dismissEditor:a3 completionHandler:v3];
}

void __70__WFTrimVideoActionUIKitUserInterface_videoEditorControllerDidCancel___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] userCancelledError];
  [v1 finishWithResult:0 error:v2];
}

- (void)videoEditorController:(id)a3 didSaveEditedVideoToPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(WFTrimVideoActionUIKitUserInterface *)self hasSaved])
  {
    [(WFTrimVideoActionUIKitUserInterface *)self setHasSaved:1];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __86__WFTrimVideoActionUIKitUserInterface_videoEditorController_didSaveEditedVideoToPath___block_invoke;
    v8[3] = &unk_264900E88;
    id v9 = v7;
    v10 = self;
    [(WFTrimVideoActionUIKitUserInterface *)self dismissEditor:v6 completionHandler:v8];
  }
}

void __86__WFTrimVideoActionUIKitUserInterface_videoEditorController_didSaveEditedVideoToPath___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F08B18]);
  v3 = [NSURL fileURLWithPath:*(void *)(a1 + 32)];
  id v4 = (id)[v2 initWithURL:v3 readonly:1];

  [*(id *)(a1 + 40) finishWithResult:v4 error:0];
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(WFTrimVideoActionUIKitUserInterface *)self completionHandler];

  if (v7)
  {
    v8 = [(WFTrimVideoActionUIKitUserInterface *)self completionHandler];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
  [(WFTrimVideoActionUIKitUserInterface *)self setCompletionHandler:0];
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __79__WFTrimVideoActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v7[3] = &unk_264900EB0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)WFTrimVideoActionUIKitUserInterface;
  id v5 = v4;
  [(WFEmbeddableActionUserInterface *)&v6 cancelPresentationWithCompletionHandler:v7];
}

uint64_t __79__WFTrimVideoActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3 = [MEMORY[0x263F087E8] userCancelledError];
  [v2 finishWithResult:0 error:v3];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)dismissEditor:(id)a3 completionHandler:(id)a4
{
}

- (void)showWithVideo:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFTrimVideoActionUIKitUserInterface.m", 33, @"Invalid parameter not satisfying: %@", @"fileRepresentation" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WFTrimVideoActionUIKitUserInterface.m", 34, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  [(WFTrimVideoActionUIKitUserInterface *)self setCompletionHandler:v9];
  id v10 = [(WFTrimVideoActionUIKitUserInterface *)self copyFileToDealWithBadUIVideoEditorControllerSandboxHandling:v7];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__WFTrimVideoActionUIKitUserInterface_showWithVideo_completionHandler___block_invoke;
  block[3] = &unk_264900E88;
  id v15 = v10;
  v16 = self;
  id v11 = v10;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __71__WFTrimVideoActionUIKitUserInterface_showWithVideo_completionHandler___block_invoke(uint64_t a1)
{
  id v10 = objc_alloc_init(MEMORY[0x263F82DF8]);
  [v10 setVideoPath:*(void *)(a1 + 32)];
  [v10 setDelegate:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) setHasSaved:0];
  id v2 = [*(id *)(a1 + 40) viewControllerForPresenting];
  [v10 setModalPresentationStyle:7];
  v3 = [v10 popoverPresentationController];
  id v4 = [v2 view];
  [v3 setSourceView:v4];

  id v5 = [v2 view];
  [v5 frame];
  double v7 = v6 * 0.5;
  id v8 = [v2 view];
  [v8 layoutMargins];
  objc_msgSend(v3, "setSourceRect:", v7, v9, 0.0, 0.0);

  [v3 setDelegate:*(void *)(a1 + 40)];
  [v2 presentViewController:v10 animated:1 completion:0];
}

- (id)copyFileToDealWithBadUIVideoEditorControllerSandboxHandling:(id)a3
{
  id v4 = (void *)MEMORY[0x263F33870];
  id v5 = [a3 url];
  double v6 = [v4 fileWithURL:v5 options:13];
  [(WFTrimVideoActionUIKitUserInterface *)self setCopiedFile:v6];

  double v7 = [(WFTrimVideoActionUIKitUserInterface *)self copiedFile];
  id v8 = [v7 fileURL];
  double v9 = [v8 path];

  return v9;
}

@end