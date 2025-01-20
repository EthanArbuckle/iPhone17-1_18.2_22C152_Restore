@interface DCMarkupPresenter
+ (void)markupDocumentInfo:(id)a3 imageCache:(id)a4 fromView:(id)a5 presentingViewController:(id)a6 inkStyle:(unint64_t)a7 frameBlock:(id)a8 startPresentBlock:(id)a9 completionBlock:(id)a10 dismissCompletionBlock:(id)a11;
- (ICDocCamDocumentInfo)documentInfo;
- (ICDocCamImageCache)imageCache;
- (MURemoteViewController)markupRemoteViewController;
- (MarkupViewController)markupViewController;
- (UIViewController)presentingViewController;
- (id)completionBlock;
- (id)dismissCompletionBlock;
- (id)frameBlock;
- (id)startPresentBlock;
- (unint64_t)inkStyle;
- (void)dismissMarkupViewController;
- (void)handleReturnedURL:(id)a3;
- (void)markupDoneAction:(id)a3;
- (void)presentMarkupViewControllerFromView:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setDismissCompletionBlock:(id)a3;
- (void)setDocumentInfo:(id)a3;
- (void)setFrameBlock:(id)a3;
- (void)setImageCache:(id)a3;
- (void)setInkStyle:(unint64_t)a3;
- (void)setMarkupRemoteViewController:(id)a3;
- (void)setMarkupViewController:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setStartPresentBlock:(id)a3;
@end

@implementation DCMarkupPresenter

+ (void)markupDocumentInfo:(id)a3 imageCache:(id)a4 fromView:(id)a5 presentingViewController:(id)a6 inkStyle:(unint64_t)a7 frameBlock:(id)a8 startPresentBlock:(id)a9 completionBlock:(id)a10 dismissCompletionBlock:(id)a11
{
  id v26 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  v23 = (void *)currentMarkupPresenter;
  if (!currentMarkupPresenter)
  {
    v24 = objc_alloc_init(DCMarkupPresenter);
    v25 = (void *)currentMarkupPresenter;
    currentMarkupPresenter = (uint64_t)v24;

    v23 = (void *)currentMarkupPresenter;
  }
  [v23 setDocumentInfo:v26];
  [(id)currentMarkupPresenter setImageCache:v16];
  [(id)currentMarkupPresenter setPresentingViewController:v18];
  [(id)currentMarkupPresenter setInkStyle:a7];
  [(id)currentMarkupPresenter setFrameBlock:v19];
  [(id)currentMarkupPresenter setStartPresentBlock:v20];
  [(id)currentMarkupPresenter setCompletionBlock:v21];
  [(id)currentMarkupPresenter setDismissCompletionBlock:v22];
  [(id)currentMarkupPresenter presentMarkupFromView:v17];
}

- (void)markupDoneAction:(id)a3
{
  v4 = [(DCMarkupPresenter *)self markupViewController];
  v5 = [v4 createArchivedModelData];

  if (v5)
  {
    v6 = [(DCMarkupPresenter *)self markupViewController];
    v7 = [v6 dataRepresentationEmbeddingSourceImageAndEditModel:0 error:0];

    v8 = [(DCMarkupPresenter *)self documentInfo];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __38__DCMarkupPresenter_markupDoneAction___block_invoke;
    v12[3] = &unk_2642A9360;
    v12[4] = self;
    id v13 = v7;
    id v9 = v7;
    +[DCMarkupUtilities applyMarkupModelData:v5 documentInfo:v8 completionBlock:v12];
  }
  else
  {
    v10 = [(DCMarkupPresenter *)self completionBlock];

    if (v10)
    {
      v11 = [(DCMarkupPresenter *)self completionBlock];
      v11[2](v11, 0);
    }
    [(DCMarkupPresenter *)self dismissMarkupViewController];
  }
}

uint64_t __38__DCMarkupPresenter_markupDoneAction___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) completionBlock];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) completionBlock];
    v3[2](v3, *(void *)(a1 + 40));
  }
  v4 = *(void **)(a1 + 32);

  return [v4 dismissMarkupViewController];
}

- (void)dismissMarkupViewController
{
  id v6 = [(DCMarkupPresenter *)self dismissCompletionBlock];
  [(DCMarkupPresenter *)self setDismissCompletionBlock:0];
  [(DCMarkupPresenter *)self setMarkupViewController:0];
  v3 = (void *)currentMarkupPresenter;
  currentMarkupPresenter = 0;

  v4 = [(DCMarkupPresenter *)self presentingViewController];
  v5 = [v4 presentedViewController];
  [v5 dismissViewControllerAnimated:1 completion:v6];
}

- (void)presentMarkupViewControllerFromView:(id)a3
{
  v4 = +[DCMarkupUtilities createMarkupViewController];
  objc_msgSend(v4, "setInkStyle:", -[DCMarkupPresenter inkStyle](self, "inkStyle"));
  v5 = [(DCMarkupPresenter *)self documentInfo];
  id v6 = [(DCMarkupPresenter *)self imageCache];
  v7 = [v5 markupModelData];
  v8 = +[DCMarkupUtilities dataToEditForDocumentInfo:v5 imageCache:v6 includeMarkupModelData:0];
  id v9 = [v5 croppedAndFilteredImageUUID];
  v10 = [v6 getImage:v9];

  [v4 setData:v8 withArchivedModelData:v7 placeholderImage:v10];
  v11 = (void *)[objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:v4];
  v12 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:0 target:self action:sel_markupDoneAction_];
  id v13 = [v4 navigationItem];
  [v13 setLeftBarButtonItem:v12];

  v14 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:1 target:self action:sel_markupCancelAction_];
  v15 = [v4 navigationItem];
  [v15 setRightBarButtonItem:v14];

  [(DCMarkupPresenter *)self setMarkupViewController:v4];
  [v11 setModalTransitionStyle:0];
  id v16 = [MEMORY[0x263F1C550] DCExtractedDocumentViewControllerBackgroundColor];
  [v4 setBackgroundColor:v16];

  id v17 = [(DCMarkupPresenter *)self startPresentBlock];
  [(DCMarkupPresenter *)self setStartPresentBlock:0];
  if (v17)
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __57__DCMarkupPresenter_presentMarkupViewControllerFromView___block_invoke;
    v19[3] = &unk_2642A9360;
    v19[4] = self;
    id v20 = v11;
    ((void (**)(void, void *))v17)[2](v17, v19);
  }
  else
  {
    id v18 = [(DCMarkupPresenter *)self presentingViewController];
    [v18 presentViewController:v11 animated:1 completion:0];
  }
}

void __57__DCMarkupPresenter_presentMarkupViewControllerFromView___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) presentingViewController];
  [v2 presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)handleReturnedURL:(id)a3
{
  id v4 = a3;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__1;
  v7[4] = __Block_byref_object_dispose__1;
  id v8 = [(DCMarkupPresenter *)self markupRemoteViewController];
  v5 = [(DCMarkupPresenter *)self documentInfo];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__DCMarkupPresenter_handleReturnedURL___block_invoke;
  v6[3] = &unk_2642A9738;
  v6[4] = v7;
  +[DCMarkupUtilities applyReturnedMarkupURL:v4 documentInfo:v5 completionBlock:v6];

  _Block_object_dispose(v7, 8);
}

void __39__DCMarkupPresenter_handleReturnedURL___block_invoke(uint64_t a1)
{
  id v2 = [(id)currentMarkupPresenter completionBlock];

  if (v2)
  {
    v3 = [(id)currentMarkupPresenter completionBlock];
    v3[2](v3, 0);
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  id v6 = MEMORY[0x263EF83A0];

  dispatch_async(v6, &__block_literal_global_6);
}

void __39__DCMarkupPresenter_handleReturnedURL___block_invoke_2()
{
  v0 = (void *)currentMarkupPresenter;
  currentMarkupPresenter = 0;
}

- (ICDocCamDocumentInfo)documentInfo
{
  return (ICDocCamDocumentInfo *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDocumentInfo:(id)a3
{
}

- (ICDocCamImageCache)imageCache
{
  return (ICDocCamImageCache *)objc_getProperty(self, a2, 16, 1);
}

- (void)setImageCache:(id)a3
{
}

- (MURemoteViewController)markupRemoteViewController
{
  return self->_markupRemoteViewController;
}

- (void)setMarkupRemoteViewController:(id)a3
{
}

- (MarkupViewController)markupViewController
{
  return self->_markupViewController;
}

- (void)setMarkupViewController:(id)a3
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (unint64_t)inkStyle
{
  return self->_inkStyle;
}

- (void)setInkStyle:(unint64_t)a3
{
  self->_inkStyle = a3;
}

- (id)frameBlock
{
  return self->_frameBlock;
}

- (void)setFrameBlock:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (id)startPresentBlock
{
  return self->_startPresentBlock;
}

- (void)setStartPresentBlock:(id)a3
{
}

- (id)dismissCompletionBlock
{
  return self->_dismissCompletionBlock;
}

- (void)setDismissCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissCompletionBlock, 0);
  objc_storeStrong(&self->_startPresentBlock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_frameBlock, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_markupViewController, 0);
  objc_storeStrong((id *)&self->_markupRemoteViewController, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);

  objc_storeStrong((id *)&self->_documentInfo, 0);
}

@end