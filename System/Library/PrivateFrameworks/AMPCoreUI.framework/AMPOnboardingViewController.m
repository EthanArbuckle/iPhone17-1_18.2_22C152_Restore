@interface AMPOnboardingViewController
- (AMPOnboardingViewController)initWithHeaderImage:(id)a3 titleText:(id)a4 descriptionText:(id)a5 primaryButtonText:(id)a6 privacyLinkController:(id)a7;
- (AMPOnboardingViewController)initWithTitleText:(id)a3 features:(id)a4 primaryButtonText:(id)a5 privacyLinkController:(id)a6;
- (AMSUIOnboardingViewController)onboardingController;
- (BOOL)isModalInPresentation;
- (BOOL)isPresentedInFormSheet;
- (BOOL)viewHasAppeared;
- (OBPrivacyLinkController)privacyLinkController;
- (OS_dispatch_queue)metricsQueue;
- (UIImage)image;
- (UITraitCollection)cappedTraitCollection;
- (UIVisualEffectView)statusBarVisualEffectView;
- (_UIBackdropView)backdropView;
- (id)childTraitCollectionForViewController:(id)a3;
- (id)primaryButtonCallback;
- (unint64_t)supportedInterfaceOrientations;
- (void)didTapPrimaryButton:(id)a3;
- (void)setBackdropView:(id)a3;
- (void)setDescriptionText:(id)a3;
- (void)setImage:(id)a3;
- (void)setMetricsQueue:(id)a3;
- (void)setOnboardingController:(id)a3;
- (void)setPrimaryButtonCallback:(id)a3;
- (void)setPrimaryButtonText:(id)a3;
- (void)setStatusBarVisualEffectView:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setViewHasAppeared:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateOverrideTraits;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AMPOnboardingViewController

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AMPOnboardingViewController;
  [(AMPOnboardingViewController *)&v4 viewDidAppear:a3];
  [(AMPOnboardingViewController *)self viewHasAppeared];
  [(AMPOnboardingViewController *)self setViewHasAppeared:1];
}

- (BOOL)viewHasAppeared
{
  return self->_viewHasAppeared;
}

- (void)setViewHasAppeared:(BOOL)a3
{
  self->_viewHasAppeared = a3;
}

- (void)viewDidLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)AMPOnboardingViewController;
  [(AMPOnboardingViewController *)&v14 viewDidLayoutSubviews];
  v3 = [(AMPOnboardingViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(AMPOnboardingViewController *)self onboardingController];
  v13 = [v12 view];
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)AMPOnboardingViewController;
  [(AMPOnboardingViewController *)&v11 viewDidLoad];
  v3 = [MEMORY[0x263F1C550] systemBackgroundColor];
  double v4 = [(AMPOnboardingViewController *)self view];
  [v4 setBackgroundColor:v3];

  double v5 = [(AMPOnboardingViewController *)self onboardingController];

  if (v5)
  {
    double v6 = [(AMPOnboardingViewController *)self onboardingController];
    [(AMPOnboardingViewController *)self addChildViewController:v6];

    double v7 = [(AMPOnboardingViewController *)self view];
    double v8 = [(AMPOnboardingViewController *)self onboardingController];
    double v9 = [v8 view];
    [v7 addSubview:v9];

    double v10 = [(AMPOnboardingViewController *)self onboardingController];
    [v10 didMoveToParentViewController:self];
  }
}

- (AMSUIOnboardingViewController)onboardingController
{
  return self->_onboardingController;
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AMPOnboardingViewController;
  [(AMPOnboardingViewController *)&v5 traitCollectionDidChange:a3];
  [(AMPOnboardingViewController *)self updateOverrideTraits];
  double v4 = [(AMPOnboardingViewController *)self view];
  [v4 setNeedsLayout];
}

- (void)updateOverrideTraits
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(AMPOnboardingViewController *)self childViewControllers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        double v9 = [(AMPOnboardingViewController *)self childTraitCollectionForViewController:v8];
        [(AMPOnboardingViewController *)self setOverrideTraitCollection:v9 forChildViewController:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (id)childTraitCollectionForViewController:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x2050000000;
  uint64_t v5 = (void *)getOBPrivacyLinkControllerClass_softClass;
  uint64_t v13 = getOBPrivacyLinkControllerClass_softClass;
  if (!getOBPrivacyLinkControllerClass_softClass)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __getOBPrivacyLinkControllerClass_block_invoke;
    v9[3] = &unk_264E7C700;
    v9[4] = &v10;
    __getOBPrivacyLinkControllerClass_block_invoke((uint64_t)v9);
    uint64_t v5 = (void *)v11[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v10, 8);
  if (objc_opt_isKindOfClass())
  {
    double v7 = [(AMPOnboardingViewController *)self cappedTraitCollection];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (AMPOnboardingViewController)initWithHeaderImage:(id)a3 titleText:(id)a4 descriptionText:(id)a5 primaryButtonText:(id)a6 privacyLinkController:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)AMPOnboardingViewController;
  v17 = [(AMPOnboardingViewController *)&v26 initWithNibName:0 bundle:0];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_titleText, a4);
    objc_storeStrong((id *)&v18->_descriptionText, a5);
    objc_storeStrong((id *)&v18->_primaryButtonText, a6);
    objc_storeStrong((id *)&v18->_image, a3);
    uint64_t v19 = [objc_alloc((Class)getAMSUIOnboardingViewControllerClass()) initWithHeaderImage:v12 titleText:v13 descriptionText:v14 primaryButtonText:v15 privacyLinkController:v16];
    onboardingController = v18->_onboardingController;
    v18->_onboardingController = (AMSUIOnboardingViewController *)v19;

    objc_initWeak(&location, v18);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __117__AMPOnboardingViewController_initWithHeaderImage_titleText_descriptionText_primaryButtonText_privacyLinkController___block_invoke;
    v23[3] = &unk_264E7C6B8;
    objc_copyWeak(&v24, &location);
    [(AMSUIOnboardingViewController *)v18->_onboardingController setPrimaryButtonCallback:v23];
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v18;
}

void __117__AMPOnboardingViewController_initWithHeaderImage_titleText_descriptionText_primaryButtonText_privacyLinkController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained primaryButtonCallback];

  if (v1)
  {
    v2 = [WeakRetained primaryButtonCallback];
    ((void (**)(void, id))v2)[2](v2, WeakRetained);
  }
}

- (AMPOnboardingViewController)initWithTitleText:(id)a3 features:(id)a4 primaryButtonText:(id)a5 privacyLinkController:(id)a6
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v26 = a3;
  id v29 = a4;
  id v27 = a5;
  id v28 = a6;
  v38.receiver = self;
  v38.super_class = (Class)AMPOnboardingViewController;
  val = [(AMPOnboardingViewController *)&v38 initWithNibName:0 bundle:0];
  if (val)
  {
    objc_storeStrong((id *)&val->_titleText, a3);
    objc_storeStrong((id *)&val->_primaryButtonText, a5);
    long long v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v29, "count"));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = v29;
    uint64_t v12 = [obj countByEnumeratingWithState:&v34 objects:v44 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v35;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v35 != v13) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v34 + 1) + 8 * v14);
          uint64_t v40 = 0;
          v41 = &v40;
          uint64_t v42 = 0x2050000000;
          id v16 = (void *)getAMSUIOnboardingFeatureClass_softClass;
          uint64_t v43 = getAMSUIOnboardingFeatureClass_softClass;
          if (!getAMSUIOnboardingFeatureClass_softClass)
          {
            location[0] = (id)MEMORY[0x263EF8330];
            location[1] = (id)3221225472;
            location[2] = __getAMSUIOnboardingFeatureClass_block_invoke;
            location[3] = &unk_264E7C700;
            location[4] = &v40;
            __getAMSUIOnboardingFeatureClass_block_invoke((uint64_t)location);
            id v16 = (void *)v41[3];
          }
          v17 = v16;
          _Block_object_dispose(&v40, 8);
          id v18 = [v17 alloc];
          uint64_t v19 = [v15 image];
          v20 = [v15 titleText];
          v21 = [v15 descriptionText];
          v22 = (void *)[v18 initWithImage:v19 titleText:v20 descriptionText:v21];

          [v11 addObject:v22];
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [obj countByEnumeratingWithState:&v34 objects:v44 count:16];
      }
      while (v12);
    }

    uint64_t v23 = [objc_alloc((Class)getAMSUIOnboardingViewControllerClass()) initWithTitleText:v26 features:v11 primaryButtonText:v27 privacyLinkController:v28];
    onboardingController = val->_onboardingController;
    val->_onboardingController = (AMSUIOnboardingViewController *)v23;

    objc_initWeak(location, val);
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __98__AMPOnboardingViewController_initWithTitleText_features_primaryButtonText_privacyLinkController___block_invoke;
    v32[3] = &unk_264E7C6B8;
    objc_copyWeak(&v33, location);
    [(AMSUIOnboardingViewController *)val->_onboardingController setPrimaryButtonCallback:v32];
    objc_destroyWeak(&v33);
    objc_destroyWeak(location);
  }
  return val;
}

void __98__AMPOnboardingViewController_initWithTitleText_features_primaryButtonText_privacyLinkController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained primaryButtonCallback];

  if (v1)
  {
    v2 = [WeakRetained primaryButtonCallback];
    ((void (**)(void, id))v2)[2](v2, WeakRetained);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AMPOnboardingViewController;
  -[AMPOnboardingViewController viewWillAppear:](&v7, sel_viewWillAppear_);
  uint64_t v5 = [(AMPOnboardingViewController *)self navigationController];
  [v5 setNavigationBarHidden:1 animated:v3];

  id v6 = [(AMPOnboardingViewController *)self navigationController];
  [v6 setModalInPresentation:1];
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(AMPOnboardingViewController *)self traitCollection];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (UITraitCollection)cappedTraitCollection
{
  v14[2] = *MEMORY[0x263EF8340];
  if (cappedTraitCollection_onceToken != -1) {
    dispatch_once(&cappedTraitCollection_onceToken, &__block_literal_global);
  }
  uint64_t v3 = [(AMPOnboardingViewController *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v4))
  {
    uint64_t v5 = (void *)cappedTraitCollection_cappedSizes;
    id v6 = [(AMPOnboardingViewController *)self traitCollection];
    objc_super v7 = [v6 preferredContentSizeCategory];
    LODWORD(v5) = [v5 containsObject:v7];

    if (v5)
    {
      uint64_t v8 = (void *)MEMORY[0x263F1CB00];
      double v9 = [(AMPOnboardingViewController *)self traitCollection];
      v14[0] = v9;
      uint64_t v10 = [MEMORY[0x263F1CB00] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x263F1D148]];
      v14[1] = v10;
      long long v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
      uint64_t v12 = [v8 traitCollectionWithTraitsFromCollections:v11];

      goto LABEL_8;
    }
  }
  else
  {
  }
  uint64_t v12 = 0;
LABEL_8:
  return (UITraitCollection *)v12;
}

void __52__AMPOnboardingViewController_cappedTraitCollection__block_invoke()
{
  v3[3] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F1D138];
  v3[0] = *MEMORY[0x263F1D140];
  v3[1] = v0;
  v3[2] = *MEMORY[0x263F1D130];
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:3];
  v2 = (void *)cappedTraitCollection_cappedSizes;
  cappedTraitCollection_cappedSizes = v1;
}

- (void)didTapPrimaryButton:(id)a3
{
  id v4 = [(AMPOnboardingViewController *)self primaryButtonCallback];

  if (v4)
  {
    uint64_t v5 = [(AMPOnboardingViewController *)self primaryButtonCallback];
    v5[2](v5, self);
  }
}

- (BOOL)isPresentedInFormSheet
{
  uint64_t v3 = [(AMPOnboardingViewController *)self navigationController];
  id v4 = (void *)v3;
  if (v3) {
    uint64_t v5 = (AMPOnboardingViewController *)v3;
  }
  else {
    uint64_t v5 = self;
  }
  id v6 = v5;

  objc_super v7 = [(AMPOnboardingViewController *)v6 presentationController];

  uint64_t v8 = [v7 _activePresentationController];
  BOOL v9 = [v8 presentationStyle] == 2;

  return v9;
}

- (void)setTitleText:(id)a3
{
}

- (void)setDescriptionText:(id)a3
{
}

- (void)setPrimaryButtonText:(id)a3
{
}

- (OBPrivacyLinkController)privacyLinkController
{
  return self->_privacyLinkController;
}

- (id)primaryButtonCallback
{
  return self->_primaryButtonCallback;
}

- (void)setPrimaryButtonCallback:(id)a3
{
}

- (void)setOnboardingController:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (UIVisualEffectView)statusBarVisualEffectView
{
  return self->_statusBarVisualEffectView;
}

- (void)setStatusBarVisualEffectView:(id)a3
{
}

- (_UIBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
}

- (OS_dispatch_queue)metricsQueue
{
  return self->_metricsQueue;
}

- (void)setMetricsQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsQueue, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_statusBarVisualEffectView, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_onboardingController, 0);
  objc_storeStrong(&self->_primaryButtonCallback, 0);
  objc_storeStrong((id *)&self->_privacyLinkController, 0);
  objc_storeStrong((id *)&self->_primaryButtonText, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

@end