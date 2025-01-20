@interface WFBannerViewController
+ (id)requestIdentifierForContext:(id)a3;
- (BNBannerSource)bannerSource;
- (BNPresentableContext)presentableContext;
- (BOOL)_canShowWhileLocked;
- (BOOL)bannerIsFullScreen;
- (BOOL)homeAffordanceDidCrossThreshold;
- (BOOL)isClippingEnabled;
- (BOOL)isDraggingDismissalEnabled;
- (BOOL)keyboardIsVisible;
- (BOOL)platterShouldOwnHomeGesture:(id)a3;
- (BOOL)providesHostedContent;
- (BOOL)shouldCancelSystemDragGestureWithTouches:(id)a3 event:(id)a4;
- (BOOL)shouldDisplaySash;
- (BOOL)shouldFreezePlatterLayout;
- (BOOL)shouldShowDimmingLayer;
- (BOOL)viewIsAppearingCalled;
- (BOOL)viewWillAppearCalled;
- (BSInvalidatable)systemIdleTimerOverrideAssertion;
- (CGSize)bannerSize;
- (CGSize)platterContentSize;
- (NSString)description;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (SBUIPresentableDismissalPreventionAssertion)dismissalPreventionAssertion;
- (UIEdgeInsets)bannerContentOutsets;
- (UILabel)dialogDescriptionLabel;
- (UIView)containerView;
- (UIView)materialView;
- (UIViewController)rootModalViewController;
- (WFBannerGesture)bannerGesture;
- (WFBannerViewController)initWithDelegate:(id)a3 associatedRunningContext:(id)a4;
- (WFBannerViewControllerDelegate)delegate;
- (WFCompactPlatterSashView)sashView;
- (WFCompactPlatterView)outgoingPlatterViewAwaitingSizeTransition;
- (WFCompactPlatterViewController)embeddedPlatter;
- (WFCompactStatusViewController)queuedStatusPlatter;
- (WFDispatchSourceTimer)actionGroupViewTransitionCompletionTimer;
- (WFDispatchSourceTimer)dismissalCompletionTimer;
- (WFDispatchSourceTimer)localIdleTimer;
- (WFDispatchSourceTimer)queuedStatusPlatterTimer;
- (WFPassthroughDimmingView)dimmingView;
- (WFWorkflowRunningContext)associatedRunningContext;
- (_UIPortalView)activeTransitioningActionGroupViewPortal;
- (double)maximumExpectedHeightForPlatterPresentation:(id)a3;
- (double)platterCornerRadius;
- (double)sashViewHeight;
- (id)assertionReason;
- (id)bannerSizeTransitionAnimationSettings;
- (id)dismissalHandler;
- (id)layoutDescription;
- (id)presentingScreen;
- (id)viewIsAppearingHandler;
- (unint64_t)dismissalPhase;
- (void)acquireDismissalPreventionAssertion;
- (void)bannerGestureDidBegin;
- (void)bannerGestureDidEndWithDismissal:(BOOL)a3;
- (void)beginObservingForPresentation;
- (void)beginObservingKeyboard;
- (void)dealloc;
- (void)dismissEmbeddedPlatterWithCompletion:(id)a3 interruptible:(BOOL)a4;
- (void)handleTapGesture:(id)a3;
- (void)keyboardDidChange:(id)a3;
- (void)layoutDimmingLayer;
- (void)layoutEmbeddedPlatter;
- (void)loadView;
- (void)performBumpAnimation;
- (void)performLayoutUpdate;
- (void)platterPresentationDidInvalidateSize:(id)a3;
- (void)presentableDidAppearAsBanner:(id)a3;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillAppearAsBanner:(id)a3;
- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentationTransitionWillOccur:(id)a3;
- (void)releaseDismissalPreventionAssertionIfNecessary;
- (void)resetLocalIdleTimer;
- (void)setActionGroupViewTransitionCompletionTimer:(id)a3;
- (void)setActiveTransitioningActionGroupViewPortal:(id)a3;
- (void)setAssociatedRunningContext:(id)a3;
- (void)setAttributionTitle:(id)a3 icon:(id)a4 previouslyHidden:(BOOL)a5;
- (void)setBannerGesture:(id)a3;
- (void)setBannerSource:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setDialogDescriptionLabel:(id)a3;
- (void)setDimmingView:(id)a3;
- (void)setDismissalCompletionTimer:(id)a3;
- (void)setDismissalHandler:(id)a3;
- (void)setDismissalPhase:(unint64_t)a3;
- (void)setDismissalPreventionAssertion:(id)a3;
- (void)setEmbeddedPlatter:(id)a3;
- (void)setFreezePlatterLayout:(BOOL)a3;
- (void)setKeyboardIsVisible:(BOOL)a3;
- (void)setLocalIdleTimer:(id)a3;
- (void)setMaterialView:(id)a3;
- (void)setOutgoingPlatterViewAwaitingSizeTransition:(id)a3;
- (void)setPlatterCornerRadius:(double)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)setPresentableContext:(id)a3;
- (void)setQueuedStatusPlatter:(id)a3;
- (void)setQueuedStatusPlatterTimer:(id)a3;
- (void)setRootModalViewController:(id)a3;
- (void)setSashView:(id)a3;
- (void)setSystemIdleTimerOverrideAssertion:(id)a3;
- (void)setViewIsAppearingCalled:(BOOL)a3;
- (void)setViewIsAppearingHandler:(id)a3;
- (void)setViewWillAppearCalled:(BOOL)a3;
- (void)stopObservingForPresentation;
- (void)stopObservingKeyboard;
- (void)systemDismissedBanner;
- (void)transitionFromPlatter:(id)a3 toPlatter:(id)a4;
- (void)updateContainerViewFrameAnimated:(BOOL)a3;
- (void)updateDimmingLayerVisibility;
- (void)updateHomeGestureOwnership;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation WFBannerViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionGroupViewTransitionCompletionTimer, 0);
  objc_storeStrong((id *)&self->_activeTransitioningActionGroupViewPortal, 0);
  objc_storeStrong((id *)&self->_localIdleTimer, 0);
  objc_storeStrong((id *)&self->_systemIdleTimerOverrideAssertion, 0);
  objc_storeStrong(&self->_viewIsAppearingHandler, 0);
  objc_destroyWeak((id *)&self->_outgoingPlatterViewAwaitingSizeTransition);
  objc_storeStrong((id *)&self->_queuedStatusPlatterTimer, 0);
  objc_storeStrong((id *)&self->_dismissalCompletionTimer, 0);
  objc_storeStrong((id *)&self->_bannerGesture, 0);
  objc_storeStrong((id *)&self->_bannerSource, 0);
  objc_storeStrong((id *)&self->_dismissalPreventionAssertion, 0);
  objc_storeStrong((id *)&self->_dialogDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_sashView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_rootModalViewController, 0);
  objc_storeStrong(&self->_dismissalHandler, 0);
  objc_storeStrong((id *)&self->_queuedStatusPlatter, 0);
  objc_storeStrong((id *)&self->_embeddedPlatter, 0);
  objc_storeStrong((id *)&self->_associatedRunningContext, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_presentableContext);
}

- (void)setActionGroupViewTransitionCompletionTimer:(id)a3
{
}

- (WFDispatchSourceTimer)actionGroupViewTransitionCompletionTimer
{
  return self->_actionGroupViewTransitionCompletionTimer;
}

- (void)setActiveTransitioningActionGroupViewPortal:(id)a3
{
}

- (_UIPortalView)activeTransitioningActionGroupViewPortal
{
  return self->_activeTransitioningActionGroupViewPortal;
}

- (void)setLocalIdleTimer:(id)a3
{
}

- (WFDispatchSourceTimer)localIdleTimer
{
  return self->_localIdleTimer;
}

- (void)setSystemIdleTimerOverrideAssertion:(id)a3
{
}

- (BSInvalidatable)systemIdleTimerOverrideAssertion
{
  return self->_systemIdleTimerOverrideAssertion;
}

- (void)setViewIsAppearingHandler:(id)a3
{
}

- (id)viewIsAppearingHandler
{
  return self->_viewIsAppearingHandler;
}

- (void)setViewIsAppearingCalled:(BOOL)a3
{
  self->_viewIsAppearingCalled = a3;
}

- (BOOL)viewIsAppearingCalled
{
  return self->_viewIsAppearingCalled;
}

- (void)setViewWillAppearCalled:(BOOL)a3
{
  self->_viewWillAppearCalled = a3;
}

- (BOOL)viewWillAppearCalled
{
  return self->_viewWillAppearCalled;
}

- (void)setOutgoingPlatterViewAwaitingSizeTransition:(id)a3
{
}

- (WFCompactPlatterView)outgoingPlatterViewAwaitingSizeTransition
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_outgoingPlatterViewAwaitingSizeTransition);

  return (WFCompactPlatterView *)WeakRetained;
}

- (void)setQueuedStatusPlatterTimer:(id)a3
{
}

- (WFDispatchSourceTimer)queuedStatusPlatterTimer
{
  return self->_queuedStatusPlatterTimer;
}

- (void)setDismissalCompletionTimer:(id)a3
{
}

- (WFDispatchSourceTimer)dismissalCompletionTimer
{
  return self->_dismissalCompletionTimer;
}

- (void)setBannerGesture:(id)a3
{
}

- (WFBannerGesture)bannerGesture
{
  return self->_bannerGesture;
}

- (void)setBannerSource:(id)a3
{
}

- (BNBannerSource)bannerSource
{
  return self->_bannerSource;
}

- (void)setDismissalPreventionAssertion:(id)a3
{
}

- (SBUIPresentableDismissalPreventionAssertion)dismissalPreventionAssertion
{
  return self->_dismissalPreventionAssertion;
}

- (double)platterCornerRadius
{
  return self->_platterCornerRadius;
}

- (void)setKeyboardIsVisible:(BOOL)a3
{
  self->_keyboardIsVisible = a3;
}

- (BOOL)keyboardIsVisible
{
  return self->_keyboardIsVisible;
}

- (void)setFreezePlatterLayout:(BOOL)a3
{
  self->_freezePlatterLayout = a3;
}

- (BOOL)shouldFreezePlatterLayout
{
  return self->_freezePlatterLayout;
}

- (void)setDialogDescriptionLabel:(id)a3
{
}

- (UILabel)dialogDescriptionLabel
{
  return self->_dialogDescriptionLabel;
}

- (void)setSashView:(id)a3
{
}

- (WFCompactPlatterSashView)sashView
{
  return self->_sashView;
}

- (void)setDimmingView:(id)a3
{
}

- (WFPassthroughDimmingView)dimmingView
{
  return self->_dimmingView;
}

- (void)setMaterialView:(id)a3
{
}

- (UIView)materialView
{
  return self->_materialView;
}

- (void)setContainerView:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (UIViewController)rootModalViewController
{
  return self->_rootModalViewController;
}

- (void)setDismissalHandler:(id)a3
{
}

- (id)dismissalHandler
{
  return self->_dismissalHandler;
}

- (unint64_t)dismissalPhase
{
  return self->_dismissalPhase;
}

- (WFCompactStatusViewController)queuedStatusPlatter
{
  return self->_queuedStatusPlatter;
}

- (WFCompactPlatterViewController)embeddedPlatter
{
  return self->_embeddedPlatter;
}

- (void)setAssociatedRunningContext:(id)a3
{
}

- (WFWorkflowRunningContext)associatedRunningContext
{
  return self->_associatedRunningContext;
}

- (WFBannerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WFBannerViewControllerDelegate *)WeakRetained;
}

- (void)setPresentableContext:(id)a3
{
}

- (BNPresentableContext)presentableContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentableContext);

  return (BNPresentableContext *)WeakRetained;
}

- (id)layoutDescription
{
  v2 = [(WFBannerViewController *)self bannerSource];
  v3 = [v2 layoutDescriptionWithError:0];

  return v3;
}

- (id)assertionReason
{
  v2 = [(WFBannerViewController *)self associatedRunningContext];
  v3 = [v2 identifier];
  v4 = +[NSUUID UUID];
  v5 = [v4 UUIDString];
  v6 = +[NSString stringWithFormat:@"com.apple.shortcuts.WFBannerViewController.cid-%@.uid-%@", v3, v5];

  return v6;
}

- (BOOL)platterShouldOwnHomeGesture:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    objc_opt_isKindOfClass();
  }

  return 0;
}

- (id)presentingScreen
{
  v2 = [(WFBannerViewController *)self view];
  id v3 = [v2 _screen];

  return v3;
}

- (void)bannerGestureDidEndWithDismissal:(BOOL)a3
{
  if (a3)
  {
    [(WFBannerViewController *)self setDismissalPhase:2];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000B9F4;
    v7[3] = &unk_100038C80;
    v7[4] = self;
    +[UIView animateWithDuration:2 delay:v7 options:0 animations:0.3 completion:0.0];
    v4 = [(WFBannerViewController *)self dismissalHandler];
    ((void (**)(void, const __CFString *))v4)[2](v4, @"Banner was swiped away.");

    dispatch_time_t v5 = dispatch_time(0, 100000000);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000BA54;
    v6[3] = &unk_100038C80;
    v6[4] = self;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v6);
  }
  else
  {
    [(WFBannerViewController *)self setFreezePlatterLayout:"setFreezePlatterLayout:"];
  }
}

- (void)bannerGestureDidBegin
{
}

- (void)handleTapGesture:(id)a3
{
  if ([(WFBannerViewController *)self keyboardIsVisible])
  {
    id v6 = [(WFBannerViewController *)self embeddedPlatter];
    v4 = [v6 view];
    [v4 endEditing:1];
  }
  else
  {
    dispatch_time_t v5 = [(WFBannerViewController *)self dismissalHandler];
    ((void (**)(void, const __CFString *))v5)[2](v5, @"Disambiguation dimming layer was tapped.");

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000BBC8;
    v7[3] = &unk_100038C80;
    v7[4] = self;
    +[UIView _animateUsingSpringWithDampingRatio:1 response:v7 tracking:0 dampingRatioSmoothing:1.0 responseSmoothing:0.3 targetSmoothing:0.0 projectionDeceleration:0.0 retargetImpulse:0.0 animations:0.0 completion:0.0];
  }
}

- (void)layoutDimmingLayer
{
  id v3 = [(WFBannerViewController *)self dimmingView];

  if (v3)
  {
    [(WFBannerViewController *)self bannerSize];
    double v5 = v4;
    [(WFBannerViewController *)self bannerContentOutsets];
    double v7 = v6;
    double v9 = -v8;
    double v11 = v10 + v5 + v8;
    v12 = [(WFBannerViewController *)self layoutDescription];
    [v12 containerSize];
    double v14 = v13;
    v15 = [(WFBannerViewController *)self layoutDescription];
    [v15 offsetFromPresentationEdge];
    double v17 = v14 + v16;

    id v18 = [(WFBannerViewController *)self dimmingView];
    [v18 setFrame:v9, -100.0 - v7, v11, v17 + 100.0];
  }
}

- (void)updateDimmingLayerVisibility
{
  BOOL v3 = [(WFBannerViewController *)self shouldShowDimmingLayer];
  if (v3)
  {
    double v4 = [(WFBannerViewController *)self dimmingView];

    if (!v4)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10000BF78;
      v11[3] = &unk_100038C80;
      v11[4] = self;
      +[UIView performWithoutAnimation:v11];
    }
  }
  double v5 = [(WFBannerViewController *)self dimmingView];

  if (v5)
  {
    if (v3)
    {
      double v6 = [(WFBannerViewController *)self dimmingView];
    }
    else
    {
      double v6 = 0;
    }
    double v7 = [(WFBannerViewController *)self bannerGesture];
    [v7 setDimmingView:v6];

    if (v3) {
    double v8 = [(WFBannerViewController *)self dimmingView];
    }
    [v8 setCaptureTouches:v3];

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000C0B8;
    v9[3] = &unk_100038B18;
    v9[4] = self;
    BOOL v10 = v3;
    +[UIView _animateUsingSpringWithDampingRatio:1 response:v9 tracking:0 dampingRatioSmoothing:1.0 responseSmoothing:0.37 targetSmoothing:0.0 projectionDeceleration:0.0 retargetImpulse:0.0 animations:0.0 completion:0.0];
  }
}

- (BOOL)shouldShowDimmingLayer
{
  if (![(WFBannerViewController *)self dismissalPhase])
  {
    double v5 = [(WFBannerViewController *)self embeddedPlatter];
    char v6 = objc_opt_respondsToSelector();
    if (v6)
    {
      v2 = [(WFBannerViewController *)self embeddedPlatter];
      if ([v2 shouldInstallBannerDimmingLayer])
      {
        BOOL v4 = 1;
LABEL_12:

        goto LABEL_13;
      }
      if (![(WFBannerViewController *)self keyboardIsVisible])
      {
        BOOL v4 = 0;
        goto LABEL_12;
      }
    }
    else if (![(WFBannerViewController *)self keyboardIsVisible])
    {
      BOOL v4 = 0;
LABEL_13:

      return v4;
    }
    double v7 = [(WFBannerViewController *)self traitCollection];
    BOOL v4 = [v7 userInterfaceIdiom] == 0;

    if ((v6 & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  return 0;
}

- (void)presentationTransitionWillOccur:(id)a3
{
  id v18 = a3;
  BOOL v4 = [v18 object];
  NSClassFromString(@"_UIDatePickerContainerViewController");
  if (objc_opt_isKindOfClass()) {
    goto LABEL_2;
  }
  double v5 = [v18 object];
  NSClassFromString(@"_UIContextMenuActionsOnlyViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    double v7 = [v18 name];
    unsigned int v8 = [v7 isEqualToString:UIPresentationControllerPresentationTransitionWillBeginNotification];

    if (v8)
    {
      double v9 = [(WFBannerViewController *)self rootModalViewController];

      if (!v9)
      {
        BOOL v10 = [(WFBannerViewController *)self presentingScreen];
        [v10 bounds];
        -[WFBannerViewController setPreferredContentSize:](self, "setPreferredContentSize:", v11, v12);

        BOOL v4 = [v18 object];
        [(WFBannerViewController *)self setRootModalViewController:v4];
LABEL_2:
      }
    }
    else
    {
      double v13 = [v18 name];
      unsigned int v14 = [v13 isEqualToString:UIPresentationControllerDismissalTransitionDidEndNotification];

      if (v14)
      {
        v15 = [v18 object];
        double v16 = [(WFBannerViewController *)self rootModalViewController];
        unsigned int v17 = [v15 isEqual:v16];

        if (v17)
        {
          [(WFBannerViewController *)self setRootModalViewController:0];
          [(WFBannerViewController *)self bannerSize];
          -[WFBannerViewController setPreferredContentSize:](self, "setPreferredContentSize:");
          BOOL v4 = [(WFBannerViewController *)self presentableHomeGestureContext];
          [v4 setWantsHomeGesture:0];
          goto LABEL_2;
        }
      }
    }
  }
}

- (void)stopObservingForPresentation
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (void)beginObservingForPresentation
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"presentationTransitionWillOccur:" name:UIPresentationControllerPresentationTransitionWillBeginNotification object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"presentationTransitionWillOccur:" name:UIPresentationControllerDismissalTransitionDidEndNotification object:0];
}

- (void)releaseDismissalPreventionAssertionIfNecessary
{
  id v3 = [(WFBannerViewController *)self dismissalPreventionAssertion];

  if (v3)
  {
    id v4 = [(WFBannerViewController *)self dismissalPreventionAssertion];
    [v4 invalidate];

    [(WFBannerViewController *)self setDismissalPreventionAssertion:0];
  }
}

- (void)acquireDismissalPreventionAssertion
{
  [(WFBannerViewController *)self releaseDismissalPreventionAssertionIfNecessary];
  id v3 = [(WFBannerViewController *)self presentableDismissalPreventionContext];
  id v4 = [(WFBannerViewController *)self assertionReason];
  id v5 = [v3 acquireTransitionDismissalPreventionAssertionForReason:v4];

  [(WFBannerViewController *)self setDismissalPreventionAssertion:v5];
}

- (BOOL)homeAffordanceDidCrossThreshold
{
  unsigned int v3 = [(WFBannerViewController *)self keyboardIsVisible];
  id v4 = [(WFBannerViewController *)self embeddedPlatter];
  id v5 = v4;
  if (v3)
  {
    char v6 = [v4 view];
    [v6 endEditing:1];

LABEL_11:
    return 1;
  }
  if (v4)
  {
    double v7 = [(WFBannerViewController *)self embeddedPlatter];
    if (objc_opt_respondsToSelector())
    {
      unsigned int v8 = [(WFBannerViewController *)self embeddedPlatter];
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        BOOL v10 = [(WFBannerViewController *)self embeddedPlatter];
        unsigned int v11 = [v10 hasCustomHomeGestureBehavior];

        if (v11)
        {
          id v5 = [(WFBannerViewController *)self embeddedPlatter];
          [v5 homeGestureDidPassThreshold];
          goto LABEL_11;
        }
      }
    }
    else
    {
    }
  }
  double v12 = [(WFBannerViewController *)self delegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    id v5 = [(WFBannerViewController *)self delegate];
    [v5 bannerViewControllerHomeGestureDidPassThreshold:self];
    goto LABEL_11;
  }
  return 1;
}

- (void)updateHomeGestureOwnership
{
  if ([(WFBannerViewController *)self keyboardIsVisible]
    || ([(WFBannerViewController *)self embeddedPlatter],
        unsigned int v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    uint64_t v7 = 1;
  }
  else
  {
    id v4 = [(WFBannerViewController *)self embeddedPlatter];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      char v6 = [(WFBannerViewController *)self embeddedPlatter];
      uint64_t v7 = (uint64_t)[v6 hasCustomHomeGestureBehavior];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  id v8 = [(WFBannerViewController *)self presentableHomeGestureContext];
  [v8 setWantsHomeGesture:v7];
}

- (BOOL)shouldCancelSystemDragGestureWithTouches:(id)a3 event:(id)a4
{
  return 1;
}

- (void)keyboardDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  char v6 = [v5 objectForKeyedSubscript:UIKeyboardIsLocalUserInfoKey];

  if (!v6 || [v6 BOOLValue])
  {
    uint64_t v7 = [(WFBannerViewController *)self embeddedPlatter];

    if (v7)
    {
      id v8 = [v4 name];
      -[WFBannerViewController setKeyboardIsVisible:](self, "setKeyboardIsVisible:", [v8 isEqualToString:UIKeyboardWillShowNotification]);

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000C9D4;
      block[3] = &unk_100038C80;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)stopObservingKeyboard
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIKeyboardWillShowNotification object:0];
  [v3 removeObserver:self name:UIKeyboardWillHideNotification object:0];
}

- (void)beginObservingKeyboard
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"keyboardDidChange:" name:UIKeyboardWillShowNotification object:0];
  [v3 addObserver:self selector:"keyboardDidChange:" name:UIKeyboardWillHideNotification object:0];
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  [(WFBannerViewController *)self releaseDismissalPreventionAssertionIfNecessary];
  id v5 = [(WFBannerViewController *)self presentableHomeGestureContext];
  [v5 setWantsHomeGesture:0];

  [(WFBannerViewController *)self stopObservingForPresentation];
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v8 = a4;
  id v5 = [(WFBannerViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [(WFBannerViewController *)self delegate];
    [v7 bannerViewController:self willDismissWithReason:v8];
  }
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  id v11 = a3;
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v11;
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
  char v6 = [v5 view];
  uint64_t v7 = [v6 window];
  id v8 = [(id)v7 _rootSheetPresentationController];
  [v8 _setShouldScaleDownBehindDescendantSheets:0];

  [(WFBannerViewController *)self updateHomeGestureOwnership];
  char v9 = [(WFBannerViewController *)self delegate];
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if (v7)
  {
    BOOL v10 = [(WFBannerViewController *)self delegate];
    [v10 bannerViewController:self didPresentBanner:v11];
  }
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  id v4 = [(WFBannerViewController *)self embeddedPlatter];

  if (v4) {
    [(WFBannerViewController *)self beginObservingForPresentation];
  }
  id v5 = [(WFBannerViewController *)self view];
  id v6 = [v5 window];

  [v6 makeKeyWindow];
  [(WFBannerViewController *)self acquireDismissalPreventionAssertion];
}

- (void)systemDismissedBanner
{
  id v3 = [(WFBannerViewController *)self embeddedPlatter];

  if (v3)
  {
    id v6 = [(WFBannerViewController *)self embeddedPlatter];
    [v6 systemDismissedBanner];
  }
  else
  {
    id v4 = [(WFBannerViewController *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0) {
      return;
    }
    id v6 = [(WFBannerViewController *)self delegate];
    [v6 bannerViewControllerActionUserInterfaceNeedsDismissal:self];
  }
}

- (BOOL)providesHostedContent
{
  return 0;
}

- (UIEdgeInsets)bannerContentOutsets
{
  if ([(WFBannerViewController *)self bannerIsFullScreen])
  {
    v26.receiver = self;
    v26.super_class = (Class)WFBannerViewController;
    [(WFBannerViewController *)&v26 bannerContentOutsets];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    BOOL v10 = [(WFBannerViewController *)self layoutDescription];
    [v10 containerSize];
    double v12 = v11;
    double v14 = v13;

    [(WFBannerViewController *)self bannerSize];
    double v16 = v15;
    double v7 = (v12 - v17) * 0.5;
    id v18 = [(WFBannerViewController *)self layoutDescription];
    [v18 offsetFromPresentationEdge];
    double v5 = v19;

    v20 = [(WFBannerViewController *)self view];
    v21 = [v20 traitCollection];
    [v21 displayScale];
    double v9 = v14 - v16 + 6.0 / v22;

    double v3 = v7;
  }
  double v23 = v5;
  double v24 = v7;
  double v25 = v9;
  result.right = v3;
  result.bottom = v25;
  result.left = v24;
  result.top = v23;
  return result;
}

- (id)bannerSizeTransitionAnimationSettings
{
  return +[BSAnimationSettings settingsWithDuration:0.0];
}

- (BOOL)isClippingEnabled
{
  return 0;
}

- (BOOL)isDraggingDismissalEnabled
{
  return 0;
}

- (NSString)requesterIdentifier
{
  return (NSString *)VCBundleIdentifierShortcutsUI;
}

- (NSString)requestIdentifier
{
  double v3 = objc_opt_class();
  double v4 = [(WFBannerViewController *)self associatedRunningContext];
  double v5 = [v3 requestIdentifierForContext:v4];

  return (NSString *)v5;
}

- (double)maximumExpectedHeightForPlatterPresentation:(id)a3
{
  double v4 = [(WFBannerViewController *)self view];
  double v5 = [(WFBannerViewController *)self view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  BOOL v10 = [(WFBannerViewController *)self embeddedPlatter];
  +[WFCompactPlatterPresentationController presentedViewFrameInContainerView:containerViewSize:withSizeCalculation:ofPresentedPlatter:](WFCompactPlatterPresentationController, "presentedViewFrameInContainerView:containerViewSize:withSizeCalculation:ofPresentedPlatter:", v4, 0, v10, v7, v9);
  double v12 = v11;

  return v12;
}

- (void)platterPresentationDidInvalidateSize:(id)a3
{
  [(WFBannerViewController *)self updateContainerViewFrameAnimated:1];
  [(WFBannerViewController *)self bannerSize];

  -[WFBannerViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(WFBannerViewController *)self viewWillAppearCalled])
  {
    double v6 = [(WFBannerViewController *)self presentingScreen];
    [v6 bounds];
    if (v8 == width && v7 == height)
    {
      BOOL v10 = [(WFBannerViewController *)self presentingScreen];
      [v10 bounds];
      double v12 = v11;
      double v14 = v13;
      [(WFBannerViewController *)self preferredContentSize];
      double v16 = v15;
      double v18 = v17;

      if (v12 != v16 || v14 != v18) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    double v19 = [(WFBannerViewController *)self presentableContext];
    [v19 setHostNeedsUpdate];

LABEL_10:
    v21.receiver = self;
    v21.super_class = (Class)WFBannerViewController;
    -[WFBannerViewController setPreferredContentSize:](&v21, "setPreferredContentSize:", width, height);
    v20 = [(WFBannerViewController *)self presentableContext];
    [v20 setHostNeedsUpdate];
  }
}

- (BOOL)shouldDisplaySash
{
  double v3 = +[WFDevice currentDevice];
  if ([v3 hasSystemAperture])
  {
    double v4 = +[WFBannerPrototypeSettings sharedSettings];
    unsigned int v5 = [v4 simulateStatusBannerDevice];

    if (!v5)
    {
      char isKindOfClass = 0;
      return isKindOfClass & 1;
    }
  }
  else
  {
  }
  double v7 = [(WFBannerViewController *)self embeddedPlatter];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    double v8 = [(WFBannerViewController *)self embeddedPlatter];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (double)sashViewHeight
{
  double v3 = [(WFBannerViewController *)self embeddedPlatter];
  if (![v3 shouldHideSashView]) {
    goto LABEL_4;
  }
  double v4 = [(WFBannerViewController *)self embeddedPlatter];
  unsigned int v5 = [v4 platterView];
  double v6 = [v5 primaryText];
  if ([v6 length])
  {

LABEL_4:
    goto LABEL_5;
  }
  double v9 = [(WFBannerViewController *)self embeddedPlatter];
  BOOL v10 = [v9 platterView];
  double v11 = [v10 secondaryText];
  id v12 = [v11 length];

  if (!v12) {
    return 0.0;
  }
LABEL_5:
  unsigned int v7 = [(WFBannerViewController *)self shouldDisplaySash];
  double result = 47.0;
  if (!v7) {
    return 15.0;
  }
  return result;
}

- (CGSize)platterContentSize
{
  double v3 = [(WFBannerViewController *)self layoutDescription];
  [v3 containerSize];
  double v5 = v4;
  double v7 = v6;

  double v8 = [(WFBannerViewController *)self view];
  double v9 = [v8 _window];
  BOOL v10 = [(WFBannerViewController *)self embeddedPlatter];
  +[WFCompactPlatterPresentationController presentedViewFrameInContainerView:containerViewSize:withSizeCalculation:ofPresentedPlatter:](WFCompactPlatterPresentationController, "presentedViewFrameInContainerView:containerViewSize:withSizeCalculation:ofPresentedPlatter:", v9, 1, v10, v5, v7);
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (CGSize)bannerSize
{
  if ([(WFBannerViewController *)self bannerIsFullScreen])
  {
    double v3 = [(WFBannerViewController *)self presentingScreen];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    [(WFBannerViewController *)self platterContentSize];
    double v5 = v8;
    double v7 = 1.0;
  }
  double v9 = v5;
  double v10 = v7;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (BOOL)bannerIsFullScreen
{
  double v3 = [(WFBannerViewController *)self embeddedPlatter];
  if (v3)
  {
    double v4 = [(WFBannerViewController *)self presentedViewController];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (void)resetLocalIdleTimer
{
  double v3 = [(WFBannerViewController *)self systemIdleTimerOverrideAssertion];

  if (!v3)
  {
    double v4 = +[ITIdleTimerState sharedInstance];
    uint64_t v14 = 0;
    id v5 = [v4 newAssertionToDisableIdleTimerForReason:@"Shortcut is running, overriding lock screen idle timer.", &v14 error];

    [(WFBannerViewController *)self setSystemIdleTimerOverrideAssertion:v5];
  }
  double v6 = [(WFBannerViewController *)self localIdleTimer];
  [v6 cancel];

  objc_initWeak(&location, self);
  id v7 = objc_alloc((Class)WFDispatchSourceTimer);
  id v8 = &_dispatch_main_q;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000D730;
  v11[3] = &unk_100038BE8;
  objc_copyWeak(&v12, &location);
  id v9 = [v7 initWithInterval:&_dispatch_main_q queue:v11 handler:30.0];
  [(WFBannerViewController *)self setLocalIdleTimer:v9];

  double v10 = [(WFBannerViewController *)self localIdleTimer];
  [v10 start];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)dismissEmbeddedPlatterWithCompletion:(id)a3 interruptible:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = +[WFBannerPrototypeSettings sharedSettings];
  [v7 transitionSettings];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10000DBB8;
  v32[3] = &unk_100038BC0;
  v32[4] = self;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v33 = v8;
  id v9 = objc_retainBlock(v32);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10000DC40;
  v29[3] = &unk_100038C30;
  v29[4] = self;
  id v10 = v8;
  id v30 = v10;
  id v11 = v7;
  id v31 = v11;
  id v12 = objc_retainBlock(v29);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DD04;
  block[3] = &unk_100038C80;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  if (v4)
  {
    [(WFBannerViewController *)self setDismissalPhase:1];
    ((void (*)(void *))v9[2])(v9);
    [v10 hintDuration];
    dispatch_time_t v14 = dispatch_time(0, (uint64_t)(v13 / 1000.0 * 1000000000.0));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10000DD64;
    v26[3] = &unk_100038CA8;
    v26[4] = self;
    v27 = v12;
    dispatch_after(v14, (dispatch_queue_t)&_dispatch_main_q, v26);
  }
  else
  {
    ((void (*)(void *))v12[2])(v12);
  }
  dispatch_time_t v15 = dispatch_time(0, 200000000);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10000DDBC;
  v25[3] = &unk_100038C80;
  v25[4] = self;
  dispatch_after(v15, (dispatch_queue_t)&_dispatch_main_q, v25);

  objc_initWeak(&location, self);
  id v16 = objc_alloc((Class)WFDispatchSourceTimer);
  if (v4) {
    double v17 = 1.0;
  }
  else {
    double v17 = 0.3;
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000DDC4;
  v21[3] = &unk_100038960;
  objc_copyWeak(&v23, &location);
  id v18 = v6;
  id v22 = v18;
  id v19 = [v16 initWithInterval:&_dispatch_main_q queue:v21 handler:v17];
  [(WFBannerViewController *)self setDismissalCompletionTimer:v19];

  v20 = [(WFBannerViewController *)self dismissalCompletionTimer];
  [v20 start];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (void)setDismissalPhase:(unint64_t)a3
{
  self->_dismissalPhase = a3;
  if (a3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000E870;
    block[3] = &unk_100038C80;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    BOOL v4 = [(WFBannerViewController *)self dismissalCompletionTimer];
    [v4 cancel];

    [(WFBannerViewController *)self setDismissalCompletionTimer:0];
  }
}

- (void)setQueuedStatusPlatter:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_queuedStatusPlatter, a3);
  id v6 = [(WFBannerViewController *)self queuedStatusPlatterTimer];
  [v6 cancel];

  [(WFBannerViewController *)self setQueuedStatusPlatterTimer:0];
  if (v5)
  {
    id v7 = [(WFBannerViewController *)self embeddedPlatter];
    if (v7)
    {
      objc_initWeak(&location, self);
      id v8 = objc_alloc((Class)WFDispatchSourceTimer);
      id v9 = &_dispatch_main_q;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10000EA78;
      v12[3] = &unk_100038E78;
      objc_copyWeak(&v14, &location);
      id v13 = v5;
      id v10 = [v8 initWithInterval:&_dispatch_main_q queue:v12 handler:0.2];
      [(WFBannerViewController *)self setQueuedStatusPlatterTimer:v10];

      id v11 = [(WFBannerViewController *)self queuedStatusPlatterTimer];
      [v11 start];

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    else
    {
      [(WFBannerViewController *)self setEmbeddedPlatter:v5];
    }
  }
}

- (void)setAttributionTitle:(id)a3 icon:(id)a4 previouslyHidden:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10000EF04;
  v35[3] = &unk_100038AC8;
  v35[4] = self;
  id v10 = objc_retainBlock(v35);
  if ([(WFBannerViewController *)self shouldDisplaySash])
  {
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10000EFC8;
    v32[3] = &unk_100038C80;
    v32[4] = self;
    id v11 = objc_retainBlock(v32);
    id v12 = [(WFBannerViewController *)self sashView];

    if (v12)
    {
      id v13 = [(WFBannerViewController *)self sashView];
      id v14 = [v13 title];
      unsigned __int8 v15 = [v14 isEqualToString:v8];

      if ((v15 & 1) == 0)
      {
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_10000F128;
        v30[3] = &unk_100038F60;
        id v31 = v10;
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_10000F13C;
        v24[3] = &unk_100038AF0;
        v24[4] = self;
        id v25 = v9;
        id v26 = v8;
        v27 = v11;
        uint64_t v29 = 0x3FC0000000000000;
        v28 = v31;
        +[UIView animateWithDuration:0x10000 delay:v30 options:v24 animations:0.125 completion:0.0];
      }
      if (!v5) {
        goto LABEL_11;
      }
    }
    else
    {
      id v16 = [objc_alloc((Class)WFCompactPlatterSashView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
      [(WFBannerViewController *)self setSashView:v16];

      double v17 = [(WFBannerViewController *)self sashView];
      [v17 setAutoresizesSubviews:1];

      id v18 = [(WFBannerViewController *)self sashView];
      [v18 setIcon:v9];

      id v19 = [(WFBannerViewController *)self sashView];
      [v19 setTitle:v8];

      v20 = [(WFBannerViewController *)self materialView];
      objc_super v21 = [(WFBannerViewController *)self sashView];
      [v20 addSubview:v21];

      ((void (*)(void *))v11[2])(v11);
      if (!v5)
      {
LABEL_11:

        goto LABEL_12;
      }
      ((void (*)(void *, void))v10[2])(v10, 0);
    }
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10000F234;
    v22[3] = &unk_100038F60;
    id v23 = v10;
    +[UIView animateWithDuration:0x20000 delay:v22 options:0 animations:0.125 completion:0.125];

    goto LABEL_11;
  }
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10000EFB4;
  v33[3] = &unk_100038F60;
  v34 = v10;
  +[UIView animateWithDuration:0x10000 delay:v33 options:0 animations:0.125 completion:0.0];

LABEL_12:
}

- (void)setPlatterCornerRadius:(double)a3
{
  [(WFBannerViewController *)self platterCornerRadius];
  if (v5 != a3)
  {
    [(WFBannerViewController *)self platterCornerRadius];
    double v7 = v6;
    self->_platterCornerRadius = a3;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000F39C;
    v12[3] = &unk_100038AA0;
    void v12[4] = self;
    *(double *)&v12[5] = a3;
    id v8 = objc_retainBlock(v12);
    id v9 = v8;
    if (v7 == 0.0)
    {
      ((void (*)(void *))v8[2])(v8);
    }
    else
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10000F3F0;
      v10[3] = &unk_100038F60;
      id v11 = v8;
      +[UIView animateWithDuration:v10 animations:0.2];
    }
  }
}

- (void)performLayoutUpdate
{
  [(WFBannerViewController *)self bannerSize];
  -[WFBannerViewController setPreferredContentSize:](self, "setPreferredContentSize:");

  [(WFBannerViewController *)self updateContainerViewFrameAnimated:0];
}

- (void)layoutEmbeddedPlatter
{
  double v3 = [(WFBannerViewController *)self embeddedPlatter];

  if (v3)
  {
    [(WFBannerViewController *)self platterContentSize];
    uint64_t v5 = v4;
    uint64_t v7 = v6;
    [(WFBannerViewController *)self sashViewHeight];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000F500;
    v9[3] = &unk_100038A78;
    v9[4] = self;
    void v9[5] = v8;
    v9[6] = v5;
    v9[7] = v7;
    +[UIView _performWithoutRetargetingAnimations:v9];
  }
}

- (void)updateContainerViewFrameAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(WFBannerViewController *)self shouldFreezePlatterLayout]) {
    return;
  }
  [(WFBannerViewController *)self layoutDimmingLayer];
  [(WFBannerViewController *)self platterContentSize];
  double v6 = v5;
  double v8 = v7;
  [(WFBannerViewController *)self sashViewHeight];
  double v10 = v9;
  double v11 = 0.0;
  double v12 = 0.0;
  if ([(WFBannerViewController *)self bannerIsFullScreen])
  {
    id v13 = [(WFBannerViewController *)self layoutDescription];
    [v13 containerSize];
    double v15 = v14;
    id v16 = [(WFBannerViewController *)self layoutDescription];
    [v16 presentationSize];
    double v12 = (v15 - v17) * 0.5;
  }
  if ([(WFBannerViewController *)self bannerIsFullScreen])
  {
    id v18 = [(WFBannerViewController *)self layoutDescription];
    [v18 offsetFromPresentationEdge];
    double v11 = v19;
  }
  double v20 = v8 + v10;
  if (v3)
  {
    objc_super v21 = [(WFBannerViewController *)self containerView];
    [v21 bounds];
    v161.origin.x = CGRectZero.origin.x;
    v161.origin.y = CGRectZero.origin.y;
    v161.size.double width = CGRectZero.size.width;
    v161.size.double height = CGRectZero.size.height;
    BOOL v22 = CGRectEqualToRect(v160, v161);

    if (!v22)
    {
      v158[0] = _NSConcreteStackBlock;
      v158[1] = 3221225472;
      v158[2] = sub_1000102B0;
      v158[3] = &unk_1000389D8;
      v158[4] = self;
      *(double *)&v158[5] = v12;
      *(double *)&v158[6] = v11;
      *(double *)&v158[7] = v6;
      *(double *)&v158[8] = v20;
      +[UIView _animateUsingSpringWithDampingRatio:1 response:v158 tracking:0 dampingRatioSmoothing:1.0 responseSmoothing:0.3 targetSmoothing:0.0 projectionDeceleration:0.0 retargetImpulse:0.0 animations:0.0 completion:0.0];
      id v23 = [(WFBannerViewController *)self outgoingPlatterViewAwaitingSizeTransition];
      double v24 = [(WFBannerViewController *)self embeddedPlatter];
      id v25 = [v24 platterView];

      id v26 = [v23 actionGroupView];
      v27 = [v25 actionGroupView];
      [v23 setSuppressContentViewLayout:1];
      if (v26 == v27)
      {
        BOOL v37 = 0;
      }
      else
      {
        v28 = [v26 actions];
        id v29 = [v28 count];
        id v30 = [v27 actions];
        if (v29 == [v30 count])
        {
          [v26 bounds];
          double v32 = v31;
          double v34 = v33;
          [v27 bounds];
          BOOL v37 = v34 == v36 && v32 == v35;
        }
        else
        {
          BOOL v37 = 0;
        }
      }
      v38 = [v23 clippingContentView];
      [v38 frame];
      double v40 = v39;

      v41 = [v25 clippingContentView];
      [v41 frame];
      double v43 = v42;

      if (+[NSUserDefaults universalPreviewsEnabled]&& v40 > 0.0&& v43 > 0.0)
      {
        if (!v37)
        {
          v60 = [v23 actionGroupView];
          if (v60)
          {

            goto LABEL_45;
          }
          v113 = [v25 actionGroupView];

          if (v113)
          {
LABEL_45:
            v114 = [(WFBannerViewController *)self activeTransitioningActionGroupViewPortal];

            if (v114)
            {
              v127[0] = _NSConcreteStackBlock;
              v127[1] = 3221225472;
              v127[2] = sub_1000106E0;
              v127[3] = &unk_1000389D8;
              v127[4] = self;
              *(double *)&v127[5] = v12;
              *(double *)&v127[6] = v11;
              *(double *)&v127[7] = v6;
              *(double *)&v127[8] = v20;
              +[UIView _animateUsingSpringWithDampingRatio:1 response:v127 tracking:0 dampingRatioSmoothing:1.0 responseSmoothing:0.3 targetSmoothing:0.0 projectionDeceleration:0.0 retargetImpulse:0.0 animations:0.0 completion:0.0];
            }
            goto LABEL_47;
          }
        }
        [(WFBannerViewController *)self setOutgoingPlatterViewAwaitingSizeTransition:0];
        if (v43 > v40)
        {
          v44 = [v23 backdropView];
          [v44 frame];
          double v121 = v45;
          double v123 = v6;
          double v47 = v46;
          double v119 = v48;
          double v50 = v49;

          v51 = [v23 backdropView];
          double v52 = v47;
          double v6 = v123;
          [v51 setFrame:v52, v121, v119, v43 - v40 + v50];
        }
        [v25 frame];
        double v54 = v53;
        [v23 frame];
        double v56 = v54 - v55;
        memset(&v157, 0, sizeof(v157));
        CGAffineTransformMakeScale(&t1, 1.0, (v40 + v56) / v40);
        CGAffineTransformMakeTranslation(&t2, 0.0, v56 * 0.5);
        CGAffineTransformConcat(&v157, &t1, &t2);
        memset(&v154, 0, sizeof(v154));
        CGAffineTransformMakeScale(&v153, 1.0, (v43 - v56) / v43);
        CGAffineTransformMakeTranslation(&v152, 0.0, v56 * -0.5);
        CGAffineTransformConcat(&v154, &v153, &v152);
        v57 = [v25 clippingContentView];
        CGAffineTransform v151 = v154;
        [v57 setTransform:&v151];

        v147[0] = _NSConcreteStackBlock;
        v147[1] = 3221225472;
        v147[2] = sub_100010364;
        v147[3] = &unk_100038A00;
        id v148 = v23;
        CGAffineTransform v150 = v157;
        id v149 = v25;
        +[UIView _animateUsingSpringWithDampingRatio:1 response:v147 tracking:0 dampingRatioSmoothing:1.0 responseSmoothing:0.3 targetSmoothing:0.0 projectionDeceleration:0.0 retargetImpulse:0.0 animations:0.0 completion:0.0];
      }
      if (v37)
      {
        v58 = [(WFBannerViewController *)self activeTransitioningActionGroupViewPortal];

        v118 = self;
        if (v58)
        {
          id v59 = [(WFBannerViewController *)self activeTransitioningActionGroupViewPortal];
        }
        else
        {
          double v124 = v6;
          [v26 bounds];
          double v62 = v61;
          double v64 = v63;
          double v66 = v65;
          double v68 = v67;
          v69 = [(WFBannerViewController *)self containerView];
          [v26 convertRect:v69 toView:v62];
          double v120 = v71;
          double v122 = v70;
          double v73 = v72;
          double v75 = v74;

          [v27 frame];
          double v77 = v76;
          double v79 = v78;
          [v26 bounds];
          [v27 setFrame:v77, v79];
          id v59 = [objc_alloc((Class)_UIPortalView) initWithFrame:v122 v120 v73 v75];
          [v59 setHidesSourceView:1];
          [v59 setAllowsHitTesting:1];
          [v59 setForwardsClientHitTestingToSourceView:1];
          v80 = [(WFBannerViewController *)self containerView];
          [v80 addSubview:v59];

          [(WFBannerViewController *)self setActiveTransitioningActionGroupViewPortal:v59];
          v81 = +[WFBannerPrototypeSettings sharedSettings];
          unsigned int v82 = [v81 debugMorphTransitions];

          if (v82)
          {
            id v83 = +[UIColor systemGreenColor];
            id v84 = [v83 CGColor];
            v85 = [v59 layer];
            [v85 setBorderColor:v84];

            v86 = [v59 layer];
            [v86 setBorderWidth:1.0];

            [v59 setHidesSourceView:0];
          }
          double v6 = v124;
        }
        v117 = v59;
        [v59 setSourceView:v27, v25, v23];
        [v26 removeFromSuperview];
        v87 = [v27 actions];
        id v88 = [v87 count];

        if (v88)
        {
          unint64_t v89 = 0;
          id v126 = v26;
          do
          {
            v90 = [v26 arrangedSubviews];
            v91 = [v90 objectAtIndexedSubscript:v89];

            v92 = v27;
            v93 = [v27 arrangedSubviews];
            v94 = [v93 objectAtIndexedSubscript:v89];

            v95 = [v91 backgroundColor];
            v96 = [v94 backgroundColor];
            if (([v96 isEqual:v95] & 1) == 0)
            {
              [v94 setBackgroundColor:v95];
              v144[0] = _NSConcreteStackBlock;
              v144[1] = 3221225472;
              v144[2] = sub_10001055C;
              v144[3] = &unk_100038BC0;
              id v145 = v94;
              id v146 = v96;
              +[UIView animateWithDuration:0x10000 delay:v144 options:0 animations:0.2 completion:0.0];
            }
            v97 = [v91 titleLabel];
            v98 = [v97 text];

            v99 = [v94 titleLabel];
            v100 = [v99 text];

            if (([v100 isEqualToString:v98] & 1) == 0)
            {
              [v94 setTitle:v98 forState:0];
              v142[0] = _NSConcreteStackBlock;
              v142[1] = 3221225472;
              v142[2] = sub_100010564;
              v142[3] = &unk_100038C80;
              id v143 = v94;
              v139[0] = _NSConcreteStackBlock;
              v139[1] = 3221225472;
              v139[2] = sub_1000105AC;
              v139[3] = &unk_100038A28;
              id v140 = v143;
              id v141 = v100;
              +[UIView animateWithDuration:0x10000 delay:v142 options:v139 animations:0.125 completion:0.0];
            }
            v101 = [v91 layer];
            v102 = [v101 presentationLayer];
            [v102 opacity];
            float v104 = v103;

            if (v104 < 1.0)
            {
              [v94 setAlpha:v104];
              v137[0] = _NSConcreteStackBlock;
              v137[1] = 3221225472;
              v137[2] = sub_100010664;
              v137[3] = &unk_100038C80;
              id v138 = v94;
              +[UIView animateWithDuration:0x10000 delay:v137 options:0 animations:0.25 completion:0.0];
            }
            ++v89;
            v27 = v92;
            v105 = [v92 actions];
            id v106 = [v105 count];

            id v26 = v126;
          }
          while (v89 < (unint64_t)v106);
        }
        v130[0] = _NSConcreteStackBlock;
        v130[1] = 3221225472;
        v130[2] = sub_100010464;
        v130[3] = &unk_100038A50;
        id v107 = v117;
        id v131 = v107;
        double v133 = v12;
        double v134 = v11;
        double v135 = v6;
        double v136 = v20;
        id v132 = v26;
        +[UIView _animateUsingSpringWithDampingRatio:1 response:v130 tracking:0 dampingRatioSmoothing:1.0 responseSmoothing:0.3 targetSmoothing:0.0 projectionDeceleration:0.0 retargetImpulse:0.0 animations:0.0 completion:0.0];
        v108 = [(WFBannerViewController *)v118 actionGroupViewTransitionCompletionTimer];
        [v108 cancel];

        objc_initWeak((id *)&v157, v118);
        id v109 = objc_alloc((Class)WFDispatchSourceTimer);
        id v110 = &_dispatch_main_q;
        v128[0] = _NSConcreteStackBlock;
        v128[1] = 3221225472;
        v128[2] = sub_100010670;
        v128[3] = &unk_100038BE8;
        objc_copyWeak(&v129, (id *)&v157);
        id v25 = v115;
        id v23 = v116;
        id v111 = [v109 initWithInterval:&_dispatch_main_q queue:v128 handler:0.55];
        [(WFBannerViewController *)v118 setActionGroupViewTransitionCompletionTimer:v111];

        v112 = [(WFBannerViewController *)v118 actionGroupViewTransitionCompletionTimer];
        [v112 start];

        objc_destroyWeak(&v129);
        objc_destroyWeak((id *)&v157);

LABEL_47:
        return;
      }
      goto LABEL_45;
    }
  }
  id v125 = [(WFBannerViewController *)self containerView];
  [v125 setFrame:v12, v11, v6, v20];
}

- (void)transitionFromPlatter:(id)a3 toPlatter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = +[WFBannerPrototypeSettings sharedSettings];
  unsigned int v9 = [v8 debugMorphTransitions];

  double v10 = [v7 platterView];
  double v11 = v10;
  if (v9)
  {
    [v10 setAlpha:0.5];
  }
  else
  {
    [v10 setAlpha:0.0];

    if (!+[NSUserDefaults universalPreviewsEnabled])goto LABEL_6; {
    double v11 = +[CAFilter filterWithType:kCAFilterGaussianBlur];
    }
    [v11 setName:@"gaussianBlur"];
    [v11 setValue:&off_10003B0D0 forKey:kCAFilterInputRadius];
    [v11 setValue:&__kCFBooleanFalse forKey:kCAFilterInputNormalizeEdges];
    [v11 setValue:&__kCFBooleanFalse forKey:kCAFilterInputHardEdges];
    [v11 setValue:@"default" forKey:kCAFilterInputQuality];
    [v11 setValue:@"default" forKey:kCAFilterInputIntermediateBitDepth];
    double v12 = [v6 platterView];
    id v13 = [v12 layer];
    v28 = v11;
    double v14 = +[NSArray arrayWithObjects:&v28 count:1];
    [v13 setFilters:v14];
  }
LABEL_6:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v15 = 0.2;
  }
  else {
    double v15 = 0.1;
  }
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100010EA8;
  v26[3] = &unk_100038C80;
  id v27 = v6;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100010F84;
  v24[3] = &unk_1000389B0;
  id v16 = v27;
  id v25 = v16;
  +[UIView _animateUsingSpringWithDampingRatio:1 response:v26 tracking:v24 dampingRatioSmoothing:1.0 responseSmoothing:v15 targetSmoothing:0.0 projectionDeceleration:0.0 retargetImpulse:0.0 animations:0.0 completion:0.0];
  dispatch_time_t v17 = dispatch_time(0, 150000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010FDC;
  block[3] = &unk_100038C80;
  id v18 = v7;
  id v23 = v18;
  dispatch_after(v17, (dispatch_queue_t)&_dispatch_main_q, block);
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000112A0;
    v21[3] = &unk_100038C80;
    void v21[4] = self;
    +[UIView _animateUsingSpringWithDampingRatio:1 response:v21 tracking:0 dampingRatioSmoothing:1.0 responseSmoothing:0.5 targetSmoothing:0.0 projectionDeceleration:0.0 retargetImpulse:0.0 animations:0.0 completion:0.0];
  }
  else
  {
    [(WFBannerViewController *)self performBumpAnimation];
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000112E8;
  v20[3] = &unk_100038C80;
  v20[4] = self;
  +[UIView _animateUsingSpringWithDampingRatio:1 response:v20 tracking:0 dampingRatioSmoothing:1.0 responseSmoothing:0.35 targetSmoothing:0.0 projectionDeceleration:0.0 retargetImpulse:0.0 animations:0.0 completion:0.0];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100011390;
  v19[3] = &unk_100038C80;
  v19[4] = self;
  +[UIView animateWithDuration:4 delay:v19 options:0 animations:0.2 completion:0.0];
}

- (void)performBumpAnimation
{
  memset(&v11, 0, sizeof(v11));
  CGAffineTransformMakeScale(&v11, 1.028, 1.028);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000118D8;
  v9[3] = &unk_100038988;
  v9[4] = self;
  CGAffineTransform v10 = v11;
  +[UIView _animateUsingSpringWithDampingRatio:1 response:v9 tracking:0 dampingRatioSmoothing:1.0 responseSmoothing:0.3 targetSmoothing:0.0 projectionDeceleration:0.0 retargetImpulse:0.0 animations:0.0 completion:0.0];
  BOOL v3 = [(WFBannerViewController *)self containerView];
  long long v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v8[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v8[1] = v4;
  v8[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v3 setTransform:v8];

  dispatch_time_t v5 = dispatch_time(0, 125000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001192C;
  block[3] = &unk_100038988;
  void block[4] = self;
  CGAffineTransform v7 = v11;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setEmbeddedPlatter:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v6 = [(WFBannerViewController *)self embeddedPlatter];

  if (v6 != v5)
  {
    [(WFBannerViewController *)self setQueuedStatusPlatter:0];
    CGAffineTransform v7 = [(WFBannerViewController *)self embeddedPlatter];
    objc_storeStrong((id *)&self->_embeddedPlatter, a3);
    [v5 setPlatterContentContainer:self];
    [v7 setPlatterContentContainer:0];
    double v8 = [(WFBannerViewController *)self containerView];

    if (v8)
    {
      [(WFBannerViewController *)self updateDimmingLayerVisibility];
    }
    else
    {
      unsigned int v9 = objc_opt_new();
      CGAffineTransform v10 = [(WFBannerViewController *)self view];
      [v10 addSubview:v9];

      [(WFBannerViewController *)self setContainerView:v9];
      CGAffineTransform v11 = +[CAFilter filterWithType:kCAFilterGaussianBlur];
      [v11 setName:@"gaussianBlur"];
      [v11 setValue:&off_10003B0D0 forKey:kCAFilterInputRadius];
      [v11 setValue:&__kCFBooleanFalse forKey:kCAFilterInputNormalizeEdges];
      [v11 setValue:&__kCFBooleanFalse forKey:kCAFilterInputHardEdges];
      [v11 setValue:@"default" forKey:kCAFilterInputQuality];
      [v11 setValue:@"default" forKey:kCAFilterInputIntermediateBitDepth];
      double v12 = [(WFBannerViewController *)self containerView];
      id v13 = [v12 layer];
      v92 = v11;
      double v14 = +[NSArray arrayWithObjects:&v92 count:1];
      [v13 setFilters:v14];

      double v15 = objc_opt_new();
      [v15 setAutoresizingMask:18];
      id v16 = +[WFBannerPrototypeSettings sharedSettings];
      LODWORD(v14) = [v16 debugShadowsEnabled];

      dispatch_time_t v17 = [v15 layer];
      id v18 = v17;
      if (v14)
      {
        [v17 setShadowRadius:2.0];

        double v19 = [v15 layer];
        LODWORD(v20) = 1.0;
      }
      else
      {
        [v17 setShadowRadius:45.0];

        double v19 = [v15 layer];
        LODWORD(v20) = 1050924810;
      }
      [v19 setShadowOpacity:v20];

      objc_super v21 = [v15 layer];
      [v21 setShadowOffset:CGSizeZero.width, CGSizeZero.height];

      BOOL v22 = [v15 layer];
      [v22 setPunchoutShadow:1];

      [v9 addSubview:v15];
      id v23 = +[MTMaterialView materialViewWithRecipe:53 options:0 initialWeighting:1.0];
      [v23 setAutoresizingMask:18];
      [v23 setUserInteractionEnabled:1];
      [v23 setClipsToBounds:1];
      [v15 addSubview:v23];
      [(WFBannerViewController *)self setMaterialView:v23];
      double v24 = [[WFBannerGesture alloc] initWithView:v9];
      [(WFBannerViewController *)self setBannerGesture:v24];

      id v25 = [(WFBannerViewController *)self bannerGesture];
      [v25 setDelegate:self];

      [v9 setAlpha:0.0];
      v91[0] = _NSConcreteStackBlock;
      v91[1] = 3221225472;
      v91[2] = sub_100012634;
      v91[3] = &unk_100038C80;
      v91[4] = self;
      id v26 = objc_retainBlock(v91);
      if ([(WFBannerViewController *)self viewIsAppearingCalled])
      {
        ((void (*)(void *))v26[2])(v26);
        [(WFBannerViewController *)self updateDimmingLayerVisibility];
      }
      else
      {
        objc_initWeak(&location, self);
        v87[0] = _NSConcreteStackBlock;
        v87[1] = 3221225472;
        v87[2] = sub_100012910;
        v87[3] = &unk_100038960;
        objc_copyWeak(&v89, &location);
        id v88 = v26;
        [(WFBannerViewController *)self setViewIsAppearingHandler:v87];

        objc_destroyWeak(&v89);
        objc_destroyWeak(&location);
      }
    }
    [(WFBannerViewController *)self setDismissalPhase:0];
    id v27 = [v7 view];
    [v27 setAutoresizingMask:0];

    v28 = [v5 view];
    id v29 = [v5 platterView];
    id v30 = [v29 attribution];
    double v31 = [v30 title];
    double v32 = +[NSString stringWithFormat:@"junior_attribution: %@", v31];
    [v28 setAccessibilityIdentifier:v32];

    double v33 = [(WFBannerViewController *)self materialView];
    double v34 = [v5 view];
    [v33 addSubview:v34];

    [(WFBannerViewController *)self setFreezePlatterLayout:1];
    [(WFBannerViewController *)self layoutEmbeddedPlatter];
    double v35 = [(WFBannerViewController *)self view];
    [v35 layoutIfNeeded];

    [(WFBannerViewController *)self setFreezePlatterLayout:0];
    if (v7)
    {
      [(WFBannerViewController *)self transitionFromPlatter:v7 toPlatter:v5];
      double v36 = [v7 platterView];
      [(WFBannerViewController *)self setOutgoingPlatterViewAwaitingSizeTransition:v36];

      [(WFBannerViewController *)self updateContainerViewFrameAnimated:1];
      [(WFBannerViewController *)self updateDimmingLayerVisibility];
      [(WFBannerViewController *)self resetLocalIdleTimer];
    }
    else
    {
      [(WFBannerViewController *)self updateContainerViewFrameAnimated:0];
    }
    BOOL v37 = [(WFBannerViewController *)self bannerGesture];
    v38 = [v5 scrollView];
    [v37 setEmbeddedScrollView:v38];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v39 = 34.0;
    }
    else
    {
      unsigned int v40 = +[NSUserDefaults universalPreviewsEnabled];
      double v39 = 39.0;
      if (v40) {
        double v39 = 41.0;
      }
    }
    [(WFBannerViewController *)self setPlatterCornerRadius:v39];
    v41 = [v5 platterView];
    double v42 = [v41 attribution];
    double v43 = [v42 title];
    v44 = [v5 platterView];
    double v45 = [v44 attribution];
    double v46 = [v45 icon];
    -[WFBannerViewController setAttributionTitle:icon:previouslyHidden:](self, "setAttributionTitle:icon:previouslyHidden:", v43, v46, [v7 shouldHideSashView]);

    double v47 = +[WFBannerPrototypeSettings sharedSettings];
    LODWORD(v42) = [v47 debugMorphTransitions];

    if (v42)
    {
      id v48 = +[UIColor systemBlueColor];
      id v49 = [v48 CGColor];
      double v50 = [v5 view];
      v51 = [v50 layer];
      [v51 setBorderColor:v49];

      double v52 = [v5 view];
      double v53 = [v52 layer];
      [v53 setBorderWidth:1.0];

      id v54 = +[UIColor systemRedColor];
      id v55 = [v54 CGColor];
      double v56 = [v5 platterView];
      v57 = [v56 actionGroupView];
      v58 = [v57 layer];
      [v58 setBorderColor:v55];

      id v59 = [v5 platterView];
      v60 = [v59 actionGroupView];
      double v61 = [v60 layer];
      [v61 setBorderWidth:1.0];

      id v62 = +[UIColor systemYellowColor];
      id v63 = [v62 CGColor];
      double v64 = [v5 platterView];
      double v65 = [v64 clippingContentView];
      double v66 = [v65 layer];
      [v66 setBorderColor:v63];

      double v67 = [v5 platterView];
      double v68 = [v67 clippingContentView];
      v69 = [v68 layer];
      [v69 setBorderWidth:1.0];
    }
    double v70 = +[WFBannerPrototypeSettings sharedSettings];
    unsigned int v71 = [v70 bannerFramesEnabled];

    if (v71)
    {
      double v72 = [(WFBannerViewController *)self dialogDescriptionLabel];

      if (v72)
      {
        dialogDescriptionLabel = [(WFBannerViewController *)self materialView];
        double v74 = [(WFBannerViewController *)self dialogDescriptionLabel];
        [dialogDescriptionLabel bringSubviewToFront:v74];
      }
      else
      {
        id v75 = objc_alloc((Class)UILabel);
        double v76 = [(WFBannerViewController *)self materialView];
        [v76 frame];
        double v78 = [(UILabel *)[v75 initWithFrame:CGRectMake(40.0, 0.0, v77 + -80.0, 14.0)]];

        [(UILabel *)v78 setAutoresizingMask:2];
        double v79 = +[UIColor labelColor];
        [(UILabel *)v78 setTextColor:v79];

        v80 = +[UIFont systemFontOfSize:8.0 weight:UIFontWeightSemibold];
        [(UILabel *)v78 setFont:v80];

        [(UILabel *)v78 setTextAlignment:1];
        v81 = [(WFBannerViewController *)self materialView];
        [v81 addSubview:v78];

        dialogDescriptionLabel = self->_dialogDescriptionLabel;
        self->_dialogDescriptionLabel = v78;
      }

      unsigned int v82 = [(WFBannerViewController *)self dialogDescriptionLabel];
      id v83 = [v5 description];
      [v82 setText:v83];
    }
    id v84 = v5;
    if (v84)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_initWeak(&location, self);
        v85[0] = _NSConcreteStackBlock;
        v85[1] = 3221225472;
        v85[2] = sub_10001297C;
        v85[3] = &unk_100038BE8;
        objc_copyWeak(&v86, &location);
        [v84 setResetIdleTimerSuppressionBlock:v85];
        objc_destroyWeak(&v86);
        objc_destroyWeak(&location);
      }
    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setRootModalViewController:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_rootModalViewController, a3);
  if (!v5)
  {
    dispatch_time_t v6 = dispatch_time(0, 300000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100012CE0;
    block[3] = &unk_100038C80;
    void block[4] = self;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (NSString)description
{
  unint64_t v3 = [(WFBannerViewController *)self dismissalPhase];
  if (v3 > 2) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = (uint64_t)*(&off_100038B38 + v3);
  }
  v11.receiver = self;
  v11.super_class = (Class)WFBannerViewController;
  id v5 = [(WFBannerViewController *)&v11 description];
  dispatch_time_t v6 = [(WFBannerViewController *)self embeddedPlatter];
  CGAffineTransform v7 = [(WFBannerViewController *)self presentedViewController];
  double v8 = [(WFBannerViewController *)self queuedStatusPlatter];
  unsigned int v9 = +[NSString stringWithFormat:@"<%@, embedded platter: %@, presented VC: %@, queuedStatusPlatter: %@, dismissalPhase: %@>", v5, v6, v7, v8, v4];

  return (NSString *)v9;
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v4 = [(WFBannerViewController *)self localIdleTimer];
  [v4 cancel];

  id v5 = [(WFBannerViewController *)self systemIdleTimerOverrideAssertion];
  [v5 invalidate];
}

- (void)viewWillLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)WFBannerViewController;
  [(WFBannerViewController *)&v13 viewWillLayoutSubviews];
  unint64_t v3 = [(WFBannerViewController *)self containerView];
  [v3 frame];
  BOOL v6 = v5 == CGPointZero.y && v4 == CGPointZero.x;

  if (v6 == [(WFBannerViewController *)self bannerIsFullScreen])
  {
    CGAffineTransform v7 = [(WFBannerViewController *)self containerView];
    double v8 = v7;
    if (v7) {
      [v7 transform];
    }
    else {
      memset(&t1, 0, sizeof(t1));
    }
    long long v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v11.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v11.c = v9;
    *(_OWORD *)&v11.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    BOOL v10 = CGAffineTransformEqualToTransform(&t1, &v11);

    if (v10) {
      [(WFBannerViewController *)self updateContainerViewFrameAnimated:0];
    }
  }
  [(WFBannerViewController *)self bannerSize];
  -[WFBannerViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  [(WFBannerViewController *)self layoutEmbeddedPlatter];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)WFBannerViewController;
  [(WFBannerViewController *)&v3 viewDidLoad];
  [(WFBannerViewController *)self beginObservingKeyboard];
}

- (void)viewIsAppearing:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFBannerViewController;
  [(WFBannerViewController *)&v6 viewIsAppearing:a3];
  [(WFBannerViewController *)self setViewIsAppearingCalled:1];
  double v4 = [(WFBannerViewController *)self viewIsAppearingHandler];

  if (v4)
  {
    double v5 = [(WFBannerViewController *)self viewIsAppearingHandler];
    v5[2]();
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v23.receiver = self;
  v23.super_class = (Class)WFBannerViewController;
  [(WFBannerViewController *)&v23 viewWillAppear:a3];
  [(WFBannerViewController *)self setViewWillAppearCalled:1];
  [(WFBannerViewController *)self resetLocalIdleTimer];
  [(WFBannerViewController *)self bannerSize];
  -[WFBannerViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  double v4 = +[WFBannerPrototypeSettings sharedSettings];
  unsigned int v5 = [v4 bannerFramesEnabled];

  if (v5)
  {
    objc_super v6 = [(WFBannerViewController *)self view];
    CGAffineTransform v7 = [v6 window];
    double v8 = [v7 layer];
    long long v9 = +[UIColor systemGreenColor];
    id v10 = [v9 colorWithAlphaComponent:0.9];
    [v8 setBorderColor:[v10 CGColor]];

    CGAffineTransform v11 = [(WFBannerViewController *)self view];
    double v12 = [v11 window];
    objc_super v13 = [v12 layer];
    [v13 setBorderWidth:2.0];

    double v14 = [(WFBannerViewController *)self view];
    double v15 = [v14 window];
    id v16 = +[WFDevice currentDevice];
    [v16 screenCornerRadius];
    [v15 _setContinuousCornerRadius:];

    dispatch_time_t v17 = [(WFBannerViewController *)self containerView];
    id v18 = [v17 layer];
    double v19 = +[UIColor systemOrangeColor];
    id v20 = [v19 colorWithAlphaComponent:0.9];
    [v18 setBorderColor:[v20 CGColor]];

    objc_super v21 = [(WFBannerViewController *)self containerView];
    BOOL v22 = [v21 layer];
    [v22 setBorderWidth:1.0];
  }
}

- (void)loadView
{
  v10.receiver = self;
  v10.super_class = (Class)WFBannerViewController;
  [(WFBannerViewController *)&v10 loadView];
  objc_super v3 = objc_alloc_init(WFTouchCapturingView);
  objc_initWeak(&location, self);
  double v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  objc_super v6 = sub_1000133A4;
  CGAffineTransform v7 = &unk_100038BE8;
  objc_copyWeak(&v8, &location);
  [(WFTouchCapturingView *)v3 setTouchCapturedHandler:&v4];
  -[WFBannerViewController setView:](self, "setView:", v3, v4, v5, v6, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  objc_super v3 = [(WFBannerViewController *)self systemIdleTimerOverrideAssertion];
  [v3 invalidate];

  [(WFBannerViewController *)self stopObservingKeyboard];
  double v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:WFBannerShouldUpdateHomeGestureOwnershipNotification object:0];

  v5.receiver = self;
  v5.super_class = (Class)WFBannerViewController;
  [(WFBannerViewController *)&v5 dealloc];
}

- (WFBannerViewController)initWithDelegate:(id)a3 associatedRunningContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFBannerViewController;
  id v8 = [(WFBannerViewController *)&v15 initWithNibName:0 bundle:0];
  long long v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_associatedRunningContext, a4);
    objc_storeWeak((id *)&v9->_delegate, v6);
    uint64_t v10 = +[BNBannerSource bannerSourceForDestination:0 forRequesterIdentifier:VCBundleIdentifierShortcutsUI];
    bannerSource = v9->_bannerSource;
    v9->_bannerSource = (BNBannerSource *)v10;

    [(BNBannerSource *)v9->_bannerSource setDelegate:v9];
    v9->_viewIsAppearingCalled = 0;
    v9->_viewWillAppearCalled = 0;
    double v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v9 selector:"updateHomeGestureOwnership" name:WFBannerShouldUpdateHomeGestureOwnershipNotification object:0];

    objc_super v13 = v9;
  }

  return v9;
}

+ (id)requestIdentifierForContext:(id)a3
{
  objc_super v3 = [a3 identifier];
  double v4 = [v3 stringByAppendingString:@".WFBannerViewController"];

  return v4;
}

@end