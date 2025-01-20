@interface PKImageWandOnboardingViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)canBecomeFirstResponder;
- (PKImageWandOnboardingViewController)init;
- (void)_didTouchUpInsideContinueButton:(id)a3;
- (void)_updateUI;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation PKImageWandOnboardingViewController

- (PKImageWandOnboardingViewController)init
{
  v45[4] = *MEMORY[0x1E4F143B8];
  v44.receiver = self;
  v44.super_class = (Class)PKImageWandOnboardingViewController;
  v2 = [(PKImageWandOnboardingViewController *)&v44 initWithTitle:&stru_1F1FB2C00 detailText:0 symbolName:0 contentLayout:1];
  v3 = v2;
  if (v2)
  {
    v2->_lastUserInterfaceStyle = 0;
    v4 = [PKImageWandOnboardingContentViewController alloc];
    v5 = _PencilKitBundle();
    v6 = [v5 localizedStringForKey:@"IMAGE_WAND_TITLE" value:&stru_1F1FB2C00 table:@"ImageWand"];
    v7 = _PencilKitBundle();
    v8 = [v7 localizedStringForKey:@"IMAGE_WAND_DESCRIPTION" value:&stru_1F1FB2C00 table:@"ImageWand"];
    v9 = -[PKImageWandOnboardingContentViewController initWithTitle:titleBadgeText:detailText:symbolName:contentLayout:](v4, (uint64_t)v6, @"BETA", (uint64_t)v8, 0, 2);
    contentViewController = v3->_contentViewController;
    v3->_contentViewController = (PKImageWandOnboardingContentViewController *)v9;

    [(PKImageWandOnboardingViewController *)v3 addChildViewController:v3->_contentViewController];
    v11 = [(PKImageWandOnboardingViewController *)v3 view];
    v12 = [(PKImageWandOnboardingContentViewController *)v3->_contentViewController view];
    [v11 addSubview:v12];

    v13 = [(PKImageWandOnboardingContentViewController *)v3->_contentViewController view];
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

    v27 = (void *)MEMORY[0x1E4F28DC8];
    v40 = [(PKImageWandOnboardingContentViewController *)v3->_contentViewController view];
    v38 = [v40 leadingAnchor];
    v39 = [(PKImageWandOnboardingViewController *)v3 view];
    v37 = [v39 leadingAnchor];
    v36 = [v38 constraintEqualToAnchor:v37];
    v45[0] = v36;
    v35 = [(PKImageWandOnboardingContentViewController *)v3->_contentViewController view];
    v33 = [v35 trailingAnchor];
    v34 = [(PKImageWandOnboardingViewController *)v3 view];
    v32 = [v34 trailingAnchor];
    v31 = [v33 constraintEqualToAnchor:v32];
    v45[1] = v31;
    v30 = [(PKImageWandOnboardingContentViewController *)v3->_contentViewController view];
    v28 = [v30 topAnchor];
    v29 = [(PKImageWandOnboardingViewController *)v3 contentView];
    v14 = [v29 bottomAnchor];
    v15 = [v28 constraintEqualToAnchor:v14];
    v45[2] = v15;
    v16 = [(PKImageWandOnboardingContentViewController *)v3->_contentViewController view];
    v17 = [v16 bottomAnchor];
    v18 = [(PKImageWandOnboardingViewController *)v3 view];
    v19 = [v18 bottomAnchor];
    v20 = [v17 constraintEqualToAnchor:v19];
    v45[3] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:4];
    [v27 activateConstraints:v21];

    v22 = v3->_contentViewController;
    if (v22) {
      v22 = (PKImageWandOnboardingContentViewController *)v22->_continueButton;
    }
    v23 = v22;
    [(PKImageWandOnboardingContentViewController *)v23 addTarget:v3 action:sel__didTouchUpInsideContinueButton_ forControlEvents:64];

    [(PKImageWandOnboardingContentViewController *)v3->_contentViewController didMoveToParentViewController:v3];
    objc_initWeak(&location, v3);
    v24 = [MEMORY[0x1E4FB1E20] systemTraitsAffectingColorAppearance];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __43__PKImageWandOnboardingViewController_init__block_invoke;
    v41[3] = &unk_1E64C7008;
    objc_copyWeak(&v42, &location);
    id v25 = (id)[(PKImageWandOnboardingViewController *)v3 registerForTraitChanges:v24 withHandler:v41];

    -[PKImageWandOnboardingViewController _updateUI](v3);
    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __43__PKImageWandOnboardingViewController_init__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[PKImageWandOnboardingViewController _updateUI](WeakRetained);
}

- (void)_updateUI
{
  if (a1)
  {
    uint64_t v2 = a1[150];
    if (!v2
      || ([a1 traitCollection],
          v3 = objc_claimAutoreleasedReturnValue(),
          uint64_t v4 = [v3 userInterfaceStyle],
          v3,
          v2 != v4))
    {
      v5 = [a1 traitCollection];
      a1[150] = [v5 userInterfaceStyle];

      v6 = [a1 traitCollection];
      uint64_t v7 = [v6 userInterfaceStyle];

      BOOL v8 = v7 == 2;
      v9 = @"ImageWandOnboarding_Light";
      if (v8) {
        v9 = @"ImageWandOnboarding_Dark";
      }
      v10 = v9;
      v11 = (void *)MEMORY[0x1E4FB1EB0];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __48__PKImageWandOnboardingViewController__updateUI__block_invoke;
      v13[3] = &unk_1E64C8FB8;
      v13[4] = a1;
      v14 = v10;
      BOOL v15 = v8;
      v12 = v10;
      [v11 performWithoutAnimation:v13];
    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKImageWandOnboardingViewController;
  -[OBBaseWelcomeController viewDidAppear:](&v8, sel_viewDidAppear_);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 imageWandOnboardingControllerViewDidAppear:self animated:v3];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKImageWandOnboardingViewController;
  [(PKImageWandOnboardingViewController *)&v7 viewDidDisappear:a3];
  if ([(PKImageWandOnboardingViewController *)self isBeingDismissed])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_delegate);
      [v6 imageWandOnboardingControllerIsBeingDismissed:self];
    }
  }
}

- (BOOL)canBecomeFirstResponder
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    char v7 = [v6 imageWandOnboardingControllerCanBecomeFirstResponder:self];

    return v7;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PKImageWandOnboardingViewController;
    return [(PKImageWandOnboardingViewController *)&v9 canBecomeFirstResponder];
  }
}

- (void)_didTouchUpInsideContinueButton:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 imageWandOnboardingControllerDidSelectContinue:self];
  }
}

void __48__PKImageWandOnboardingViewController__updateUI__block_invoke(uint64_t a1)
{
  v28[4] = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 1192) removeFromSuperview];
  uint64_t v2 = _PencilKitBundle();
  BOOL v3 = [v2 URLForResource:*(void *)(a1 + 40) withExtension:@"mov"];

  v27 = v3;
  uint64_t v4 = -[PKMovieView initWithURL:]((id *)[PKMovieView alloc], v3);
  uint64_t v5 = *(void *)(a1 + 32);
  char v6 = *(void **)(v5 + 1192);
  *(void *)(v5 + 1192) = v4;

  if (*(unsigned char *)(a1 + 48)) {
    [MEMORY[0x1E4FB1618] blackColor];
  }
  else {
  id v7 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  [*(id *)(*(void *)(a1 + 32) + 1192) setBackgroundColor:v7];

  [*(id *)(*(void *)(a1 + 32) + 1192) setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v8 = [*(id *)(a1 + 32) contentView];
  [v8 addSubview:*(void *)(*(void *)(a1 + 32) + 1192)];

  v20 = (void *)MEMORY[0x1E4F28DC8];
  id v25 = [*(id *)(*(void *)(a1 + 32) + 1192) topAnchor];
  v26 = [*(id *)(a1 + 32) contentView];
  v24 = [v26 topAnchor];
  v23 = [v25 constraintEqualToAnchor:v24];
  v28[0] = v23;
  v21 = [*(id *)(*(void *)(a1 + 32) + 1192) leadingAnchor];
  v22 = [*(id *)(a1 + 32) contentView];
  v19 = [v22 leadingAnchor];
  objc_super v9 = [v21 constraintEqualToAnchor:v19];
  v28[1] = v9;
  v10 = [*(id *)(*(void *)(a1 + 32) + 1192) widthAnchor];
  v11 = [*(id *)(a1 + 32) contentView];
  v12 = [v11 widthAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  v28[2] = v13;
  v14 = [*(id *)(*(void *)(a1 + 32) + 1192) heightAnchor];
  BOOL v15 = [*(id *)(a1 + 32) contentView];
  v16 = [v15 heightAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];
  v28[3] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];
  [v20 activateConstraints:v18];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_movieView, 0);

  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end