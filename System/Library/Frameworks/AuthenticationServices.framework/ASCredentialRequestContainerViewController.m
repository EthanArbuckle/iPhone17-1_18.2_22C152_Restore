@interface ASCredentialRequestContainerViewController
- (ASCredentialRequestContainerViewController)initWithRootViewController:(id)a3;
- (ASCredentialRequestPaneViewControllerDelegate)paneDelegate;
- (UIViewController)rootViewController;
- (UIVisualEffectView)blurBackgroundView;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (unint64_t)supportedInterfaceOrientations;
- (void)_clearPaneDelegateForViewController:(id)a3;
- (void)_setPaneDelegate:(id)a3 forViewController:(id)a4;
- (void)_setPaneDelegateForTopViewController;
- (void)_setPaneDelegateForViewController:(id)a3;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setBlurBackgroundView:(id)a3;
- (void)setPaneDelegate:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ASCredentialRequestContainerViewController

- (ASCredentialRequestContainerViewController)initWithRootViewController:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASCredentialRequestContainerViewController;
  v6 = [(ASCredentialRequestContainerViewController *)&v10 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_rootViewController, a3);
    if ([MEMORY[0x263F29440] isPad])
    {
      [(ASCredentialRequestContainerViewController *)v7 setModalPresentationStyle:2];
      [(ASCredentialRequestContainerViewController *)v7 setModalInPresentation:1];
    }
    else
    {
      [(ASCredentialRequestContainerViewController *)v7 setModalPresentationStyle:4];
      [(ASCredentialRequestContainerViewController *)v7 setTransitioningDelegate:v7];
    }
    v8 = v7;
  }

  return v7;
}

- (void)viewDidLoad
{
  v46[4] = *MEMORY[0x263EF8340];
  v45.receiver = self;
  v45.super_class = (Class)ASCredentialRequestContainerViewController;
  [(ASCredentialRequestContainerViewController *)&v45 viewDidLoad];
  [(ASCredentialRequestContainerViewController *)self addChildViewController:self->_rootViewController];
  if ([MEMORY[0x263F29440] isPad])
  {
    v3 = [(ASCredentialRequestContainerViewController *)self view];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    v12 = [(UIViewController *)self->_rootViewController view];
    objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

    v13 = [(UIViewController *)self->_rootViewController view];
    [v13 setAutoresizingMask:18];
  }
  else
  {
    v13 = [(UIViewController *)self->_rootViewController view];
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  }

  v14 = [(ASCredentialRequestContainerViewController *)self view];
  v15 = [(UIViewController *)self->_rootViewController view];
  [v14 addSubview:v15];

  [(UIViewController *)self->_rootViewController didMoveToParentViewController:self];
  if ([MEMORY[0x263F29440] isPad])
  {
    [(UIViewController *)self->_rootViewController preferredContentSize];
    [(ASCredentialRequestContainerViewController *)self setPreferredContentSize:540.0];
  }
  if (([MEMORY[0x263F29440] isPad] & 1) == 0)
  {
    v16 = [(UIViewController *)self->_rootViewController view];
    v17 = [v16 topAnchor];
    v18 = [(ASCredentialRequestContainerViewController *)self view];
    v19 = [v18 bottomAnchor];
    v44 = [v17 constraintEqualToAnchor:v19];

    LODWORD(v20) = 1144750080;
    [v44 setPriority:v20];
    v21 = [(UIViewController *)self->_rootViewController view];
    v22 = [v21 heightAnchor];
    [(UIViewController *)self->_rootViewController preferredContentSize];
    v24 = [v22 constraintEqualToConstant:v23];
    sheetHeightConstraint = self->_sheetHeightConstraint;
    self->_sheetHeightConstraint = v24;

    v26 = [(UIViewController *)self->_rootViewController view];
    v27 = [v26 bottomAnchor];
    v28 = [(ASCredentialRequestContainerViewController *)self view];
    v29 = [v28 bottomAnchor];
    v30 = [v27 constraintEqualToAnchor:v29];
    sheetPresentedConstraint = self->_sheetPresentedConstraint;
    self->_sheetPresentedConstraint = v30;

    v41 = (void *)MEMORY[0x263F08938];
    v43 = [(UIViewController *)self->_rootViewController view];
    v42 = [v43 leadingAnchor];
    v32 = [(ASCredentialRequestContainerViewController *)self view];
    v33 = [v32 leadingAnchor];
    v34 = [v42 constraintEqualToAnchor:v33];
    v46[0] = v34;
    v35 = [(UIViewController *)self->_rootViewController view];
    v36 = [v35 trailingAnchor];
    v37 = [(ASCredentialRequestContainerViewController *)self view];
    v38 = [v37 trailingAnchor];
    v39 = [v36 constraintEqualToAnchor:v38];
    v46[1] = v39;
    v46[2] = v44;
    v46[3] = self->_sheetHeightConstraint;
    v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:4];
    [v41 activateConstraints:v40];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ASCredentialRequestContainerViewController;
  [(ASCredentialRequestContainerViewController *)&v8 viewWillAppear:a3];
  if (([MEMORY[0x263F29440] isPad] & 1) == 0)
  {
    if ([(ASCredentialRequestContainerViewController *)self isBeingPresented])
    {
      double v4 = [MEMORY[0x263F825C8] clearColor];
      double v5 = [(ASCredentialRequestContainerViewController *)self view];
      [v5 setBackgroundColor:v4];

      double v6 = [(ASCredentialRequestContainerViewController *)self transitionCoordinator];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __61__ASCredentialRequestContainerViewController_viewWillAppear___block_invoke;
      v7[3] = &unk_264396A30;
      v7[4] = self;
      [v6 animateAlongsideTransition:v7 completion:0];
    }
  }
}

void __61__ASCredentialRequestContainerViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 984) setActive:1];
  v2 = [*(id *)(a1 + 32) view];
  [v2 layoutIfNeeded];

  if (*(void *)(*(void *)(a1 + 32) + 1008))
  {
    id v4 = [MEMORY[0x263F824D8] effectWithStyle:4];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1008), "setEffect:");
  }
  else
  {
    id v4 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.800000012];
    v3 = [*(id *)(a1 + 32) view];
    [v3 setBackgroundColor:v4];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ASCredentialRequestContainerViewController;
  [(ASCredentialRequestContainerViewController *)&v6 viewWillDisappear:a3];
  if (([MEMORY[0x263F29440] isPad] & 1) == 0)
  {
    if ([(ASCredentialRequestContainerViewController *)self isBeingDismissed])
    {
      id v4 = [(ASCredentialRequestContainerViewController *)self transitionCoordinator];
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __64__ASCredentialRequestContainerViewController_viewWillDisappear___block_invoke;
      v5[3] = &unk_264396A30;
      v5[4] = self;
      [v4 animateAlongsideTransition:v5 completion:0];
    }
  }
}

void __64__ASCredentialRequestContainerViewController_viewWillDisappear___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 984) setActive:0];
  v2 = [*(id *)(a1 + 32) view];
  [v2 layoutIfNeeded];

  v3 = *(void **)(*(void *)(a1 + 32) + 1008);
  if (v3)
  {
    [v3 setEffect:0];
  }
  else
  {
    id v5 = [MEMORY[0x263F825C8] clearColor];
    id v4 = [*(id *)(a1 + 32) view];
    [v4 setBackgroundColor:v5];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  if ([MEMORY[0x263F29440] isPad]) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)setPaneDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_paneDelegate, a3);

  [(ASCredentialRequestContainerViewController *)self _setPaneDelegateForTopViewController];
}

- (void)_setPaneDelegateForTopViewController
{
  v3 = [(ASCredentialRequestContainerViewController *)self rootViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [(ASCredentialRequestContainerViewController *)self rootViewController];
    id v5 = [v6 topViewController];
    [(ASCredentialRequestContainerViewController *)self _setPaneDelegateForViewController:v5];
  }
}

- (void)_setPaneDelegateForViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCredentialRequestContainerViewController *)self paneDelegate];
  [(ASCredentialRequestContainerViewController *)self _setPaneDelegate:v5 forViewController:v4];
}

- (void)_clearPaneDelegateForViewController:(id)a3
{
}

- (void)_setPaneDelegate:(id)a3 forViewController:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setDelegate:v6];
  }
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v8 = a4;
  double v7 = [a3 topViewController];
  [(ASCredentialRequestContainerViewController *)self _clearPaneDelegateForViewController:v7];

  [(ASCredentialRequestContainerViewController *)self _setPaneDelegateForViewController:v8];
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4 = (UIViewController *)a3;
  v11.receiver = self;
  v11.super_class = (Class)ASCredentialRequestContainerViewController;
  [(ASCredentialRequestContainerViewController *)&v11 preferredContentSizeDidChangeForChildContentContainer:v4];
  if (self->_rootViewController == v4)
  {
    int v5 = [MEMORY[0x263F29440] isPad];
    [(UIViewController *)v4 preferredContentSize];
    if (v5)
    {
      [(ASCredentialRequestContainerViewController *)self setPreferredContentSize:540.0];
      if (([(ASCredentialRequestContainerViewController *)self isBeingPresented] & 1) == 0)
      {
        double v7 = [(ASCredentialRequestContainerViewController *)self sheetPresentationController];
        [v7 animateChanges:&__block_literal_global_84];
LABEL_8:
      }
    }
    else
    {
      [(NSLayoutConstraint *)self->_sheetHeightConstraint setConstant:v6];
      if (([(ASCredentialRequestContainerViewController *)self isBeingPresented] & 1) == 0)
      {
        id v8 = [(UIViewController *)self->_rootViewController transitionCoordinator];
        double v7 = v8;
        if (v8)
        {
          v9[0] = MEMORY[0x263EF8330];
          v9[1] = 3221225472;
          v9[2] = __100__ASCredentialRequestContainerViewController_preferredContentSizeDidChangeForChildContentContainer___block_invoke_3;
          v9[3] = &unk_264396A78;
          v9[4] = self;
          id v10 = &__block_literal_global_86;
          objc_msgSend(v8, "animateAlongsideTransition:completion:", v9);
        }
        goto LABEL_8;
      }
    }
  }
}

void __100__ASCredentialRequestContainerViewController_preferredContentSizeDidChangeForChildContentContainer___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v5 = [v2 containerView];
  v3 = [v2 viewForKey:*MEMORY[0x263F83C08]];
  id v4 = [v2 viewForKey:*MEMORY[0x263F83C18]];

  [v5 bounds];
  objc_msgSend(v3, "setFrame:");
  [v5 bounds];
  objc_msgSend(v4, "setFrame:");
}

void __100__ASCredentialRequestContainerViewController_preferredContentSizeDidChangeForChildContentContainer___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v5 = a2;
  id v4 = [v3 view];
  [v4 layoutIfNeeded];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  if (objc_msgSend(MEMORY[0x263F29440], "isPad", a3, a4, a5)) {
    id v5 = 0;
  }
  else {
    id v5 = [[ASCredentialRequestContainerViewControllerAnimator alloc] initWithPresenting:1];
  }

  return v5;
}

- (id)animationControllerForDismissedController:(id)a3
{
  if (objc_msgSend(MEMORY[0x263F29440], "isPad", a3)) {
    v3 = 0;
  }
  else {
    v3 = [[ASCredentialRequestContainerViewControllerAnimator alloc] initWithPresenting:0];
  }

  return v3;
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

- (ASCredentialRequestPaneViewControllerDelegate)paneDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paneDelegate);

  return (ASCredentialRequestPaneViewControllerDelegate *)WeakRetained;
}

- (UIVisualEffectView)blurBackgroundView
{
  return self->_blurBackgroundView;
}

- (void)setBlurBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurBackgroundView, 0);
  objc_destroyWeak((id *)&self->_paneDelegate);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_sheetPresentedConstraint, 0);

  objc_storeStrong((id *)&self->_sheetHeightConstraint, 0);
}

@end