@interface BNBannerSourceListenerHostedPresentableViewController
- (BNBannerSourceListenerHostedPresentableViewController)initWithSpecification:(id)a3 serviceDomain:(id)a4 scene:(id)a5 readyCompletion:(id)a6;
- (BOOL)_canShowWhileLocked;
- (BOOL)isClippingEnabled;
- (BOOL)isDraggingDismissalEnabled;
- (BOOL)isDraggingInteractionEnabled;
- (BOOL)isHostedContent;
- (BOOL)isReady;
- (BOOL)isTouchOutsideDismissalEnabled;
- (FBScene)scene;
- (NSSet)preferredBackgroundActivitiesToSuppress;
- (UIEdgeInsets)bannerContentOutsets;
- (id)_tearDownSceneBlock:(id)a3;
- (id)bannerSizeTransitionAnimationSettings;
- (id)presentableDescription;
- (void)_handleUserInterfaceStyleTraitChange:(id)a3;
- (void)_setReadyCompletion:(id)a3;
- (void)_tearDownSceneIfNecessary;
- (void)_tearDownSceneInfrastructureIfNecessary;
- (void)_tearDownScenePresenterIfNecessary;
- (void)_updateBannerContentOutsetsWithScene:(id)a3;
- (void)_updateClippingWithScene:(id)a3;
- (void)_updatePreferredContentSizeWithScene:(id)a3 transitionContext:(id)a4;
- (void)bannerSourceListenerPresentableViewControllerViewDidChangeSize:(id)a3;
- (void)dealloc;
- (void)draggingDidBeginWithGestureProxy:(id)a3;
- (void)invalidate;
- (void)presentableDidAppearAsBanner:(id)a3;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillAppearAsBanner:(id)a3;
- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4;
- (void)scene:(id)a3 didReceiveActions:(id)a4;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneDidInvalidate:(id)a3;
- (void)userInteractionDidEndForBannerForPresentable:(id)a3;
- (void)userInteractionWillBeginForBannerForPresentable:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BNBannerSourceListenerHostedPresentableViewController

- (BNBannerSourceListenerHostedPresentableViewController)initWithSpecification:(id)a3 serviceDomain:(id)a4 scene:(id)a5 readyCompletion:(id)a6
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  v12 = [(BNBannerSourceListenerPresentableViewController *)&v20 initWithSpecification:a3 serviceDomain:a4 readyCompletion:a6];
  v13 = v12;
  if (v12)
  {
    p_scene = (id *)&v12->_scene;
    objc_storeStrong((id *)&v12->_scene, a5);
    [*p_scene setDelegate:v13];
    [*p_scene addObserver:v13];
    [(BNBannerSourceListenerHostedPresentableViewController *)v13 _updatePreferredContentSizeWithScene:v11 transitionContext:0];
    [(BNBannerSourceListenerHostedPresentableViewController *)v13 _updateBannerContentOutsetsWithScene:v11];
    [(BNBannerSourceListenerHostedPresentableViewController *)v13 _updateClippingWithScene:v11];
    v15 = self;
    v21[0] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    uint64_t v17 = [(BNBannerSourceListenerHostedPresentableViewController *)v13 registerForTraitChanges:v16 withAction:sel__handleUserInterfaceStyleTraitChange_];
    traitChangeRegistration = v13->_traitChangeRegistration;
    v13->_traitChangeRegistration = (UITraitChangeRegistration *)v17;
  }
  return v13;
}

- (void)dealloc
{
  [(BNBannerSourceListenerHostedPresentableViewController *)self unregisterForTraitChanges:self->_traitChangeRegistration];
  v3.receiver = self;
  v3.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  [(BNBannerSourceListenerPresentableViewController *)&v3 dealloc];
}

- (BOOL)isHostedContent
{
  return 1;
}

- (BOOL)isReady
{
  return [(FBScene *)self->_scene contentState] == 2;
}

- (void)draggingDidBeginWithGestureProxy:(id)a3
{
  id v5 = a3;
  v6 = [(FBScene *)self->_scene clientSettings];
  uint64_t v7 = objc_opt_class();
  id v8 = v6;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }
  id v10 = v9;

  if ([v10 isPanGestureProxySupported])
  {
    objc_storeStrong((id *)&self->_panGestureProxy, a3);
    objc_initWeak(&location, self);
    panGestureProxy = self->_panGestureProxy;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __90__BNBannerSourceListenerHostedPresentableViewController_draggingDidBeginWithGestureProxy___block_invoke;
    v12[3] = &unk_1E63B9EF0;
    objc_copyWeak(&v13, &location);
    [(BNPanGestureProxy *)panGestureProxy setActionHandler:v12];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __90__BNBannerSourceListenerHostedPresentableViewController_draggingDidBeginWithGestureProxy___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v4 = [BNPanGestureProxyAction alloc];
  id v5 = [WeakRetained view];
  v6 = [v5 window];
  uint64_t v7 = [(BNPanGestureProxyAction *)v4 initWithPanGestureProxy:v3 hostSideWindow:v6];

  id v8 = [WeakRetained scene];
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v7, 0);
  [v8 sendActions:v9];
}

- (id)presentableDescription
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(FBScene *)self->_scene identifier];
  if ([v3 length])
  {
    uint64_t v7 = @"sceneID";
    v8[0] = v3;
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  }
  else
  {
    v4 = 0;
  }
  id v5 = BNPresentableDescription(self, v4);

  return v5;
}

- (NSSet)preferredBackgroundActivitiesToSuppress
{
  v2 = [(FBScene *)self->_scene clientSettings];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = [v6 preferredBackgroundActivitiesToSuppress];

  return (NSSet *)v7;
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  [(BNBannerSourceListenerPresentableViewController *)&v13 viewDidLoad];
  uint64_t v3 = [(BNBannerSourceListenerHostedPresentableViewController *)self view];
  id v4 = [(FBScene *)self->_scene uiPresentationManager];
  BOOL isClippingEnabled = self->_isClippingEnabled;
  id v6 = [v4 createPresenterWithIdentifier:@"default"];
  scenePresenter = self->_scenePresenter;
  self->_scenePresenter = v6;

  id v8 = self->_scenePresenter;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__BNBannerSourceListenerHostedPresentableViewController_viewDidLoad__block_invoke;
  v11[3] = &__block_descriptor_33_e43_v16__0__UIMutableScenePresentationContext_8l;
  BOOL v12 = isClippingEnabled;
  [(UIScenePresenter *)v8 modifyPresentationContext:v11];
  [(UIScenePresenter *)self->_scenePresenter activate];
  v9 = [(UIScenePresenter *)self->_scenePresenter presentationView];
  [(BNBannerSourceListenerPresentableViewController *)self _setContentView:v9];

  id v10 = [(BNBannerSourceListenerPresentableViewController *)self contentView];
  [v3 addSubview:v10];
}

void __68__BNBannerSourceListenerHostedPresentableViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setPresentedLayerTypes:26];
  [v3 setAppearanceStyle:2];
  [v3 setClippingDisabled:*(unsigned char *)(a1 + 32) == 0];
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  [(BNBannerSourceListenerHostedPresentableViewController *)&v4 viewWillLayoutSubviews];
  id v3 = [(BNBannerSourceListenerHostedPresentableViewController *)self parentViewController];
  if ([(BNBannerSourceListenerHostedPresentableViewController *)self _appearState] != 2
    || (objc_opt_respondsToSelector() & 1) == 0
    || [v3 shouldFenceAnimationsForPresentable:self])
  {
    [(FBScene *)self->_scene updateSettingsWithTransitionBlock:&__block_literal_global_3];
  }
}

id __79__BNBannerSourceListenerHostedPresentableViewController_viewWillLayoutSubviews__block_invoke()
{
  v0 = [MEMORY[0x1E4F42790] transitionContext];
  v1 = [MEMORY[0x1E4F42D58] _synchronizedDrawingFence];
  [v0 setAnimationFence:v1];

  return v0;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  [(BNBannerSourceListenerHostedPresentableViewController *)&v4 viewWillAppear:a3];
  [(FBScene *)self->_scene updateSettingsWithBlock:&__block_literal_global_28];
}

void __72__BNBannerSourceListenerHostedPresentableViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v6 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      objc_super v4 = v6;
    }
    else {
      objc_super v4 = 0;
    }
  }
  else
  {
    objc_super v4 = 0;
  }
  id v5 = v4;

  [v5 setViewControllerAppearState:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  [(BNBannerSourceListenerHostedPresentableViewController *)&v4 viewDidAppear:a3];
  [(FBScene *)self->_scene updateSettingsWithBlock:&__block_literal_global_33];
}

void __71__BNBannerSourceListenerHostedPresentableViewController_viewDidAppear___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v6 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      objc_super v4 = v6;
    }
    else {
      objc_super v4 = 0;
    }
  }
  else
  {
    objc_super v4 = 0;
  }
  id v5 = v4;

  [v5 setViewControllerAppearState:2];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  [(BNBannerSourceListenerHostedPresentableViewController *)&v4 viewWillDisappear:a3];
  [(FBScene *)self->_scene updateSettingsWithBlock:&__block_literal_global_37];
}

void __75__BNBannerSourceListenerHostedPresentableViewController_viewWillDisappear___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v6 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      objc_super v4 = v6;
    }
    else {
      objc_super v4 = 0;
    }
  }
  else
  {
    objc_super v4 = 0;
  }
  id v5 = v4;

  [v5 setViewControllerAppearState:3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  [(BNBannerSourceListenerHostedPresentableViewController *)&v4 viewDidDisappear:a3];
  [(FBScene *)self->_scene updateSettingsWithBlock:&__block_literal_global_41];
}

void __74__BNBannerSourceListenerHostedPresentableViewController_viewDidDisappear___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v6 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      objc_super v4 = v6;
    }
    else {
      objc_super v4 = 0;
    }
  }
  else
  {
    objc_super v4 = 0;
  }
  id v5 = v4;

  [v5 setViewControllerAppearState:0];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIEdgeInsets)bannerContentOutsets
{
  double top = self->_bannerContentOutsets.top;
  double left = self->_bannerContentOutsets.left;
  double bottom = self->_bannerContentOutsets.bottom;
  double right = self->_bannerContentOutsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (id)bannerSizeTransitionAnimationSettings
{
  return self->_bannerSizeTransitionAnimationSettings;
}

- (BOOL)isClippingEnabled
{
  return self->_isClippingEnabled;
}

- (void)_setReadyCompletion:(id)a3
{
  id v5 = (void (**)(id, BNBannerSourceListenerHostedPresentableViewController *, void))a3;
  id v6 = [(BNBannerSourceListenerPresentableViewController *)self readyCompletion];

  if (v6 != v5)
  {
    BOOL v7 = [(BNBannerSourceListenerHostedPresentableViewController *)self isReady];
    if (v5 && v7)
    {
      id v8 = [(BNBannerSourceListenerPresentableViewController *)self readyCompletion];

      if (v8)
      {
        v9 = [MEMORY[0x1E4F28B00] currentHandler];
        [v9 handleFailureInMethod:a2 object:self file:@"BNBannerSourceListenerHostedPresentableViewController.m" lineNumber:194 description:@"How can we be prepared and still have a ready completion?"];
      }
      v5[2](v5, self, 0);
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
      [(BNBannerSourceListenerPresentableViewController *)&v10 _setReadyCompletion:v5];
    }
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v36.receiver = self;
  v36.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  -[BNBannerSourceListenerHostedPresentableViewController viewWillTransitionToSize:withTransitionCoordinator:](&v36, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  id v8 = [(FBScene *)self->_scene settings];
  uint64_t v9 = objc_opt_class();
  id v10 = v8;
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }
  id v12 = v11;

  objc_super v13 = [(BNBannerSourceListenerHostedPresentableViewController *)self view];
  v14 = [v13 window];
  uint64_t v15 = [v14 interfaceOrientation];

  switch(v15)
  {
    case 1:
      double v16 = 0.0;
      break;
    case 3:
      double v16 = 1.57079633;
      break;
    case 4:
      double v16 = -1.57079633;
      break;
    default:
      double v16 = 3.14159265;
      if (v15 != 2) {
        double v16 = 0.0;
      }
      break;
  }
  CGAffineTransformMakeRotation(&t1, v16);
  if (v7) {
    [v7 targetTransform];
  }
  else {
    memset(&t2, 0, sizeof(t2));
  }
  CGAffineTransformConcat(&v35, &t1, &t2);
  uint64_t v17 = BNInterfaceOrientationFromTransform((long long *)&v35);
  if (v17 != [v12 interfaceOrientation])
  {
    [v12 frame];
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    if (v7) {
      [v7 targetTransform];
    }
    else {
      memset(&v32, 0, sizeof(v32));
    }
    v37.origin.x = v19;
    v37.origin.y = v21;
    v37.size.double width = v23;
    v37.size.double height = v25;
    CGRectApplyAffineTransform(v37, &v32);
    BSRectWithSize();
    scene = self->_scene;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __108__BNBannerSourceListenerHostedPresentableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v31[3] = &__block_descriptor_72_e60___FBSSceneTransitionContext_16__0__FBSMutableSceneSettings_8l;
    v31[4] = v17;
    v31[5] = v27;
    v31[6] = v28;
    v31[7] = v29;
    v31[8] = v30;
    [(FBScene *)scene updateSettingsWithTransitionBlock:v31];
  }
}

id __108__BNBannerSourceListenerHostedPresentableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  [v7 setInterfaceOrientation:*(void *)(a1 + 32)];
  objc_msgSend(v7, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

  id v8 = [MEMORY[0x1E4F42790] transitionContext];
  uint64_t v9 = [MEMORY[0x1E4F42D58] _synchronizedDrawingFence];
  [v8 setAnimationFence:v9];

  return v8;
}

- (void)invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  [(BNBannerSourceListenerPresentableViewController *)&v3 invalidate];
  [(BNBannerSourceListenerHostedPresentableViewController *)self _tearDownSceneInfrastructureIfNecessary];
}

- (BOOL)isDraggingDismissalEnabled
{
  v10.receiver = self;
  v10.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  unsigned __int8 v3 = [(BNBannerSourceListenerPresentableViewController *)&v10 isDraggingDismissalEnabled];
  if (![(BNBannerSourceListenerPresentableViewController *)self _isPresentableContextInterfaceAvailable])
  {
    uint64_t v4 = [(FBScene *)self->_scene clientSettings];
    uint64_t v5 = objc_opt_class();
    id v6 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        id v7 = v6;
      }
      else {
        id v7 = 0;
      }
    }
    else
    {
      id v7 = 0;
    }
    id v8 = v7;

    unsigned __int8 v3 = [v8 isDraggingDismissalEnabled];
  }
  return v3;
}

- (BOOL)isDraggingInteractionEnabled
{
  v10.receiver = self;
  v10.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  unsigned __int8 v3 = [(BNBannerSourceListenerPresentableViewController *)&v10 isDraggingInteractionEnabled];
  if (![(BNBannerSourceListenerPresentableViewController *)self _isPresentableContextInterfaceAvailable])
  {
    uint64_t v4 = [(FBScene *)self->_scene clientSettings];
    uint64_t v5 = objc_opt_class();
    id v6 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        id v7 = v6;
      }
      else {
        id v7 = 0;
      }
    }
    else
    {
      id v7 = 0;
    }
    id v8 = v7;

    unsigned __int8 v3 = [v8 isDraggingInteractionEnabled];
  }
  return v3;
}

- (BOOL)isTouchOutsideDismissalEnabled
{
  v10.receiver = self;
  v10.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  unsigned __int8 v3 = [(BNBannerSourceListenerPresentableViewController *)&v10 isTouchOutsideDismissalEnabled];
  if (![(BNBannerSourceListenerPresentableViewController *)self _isPresentableContextInterfaceAvailable])
  {
    uint64_t v4 = [(FBScene *)self->_scene clientSettings];
    uint64_t v5 = objc_opt_class();
    id v6 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        id v7 = v6;
      }
      else {
        id v7 = 0;
      }
    }
    else
    {
      id v7 = 0;
    }
    id v8 = v7;

    unsigned __int8 v3 = [v8 isTouchOutsideDismissalEnabled];
  }
  return v3;
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  [(BNBannerSourceListenerPresentableViewController *)&v4 presentableWillAppearAsBanner:a3];
  if (![(BNBannerSourceListenerPresentableViewController *)self _isPresentableContextInterfaceAvailable])[(FBScene *)self->_scene updateSettingsWithBlock:&__block_literal_global_66]; {
}
  }

void __87__BNBannerSourceListenerHostedPresentableViewController_presentableWillAppearAsBanner___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v6 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      objc_super v4 = v6;
    }
    else {
      objc_super v4 = 0;
    }
  }
  else
  {
    objc_super v4 = 0;
  }
  id v5 = v4;

  [v5 setBannerAppearState:1];
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  [(BNBannerSourceListenerPresentableViewController *)&v4 presentableDidAppearAsBanner:a3];
  if (![(BNBannerSourceListenerPresentableViewController *)self _isPresentableContextInterfaceAvailable])[(FBScene *)self->_scene updateSettingsWithBlock:&__block_literal_global_70]; {
}
  }

void __86__BNBannerSourceListenerHostedPresentableViewController_presentableDidAppearAsBanner___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v6 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      objc_super v4 = v6;
    }
    else {
      objc_super v4 = 0;
    }
  }
  else
  {
    objc_super v4 = 0;
  }
  id v5 = v4;

  [v5 setBannerAppearState:2];
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  [(BNBannerSourceListenerPresentableViewController *)&v10 presentableWillDisappearAsBanner:a3 withReason:v6];
  if (![(BNBannerSourceListenerPresentableViewController *)self _isPresentableContextInterfaceAvailable])
  {
    scene = self->_scene;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __101__BNBannerSourceListenerHostedPresentableViewController_presentableWillDisappearAsBanner_withReason___block_invoke;
    v8[3] = &unk_1E63B98E8;
    id v9 = v6;
    [(FBScene *)scene updateSettingsWithBlock:v8];
  }
}

void __101__BNBannerSourceListenerHostedPresentableViewController_presentableWillDisappearAsBanner_withReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v7 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v7;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  [v6 setBannerAppearState:3];
  [v6 setRevocationReason:*(void *)(a1 + 32)];
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __100__BNBannerSourceListenerHostedPresentableViewController_presentableDidDisappearAsBanner_withReason___block_invoke;
  v20[3] = &unk_1E63B9F98;
  id v8 = v6;
  id v21 = v8;
  id v9 = v7;
  id v22 = v9;
  CGFloat v23 = self;
  objc_super v10 = (void (**)(void))MEMORY[0x1C1899380](v20);
  if ([(BNBannerSourceListenerPresentableViewController *)self _isPresentableContextInterfaceAvailable])
  {
    v10[2](v10);
  }
  else
  {
    id v11 = [(FBScene *)self->_scene settings];
    id v12 = (void *)[v11 mutableCopy];
    uint64_t v13 = objc_opt_class();
    id v14 = v12;
    if (v13)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = 0;
      }
    }
    else
    {
      uint64_t v15 = 0;
    }
    id v16 = v15;

    [v16 setBannerAppearState:0];
    [v16 setRevocationReason:v9];
    scene = self->_scene;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __100__BNBannerSourceListenerHostedPresentableViewController_presentableDidDisappearAsBanner_withReason___block_invoke_2;
    v18[3] = &unk_1E63B9FC0;
    CGFloat v19 = v10;
    [(FBScene *)scene updateSettings:v16 withTransitionContext:0 completion:v18];
  }
}

uint64_t __100__BNBannerSourceListenerHostedPresentableViewController_presentableDidDisappearAsBanner_withReason___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  v5.receiver = *(id *)(a1 + 48);
  v5.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  objc_msgSendSuper2(&v5, sel_presentableDidDisappearAsBanner_withReason_, v3, v2);
  return [*(id *)(a1 + 48) _tearDownSceneInfrastructureIfNecessary];
}

uint64_t __100__BNBannerSourceListenerHostedPresentableViewController_presentableDidDisappearAsBanner_withReason___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  [(BNBannerSourceListenerPresentableViewController *)&v10 presentableWillNotAppearAsBanner:a3 withReason:v6];
  if (![(BNBannerSourceListenerPresentableViewController *)self _isPresentableContextInterfaceAvailable])
  {
    id v7 = [[BNBannerSourceListenerPresentableRejectionAction alloc] initWithReason:v6];
    id v8 = [(BNBannerSourceListenerHostedPresentableViewController *)self scene];
    id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v7, 0);
    [v8 sendActions:v9];
  }
  [(BNBannerSourceListenerHostedPresentableViewController *)self _tearDownSceneInfrastructureIfNecessary];
}

- (void)userInteractionWillBeginForBannerForPresentable:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  [(BNBannerSourceListenerPresentableViewController *)&v4 userInteractionWillBeginForBannerForPresentable:a3];
  if (![(BNBannerSourceListenerPresentableViewController *)self _isPresentableContextInterfaceAvailable])[(FBScene *)self->_scene updateSettingsWithBlock:&__block_literal_global_83]; {
}
  }

void __105__BNBannerSourceListenerHostedPresentableViewController_userInteractionWillBeginForBannerForPresentable___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v6 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      objc_super v4 = v6;
    }
    else {
      objc_super v4 = 0;
    }
  }
  else
  {
    objc_super v4 = 0;
  }
  id v5 = v4;

  [v5 setUserInteractionInProgress:1];
}

- (void)userInteractionDidEndForBannerForPresentable:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  [(BNBannerSourceListenerPresentableViewController *)&v5 userInteractionDidEndForBannerForPresentable:a3];
  if (![(BNBannerSourceListenerPresentableViewController *)self _isPresentableContextInterfaceAvailable])[(FBScene *)self->_scene updateSettingsWithBlock:&__block_literal_global_87]; {
  panGestureProxy = self->_panGestureProxy;
  }
  self->_panGestureProxy = 0;
}

void __102__BNBannerSourceListenerHostedPresentableViewController_userInteractionDidEndForBannerForPresentable___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v6 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      objc_super v4 = v6;
    }
    else {
      objc_super v4 = 0;
    }
  }
  else
  {
    objc_super v4 = 0;
  }
  id v5 = v4;

  [v5 setUserInteractionInProgress:0];
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
        uint64_t v10 = objc_opt_class();
        id v11 = v9;
        if (v10)
        {
          if (objc_opt_isKindOfClass()) {
            id v12 = v11;
          }
          else {
            id v12 = 0;
          }
        }
        else
        {
          id v12 = 0;
        }
        id v13 = v12;

        if ([v13 canSendResponse])
        {
          id v14 = [MEMORY[0x1E4F4F678] response];
          [v13 sendResponse:v14];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v18 = a3;
  id v8 = a6;
  [(BNBannerSourceListenerHostedPresentableViewController *)self preferredContentSize];
  double v10 = v9;
  double v12 = v11;
  [(BNBannerSourceListenerHostedPresentableViewController *)self _updatePreferredContentSizeWithScene:v18 transitionContext:v8];

  float64x2_t v16 = *(float64x2_t *)&self->_bannerContentOutsets.bottom;
  float64x2_t v17 = *(float64x2_t *)&self->_bannerContentOutsets.top;
  [(BNBannerSourceListenerHostedPresentableViewController *)self _updateBannerContentOutsetsWithScene:v18];
  [(BNBannerSourceListenerHostedPresentableViewController *)self preferredContentSize];
  if (v10 == v14
    && v12 == v13
    && (~vaddv_s16((int16x4_t)vand_s8((int8x8_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v17, *(float64x2_t *)&self->_bannerContentOutsets.top), (int32x4_t)vceqq_f64(v16, *(float64x2_t *)&self->_bannerContentOutsets.bottom))), 0xFuLL)), (int8x8_t)0x8000400020001)) & 0xF) != 0)
  {
    long long v15 = [(BNBannerSourceListenerHostedPresentableViewController *)self parentViewController];
    [v15 bannerContentOutsetsDidInvalidateForPresentableViewController:self];
  }
  [(BNBannerSourceListenerHostedPresentableViewController *)self _updateClippingWithScene:v18];
}

- (void)sceneDidInvalidate:(id)a3
{
  scene = self->_scene;
  self->_scene = 0;

  [(BNBannerSourceListenerHostedPresentableViewController *)self _tearDownScenePresenterIfNecessary];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__BNBannerSourceListenerHostedPresentableViewController_sceneDidInvalidate___block_invoke;
  v5[3] = &unk_1E63B9810;
  v5[4] = self;
  [(BNBannerSourceListenerPresentableViewController *)self _enumerateObserversRespondingToSelector:sel_sceneDidInvalidateForBannerSourceListenerPresentable_ usingBlock:v5];
}

uint64_t __76__BNBannerSourceListenerHostedPresentableViewController_sceneDidInvalidate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 sceneDidInvalidateForBannerSourceListenerPresentable:*(void *)(a1 + 32)];
}

- (void)bannerSourceListenerPresentableViewControllerViewDidChangeSize:(id)a3
{
  v37.receiver = self;
  v37.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  [(BNBannerSourceListenerPresentableViewController *)&v37 bannerSourceListenerPresentableViewControllerViewDidChangeSize:a3];
  id v4 = [(BNBannerSourceListenerHostedPresentableViewController *)self view];
  uint64_t v5 = [v4 superview];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 window];
    [v4 frame];
    double v12 = v8;
    double v13 = v9;
    double v14 = v10;
    double v15 = v11;
    if (v7)
    {
      objc_msgSend(v6, "bn_convertRectToSceneReferenceSpace:", v8, v9, v10, v11);
      double v12 = v16;
      double v13 = v17;
      double v14 = v18;
      double v15 = v19;
    }
  }
  else
  {
    [v4 frame];
    double v12 = v20;
    double v13 = v21;
    double v14 = v22;
    double v15 = v23;
  }
  int v24 = [MEMORY[0x1E4F42FF0] _isInAnimationBlockWithAnimationsEnabled];
  scene = self->_scene;
  if (v24)
  {
    v26 = [(FBScene *)scene settings];
    uint64_t v27 = objc_opt_class();
    id v28 = v26;
    if (v27)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v29 = v28;
      }
      else {
        uint64_t v29 = 0;
      }
    }
    else
    {
      uint64_t v29 = 0;
    }
    id v30 = v29;

    v31 = (void *)[v30 mutableCopy];
    if (v31)
    {
      objc_msgSend(v31, "setFrame:", v12, v13, v14, v15);
      id v32 = objc_alloc_init(MEMORY[0x1E4F42790]);
      v33 = [(BNBannerSourceListenerHostedPresentableViewController *)self parentViewController];
      if (objc_opt_respondsToSelector())
      {
        v34 = [v33 sizeTransitionAnimationSettingsForPresentable:self];
      }
      else
      {
        v34 = 0;
      }
      [v32 setAnimationSettings:v34];
      if ((objc_opt_respondsToSelector() & 1) != 0
        && ![v33 shouldFenceAnimationsForPresentable:self])
      {
        CGAffineTransform v35 = 0;
      }
      else
      {
        CGAffineTransform v35 = [MEMORY[0x1E4F42D58] _synchronizedDrawingFence];
      }
      [v32 setAnimationFence:v35];
      [(FBScene *)self->_scene updateSettings:v31 withTransitionContext:v32 completion:0];
    }
  }
  else
  {
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __120__BNBannerSourceListenerHostedPresentableViewController_bannerSourceListenerPresentableViewControllerViewDidChangeSize___block_invoke;
    v36[3] = &__block_descriptor_64_e33_v16__0__FBSMutableSceneSettings_8l;
    *(double *)&v36[4] = v12;
    *(double *)&v36[5] = v13;
    *(double *)&v36[6] = v14;
    *(double *)&v36[7] = v15;
    [(FBScene *)scene updateSettingsWithBlock:v36];
  }
}

void __120__BNBannerSourceListenerHostedPresentableViewController_bannerSourceListenerPresentableViewControllerViewDidChangeSize___block_invoke(double *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v7 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v7;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  objc_msgSend(v6, "setFrame:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)_handleUserInterfaceStyleTraitChange:(id)a3
{
  scene = self->_scene;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __94__BNBannerSourceListenerHostedPresentableViewController__handleUserInterfaceStyleTraitChange___block_invoke;
  v4[3] = &unk_1E63BA008;
  v4[4] = self;
  [(FBScene *)scene updateSettingsWithTransitionBlock:v4];
}

id __94__BNBannerSourceListenerHostedPresentableViewController__handleUserInterfaceStyleTraitChange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  double v8 = [*(id *)(a1 + 32) traitCollection];
  uint64_t v9 = [v8 userInterfaceStyle];

  [v7 setUserInterfaceStyle:v9];
  double v10 = [*(id *)(a1 + 32) parentViewController];
  double v11 = +[FBSSceneTransitionContext transitionContext];
  if (objc_opt_respondsToSelector())
  {
    double v12 = [v10 userInterfaceStyleTransitionAnimationSettingsForPresentable:*(void *)(a1 + 32) forTransitionToStyle:v9];
  }
  else
  {
    double v12 = 0;
  }
  [v11 setBannerAnimationSettings:v12];
  double v13 = [MEMORY[0x1E4F42D58] _synchronizedDrawingFence];
  [v11 setAnimationFence:v13];

  return v11;
}

- (void)_updatePreferredContentSizeWithScene:(id)a3 transitionContext:(id)a4
{
  id v19 = a4;
  id v6 = [a3 clientSettings];
  uint64_t v7 = objc_opt_class();
  id v8 = v6;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    double v11 = [v19 animationSettings];
    bannerSizeTransitionAnimationSettings = self->_bannerSizeTransitionAnimationSettings;
    self->_bannerSizeTransitionAnimationSettings = v11;

    [v10 preferredContentSize];
    double v14 = v13;
    double v16 = v15;
    [(BNBannerSourceListenerHostedPresentableViewController *)self preferredContentSize];
    if (v18 != v14 || v17 != v16) {
      -[BNBannerSourceListenerHostedPresentableViewController setPreferredContentSize:](self, "setPreferredContentSize:", v14, v16);
    }
  }
}

- (void)_updateBannerContentOutsetsWithScene:(id)a3
{
  uint64_t v4 = [a3 clientSettings];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v16 = v7;

  id v8 = v16;
  if (v16)
  {
    [v16 bannerContentOutsets];
    id v8 = v16;
    BOOL v13 = self->_bannerContentOutsets.left == v10 && self->_bannerContentOutsets.top == v9;
    BOOL v14 = v13 && self->_bannerContentOutsets.right == v12;
    if (!v14 || self->_bannerContentOutsets.bottom != v11)
    {
      self->_bannerContentOutsets.double top = v9;
      self->_bannerContentOutsets.double left = v10;
      self->_bannerContentOutsets.double bottom = v11;
      self->_bannerContentOutsets.double right = v12;
    }
  }
}

- (void)_updateClippingWithScene:(id)a3
{
  uint64_t v4 = [a3 clientSettings];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v9 = v7;

  id v8 = v9;
  if (v9)
  {
    self->_BOOL isClippingEnabled = [v9 isClippingEnabled];
    id v8 = v9;
  }
}

- (void)_tearDownScenePresenterIfNecessary
{
  scenePresenter = self->_scenePresenter;
  if (scenePresenter)
  {
    self->_scenePresenter = 0;
    id v3 = scenePresenter;

    [(UIScenePresenter *)v3 deactivate];
    [(UIScenePresenter *)v3 invalidate];
  }
}

- (id)_tearDownSceneBlock:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__BNBannerSourceListenerHostedPresentableViewController__tearDownSceneBlock___block_invoke;
  v7[3] = &unk_1E63B9B88;
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = (void *)MEMORY[0x1C1899380](v7);

  return v5;
}

void __77__BNBannerSourceListenerHostedPresentableViewController__tearDownSceneBlock___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 updateSettingsWithBlock:&__block_literal_global_104];
    id v4 = [MEMORY[0x1E4F62490] sharedInstance];
    id v3 = [*(id *)(a1 + 32) identifier];
    [v4 destroyScene:v3 withTransitionContext:0];
  }
}

void __77__BNBannerSourceListenerHostedPresentableViewController__tearDownSceneBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v6 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v4 = v6;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  id v5 = v4;

  [v5 setForeground:0];
}

- (void)_tearDownSceneIfNecessary
{
  scene = self->_scene;
  if (scene)
  {
    self->_scene = 0;
    id v4 = scene;

    dispatch_block_t block = [(BNBannerSourceListenerHostedPresentableViewController *)self _tearDownSceneBlock:v4];

    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)_tearDownSceneInfrastructureIfNecessary
{
  [(BNBannerSourceListenerHostedPresentableViewController *)self _tearDownScenePresenterIfNecessary];
  [(BNBannerSourceListenerHostedPresentableViewController *)self _tearDownSceneIfNecessary];
}

- (FBScene)scene
{
  return self->_scene;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_bannerSizeTransitionAnimationSettings, 0);
  objc_storeStrong((id *)&self->_panGestureProxy, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
}

@end