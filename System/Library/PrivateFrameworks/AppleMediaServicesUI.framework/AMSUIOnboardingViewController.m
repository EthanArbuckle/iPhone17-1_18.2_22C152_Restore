@interface AMSUIOnboardingViewController
+ (id)privacyLinkIdentifiersFromController:(id)a3;
- (AMSUIOnboardingViewController)initWithHeaderImage:(id)a3 titleText:(id)a4 descriptionText:(id)a5 primaryButtonText:(id)a6 privacyLinkBundleIdentifier:(id)a7;
- (AMSUIOnboardingViewController)initWithHeaderImage:(id)a3 titleText:(id)a4 descriptionText:(id)a5 primaryButtonText:(id)a6 privacyLinkController:(id)a7;
- (AMSUIOnboardingViewController)initWithHeaderImage:(id)a3 titleText:(id)a4 descriptionText:(id)a5 primaryButtonText:(id)a6 secondaryButtonText:(id)a7 privacyLinkController:(id)a8;
- (AMSUIOnboardingViewController)initWithHeaderImage:(id)a3 titleText:(id)a4 features:(id)a5 primaryButtonText:(id)a6 privacyLinkBundleIdentifier:(id)a7;
- (AMSUIOnboardingViewController)initWithTitleText:(id)a3 features:(id)a4 primaryButtonText:(id)a5 privacyLinkBundleIdentifier:(id)a6;
- (AMSUIOnboardingViewController)initWithTitleText:(id)a3 features:(id)a4 primaryButtonText:(id)a5 privacyLinkController:(id)a6;
- (BOOL)isPresentedInFormSheet;
- (BOOL)viewHasAppeared;
- (BOOL)wasNavigationBarHidden;
- (CGSize)preferredContentSize;
- (NSString)descriptionText;
- (NSString)primaryButtonText;
- (NSString)secondaryButtonText;
- (NSString)titleText;
- (OBPrivacyLinkController)privacyLinkController;
- (OBWelcomeController)welcomeController;
- (OS_dispatch_queue)metricsQueue;
- (UIImage)image;
- (UIImage)rightImage;
- (UITraitCollection)cappedTraitCollection;
- (id)childTraitCollectionForViewController:(id)a3;
- (id)keyCommands;
- (id)primaryButtonCallback;
- (id)secondaryButtonCallback;
- (unint64_t)supportedInterfaceOrientations;
- (void)commonInitWithPrimaryButtonText:(id)a3 privacyLinkBundleIdentifier:(id)a4;
- (void)commonInitWithPrimaryButtonText:(id)a3 privacyLinkController:(id)a4;
- (void)commonSetupWithPrimaryButtonText:(id)a3 privacyLinkBundleIdentifiers:(id)a4;
- (void)commonSetupWithPrimaryButtonText:(id)a3 secondaryButtonText:(id)a4 privacyLinkBundleIdentifiers:(id)a5;
- (void)didTapPrimaryButton:(id)a3;
- (void)didTapSecondaryButton:(id)a3;
- (void)setDescriptionText:(id)a3;
- (void)setImage:(id)a3;
- (void)setMetricsQueue:(id)a3;
- (void)setPrimaryButtonCallback:(id)a3;
- (void)setPrimaryButtonText:(id)a3;
- (void)setPrivacyLinkController:(id)a3;
- (void)setRightImage:(id)a3;
- (void)setSecondaryButtonCallback:(id)a3;
- (void)setSecondaryButtonText:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setViewHasAppeared:(BOOL)a3;
- (void)setWasNavigationBarHidden:(BOOL)a3;
- (void)setWelcomeController:(id)a3;
- (void)updateOverrideTraits;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation AMSUIOnboardingViewController

- (AMSUIOnboardingViewController)initWithHeaderImage:(id)a3 titleText:(id)a4 descriptionText:(id)a5 primaryButtonText:(id)a6 secondaryButtonText:(id)a7 privacyLinkController:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id obj = a7;
  id v18 = a7;
  v28.receiver = self;
  v28.super_class = (Class)AMSUIOnboardingViewController;
  id v19 = a8;
  v20 = [(AMSUIOnboardingViewController *)&v28 initWithNibName:0 bundle:0];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_titleText, a4);
    objc_storeStrong((id *)&v21->_descriptionText, a5);
    objc_storeStrong((id *)&v21->_primaryButtonText, a6);
    objc_storeStrong((id *)&v21->_secondaryButtonText, obj);
    objc_storeStrong((id *)&v21->_image, a3);
    uint64_t v22 = [objc_alloc((Class)getOBWelcomeControllerClass()) initWithTitle:v15 detailText:v16 icon:v14];
    welcomeController = v21->_welcomeController;
    v21->_welcomeController = (OBWelcomeController *)v22;

    v24 = +[AMSUIOnboardingViewController privacyLinkIdentifiersFromController:v19];
    [(AMSUIOnboardingViewController *)v21 commonSetupWithPrimaryButtonText:v17 secondaryButtonText:v18 privacyLinkBundleIdentifiers:v24];
  }
  return v21;
}

- (AMSUIOnboardingViewController)initWithHeaderImage:(id)a3 titleText:(id)a4 descriptionText:(id)a5 primaryButtonText:(id)a6 privacyLinkController:(id)a7
{
  id v23 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)AMSUIOnboardingViewController;
  id v17 = [(AMSUIOnboardingViewController *)&v24 initWithNibName:0 bundle:0];
  id v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_titleText, a4);
    objc_storeStrong((id *)&v18->_descriptionText, a5);
    objc_storeStrong((id *)&v18->_primaryButtonText, a6);
    objc_storeStrong((id *)&v18->_image, a3);
    uint64_t v19 = [objc_alloc((Class)getOBWelcomeControllerClass()) initWithTitle:v13 detailText:v14 icon:v23];
    welcomeController = v18->_welcomeController;
    v18->_welcomeController = (OBWelcomeController *)v19;

    v21 = +[AMSUIOnboardingViewController privacyLinkIdentifiersFromController:v16];
    [(AMSUIOnboardingViewController *)v18 commonSetupWithPrimaryButtonText:v15 privacyLinkBundleIdentifiers:v21];
  }
  return v18;
}

- (AMSUIOnboardingViewController)initWithTitleText:(id)a3 features:(id)a4 primaryButtonText:(id)a5 privacyLinkController:(id)a6
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v38.receiver = self;
  v38.super_class = (Class)AMSUIOnboardingViewController;
  id v15 = [(AMSUIOnboardingViewController *)&v38 initWithNibName:0 bundle:0];
  id v16 = v15;
  if (v15)
  {
    id v31 = v14;
    objc_storeStrong((id *)&v15->_titleText, a3);
    objc_storeStrong((id *)&v16->_primaryButtonText, a5);
    id v33 = v11;
    uint64_t v17 = [objc_alloc((Class)getOBWelcomeControllerClass()) initWithTitle:v11 detailText:0 icon:0];
    welcomeController = v16->_welcomeController;
    v16->_welcomeController = (OBWelcomeController *)v17;

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v32 = v12;
    id v19 = v12;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v35 != v22) {
            objc_enumerationMutation(v19);
          }
          objc_super v24 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          v25 = v16->_welcomeController;
          v26 = objc_msgSend(v24, "titleText", v31);
          v27 = [v24 descriptionText];
          objc_super v28 = [v24 image];
          [(OBWelcomeController *)v25 addBulletedListItemWithTitle:v26 description:v27 image:v28];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v21);
    }

    id v14 = v31;
    v29 = +[AMSUIOnboardingViewController privacyLinkIdentifiersFromController:v31];
    [(AMSUIOnboardingViewController *)v16 commonSetupWithPrimaryButtonText:v13 privacyLinkBundleIdentifiers:v29];

    id v12 = v32;
    id v11 = v33;
  }

  return v16;
}

- (AMSUIOnboardingViewController)initWithHeaderImage:(id)a3 titleText:(id)a4 descriptionText:(id)a5 primaryButtonText:(id)a6 privacyLinkBundleIdentifier:(id)a7
{
  v25[1] = *MEMORY[0x263EF8340];
  id v23 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)AMSUIOnboardingViewController;
  uint64_t v17 = [(AMSUIOnboardingViewController *)&v24 initWithNibName:0 bundle:0];
  id v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_titleText, a4);
    objc_storeStrong((id *)&v18->_descriptionText, a5);
    objc_storeStrong((id *)&v18->_primaryButtonText, a6);
    objc_storeStrong((id *)&v18->_image, a3);
    uint64_t v19 = [objc_alloc((Class)getOBWelcomeControllerClass()) initWithTitle:v13 detailText:v14 icon:v23];
    welcomeController = v18->_welcomeController;
    v18->_welcomeController = (OBWelcomeController *)v19;

    v25[0] = v16;
    uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
    [(AMSUIOnboardingViewController *)v18 commonSetupWithPrimaryButtonText:v15 privacyLinkBundleIdentifiers:v21];
  }
  return v18;
}

- (AMSUIOnboardingViewController)initWithHeaderImage:(id)a3 titleText:(id)a4 features:(id)a5 primaryButtonText:(id)a6 privacyLinkBundleIdentifier:(id)a7
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v42.receiver = self;
  v42.super_class = (Class)AMSUIOnboardingViewController;
  id v18 = [(AMSUIOnboardingViewController *)&v42 initWithNibName:0 bundle:0];
  uint64_t v19 = v18;
  if (v18)
  {
    id v34 = v17;
    objc_storeStrong((id *)&v18->_titleText, a4);
    objc_storeStrong((id *)&v19->_primaryButtonText, a6);
    objc_storeStrong((id *)&v19->_image, a3);
    id v36 = v14;
    id v37 = v13;
    uint64_t v20 = [objc_alloc((Class)getOBWelcomeControllerClass()) initWithTitle:v14 detailText:0 icon:v13];
    welcomeController = v19->_welcomeController;
    v19->_welcomeController = (OBWelcomeController *)v20;

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v35 = v15;
    id v22 = v15;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v39 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          objc_super v28 = v19->_welcomeController;
          v29 = [v27 titleText];
          v30 = [v27 descriptionText];
          id v31 = [v27 image];
          [(OBWelcomeController *)v28 addBulletedListItemWithTitle:v29 description:v30 image:v31];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v24);
    }

    id v17 = v34;
    id v43 = v34;
    id v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v43 count:1];
    [(AMSUIOnboardingViewController *)v19 commonSetupWithPrimaryButtonText:v16 privacyLinkBundleIdentifiers:v32];

    id v14 = v36;
    id v13 = v37;
    id v15 = v35;
  }

  return v19;
}

- (AMSUIOnboardingViewController)initWithTitleText:(id)a3 features:(id)a4 primaryButtonText:(id)a5 privacyLinkBundleIdentifier:(id)a6
{
  return [(AMSUIOnboardingViewController *)self initWithHeaderImage:0 titleText:a3 features:a4 primaryButtonText:a5 privacyLinkBundleIdentifier:a6];
}

- (void)commonSetupWithPrimaryButtonText:(id)a3 privacyLinkBundleIdentifiers:(id)a4
{
}

- (void)commonSetupWithPrimaryButtonText:(id)a3 secondaryButtonText:(id)a4 privacyLinkBundleIdentifiers:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AppleMediaServicesUI.onboardingMetrics", 0);
  metricsQueue = self->_metricsQueue;
  self->_metricsQueue = v11;

  if (v10)
  {
    id v13 = [(AMSUIOnboardingViewController *)self welcomeController];
    id v14 = [v13 buttonTray];
    [v14 addPrivacyLinkForBundles:v10];
  }
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x2050000000;
  id v15 = (void *)getOBBoldTrayButtonClass_softClass;
  uint64_t v33 = getOBBoldTrayButtonClass_softClass;
  if (!getOBBoldTrayButtonClass_softClass)
  {
    uint64_t v25 = MEMORY[0x263EF8330];
    uint64_t v26 = 3221225472;
    v27 = __getOBBoldTrayButtonClass_block_invoke;
    objc_super v28 = &unk_2643E33D8;
    v29 = &v30;
    __getOBBoldTrayButtonClass_block_invoke((uint64_t)&v25);
    id v15 = (void *)v31[3];
  }
  id v16 = v15;
  _Block_object_dispose(&v30, 8);
  id v17 = [v16 boldButton];
  [v17 setTitle:v8 forState:0];
  [v17 setAccessibilityIdentifier:@"amsui.onboarding.primaryButton"];
  [v17 addTarget:self action:sel_didTapPrimaryButton_ forControlEvents:64];
  id v18 = [(AMSUIOnboardingViewController *)self welcomeController];
  uint64_t v19 = [v18 buttonTray];
  [v19 addButton:v17];

  if (v9)
  {
    uint64_t v30 = 0;
    id v31 = &v30;
    uint64_t v32 = 0x2050000000;
    uint64_t v20 = (void *)getOBLinkTrayButtonClass_softClass;
    uint64_t v33 = getOBLinkTrayButtonClass_softClass;
    if (!getOBLinkTrayButtonClass_softClass)
    {
      uint64_t v25 = MEMORY[0x263EF8330];
      uint64_t v26 = 3221225472;
      v27 = __getOBLinkTrayButtonClass_block_invoke;
      objc_super v28 = &unk_2643E33D8;
      v29 = &v30;
      __getOBLinkTrayButtonClass_block_invoke((uint64_t)&v25);
      uint64_t v20 = (void *)v31[3];
    }
    id v21 = v20;
    _Block_object_dispose(&v30, 8);
    id v22 = [v21 linkButton];
    [v22 setTitle:v9 forState:0];
    [v17 setAccessibilityIdentifier:@"amsui.onboarding.secondaryButton"];
    [v22 addTarget:self action:sel_didTapSecondaryButton_ forControlEvents:64];
    uint64_t v23 = [(AMSUIOnboardingViewController *)self welcomeController];
    uint64_t v24 = [v23 buttonTray];
    [v24 addButton:v22];
  }
}

- (void)commonInitWithPrimaryButtonText:(id)a3 privacyLinkBundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [getOBPrivacyLinkControllerClass() linkWithBundleIdentifier:v6];

  [(AMSUIOnboardingViewController *)self commonInitWithPrimaryButtonText:v7 privacyLinkController:v8];
}

- (void)commonInitWithPrimaryButtonText:(id)a3 privacyLinkController:(id)a4
{
  self->_metricsQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AppleMediaServicesUI.onboardingMetrics", 0);
  MEMORY[0x270F9A758]();
}

- (void)viewDidLoad
{
  v27.receiver = self;
  v27.super_class = (Class)AMSUIOnboardingViewController;
  [(AMSUIOnboardingViewController *)&v27 viewDidLoad];
  v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v4 = [(AMSUIOnboardingViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [(AMSUIOnboardingViewController *)self welcomeController];

  if (v5)
  {
    id v6 = [(AMSUIOnboardingViewController *)self welcomeController];
    [(AMSUIOnboardingViewController *)self addChildViewController:v6];

    id v7 = [(AMSUIOnboardingViewController *)self welcomeController];
    [v7 setModalPresentationStyle:2];

    id v8 = [(AMSUIOnboardingViewController *)self welcomeController];
    id v9 = [v8 view];
    [v9 setAutoresizingMask:18];

    id v10 = [(AMSUIOnboardingViewController *)self view];
    [v10 frame];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    uint64_t v19 = [(AMSUIOnboardingViewController *)self welcomeController];
    uint64_t v20 = [v19 view];
    objc_msgSend(v20, "setFrame:", v12, v14, v16, v18);

    id v21 = [(AMSUIOnboardingViewController *)self welcomeController];
    id v22 = [v21 view];
    [v22 setAccessibilityIdentifier:@"amsui.onboarding"];

    uint64_t v23 = [(AMSUIOnboardingViewController *)self view];
    uint64_t v24 = [(AMSUIOnboardingViewController *)self welcomeController];
    uint64_t v25 = [v24 view];
    [v23 addSubview:v25];

    uint64_t v26 = [(AMSUIOnboardingViewController *)self welcomeController];
    [v26 didMoveToParentViewController:self];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AMSUIOnboardingViewController;
  -[AMSUIOnboardingViewController viewWillAppear:](&v8, sel_viewWillAppear_);
  v5 = [(AMSUIOnboardingViewController *)self navigationController];
  -[AMSUIOnboardingViewController setWasNavigationBarHidden:](self, "setWasNavigationBarHidden:", [v5 isNavigationBarHidden]);

  id v6 = [(AMSUIOnboardingViewController *)self navigationController];
  [v6 setNavigationBarHidden:1 animated:v3];

  id v7 = [(AMSUIOnboardingViewController *)self navigationController];
  [v7 setModalInPresentation:1];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)AMSUIOnboardingViewController;
  -[AMSUIOnboardingViewController viewWillDisappear:](&v6, sel_viewWillDisappear_);
  v5 = [(AMSUIOnboardingViewController *)self navigationController];
  objc_msgSend(v5, "setNavigationBarHidden:animated:", -[AMSUIOnboardingViewController wasNavigationBarHidden](self, "wasNavigationBarHidden"), v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AMSUIOnboardingViewController;
  [(AMSUIOnboardingViewController *)&v4 viewDidAppear:a3];
  [(AMSUIOnboardingViewController *)self viewHasAppeared];
  [(AMSUIOnboardingViewController *)self setViewHasAppeared:1];
}

- (void)viewDidLayoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)AMSUIOnboardingViewController;
  [(AMSUIOnboardingViewController *)&v2 viewDidLayoutSubviews];
}

- (CGSize)preferredContentSize
{
  objc_super v2 = [(AMSUIOnboardingViewController *)self welcomeController];
  [v2 preferredContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  objc_super v2 = [(AMSUIOnboardingViewController *)self traitCollection];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (UITraitCollection)cappedTraitCollection
{
  v14[2] = *MEMORY[0x263EF8340];
  if (cappedTraitCollection_onceToken != -1) {
    dispatch_once(&cappedTraitCollection_onceToken, &__block_literal_global_10);
  }
  uint64_t v3 = [(AMSUIOnboardingViewController *)self traitCollection];
  double v4 = [v3 preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v4))
  {
    double v5 = (void *)cappedTraitCollection_cappedSizes;
    double v6 = [(AMSUIOnboardingViewController *)self traitCollection];
    double v7 = [v6 preferredContentSizeCategory];
    LODWORD(v5) = [v5 containsObject:v7];

    if (v5)
    {
      double v8 = (void *)MEMORY[0x263F82DA0];
      id v9 = [(AMSUIOnboardingViewController *)self traitCollection];
      v14[0] = v9;
      id v10 = [MEMORY[0x263F82DA0] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x263F83418]];
      v14[1] = v10;
      double v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
      double v12 = [v8 traitCollectionWithTraitsFromCollections:v11];

      goto LABEL_8;
    }
  }
  else
  {
  }
  double v12 = 0;
LABEL_8:
  return (UITraitCollection *)v12;
}

void __54__AMSUIOnboardingViewController_cappedTraitCollection__block_invoke()
{
  v3[3] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F83408];
  v3[0] = *MEMORY[0x263F83410];
  v3[1] = v0;
  v3[2] = *MEMORY[0x263F83400];
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:3];
  objc_super v2 = (void *)cappedTraitCollection_cappedSizes;
  cappedTraitCollection_cappedSizes = v1;
}

- (id)childTraitCollectionForViewController:(id)a3
{
  id v4 = a3;
  getOBPrivacyLinkControllerClass();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v6 = [(AMSUIOnboardingViewController *)self cappedTraitCollection];
  }
  else
  {
    double v6 = 0;
  }
  return v6;
}

- (void)updateOverrideTraits
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [(AMSUIOnboardingViewController *)self childViewControllers];
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
        id v9 = [(AMSUIOnboardingViewController *)self childTraitCollectionForViewController:v8];
        [(AMSUIOnboardingViewController *)self setOverrideTraitCollection:v9 forChildViewController:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (id)keyCommands
{
  uint64_t v3 = [MEMORY[0x263F82890] keyCommandWithInput:@"\r" modifierFlags:0 action:sel_didTapPrimaryButton_];
  uint64_t v4 = [(AMSUIOnboardingViewController *)self primaryButtonText];
  [v3 setTitle:v4];

  v11.receiver = self;
  v11.super_class = (Class)AMSUIOnboardingViewController;
  uint64_t v5 = [(AMSUIOnboardingViewController *)&v11 keyCommands];
  uint64_t v6 = (void *)v5;
  double v7 = (void *)MEMORY[0x263EFFA68];
  if (v5) {
    double v7 = (void *)v5;
  }
  id v8 = v7;

  id v9 = [v8 arrayByAddingObject:v3];

  return v9;
}

- (void)didTapSecondaryButton:(id)a3
{
  uint64_t v4 = [(AMSUIOnboardingViewController *)self secondaryButtonCallback];

  if (v4)
  {
    uint64_t v5 = [(AMSUIOnboardingViewController *)self secondaryButtonCallback];
    v5[2](v5, self);
  }
}

- (void)didTapPrimaryButton:(id)a3
{
  uint64_t v4 = [(AMSUIOnboardingViewController *)self primaryButtonCallback];

  if (v4)
  {
    uint64_t v5 = [(AMSUIOnboardingViewController *)self primaryButtonCallback];
    v5[2](v5, self);
  }
}

- (BOOL)isPresentedInFormSheet
{
  uint64_t v3 = [(AMSUIOnboardingViewController *)self navigationController];
  uint64_t v4 = (void *)v3;
  if (v3) {
    uint64_t v5 = (AMSUIOnboardingViewController *)v3;
  }
  else {
    uint64_t v5 = self;
  }
  uint64_t v6 = v5;

  double v7 = [(AMSUIOnboardingViewController *)v6 presentationController];

  id v8 = [v7 _activePresentationController];
  BOOL v9 = [v8 presentationStyle] == 2;

  return v9;
}

+ (id)privacyLinkIdentifiersFromController:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = objc_msgSend(v3, "bundles", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) identifier];
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (UIImage)rightImage
{
  return self->_rightImage;
}

- (void)setRightImage:(id)a3
{
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (void)setDescriptionText:(id)a3
{
}

- (NSString)primaryButtonText
{
  return self->_primaryButtonText;
}

- (void)setPrimaryButtonText:(id)a3
{
}

- (OBPrivacyLinkController)privacyLinkController
{
  return self->_privacyLinkController;
}

- (void)setPrivacyLinkController:(id)a3
{
}

- (id)primaryButtonCallback
{
  return self->_primaryButtonCallback;
}

- (void)setPrimaryButtonCallback:(id)a3
{
}

- (id)secondaryButtonCallback
{
  return self->_secondaryButtonCallback;
}

- (void)setSecondaryButtonCallback:(id)a3
{
}

- (OBWelcomeController)welcomeController
{
  return self->_welcomeController;
}

- (void)setWelcomeController:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSString)secondaryButtonText
{
  return self->_secondaryButtonText;
}

- (void)setSecondaryButtonText:(id)a3
{
}

- (OS_dispatch_queue)metricsQueue
{
  return self->_metricsQueue;
}

- (void)setMetricsQueue:(id)a3
{
}

- (BOOL)viewHasAppeared
{
  return self->_viewHasAppeared;
}

- (void)setViewHasAppeared:(BOOL)a3
{
  self->_viewHasAppeared = a3;
}

- (BOOL)wasNavigationBarHidden
{
  return self->_wasNavigationBarHidden;
}

- (void)setWasNavigationBarHidden:(BOOL)a3
{
  self->_wasNavigationBarHidden = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsQueue, 0);
  objc_storeStrong((id *)&self->_secondaryButtonText, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_welcomeController, 0);
  objc_storeStrong(&self->_secondaryButtonCallback, 0);
  objc_storeStrong(&self->_primaryButtonCallback, 0);
  objc_storeStrong((id *)&self->_privacyLinkController, 0);
  objc_storeStrong((id *)&self->_primaryButtonText, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_rightImage, 0);
}

@end