@interface SSSDittoRootViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)shouldAnimateDragCancel;
- (SSSDittoRootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SSSDittoRootViewControllerDelegate)delegate;
- (SSSDittoViewController)hostingViewController;
- (SSSViewControllerManager)viewControllerManager;
- (id)childViewControllerForStatusBarHidden;
- (id)childViewControllerForStatusBarStyle;
- (int)_preferredStatusBarVisibility;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)state;
- (unint64_t)supportedInterfaceOrientations;
- (void)_addContainerViewController:(id)a3;
- (void)_createAndParentContainerViewControllerIfPossible;
- (void)_createContainerViewControllerIfNecessary;
- (void)_dismissAnimated:(BOOL)a3;
- (void)_dismissAnimated:(BOOL)a3 completion:(id)a4;
- (void)_postNotificationForDidChangeToState:(unint64_t)a3;
- (void)_postNotificationForWillChangeToState:(unint64_t)a3;
- (void)_postNotificationName:(id)a3;
- (void)_updateForCurrentSize;
- (void)_updateForSize:(CGSize)a3;
- (void)containerViewController:(id)a3 didTransitionToState:(unint64_t)a4;
- (void)containerViewController:(id)a3 willBeginDismissAnimationWithSettings:(id)a4;
- (void)containerViewController:(id)a3 willShowSharingUIWithBlock:(id)a4;
- (void)containerViewController:(id)a3 willShowTestFlightUIWithBlock:(id)a4;
- (void)containerViewController:(id)a3 willTransitionToState:(unint64_t)a4 animated:(BOOL)a5 changeBlock:(id)a6;
- (void)containerViewControllerBeganDragAndDrop:(id)a3;
- (void)containerViewControllerBeganShowingWaitingForImageIdentifierUpdatesUI:(id)a3;
- (void)containerViewControllerDidEndDismissAnimation:(id)a3;
- (void)containerViewControllerEndedDragAndDrop:(id)a3 shouldDismiss:(BOOL)a4;
- (void)containerViewControllerEndedShowingSharingUI:(id)a3 inStateTransition:(BOOL)a4;
- (void)containerViewControllerEndedShowingWaitingForImageIdentifierUpdatesUI:(id)a3;
- (void)containerViewControllerHadGestureInteraction:(id)a3;
- (void)dittoDismissTimerFired:(id)a3;
- (void)fullscreenify;
- (void)fullscreenifyWithCompletion:(id)a3;
- (void)performInteractiveGesturePresentationCompleteAnimations;
- (void)performProgrammaticDismiss;
- (void)performProgrammaticDismissWithCompletion:(id)a3;
- (void)pipify;
- (void)pipifyWithCompletion:(id)a3;
- (void)screenshotReceived:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setHostingViewController:(id)a3;
- (void)setViewControllerManager:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SSSDittoRootViewController

- (SSSDittoRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SSSDittoRootViewController;
  v4 = [(SSSDittoRootViewController *)&v8 initWithNibName:a3 bundle:a4];
  v5 = objc_alloc_init(SSSDittoDismissTimer);
  dismissTimer = v4->_dismissTimer;
  v4->_dismissTimer = v5;

  [(SSSDittoDismissTimer *)v4->_dismissTimer setDelegate:v4];
  return v4;
}

- (void)screenshotReceived:(id)a3 completion:(id)a4
{
  dismissTimer = self->_dismissTimer;
  id v7 = a4;
  id v8 = a3;
  [(SSSDittoDismissTimer *)dismissTimer newScreenshotReceived];
  [(SSSDittoRootViewController *)self _createAndParentContainerViewControllerIfPossible];
  [(SSSContainerViewController *)self->_containerViewController addScreenshot:v8 completion:v7];
}

- (void)_createContainerViewControllerIfNecessary
{
  if (!self->_containerViewController)
  {
    v3 = objc_alloc_init(SSSContainerViewController);
    containerViewController = self->_containerViewController;
    self->_containerViewController = v3;

    [(SSSContainerViewController *)self->_containerViewController setDelegate:self];
    [(SSSDittoRootViewController *)self _updateForCurrentSize];
  }
}

- (void)_createAndParentContainerViewControllerIfPossible
{
  [(SSSDittoRootViewController *)self _createContainerViewControllerIfNecessary];
  v3 = [(SSSContainerViewController *)self->_containerViewController parentViewController];

  if (v3 != self)
  {
    containerViewController = self->_containerViewController;
    [(SSSDittoRootViewController *)self _addContainerViewController:containerViewController];
  }
}

- (void)_addContainerViewController:(id)a3
{
  [(SSSDittoRootViewController *)self addChildViewController:self->_containerViewController];
  v4 = [(SSSDittoRootViewController *)self view];
  v5 = [(SSSContainerViewController *)self->_containerViewController view];
  [v4 addSubview:v5];

  [(SSSContainerViewController *)self->_containerViewController didMoveToParentViewController:self];
  dismissTimer = self->_dismissTimer;

  [(SSSDittoDismissTimer *)dismissTimer setUserInterfaceHidden:0];
}

- (id)childViewControllerForStatusBarStyle
{
  return self->_containerViewController;
}

- (id)childViewControllerForStatusBarHidden
{
  return self->_containerViewController;
}

- (int64_t)preferredStatusBarStyle
{
  return -1;
}

- (int)_preferredStatusBarVisibility
{
  return 0;
}

- (void)performInteractiveGesturePresentationCompleteAnimations
{
}

- (void)containerViewController:(id)a3 willTransitionToState:(unint64_t)a4 animated:(BOOL)a5 changeBlock:(id)a6
{
  id v9 = a6;
  if (a4 == 1) {
    [(SSSDittoDismissTimer *)self->_dismissTimer setViewState:1];
  }
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_10001D0D8;
  v16 = &unk_100099FF0;
  id v18 = v9;
  unint64_t v19 = a4;
  BOOL v20 = a5;
  v17 = self;
  id v10 = v9;
  v11 = objc_retainBlock(&v13);
  self->_containerViewControllerTargetState = a4;
  v12 = [(SSSDittoRootViewController *)self delegate];
  [v12 dittoRootViewController:self willTransitionToState:a4 changeBlock:v11];

  [(SSSDittoRootViewController *)self _postNotificationForWillChangeToState:a4];
}

- (void)containerViewController:(id)a3 didTransitionToState:(unint64_t)a4
{
  if (!a4) {
    [(SSSDittoDismissTimer *)self->_dismissTimer setViewState:0];
  }
  v6 = [(SSSDittoRootViewController *)self delegate];
  [v6 dittoRootViewController:self didTransitionToState:a4];

  [(SSSDittoRootViewController *)self _postNotificationForDidChangeToState:a4];
}

- (void)containerViewControllerHadGestureInteraction:(id)a3
{
}

- (void)containerViewControllerBeganDragAndDrop:(id)a3
{
  self->_isInDragAndDrop = 1;
  [(SSSDittoDismissTimer *)self->_dismissTimer setInDragAndDrop:1];
}

- (void)containerViewControllerEndedDragAndDrop:(id)a3 shouldDismiss:(BOOL)a4
{
  BOOL v4 = a4;
  self->_isInDragAndDrop = 0;
  [(SSSDittoDismissTimer *)self->_dismissTimer setInDragAndDrop:0];
  if (v4)
  {
    [(SSSDittoRootViewController *)self _dismissAnimated:0];
  }
}

- (void)containerViewController:(id)a3 willShowTestFlightUIWithBlock:(id)a4
{
  dismissTimer = self->_dismissTimer;
  id v6 = a4;
  [(SSSDittoDismissTimer *)dismissTimer setShowingSharingUI:1];
  id v7 = [(SSSDittoRootViewController *)self delegate];
  [v7 dittoRootViewController:self willShowTestFlightUIWithBlock:v6];
}

- (void)containerViewController:(id)a3 willShowSharingUIWithBlock:(id)a4
{
  dismissTimer = self->_dismissTimer;
  id v6 = a4;
  [(SSSDittoDismissTimer *)dismissTimer setShowingSharingUI:1];
  id v7 = [(SSSDittoRootViewController *)self delegate];
  [v7 dittoRootViewController:self willShowShowSharingUIWithBlock:v6];
}

- (void)containerViewControllerEndedShowingSharingUI:(id)a3 inStateTransition:(BOOL)a4
{
  BOOL v4 = a4;
  [(SSSDittoDismissTimer *)self->_dismissTimer setShowingSharingUI:0];
  id v6 = [(SSSDittoRootViewController *)self delegate];
  [v6 dittoRootViewControllerFinishedShowingSharingUI:self inStateTransition:v4];
}

- (void)containerViewControllerBeganShowingWaitingForImageIdentifierUpdatesUI:(id)a3
{
}

- (void)containerViewControllerEndedShowingWaitingForImageIdentifierUpdatesUI:(id)a3
{
}

- (void)_postNotificationName:(id)a3
{
  id v3 = a3;
  id v4 = +[NSDistributedNotificationCenter defaultCenter];
  [v4 postNotificationName:v3 object:0];
}

- (void)_postNotificationForWillChangeToState:(unint64_t)a3
{
  if (a3)
  {
    if (a3 != 1) {
      return;
    }
    id v3 = &SSScreenshotsDisplayModeWillChangeToFullscreenNotificationName;
  }
  else
  {
    id v3 = &SSScreenshotsDisplayModeWillChangeToPictureInPictureNotificationName;
  }
  [(SSSDittoRootViewController *)self _postNotificationName:*v3];
}

- (void)_postNotificationForDidChangeToState:(unint64_t)a3
{
  if (a3)
  {
    if (a3 != 1) {
      return;
    }
    id v3 = &SSScreenshotsDisplayModeDidChangeToFullscreenNotificationName;
  }
  else
  {
    id v3 = &SSScreenshotsDisplayModeDidChangeToPictureInPictureNotificationName;
  }
  [(SSSDittoRootViewController *)self _postNotificationName:*v3];
}

- (void)_updateForCurrentSize
{
  id v5 = [(SSSDittoRootViewController *)self view];
  [v5 bounds];
  -[SSSDittoRootViewController _updateForSize:](self, "_updateForSize:", v3, v4);
}

- (void)_updateForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double y = CGRectZero.origin.y;
  id v6 = [(SSSContainerViewController *)self->_containerViewController view];
  [v6 setFrame:CGRectZero.origin.x, y, width, height];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)SSSDittoRootViewController;
  id v7 = a4;
  -[SSSDittoRootViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001D69C;
  v8[3] = &unk_10009A018;
  v8[4] = self;
  *(double *)&v8[5] = width;
  *(double *)&v8[6] = height;
  [v7 animateAlongsideTransition:v8 completion:0];
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(SSSDittoRootViewController *)self parentViewController];
  id v3 = [v2 supportedInterfaceOrientations];

  return (unint64_t)v3;
}

- (void)pipify
{
}

- (void)pipifyWithCompletion:(id)a3
{
  double v4 = (void (**)(void))a3;
  containerViewController = self->_containerViewController;
  if (!containerViewController)
  {
    id v6 = [(SSSDittoRootViewController *)self hostingViewController];
    [v6 stopBeingParentOfDittoRootViewController:self];
    [v6 cleanupRootViewController];
    id v7 = os_log_create("com.apple.screenshotservices", "ViewControllerManager");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_10005F4B4(v7);
    }

    containerViewController = self->_containerViewController;
  }
  if (self->_containerViewControllerTargetState
    && (unint64_t v8 = [(SSSContainerViewController *)containerViewController state],
        containerViewController = self->_containerViewController,
        v8))
  {
    [(SSSContainerViewController *)containerViewController commitInflightEditsIfNecessary];
    [(SSSContainerViewController *)self->_containerViewController setState:0 animated:1 completion:v4];
  }
  else
  {
    [(SSSContainerViewController *)containerViewController removeDescendantViewControllers];
    if (v4) {
      v4[2](v4);
    }
  }
}

- (void)fullscreenify
{
}

- (void)fullscreenifyWithCompletion:(id)a3
{
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)SSSDittoRootViewController;
  [(SSSDittoRootViewController *)&v5 viewDidLoad];
  id v3 = [(SSSDittoRootViewController *)self view];
  double v4 = +[UIColor whiteColor];
  [v3 setTintColor:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SSSDittoRootViewController;
  [(SSSDittoRootViewController *)&v4 viewDidAppear:a3];
  [(SSSDittoRootViewController *)self _createAndParentContainerViewControllerIfPossible];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SSSDittoRootViewController;
  -[SSSDittoRootViewController viewDidDisappear:](&v5, "viewDidDisappear:");
  [(SSSContainerViewController *)self->_containerViewController viewDidDisappear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SSSDittoRootViewController;
  [(SSSDittoRootViewController *)&v4 viewWillDisappear:a3];
  [(SSSDittoRootViewController *)self resignFirstResponder];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dittoDismissTimerFired:(id)a3
{
  objc_super v4 = +[SSSStatisticsManager sharedStatisticsManager];
  [v4 pipSlidOffscreenDueToTimeout];

  [(SSSDittoRootViewController *)self _dismissAnimated:1];
}

- (void)containerViewController:(id)a3 willBeginDismissAnimationWithSettings:(id)a4
{
  unint64_t v8 = (SSSContainerViewController *)a3;
  id v6 = a4;
  if (self->_containerViewController == v8)
  {
    self->_containerViewController = 0;
  }
  [(SSSDittoDismissTimer *)self->_dismissTimer setPerformingDismissAnimation:1];
  id v7 = [(SSSDittoRootViewController *)self delegate];
  [v6 duration];
  [v7 dittoRootViewController:self wantsBackground:0];
}

- (void)containerViewControllerDidEndDismissAnimation:(id)a3
{
  unint64_t v8 = (SSSContainerViewController *)a3;
  [(SSSDittoDismissTimer *)self->_dismissTimer setPerformingDismissAnimation:0];
  [(SSSContainerViewController *)v8 willMoveToParentViewController:0];
  objc_super v4 = [(SSSContainerViewController *)v8 view];
  [v4 removeFromSuperview];

  [(SSSContainerViewController *)v8 setDelegate:0];
  [(SSSContainerViewController *)v8 removeFromParentViewController];
  if (self->_containerViewController == v8)
  {
    self->_containerViewController = 0;

    [(SSSDittoDismissTimer *)self->_dismissTimer setUserInterfaceHidden:1];
  }
  objc_super v5 = [(SSSDittoRootViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(SSSDittoRootViewController *)self delegate];
    [v7 dittoRootViewControllerDidDismiss:self];
  }
}

- (void)_dismissAnimated:(BOOL)a3
{
}

- (void)_dismissAnimated:(BOOL)a3 completion:(id)a4
{
}

- (void)performProgrammaticDismiss
{
}

- (void)performProgrammaticDismissWithCompletion:(id)a3
{
}

- (unint64_t)state
{
  return [(SSSContainerViewController *)self->_containerViewController state];
}

- (BOOL)shouldAnimateDragCancel
{
  return self->_isInDragAndDrop;
}

- (SSSDittoRootViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SSSDittoRootViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SSSDittoViewController)hostingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostingViewController);

  return (SSSDittoViewController *)WeakRetained;
}

- (void)setHostingViewController:(id)a3
{
}

- (SSSViewControllerManager)viewControllerManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerManager);

  return (SSSViewControllerManager *)WeakRetained;
}

- (void)setViewControllerManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewControllerManager);
  objc_destroyWeak((id *)&self->_hostingViewController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dismissTimer, 0);

  objc_storeStrong((id *)&self->_containerViewController, 0);
}

@end