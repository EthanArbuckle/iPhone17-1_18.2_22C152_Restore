@interface HUQuickControlContainerViewController
+ (id)_blurAnimationSettingsForPresenting:(BOOL)a3;
+ (id)_controlAlphaAnimationSettingsForPresenting:(BOOL)a3;
+ (id)_controlScaleAnimationSettingsForPresenting:(BOOL)a3;
+ (id)_detailChromeAnimationSettings;
+ (id)_easeOutTimingFunction;
+ (id)_sourceViewTransitionAnimationSettingsForPresenting:(BOOL)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)canBecomeFirstResponder;
- (BOOL)isConfiguredForNonHomeUser:(id)a3;
- (BOOL)isControlDismissedOrDismissing;
- (BOOL)isControlPresentedOrPresenting;
- (BOOL)presentedDetailView;
- (BOOL)requiresPresentingViewControllerDismissal;
- (CGAffineTransform)sourceViewTransformForPresentationProgress:(SEL)a3;
- (CGRect)sourceRect;
- (HMHome)home;
- (HUAnimationApplier)presentationApplier;
- (HUOpenURLHandling)detailViewURLHandler;
- (HUPresentationDelegate)presentationDelegate;
- (HUQuickControlContainerView)controlContainerView;
- (HUQuickControlContainerViewController)initWithPresentationContext:(id)a3;
- (HUQuickControlContainerViewControllerDelegate)delegate;
- (HUQuickControlPresentationContext)presentationContext;
- (HUQuickControlViewController)activeControlViewController;
- (HUQuickControlViewControllerCoordinator)viewControllerCoordinator;
- (NSCopying)item;
- (NSString)description;
- (UILayoutGuide)availableContentLayoutGuide;
- (UIPanGestureRecognizer)panGestureRecognizer;
- (UITapGestureRecognizer)dismissGestureRecognizer;
- (id)_dismissDetailsViewControllerAnimated:(BOOL)a3 dismissControl:(BOOL)a4;
- (id)_prepareDetailViewController;
- (id)dismissControlAnimated:(BOOL)a3;
- (id)finishPresentation:(id)a3 animated:(BOOL)a4;
- (id)hu_prepareForDismissalAnimated:(BOOL)a3;
- (id)presentDetailViewControllerAnimated:(BOOL)a3;
- (id)viewForTouchContinuation;
- (unint64_t)presentationState;
- (void)_backButtonPressed:(id)a3;
- (void)_controlDidDismiss;
- (void)_createControlContainerViewForMac;
- (void)_createControlContainerViewWithSourceRect:(CGRect)a3;
- (void)_dismissQuickControls;
- (void)_performTransitionToPresentationState:(unint64_t)a3 animated:(BOOL)a4 initialProgress:(double)a5 completion:(id)a6;
- (void)_settingsButtonPressed:(id)a3;
- (void)_updateActiveControlViewController;
- (void)_updateControlStatusText;
- (void)_updateIconDescriptorAnimated:(BOOL)a3;
- (void)_updateUserInteractionEnabledForActiveControl;
- (void)beginReceivingTouchesWithGestureRecognizer:(id)a3;
- (void)contentDidUpdateInContainerView:(id)a3;
- (void)controllerCoordinator:(id)a3 didUpdateIconDescriptor:(id)a4 showOffState:(BOOL)a5;
- (void)detailsButtonPressedInContainerView:(id)a3;
- (void)externalAnimationsBegan;
- (void)externalAnimationsEnded;
- (void)hideAuxiliaryViewForQuickControlContent:(id)a3;
- (void)presentControlForMacAnimated:(BOOL)a3;
- (void)presentControlFromSourceRect:(CGRect)a3 animated:(BOOL)a4;
- (void)quickControlContent:(id)a3 requestDismissalOfType:(unint64_t)a4;
- (void)quickControlContent:(id)a3 showAuxiliaryView:(id)a4;
- (void)setActiveControlViewController:(id)a3;
- (void)setAvailableContentLayoutGuide:(id)a3;
- (void)setControlContainerView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDetailViewURLHandler:(id)a3;
- (void)setDismissGestureRecognizer:(id)a3;
- (void)setPanGestureRecognizer:(id)a3;
- (void)setPresentationApplier:(id)a3;
- (void)setPresentationContext:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setPresentationState:(unint64_t)a3;
- (void)setPresentedDetailView:(BOOL)a3;
- (void)setRequiresPresentingViewControllerDismissal:(BOOL)a3;
- (void)setSourceRect:(CGRect)a3;
- (void)setViewControllerCoordinator:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation HUQuickControlContainerViewController

- (HUQuickControlContainerViewController)initWithPresentationContext:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HUQuickControlContainerViewController;
  v6 = [(HUQuickControlContainerViewController *)&v18 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_presentationContext, a3);
    uint64_t v8 = [v5 item];
    item = v7->_item;
    v7->_item = (NSCopying *)v8;

    uint64_t v10 = [v5 home];
    home = v7->_home;
    v7->_home = (HMHome *)v10;

    v12 = [HUQuickControlViewControllerCoordinator alloc];
    v13 = v7->_item;
    v14 = [v5 controlItems];
    uint64_t v15 = [(HUQuickControlViewControllerCoordinator *)v12 initWithItem:v13 controlItems:v14 home:v7->_home delegate:v7];
    viewControllerCoordinator = v7->_viewControllerCoordinator;
    v7->_viewControllerCoordinator = (HUQuickControlViewControllerCoordinator *)v15;

    [(HUQuickControlViewControllerCoordinator *)v7->_viewControllerCoordinator setControlHost:v7];
    -[HUQuickControlViewControllerCoordinator setShouldIncludeRoomNameInHeaderTitle:](v7->_viewControllerCoordinator, "setShouldIncludeRoomNameInHeaderTitle:", [v5 shouldIncludeRoomNameInHeaderTitle]);
  }

  return v7;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F7A0D0] builderWithObject:self];
  v4 = [(HUQuickControlContainerViewController *)self item];
  id v5 = (id)[v3 appendObject:v4 withName:@"item"];

  v6 = [v3 build];

  return (NSString *)v6;
}

- (BOOL)isControlPresentedOrPresenting
{
  return [(HUQuickControlContainerViewController *)self presentationState] == 2
      || [(HUQuickControlContainerViewController *)self presentationState] == 3;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)HUQuickControlContainerViewController;
  [(HUQuickControlContainerViewController *)&v7 viewDidLoad];
  if ([MEMORY[0x1E4F42D90] instancesRespondToSelector:sel__peripheryInsets]
    && ([MEMORY[0x1E4F42D90] mainScreen],
        v3 = objc_claimAutoreleasedReturnValue(),
        [v3 _peripheryInsets],
        double v5 = v4,
        v3,
        v5 > 0.0))
  {
    uint64_t v6 = 14;
  }
  else
  {
    uint64_t v6 = 0;
  }
  [(HUQuickControlContainerViewController *)self setEdgesForExtendedLayout:v6];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setPresentedDetailView:(BOOL)a3
{
  if (self->_presentedDetailView != a3) {
    self->_presentedDetailView = a3;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlContainerViewController;
  [(HUQuickControlContainerViewController *)&v4 viewDidAppear:a3];
  if ([MEMORY[0x1E4F69758] isAMac]) {
    [(HUQuickControlContainerViewController *)self becomeFirstResponder];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)HUQuickControlContainerViewController;
  [(HUQuickControlContainerViewController *)&v6 viewWillAppear:a3];
  objc_super v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v8 = self;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@: viewWillAppear", buf, 0xCu);
  }

  double v5 = [(HUQuickControlContainerViewController *)self viewControllerCoordinator];
  [v5 setControlsVisible:1];
}

- (BOOL)canBecomeFirstResponder
{
  if ([MEMORY[0x1E4F69758] isAMac]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlContainerViewController;
  return [(HUQuickControlContainerViewController *)&v4 canBecomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)HUQuickControlContainerViewController;
  [(HUQuickControlContainerViewController *)&v5 viewWillDisappear:a3];
  objc_super v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    objc_super v7 = self;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@: viewWillDisappear", buf, 0xCu);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HUQuickControlContainerViewController;
  [(HUQuickControlContainerViewController *)&v5 viewDidDisappear:a3];
  objc_super v4 = [(HUQuickControlContainerViewController *)self viewControllerCoordinator];
  [v4 setControlsVisible:0];
}

- (id)presentDetailViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(HUQuickControlContainerViewController *)self delegate];
  objc_super v6 = [(HUQuickControlContainerViewController *)self viewControllerCoordinator];
  objc_super v7 = [v6 item];
  char v8 = [v5 hasDetailsActionForQuickControlViewController:self item:v7];

  if (v8)
  {
    if ([(HUQuickControlContainerViewController *)self presentedDetailView]) {
      NSLog(&cfstr_InconsistantSt.isa);
    }
    [(HUQuickControlContainerViewController *)self setPresentedDetailView:1];
    uint64_t v9 = [(HUQuickControlContainerViewController *)self _prepareDetailViewController];
    if (v9)
    {
      uint64_t v10 = +[HUApplicationManager sharedInstance];
      [v10 setStatusBarHidden:0 forRequester:self];

      v11 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v9];
      [v11 setModalPresentationStyle:2];
      v12 = [(UIViewController *)self hu_presentPreloadableViewController:v11 animated:v3];
    }
    else
    {
      NSLog(&cfstr_FailedToCreate.isa);
      v12 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
    }
  }
  else
  {
    v13 = [(HUQuickControlContainerViewController *)self viewControllerCoordinator];
    v14 = [v13 item];
    NSLog(&cfstr_AttemptingToPr.isa, v14);

    v12 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v12;
}

- (void)setAvailableContentLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_availableContentLayoutGuide, a3);
  id v5 = a3;
  id v6 = [(HUQuickControlContainerViewController *)self controlContainerView];
  [v6 setStandardViewportFromParentGuide:v5];
}

- (void)_updateControlStatusText
{
  BOOL v3 = [(HUQuickControlContainerViewController *)self controlContainerView];
  id v12 = [v3 summaryView];

  if ([MEMORY[0x1E4F69758] isProxHandOffV2Config])
  {
    objc_super v4 = [(HUQuickControlContainerViewController *)self presentationContext];
    int v5 = [v4 isConfiguredForNonHomeUser];

    if (!v5) {
      goto LABEL_6;
    }
    id v6 = [(HUQuickControlContainerViewController *)self presentationContext];
    objc_super v7 = [v6 controlItems];
    char v8 = objc_msgSend(v7, "na_firstObjectPassingTest:", &__block_literal_global_33_4);

    uint64_t v9 = [v8 deviceName];
    [v12 setPrimaryText:v9];
  }
  else
  {
    uint64_t v10 = [(HUQuickControlContainerViewController *)self viewControllerCoordinator];
    v11 = [v10 primaryStatusText];
    [v12 setPrimaryText:v11];

    char v8 = [(HUQuickControlContainerViewController *)self viewControllerCoordinator];
    uint64_t v9 = [v8 secondaryStatusText];
    [v12 setSecondaryText:v9];
  }

LABEL_6:
}

uint64_t __65__HUQuickControlContainerViewController__updateControlStatusText__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_updateIconDescriptorAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(HUQuickControlContainerViewController *)self viewControllerCoordinator];
  id v12 = [v5 iconDescriptor];

  id v6 = [(HUQuickControlContainerViewController *)self viewControllerCoordinator];
  int v7 = [v6 showIconOffState];

  if (v7) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
  uint64_t v9 = [(HUQuickControlContainerViewController *)self controlContainerView];
  uint64_t v10 = [v9 summaryView];
  v11 = [v10 iconView];

  [v11 updateWithIconDescriptor:v12 displayStyle:v8 animated:v3];
}

- (void)_updateUserInteractionEnabledForActiveControl
{
  id v5 = [(HUQuickControlContainerViewController *)self viewControllerCoordinator];
  if ([v5 isReachable]) {
    BOOL v3 = [(HUQuickControlContainerViewController *)self isControlPresentedOrPresenting];
  }
  else {
    BOOL v3 = 0;
  }
  objc_super v4 = [(HUQuickControlContainerViewController *)self activeControlViewController];
  [v4 setUserInteractionEnabled:v3];
}

- (void)_backButtonPressed:(id)a3
{
  id v3 = [(HUQuickControlContainerViewController *)self dismissControlAnimated:1];
}

- (void)_settingsButtonPressed:(id)a3
{
  id v3 = [(HUQuickControlContainerViewController *)self presentDetailViewControllerAnimated:1];
}

+ (id)_easeOutTimingFunction
{
  LODWORD(v3) = 1036831949;
  LODWORD(v2) = 0.25;
  LODWORD(v4) = 0.25;
  LODWORD(v5) = 1.0;
  return (id)[MEMORY[0x1E4F39C10] functionWithControlPoints:v2 :v3 :v4 :v5];
}

+ (id)_controlScaleAnimationSettingsForPresenting:(BOOL)a3
{
  BOOL v3 = a3;
  double v4 = objc_alloc_init(HUSpringAnimationSettings);
  [(HUSpringAnimationSettings *)v4 setDelay:0.04];
  [(HUSpringAnimationSettings *)v4 setMass:2.0];
  [(HUSpringAnimationSettings *)v4 setStiffness:450.0];
  double v5 = 50.0;
  if (v3) {
    double v5 = 44.0;
  }
  [(HUSpringAnimationSettings *)v4 setDamping:v5];
  [(HUSpringAnimationSettings *)v4 setSpeed:1.3];
  id v6 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
  [(HUSpringAnimationSettings *)v4 setTimingFunction:v6];

  return v4;
}

+ (id)_controlAlphaAnimationSettingsForPresenting:(BOOL)a3
{
  if (a3)
  {
    double v4 = +[HUAnimationSettings settingsWithDuration:0.165];
    double v5 = [a1 _easeOutTimingFunction];
    [v4 setTimingFunction:v5];
  }
  else
  {
    double v4 = objc_msgSend(a1, "_blurAnimationSettingsForPresenting:");
    [v4 speed];
    [v4 setSpeed:v6 * 0.8];
  }

  return v4;
}

+ (id)_blurAnimationSettingsForPresenting:(BOOL)a3
{
  if (a3)
  {
    double v4 = +[HUAnimationSettings settingsWithDuration:0.45];
    [a1 _easeOutTimingFunction];
  }
  else
  {
    double v4 = objc_alloc_init(HUSpringAnimationSettings);
    [(HUSpringAnimationSettings *)v4 setMass:2.0];
    [(HUSpringAnimationSettings *)v4 setStiffness:300.0];
    [(HUSpringAnimationSettings *)v4 setDamping:400.0];
    [(HUSpringAnimationSettings *)v4 setSpeed:1.5];
    LODWORD(v5) = 1041865114;
    LODWORD(v6) = 1058642330;
    LODWORD(v7) = 1064346583;
    [MEMORY[0x1E4F39C10] functionWithControlPoints:v5 :0.0 :v6 :v7];
  uint64_t v8 = };
  [(HUSpringAnimationSettings *)v4 setTimingFunction:v8];

  return v4;
}

+ (id)_sourceViewTransitionAnimationSettingsForPresenting:(BOOL)a3
{
  if (a3)
  {
    double v4 = +[HUAnimationSettings settingsWithDuration:0.25];
    [v4 setDelay:0.02];
    double v5 = [a1 _easeOutTimingFunction];
    [v4 setTimingFunction:v5];
  }
  else
  {
    double v4 = objc_msgSend(a1, "_controlScaleAnimationSettingsForPresenting:");
  }

  return v4;
}

+ (id)_detailChromeAnimationSettings
{
  BOOL v3 = +[HUAnimationSettings settingsWithDuration:0.6];
  double v4 = [a1 _easeOutTimingFunction];
  [v3 setTimingFunction:v4];

  return v3;
}

- (CGAffineTransform)sourceViewTransformForPresentationProgress:(SEL)a3
{
  double v7 = [(HUQuickControlContainerViewController *)self controlContainerView];

  if (!v7) {
    NSLog(&cfstr_CannotComputeT.isa);
  }
  uint64_t v8 = [(HUQuickControlContainerViewController *)self controlContainerView];
  if (v8)
  {
    uint64_t v10 = v8;
    [v8 sourceViewTransformForPresentationProgress:a4];
    uint64_t v8 = v10;
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (void)presentControlForMacAnimated:(BOOL)a3
{
  [(HUQuickControlContainerViewController *)self setPresentationState:3];

  [(HUQuickControlContainerViewController *)self _createControlContainerViewForMac];
}

- (void)presentControlFromSourceRect:(CGRect)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(HUQuickControlContainerViewController *)self isControlPresentedOrPresenting]) {
    NSLog(&cfstr_PresentationAl.isa);
  }
  [(HUQuickControlContainerViewController *)self setPresentationState:2];
  -[HUQuickControlContainerViewController setSourceRect:](self, "setSourceRect:", x, y, width, height);
  -[HUQuickControlContainerViewController _createControlContainerViewWithSourceRect:](self, "_createControlContainerViewWithSourceRect:", x, y, width, height);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__HUQuickControlContainerViewController_presentControlFromSourceRect_animated___block_invoke;
  v10[3] = &unk_1E6386730;
  v10[4] = self;
  [(HUQuickControlContainerViewController *)self _performTransitionToPresentationState:2 animated:v4 initialProgress:v10 completion:0.0];
}

uint64_t __79__HUQuickControlContainerViewController_presentControlFromSourceRect_animated___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) setPresentationState:3];
  }
  return result;
}

- (BOOL)isControlDismissedOrDismissing
{
  return ![(HUQuickControlContainerViewController *)self isControlPresentedOrPresenting];
}

- (id)dismissControlAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HUQuickControlContainerViewController *)self isControlPresentedOrPresenting])
  {
    double v5 = [(HUQuickControlContainerViewController *)self presentationApplier];

    if (v5)
    {
      double v6 = [(HUQuickControlContainerViewController *)self presentationApplier];
      [v6 effectiveProgress];
      double v8 = v7;

      uint64_t v9 = [(HUQuickControlContainerViewController *)self presentationApplier];
      [v9 cancel];

      [(HUQuickControlContainerViewController *)self setPresentationApplier:0];
    }
    else
    {
      double v8 = 1.0;
    }
    id v11 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    if ([(HUQuickControlContainerViewController *)self presentedDetailView])
    {
      id v12 = [(HUQuickControlContainerViewController *)self _dismissDetailsViewControllerAnimated:v3 dismissControl:1];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __64__HUQuickControlContainerViewController_dismissControlAnimated___block_invoke;
      v18[3] = &unk_1E63850B8;
      id v10 = v11;
      id v19 = v10;
      id v13 = (id)[v12 addCompletionBlock:v18];

      v14 = v19;
    }
    else
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __64__HUQuickControlContainerViewController_dismissControlAnimated___block_invoke_2;
      v16[3] = &unk_1E63865B8;
      v16[4] = self;
      id v10 = v11;
      id v17 = v10;
      [(HUQuickControlContainerViewController *)self _performTransitionToPresentationState:1 animated:v3 initialProgress:v16 completion:1.0 - v8];
      v14 = v17;
    }
  }
  else
  {
    NSLog(&cfstr_ControlIsAlrea.isa);
    id v10 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v10;
}

uint64_t __64__HUQuickControlContainerViewController_dismissControlAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithNoResult];
}

uint64_t __64__HUQuickControlContainerViewController_dismissControlAnimated___block_invoke_2(uint64_t a1, int a2)
{
  if (a2) {
    return [*(id *)(a1 + 32) _controlDidDismiss];
  }
  else {
    return [*(id *)(a1 + 40) finishWithNoResult];
  }
}

- (void)_performTransitionToPresentationState:(unint64_t)a3 animated:(BOOL)a4 initialProgress:(double)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v11 = a6;
  if (a3 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"HUQuickControlContainerViewController.m", 399, @"Invalid parameter not satisfying: %@", @"state == HUQuickControlPresentationStatePresenting || state == HUQuickControlPresentationStateDismissing" object file lineNumber description];
  }
  char v12 = [MEMORY[0x1E4F42FF0] areAnimationsEnabled];
  [MEMORY[0x1E4F42FF0] setAnimationsEnabled:v7];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __115__HUQuickControlContainerViewController__performTransitionToPresentationState_animated_initialProgress_completion___block_invoke;
  aBlock[3] = &__block_descriptor_33_e5_v8__0l;
  char v55 = v12;
  v40 = (void (**)(void))_Block_copy(aBlock);
  [(HUQuickControlContainerViewController *)self setPresentationState:a3];
  id v13 = [(HUQuickControlContainerViewController *)self delegate];
  [v13 quickControlViewController:self sourceViewInitialScaleForPresentation:a3 == 2];
  double v15 = v14;
  v16 = [(HUQuickControlContainerViewController *)self controlContainerView];
  [v16 setInitialSourceViewScale:v15];
  v38 = v11;
  double v17 = fmin(fmax(a5, 0.0), 1.0);

  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __115__HUQuickControlContainerViewController__performTransitionToPresentationState_animated_initialProgress_completion___block_invoke_2;
  v52[3] = &__block_descriptor_41_e8_d16__0d8l;
  *(double *)&v52[4] = v17;
  BOOL v53 = a3 == 2;
  objc_super v18 = _Block_copy(v52);
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __115__HUQuickControlContainerViewController__performTransitionToPresentationState_animated_initialProgress_completion___block_invoke_3;
  v50[3] = &__block_descriptor_41_e50___HUAnimationSettings_16__0__HUAnimationSettings_8l;
  BOOL v51 = v7;
  *(double *)&v50[4] = v17;
  id v19 = (void (**)(void *, void *))_Block_copy(v50);
  v20 = [(id)objc_opt_class() _controlScaleAnimationSettingsForPresenting:a3 == 2];
  uint64_t v21 = v19[2](v19, v20);

  v37 = (void *)v21;
  v22 = +[HUAnimationApplier staticApplierWithAnimationSettings:v21];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __115__HUQuickControlContainerViewController__performTransitionToPresentationState_animated_initialProgress_completion___block_invoke_4;
  v48[3] = &unk_1E6390B40;
  v48[4] = self;
  id v23 = v18;
  id v49 = v23;
  [v22 addApplierBlock:v48];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __115__HUQuickControlContainerViewController__performTransitionToPresentationState_animated_initialProgress_completion___block_invoke_6;
  v45[3] = &unk_1E6390B68;
  BOOL v47 = a3 == 2;
  v45[4] = self;
  id v39 = v38;
  id v46 = v39;
  [v22 addCompletionBlock:v45];
  [v22 start];
  v24 = [(id)objc_opt_class() _controlAlphaAnimationSettingsForPresenting:a3 == 2];
  v25 = v19[2](v19, v24);

  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __115__HUQuickControlContainerViewController__performTransitionToPresentationState_animated_initialProgress_completion___block_invoke_7;
  v43[3] = &unk_1E6390B40;
  v43[4] = self;
  id v26 = v23;
  id v44 = v26;
  id v27 = +[HUAnimationApplier applyAnimationSettings:v25 withStaticApplier:v43 completion:0];
  v28 = [(id)objc_opt_class() _detailChromeAnimationSettings];
  v29 = v19[2](v19, v28);

  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __115__HUQuickControlContainerViewController__performTransitionToPresentationState_animated_initialProgress_completion___block_invoke_8;
  v41[3] = &unk_1E6390B40;
  v41[4] = self;
  id v30 = v26;
  id v42 = v30;
  id v31 = +[HUAnimationApplier applyAnimationSettings:v29 withStaticApplier:v41 completion:0];
  v32 = [(id)objc_opt_class() _sourceViewTransitionAnimationSettingsForPresenting:a3 == 2];
  v33 = v19[2](v19, v32);

  v34 = [(HUQuickControlContainerViewController *)self delegate];
  v35 = [v34 quickControlViewController:self applierForSourceViewTransitionWithAnimationSettings:v33 presenting:a3 == 2];

  [v35 start];
  if (a3 == 2) {
    [(HUQuickControlContainerViewController *)self setPresentationApplier:v22];
  }

  if (v40) {
    v40[2](v40);
  }
}

uint64_t __115__HUQuickControlContainerViewController__performTransitionToPresentationState_animated_initialProgress_completion___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F42FF0] setAnimationsEnabled:*(unsigned __int8 *)(a1 + 32)];
}

double __115__HUQuickControlContainerViewController__performTransitionToPresentationState_animated_initialProgress_completion___block_invoke_2(uint64_t a1, double a2)
{
  double result = *(double *)(a1 + 32) + a2 * (1.0 - *(double *)(a1 + 32));
  if (!*(unsigned char *)(a1 + 40)) {
    return 1.0 - result;
  }
  return result;
}

id __115__HUQuickControlContainerViewController__performTransitionToPresentationState_animated_initialProgress_completion___block_invoke_3(uint64_t a1, void *a2)
{
  BOOL v3 = (void *)[a2 copy];
  if (*(unsigned char *)(a1 + 40))
  {
    double v4 = pow(1.5, -*(double *)(a1 + 32));
    [v3 speed];
    [v3 setSpeed:v5 / v4];
    [v3 speed];
  }
  else
  {
    double v6 = 1.79769313e308;
  }
  [v3 setSpeed:v6];

  return v3;
}

void __115__HUQuickControlContainerViewController__performTransitionToPresentationState_animated_initialProgress_completion___block_invoke_4(uint64_t a1, double a2)
{
  double v4 = [*(id *)(a1 + 32) controlContainerView];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __115__HUQuickControlContainerViewController__performTransitionToPresentationState_animated_initialProgress_completion___block_invoke_5;
  v6[3] = &unk_1E6390B18;
  double v5 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  double v8 = a2;
  objc_msgSend(v4, "naui_performAnimateableConstraintChanges:", v6);
}

void __115__HUQuickControlContainerViewController__performTransitionToPresentationState_animated_initialProgress_completion___block_invoke_5(uint64_t a1)
{
  double v2 = (*(double (**)(double))(*(void *)(a1 + 40) + 16))(*(double *)(a1 + 48));
  id v3 = [*(id *)(a1 + 32) controlContainerView];
  [v3 setControlTransitionProgress:v2];
}

uint64_t __115__HUQuickControlContainerViewController__performTransitionToPresentationState_animated_initialProgress_completion___block_invoke_6(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) setPresentationApplier:0];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __115__HUQuickControlContainerViewController__performTransitionToPresentationState_animated_initialProgress_completion___block_invoke_7(uint64_t a1)
{
  double v2 = (*(double (**)(void))(*(void *)(a1 + 40) + 16))();
  id v4 = [*(id *)(a1 + 32) controlContainerView];
  id v3 = [v4 activeControlView];
  [v3 setAlpha:v2];
}

void __115__HUQuickControlContainerViewController__performTransitionToPresentationState_animated_initialProgress_completion___block_invoke_8(uint64_t a1)
{
  double v2 = (*(double (**)(void))(*(void *)(a1 + 40) + 16))();
  id v3 = [*(id *)(a1 + 32) controlContainerView];
  [v3 setChromeTransitionProgress:v2];
}

- (void)_createControlContainerViewWithSourceRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(HUQuickControlContainerViewController *)self controlContainerView];
  [v8 removeFromSuperview];

  uint64_t v9 = [HUQuickControlContainerView alloc];
  id v10 = -[HUQuickControlContainerView initWithFrame:delegate:sourceRect:](v9, "initWithFrame:delegate:sourceRect:", self, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), x, y, width, height);
  [(HUQuickControlContainerViewController *)self setControlContainerView:v10];

  id v11 = [(HUQuickControlContainerViewController *)self controlContainerView];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  char v12 = [(HUQuickControlContainerViewController *)self controlContainerView];
  [v12 setEdgesForExtendedLayout:1];

  id v13 = [(HUQuickControlContainerViewController *)self availableContentLayoutGuide];
  double v14 = [(HUQuickControlContainerViewController *)self controlContainerView];
  [v14 setStandardViewportFromParentGuide:v13];

  double v15 = [MEMORY[0x1E4F428B8] clearColor];
  v16 = [(HUQuickControlContainerViewController *)self controlContainerView];
  [v16 setBackgroundColor:v15];

  double v17 = [(HUQuickControlContainerViewController *)self view];
  objc_super v18 = [(HUQuickControlContainerViewController *)self controlContainerView];
  [v17 addSubview:v18];

  id v34 = (id)objc_opt_new();
  id v19 = [(HUQuickControlContainerViewController *)self view];
  v20 = [v19 leadingAnchor];
  uint64_t v21 = [(HUQuickControlContainerViewController *)self controlContainerView];
  v22 = [v21 leadingAnchor];
  id v23 = [v20 constraintEqualToAnchor:v22];
  [v34 addObject:v23];

  v24 = [(HUQuickControlContainerViewController *)self view];
  v25 = [v24 widthAnchor];
  id v26 = [(HUQuickControlContainerViewController *)self controlContainerView];
  id v27 = [v26 widthAnchor];
  v28 = [v25 constraintEqualToAnchor:v27];
  [v34 addObject:v28];

  v29 = [(HUQuickControlContainerViewController *)self view];
  id v30 = [v29 topAnchor];
  id v31 = [(HUQuickControlContainerViewController *)self controlContainerView];
  v32 = [v31 topAnchor];
  v33 = [v30 constraintEqualToAnchor:v32];
  [v34 addObject:v33];

  [MEMORY[0x1E4F28DC8] activateConstraints:v34];
  [(HUQuickControlContainerViewController *)self _updateActiveControlViewController];
  [(HUQuickControlContainerViewController *)self _updateIconDescriptorAnimated:0];
  [(HUQuickControlContainerViewController *)self _updateControlStatusText];
  [(HUQuickControlContainerViewController *)self _updateReachabilityStateForActiveControl];
}

- (void)_createControlContainerViewForMac
{
  id v3 = [(HUQuickControlContainerViewController *)self controlContainerView];
  [v3 removeFromSuperview];

  id v4 = [HUQuickControlContainerView alloc];
  double v5 = [(HUQuickControlContainerViewController *)self view];
  [v5 bounds];
  id v10 = -[HUQuickControlContainerView initWithFrame:delegate:sourceRect:](v4, "initWithFrame:delegate:sourceRect:", self, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), v6, v7, v8, v9);
  [(HUQuickControlContainerViewController *)self setControlContainerView:v10];

  id v11 = [(HUQuickControlContainerViewController *)self controlContainerView];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  char v12 = [(HUQuickControlContainerViewController *)self view];
  id v13 = [(HUQuickControlContainerViewController *)self controlContainerView];
  [v12 addSubview:v13];

  id v29 = (id)objc_opt_new();
  double v14 = [(HUQuickControlContainerViewController *)self controlContainerView];
  double v15 = [v14 leadingAnchor];
  v16 = [(HUQuickControlContainerViewController *)self view];
  double v17 = [v16 leadingAnchor];
  objc_super v18 = [v15 constraintEqualToAnchor:v17];
  [v29 addObject:v18];

  id v19 = [(HUQuickControlContainerViewController *)self controlContainerView];
  v20 = [v19 trailingAnchor];
  uint64_t v21 = [(HUQuickControlContainerViewController *)self view];
  v22 = [v21 trailingAnchor];
  id v23 = [v20 constraintEqualToAnchor:v22];
  [v29 addObject:v23];

  v24 = [(HUQuickControlContainerViewController *)self controlContainerView];
  v25 = [v24 topAnchor];
  id v26 = [(HUQuickControlContainerViewController *)self view];
  id v27 = [v26 topAnchor];
  v28 = [v25 constraintEqualToAnchor:v27];
  [v29 addObject:v28];

  [MEMORY[0x1E4F28DC8] activateConstraints:v29];
  [(HUQuickControlContainerViewController *)self _updateActiveControlViewController];
  [(HUQuickControlContainerViewController *)self _updateIconDescriptorAnimated:0];
  [(HUQuickControlContainerViewController *)self _updateControlStatusText];
  [(HUQuickControlContainerViewController *)self _updateReachabilityStateForActiveControl];
}

- (void)_updateActiveControlViewController
{
  id v20 = [(HUQuickControlContainerViewController *)self activeControlViewController];
  id v3 = [(HUQuickControlContainerViewController *)self viewControllerCoordinator];
  id v4 = [v3 activeController];

  if (v4 && [v4 preferredPresentationStyle]) {
    NSLog(&cfstr_ANonInlineQuic.isa, v4);
  }
  if (v20 != v4) {
    [v20 willMoveToParentViewController:0];
  }
  if (v4)
  {
    [(HUQuickControlContainerViewController *)self addChildViewController:v4];
    [(HUQuickControlContainerViewController *)self setActiveControlViewController:v4];
    double v5 = [(HUQuickControlContainerViewController *)self activeControlViewController];
    id v6 = (id)objc_msgSend(v5, "hu_preloadContent");

    double v7 = [(HUQuickControlContainerViewController *)self activeControlViewController];
    double v8 = [v7 view];
    double v9 = [(HUQuickControlContainerViewController *)self controlContainerView];
    [v9 setActiveControlView:v8];

    id v10 = [(HUQuickControlContainerViewController *)self controlContainerView];
    id v11 = [v10 controlViewPreferredFrameLayoutGuide];
    char v12 = [(HUQuickControlContainerViewController *)self activeControlViewController];
    [v12 setPreferredFrameLayoutGuide:v11];

    id v13 = [(HUQuickControlContainerViewController *)self activeControlViewController];
    uint64_t v14 = [v13 hasSingleControlView];
    double v15 = [(HUQuickControlContainerViewController *)self controlContainerView];
    [v15 setControlViewSupportsTransformTransition:v14];

    v16 = [(HUQuickControlContainerViewController *)self delegate];
    double v17 = [(HUQuickControlContainerViewController *)self item];
    uint64_t v18 = [v16 hasDetailsActionForQuickControlViewController:self item:v17];

    id v19 = [(HUQuickControlContainerViewController *)self controlContainerView];
    [v19 setShouldShowDetailsButton:v18];

    if (v20 != v4)
    {
      [v20 removeFromParentViewController];
      [v4 didMoveToParentViewController:self];
    }
  }
  [(HUQuickControlContainerViewController *)self _updateReachabilityStateForActiveControl];
}

- (void)_controlDidDismiss
{
  [(HUQuickControlContainerViewController *)self setPresentationState:0];
  id v3 = [(HUQuickControlContainerViewController *)self controlContainerView];
  [v3 removeFromSuperview];

  [(HUQuickControlContainerViewController *)self setControlContainerView:0];
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);

  -[HUQuickControlContainerViewController setSourceRect:](self, "setSourceRect:", v4, v5, v6, v7);
}

- (void)_dismissQuickControls
{
  if ([(HUQuickControlContainerViewController *)self isControlPresentedOrPresenting])
  {
    id v3 = [(HUQuickControlContainerViewController *)self dismissControlAnimated:1];
    double v4 = [(HUQuickControlContainerViewController *)self presentationDelegate];
    id v11 = v4;
    double v5 = self;
    uint64_t v6 = 1;
  }
  else
  {
    if ([(HUQuickControlContainerViewController *)self presentationState]) {
      return;
    }
    double v8 = [(HUQuickControlContainerViewController *)self presentationDelegate];
    double v9 = [(HUQuickControlContainerViewController *)self presentingViewController];
    NSLog(&cfstr_QuickControlsA.isa, self, v8, v9);

    id v10 = [(HUQuickControlContainerViewController *)self presentationDelegate];

    if (!v10)
    {
      id v11 = [(HUQuickControlContainerViewController *)self presentingViewController];
      [v11 dismissViewControllerAnimated:0 completion:0];
      goto LABEL_4;
    }
    double v4 = [(HUQuickControlContainerViewController *)self presentationDelegate];
    id v11 = v4;
    double v5 = self;
    uint64_t v6 = 0;
  }
  id v7 = (id)[v4 finishPresentation:v5 animated:v6];
LABEL_4:
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)HUQuickControlContainerViewController;
  -[HUQuickControlContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  double v5 = [(HUQuickControlContainerViewController *)self controlContainerView];
  [v5 setNeedsLayout];
}

- (id)_prepareDetailViewController
{
  id v3 = [(HUQuickControlContainerViewController *)self viewControllerCoordinator];
  double v4 = [v3 item];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    objc_opt_class();
    objc_super v6 = [(HUQuickControlContainerViewController *)self viewControllerCoordinator];
    id v7 = [v6 item];
    if (objc_opt_isKindOfClass()) {
      double v8 = v7;
    }
    else {
      double v8 = 0;
    }
    id v9 = v8;

    id v10 = [v9 accessory];
    int v11 = objc_msgSend(v10, "hf_isMultiServiceAccessory");

    if (v11)
    {
      char v12 = [(HUQuickControlContainerViewController *)self delegate];
      id v13 = [v12 detailsViewControllerForQuickControlViewController:self item:v9];
      goto LABEL_10;
    }
    uint64_t v18 = [v9 accessory];
    id v19 = objc_msgSend(v18, "hf_primaryService");
    char v12 = [v9 serviceItemForService:v19];

    double v15 = [(HUQuickControlContainerViewController *)self delegate];
    uint64_t v14 = v15;
    v16 = self;
    double v17 = v12;
  }
  else
  {
    id v9 = [(HUQuickControlContainerViewController *)self delegate];
    char v12 = [(HUQuickControlContainerViewController *)self viewControllerCoordinator];
    uint64_t v14 = [v12 item];
    double v15 = v9;
    v16 = self;
    double v17 = v14;
  }
  id v13 = [v15 detailsViewControllerForQuickControlViewController:v16 item:v17];

LABEL_10:
  [v13 setPresentationDelegate:self];

  return v13;
}

- (id)_dismissDetailsViewControllerAnimated:(BOOL)a3 dismissControl:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(HUQuickControlContainerViewController *)self delegate];
  [v7 quickControlViewControllerWillDismissDetailsViewController:self shouldDismissQuickControl:v4];

  if (v4)
  {
    double v8 = [(HUQuickControlContainerViewController *)self controlContainerView];
    [v8 removeFromSuperview];

    id v9 = [(HUQuickControlContainerViewController *)self presentationDelegate];
    id v10 = [v9 finishPresentation:self animated:v5];
  }
  else
  {
    [(HUQuickControlContainerViewController *)self setPresentedDetailView:0];
    id v10 = [(UIViewController *)self hu_dismissViewControllerAnimated:v5];
  }

  return v10;
}

- (void)externalAnimationsBegan
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    objc_super v6 = self;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "%@: externalAnimationsBegan", (uint8_t *)&v5, 0xCu);
  }

  BOOL v4 = [(HUQuickControlContainerViewController *)self controlContainerView];
  [v4 externalAnimationsBegan];
}

- (void)externalAnimationsEnded
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    objc_super v6 = self;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "%@: externalAnimationsEnded", (uint8_t *)&v5, 0xCu);
  }

  BOOL v4 = [(HUQuickControlContainerViewController *)self controlContainerView];
  [v4 externalAnimationsEnded];
}

- (void)beginReceivingTouchesWithGestureRecognizer:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(HUQuickControlContainerViewController *)self viewControllerCoordinator];
  int v5 = [v4 isReachable];

  if (v5)
  {
    objc_super v6 = [(HUQuickControlContainerViewController *)self activeControlViewController];
    [v6 beginUserInteractionWithFirstTouchGestureRecognizer:v7];
  }
}

- (id)hu_prepareForDismissalAnimated:(BOOL)a3
{
  id v3 = [(HUQuickControlContainerViewController *)self dismissControlAnimated:a3];
  BOOL v4 = [v3 flatMap:&__block_literal_global_82_2];

  return v4;
}

uint64_t __72__HUQuickControlContainerViewController_hu_prepareForDismissalAnimated___block_invoke()
{
  return [MEMORY[0x1E4F7A0D8] futureWithResult:&unk_1F19B50F0];
}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(HUQuickControlContainerViewController *)self item];
  uint64_t v13 = *MEMORY[0x1E4F68720];
  v14[0] = MEMORY[0x1E4F1CC38];
  double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  id v9 = (id)[v7 updateWithOptions:v8];

  if ([v6 conformsToProtocol:&unk_1F19E7BA8]) {
    uint64_t v10 = [v6 requiresPresentingViewControllerDismissal];
  }
  else {
    uint64_t v10 = 0;
  }
  int v11 = [(HUQuickControlContainerViewController *)self _dismissDetailsViewControllerAnimated:v4 dismissControl:v10];

  return v11;
}

- (void)detailsButtonPressedInContainerView:(id)a3
{
  BOOL v4 = [(HUQuickControlContainerViewController *)self viewControllerCoordinator];
  int v5 = [v4 item];
  id v6 = [v5 latestResults];
  id v14 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68918]];

  id v7 = [(HUQuickControlContainerViewController *)self detailViewURLHandler];

  if (v7 && v14)
  {
    double v8 = [(HUQuickControlContainerViewController *)self detailViewURLHandler];
    id v9 = (id)[v8 openURL:v14];
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v10 = [(HUQuickControlContainerViewController *)self delegate];
  if (v10)
  {
    int v11 = (void *)v10;
    char v12 = [(HUQuickControlContainerViewController *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      double v8 = [(HUQuickControlContainerViewController *)self delegate];
      [v8 quickControlViewControllerDidTapDetailsButton:self];
      goto LABEL_7;
    }
  }
LABEL_8:
}

- (void)contentDidUpdateInContainerView:(id)a3
{
  id v4 = [(HUQuickControlContainerViewController *)self parentViewController];
  id v3 = [v4 view];
  [v3 setNeedsLayout];
}

- (void)controllerCoordinator:(id)a3 didUpdateIconDescriptor:(id)a4 showOffState:(BOOL)a5
{
}

- (BOOL)isConfiguredForNonHomeUser:(id)a3
{
  id v3 = [(HUQuickControlContainerViewController *)self presentationContext];
  char v4 = [v3 isConfiguredForNonHomeUser];

  return v4;
}

- (void)quickControlContent:(id)a3 requestDismissalOfType:(unint64_t)a4
{
  id v6 = a3;
  if (!a4)
  {
    id v13 = v6;
    id v10 = [(HUQuickControlContainerViewController *)self presentedViewController];

    if (v10 == v13)
    {
      id v12 = [(UIViewController *)self hu_dismissViewControllerAnimated:0];
    }
    else
    {
      int v11 = [(HUQuickControlContainerViewController *)self presentedViewController];
      NSLog(&cfstr_QuickControlCo.isa, v13, v11);
    }
    goto LABEL_8;
  }
  if (a4 == 1)
  {
    id v13 = v6;
    BOOL v7 = [(HUQuickControlContainerViewController *)self isControlPresentedOrPresenting];
    id v6 = v13;
    if (v7)
    {
      [(HUQuickControlContainerViewController *)self setRequiresPresentingViewControllerDismissal:1];
      double v8 = [(HUQuickControlContainerViewController *)self presentationDelegate];
      id v9 = (id)[v8 finishPresentation:self animated:1];

LABEL_8:
      id v6 = v13;
    }
  }
}

- (void)quickControlContent:(id)a3 showAuxiliaryView:(id)a4
{
  id v5 = a4;
  id v6 = [(HUQuickControlContainerViewController *)self controlContainerView];
  [v6 showAuxiliaryView:v5];
}

- (void)hideAuxiliaryViewForQuickControlContent:(id)a3
{
  id v3 = [(HUQuickControlContainerViewController *)self controlContainerView];
  [v3 hideAuxiliaryView];
}

- (id)viewForTouchContinuation
{
  objc_opt_class();
  id v3 = [(HUQuickControlContainerViewController *)self item];
  if (objc_opt_isKindOfClass()) {
    char v4 = v3;
  }
  else {
    char v4 = 0;
  }
  id v5 = v4;

  if (v5
    && ([v5 accessory],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = objc_msgSend(v6, "hf_isMultiServiceAccessory"),
        v6,
        (v7 & 1) != 0))
  {
    double v8 = 0;
  }
  else
  {
    id v9 = [(HUQuickControlContainerViewController *)self activeControlViewController];
    id v10 = [v9 viewControllerForTouchContinuation];
    double v8 = [v10 viewForTouchContinuation];
  }

  return v8;
}

- (HUPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->presentationDelegate);

  return (HUPresentationDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (BOOL)requiresPresentingViewControllerDismissal
{
  return self->_requiresPresentingViewControllerDismissal;
}

- (void)setRequiresPresentingViewControllerDismissal:(BOOL)a3
{
  self->_requiresPresentingViewControllerDismissal = a3;
}

- (NSCopying)item
{
  return self->_item;
}

- (HMHome)home
{
  return self->_home;
}

- (HUQuickControlContainerView)controlContainerView
{
  return self->_controlContainerView;
}

- (void)setControlContainerView:(id)a3
{
}

- (HUQuickControlContainerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUQuickControlContainerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HUOpenURLHandling)detailViewURLHandler
{
  return self->_detailViewURLHandler;
}

- (void)setDetailViewURLHandler:(id)a3
{
}

- (UILayoutGuide)availableContentLayoutGuide
{
  return self->_availableContentLayoutGuide;
}

- (CGRect)sourceRect
{
  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  double height = self->_sourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (UITapGestureRecognizer)dismissGestureRecognizer
{
  return self->_dismissGestureRecognizer;
}

- (void)setDismissGestureRecognizer:(id)a3
{
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
}

- (HUAnimationApplier)presentationApplier
{
  return self->_presentationApplier;
}

- (void)setPresentationApplier:(id)a3
{
}

- (unint64_t)presentationState
{
  return self->_presentationState;
}

- (void)setPresentationState:(unint64_t)a3
{
  self->_presentationState = a3;
}

- (HUQuickControlViewControllerCoordinator)viewControllerCoordinator
{
  return self->_viewControllerCoordinator;
}

- (void)setViewControllerCoordinator:(id)a3
{
}

- (HUQuickControlViewController)activeControlViewController
{
  return self->_activeControlViewController;
}

- (void)setActiveControlViewController:(id)a3
{
}

- (HUQuickControlPresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (void)setPresentationContext:(id)a3
{
}

- (BOOL)presentedDetailView
{
  return self->_presentedDetailView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_storeStrong((id *)&self->_activeControlViewController, 0);
  objc_storeStrong((id *)&self->_viewControllerCoordinator, 0);
  objc_storeStrong((id *)&self->_presentationApplier, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_availableContentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_detailViewURLHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_controlContainerView, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_item, 0);

  objc_destroyWeak((id *)&self->presentationDelegate);
}

@end