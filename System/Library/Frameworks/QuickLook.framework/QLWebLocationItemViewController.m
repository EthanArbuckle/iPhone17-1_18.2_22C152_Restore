@interface QLWebLocationItemViewController
- (BOOL)automaticallyUpdateScrollViewContentInset;
- (BOOL)automaticallyUpdateScrollViewContentOffset;
- (BOOL)automaticallyUpdateScrollViewIndicatorInset;
- (BOOL)canEnterFullScreen;
- (BOOL)canPinchToDismiss;
- (BOOL)canSwipeToDismiss;
- (id)accessoryView;
- (id)scrollView;
- (id)toolbarButtonsForTraitCollection:(id)a3;
- (void)_updateConstraintConstants:(BOOL)a3;
- (void)buttonPressedWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)previewDidAppear:(BOOL)a3;
- (void)previewIsAppearingWithProgress:(double)a3;
- (void)setAppearance:(id)a3 animated:(BOOL)a4;
@end

@implementation QLWebLocationItemViewController

- (void)loadView
{
  v36[1] = *MEMORY[0x263EF8340];
  if (!self->_webView)
  {
    v3 = objc_opt_new();
    [(QLWebLocationItemViewController *)self setView:v3];

    id v4 = objc_alloc(MEMORY[0x263F1FA60]);
    v5 = [(QLItemViewController *)self presentingDelegate];
    v6 = [v5 hostApplicationBundleIdentifier];
    v7 = objc_msgSend(v4, "ql_initWithForegroundPriorityAndSourceBundleIdentifier:", v6);

    id v8 = objc_alloc(MEMORY[0x263F1FA58]);
    v9 = [(QLWebLocationItemViewController *)self view];
    [v9 bounds];
    v10 = (WKWebView *)objc_msgSend(v8, "initWithFrame:configuration:", v7);
    webView = self->_webView;
    self->_webView = v10;

    v12 = [(QLWebLocationItemViewController *)self view];
    [v12 addSubview:self->_webView];

    v13 = [(QLWebLocationItemViewController *)self scrollView];
    [v13 setContentInsetAdjustmentBehavior:2];

    [(WKWebView *)self->_webView setTranslatesAutoresizingMaskIntoConstraints:0];
    v14 = [(WKWebView *)self->_webView leftAnchor];
    v15 = [(QLWebLocationItemViewController *)self view];
    v16 = [v15 leftAnchor];
    v17 = [(QLItemViewController *)self appearance];
    [v17 peripheryInsets];
    v19 = [v14 constraintEqualToAnchor:v16 constant:v18];
    objc_msgSend(v19, "ql_activatedConstraint");
    v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    leftConstraint = self->_leftConstraint;
    self->_leftConstraint = v20;

    v22 = [(QLWebLocationItemViewController *)self view];
    v23 = [v22 rightAnchor];
    v24 = [(WKWebView *)self->_webView rightAnchor];
    v25 = [(QLItemViewController *)self appearance];
    [v25 peripheryInsets];
    v27 = [v23 constraintEqualToAnchor:v24 constant:v26];
    objc_msgSend(v27, "ql_activatedConstraint");
    v28 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    rightConstraint = self->_rightConstraint;
    self->_rightConstraint = v28;

    v30 = [(QLWebLocationItemViewController *)self view];
    v31 = (void *)MEMORY[0x263F08938];
    v32 = self->_webView;
    v35 = @"webView";
    v36[0] = v32;
    v33 = [NSDictionary dictionaryWithObjects:v36 forKeys:&v35 count:1];
    v34 = [v31 constraintsWithVisualFormat:@"V:|[webView]|" options:0 metrics:0 views:v33];
    [v30 addConstraints:v34];
  }
}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  v7 = NSURL;
  id v8 = (void (**)(id, void))a5;
  v9 = [a3 objectForKeyedSubscript:@"URL"];
  id v15 = [v7 URLWithString:v9];

  if (v15)
  {
    [(QLWebLocationItemViewController *)self loadViewIfNeeded];
    [(WKWebView *)self->_webView addObserver:self forKeyPath:@"estimatedProgress" options:1 context:0];
    webView = self->_webView;
    v11 = [MEMORY[0x263F08BD8] requestWithURL:v15];
    id v12 = [(WKWebView *)webView loadRequest:v11];

    v13 = [(QLWebLocationItemViewController *)self scrollView];
    [v13 setContentInsetAdjustmentBehavior:2];

    v8[2](v8, 0);
  }
  else
  {
    uint64_t v14 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.quicklook.QLWebLocationItemViewController" code:0 userInfo:0];
    v8[2](v8, v14);

    id v8 = (void (**)(id, void))v14;
  }
}

- (void)previewIsAppearingWithProgress:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)QLWebLocationItemViewController;
  -[QLItemViewController previewIsAppearingWithProgress:](&v6, sel_previewIsAppearingWithProgress_);
  v5 = [(QLWebLocationItemViewController *)self accessoryView];
  [v5 setAlpha:a3];
}

- (void)previewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)QLWebLocationItemViewController;
  [(QLItemViewController *)&v5 previewDidAppear:a3];
  id v4 = [(QLWebLocationItemViewController *)self accessoryView];
  [v4 setAlpha:1.0];
}

- (void)dealloc
{
  [(WKWebView *)self->_webView removeObserver:self forKeyPath:@"estimatedProgress"];
  v3.receiver = self;
  v3.super_class = (Class)QLWebLocationItemViewController;
  [(QLWebLocationItemViewController *)&v3 dealloc];
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)QLWebLocationItemViewController;
  -[QLItemViewController setAppearance:animated:](&v6, sel_setAppearance_animated_, a3);
  [(QLWebLocationItemViewController *)self _updateConstraintConstants:v4];
}

- (BOOL)canEnterFullScreen
{
  return 0;
}

- (id)scrollView
{
  return [(WKWebView *)self->_webView scrollView];
}

- (BOOL)automaticallyUpdateScrollViewContentOffset
{
  return 1;
}

- (BOOL)automaticallyUpdateScrollViewContentInset
{
  return 1;
}

- (BOOL)automaticallyUpdateScrollViewIndicatorInset
{
  return 1;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v12 = a3;
  v9 = (WKWebView *)a4;
  id v10 = a5;
  if (self->_loadingHandler)
  {
    if (self->_webView == v9)
    {
      if ([v12 isEqualToString:@"estimatedProgress"])
      {
        [(WKWebView *)self->_webView estimatedProgress];
        if (v11 == 1.0) {
          (*((void (**)(void))self->_loadingHandler + 2))();
        }
      }
    }
  }
}

- (BOOL)canSwipeToDismiss
{
  return 0;
}

- (BOOL)canPinchToDismiss
{
  v2 = [(QLWebLocationItemViewController *)self scrollView];
  objc_super v3 = v2;
  if (v2)
  {
    [v2 zoomScale];
    double v5 = v4;
    [v3 minimumZoomScale];
    BOOL v7 = v5 == v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)accessoryView
{
  locationViewContainer = self->_locationViewContainer;
  if (!locationViewContainer)
  {
    double v4 = NSURL;
    double v5 = [(QLItemViewController *)self contents];
    double v6 = [v5 objectForKeyedSubscript:@"URL"];
    BOOL v7 = [v4 URLWithString:v6];

    id v8 = +[QLWebLocationBarViewInterface makeLocationBarUI:v7];
    v9 = [v8 view];
    locationView = self->_locationView;
    self->_locationView = v9;

    double v11 = [MEMORY[0x263F825C8] clearColor];
    [(UIView *)self->_locationView setBackgroundColor:v11];

    id v12 = (UIView *)objc_opt_new();
    v13 = self->_locationViewContainer;
    self->_locationViewContainer = v12;

    [(UIView *)self->_locationViewContainer addSubview:self->_locationView];
    locationViewContainer = self->_locationViewContainer;
  }
  [(UIView *)locationViewContainer bounds];
  -[UIView setFrame:](self->_locationView, "setFrame:");
  uint64_t v14 = self->_locationView;

  return v14;
}

- (id)toolbarButtonsForTraitCollection:(id)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x263F629D0]) initWithIdentifier:@"QLSafariButtonIdentifier"];
  [v3 setSymbolImageName:@"safari"];
  [v3 setPlacement:2];
  v6[0] = v3;
  double v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];

  return v4;
}

- (void)buttonPressedWithIdentifier:(id)a3 completionHandler:(id)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = (void (**)(void))a4;
  if ([v6 isEqualToString:@"QLSafariButtonIdentifier"])
  {
    id v8 = [(QLItemViewController *)self contents];
    v9 = [v8 objectForKeyedSubscript:@"URL"];

    id v10 = [NSURL URLWithString:v9];
    double v11 = (NSObject **)MEMORY[0x263F62940];
    id v12 = *MEMORY[0x263F62940];
    if (v10)
    {
      if (!v12)
      {
        QLSInitLogging();
        id v12 = *v11;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217F61000, v12, OS_LOG_TYPE_DEFAULT, "Will open URL #AnyItemViewController", buf, 2u);
      }
      v13 = [MEMORY[0x263F82438] sharedApplication];
      uint64_t v18 = *MEMORY[0x263F83368];
      v19[0] = MEMORY[0x263EFFA88];
      uint64_t v14 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
      [v13 openURL:v10 options:v14 completionHandler:&__block_literal_global_8];
    }
    else
    {
      if (!v12)
      {
        QLSInitLogging();
        id v12 = *v11;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v9;
        _os_log_impl(&dword_217F61000, v12, OS_LOG_TYPE_ERROR, "Safari button tapped but the URL is invalid: %@ #AnyItemViewController", buf, 0xCu);
      }
    }
    if (v7) {
      v7[2](v7);
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)QLWebLocationItemViewController;
    [(QLItemViewController *)&v15 buttonPressedWithIdentifier:v6 completionHandler:v7];
  }
}

void __81__QLWebLocationItemViewController_buttonPressedWithIdentifier_completionHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  objc_super v3 = (NSObject **)MEMORY[0x263F62940];
  double v4 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    double v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl(&dword_217F61000, v4, OS_LOG_TYPE_DEFAULT, "The url was opened successfully: %d #AnyItemViewController", (uint8_t *)v5, 8u);
  }
}

- (void)_updateConstraintConstants:(BOOL)a3
{
  BOOL v3 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__QLWebLocationItemViewController__updateConstraintConstants___block_invoke;
  aBlock[3] = &unk_2642F5430;
  aBlock[4] = self;
  double v4 = _Block_copy(aBlock);
  double v5 = v4;
  if (v3) {
    [MEMORY[0x263F82E00] animateWithDuration:v4 animations:0.2];
  }
  else {
    (*((void (**)(void *))v4 + 2))(v4);
  }
}

void __62__QLWebLocationItemViewController__updateConstraintConstants___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) appearance];
  [v2 peripheryInsets];
  [*(id *)(*(void *)(a1 + 32) + 1144) setConstant:v3];

  double v4 = [*(id *)(a1 + 32) appearance];
  [v4 peripheryInsets];
  [*(id *)(*(void *)(a1 + 32) + 1152) setConstant:v5];

  id v6 = [*(id *)(a1 + 32) view];
  [v6 setNeedsLayout];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightConstraint, 0);
  objc_storeStrong((id *)&self->_leftConstraint, 0);
  objc_storeStrong((id *)&self->_locationView, 0);
  objc_storeStrong((id *)&self->_locationViewContainer, 0);
  objc_storeStrong(&self->_loadingHandler, 0);

  objc_storeStrong((id *)&self->_webView, 0);
}

@end