@interface WFShowWebPageActionUIKitUserInterface
- (WFFileRepresentation)richTextFile;
- (id)completionHandler;
- (void)cancelPresentationWithCompletionHandler:(id)a3;
- (void)finishWithError:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)safariViewControllerDidFinish:(id)a3;
- (void)safariViewControllerWillOpenInBrowser:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setRichTextFile:(id)a3;
- (void)showRichText:(id)a3 completion:(id)a4;
- (void)showURL:(id)a3 readerView:(BOOL)a4 completion:(id)a5;
- (void)webViewControllerDidFinish:(id)a3;
@end

@implementation WFShowWebPageActionUIKitUserInterface

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_richTextFile, 0);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setRichTextFile:(id)a3
{
}

- (WFFileRepresentation)richTextFile
{
  return self->_richTextFile;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  objc_msgSend(MEMORY[0x263F087E8], "userCancelledError", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(WFShowWebPageActionUIKitUserInterface *)self finishWithError:v4];
}

- (void)webViewControllerDidFinish:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __68__WFShowWebPageActionUIKitUserInterface_webViewControllerDidFinish___block_invoke;
  v3[3] = &unk_264900E20;
  v3[4] = self;
  [a3 dismissViewControllerAnimated:1 completion:v3];
}

uint64_t __68__WFShowWebPageActionUIKitUserInterface_webViewControllerDidFinish___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithError:0];
}

- (void)safariViewControllerWillOpenInBrowser:(id)a3
{
  objc_msgSend(MEMORY[0x263EFF910], "timeIntervalSinceReferenceDate", a3);
  lastDismissed = v4;
  [(WFShowWebPageActionUIKitUserInterface *)self finishWithError:0];
}

- (void)safariViewControllerDidFinish:(id)a3
{
  objc_msgSend(MEMORY[0x263EFF910], "timeIntervalSinceReferenceDate", a3);
  lastDismissed = v4;
  [(WFShowWebPageActionUIKitUserInterface *)self finishWithError:0];
}

- (void)finishWithError:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(WFShowWebPageActionUIKitUserInterface *)self completionHandler];

  if (v4)
  {
    v5 = [(WFShowWebPageActionUIKitUserInterface *)self completionHandler];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
  [(WFShowWebPageActionUIKitUserInterface *)self setCompletionHandler:0];
  [(WFShowWebPageActionUIKitUserInterface *)self setRichTextFile:0];
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__WFShowWebPageActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v7[3] = &unk_264900EB0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)WFShowWebPageActionUIKitUserInterface;
  id v5 = v4;
  [(WFEmbeddableActionUserInterface *)&v6 cancelPresentationWithCompletionHandler:v7];
}

uint64_t __81__WFShowWebPageActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [MEMORY[0x263F087E8] userCancelledError];
  [v2 finishWithError:v3];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)showRichText:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFShowWebPageActionUIKitUserInterface.m", 71, @"Invalid parameter not satisfying: %@", @"file" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFShowWebPageActionUIKitUserInterface.m", 72, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  [(WFShowWebPageActionUIKitUserInterface *)self setRichTextFile:v7];
  [(WFShowWebPageActionUIKitUserInterface *)self setCompletionHandler:v9];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__WFShowWebPageActionUIKitUserInterface_showRichText_completion___block_invoke;
  block[3] = &unk_264900E88;
  id v14 = v7;
  v15 = self;
  id v10 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __65__WFShowWebPageActionUIKitUserInterface_showRichText_completion___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F339F0] webResourceWithFile:*(void *)(a1 + 32)];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2050000000;
  v3 = (void *)getWKWebViewClass_softClass;
  uint64_t v23 = getWKWebViewClass_softClass;
  if (!getWKWebViewClass_softClass)
  {
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __getWKWebViewClass_block_invoke;
    v18 = &unk_264900EF8;
    v19 = &v20;
    __getWKWebViewClass_block_invoke((uint64_t)&v15);
    v3 = (void *)v21[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v20, 8);
  id v5 = [v4 alloc];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2050000000;
  objc_super v6 = (void *)getWKWebViewConfigurationClass_softClass;
  uint64_t v23 = getWKWebViewConfigurationClass_softClass;
  if (!getWKWebViewConfigurationClass_softClass)
  {
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __getWKWebViewConfigurationClass_block_invoke;
    v18 = &unk_264900EF8;
    v19 = &v20;
    __getWKWebViewConfigurationClass_block_invoke((uint64_t)&v15);
    objc_super v6 = (void *)v21[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v20, 8);
  id v8 = objc_opt_new();
  v9 = objc_msgSend(v5, "initWithFrame:configuration:", v8, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));

  id v10 = (id)[v2 loadInWKWebView:v9];
  v11 = [[WFWebViewController alloc] initWithWebView:v9];
  [(WFWebViewController *)v11 setDelegate:*(void *)(a1 + 40)];
  v12 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v11];
  uint64_t v13 = *(void *)(a1 + 40);
  id v14 = [v12 presentationController];
  [v14 setDelegate:v13];

  [*(id *)(a1 + 40) presentContent:v12];
}

- (void)showURL:(id)a3 readerView:(BOOL)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v11 = v10;
  if (!v9)
  {
    uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WFShowWebPageActionUIKitUserInterface.m", 39, @"Invalid parameter not satisfying: %@", @"URL" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
LABEL_5:
    id v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFShowWebPageActionUIKitUserInterface.m", 40, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  [(WFShowWebPageActionUIKitUserInterface *)self setCompletionHandler:v11];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__WFShowWebPageActionUIKitUserInterface_showURL_readerView_completion___block_invoke;
  block[3] = &unk_264900CF0;
  BOOL v18 = a4;
  id v16 = v9;
  v17 = self;
  id v12 = v9;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __71__WFShowWebPageActionUIKitUserInterface_showURL_readerView_completion___block_invoke(uint64_t a1)
{
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  if (v2 - *(double *)&lastDismissed >= 0.55 || *(double *)&lastDismissed == 0.0) {
    int64_t v4 = 0;
  }
  else {
    int64_t v4 = 550000000;
  }
  dispatch_time_t v5 = dispatch_time(0, v4);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__WFShowWebPageActionUIKitUserInterface_showURL_readerView_completion___block_invoke_2;
  block[3] = &unk_264900CF0;
  char v11 = *(unsigned char *)(a1 + 48);
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v9 = v6;
  uint64_t v10 = v7;
  dispatch_after(v5, MEMORY[0x263EF83A0], block);
}

void __71__WFShowWebPageActionUIKitUserInterface_showURL_readerView_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2050000000;
  double v2 = (void *)getSFSafariViewControllerConfigurationClass_softClass;
  uint64_t v18 = getSFSafariViewControllerConfigurationClass_softClass;
  if (!getSFSafariViewControllerConfigurationClass_softClass)
  {
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    id v12 = __getSFSafariViewControllerConfigurationClass_block_invoke;
    uint64_t v13 = &unk_264900EF8;
    id v14 = &v15;
    __getSFSafariViewControllerConfigurationClass_block_invoke((uint64_t)&v10);
    double v2 = (void *)v16[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v15, 8);
  int64_t v4 = objc_opt_new();
  [v4 setEntersReaderIfAvailable:*(unsigned __int8 *)(a1 + 48)];
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2050000000;
  dispatch_time_t v5 = (void *)getSFSafariViewControllerClass_softClass;
  uint64_t v18 = getSFSafariViewControllerClass_softClass;
  if (!getSFSafariViewControllerClass_softClass)
  {
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    id v12 = __getSFSafariViewControllerClass_block_invoke;
    uint64_t v13 = &unk_264900EF8;
    id v14 = &v15;
    __getSFSafariViewControllerClass_block_invoke((uint64_t)&v10);
    dispatch_time_t v5 = (void *)v16[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v15, 8);
  uint64_t v7 = (void *)[[v6 alloc] initWithURL:*(void *)(a1 + 32) configuration:v4];
  [v7 setModalPresentationStyle:1];
  [v7 setDelegate:*(void *)(a1 + 40)];
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = [v7 presentationController];
  [v9 setDelegate:v8];

  [*(id *)(a1 + 40) presentContent:v7];
}

@end