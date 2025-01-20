@interface FCCCControlCenterModule
- (BOOL)_canShowWhileLocked;
- (BOOL)expandsGridSizeClassesForAccessibility;
- (BOOL)providesOwnPlatter;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)shouldExpandModuleOnTouch:(id)a3;
- (BOOL)shouldPerformHoverInteraction;
- (CGRect)_activityPickerExpandedFrameForBounds:(CGRect)a3;
- (CGSize)_preferredExpandedContentSize;
- (FCCCControlCenterModule)initWithNibName:(id)a3 bundle:(id)a4;
- (double)preferredExpandedContentHeight;
- (id)_activityManagerQueue;
- (unint64_t)supportedGridSizeClasses;
- (void)_invalidateAndAnimateViewLayoutIfAppropriate;
- (void)_invalidatePreferredExpandedContentSize;
- (void)_updateActiveActivity:(id)a3;
- (void)_updateBackgroundContinuousCornerRadius;
- (void)_updatePreviouslyActiveActivity:(id)a3;
- (void)_updateSuggestedActivity:(id)a3;
- (void)activeActivityDidChangeForManager:(id)a3;
- (void)activityManager:(id)a3 suggestedActivityDidChangeForLocation:(int64_t)a4;
- (void)availableActivitiesDidChangeForManager:(id)a3;
- (void)didTransitionToExpandedContentMode:(BOOL)a3;
- (void)handleTap:(id)a3;
- (void)moduleViewController:(id)a3 initialUseView:(id)a4;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setCompactContinuousCornerRadius:(double)a3;
- (void)setContentMetrics:(id)a3;
- (void)setContentModuleContext:(id)a3;
- (void)suggestedActivityDidChangeForManager:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToExpandedContentMode:(BOOL)a3;
@end

@implementation FCCCControlCenterModule

- (FCCCControlCenterModule)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)FCCCControlCenterModule;
  v4 = [(FCCCControlCenterModule *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    uint64_t v5 = +[FCActivityManager sharedActivityManager];
    activityManager = v4->_activityManager;
    v4->_activityManager = (FCActivityManager *)v5;

    [(FCActivityManager *)v4->_activityManager addObserver:v4];
    [(FCCCControlCenterModule *)v4 activeActivityDidChangeForManager:v4->_activityManager];
    [(FCCCControlCenterModule *)v4 activityManager:v4->_activityManager suggestedActivityDidChangeForLocation:0];
  }
  return v4;
}

- (void)viewDidLoad
{
  v31.receiver = self;
  v31.super_class = (Class)FCCCControlCenterModule;
  [(FCCCControlCenterModule *)&v31 viewDidLoad];
  v3 = [(FCCCControlCenterModule *)self view];
  v4 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleTap:"];
  tapGesture = self->_tapGesture;
  self->_tapGesture = v4;

  [v3 addGestureRecognizer:self->_tapGesture];
  [(UITapGestureRecognizer *)self->_tapGesture setEnabled:self->_expanded];
  id v6 = objc_alloc((Class)UIView);
  [v3 bounds];
  v7 = (UIView *)objc_msgSend(v6, "initWithFrame:");
  moduleContainerView = self->_moduleContainerView;
  self->_moduleContainerView = v7;

  [(UIView *)self->_moduleContainerView setAutoresizingMask:18];
  [v3 addSubview:self->_moduleContainerView];
  v9 = +[CCUIControlCenterMaterialView controlCenterModuleBackgroundMaterial];
  backgroundView = self->_backgroundView;
  self->_backgroundView = v9;

  v11 = self->_backgroundView;
  [(UIView *)self->_moduleContainerView bounds];
  -[UIView setFrame:](v11, "setFrame:");
  [(UIView *)self->_backgroundView setAutoresizingMask:18];
  [(UIView *)self->_backgroundView _setContinuousCornerRadius:self->_compactContinuousCornerRadius];
  [(UIView *)self->_moduleContainerView insertSubview:self->_backgroundView atIndex:0];
  v12 = objc_alloc_init(FCCCModuleViewController);
  moduleViewController = self->_moduleViewController;
  self->_moduleViewController = v12;

  [(FCCCModuleViewController *)self->_moduleViewController setAdjustsFontForContentSizeCategory:1];
  [(FCCCModuleViewController *)self->_moduleViewController setDelegate:self];
  [(FCCCControlCenterModule *)self addChildViewController:self->_moduleViewController];
  [(FCCCModuleViewController *)self->_moduleViewController didMoveToParentViewController:self];
  [(FCCCModuleViewController *)self->_moduleViewController setContentMetrics:self->_contentMetrics];
  objc_initWeak(&location, self);
  v14 = self->_moduleViewController;
  v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472;
  v27 = sub_4F94;
  v28 = &unk_103D0;
  objc_copyWeak(&v29, &location);
  v15 = +[UIAction actionWithHandler:&v25];
  -[FCCCModuleViewController addButtonAction:](v14, "addButtonAction:", v15, v25, v26, v27, v28);

  v16 = [(FCCCModuleViewController *)self->_moduleViewController view];
  [v16 setAccessibilityIdentifier:@"focus-module"];
  [v3 bounds];
  objc_msgSend(v16, "setFrame:");
  [v16 setAutoresizingMask:18];
  [(UIView *)self->_moduleContainerView insertSubview:v16 aboveSubview:self->_backgroundView];
  v17 = (FCUIActivityPickerViewController *)objc_alloc_init((Class)FCUIActivityPickerViewController);
  activityPickerViewController = self->_activityPickerViewController;
  self->_activityPickerViewController = v17;

  v19 = self->_activityPickerViewController;
  v20 = +[UIDevice currentDevice];
  -[FCUIActivityPickerViewController setFooterPinnedToBottom:](v19, "setFooterPinnedToBottom:", [v20 userInterfaceIdiom] == 0);

  [(FCCCControlCenterModule *)self addChildViewController:self->_activityPickerViewController];
  [(FCUIActivityPickerViewController *)self->_activityPickerViewController didMoveToParentViewController:self];
  v21 = [(FCUIActivityPickerViewController *)self->_activityPickerViewController view];
  [v3 bounds];
  objc_msgSend(v21, "setFrame:");
  [v3 addSubview:v21];
  [v21 setAlpha:0.0];
  v22 = self;
  v32 = v22;
  v23 = +[NSArray arrayWithObjects:&v32 count:1];
  id v24 = [(FCCCControlCenterModule *)self registerForTraitChanges:v23 withHandler:&stru_10410];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

- (void)viewWillLayoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)FCCCControlCenterModule;
  [(FCCCControlCenterModule *)&v20 viewWillLayoutSubviews];
  if (self->_expanded)
  {
    v3 = [(FCCCControlCenterModule *)self view];
    [v3 bounds];
    -[FCCCControlCenterModule _activityPickerExpandedFrameForBounds:](self, "_activityPickerExpandedFrameForBounds:");
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    v12 = [(FCUIActivityPickerViewController *)self->_activityPickerViewController view];
    -[FCActivityDescribing setFrame:](v12, "setFrame:", v5, v7, v9, v11);
  }
  else
  {
    v13 = FCUILogModule;
    if (os_log_type_enabled(FCUILogModule, OS_LOG_TYPE_DEFAULT))
    {
      activeActivity = self->_activeActivity;
      *(_DWORD *)buf = 138543362;
      v22 = activeActivity;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Updating module VC with active activity: %{public}@", buf, 0xCu);
    }
    [(FCCCModuleViewController *)self->_moduleViewController setActiveActivity:self->_activeActivity];
    previouslyActiveActivity = self->_previouslyActiveActivity;
    if (!previouslyActiveActivity) {
      previouslyActiveActivity = self->_suggestedActivity;
    }
    v12 = previouslyActiveActivity;
    v16 = [(FCCCModuleViewController *)self->_moduleViewController suggestedActivity];
    char v17 = BSEqualObjects();

    if ((v17 & 1) == 0)
    {
      v18 = FCUILogModule;
      if (os_log_type_enabled(FCUILogModule, OS_LOG_TYPE_DEFAULT))
      {
        if (v12 == self->_previouslyActiveActivity) {
          CFStringRef v19 = @"previously active";
        }
        else {
          CFStringRef v19 = @"suggested";
        }
        *(_DWORD *)buf = 138543618;
        v22 = (void *)v19;
        __int16 v23 = 2114;
        id v24 = v12;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Updating module VC with %{public}@ activity: %{public}@", buf, 0x16u);
      }
      [(FCCCModuleViewController *)self->_moduleViewController setSuggestedActivity:v12];
    }
  }
}

- (void)viewDidLayoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)FCCCControlCenterModule;
  [(FCCCControlCenterModule *)&v11 viewDidLayoutSubviews];
  [(UIView *)self->_moduleContainerView frame];
  if (!self->_expanded)
  {
    CGFloat v7 = v3;
    CGFloat v8 = v4;
    CGFloat v9 = v5;
    CGFloat v10 = v6;
    if (!CGRectIsEmpty(*(CGRect *)&v3))
    {
      self->_initialSourceViewFrame.origin.x = v7;
      self->_initialSourceViewFrame.origin.y = v8;
      self->_initialSourceViewFrame.size.width = v9;
      self->_initialSourceViewFrame.size.height = v10;
    }
  }
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FCCCControlCenterModule;
  [(FCCCControlCenterModule *)&v5 viewWillAppear:a3];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_55CC;
  v4[3] = &unk_10438;
  v4[4] = self;
  +[UIView performWithoutAnimation:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FCCCControlCenterModule;
  [(FCCCControlCenterModule *)&v5 viewDidAppear:a3];
  if (self->_hasActiveSuggestion && !self->_previouslyActiveActivity)
  {
    double v4 = [(FCActivityManager *)self->_activityManager suggestedActivityFeedbackReceiver];
    [v4 userDidSeeSuggestedActivity:self->_suggestedActivity location:0];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FCCCControlCenterModule;
  [(FCCCControlCenterModule *)&v5 viewDidDisappear:a3];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_5710;
  v4[3] = &unk_10438;
  v4[4] = self;
  +[UIView performWithoutAnimation:v4];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)FCCCControlCenterModule;
  -[FCCCControlCenterModule viewWillTransitionToSize:withTransitionCoordinator:](&v13, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_584C;
  v9[3] = &unk_104B0;
  objc_copyWeak(v11, &location);
  v9[4] = self;
  v11[1] = *(id *)&width;
  v11[2] = *(id *)&height;
  id v8 = v7;
  id v10 = v8;
  [v8 animateAlongsideTransition:v9 completion:0];

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  double v4 = (FCUIActivityPickerViewController *)a3;
  if (self->_expanded && self->_activityPickerViewController == v4)
  {
    id v7 = v4;
    objc_super v5 = +[UIDevice currentDevice];
    id v6 = [v5 userInterfaceIdiom];

    double v4 = v7;
    if (v6)
    {
      [(FCCCControlCenterModule *)self _invalidatePreferredExpandedContentSize];
      [(FCCCControlCenterModule *)self _preferredExpandedContentSize];
      -[FCCCControlCenterModule setPreferredContentSize:](self, "setPreferredContentSize:");
      double v4 = v7;
    }
  }
}

- (double)preferredExpandedContentHeight
{
  [(FCCCControlCenterModule *)self _preferredExpandedContentSize];
  return v2;
}

- (void)setCompactContinuousCornerRadius:(double)a3
{
  if (self->_compactContinuousCornerRadius != a3)
  {
    self->_compactContinuousCornerRadius = a3;
    [(FCCCControlCenterModule *)self _updateBackgroundContinuousCornerRadius];
  }
}

- (void)setContentMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_contentMetrics, a3);
  id v5 = a3;
  [(FCCCModuleViewController *)self->_moduleViewController setContentMetrics:v5];
}

- (BOOL)providesOwnPlatter
{
  return 1;
}

- (BOOL)shouldPerformHoverInteraction
{
  return 0;
}

- (BOOL)shouldExpandModuleOnTouch:(id)a3
{
  return 1;
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  BOOL v3 = a3;
  self->_BOOL expanded = a3;
  [(FCCCModuleViewController *)self->_moduleViewController beginAppearanceTransition:a3 animated:+[UIView _isInAnimationBlockWithAnimationsEnabled]];
  if (objc_opt_respondsToSelector())
  {
    moduleViewController = self->_moduleViewController;
    BOOL expanded = self->_expanded;
    id v7 = [(FCCCControlCenterModule *)self transitionCoordinator];
    [(FCCCModuleViewController *)moduleViewController setExpanded:expanded withTransitionCoordinator:v7];
  }
  [(FCUIActivityPickerViewController *)self->_activityPickerViewController beginAppearanceTransition:v3 animated:+[UIView _isInAnimationBlockWithAnimationsEnabled]];
  if (self->_expanded)
  {
    contentModuleContext = self->_contentModuleContext;
    [(CCUIContentModuleContext *)contentModuleContext setHomeGestureDismissalAllowed:0];
  }
}

- (void)didTransitionToExpandedContentMode:(BOOL)a3
{
  BOOL v3 = a3;
  [(FCCCModuleViewController *)self->_moduleViewController endAppearanceTransition];
  [(FCUIActivityPickerViewController *)self->_activityPickerViewController endAppearanceTransition];
  [(UITapGestureRecognizer *)self->_tapGesture setEnabled:v3];
  if (v3)
  {
    contentModuleContext = self->_contentModuleContext;
    [(CCUIContentModuleContext *)contentModuleContext setHomeGestureDismissalAllowed:1];
  }
  else
  {
    [(FCCCControlCenterModule *)self _invalidatePreferredExpandedContentSize];
  }
}

- (unint64_t)supportedGridSizeClasses
{
  return 4;
}

- (BOOL)expandsGridSizeClassesForAccessibility
{
  return 1;
}

- (void)setContentModuleContext:(id)a3
{
}

- (void)availableActivitiesDidChangeForManager:(id)a3
{
  id v4 = a3;
  [(FCCCControlCenterModule *)self activeActivityDidChangeForManager:v4];
  [(FCCCControlCenterModule *)self suggestedActivityDidChangeForManager:v4];
}

- (void)activeActivityDidChangeForManager:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(FCCCControlCenterModule *)self _activityManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_61C8;
  block[3] = &unk_10500;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)suggestedActivityDidChangeForManager:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(FCCCControlCenterModule *)self _activityManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_637C;
  block[3] = &unk_10500;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)activityManager:(id)a3 suggestedActivityDidChangeForLocation:(int64_t)a4
{
  id v6 = a3;
  if (!a4)
  {
    objc_initWeak(&location, self);
    id v7 = self->_previouslyActiveActivity;
    id v8 = [(FCCCControlCenterModule *)self _activityManagerQueue];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_6668;
    v10[3] = &unk_10550;
    objc_copyWeak(&v13, &location);
    id v11 = v6;
    v12 = v7;
    id v9 = v7;
    dispatch_async(v8, v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (void)moduleViewController:(id)a3 initialUseView:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = objc_alloc((Class)FCUIActivityBaubleDescription);
    id v8 = +[UIColor systemIndigoColor];
    id v20 = [v7 initWithSystemImageName:@"moon.fill" tintColor:v8];
    v29[0] = v20;
    id v9 = objc_alloc((Class)FCUIActivityBaubleDescription);
    id v10 = +[UIColor systemMintColor];
    id v11 = [v9 initWithSystemImageName:@"bed.double.fill" tintColor:v10];
    v29[1] = v11;
    id v12 = objc_alloc((Class)FCUIActivityBaubleDescription);
    id v13 = +[UIColor systemTealColor];
    id v14 = [v12 initWithSystemImageName:@"person.lanyardcard.fill" tintColor:v13];
    v29[2] = v14;
    v15 = +[NSArray arrayWithObjects:v29 count:3];

    id v16 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(&off_10A08, "count"));
    objc_initWeak(&location, self);
    char v17 = [(FCCCControlCenterModule *)self _activityManagerQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_6A64;
    block[3] = &unk_105A0;
    objc_copyWeak(&v27, &location);
    __int16 v23 = &off_10A08;
    id v24 = v15;
    id v25 = v16;
    id v26 = v6;
    id v18 = v16;
    id v19 = v15;
    dispatch_async(v17, block);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
}

- (id)_activityManagerQueue
{
  double v2 = self;
  objc_sync_enter(v2);
  if (!v2->_activityManagerQueue)
  {
    BOOL v3 = +[NSBundle bundleForClass:objc_opt_class()];
    id v4 = [v3 bundleIdentifier];
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    id v7 = [v4 stringByAppendingFormat:@"%@.activityManager", v6];
    uint64_t SerialWithQoS = BSDispatchQueueCreateSerialWithQoS();
    activityManagerQueue = v2->_activityManagerQueue;
    v2->_activityManagerQueue = (OS_dispatch_queue *)SerialWithQoS;
  }
  objc_sync_exit(v2);

  id v10 = v2->_activityManagerQueue;

  return v10;
}

- (CGSize)_preferredExpandedContentSize
{
  p_preferredExpandedContentSize = &self->_preferredExpandedContentSize;
  if (self->_preferredExpandedContentSize.width == 0.0 && self->_preferredExpandedContentSize.height == 0.0)
  {
    [(FCCCControlCenterModule *)self loadViewIfNeeded];
    CCUIReferenceScreenBounds();
    p_preferredExpandedContentSize->double width = v4;
    p_preferredExpandedContentSize->double height = v5;
    id v6 = +[UIDevice currentDevice];
    id v7 = (char *)[v6 userInterfaceIdiom];

    if (v7 == (unsigned char *)&dword_0 + 1)
    {
      CCUIDefaultExpandedContentModuleWidth();
      double v9 = v8;
      id v10 = [(FCUIActivityPickerViewController *)self->_activityPickerViewController view];
      id v11 = [(FCCCControlCenterModule *)self parentViewController];
      id v12 = [v11 view];
      [v12 bounds];
      objc_msgSend(v10, "sizeThatFits:", v9, CGRectGetHeight(v18));
      UISizeRoundToScale();
      p_preferredExpandedContentSize->double width = v13;
      p_preferredExpandedContentSize->double height = v14;
    }
  }
  double width = p_preferredExpandedContentSize->width;
  double height = p_preferredExpandedContentSize->height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_invalidatePreferredExpandedContentSize
{
  self->_preferredExpandedContentSize = CGSizeZero;
}

- (CGRect)_activityPickerExpandedFrameForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v7 = +[UIDevice currentDevice];
  if (![v7 userInterfaceIdiom])
  {
    v12.origin.CGFloat x = x;
    v12.origin.CGFloat y = y;
    v12.size.CGFloat width = width;
    v12.size.CGFloat height = height;
    CGRect v13 = CGRectInset(v12, 44.0, 0.0);
    CGFloat x = v13.origin.x;
    CGFloat y = v13.origin.y;
    CGFloat width = v13.size.width;
    CGFloat height = v13.size.height;
  }

  double v8 = x;
  double v9 = y;
  double v10 = width;
  double v11 = height;
  result.size.CGFloat height = v11;
  result.size.CGFloat width = v10;
  result.origin.CGFloat y = v9;
  result.origin.CGFloat x = v8;
  return result;
}

- (void)_invalidateAndAnimateViewLayoutIfAppropriate
{
  BOOL v3 = [(FCCCControlCenterModule *)self viewIfLoaded];
  [v3 setNeedsLayout];

  if ([(FCCCControlCenterModule *)self isViewLoaded]
    && [(FCCCControlCenterModule *)self bs_isAppearingOrAppeared])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_6FDC;
    v5[3] = &unk_10438;
    v5[4] = self;
    CGFloat v4 = objc_retainBlock(v5);
    if (self->_expanded) {
      +[UIView performWithoutAnimation:v4];
    }
    else {
      +[UIView fcui_animateWithSelectionParameters:v4 completion:0];
    }
  }
}

- (void)_updateActiveActivity:(id)a3
{
  id v5 = a3;
  p_activeActivitCGFloat y = &self->_activeActivity;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_activeActivity, a3);
    id v7 = FCUILogModule;
    if (os_log_type_enabled(FCUILogModule, OS_LOG_TYPE_DEFAULT))
    {
      double v8 = *p_activeActivity;
      int v10 = 138543362;
      double v11 = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Updated active activity: %{public}@", (uint8_t *)&v10, 0xCu);
    }
    if (*p_activeActivity) {
      -[FCCCControlCenterModule _updatePreviouslyActiveActivity:](self, "_updatePreviouslyActiveActivity:");
    }
    if (self->_hasActiveSuggestion && *p_activeActivity && (BSEqualObjects() & 1) == 0)
    {
      double v9 = [(FCActivityManager *)self->_activityManager suggestedActivityFeedbackReceiver];
      [v9 userDidRejectSuggestedActivity:self->_suggestedActivity location:0];
    }
    [(FCCCControlCenterModule *)self _invalidateAndAnimateViewLayoutIfAppropriate];
  }
}

- (void)_updatePreviouslyActiveActivity:(id)a3
{
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_previouslyActiveActivity, a3);
    id v6 = FCUILogModule;
    if (os_log_type_enabled(FCUILogModule, OS_LOG_TYPE_DEFAULT))
    {
      previouslyActiveActivitCGFloat y = self->_previouslyActiveActivity;
      int v8 = 138543362;
      double v9 = previouslyActiveActivity;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Updated previously active activity: %{public}@", (uint8_t *)&v8, 0xCu);
    }
    if (!self->_activeActivity) {
      [(FCCCControlCenterModule *)self _invalidateAndAnimateViewLayoutIfAppropriate];
    }
  }
}

- (void)_updateSuggestedActivity:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_suggestedActivity, a3);
  id v6 = FCUILogModule;
  if (os_log_type_enabled(FCUILogModule, OS_LOG_TYPE_DEFAULT))
  {
    suggestedActivitCGFloat y = self->_suggestedActivity;
    int v8 = 138543362;
    double v9 = suggestedActivity;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Updated suggested activity: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  if (!self->_activeActivity && !self->_previouslyActiveActivity) {
    [(FCCCControlCenterModule *)self _invalidateAndAnimateViewLayoutIfAppropriate];
  }
}

- (void)_updateBackgroundContinuousCornerRadius
{
  if (self->_expanded) {
    CCUIExpandedModuleContinuousCornerRadius();
  }
  else {
    double compactContinuousCornerRadius = self->_compactContinuousCornerRadius;
  }
  backgroundView = self->_backgroundView;

  [(UIView *)backgroundView _setContinuousCornerRadius:compactContinuousCornerRadius];
}

- (void)handleTap:(id)a3
{
  if (self->_tapGesture == a3) {
    [(CCUIContentModuleContext *)self->_contentModuleContext dismissModule];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentMetrics, 0);
  objc_storeStrong((id *)&self->_activityManagerQueue, 0);
  objc_storeStrong((id *)&self->_suggestedActivity, 0);
  objc_storeStrong((id *)&self->_previouslyActiveActivity, 0);
  objc_storeStrong((id *)&self->_activeActivity, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_activityPickerViewController, 0);
  objc_storeStrong((id *)&self->_moduleViewController, 0);
  objc_storeStrong((id *)&self->_contentModuleContext, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_moduleContainerView, 0);

  objc_storeStrong((id *)&self->_activityManager, 0);
}

@end