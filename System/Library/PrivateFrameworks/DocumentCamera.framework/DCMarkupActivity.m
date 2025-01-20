@interface DCMarkupActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (ICDocCamDocumentInfo)documentInfo;
- (ICDocCamImageCache)imageCache;
- (UIView)fromView;
- (UIViewController)presentingViewController;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (id)completionBlock;
- (id)frameBlock;
- (id)initFromView:(id)a3 presentingViewController:(id)a4 frameBlock:(id)a5 completionBlock:(id)a6;
- (unint64_t)inkStyle;
- (void)performActivity;
- (void)prepareWithActivityItems:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setDocumentInfo:(id)a3;
- (void)setFrameBlock:(id)a3;
- (void)setFromView:(id)a3;
- (void)setImageCache:(id)a3;
- (void)setInkStyle:(unint64_t)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation DCMarkupActivity

- (id)initFromView:(id)a3 presentingViewController:(id)a4 frameBlock:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)DCMarkupActivity;
  v14 = [(UIActivity *)&v17 init];
  v15 = v14;
  if (v14)
  {
    [(DCMarkupActivity *)v14 setFromView:v10];
    [(DCMarkupActivity *)v15 setPresentingViewController:v11];
    [(DCMarkupActivity *)v15 setFrameBlock:v12];
    [(DCMarkupActivity *)v15 setCompletionBlock:v13];
    [(DCMarkupActivity *)v15 setInkStyle:0];
  }

  return v15;
}

- (id)activityType
{
  return @"com.apple.documentcamera.markup";
}

- (id)activityTitle
{
  return +[DCLocalization localizedStringForKey:@"Markup" value:@"Markup" table:@"Localizable"];
}

- (id)activityImage
{
  v2 = (void *)MEMORY[0x263F086E0];
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v3 = (void *)getMURemoteViewControllerClass_softClass;
  uint64_t v12 = getMURemoteViewControllerClass_softClass;
  if (!getMURemoteViewControllerClass_softClass)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __getMURemoteViewControllerClass_block_invoke;
    v8[3] = &unk_2642A9738;
    v8[4] = &v9;
    __getMURemoteViewControllerClass_block_invoke((uint64_t)v8);
    v3 = (void *)v10[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v9, 8);
  v5 = [v2 bundleForClass:v4];
  v6 = [MEMORY[0x263F1C6B0] imageNamed:@"PlugIns/MarkupPrivateExtension.appex/MarkupActionExtensionIcon60x60" inBundle:v5];

  return v6;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__DCMarkupActivity_canPerformWithActivityItems___block_invoke;
  v6[3] = &unk_2642A9EA8;
  v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];
  BOOL v4 = v8[3] == 1;
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __48__DCMarkupActivity_canPerformWithActivityItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v6 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  *a4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) > 1uLL;
}

- (void)prepareWithActivityItems:(id)a3
{
  id v4 = a3;
  [(DCMarkupActivity *)self setDocumentInfo:0];
  [(DCMarkupActivity *)self setImageCache:0];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__DCMarkupActivity_prepareWithActivityItems___block_invoke;
  v5[3] = &unk_2642A9ED0;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
}

void __45__DCMarkupActivity_prepareWithActivityItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v10 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v10;
    uint64_t v7 = [v6 documentInfo];
    [*(id *)(a1 + 32) setDocumentInfo:v7];

    v8 = [v6 imageCache];

    [*(id *)(a1 + 32) setImageCache:v8];
  }
  uint64_t v9 = [*(id *)(a1 + 32) documentInfo];
  *a4 = v9 != 0;
}

- (void)performActivity
{
  id v3 = [(DCMarkupActivity *)self documentInfo];
  id v4 = [(DCMarkupActivity *)self imageCache];
  v5 = [(DCMarkupActivity *)self fromView];
  id v6 = [(DCMarkupActivity *)self presentingViewController];
  unint64_t v7 = [(DCMarkupActivity *)self inkStyle];
  v8 = [(DCMarkupActivity *)self frameBlock];
  uint64_t v9 = [(DCMarkupActivity *)self completionBlock];
  +[DCMarkupPresenter markupDocumentInfo:v3 imageCache:v4 fromView:v5 presentingViewController:v6 inkStyle:v7 frameBlock:v8 startPresentBlock:0 completionBlock:v9 dismissCompletionBlock:0];

  [(DCMarkupActivity *)self setDocumentInfo:0];

  [(DCMarkupActivity *)self setImageCache:0];
}

- (unint64_t)inkStyle
{
  return self->_inkStyle;
}

- (void)setInkStyle:(unint64_t)a3
{
  self->_inkStyle = a3;
}

- (UIView)fromView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fromView);

  return (UIView *)WeakRetained;
}

- (void)setFromView:(id)a3
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

- (ICDocCamDocumentInfo)documentInfo
{
  return self->_documentInfo;
}

- (void)setDocumentInfo:(id)a3
{
}

- (ICDocCamImageCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
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

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_frameBlock, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_documentInfo, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);

  objc_destroyWeak((id *)&self->_fromView);
}

@end