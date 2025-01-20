@interface WFOverlayImageActionUIKitUserInterface
- (id)completionHandler;
- (void)cancelPresentationWithCompletionHandler:(id)a3;
- (void)finishWithFileRepresentations:(id)a3 error:(id)a4;
- (void)setCompletionHandler:(id)a3;
- (void)showWithOverlayImage:(id)a3 images:(id)a4 completionHandler:(id)a5;
@end

@implementation WFOverlayImageActionUIKitUserInterface

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

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __82__WFOverlayImageActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v7[3] = &unk_264900EB0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)WFOverlayImageActionUIKitUserInterface;
  id v5 = v4;
  [(WFEmbeddableActionUserInterface *)&v6 cancelPresentationWithCompletionHandler:v7];
}

uint64_t __82__WFOverlayImageActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [MEMORY[0x263F087E8] userCancelledError];
  [v2 finishWithFileRepresentations:0 error:v3];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)finishWithFileRepresentations:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(WFOverlayImageActionUIKitUserInterface *)self completionHandler];

  if (v7)
  {
    id v8 = [(WFOverlayImageActionUIKitUserInterface *)self completionHandler];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
  [(WFOverlayImageActionUIKitUserInterface *)self setCompletionHandler:0];
}

- (void)showWithOverlayImage:(id)a3 images:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_6:
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WFOverlayImageActionUIKitUserInterface.m", 25, @"Invalid parameter not satisfying: %@", @"images" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
LABEL_7:
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFOverlayImageActionUIKitUserInterface.m", 26, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_4;
  }
  v14 = [MEMORY[0x263F08690] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"WFOverlayImageActionUIKitUserInterface.m", 24, @"Invalid parameter not satisfying: %@", @"image" object file lineNumber description];

  if (!v10) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v11) {
    goto LABEL_7;
  }
LABEL_4:
  [(WFOverlayImageActionUIKitUserInterface *)self setCompletionHandler:v11];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__WFOverlayImageActionUIKitUserInterface_showWithOverlayImage_images_completionHandler___block_invoke;
  block[3] = &unk_264900940;
  id v18 = v10;
  id v19 = v9;
  v20 = self;
  id v12 = v9;
  id v13 = v10;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __88__WFOverlayImageActionUIKitUserInterface_showWithOverlayImage_images_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [WFOverlayImageEditorViewController alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __88__WFOverlayImageActionUIKitUserInterface_showWithOverlayImage_images_completionHandler___block_invoke_2;
  v6[3] = &unk_264900FC8;
  v6[4] = *(void *)(a1 + 48);
  id v5 = [(WFOverlayImageEditorViewController *)v2 initWithFileRepresentations:v3 overlayImage:v4 completionHandler:v6];
  [*(id *)(a1 + 48) presentContent:v5];
}

uint64_t __88__WFOverlayImageActionUIKitUserInterface_showWithOverlayImage_images_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithFileRepresentations:a2 error:a3];
}

@end