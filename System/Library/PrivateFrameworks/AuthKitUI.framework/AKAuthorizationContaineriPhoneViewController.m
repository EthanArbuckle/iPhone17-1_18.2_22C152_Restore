@interface AKAuthorizationContaineriPhoneViewController
- (AKAuthorizationContaineriPhoneViewController)init;
- (AKAuthorizationContaineriPhoneViewController)initWithRootViewController:(id)a3 authorizationContext:(id)a4;
- (BOOL)_delegate_authorizationContainerViewControllerShouldDismiss;
- (CGRect)_dismissalFrameForContentSize:(CGSize)a3;
- (CGRect)_layoutFrameForContentSize:(CGSize)a3;
- (CGSize)containerContentSize;
- (UIVisualEffectView)blurBackgroundView;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (void)_delegate_authorizationContainerViewControllerDidDismiss;
- (void)_handleTapGesture:(id)a3;
- (void)_layoutContainerView:(BOOL)a3;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setBlurBackgroundView:(id)a3;
- (void)setContainerContentSize:(CGSize)a3;
- (void)setContainerContentSize:(CGSize)a3 animated:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation AKAuthorizationContaineriPhoneViewController

- (AKAuthorizationContaineriPhoneViewController)init
{
  return [(AKAuthorizationContaineriPhoneViewController *)self initWithRootViewController:0 authorizationContext:0];
}

- (AKAuthorizationContaineriPhoneViewController)initWithRootViewController:(id)a3 authorizationContext:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)AKAuthorizationContaineriPhoneViewController;
  v4 = [(AKAuthorizationContainerViewController *)&v11 initWithRootViewController:a3 authorizationContext:a4];
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    [(AKAuthorizationContaineriPhoneViewController *)v6 setModalPresentationStyle:4];
    [(AKAuthorizationContaineriPhoneViewController *)v6 setTransitioningDelegate:v6];
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v6 action:sel__handleTapGesture_];
    tapGestureRecognizer = v6->_tapGestureRecognizer;
    v6->_tapGestureRecognizer = (UITapGestureRecognizer *)v7;

    v9 = v6->_tapGestureRecognizer;
    [(UITapGestureRecognizer *)v9 setCancelsTouchesInView:0];
  }
  return v5;
}

- (void)viewDidLoad
{
  v37[4] = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)AKAuthorizationContaineriPhoneViewController;
  [(AKAuthorizationContaineriPhoneViewController *)&v36 viewDidLoad];
  v3 = [(AKAuthorizationContaineriPhoneViewController *)self view];
  [v3 addGestureRecognizer:self->_tapGestureRecognizer];

  v4 = [(AKAuthorizationContaineriPhoneViewController *)self view];
  [v4 setOpaque:0];

  if (+[AKAuthorizationAppearance shouldShowBlurBackground])
  {
    v5 = [(AKAuthorizationContainerViewController *)self presentationContext];
    v6 = [v5 credentialRequestContext];
    int v7 = [v6 _isRapportLogin];

    if (v7)
    {
      v8 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:0];
      blurBackgroundView = self->_blurBackgroundView;
      self->_blurBackgroundView = v8;

      v10 = self->_blurBackgroundView;
      objc_super v11 = [(AKAuthorizationContaineriPhoneViewController *)self view];
      [v11 frame];
      -[UIVisualEffectView setFrame:](v10, "setFrame:");

      [(UIVisualEffectView *)self->_blurBackgroundView setAutoresizingMask:18];
      v12 = [(AKAuthorizationContaineriPhoneViewController *)self view];
      [v12 insertSubview:self->_blurBackgroundView atIndex:0];
    }
  }
  v13 = [(AKAuthorizationContainerViewController *)self rootViewController];
  v14 = v13;
  if (v13)
  {
    [v13 willMoveToParentViewController:self];
    [(AKAuthorizationContaineriPhoneViewController *)self addChildViewController:v14];
    v15 = [v14 view];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    v16 = [(AKAuthorizationContaineriPhoneViewController *)self view];
    [v16 addSubview:v15];

    [v14 didMoveToParentViewController:self];
    v17 = [v15 topAnchor];
    v18 = [(AKAuthorizationContaineriPhoneViewController *)self view];
    v19 = [v18 topAnchor];
    v20 = [v17 constraintEqualToAnchor:v19];
    rootViewTopConstraint = self->_rootViewTopConstraint;
    self->_rootViewTopConstraint = v20;

    v22 = [v15 heightAnchor];
    v23 = [v22 constraintEqualToConstant:0.0];
    rootViewHeightConstraint = self->_rootViewHeightConstraint;
    self->_rootViewHeightConstraint = v23;

    v32 = (void *)MEMORY[0x1E4F28DC8];
    v34 = [v15 leadingAnchor];
    v35 = [(AKAuthorizationContaineriPhoneViewController *)self view];
    v33 = [v35 leadingAnchor];
    v25 = [v34 constraintEqualToAnchor:v33];
    v37[0] = v25;
    v26 = [v15 trailingAnchor];
    v27 = [(AKAuthorizationContaineriPhoneViewController *)self view];
    v28 = [v27 trailingAnchor];
    v29 = [v26 constraintEqualToAnchor:v28];
    v30 = self->_rootViewTopConstraint;
    v37[1] = v29;
    v37[2] = v30;
    v37[3] = self->_rootViewHeightConstraint;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
    [v32 activateConstraints:v31];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AKAuthorizationContaineriPhoneViewController;
  [(AKAuthorizationContaineriPhoneViewController *)&v8 viewWillAppear:a3];
  if ([(AKAuthorizationContaineriPhoneViewController *)self isBeingPresented])
  {
    v4 = [(AKAuthorizationContaineriPhoneViewController *)self view];
    v5 = [MEMORY[0x1E4F428B8] clearColor];
    [v4 setBackgroundColor:v5];

    if (+[AKAuthorizationAppearance shouldShowBlurBackground])
    {
      v6 = [(AKAuthorizationContaineriPhoneViewController *)self transitionCoordinator];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __63__AKAuthorizationContaineriPhoneViewController_viewWillAppear___block_invoke;
      v7[3] = &unk_1E648F230;
      v7[4] = self;
      [v6 animateAlongsideTransition:v7 completion:0];
    }
  }
}

void __63__AKAuthorizationContaineriPhoneViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 preferredContentSize];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [v4 isAnimated];

  objc_msgSend(v3, "setContainerContentSize:animated:", v9, v6, v8);
  if (*(void *)(*(void *)(a1 + 32) + 1032))
  {
    objc_msgSend(MEMORY[0x1E4F427D8], "effectWithStyle:", +[AKAuthorizationAppearance paneBlurEffectStyle](AKAuthorizationAppearance, "paneBlurEffectStyle"));
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1032), "setEffect:");
  }
  else
  {
    id v11 = +[AKAuthorizationAppearance translucentBackdropColor];
    v10 = [*(id *)(a1 + 32) view];
    [v10 setBackgroundColor:v11];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)AKAuthorizationContaineriPhoneViewController;
  [(AKAuthorizationContaineriPhoneViewController *)&v14 viewDidAppear:a3];
  id v4 = [(AKAuthorizationContainerViewController *)self rootViewController];
  [v4 preferredContentSize];
  double v6 = v5;
  double v8 = v7;

  -[AKAuthorizationContaineriPhoneViewController _dismissalFrameForContentSize:](self, "_dismissalFrameForContentSize:", v6, v8);
  double v10 = v9;
  double v12 = v11;
  if ([(AKAuthorizationContaineriPhoneViewController *)self isBeingPresented])
  {
    [(NSLayoutConstraint *)self->_rootViewTopConstraint setConstant:v10];
    [(NSLayoutConstraint *)self->_rootViewHeightConstraint setConstant:v12];
    v13 = [(AKAuthorizationContaineriPhoneViewController *)self view];
    [v13 layoutIfNeeded];

    -[AKAuthorizationContaineriPhoneViewController setContainerContentSize:animated:](self, "setContainerContentSize:animated:", 1, v6, v8);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AKAuthorizationContaineriPhoneViewController;
  [(AKAuthorizationContaineriPhoneViewController *)&v6 viewWillDisappear:a3];
  if (+[AKAuthorizationAppearance shouldShowBlurBackground])
  {
    if ([(AKAuthorizationContaineriPhoneViewController *)self isBeingDismissed])
    {
      id v4 = [(AKAuthorizationContaineriPhoneViewController *)self transitionCoordinator];
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __66__AKAuthorizationContaineriPhoneViewController_viewWillDisappear___block_invoke;
      v5[3] = &unk_1E648F230;
      v5[4] = self;
      [v4 animateAlongsideTransition:v5 completion:0];
    }
  }
}

void __66__AKAuthorizationContaineriPhoneViewController_viewWillDisappear___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1[129])
  {
    v2 = (void *)v1[129];
    [v2 setEffect:0];
  }
  else
  {
    id v4 = [v1 view];
    v3 = [MEMORY[0x1E4F428B8] clearColor];
    [v4 setBackgroundColor:v3];
  }
}

- (void)setContainerContentSize:(CGSize)a3
{
}

- (void)setContainerContentSize:(CGSize)a3 animated:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  p_containerContentSize = &self->_containerContentSize;
  if (self->_containerContentSize.width != a3.width || self->_containerContentSize.height != a3.height)
  {
    BOOL v8 = a4;
    double v10 = [(AKAuthorizationContaineriPhoneViewController *)self view];
    [v10 bounds];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;

    v22.origin.x = v12;
    v22.origin.y = v14;
    v22.size.double width = v16;
    v22.size.double height = v18;
    double v19 = CGRectGetWidth(v22);
    if (v19 < width) {
      double width = v19;
    }
    v23.origin.x = v12;
    v23.origin.y = v14;
    v23.size.double width = v16;
    v23.size.double height = v18;
    double v20 = CGRectGetHeight(v23);
    if (v20 >= height) {
      double v20 = height;
    }
    p_containerContentSize->double width = width;
    p_containerContentSize->double height = v20;
    [(AKAuthorizationContaineriPhoneViewController *)self _layoutContainerView:v8];
  }
}

- (void)_layoutContainerView:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(AKAuthorizationContainerViewController *)self rootViewController];
  objc_super v6 = [v5 viewIfLoaded];

  if (v6)
  {
    [(AKAuthorizationContaineriPhoneViewController *)self containerContentSize];
    [(AKAuthorizationContaineriPhoneViewController *)self _layoutFrameForContentSize:"_layoutFrameForContentSize:"];
    CGFloat v8 = v7;
    double v10 = v9;
    CGFloat v12 = v11;
    double v14 = v13;
    [v6 frame];
    v21.origin.x = v8;
    v21.origin.y = v10;
    v21.size.double width = v12;
    v21.size.double height = v14;
    if (!CGRectEqualToRect(v20, v21))
    {
      [(NSLayoutConstraint *)self->_rootViewHeightConstraint setConstant:v14];
      [(NSLayoutConstraint *)self->_rootViewTopConstraint setConstant:v10];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __69__AKAuthorizationContaineriPhoneViewController__layoutContainerView___block_invoke;
      v19[3] = &unk_1E648EF28;
      v19[4] = self;
      uint64_t v15 = MEMORY[0x1C8777520](v19);
      CGFloat v16 = (void *)v15;
      if (v3)
      {
        id v17 = objc_alloc_init(MEMORY[0x1E4F42E18]);
        CGFloat v18 = (void *)[objc_alloc(MEMORY[0x1E4F43008]) initWithDuration:v17 timingParameters:0.35];
        [v18 addAnimations:v16];
        [v18 startAnimation];
      }
      else
      {
        (*(void (**)(uint64_t))(v15 + 16))(v15);
      }
    }
  }
}

void __69__AKAuthorizationContaineriPhoneViewController__layoutContainerView___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

- (CGRect)_layoutFrameForContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = [(AKAuthorizationContaineriPhoneViewController *)self viewIfLoaded];
  objc_super v6 = v5;
  if (v5)
  {
    [v5 bounds];
    CGFloat x = v17.origin.x;
    CGFloat y = v17.origin.y;
    CGFloat v9 = v17.size.width;
    CGFloat v10 = v17.size.height;
    double v11 = (CGRectGetWidth(v17) - width) * 0.5;
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.double width = v9;
    v18.size.double height = v10;
    double v12 = CGRectGetHeight(v18) - height;
  }
  else
  {
    double v11 = *MEMORY[0x1E4F1DB28];
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v13 = v11;
  double v14 = v12;
  double v15 = width;
  double v16 = height;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (CGRect)_dismissalFrameForContentSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  double v5 = [(AKAuthorizationContaineriPhoneViewController *)self viewIfLoaded];
  objc_super v6 = v5;
  if (v5)
  {
    [v5 bounds];
    CGFloat v7 = CGRectGetHeight(v13);
    double v8 = 0.0;
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DB28];
    CGFloat v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v9 = v8;
  double v10 = v7;
  double v11 = width;
  double v12 = height;
  result.size.CGFloat height = v12;
  result.size.CGFloat width = v11;
  result.origin.CGFloat y = v10;
  result.origin.CGFloat x = v9;
  return result;
}

- (void)_handleTapGesture:(id)a3
{
  if (self->_tapGestureRecognizer == a3)
  {
    id v4 = a3;
    double v5 = [(AKAuthorizationContaineriPhoneViewController *)self view];
    [v4 locationInView:v5];
    CGFloat v7 = v6;
    CGFloat v9 = v8;

    double v10 = [(AKAuthorizationContainerViewController *)self rootViewController];
    double v11 = [v10 view];
    [v11 frame];
    v14.CGFloat x = v7;
    v14.CGFloat y = v9;
    BOOL v12 = CGRectContainsPoint(v15, v14);

    if (!v12)
    {
      if ([(AKAuthorizationContaineriPhoneViewController *)self _delegate_authorizationContainerViewControllerShouldDismiss])
      {
        [(AKAuthorizationContaineriPhoneViewController *)self _delegate_authorizationContainerViewControllerDidDismiss];
      }
    }
  }
}

- (BOOL)_delegate_authorizationContainerViewControllerShouldDismiss
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  BOOL v3 = [(AKAuthorizationContainerViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 authorizationContainerViewControllerShouldDismiss:self];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)_delegate_authorizationContainerViewControllerDidDismiss
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v3 = [(AKAuthorizationContainerViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 authorizationContainerViewControllerDidDismiss:self];
  }
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)AKAuthorizationContaineriPhoneViewController;
  [(AKAuthorizationContaineriPhoneViewController *)&v6 preferredContentSizeDidChangeForChildContentContainer:v4];
  if (([(AKAuthorizationContaineriPhoneViewController *)self isBeingPresented] & 1) == 0)
  {
    id v5 = [(AKAuthorizationContainerViewController *)self rootViewController];
    if (v5 == v4)
    {
      [v4 preferredContentSize];
      -[AKAuthorizationContaineriPhoneViewController setContainerContentSize:animated:](self, "setContainerContentSize:animated:", 1);
    }
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)AKAuthorizationContaineriPhoneViewController;
  id v7 = a4;
  -[AKAuthorizationContaineriPhoneViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __99__AKAuthorizationContaineriPhoneViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E648F230;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

uint64_t __99__AKAuthorizationContaineriPhoneViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 isAnimated];

  return [v2 _layoutContainerView:v3];
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v5 = [[AKAuthorizationContainerViewControllerAnimator alloc] initWithPresenting:1];

  return v5;
}

- (id)animationControllerForDismissedController:(id)a3
{
  uint64_t v3 = [[AKAuthorizationContainerViewControllerAnimator alloc] initWithPresenting:0];

  return v3;
}

- (UIVisualEffectView)blurBackgroundView
{
  return self->_blurBackgroundView;
}

- (void)setBlurBackgroundView:(id)a3
{
}

- (CGSize)containerContentSize
{
  double width = self->_containerContentSize.width;
  double height = self->_containerContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurBackgroundView, 0);
  objc_storeStrong((id *)&self->_rootViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_rootViewHeightConstraint, 0);

  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
}

@end