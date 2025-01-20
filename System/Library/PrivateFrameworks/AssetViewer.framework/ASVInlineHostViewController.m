@interface ASVInlineHostViewController
- (ASVInlineHostViewController)initWithUUID:(id)a3 child:(id)a4 fullscreenInlineService:(id)a5 canonicalWebPageURL:(id)a6;
- (void)documentInteractionControllerDidDismissOptionsMenu:(id)a3;
- (void)handleConnectionInterrupted;
- (void)queryShowShareSheetAndNotifyDidDismiss:(BOOL)a3;
- (void)requestNewShareSheetFrame;
- (void)showShareSheet:(id)a3 frame:(CGRect)a4;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation ASVInlineHostViewController

- (ASVInlineHostViewController)initWithUUID:(id)a3 child:(id)a4 fullscreenInlineService:(id)a5 canonicalWebPageURL:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ASVInlineHostViewController;
  v15 = [(ASVInlineHostViewController *)&v19 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_uuid, a3);
    objc_storeStrong((id *)&v16->_childVC, a4);
    objc_storeStrong((id *)&v16->_fullscreenService, a5);
    objc_storeStrong((id *)&v16->_canonicalWebPageURL, a6);
  }
  [(ASVInlineHostViewController *)v16 queryShowShareSheetAndNotifyDidDismiss:0];
  v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v17 addObserver:v16 selector:sel_handleConnectionInterrupted name:@"ASVConnectionInterrupted" object:0];

  return v16;
}

- (void)viewDidLoad
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)ASVInlineHostViewController;
  [(ASVInlineHostViewController *)&v16 viewDidLoad];
  [(ASVInlineHostViewController *)self addChildViewController:self->_childVC];
  v3 = [(ASVInlineHostViewController *)self view];
  v4 = [(UIViewController *)self->_childVC view];
  [v3 addSubview:v4];

  [(UIViewController *)self->_childVC didMoveToParentViewController:self];
  v5 = [(UIViewController *)self->_childVC view];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [(ASVInlineHostViewController *)self view];
  v7 = (void *)MEMORY[0x1E4F28DC8];
  objc_super v19 = @"childView";
  v8 = [(UIViewController *)self->_childVC view];
  v20[0] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  v10 = [v7 constraintsWithVisualFormat:@"H:|[childView]|" options:0 metrics:0 views:v9];
  [v6 addConstraints:v10];

  id v11 = [(ASVInlineHostViewController *)self view];
  id v12 = (void *)MEMORY[0x1E4F28DC8];
  v17 = @"childView";
  id v13 = [(UIViewController *)self->_childVC view];
  v18 = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v15 = [v12 constraintsWithVisualFormat:@"V:|[childView]|" options:0 metrics:0 views:v14];
  [v11 addConstraints:v15];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)ASVInlineHostViewController;
  id v7 = a4;
  -[ASVInlineHostViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__ASVInlineHostViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v8[3] = &unk_1E6DD7A20;
  v8[4] = self;
  [v7 animateAlongsideTransition:&__block_literal_global_3 completion:v8];
}

uint64_t __82__ASVInlineHostViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) requestNewShareSheetFrame];
}

- (void)handleConnectionInterrupted
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __58__ASVInlineHostViewController_handleConnectionInterrupted__block_invoke;
  v2[3] = &unk_1E6DD7810;
  v2[4] = self;
  ASVRunInMainThread(v2);
}

uint64_t __58__ASVInlineHostViewController_handleConnectionInterrupted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:0 completion:0];
}

- (void)requestNewShareSheetFrame
{
  objc_initWeak(&location, self);
  fullscreenService = self->_fullscreenService;
  uuid = self->_uuid;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__ASVInlineHostViewController_requestNewShareSheetFrame__block_invoke;
  v5[3] = &unk_1E6DD78D0;
  objc_copyWeak(&v6, &location);
  [(ARQLInlineService2 *)fullscreenService sendARQLEvent:&unk_1F3DEEBC0 forUUID:uuid completion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __56__ASVInlineHostViewController_requestNewShareSheetFrame__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__ASVInlineHostViewController_requestNewShareSheetFrame__block_invoke_2;
  v8[3] = &unk_1E6DD78A8;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  id v7 = v5;
  id v9 = v7;
  ASVRunInMainThread(v8);

  objc_destroyWeak(&v10);
}

void __56__ASVInlineHostViewController_requestNewShareSheetFrame__block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (WeakRetained[125])
    {
      v15 = WeakRetained;
      v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"frame"];

      WeakRetained = v15;
      if (v3)
      {
        v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"frame"];
        CGRect v17 = CGRectFromString(v4);
        double x = v17.origin.x;
        double y = v17.origin.y;
        double width = v17.size.width;
        double height = v17.size.height;

        id v9 = [v15 presentedViewController];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        WeakRetained = v15;
        if (isKindOfClass)
        {
          id v11 = [v15 presentedViewController];
          id v12 = [v11 popoverPresentationController];
          objc_msgSend(v12, "setSourceRect:", x, y, width, height);

          id v13 = [v15 presentedViewController];
          id v14 = [v13 popoverPresentationController];
          [v14 containerViewWillLayoutSubviews];

          WeakRetained = v15;
        }
      }
    }
  }
}

- (void)queryShowShareSheetAndNotifyDidDismiss:(BOOL)a3
{
  if (self->_canonicalWebPageURL)
  {
    BOOL v3 = a3;
    id v5 = (void *)[&unk_1F3DEEBE8 mutableCopy];
    id v6 = v5;
    if (v3) {
      [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"didDismissActivityViewController"];
    }
    objc_initWeak(location, self);
    fullscreenService = self->_fullscreenService;
    uuid = self->_uuid;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __70__ASVInlineHostViewController_queryShowShareSheetAndNotifyDidDismiss___block_invoke;
    v10[3] = &unk_1E6DD78D0;
    objc_copyWeak(&v11, location);
    [(ARQLInlineService2 *)fullscreenService sendARQLEvent:v6 forUUID:uuid completion:v10];
    objc_destroyWeak(&v11);
    objc_destroyWeak(location);
  }
  else
  {
    id v9 = _asvLogHandle;
    if (!_asvLogHandle)
    {
      ASVInitLogging();
      id v9 = _asvLogHandle;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1E2840000, v9, OS_LOG_TYPE_ERROR, "#Inline: No canonical web page provided, cannot show share sheet", (uint8_t *)location, 2u);
    }
  }
}

void __70__ASVInlineHostViewController_queryShowShareSheetAndNotifyDidDismiss___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__ASVInlineHostViewController_queryShowShareSheetAndNotifyDidDismiss___block_invoke_2;
  v8[3] = &unk_1E6DD78A8;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  id v7 = v5;
  id v9 = v7;
  ASVRunInMainThread(v8);

  objc_destroyWeak(&v10);
}

void __70__ASVInlineHostViewController_queryShowShareSheetAndNotifyDidDismiss___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"frame"];

    if (v2)
    {
      BOOL v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"frame"];
      CGRect v10 = CGRectFromString(v3);
      double x = v10.origin.x;
      double y = v10.origin.y;
      double width = v10.size.width;
      double height = v10.size.height;

      objc_msgSend(WeakRetained, "showShareSheet:frame:", WeakRetained[124], x, y, width, height);
    }
  }
}

- (void)showShareSheet:(id)a3 frame:(CGRect)a4
{
  if (!self->_documentInteractionController)
  {
    double height = a4.size.height;
    double width = a4.size.width;
    double y = a4.origin.y;
    double x = a4.origin.x;
    id v9 = a3;
    CGRect v10 = (UIDocumentInteractionController *)objc_opt_new();
    documentInteractionController = self->_documentInteractionController;
    self->_documentInteractionController = v10;

    [(UIDocumentInteractionController *)self->_documentInteractionController setURL:v9];
    [(UIDocumentInteractionController *)self->_documentInteractionController setDelegate:self];
    id v12 = self->_documentInteractionController;
    id v13 = [(ASVInlineHostViewController *)self view];
    -[UIDocumentInteractionController presentOptionsMenuFromRect:inView:animated:](v12, "presentOptionsMenuFromRect:inView:animated:", v13, 1, x, y, width, height);
  }
}

- (void)documentInteractionControllerDidDismissOptionsMenu:(id)a3
{
  documentInteractionController = self->_documentInteractionController;
  self->_documentInteractionController = 0;

  [(ASVInlineHostViewController *)self queryShowShareSheetAndNotifyDidDismiss:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullscreenService, 0);
  objc_storeStrong((id *)&self->_documentInteractionController, 0);
  objc_storeStrong((id *)&self->_canonicalWebPageURL, 0);
  objc_storeStrong((id *)&self->_childVC, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end