@interface CSCameraExtensionViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)handleEvent:(id)a3;
- (BOOL)isLaunchMonitoringRequested;
- (BOOL)isLayoutElementSet;
- (CSCameraExtensionViewController)initWithCaptureApplication:(id)a3;
- (CSCameraExtensionViewControllerDelegate)delegate;
- (CSDismissableModalViewController)modalPresenter;
- (CSHostableEntityPresenterDelegate)entityPresenterDelegate;
- (FBScene)sceneForTraitsParticipant;
- (LCSCaptureApplicationDescribing)captureApplication;
- (NSSet)actionsToDeliverToHostableEntity;
- (SESecureCaptureSceneViewController)hostViewController;
- (id)_launchActions;
- (id)_newDisplayLayoutElement;
- (int64_t)_effectiveContentMode;
- (int64_t)hostableEntityContentMode;
- (int64_t)hostableEntityOrientation;
- (void)_applyHostableEntityContentMode;
- (void)_createHostViewController;
- (void)_updateDisplayLayoutElementForActivation:(id)a3;
- (void)aggregateAppearance:(id)a3;
- (void)aggregateBehavior:(id)a3;
- (void)applicationLaunchTransitionDidCompleteWithError:(id)a3;
- (void)dealloc;
- (void)dismiss;
- (void)invalidate;
- (void)prepareForApplicationLaunchTransition;
- (void)secureCaptureSceneViewController:(id)a3 didCreateScene:(id)a4;
- (void)secureCaptureSceneViewController:(id)a3 didDestroyScene:(id)a4;
- (void)secureCaptureSceneViewController:(id)a3 didSetIdleTimerDisabled:(BOOL)a4;
- (void)secureCaptureSceneViewController:(id)a3 requestsLaunchAfterTransitionCompletionWithAction:(id)a4 completion:(id)a5;
- (void)secureCaptureSceneViewController:(id)a3 requestsLaunchWithAction:(id)a4 completion:(id)a5;
- (void)setActionsToDeliverToHostableEntity:(id)a3;
- (void)setCaptureApplication:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEntityPresenterDelegate:(id)a3;
- (void)setHostViewController:(id)a3;
- (void)setHostableEntityContentMode:(int64_t)a3;
- (void)setLaunchMonitoringRequested:(BOOL)a3;
- (void)setLayoutElementSet:(BOOL)a3;
- (void)setModalPresenter:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation CSCameraExtensionViewController

- (CSCameraExtensionViewController)initWithCaptureApplication:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSCameraExtensionViewController;
  v6 = [(CSCameraExtensionViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_captureApplication, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(SESecureCaptureSceneViewController *)self->_hostViewController invalidate];
  hostViewController = self->_hostViewController;
  self->_hostViewController = 0;

  v4.receiver = self;
  v4.super_class = (Class)CSCameraExtensionViewController;
  [(CSCoverSheetViewControllerBase *)&v4 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)CSCameraExtensionViewController;
  [(CSCoverSheetViewControllerBase *)&v13 viewWillLayoutSubviews];
  v3 = [(CSCameraExtensionViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(SESecureCaptureSceneViewController *)self->_hostViewController view];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CSCameraExtensionViewController;
  [(CSCoverSheetViewControllerBase *)&v5 viewDidLoad];
  v3 = [(CSCameraExtensionViewController *)self view];
  double v4 = [MEMORY[0x1E4F428B8] blackColor];
  [v3 setBackgroundColor:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSCameraExtensionViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewWillAppear:a3];
  if (!self->_hostViewController) {
    [(CSCameraExtensionViewController *)self _createHostViewController];
  }
  [(CSCameraExtensionViewController *)self _applyHostableEntityContentMode];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSCameraExtensionViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewDidDisappear:a3];
  [(CSCameraExtensionViewController *)self _applyHostableEntityContentMode];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__CSCameraExtensionViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke;
  v7[3] = &unk_1E6AD87D0;
  id v8 = v5;
  id v6 = v5;
  [(CSCoverSheetViewControllerBase *)self updateDisplayLayoutElementWithBuilder:v7];
}

void __79__CSCameraExtensionViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = a2;
  [v2 level];
  [v4 setLevel:(uint64_t)v3];
}

- (void)secureCaptureSceneViewController:(id)a3 didSetIdleTimerDisabled:(BOOL)a4
{
  +[CSAction actionWithType:](CSAction, "actionWithType:", 3, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(CSCoverSheetViewControllerBase *)self sendAction:v5];
}

- (void)secureCaptureSceneViewController:(id)a3 requestsLaunchWithAction:(id)a4 completion:(id)a5
{
  p_delegate = &self->_delegate;
  id v8 = a5;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained cameraExtensionViewController:self requestsLaunchWithAction:v9 completion:v8];
}

- (void)secureCaptureSceneViewController:(id)a3 requestsLaunchAfterTransitionCompletionWithAction:(id)a4 completion:(id)a5
{
  p_delegate = &self->_delegate;
  id v8 = a5;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained cameraExtensionViewController:self requestsLaunchAfterTransitionCompletionWithAction:v9 completion:v8];
}

- (void)secureCaptureSceneViewController:(id)a3 didCreateScene:(id)a4
{
  id v5 = a4;
  id v6 = [(CSCameraExtensionViewController *)self delegate];
  [v6 cameraExtensionViewController:self didCreateScene:v5];
}

- (void)secureCaptureSceneViewController:(id)a3 didDestroyScene:(id)a4
{
  id v5 = a4;
  id v6 = [(CSCameraExtensionViewController *)self delegate];
  [v6 cameraExtensionViewController:self didDestroyScene:v5];
}

- (void)invalidate
{
  [(SESecureCaptureSceneViewController *)self->_hostViewController invalidate];
  [(CSCameraExtensionViewController *)self bs_removeChildViewController:self->_hostViewController];
  hostViewController = self->_hostViewController;
  self->_hostViewController = 0;
}

- (id)_newDisplayLayoutElement
{
  v2 = [(LCSCaptureApplicationDescribing *)self->_captureApplication extension];
  double v3 = [v2 bundleIdentifier];

  if (v3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4FA6A68]) initWithIdentifier:v3];
    [v4 setFillsDisplayBounds:1];
    [v4 setLayoutRole:6];
    [v4 setBundleIdentifier:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_updateDisplayLayoutElementForActivation:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CSCameraExtensionViewController;
  id v4 = a3;
  [(CSCoverSheetViewControllerBase *)&v5 _updateDisplayLayoutElementForActivation:v4];
  objc_msgSend(v4, "sb_setTransitioning:", (-[CSCameraExtensionViewController _appearState](self, "_appearState", v5.receiver, v5.super_class) & 0xFFFFFFFD) == 1);
}

- (void)dismiss
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_modalPresenter);
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __42__CSCameraExtensionViewController_dismiss__block_invoke;
    v6[3] = &unk_1E6AD87F8;
    id v7 = WeakRetained;
    [v7 dismissContentViewController:self animated:1 completion:v6];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CSCameraExtensionViewController;
    [(CSCoverSheetViewControllerBase *)&v5 dismiss];
  }
}

uint64_t __42__CSCameraExtensionViewController_dismiss__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismiss];
}

- (void)aggregateAppearance:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CSCameraExtensionViewController;
  id v3 = a3;
  [(CSCoverSheetViewControllerBase *)&v17 aggregateAppearance:v3];
  id v4 = objc_opt_new();
  objc_super v5 = objc_msgSend(v4, "priority:", 40, v17.receiver, v17.super_class);
  id v6 = [v5 fakeStatusBar:1];
  id v7 = [v6 fakeStatusBarLevel:&unk_1F306BD28];
  [v3 addComponent:v7];

  id v8 = +[CSComponent homeAffordance];
  id v9 = [v8 priority:40];
  double v10 = [v9 hidden:1];
  [v3 addComponent:v10];

  double v11 = objc_opt_new();
  v12 = [v11 priority:40];
  objc_super v13 = [v12 hidden:1];
  [v3 addComponent:v13];

  v14 = +[CSComponent dateView];
  v15 = [v14 priority:40];
  v16 = [v15 hidden:1];
  [v3 addComponent:v16];
}

- (void)aggregateBehavior:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CSCameraExtensionViewController;
  id v4 = a3;
  [(CSCoverSheetViewControllerBase *)&v9 aggregateBehavior:v4];
  int v5 = [(SESecureCaptureSceneViewController *)self->_hostViewController requestsIdleTimerDisabled];
  if (v5) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 1;
  }
  if (v5) {
    uint64_t v7 = 14;
  }
  else {
    uint64_t v7 = 13;
  }
  if (v5) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = 2;
  }
  [v4 setIdleTimerMode:v6];
  [v4 setIdleTimerDuration:v7];
  [v4 setIdleWarnMode:v8];
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSCameraExtensionViewController;
  if (![(CSCoverSheetViewControllerBase *)&v10 handleEvent:v4]
    || ([v4 isConsumable] & 1) == 0)
  {
    uint64_t v6 = [v4 type];
    if (v6 == 10)
    {
      uint64_t v7 = self;
      uint64_t v8 = 3;
    }
    else
    {
      if (v6 != 11)
      {
        if (v6 == 25) {
          [(CSCameraExtensionViewController *)self dismiss];
        }
        goto LABEL_11;
      }
      uint64_t v7 = self;
      uint64_t v8 = 2;
    }
    [(CSCameraExtensionViewController *)v7 setHostableEntityContentMode:v8];
LABEL_11:
    char v5 = 0;
    goto LABEL_12;
  }
  char v5 = [v4 isConsumable];
LABEL_12:

  return v5;
}

- (void)setHostableEntityContentMode:(int64_t)a3
{
  if (self->_hostableEntityContentMode != a3)
  {
    self->_hostableEntityContentMode = a3;
    [(CSCameraExtensionViewController *)self _applyHostableEntityContentMode];
  }
}

- (void)setActionsToDeliverToHostableEntity:(id)a3
{
  id v6 = a3;
  if ((BSEqualSets() & 1) == 0)
  {
    [(CSCameraExtensionViewController *)self bs_removeChildViewController:self->_hostViewController];
    [(SESecureCaptureSceneViewController *)self->_hostViewController invalidate];
    id v4 = (NSSet *)[v6 copy];
    actionsToDeliverToHostableEntity = self->_actionsToDeliverToHostableEntity;
    self->_actionsToDeliverToHostableEntity = v4;

    if (![(CSCoverSheetViewControllerBase *)self isDisappeared]) {
      [(CSCameraExtensionViewController *)self _createHostViewController];
    }
  }
}

- (FBScene)sceneForTraitsParticipant
{
  return (FBScene *)[(SESecureCaptureSceneViewController *)self->_hostViewController _scene];
}

- (int64_t)hostableEntityOrientation
{
  return [(SESecureCaptureSceneViewController *)self->_hostViewController interfaceOrientation];
}

- (int64_t)_effectiveContentMode
{
  BOOL v3 = [(CSCoverSheetViewControllerBase *)self isDisappeared];
  if (self->_hostableEntityContentMode <= 1) {
    int64_t hostableEntityContentMode = 1;
  }
  else {
    int64_t hostableEntityContentMode = self->_hostableEntityContentMode;
  }
  if (v3) {
    return hostableEntityContentMode;
  }
  else {
    return self->_hostableEntityContentMode;
  }
}

- (void)_applyHostableEntityContentMode
{
  int64_t v3 = [(CSCameraExtensionViewController *)self _effectiveContentMode];
  if (v3 == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained cameraExtensionViewControllerWillPresent:self];
    }
    [(SESecureCaptureSceneViewController *)self->_hostViewController setPresentationMode:1];
    if (![(CSCameraExtensionViewController *)self isLayoutElementSet])
    {
      [(CSCoverSheetViewControllerBase *)self _setDisplayLayoutElementActive:1 immediately:1];
      self->_layoutElementSet = 1;
    }
    if (self->_hostViewController
      && ![(CSCameraExtensionViewController *)self isLaunchMonitoringRequested]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      char v5 = [(SESecureCaptureSceneViewController *)self->_hostViewController _scene];
      [WeakRetained cameraExtensionViewController:self requestsLaunchMonitoringForScene:v5];

      self->_launchMonitoringRequested = 1;
    }
  }
  else
  {
    if (v3 == 3) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 0;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [(SESecureCaptureSceneViewController *)self->_hostViewController setPresentationMode:v4];
  }
}

- (id)_launchActions
{
  actionsToDeliverToHostableEntity = self->_actionsToDeliverToHostableEntity;
  uint64_t v4 = actionsToDeliverToHostableEntity;
  if (!actionsToDeliverToHostableEntity)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CAD0] set];
  }
  char v5 = [(LCSCaptureApplicationDescribing *)self->_captureApplication launchActions];
  id v6 = [v4 setByAddingObjectsFromSet:v5];

  if (!actionsToDeliverToHostableEntity) {

  }
  return v6;
}

- (void)_createHostViewController
{
  id v3 = objc_alloc(MEMORY[0x1E4F9A5C8]);
  uint64_t v4 = [(LCSCaptureApplicationDescribing *)self->_captureApplication extension];
  char v5 = [(CSCameraExtensionViewController *)self _launchActions];
  id v6 = (SESecureCaptureSceneViewController *)[v3 initWithProvider:v4 launchActions:v5];
  hostViewController = self->_hostViewController;
  self->_hostViewController = v6;

  actionsToDeliverToHostableEntity = self->_actionsToDeliverToHostableEntity;
  self->_actionsToDeliverToHostableEntity = 0;

  [(SESecureCaptureSceneViewController *)self->_hostViewController setDelegate:self];
  [(CSCameraExtensionViewController *)self bs_addChildViewController:self->_hostViewController];

  [(CSCameraExtensionViewController *)self _applyHostableEntityContentMode];
}

- (void)prepareForApplicationLaunchTransition
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = SBLogDashBoard();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(LCSCaptureApplicationDescribing *)self->_captureApplication bundleIdentifier];
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl(&dword_1D839D000, v3, OS_LOG_TYPE_DEFAULT, "Prepare for application launch transition to %@", (uint8_t *)&v5, 0xCu);
  }
  [(CSCameraExtensionViewController *)self setHostableEntityContentMode:3];
}

- (void)applicationLaunchTransitionDidCompleteWithError:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = SBLogDashBoard();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(CSCameraExtensionViewController *)(uint64_t)self applicationLaunchTransitionDidCompleteWithError:v6];
    }

    [(CSCameraExtensionViewController *)self setHostableEntityContentMode:2];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [(LCSCaptureApplicationDescribing *)self->_captureApplication bundleIdentifier];
      int v8 = 138412290;
      objc_super v9 = v7;
      _os_log_impl(&dword_1D839D000, v6, OS_LOG_TYPE_DEFAULT, "Capture application launch transition to %@ completed successfully", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (CSHostableEntityPresenterDelegate)entityPresenterDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_entityPresenterDelegate);

  return (CSHostableEntityPresenterDelegate *)WeakRetained;
}

- (void)setEntityPresenterDelegate:(id)a3
{
}

- (int64_t)hostableEntityContentMode
{
  return self->_hostableEntityContentMode;
}

- (NSSet)actionsToDeliverToHostableEntity
{
  return self->_actionsToDeliverToHostableEntity;
}

- (LCSCaptureApplicationDescribing)captureApplication
{
  return self->_captureApplication;
}

- (void)setCaptureApplication:(id)a3
{
}

- (CSCameraExtensionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSCameraExtensionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CSDismissableModalViewController)modalPresenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_modalPresenter);

  return (CSDismissableModalViewController *)WeakRetained;
}

- (void)setModalPresenter:(id)a3
{
}

- (SESecureCaptureSceneViewController)hostViewController
{
  return self->_hostViewController;
}

- (void)setHostViewController:(id)a3
{
}

- (BOOL)isLaunchMonitoringRequested
{
  return self->_launchMonitoringRequested;
}

- (void)setLaunchMonitoringRequested:(BOOL)a3
{
  self->_launchMonitoringRequested = a3;
}

- (BOOL)isLayoutElementSet
{
  return self->_layoutElementSet;
}

- (void)setLayoutElementSet:(BOOL)a3
{
  self->_layoutElementSet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostViewController, 0);
  objc_destroyWeak((id *)&self->_modalPresenter);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_captureApplication, 0);
  objc_storeStrong((id *)&self->_actionsToDeliverToHostableEntity, 0);

  objc_destroyWeak((id *)&self->_entityPresenterDelegate);
}

- (void)applicationLaunchTransitionDidCompleteWithError:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v5 = [*(id *)(a1 + 1080) bundleIdentifier];
  id v6 = [a2 debugDescription];
  int v7 = 138412546;
  int v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_1D839D000, a3, OS_LOG_TYPE_ERROR, "Capture application launch transition to %@ completed with error: %@", (uint8_t *)&v7, 0x16u);
}

@end