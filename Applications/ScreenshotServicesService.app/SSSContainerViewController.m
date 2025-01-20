@interface SSSContainerViewController
+ (BOOL)_shouldConfigureDragInteraction;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isTriggeredByInteractiveScreenshotGesture:(id)a3;
- (BOOL)_pileTranslationIsTowardsEdge;
- (BOOL)_shouldAllowSharing;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)screenshotsViewControllerShouldAllowSharing:(id)a3;
- (CGAffineTransform)_transformForState:(SEL)a3;
- (CGAffineTransform)_transformForState:(SEL)a3 pileTranslation:(unint64_t)a4;
- (CGVector)_translationAmountForState:(unint64_t)a3 pileTranslation:(CGPoint)a4;
- (NSDirectionalEdgeInsets)_miniatureInsets;
- (NSUserActivity)siriActionActivity;
- (SSSContainerViewController)init;
- (SSSContainerViewControllerDelegate)delegate;
- (double)_amountToMoveScreenshotsViewForHorizontalSlideOffDismiss;
- (double)_amountToMoveScreenshotsViewWithFrameForHorizontalSlideOffDismiss:(CGRect)a3;
- (double)_durationForHorizontalSlideOffDismiss;
- (double)_durationForMinimize;
- (double)_pileTranslationAmountForDismiss;
- (double)_scaleAmountForState:(unint64_t)a3;
- (id)_gesturesForMiniatureState;
- (id)_screenshotForDragItem:(id)a3;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (int)_preferredStatusBarVisibility;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)_animationOptions;
- (unint64_t)numberOfScreenshots;
- (unint64_t)state;
- (unint64_t)supportedInterfaceOrientations;
- (void)_dismissScreenshotsWithSlide;
- (void)_dismissScreenshotsWithVelocity:(double)a3;
- (void)_donateScreenshotUserActivityForSiri:(id)a3;
- (void)_handlePileLongPress:(id)a3;
- (void)_handlePilePanGesture:(id)a3;
- (void)_moveScreenshotsViewForHorizontalSlideOffDismiss;
- (void)_notifyScreenshotForBiome;
- (void)_performPostDismissActions;
- (void)_performPreDismissActionsForAnimationSettings:(id)a3;
- (void)_pilePencilTapped;
- (void)_pileTapped;
- (void)_positionAppearingScreenshot:(id)a3;
- (void)_prepareDragInteractionIfNecessary;
- (void)_prepareGesturesForState:(unint64_t)a3;
- (void)_prepareImageIdentifierUpdateAlertIfNecessary;
- (void)_presentImageIdentifierUpdateAlertIfNecessary;
- (void)_screenshotGestureTriggered:(id)a3;
- (void)_startDragging;
- (void)_stopBeingInterestedInScreenshots:(id)a3;
- (void)_stopDraggingDismissing:(BOOL)a3;
- (void)_transitionToStateIfNecessaryFromEnvironmentDescription:(id)a3 completion:(id)a4;
- (void)_updateDisplayedProgressTowardsReceivingAllImageIdentifierUpdates;
- (void)_updateDragInteraction;
- (void)_updateForCurrentSize;
- (void)_updateForSize:(CGSize)a3;
- (void)_updateScreenshotsViewTransform;
- (void)activityViewControllerDismissedFromScreenshotsViewController:(id)a3;
- (void)addScreenshot:(id)a3 completion:(id)a4;
- (void)commitInflightEditsIfNecessary;
- (void)dealloc;
- (void)didMoveToParentViewController:(id)a3;
- (void)dismissRequestedFromScreenshotsViewController:(id)a3 completion:(id)a4;
- (void)dismissScreenshotsAnimated:(BOOL)a3 completion:(id)a4;
- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5;
- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 sessionDidTransferItems:(id)a4;
- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4;
- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5;
- (void)groupImageIdentifierUpdateTrackerChangedProgressTowardsReceivingAllImageIdentifierUpdates:(id)a3;
- (void)groupImageIdentifierUpdateTrackerDidReceiveNewScreenshotIdentifier:(id)a3;
- (void)performInteractiveGesturePresentationCompleteAnimations;
- (void)removeDescendantViewControllers;
- (void)screenshotsViewController:(id)a3 requestsCopyDeleteForScreenshots:(id)a4 deleteOptions:(unint64_t)a5 forReason:(unint64_t)a6;
- (void)screenshotsViewController:(id)a3 requestsDeleteForScreenshots:(id)a4 deleteOptions:(unint64_t)a5 forReason:(unint64_t)a6;
- (void)screenshotsViewController:(id)a3 requestsPresentingActivityViewControllerWithBlock:(id)a4;
- (void)screenshotsViewController:(id)a3 requestsPresentingTestFlightFeedbackControllerWithBlock:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setSiriActionActivity:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setState:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)waitingForImageIdentifierUpdatesAlertControllerDidCancel:(id)a3;
@end

@implementation SSSContainerViewController

- (SSSContainerViewController)init
{
  v17.receiver = self;
  v17.super_class = (Class)SSSContainerViewController;
  v2 = [(SSSContainerViewController *)&v17 initWithNibName:0 bundle:0];
  v2->_state = 0;
  v3 = objc_alloc_init(SSSScreenshotsViewController);
  screenshotsViewController = v2->_screenshotsViewController;
  v2->_screenshotsViewController = v3;

  [(SSSScreenshotsViewController *)v2->_screenshotsViewController setDelegate:v2];
  v5 = objc_alloc_init(SSSScreenshotGroupImageIdentifierUpdateTracker);
  groupImageIdentifierUpdateTracker = v2->_groupImageIdentifierUpdateTracker;
  v2->_groupImageIdentifierUpdateTracker = v5;

  [(SSSScreenshotGroupImageIdentifierUpdateTracker *)v2->_groupImageIdentifierUpdateTracker setDelegate:v2];
  v7 = +[SSSScreenshotManager sharedScreenshotManager];
  [v7 addImageIdentifierUpdateObserver:v2->_groupImageIdentifierUpdateTracker];

  v8 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v2 action:"_pileTapped"];
  pileTapGesture = v2->_pileTapGesture;
  v2->_pileTapGesture = v8;

  [(UITapGestureRecognizer *)v2->_pileTapGesture setAllowedTouchTypes:&off_10009DEF0];
  v10 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v2 action:"_pilePencilTapped"];
  pilePencilTapGesture = v2->_pilePencilTapGesture;
  v2->_pilePencilTapGesture = v10;

  [(UITapGestureRecognizer *)v2->_pilePencilTapGesture setAllowedTouchTypes:&off_10009DF08];
  v12 = (UIPanGestureRecognizer *)[objc_alloc((Class)UIPanGestureRecognizer) initWithTarget:v2 action:"_handlePilePanGesture:"];
  pileFlingGesture = v2->_pileFlingGesture;
  v2->_pileFlingGesture = v12;

  v14 = (UILongPressGestureRecognizer *)[objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:v2 action:"_handlePileLongPress:"];
  pileLongPressGesture = v2->_pileLongPressGesture;
  v2->_pileLongPressGesture = v14;

  [(UILongPressGestureRecognizer *)v2->_pileLongPressGesture setDelegate:v2];
  return v2;
}

- (void)dealloc
{
  v3 = +[SSSScreenshotManager sharedScreenshotManager];
  [v3 removeImageIdentifierUpdateObserver:self->_groupImageIdentifierUpdateTracker];

  v4.receiver = self;
  v4.super_class = (Class)SSSContainerViewController;
  [(SSSContainerViewController *)&v4 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_screenshotGestureTriggered:(id)a3
{
  objc_super v4 = [a3 environmentDescription];
  id v5 = [v4 presentationMode];

  v6 = [(SSSScreenshotsViewController *)self->_screenshotsViewController visibleScreenshots];
  id v7 = [v6 count];

  v8 = +[SSSStatisticsManager sharedStatisticsManager];
  id v9 = v8;
  if (v7) {
    [v8 screenshotGestureTriggeredWhileAnotherScreenshotWasShowing:v5];
  }
  else {
    [v8 screenshotGestureTriggered:v5];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SSSContainerViewController;
  [(SSSContainerViewController *)&v4 viewDidDisappear:a3];
  [(SSSScreenshotsViewController *)self->_screenshotsViewController removeChildViewControllers];
}

- (void)_transitionToStateIfNecessaryFromEnvironmentDescription:(id)a3 completion:(id)a4
{
  id v17 = a3;
  v6 = (void (**)(void))a4;
  uint64_t v7 = sub_10002CA2C((uint64_t)[v17 presentationMode]);
  v8 = [(SSSScreenshotsViewController *)self->_screenshotsViewController visibleScreenshots];
  id v9 = [v8 count];

  id v10 = [v17 presentationMode];
  id v11 = v10;
  unint64_t state = self->_state;
  if (state)
  {
    if (v9) {
      BOOL v13 = v10 == (id)2;
    }
    else {
      BOOL v13 = 1;
    }
    LOBYTE(v14) = !v13;
  }
  else
  {
    id v15 = [v17 presentationMode];
    if (v9) {
      BOOL v16 = v11 == (id)2;
    }
    else {
      BOOL v16 = 1;
    }
    uint64_t v14 = !v16;
    if (v15 == (id)1)
    {
      [(SSSScreenshotsViewController *)self->_screenshotsViewController setInitialAnnotationMode:v11 == (id)2];
LABEL_20:
      [(SSSContainerViewController *)self setState:v7 animated:v14 completion:v6];
      goto LABEL_23;
    }
    unint64_t state = self->_state;
  }
  [(SSSScreenshotsViewController *)self->_screenshotsViewController setInitialAnnotationMode:v11 == (id)2];
  if (state != v7 && (v14 & 1) == 0)
  {
    uint64_t v14 = 0;
    goto LABEL_20;
  }
  if (v6) {
    v6[2](v6);
  }
LABEL_23:
}

- (void)_positionAppearingScreenshot:(id)a3
{
  id v4 = a3;
  id v5 = +[SSSSignificantEventController sharedSignificantEventController];
  [v5 screenshotAppearAnimationBeganForScreenshot:v4];

  v6 = [(SSSScreenshotsViewController *)self->_screenshotsViewController view];
  [v6 layoutIfNeeded];

  uint64_t v7 = [(SSSContainerViewController *)self view];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  BOOL v16 = [(SSSScreenshotsViewController *)self->_screenshotsViewController screenshotsParentCoordinateSpace];
  id v17 = [(SSSContainerViewController *)self view];
  [v16 convertRect:v17 fromCoordinateSpace:v9, v11, v13, v15];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  unsigned int v26 = [(SSSContainerViewController *)self _isTriggeredByInteractiveScreenshotGesture:v4];
  v27 = -[SSSScreenshotView initWithFrame:]([SSSScreenshotView alloc], "initWithFrame:", v19, v21, v23, v25);
  [(SSSScreenshotView *)v27 setScreenshot:v4];
  [(SSSScreenshotView *)v27 setUseTrilinearMinificationFilter:1];
  [(SSSScreenshotView *)v27 setBorderStyle:sub_10004CA5C([(SSSContainerViewController *)self state], 0)];
  [(SSSScreenshotView *)v27 setUsesOriginalImageAspectRatio:sub_10004CA74([(SSSContainerViewController *)self state])];
  if ((id)[(SSSContainerViewController *)self state] == (id)1)
  {
    [(SSSScreenshotView *)v27 prepareForFullscreenExperience];
    [(SSSScreenshotView *)v27 finishPreparingForFullscreenExperience];
  }
  else
  {
    v28 = [(SSSContainerViewController *)self traitCollection];
    [(SSSScreenshotView *)v27 setGeometryMultiplier:1.0 / sub_10000E1FC()];
  }
  [(SSSScreenshotView *)v27 layoutIfNeeded];
  [(SSSScreenshotView *)v27 setState:[(SSSContainerViewController *)self state]];
  [(SSSScreenshotsViewController *)self->_screenshotsViewController parentScreenshotView:v27 animated:v26 ^ 1];
  unsigned int v29 = [(SSSScreenshotView *)v27 shouldFlash];
  if (v29) {
    [(SSSScreenshotView *)v27 flash];
  }
  if (v26)
  {
    [(SSSScreenshotView *)v27 layoutIfNeeded];
    v30 = [(SSSScreenshotsViewController *)self->_screenshotsViewController view];
    [v30 layoutIfNeeded];

    [(SSSScreenshotsViewController *)self->_screenshotsViewController setContentSwitcherAlpha:0.0];
    v31 = +[SSSSignificantEventController sharedSignificantEventController];
    [v31 screenshotAppearAnimationEndedForScreenshot:v4 userInterface:self];

    [(SSSContainerViewController *)self _prepareDragInteractionIfNecessary];
  }
  else
  {
    v32 = +[SSSSpringAnimationParameters scaleAnimationParameters];
    v33 = v32;
    double v34 = 0.0;
    if (v29) {
      double v34 = 0.25;
    }
    [v32 setDelay:v34];
    [v33 setAnimationReason:1];
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100020B00;
    v39[3] = &unk_10009A068;
    v39[4] = self;
    uint64_t v41 = 0x3FF0000000000000;
    v40 = v27;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100020B74;
    v35[3] = &unk_10009A090;
    id v36 = v4;
    v37 = self;
    v38 = v40;
    +[UIView sss_animateWithAnimationParameters:v33 animations:v39 completion:v35];
  }
}

- (BOOL)_isTriggeredByInteractiveScreenshotGesture:(id)a3
{
  v3 = [a3 environmentDescription];
  BOOL v4 = [v3 presentationMode] == (id)2;

  return v4;
}

- (void)addScreenshot:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(SSSContainerViewController *)self _screenshotGestureTriggered:v6];
  double v8 = +[SSSScreenshotManager sharedScreenshotManager];
  [v8 userInterfaceBecameInterestedInScreenshot:v6];

  [(SSSScreenshotGroupImageIdentifierUpdateTracker *)self->_groupImageIdentifierUpdateTracker addScreenshotToGroup:v6];
  double v9 = [v6 environmentDescription];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100020D5C;
  v12[3] = &unk_10009A0B8;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(SSSContainerViewController *)self _transitionToStateIfNecessaryFromEnvironmentDescription:v9 completion:v12];
}

- (void)performInteractiveGesturePresentationCompleteAnimations
{
  v3 = +[SSSSpringAnimationParameters scaleAnimationParameters];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100020E54;
  v4[3] = &unk_100099A20;
  v4[4] = self;
  +[UIView sss_animateWithAnimationParameters:v3 animations:v4 completion:0];
}

- (void)_prepareImageIdentifierUpdateAlertIfNecessary
{
  v3 = +[SSSWaitingForImageIdentifierUpdatesAlertController newWaitingForImageIdentifierUpdatesAlertController];
  imageIdentifierUpdateAlert = self->_imageIdentifierUpdateAlert;
  self->_imageIdentifierUpdateAlert = v3;

  [(SSSWaitingForImageIdentifierUpdatesAlertController *)self->_imageIdentifierUpdateAlert setDelegate:self];

  [(SSSContainerViewController *)self _updateDisplayedProgressTowardsReceivingAllImageIdentifierUpdates];
}

- (void)waitingForImageIdentifierUpdatesAlertControllerDidCancel:(id)a3
{
  [(SSSScreenshotsViewController *)self->_screenshotsViewController dismissActivityViewController];
  imageIdentifierUpdateAlert = self->_imageIdentifierUpdateAlert;
  self->_imageIdentifierUpdateAlert = 0;

  id v5 = [(SSSContainerViewController *)self delegate];
  [v5 containerViewControllerEndedShowingWaitingForImageIdentifierUpdatesUI:self];
}

- (void)_presentImageIdentifierUpdateAlertIfNecessary
{
  [(SSSContainerViewController *)self presentViewController:self->_imageIdentifierUpdateAlert animated:1 completion:0];
  id v3 = [(SSSContainerViewController *)self delegate];
  [v3 containerViewControllerBeganShowingWaitingForImageIdentifierUpdatesUI:self];
}

- (void)_updateDisplayedProgressTowardsReceivingAllImageIdentifierUpdates
{
  [(SSSScreenshotGroupImageIdentifierUpdateTracker *)self->_groupImageIdentifierUpdateTracker progressTowardsReceivingAllImageIdentifierUpdates];
  imageIdentifierUpdateAlert = self->_imageIdentifierUpdateAlert;

  -[SSSWaitingForImageIdentifierUpdatesAlertController setProgress:](imageIdentifierUpdateAlert, "setProgress:");
}

- (void)groupImageIdentifierUpdateTrackerChangedProgressTowardsReceivingAllImageIdentifierUpdates:(id)a3
{
  id v4 = a3;
  [v4 progressTowardsReceivingAllImageIdentifierUpdates];
  double v6 = v5;
  id v7 = [(SSSWaitingForImageIdentifierUpdatesAlertController *)self->_imageIdentifierUpdateAlert presentingViewController];

  if (v7)
  {
    [(SSSContainerViewController *)self _updateDisplayedProgressTowardsReceivingAllImageIdentifierUpdates];
    if (v6 == 1.0)
    {
      imageIdentifierUpdateAlert = self->_imageIdentifierUpdateAlert;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1000210E8;
      v9[3] = &unk_100099C98;
      v9[4] = self;
      id v10 = v4;
      [(SSSWaitingForImageIdentifierUpdatesAlertController *)imageIdentifierUpdateAlert dismissViewControllerAnimated:1 completion:v9];
    }
  }
}

- (void)groupImageIdentifierUpdateTrackerDidReceiveNewScreenshotIdentifier:(id)a3
{
  [(SSSContainerViewController *)self _donateScreenshotUserActivityForSiri:a3];

  [(SSSContainerViewController *)self _notifyScreenshotForBiome];
}

- (void)_performPreDismissActionsForAnimationSettings:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v5 = [(SSSScreenshotsViewController *)self->_screenshotsViewController visibleScreenshots];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      double v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v9);
        id v11 = +[SSSScreenshotManager sharedScreenshotManager];
        [v11 userInterfaceWillStopBeingInterestedInScreenshot:v10];

        double v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  double v12 = [(SSSContainerViewController *)self delegate];
  [v12 containerViewController:self willBeginDismissAnimationWithSettings:v4];
}

- (void)_performPostDismissActions
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(SSSScreenshotsViewController *)self->_screenshotsViewController visibleScreenshots];
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v7);
        double v9 = +[SSSScreenshotManager sharedScreenshotManager];
        [v9 userInterfaceStoppedBeingInterestedInScreenshot:v8];

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  uint64_t v10 = [(SSSContainerViewController *)self delegate];
  [v10 containerViewControllerDidEndDismissAnimation:self];

  [(SSSScreenshotsViewController *)self->_screenshotsViewController removeChildViewControllers];
}

- (double)_amountToMoveScreenshotsViewWithFrameForHorizontalSlideOffDismiss:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  UIRectGetCenter();
  double v9 = v8;
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v24);
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  double v11 = MaxX - CGRectGetMinX(v25);
  double v23 = 0.0;
  long long v12 = [(SSSContainerViewController *)self traitCollection];
  sub_10000E15C(v12, (uint64_t)&v22);

  [(SSSContainerViewController *)self _miniatureInsets];
  double v14 = v11 + v13 * 2.0 + v23 * 6.0;
  double v15 = v14 + +[SSSShadowView shadowRadius]_0() * 2.0;
  long long v16 = [(SSSContainerViewController *)self view];
  id v17 = [v16 effectiveUserInterfaceLayoutDirection];

  if (v17)
  {
    double v18 = [(SSSContainerViewController *)self view];
    [v18 bounds];
    double v20 = v19 + v15 * 0.5;
  }
  else
  {
    double v20 = v15 * -0.5;
  }
  return v20 - v9;
}

- (double)_amountToMoveScreenshotsViewForHorizontalSlideOffDismiss
{
  id v3 = [(SSSScreenshotsViewController *)self->_screenshotsViewController view];
  [v3 frame];
  -[SSSContainerViewController _amountToMoveScreenshotsViewWithFrameForHorizontalSlideOffDismiss:](self, "_amountToMoveScreenshotsViewWithFrameForHorizontalSlideOffDismiss:");
  double v5 = v4;

  return v5;
}

- (void)_moveScreenshotsViewForHorizontalSlideOffDismiss
{
  id v8 = [(SSSScreenshotsViewController *)self->_screenshotsViewController view];
  [v8 center];
  double v4 = v3;
  double v6 = v5;
  [(SSSContainerViewController *)self _amountToMoveScreenshotsViewForHorizontalSlideOffDismiss];
  [v8 setCenter:v4 + v7, v6];
}

- (double)_durationForMinimize
{
  v2 = +[SSSSpringAnimationParameters scaleAnimationParameters];
  [v2 duration];
  double v4 = v3;

  return v4;
}

- (double)_durationForHorizontalSlideOffDismiss
{
  return 0.39;
}

- (void)dismissScreenshotsAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  unint64_t v7 = [(SSSContainerViewController *)self state];
  [(SSSContainerViewController *)self _durationForHorizontalSlideOffDismiss];
  uint64_t v9 = v8;
  if (v7) {
    [(SSSContainerViewController *)self _durationForMinimize];
  }
  else {
    uint64_t v10 = 0;
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100021898;
  v21[3] = &unk_10009A108;
  v21[4] = self;
  uint64_t v23 = v9;
  uint64_t v24 = v10;
  id v11 = v6;
  id v22 = v11;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100021B40;
  v17[3] = &unk_10009A130;
  BOOL v19 = v4;
  v17[4] = self;
  BOOL v20 = v7 == 0;
  long long v12 = objc_retainBlock(v21);
  id v18 = v12;
  double v13 = objc_retainBlock(v17);
  double v14 = v13;
  if (v4)
  {
    ((void (*)(void *))v13[2])(v13);
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100021BEC;
    v15[3] = &unk_10009A158;
    long long v16 = v13;
    +[UIView performWithoutAnimation:v15];
  }
}

- (void)_dismissScreenshotsWithVelocity:(double)a3
{
  [(SSSContainerViewController *)self _amountToMoveScreenshotsViewForHorizontalSlideOffDismiss];
  double v6 = v5;
  double v7 = a3 / fabs(v5);
  [(SSSContainerViewController *)self _scaleAmountForState:0];
  memset(&v34, 0, sizeof(v34));
  CGAffineTransformMakeScale(&v34, v8, v8);
  CGFloat y = CGRectZero.origin.y;
  uint64_t v10 = [(SSSScreenshotsViewController *)self->_screenshotsViewController view];
  [v10 bounds];
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  CGAffineTransform v33 = v34;
  v35.origin.CGFloat x = CGRectZero.origin.x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = v12;
  v35.size.CGFloat height = v14;
  CGRectApplyAffineTransform(v35, &v33);
  double v15 = [(SSSContainerViewController *)self view];
  [v15 bounds];
  UIRectCenteredIntegralRect();
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  -[SSSContainerViewController _translationAmountForState:pileTranslation:](self, "_translationAmountForState:pileTranslation:", 0, CGPointZero.x, CGPointZero.y);
  -[SSSContainerViewController _amountToMoveScreenshotsViewWithFrameForHorizontalSlideOffDismiss:](self, "_amountToMoveScreenshotsViewWithFrameForHorizontalSlideOffDismiss:", v17 + v24, v19 + v25, v21, v23);
  double v27 = fabs(v6 / v26);
  [(SSSContainerViewController *)self _durationForHorizontalSlideOffDismiss];
  double v29 = v28 * v27;
  id v30 = objc_alloc_init((Class)BSMutableSpringAnimationSettings);
  [v30 setInitialVelocity:v7];
  [v30 setDamping:1.0];
  [(SSSContainerViewController *)self _performPreDismissActionsForAnimationSettings:v30];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100021E5C;
  v32[3] = &unk_100099A20;
  v32[4] = self;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100021E64;
  v31[3] = &unk_100099AB0;
  v31[4] = self;
  +[UIView animateWithDuration:6 delay:v32 usingSpringWithDamping:v31 initialSpringVelocity:v29 options:0.0 animations:1.0 completion:v7];
}

- (void)_dismissScreenshotsWithSlide
{
  double v3 = +[BSSpringAnimationSettings settingsWithMass:2.0 stiffness:300.0 damping:400.0];
  [(SSSContainerViewController *)self _performPreDismissActionsForAnimationSettings:v3];

  id v4 = [objc_alloc((Class)UISpringTimingParameters) initWithMass:2.0 stiffness:300.0 damping:400.0 initialVelocity:0.0];
  id v5 = [objc_alloc((Class)UIViewPropertyAnimator) initWithDuration:v4 timingParameters:0.91];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100021FD8;
  v7[3] = &unk_100099A20;
  v7[4] = self;
  [v5 addAnimations:v7];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100022048;
  v6[3] = &unk_10009A180;
  v6[4] = self;
  [v5 addCompletion:v6];
  [v5 startAnimation];
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)SSSContainerViewController;
  [(SSSContainerViewController *)&v17 viewDidLoad];
  [(SSSContainerViewController *)self addChildViewController:self->_screenshotsViewController];
  [(SSSScreenshotsViewController *)self->_screenshotsViewController didMoveToParentViewController:self];
  double v3 = [(SSSContainerViewController *)self view];
  id v4 = [(SSSScreenshotsViewController *)self->_screenshotsViewController view];
  [v3 addSubview:v4];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100022234;
  v16[3] = &unk_100099A20;
  v16[4] = self;
  +[UIView performWithoutAnimation:v16];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(SSSContainerViewController *)self _gesturesForMiniatureState];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v9);
        double v11 = [(SSSContainerViewController *)self view];
        [v11 addGestureRecognizer:v10];

        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v7);
  }

  [(SSSContainerViewController *)self setNeedsStatusBarAppearanceUpdate];
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)SSSContainerViewController;
  [(SSSContainerViewController *)&v10 viewDidLayoutSubviews];
  double v3 = [(SSSContainerViewController *)self view];
  [v3 bounds];
  BOOL v4 = CGRectEqualToRect(v11, self->_cachedViewBounds);

  if (!v4)
  {
    [(SSSContainerViewController *)self _updateForCurrentSize];
    id v5 = [(SSSContainerViewController *)self view];
    [v5 bounds];
    self->_cachedViewBounds.origin.CGFloat x = v6;
    self->_cachedViewBounds.origin.CGFloat y = v7;
    self->_cachedViewBounds.size.CGFloat width = v8;
    self->_cachedViewBounds.size.CGFloat height = v9;

    [(SSSContainerViewController *)self setNeedsStatusBarAppearanceUpdate];
  }
}

- (unint64_t)_animationOptions
{
  return 6;
}

- (void)setState:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  unint64_t state = self->_state;
  if (state != a3)
  {
    self->_lastState = state;
    self->_unint64_t state = a3;
  }
  objc_super v10 = [(SSSContainerViewController *)self delegate];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002244C;
  v12[3] = &unk_10009A220;
  id v13 = v8;
  unint64_t v14 = a3;
  BOOL v15 = v5;
  v12[4] = self;
  id v11 = v8;
  [v10 containerViewController:self willTransitionToState:a3 animated:v5 changeBlock:v12];
}

- (void)commitInflightEditsIfNecessary
{
}

- (void)setState:(unint64_t)a3
{
}

- (void)_pileTapped
{
}

- (void)_pilePencilTapped
{
  [(SSSScreenshotsViewController *)self->_screenshotsViewController setInitialAnnotationMode:1];

  [(SSSContainerViewController *)self setState:1];
}

- (BOOL)_pileTranslationIsTowardsEdge
{
  double v3 = [(SSSContainerViewController *)self view];
  id v4 = [v3 effectiveUserInterfaceLayoutDirection];

  double x = self->_pileTranslation.x;
  if (v4) {
    return x > 0.0;
  }
  else {
    return x < 0.0;
  }
}

- (void)removeDescendantViewControllers
{
}

- (double)_pileTranslationAmountForDismiss
{
  [(SSSScreenshotsViewController *)self->_screenshotsViewController screenshotsExtentRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(SSSContainerViewController *)self view];
  long long v12 = [(SSSScreenshotsViewController *)self->_screenshotsViewController view];
  [v11 convertRect:v12 fromView:v4];
  double v14 = v13;

  return v14 * 0.25;
}

- (void)_handlePilePanGesture:(id)a3
{
  id v4 = a3;
  double v5 = [(SSSContainerViewController *)self view];
  [v4 translationInView:v5];
  double v7 = v6;
  double v9 = v8;

  double v10 = [(SSSContainerViewController *)self view];
  [v4 velocityInView:v10];
  double v12 = v11;

  if ([v4 state] == (id)2)
  {
    self->_pileTranslation.double x = v7;
    self->_pileTranslation.CGFloat y = v9 * 0.05;
    if (![(SSSContainerViewController *)self _pileTranslationIsTowardsEdge]) {
      self->_pileTranslation.double x = v7 * 0.1;
    }
    goto LABEL_10;
  }
  if ([v4 state] != (id)3 && objc_msgSend(v4, "state") != (id)4 && objc_msgSend(v4, "state") != (id)5)
  {
LABEL_10:
    [(SSSContainerViewController *)self _updateForCurrentSize];
    goto LABEL_11;
  }
  p_pileTranslation = &self->_pileTranslation;
  if ([(SSSContainerViewController *)self _pileTranslationIsTowardsEdge]
    && (double v14 = fabs(p_pileTranslation->x),
        [(SSSContainerViewController *)self _pileTranslationAmountForDismiss],
        v14 > v15))
  {
    [(SSSContainerViewController *)self _dismissScreenshotsWithVelocity:fabs(v12)];
  }
  else
  {
    CGPoint *p_pileTranslation = CGPointZero;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100022D88;
    v17[3] = &unk_100099A20;
    v17[4] = self;
    +[UIView _animateUsingDefaultTimingWithOptions:2054 animations:v17 completion:0];
  }
LABEL_11:
  double v16 = [(SSSContainerViewController *)self delegate];
  [v16 containerViewControllerHadGestureInteraction:self];
}

- (BOOL)_shouldAllowSharing
{
  v2 = [(SSSScreenshotsViewController *)self->_screenshotsViewController currentScreenshot];
  double v3 = [v2 environmentDescription];
  unsigned __int8 v4 = [v3 hasOnenessScreen];

  if (v4) {
    return 0;
  }
  double v6 = _SSSignpostLog();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Z_MKBGetDeviceLockState", (const char *)&unk_100093E93, buf, 2u);
  }

  double v7 = os_log_create("com.apple.screenshotservices", "Performance");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "BEGIN \"Z_MKBGetDeviceLockState\"", v16, 2u);
  }

  int v8 = MKBGetDeviceLockState();
  double v9 = +[FMDFMIPManager sharedInstance];
  unsigned __int8 v10 = [v9 isLostModeActive];

  double v11 = _SSSignpostLog();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)double v15 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Z_MKBGetDeviceLockState", (const char *)&unk_100093E93, v15, 2u);
  }
  unsigned int v12 = v8 - 3;

  double v13 = os_log_create("com.apple.screenshotservices", "Performance");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "END \"Z_MKBGetDeviceLockState\"", v14, 2u);
  }

  if (v12 < 0xFFFFFFFE) {
    return v10 ^ 1;
  }
  else {
    return 0;
  }
}

- (void)_prepareGesturesForState:(unint64_t)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v5 = [(SSSContainerViewController *)self _gesturesForMiniatureState];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      double v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) setEnabled:a3 == 0];
        double v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(SSSContainerViewController *)self _updateDragInteraction];
}

- (id)_gesturesForMiniatureState
{
  pilePencilTapGesture = self->_pilePencilTapGesture;
  v6[0] = self->_pileTapGesture;
  v6[1] = pilePencilTapGesture;
  pileLongPressGesture = self->_pileLongPressGesture;
  v6[2] = self->_pileFlingGesture;
  v6[3] = pileLongPressGesture;
  unsigned __int8 v4 = +[NSArray arrayWithObjects:v6 count:4];

  return v4;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if (self->_pileLongPressGesture == a3) {
    return [(SSSContainerViewController *)self _shouldAllowSharing];
  }
  else {
    return 1;
  }
}

- (void)_handlePileLongPress:(id)a3
{
  if ([a3 state] == (id)1)
  {
    unsigned __int8 v4 = [(SSSContainerViewController *)self delegate];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000231F4;
    v5[3] = &unk_100099A20;
    v5[4] = self;
    [v4 containerViewController:self willShowSharingUIWithBlock:v5];
  }
}

- (void)dismissRequestedFromScreenshotsViewController:(id)a3 completion:(id)a4
{
}

- (void)screenshotsViewController:(id)a3 requestsCopyDeleteForScreenshots:(id)a4 deleteOptions:(unint64_t)a5 forReason:(unint64_t)a6
{
  id v19 = a3;
  id v7 = a4;
  queue = dispatch_queue_create("com.apple.screenshotservices.screenshotItemProviderProcessingQueue", 0);
  uint64_t v8 = dispatch_group_create();
  double v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v35;
    do
    {
      double v14 = 0;
      do
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v34 + 1) + 8 * (void)v14);
        dispatch_group_enter(v8);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000234A0;
        block[3] = &unk_10009A248;
        block[4] = v15;
        id v32 = v9;
        CGAffineTransform v33 = v8;
        dispatch_async(queue, block);

        double v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v12);
  }

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100023590;
  v24[3] = &unk_10009A270;
  id v25 = v9;
  double v26 = self;
  id v27 = v19;
  id v28 = v10;
  unint64_t v29 = a5;
  unint64_t v30 = a6;
  id v16 = v10;
  id v17 = v19;
  id v18 = v9;
  dispatch_group_notify(v8, (dispatch_queue_t)&_dispatch_main_q, v24);
}

- (void)screenshotsViewController:(id)a3 requestsDeleteForScreenshots:(id)a4 deleteOptions:(unint64_t)a5 forReason:(unint64_t)a6
{
  id v9 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v13);
        uint64_t v15 = +[SSSScreenshotManager sharedScreenshotManager];
        [v15 removeScreenshot:v14 deleteOptions:a5];

        uint64_t v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100023804;
  v22[3] = &unk_100099AE0;
  v22[4] = self;
  v22[5] = a6;
  id v16 = objc_retainBlock(v22);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100023884;
  v19[3] = &unk_10009A068;
  id v20 = v9;
  unint64_t v21 = a6;
  v19[4] = self;
  id v17 = v9;
  id v18 = objc_retainBlock(v19);
  [(SSSScreenshotsViewController *)self->_screenshotsViewController removeScreenshots:v17 forReason:a6 alongsideAnimations:v16 completion:v18];
}

- (void)_stopBeingInterestedInScreenshots:(id)a3
{
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * (void)v7);
        id v9 = +[SSSScreenshotManager sharedScreenshotManager];
        [v9 userInterfaceStoppedBeingInterestedInScreenshot:v8];

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)screenshotsViewController:(id)a3 requestsPresentingActivityViewControllerWithBlock:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(SSSContainerViewController *)self delegate];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100023B58;
  v8[3] = &unk_100099A60;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 containerViewController:self willShowSharingUIWithBlock:v8];
}

- (void)screenshotsViewController:(id)a3 requestsPresentingTestFlightFeedbackControllerWithBlock:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(SSSContainerViewController *)self delegate];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100023D0C;
  v8[3] = &unk_100099A60;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 containerViewController:self willShowTestFlightUIWithBlock:v8];
}

- (void)activityViewControllerDismissedFromScreenshotsViewController:(id)a3
{
  id v4 = [(SSSContainerViewController *)self delegate];
  [v4 containerViewControllerEndedShowingSharingUI:self inStateTransition:[self->_screenshotsViewController inStateTransition]];
}

- (BOOL)screenshotsViewControllerShouldAllowSharing:(id)a3
{
  return [(SSSContainerViewController *)self _shouldAllowSharing];
}

- (NSDirectionalEdgeInsets)_miniatureInsets
{
  id v3 = [(SSSContainerViewController *)self traitCollection];
  [v3 displayCornerRadius];
  double v5 = v4;

  if (v5 == 0.0 || v5 == _UITraitCollectionDisplayCornerRadiusUnspecified)
  {
    double v8 = NSDirectionalEdgeInsetsZero.leading + 10.0;
    double v7 = NSDirectionalEdgeInsetsZero.bottom + 10.0;
  }
  else
  {
    double v7 = (sqrt(v5 * v5 + v5 * v5) - v5) * 1.42379596;
    double v8 = v7;
  }
  CGFloat trailing = NSDirectionalEdgeInsetsZero.trailing;
  long long v10 = +[UIScreen mainScreen];
  [v10 _peripheryInsets];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  if (v14 != UIEdgeInsetsZero.left
    || v12 != UIEdgeInsetsZero.top
    || v18 != UIEdgeInsetsZero.right
    || v16 != UIEdgeInsetsZero.bottom)
  {
    if ((id v22 = [(SSSContainerViewController *)self interfaceOrientation],
          [(SSSContainerViewController *)self view],
          long long v23 = objc_claimAutoreleasedReturnValue(),
          id v24 = [v23 effectiveUserInterfaceLayoutDirection],
          v23,
          v22 == (id)3)
      && !v24
      || (v24 == (id)1 ? (BOOL v25 = v22 == (id)4) : (BOOL v25 = 0), v25))
    {
      double v8 = v8 * 2.30434783;
    }
  }
  double top = NSDirectionalEdgeInsetsZero.top;
  double v27 = v8;
  double v28 = v7;
  double v29 = trailing;
  result.CGFloat trailing = v29;
  result.bottom = v28;
  result.leading = v27;
  result.double top = top;
  return result;
}

- (double)_scaleAmountForState:(unint64_t)a3
{
  if (a3) {
    return 1.0;
  }
  double v4 = [(SSSContainerViewController *)self traitCollection];
  double v5 = sub_10000E1FC();

  return v5;
}

- (CGVector)_translationAmountForState:(unint64_t)a3 pileTranslation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = 0.0;
  double v7 = 0.0;
  if (a3 != 1)
  {
    -[SSSContainerViewController _scaleAmountForState:](self, "_scaleAmountForState:", 0.0, 0.0);
    double v10 = v9;
    double v11 = [(SSSContainerViewController *)self view];
    if ([v11 effectiveUserInterfaceLayoutDirection]) {
      double v12 = 1.0;
    }
    else {
      double v12 = -1.0;
    }

    double v13 = [(SSSContainerViewController *)self view];
    [v13 bounds];
    double v15 = v14;
    double v17 = v16;

    [(SSSContainerViewController *)self _miniatureInsets];
    double v6 = x + v12 * (v15 - v15 * v10) * 0.5 - v12 * v18;
    double v7 = y + (v17 - v17 * v10) * 0.5 - v19;
  }
  result.ddouble y = v7;
  result.ddouble x = v6;
  return result;
}

- (CGAffineTransform)_transformForState:(SEL)a3 pileTranslation:(unint64_t)a4
{
  double y = a5.y;
  double x = a5.x;
  long long v8 = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v9;
  long long v10 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&retstr->tdouble x = v10;
  if (!a4)
  {
    double v11 = self;
    *(_OWORD *)&v17.a = v8;
    *(_OWORD *)&v17.c = v9;
    *(_OWORD *)&v17.tdouble x = v10;
    -[CGAffineTransform _scaleAmountForState:](self, "_scaleAmountForState:");
    memset(&v22, 0, sizeof(v22));
    CGAffineTransformMakeScale(&v22, v12, v12);
    CGAffineTransform t1 = v17;
    CGAffineTransform t2 = v22;
    CGAffineTransformConcat(retstr, &t1, &t2);
    -[CGAffineTransform _translationAmountForState:pileTranslation:](v11, "_translationAmountForState:pileTranslation:", 0, x, y);
    memset(&t1, 0, sizeof(t1));
    CGAffineTransformMakeTranslation(&t1, v13, v14);
    long long v15 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v19.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v19.c = v15;
    *(_OWORD *)&v19.tdouble x = *(_OWORD *)&retstr->tx;
    CGAffineTransform v18 = t1;
    self = CGAffineTransformConcat(&t2, &v19, &v18);
    long long v16 = *(_OWORD *)&t2.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&t2.a;
    *(_OWORD *)&retstr->c = v16;
    *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&t2.tx;
  }
  return self;
}

- (CGAffineTransform)_transformForState:(SEL)a3
{
  return -[SSSContainerViewController _transformForState:pileTranslation:](self, "_transformForState:pileTranslation:", a4, self->_pileTranslation.x, self->_pileTranslation.y);
}

- (void)_updateScreenshotsViewTransform
{
  id v3 = [(SSSScreenshotsViewController *)self->_screenshotsViewController view];
  [(SSSContainerViewController *)self _transformForState:[(SSSContainerViewController *)self state]];
  [v3 setTransform:&v5];
  [v3 frame];
  double v4 = [(SSSContainerViewController *)self traitCollection];
  [v4 displayScale];

  SSRoundRectToScale();
  [v3 setFrame:];
}

- (void)_updateForCurrentSize
{
  id v5 = [(SSSContainerViewController *)self view];
  [v5 bounds];
  -[SSSContainerViewController _updateForSize:](self, "_updateForSize:", v3, v4);
}

- (void)_updateForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(SSSScreenshotsViewController *)self->_screenshotsViewController view];
  long long v7 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v8[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v8[1] = v7;
  v8[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v6 setTransform:v8];

  -[SSSScreenshotsViewController updateForFrame:](self->_screenshotsViewController, "updateForFrame:", CGRectZero.origin.x, CGRectZero.origin.y, width, height);
  [(SSSContainerViewController *)self _updateScreenshotsViewTransform];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)SSSContainerViewController;
  id v7 = a4;
  -[SSSContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100024498;
  _OWORD v8[3] = &unk_10009A018;
  v8[4] = self;
  *(double *)&void v8[5] = width;
  *(double *)&v8[6] = height;
  [v7 animateAlongsideTransition:v8 completion:0];
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(SSSContainerViewController *)self parentViewController];
  id v3 = [v2 supportedInterfaceOrientations];

  return (unint64_t)v3;
}

+ (BOOL)_shouldConfigureDragInteraction
{
  if (qword_1000B5788 != -1) {
    dispatch_once(&qword_1000B5788, &stru_10009A290);
  }
  return byte_1000B5780;
}

- (void)_prepareDragInteractionIfNecessary
{
  if (!self->_dragInteraction && [(id)objc_opt_class() _shouldConfigureDragInteraction])
  {
    id v3 = (UIDragInteraction *)[objc_alloc((Class)UIDragInteraction) initWithDelegate:self];
    dragInteraction = self->_dragInteraction;
    self->_dragInteraction = v3;

    [(UIDragInteraction *)self->_dragInteraction _setLiftDelay:0.2];
    [(UIDragInteraction *)self->_dragInteraction _setAllowsPointerDragBeforeLiftDelay:0];
    [(SSSContainerViewController *)self _updateDragInteraction];
  }
}

- (void)_updateDragInteraction
{
  if (self->_dragInteraction)
  {
    id v5 = [(SSSScreenshotsViewController *)self->_screenshotsViewController view];
    unint64_t v3 = [(SSSContainerViewController *)self state];
    dragInteraction = self->_dragInteraction;
    if (v3) {
      [v5 removeInteraction:dragInteraction];
    }
    else {
      [v5 addInteraction:dragInteraction];
    }
  }
}

- (void)_startDragging
{
  id v3 = [(SSSContainerViewController *)self delegate];
  [v3 containerViewControllerBeganDragAndDrop:self];
}

- (void)_stopDraggingDismissing:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SSSContainerViewController *)self delegate];
  [v5 containerViewControllerEndedDragAndDrop:self shouldDismiss:v3];

  [(UILongPressGestureRecognizer *)self->_pileLongPressGesture setEnabled:1];
  id v6 = [(SSSScreenshotsViewController *)self->_screenshotsViewController view];
  [v6 setAlpha:1.0];
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  id v6 = a4;
  [(SSSContainerViewController *)self _startDragging];
  [(SSSScreenshotsViewController *)self->_screenshotsViewController setBorderViewStyleOverride:2 withAnimator:v6];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100024934;
  v7[3] = &unk_10009A180;
  v7[4] = self;
  [v6 addCompletion:v7];
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  id v5 = a4;
  id v6 = [(SSSScreenshotsViewController *)self->_screenshotsViewController view];
  [v6 setAlpha:0.0];

  [(SSSScreenshotsViewController *)self->_screenshotsViewController dismissActivityViewController];
  [(UILongPressGestureRecognizer *)self->_pileLongPressGesture setEnabled:0];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [v5 items];
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      double v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v11);
        CGFloat v13 = +[SSSScreenshotManager sharedScreenshotManager];
        CGFloat v14 = [(SSSContainerViewController *)self _screenshotForDragItem:v12];
        [v13 screenshotEnteredDragSession:v14];

        double v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100024B88;
  v5[3] = &unk_10009A180;
  v5[4] = self;
  [a5 addCompletion:v5];
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  screenshotsViewController = self->_screenshotsViewController;
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [(SSSContainerViewController *)self view];
  double v11 = [(SSSScreenshotsViewController *)screenshotsViewController targetForCancellingDragItem:v9 inContainer:v10];

  uint64_t v12 = [v8 retargetedPreviewWithTarget:v11];

  return v12;
}

- (id)_screenshotForDragItem:(id)a3
{
  BOOL v3 = [a3 localObject];
  double v4 = [v3 screenshot];

  return v4;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  return [(SSSScreenshotsViewController *)self->_screenshotsViewController dragItems];
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  screenshotsViewController = self->_screenshotsViewController;
  id v7 = a4;
  id v8 = [(SSSContainerViewController *)self view];
  id v9 = [(SSSScreenshotsViewController *)screenshotsViewController previewForDragItem:v7 inContainer:v8];

  return v9;
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  id v18 = a3;
  id v8 = a4;
  if (a5)
  {
    id v9 = +[SSSStatisticsManager sharedStatisticsManager];
    [v9 pipDragEndedSuccessfully];
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v10 = [v8 items];
  id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      CGFloat v14 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v14);
        long long v16 = +[SSSScreenshotManager sharedScreenshotManager];
        long long v17 = [(SSSContainerViewController *)self _screenshotForDragItem:v15];
        [v16 screenshotLeftDragSession:v17];

        CGFloat v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  [(SSSContainerViewController *)self _stopDraggingDismissing:a5 != 0];
}

- (void)dragInteraction:(id)a3 sessionDidTransferItems:(id)a4
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [a4 items:a3];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v9);
        id v11 = +[SSSScreenshotManager sharedScreenshotManager];
        id v12 = [(SSSContainerViewController *)self _screenshotForDragItem:v10];
        [v11 screenshotLeftDragSession:v12];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)didMoveToParentViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SSSContainerViewController;
  -[SSSContainerViewController didMoveToParentViewController:](&v5, "didMoveToParentViewController:");
  [(SSSContainerViewController *)self setNeedsStatusBarAppearanceUpdate];
  if (!a3) {
    [(SSSScreenshotsViewController *)self->_screenshotsViewController removeChildViewControllers];
  }
}

- (int)_preferredStatusBarVisibility
{
  BOOL v3 = [(SSSContainerViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  id v6 = [(SSSContainerViewController *)self view];
  [v6 bounds];
  double v8 = v7;

  unint64_t v9 = [(SSSContainerViewController *)self state];
  if (v9)
  {
    uint64_t v10 = [(SSSContainerViewController *)self traitCollection];
    unsigned int v11 = +[SSChromeHelper statusBarVisibilityForTraitCollection:v10 isPortrait:v5 < v8];

    LODWORD(v9) = v11;
  }
  return v9;
}

- (int64_t)preferredStatusBarStyle
{
  return (int64_t)+[SSChromeHelper statusBarStyle];
}

- (unint64_t)numberOfScreenshots
{
  v2 = [(SSSScreenshotsViewController *)self->_screenshotsViewController visibleScreenshots];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (void)_donateScreenshotUserActivityForSiri:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [objc_alloc((Class)NSUserActivity) _initWithUserActivityType:@"com.apple.screenshotservices.sirisharing" dynamicActivityType:0 options:&off_10009DF68];
    [v5 setTitle:@"ScreenshotServices"];
    [v5 setEligibleForSearch:0];
    [v5 setEligibleForPrediction:0];
    [v5 setEligibleForHandoff:0];
    [v5 setEligibleForPublicIndexing:0];
    id v8 = v4;
    CFStringRef v9 = @"selectedUUIDs";
    id v6 = +[NSArray arrayWithObjects:&v8 count:1];
    uint64_t v10 = v6;
    double v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];

    [v5 setUserInfo:v7];
    [(SSSContainerViewController *)self setSiriActionActivity:v5];
    [v5 becomeCurrent];
  }
}

- (void)_notifyScreenshotForBiome
{
  v2 = +[BMStreams discoverabilitySignal];
  id v3 = [v2 source];
  id v4 = objc_alloc((Class)BMDiscoverabilitySignalEvent);
  id v5 = +[NSBundle mainBundle];
  id v6 = [v5 bundleIdentifier];
  v12[0] = v6;
  v12[1] = @"screenshot";
  double v7 = +[NSArray arrayWithObjects:v12 count:2];
  id v8 = [v7 componentsJoinedByString:@"."];
  CFStringRef v9 = +[NSBundle mainBundle];
  uint64_t v10 = [v9 bundleIdentifier];
  id v11 = [v4 initWithIdentifier:v8 bundleID:v10 context:0 userInfo:0];

  [v3 sendEvent:v11];
}

- (SSSContainerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SSSContainerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (NSUserActivity)siriActionActivity
{
  return self->_siriActionActivity;
}

- (void)setSiriActionActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriActionActivity, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_storeStrong((id *)&self->_offscreenAnimator, 0);
  objc_storeStrong((id *)&self->_pileLongPressGesture, 0);
  objc_storeStrong((id *)&self->_pileFlingGesture, 0);
  objc_storeStrong((id *)&self->_pilePencilTapGesture, 0);
  objc_storeStrong((id *)&self->_pileTapGesture, 0);
  objc_storeStrong(&self->_pendingActivityViewControllerPresentationBlock, 0);
  objc_storeStrong((id *)&self->_imageIdentifierUpdateAlert, 0);
  objc_storeStrong((id *)&self->_groupImageIdentifierUpdateTracker, 0);

  objc_storeStrong((id *)&self->_screenshotsViewController, 0);
}

@end