@interface CSHostedEntityViewController
- (BOOL)canHostAnApp;
- (BOOL)handlesRotationIndependentOfCoverSheet;
- (BOOL)isHostingAnApp;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)wantsDefaultModalDismissalBehavior;
- (CSHostableEntity)hostedEntity;
- (CSHostableEntityPresenterDelegate)entityPresenterDelegate;
- (FBScene)sceneForTraitsParticipant;
- (NSSet)actionsToDeliverToHostableEntity;
- (SBApplicationSceneHandle)applicationSceneHandle;
- (SBApplicationSceneHandle)sceneHandleForTraitsParticipant;
- (SBHomeGrabberView)homeGrabberView;
- (id)acquireLiveContentAssertionForReason:(id)a3;
- (id)hostedAppSceneHandle;
- (id)hostedAppSceneHandles;
- (id)traitsParticipantForSceneHandle:(id)a3;
- (int64_t)_effectiveContentMode;
- (int64_t)hostableEntityContentMode;
- (int64_t)hostableEntityOrientation;
- (void)_addEntityViewControllerIfNeeded;
- (void)_updateContentMode;
- (void)addGrabberView:(id)a3;
- (void)aggregateAppearance:(id)a3;
- (void)aggregateBehavior:(id)a3;
- (void)aggregatePresentation:(id)a3;
- (void)dealloc;
- (void)hostableEntityPresenter:(id)a3 didBeginHosting:(id)a4;
- (void)hostableEntityPresenter:(id)a3 didEndHosting:(id)a4;
- (void)hostableEntityPresenter:(id)a3 didFailToActivate:(id)a4;
- (void)hostedAppWillRotateToInterfaceOrientation:(int64_t)a3;
- (void)invalidate;
- (void)setActionsToDeliverToHostableEntity:(id)a3;
- (void)setEntityPresenterDelegate:(id)a3;
- (void)setHomeGrabberView:(id)a3;
- (void)setHostableEntityContentMode:(int64_t)a3;
- (void)setHostedAppReferenceSize:(CGSize)a3 withInterfaceOrientation:(int64_t)a4;
- (void)setHostedEntity:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)viewDidLoad;
@end

@implementation CSHostedEntityViewController

- (void)aggregateBehavior:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CSHostedEntityViewController;
  id v4 = a3;
  [(CSCoverSheetViewControllerBase *)&v5 aggregateBehavior:v4];
  objc_msgSend(v4, "unionBehavior:", self->_entityViewController, v5.receiver, v5.super_class);
}

- (BOOL)isHostingAnApp
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return ![(CSCoverSheetViewControllerBase *)self isDisappeared];
  }
  entityViewController = self->_entityViewController;

  return [(CSCoverSheetViewPresenting *)entityViewController isHostingAnApp];
}

- (CSHostableEntity)hostedEntity
{
  return self->_hostedEntity;
}

- (void)hostableEntityPresenter:(id)a3 didBeginHosting:(id)a4
{
  id v6 = a4;
  objc_super v5 = [(CSHostedEntityViewController *)self entityPresenterDelegate];
  if (objc_opt_respondsToSelector()) {
    [v5 hostableEntityPresenter:self didBeginHosting:v6];
  }
}

- (CSHostableEntityPresenterDelegate)entityPresenterDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_entityPresenterDelegate);

  return (CSHostableEntityPresenterDelegate *)WeakRetained;
}

- (SBApplicationSceneHandle)sceneHandleForTraitsParticipant
{
  if (objc_opt_respondsToSelector())
  {
    v3 = [(CSCoverSheetViewPresenting *)self->_entityViewController sceneHandleForTraitsParticipant];
  }
  else
  {
    v3 = 0;
  }

  return (SBApplicationSceneHandle *)v3;
}

- (SBHomeGrabberView)homeGrabberView
{
  return (SBHomeGrabberView *)self->_grabberView;
}

- (void)dealloc
{
  [(BSCompoundAssertion *)self->_liveContentAssertions invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CSHostedEntityViewController;
  [(CSCoverSheetViewControllerBase *)&v3 dealloc];
}

- (void)setHostedEntity:(id)a3
{
  objc_super v5 = (CSHostableEntity *)a3;
  if (self->_hostedEntity != v5)
  {
    if (self->_entityViewController)
    {
      if (objc_opt_respondsToSelector())
      {
        id v6 = [(CSCoverSheetViewPresenting *)self->_entityViewController actionsToDeliverToHostableEntity];
        [(CSCoverSheetViewPresenting *)self->_entityViewController setActionsToDeliverToHostableEntity:0];
      }
      else
      {
        id v6 = 0;
      }
      entityViewController = self->_entityViewController;
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      v14 = __48__CSHostedEntityViewController_setHostedEntity___block_invoke;
      v15 = &unk_1E6AD8AF8;
      v16 = v5;
      v17 = self;
      [(CSHostedEntityViewController *)self bs_removeChildViewController:entityViewController animated:0 transitionBlock:&v12];
      v9 = self->_entityViewController;
      self->_entityViewController = 0;

      pendingActionsToDeliverToHostableEntity = v16;
    }
    else
    {
      id v6 = self->_pendingActionsToDeliverToHostableEntity;
      pendingActionsToDeliverToHostableEntity = self->_pendingActionsToDeliverToHostableEntity;
      self->_pendingActionsToDeliverToHostableEntity = 0;
    }

    objc_storeStrong((id *)&self->_hostedEntity, a3);
    v10 = [(CSHostableEntity *)self->_hostedEntity hostingViewController];
    v11 = self->_entityViewController;
    self->_entityViewController = v10;

    [(CSCoverSheetViewPresenting *)self->_entityViewController setEntityPresenterDelegate:self];
    [(CSHostedEntityViewController *)self _addEntityViewControllerIfNeeded];
    if (objc_opt_respondsToSelector()) {
      [(CSCoverSheetViewPresenting *)self->_entityViewController setActionsToDeliverToHostableEntity:v6];
    }
    else {
      objc_storeStrong((id *)&self->_pendingActionsToDeliverToHostableEntity, v6);
    }
    [(CSCoverSheetViewControllerBase *)self rebuildBehavior];
    [(CSCoverSheetViewControllerBase *)self rebuildAppearance];
  }
}

void __48__CSHostedEntityViewController_setHostedEntity___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = a2;
  if (*(void *)(a1 + 32) && (objc_opt_respondsToSelector() & 1) != 0) {
    [*(id *)(*(void *)(a1 + 40) + 1064) invalidateForReplacementByEntity:*(void *)(a1 + 32)];
  }
  else {
    [*(id *)(*(void *)(a1 + 40) + 1064) invalidate];
  }
  v3[2]();
}

- (id)acquireLiveContentAssertionForReason:(id)a3
{
  id v4 = a3;
  liveContentAssertions = self->_liveContentAssertions;
  if (!liveContentAssertions)
  {
    objc_initWeak(&location, self);
    id v6 = (void *)MEMORY[0x1E4F4F6E8];
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __69__CSHostedEntityViewController_acquireLiveContentAssertionForReason___block_invoke;
    v16 = &unk_1E6ADAD00;
    objc_copyWeak(&v17, &location);
    v9 = [v6 assertionWithIdentifier:v8 stateDidChangeHandler:&v13];
    v10 = self->_liveContentAssertions;
    self->_liveContentAssertions = v9;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    liveContentAssertions = self->_liveContentAssertions;
  }
  v11 = -[BSCompoundAssertion acquireForReason:](liveContentAssertions, "acquireForReason:", v4, v13, v14, v15, v16);

  return v11;
}

void __69__CSHostedEntityViewController_acquireLiveContentAssertionForReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  BSDispatchMain();
  objc_destroyWeak(&v4);
}

void __69__CSHostedEntityViewController_acquireLiveContentAssertionForReason___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateContentMode];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CSHostedEntityViewController;
  [(CSCoverSheetViewControllerBase *)&v3 viewDidLoad];
  [(CSHostedEntityViewController *)self _addEntityViewControllerIfNeeded];
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)aggregateAppearance:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CSHostedEntityViewController;
  id v4 = a3;
  [(CSCoverSheetViewControllerBase *)&v5 aggregateAppearance:v4];
  objc_msgSend(v4, "unionAppearance:", self->_entityViewController, v5.receiver, v5.super_class);
}

- (void)aggregatePresentation:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CSHostedEntityViewController;
  id v4 = a3;
  [(CSCoverSheetViewControllerBase *)&v5 aggregatePresentation:v4];
  objc_msgSend(v4, "unionPresentation:", self->_entityViewController, v5.receiver, v5.super_class);
}

- (BOOL)canHostAnApp
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  entityViewController = self->_entityViewController;

  return [(CSCoverSheetViewPresenting *)entityViewController canHostAnApp];
}

- (id)hostedAppSceneHandle
{
  if (objc_opt_respondsToSelector())
  {
    objc_super v3 = [(CSCoverSheetViewPresenting *)self->_entityViewController hostedAppSceneHandle];
  }
  else
  {
    objc_super v3 = 0;
  }

  return v3;
}

- (id)hostedAppSceneHandles
{
  if (objc_opt_respondsToSelector())
  {
    objc_super v3 = [(CSCoverSheetViewPresenting *)self->_entityViewController hostedAppSceneHandles];
  }
  else
  {
    objc_super v3 = 0;
  }

  return v3;
}

- (void)setInvalidationHandler:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(CSCoverSheetViewPresenting *)self->_entityViewController setInvalidationHandler:v4];
  }
}

- (id)traitsParticipantForSceneHandle:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    objc_super v5 = [(CSCoverSheetViewPresenting *)self->_entityViewController traitsParticipantForSceneHandle:v4];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (void)setHostedAppReferenceSize:(CGSize)a3 withInterfaceOrientation:(int64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  if (objc_opt_respondsToSelector())
  {
    entityViewController = self->_entityViewController;
    -[CSCoverSheetViewPresenting setHostedAppReferenceSize:withInterfaceOrientation:](entityViewController, "setHostedAppReferenceSize:withInterfaceOrientation:", a4, width, height);
  }
}

- (void)hostedAppWillRotateToInterfaceOrientation:(int64_t)a3
{
  if (objc_opt_respondsToSelector())
  {
    entityViewController = self->_entityViewController;
    [(CSCoverSheetViewPresenting *)entityViewController hostedAppWillRotateToInterfaceOrientation:a3];
  }
}

- (BOOL)handlesRotationIndependentOfCoverSheet
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  entityViewController = self->_entityViewController;

  return [(CSCoverSheetViewPresenting *)entityViewController handlesRotationIndependentOfCoverSheet];
}

- (int64_t)hostableEntityContentMode
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 2;
  }
  entityViewController = self->_entityViewController;

  return [(CSCoverSheetViewPresenting *)entityViewController hostableEntityContentMode];
}

- (void)setHostableEntityContentMode:(int64_t)a3
{
  self->_desiredContentMode = a3;
  [(CSHostedEntityViewController *)self _updateContentMode];
}

- (NSSet)actionsToDeliverToHostableEntity
{
  if (objc_opt_respondsToSelector())
  {
    objc_super v3 = [(CSCoverSheetViewPresenting *)self->_entityViewController actionsToDeliverToHostableEntity];
  }
  else
  {
    objc_super v3 = 0;
  }

  return (NSSet *)v3;
}

- (void)setActionsToDeliverToHostableEntity:(id)a3
{
  id v8 = a3;
  char v4 = objc_opt_respondsToSelector();
  entityViewController = self->_entityViewController;
  if (v4)
  {
    [(CSCoverSheetViewPresenting *)entityViewController setActionsToDeliverToHostableEntity:v8];
  }
  else if (!entityViewController)
  {
    id v6 = (NSSet *)[v8 copy];
    pendingActionsToDeliverToHostableEntity = self->_pendingActionsToDeliverToHostableEntity;
    self->_pendingActionsToDeliverToHostableEntity = v6;
  }
}

- (int64_t)hostableEntityOrientation
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  entityViewController = self->_entityViewController;

  return [(CSCoverSheetViewPresenting *)entityViewController hostableEntityOrientation];
}

- (FBScene)sceneForTraitsParticipant
{
  if (objc_opt_respondsToSelector())
  {
    objc_super v3 = [(CSCoverSheetViewPresenting *)self->_entityViewController sceneForTraitsParticipant];
  }
  else
  {
    objc_super v3 = 0;
  }

  return (FBScene *)v3;
}

- (void)setHomeGrabberView:(id)a3
{
  p_grabberView = &self->_grabberView;
  id v8 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    [(UIView *)*p_grabberView removeFromSuperview];
    objc_storeStrong((id *)&self->_grabberView, a3);
    id v6 = [(CSHostedEntityViewController *)self view];
    v7 = *p_grabberView;
    [v6 bounds];
    -[UIView setFrame:](v7, "setFrame:");
    [(UIView *)*p_grabberView setAutoresizingMask:18];
    [v6 addSubview:*p_grabberView];
  }
}

- (void)hostableEntityPresenter:(id)a3 didEndHosting:(id)a4
{
  id v6 = a4;
  objc_super v5 = [(CSHostedEntityViewController *)self entityPresenterDelegate];
  if (objc_opt_respondsToSelector()) {
    [v5 hostableEntityPresenter:self didEndHosting:v6];
  }
}

- (void)hostableEntityPresenter:(id)a3 didFailToActivate:(id)a4
{
  id v6 = a4;
  objc_super v5 = [(CSHostedEntityViewController *)self entityPresenterDelegate];
  if (objc_opt_respondsToSelector()) {
    [v5 hostableEntityPresenter:self didFailToActivate:v6];
  }
}

- (SBApplicationSceneHandle)applicationSceneHandle
{
  if (objc_opt_respondsToSelector()) {
    [(CSCoverSheetViewPresenting *)self->_entityViewController applicationSceneHandle];
  }
  else {
  objc_super v3 = [(CSHostedEntityViewController *)self hostedAppSceneHandle];
  }

  return (SBApplicationSceneHandle *)v3;
}

- (void)addGrabberView:(id)a3
{
  id v4 = a3;
  Class v5 = NSClassFromString(&cfstr_Sbhomegrabberv.isa);
  id v8 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v8;
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

  if (v7) {
    [(CSHostedEntityViewController *)self setHomeGrabberView:v7];
  }
}

- (BOOL)wantsDefaultModalDismissalBehavior
{
  return 1;
}

- (void)invalidate
{
  [(CSCoverSheetViewPresenting *)self->_entityViewController invalidate];
  entityViewController = self->_entityViewController;
  self->_entityViewController = 0;

  hostedEntity = self->_hostedEntity;
  self->_hostedEntity = 0;
}

- (int64_t)_effectiveContentMode
{
  int64_t desiredContentMode = self->_desiredContentMode;
  if ([(BSCompoundAssertion *)self->_liveContentAssertions isActive]
    && self->_entityViewController)
  {
    return 2;
  }
  return desiredContentMode;
}

- (void)_updateContentMode
{
  int64_t v3 = [(CSHostedEntityViewController *)self _effectiveContentMode];
  if (objc_opt_respondsToSelector())
  {
    entityViewController = self->_entityViewController;
    [(CSCoverSheetViewPresenting *)entityViewController setHostableEntityContentMode:v3];
  }
}

- (void)_addEntityViewControllerIfNeeded
{
  int64_t v3 = [(CSHostedEntityViewController *)self viewIfLoaded];
  id v4 = [(CSCoverSheetViewPresenting *)self->_entityViewController parentViewController];

  if (v4 != self && v3 != 0)
  {
    [(CSHostedEntityViewController *)self _updateContentMode];
    id v6 = [(CSCoverSheetViewPresenting *)self->_entityViewController view];
    entityViewController = self->_entityViewController;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__CSHostedEntityViewController__addEntityViewControllerIfNeeded__block_invoke;
    v9[3] = &unk_1E6AD9F50;
    id v10 = v6;
    id v11 = v3;
    uint64_t v12 = self;
    id v8 = v6;
    [(CSHostedEntityViewController *)self bs_addChildViewController:entityViewController animated:0 transitionBlock:v9];
  }
}

void __64__CSHostedEntityViewController__addEntityViewControllerIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  int64_t v3 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) bounds];
  objc_msgSend(v3, "setFrame:");
  [*(id *)(a1 + 32) setAutoresizingMask:18];
  if (*(void *)(*(void *)(a1 + 48) + 1072)) {
    objc_msgSend(*(id *)(a1 + 40), "bringSubviewToFront:");
  }
  v4[2]();
}

- (void)setEntityPresenterDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_entityPresenterDelegate);
  objc_storeStrong((id *)&self->_hostedEntity, 0);
  objc_storeStrong((id *)&self->_liveContentAssertions, 0);
  objc_storeStrong((id *)&self->_pendingActionsToDeliverToHostableEntity, 0);
  objc_storeStrong((id *)&self->_grabberView, 0);

  objc_storeStrong((id *)&self->_entityViewController, 0);
}

@end