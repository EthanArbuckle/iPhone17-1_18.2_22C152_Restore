@interface WFDictateTextActionUIKitUserInterface
- (BOOL)prefersModalPresentation;
- (WFDictateTextActionView)actionView;
- (id)completionHandler;
- (void)actionDidReceiveTranscription:(id)a3;
- (void)cancelPresentationWithCompletionHandler:(id)a3;
- (void)dictateTextActionViewDidTapStopButton:(id)a3;
- (void)dismissWithCompletionHandler:(id)a3;
- (void)finishWithError:(id)a3;
- (void)setActionView:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)showWithCompletionHandler:(id)a3;
@end

@implementation WFDictateTextActionUIKitUserInterface

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_actionView, 0);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setActionView:(id)a3
{
}

- (WFDictateTextActionView)actionView
{
  return self->_actionView;
}

- (void)dictateTextActionViewDidTapStopButton:(id)a3
{
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__WFDictateTextActionUIKitUserInterface_finishWithError___block_invoke;
  v6[3] = &unk_264900E88;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __57__WFDictateTextActionUIKitUserInterface_finishWithError___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __57__WFDictateTextActionUIKitUserInterface_finishWithError___block_invoke_2;
  v2[3] = &unk_2648FFC38;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 dismissWithCompletionHandler:v2];
}

uint64_t __57__WFDictateTextActionUIKitUserInterface_finishWithError___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) completionHandler];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) completionHandler];
    v3[2](v3, *(void *)(a1 + 40));
  }
  id v4 = *(void **)(a1 + 32);
  return [v4 setCompletionHandler:0];
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v4 = (void *)MEMORY[0x263F087E8];
  v6 = (void (**)(void))a3;
  id v5 = [v4 userCancelledError];
  [(WFDictateTextActionUIKitUserInterface *)self finishWithError:v5];

  v6[2]();
}

- (void)actionDidReceiveTranscription:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __71__WFDictateTextActionUIKitUserInterface_actionDidReceiveTranscription___block_invoke;
  v6[3] = &unk_264900E88;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __71__WFDictateTextActionUIKitUserInterface_actionDidReceiveTranscription___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) actionView];
  [v2 updateWithTranscription:*(void *)(a1 + 40)];
}

- (void)dismissWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__WFDictateTextActionUIKitUserInterface_dismissWithCompletionHandler___block_invoke;
  v6[3] = &unk_264900EB0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __70__WFDictateTextActionUIKitUserInterface_dismissWithCompletionHandler___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __70__WFDictateTextActionUIKitUserInterface_dismissWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_264900A58;
  v1 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  v2.receiver = v1;
  v2.super_class = (Class)WFDictateTextActionUIKitUserInterface;
  objc_msgSendSuper2(&v2, sel_cancelPresentationWithCompletionHandler_, v3);
}

uint64_t __70__WFDictateTextActionUIKitUserInterface_dismissWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)showWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__WFDictateTextActionUIKitUserInterface_showWithCompletionHandler___block_invoke;
  v6[3] = &unk_264900EB0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __67__WFDictateTextActionUIKitUserInterface_showWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCompletionHandler:*(void *)(a1 + 40)];
  objc_super v2 = [WFDictateTextActionView alloc];
  v6 = -[WFDictateTextActionView initWithFrame:padded:](v2, "initWithFrame:padded:", 1, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(WFDictateTextActionView *)v6 setDelegate:*(void *)(a1 + 32)];
  id v3 = [(WFDictateTextActionView *)v6 heightAnchor];
  id v4 = [v3 constraintEqualToConstant:220.0];
  [v4 setActive:1];

  id v5 = objc_alloc_init(MEMORY[0x263F82E10]);
  [v5 setView:v6];
  [*(id *)(a1 + 32) presentContent:v5];
  [*(id *)(a1 + 32) setActionView:v6];
}

- (BOOL)prefersModalPresentation
{
  return 0;
}

@end