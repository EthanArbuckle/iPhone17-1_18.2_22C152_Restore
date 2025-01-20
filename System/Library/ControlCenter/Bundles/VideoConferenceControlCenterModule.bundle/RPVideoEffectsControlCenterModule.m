@interface RPVideoEffectsControlCenterModule
- (BOOL)_canShowWhileLocked;
- (BOOL)_isVideoModuleEnabled;
- (BOOL)providesOwnPlatter;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)shouldBeginTransitionToExpandedContentModule;
- (BOOL)shouldExpandModuleOnTouch:(id)a3;
- (BOOL)shouldLoadFromSensor;
- (BOOL)shouldPerformHoverInteraction;
- (CGRect)_activityPickerExpandedFrameForBounds:(CGRect)a3;
- (CGSize)_preferredExpandedContentSize;
- (RPVideoEffectsControlCenterModule)initWithNibName:(id)a3 bundle:(id)a4;
- (double)preferredExpandedContentHeight;
- (double)preferredExpandedContentWidth;
- (id)_activityManagerQueue;
- (id)_cameraIndicatorImage;
- (id)_cameraOffIndicatorImage;
- (id)_fontForTitleLabel;
- (id)_imageSymbolConfiguration;
- (void)_expandActivityPicker;
- (void)_invalidateAndAnimateViewLayoutIfAppropriate;
- (void)_invalidatePreferredExpandedContentSize;
- (void)_setupModuleImageView;
- (void)_setupVideoImageTint;
- (void)_updateActiveActivities;
- (void)_updateActiveActivity:(id)a3;
- (void)_updateCameraState;
- (void)_updateCameraStateControlCenter;
- (void)_updateModuleImageView;
- (void)_updatePreviouslyActiveActivity:(id)a3;
- (void)_updateSuggestedActivity:(id)a3;
- (void)_updateVideoImageViewWithCameraOn:(BOOL)a3;
- (void)activeActivityDidChangeForManager:(id)a3;
- (void)activityManager:(id)a3 suggestedActivityDidChangeForLocation:(int64_t)a4;
- (void)dealloc;
- (void)didTransitionToExpandedContentMode:(BOOL)a3;
- (void)handleTap:(id)a3;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setContentModuleContext:(id)a3;
- (void)setShouldLoadFromSensor:(BOOL)a3;
- (void)updateCameraStateExternal;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToExpandedContentMode:(BOOL)a3;
@end

@implementation RPVideoEffectsControlCenterModule

- (RPVideoEffectsControlCenterModule)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)RPVideoEffectsControlCenterModule;
  v4 = [(RPVideoEffectsControlCenterModule *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    uint64_t v5 = +[RPCCActivityManager sharedActivityManager];
    activityManager = v4->_activityManager;
    v4->_activityManager = (RPCCActivityManager *)v5;

    [(RPCCActivityManager *)v4->_activityManager addObserver:v4];
    [(RPVideoEffectsControlCenterModule *)v4 activeActivityDidChangeForManager:v4->_activityManager];
    [(RPVideoEffectsControlCenterModule *)v4 activityManager:v4->_activityManager suggestedActivityDidChangeForLocation:0];
  }
  return v4;
}

- (void)dealloc
{
  [(RPVideoEffectsControlCenterModule *)self unregisterForTraitChanges:self->_traitRegistration];
  v3.receiver = self;
  v3.super_class = (Class)RPVideoEffectsControlCenterModule;
  [(RPVideoEffectsControlCenterModule *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v29.receiver = self;
  v29.super_class = (Class)RPVideoEffectsControlCenterModule;
  [(RPVideoEffectsControlCenterModule *)&v29 viewDidLoad];
  objc_super v3 = [(RPVideoEffectsControlCenterModule *)self view];
  v4 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleTap:"];
  tapGesture = self->_tapGesture;
  self->_tapGesture = v4;

  self->_shouldIlluminate = 0;
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
  v12 = self->_backgroundView;
  CCUICompactModuleContinuousCornerRadius();
  -[UIView _setContinuousCornerRadius:](v12, "_setContinuousCornerRadius:");
  [(UIView *)self->_moduleContainerView insertSubview:self->_backgroundView atIndex:0];
  v13 = objc_alloc_init(RPCCModuleViewController);
  moduleViewController = self->_moduleViewController;
  self->_moduleViewController = v13;

  [(RPCCModuleViewController *)self->_moduleViewController setAdjustsFontForContentSizeCategory:1];
  [(RPCCModuleViewController *)self->_moduleViewController setDelegate:self];
  [(RPVideoEffectsControlCenterModule *)self addChildViewController:self->_moduleViewController];
  [(RPCCModuleViewController *)self->_moduleViewController didMoveToParentViewController:self];
  v15 = [(RPCCModuleViewController *)self->_moduleViewController view];
  [v3 bounds];
  objc_msgSend(v15, "setFrame:");
  [v15 setAutoresizingMask:18];
  [(UIView *)self->_moduleContainerView insertSubview:v15 aboveSubview:self->_backgroundView];
  v16 = objc_alloc_init(RPCCUIActivityPickerViewController);
  activityPickerViewController = self->_activityPickerViewController;
  self->_activityPickerViewController = v16;

  v18 = self->_activityPickerViewController;
  v19 = +[UIDevice currentDevice];
  -[RPCCUIActivityPickerViewController setFooterPinnedToBottom:](v18, "setFooterPinnedToBottom:", [v19 userInterfaceIdiom] == 0);

  [(RPVideoEffectsControlCenterModule *)self addChildViewController:self->_activityPickerViewController];
  [(RPCCUIActivityPickerViewController *)self->_activityPickerViewController didMoveToParentViewController:self];
  v20 = [(RPCCUIActivityPickerViewController *)self->_activityPickerViewController view];
  [v3 bounds];
  objc_msgSend(v20, "setFrame:");
  [v3 addSubview:v20];
  [v20 setAlpha:0.0];
  objc_initWeak(&location, self);
  v21 = self;
  v30 = v21;
  v22 = +[NSArray arrayWithObjects:&v30 count:1];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_29F28;
  v26[3] = &unk_69100;
  objc_copyWeak(&v27, &location);
  v23 = [(RPVideoEffectsControlCenterModule *)self registerForTraitChanges:v22 withHandler:v26];
  traitRegistration = self->_traitRegistration;
  self->_traitRegistration = v23;

  [(RPVideoEffectsControlCenterModule *)self _setupModuleImageView];
  if (!self->_shouldLoadFromSensor)
  {
    self->_expanded = 1;
    [(UITapGestureRecognizer *)self->_tapGesture setEnabled:1];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_29FE4;
    v25[3] = &unk_68F10;
    v25[4] = self;
    +[UIView performWithoutAnimation:v25];
  }
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

- (void)viewWillLayoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)RPVideoEffectsControlCenterModule;
  [(RPVideoEffectsControlCenterModule *)&v22 viewWillLayoutSubviews];
  [(RPVideoEffectsControlCenterModule *)self _updateCameraState];
  if (objc_opt_respondsToSelector())
  {
    moduleViewController = self->_moduleViewController;
    [(RPVideoEffectsControlCenterModule *)self compactContinuousCornerRadius];
    -[RPCCModuleViewController setCompactContinuousCornerRadius:](moduleViewController, "setCompactContinuousCornerRadius:");
  }
  if (self->_expanded)
  {
    v4 = [(RPVideoEffectsControlCenterModule *)self view];
    [v4 bounds];
    -[RPVideoEffectsControlCenterModule _activityPickerExpandedFrameForBounds:](self, "_activityPickerExpandedFrameForBounds:");
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    v13 = +[UIDevice currentDevice];
    if ([v13 userInterfaceIdiom] == (char *)&dword_0 + 1)
    {
      BOOL shouldLoadFromSensor = self->_shouldLoadFromSensor;

      if (shouldLoadFromSensor) {
        double v8 = v8 + 50.0;
      }
    }
    else
    {
    }
    v21 = [(RPCCUIActivityPickerViewController *)self->_activityPickerViewController view];
    objc_msgSend(v21, "setFrame:", v6, v8, v10, v12);

    [(RPCCUIActivityPickerViewController *)self->_activityPickerViewController setContentModuleContext:self->_contentModuleContext];
  }
  else
  {
    [(RPVideoEffectsControlCenterModule *)self _updateModuleImageView];
    [(RPVideoEffectsControlCenterModule *)self _updateActiveActivities];
    [(RPVideoEffectsControlCenterModule *)self _setupVideoImageTint];
    previouslyActiveActivity = self->_previouslyActiveActivity;
    if (!previouslyActiveActivity) {
      previouslyActiveActivity = self->_suggestedActivity;
    }
    v16 = previouslyActiveActivity;
    v17 = [(RPCCModuleViewController *)self->_moduleViewController suggestedActivity];
    char v18 = BSEqualObjects();

    if ((v18 & 1) == 0)
    {
      v19 = RPCCUILogModule;
      if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEFAULT))
      {
        if (v16 == self->_previouslyActiveActivity) {
          CFStringRef v20 = @"previously active";
        }
        else {
          CFStringRef v20 = @"suggested";
        }
        *(_DWORD *)buf = 138543618;
        CFStringRef v24 = v20;
        __int16 v25 = 2114;
        v26 = v16;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Updating module VC with %{public}@ activity: %{public}@", buf, 0x16u);
      }
      [(RPCCModuleViewController *)self->_moduleViewController setSuggestedActivity:v16];
    }
  }
}

- (void)viewDidLayoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)RPVideoEffectsControlCenterModule;
  [(RPVideoEffectsControlCenterModule *)&v11 viewDidLayoutSubviews];
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
  BOOL v3 = a3;
  [(RPVideoEffectsControlCenterModule *)self setContentModuleContext:self->_contentModuleContext];
  v6.receiver = self;
  v6.super_class = (Class)RPVideoEffectsControlCenterModule;
  [(RPVideoEffectsControlCenterModule *)&v6 viewWillAppear:v3];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_2A4C4;
  v5[3] = &unk_68F10;
  v5[4] = self;
  +[UIView performWithoutAnimation:v5];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RPVideoEffectsControlCenterModule;
  [(RPVideoEffectsControlCenterModule *)&v3 viewDidAppear:a3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RPVideoEffectsControlCenterModule;
  [(RPVideoEffectsControlCenterModule *)&v5 viewDidDisappear:a3];
  [(RPCCUIActivityPickerViewController *)self->_activityPickerViewController removeVideoPreview];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_2A5F8;
  v4[3] = &unk_68F10;
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
  v13.super_class = (Class)RPVideoEffectsControlCenterModule;
  -[RPVideoEffectsControlCenterModule viewWillTransitionToSize:withTransitionCoordinator:](&v13, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_2A734;
  v9[3] = &unk_696D0;
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
  double v4 = (RPCCUIActivityPickerViewController *)a3;
  if (self->_expanded && self->_activityPickerViewController == v4)
  {
    id v7 = v4;
    objc_super v5 = +[UIDevice currentDevice];
    id v6 = [v5 userInterfaceIdiom];

    double v4 = v7;
    if (v6)
    {
      [(RPVideoEffectsControlCenterModule *)self _invalidatePreferredExpandedContentSize];
      [(RPVideoEffectsControlCenterModule *)self _preferredExpandedContentSize];
      -[RPVideoEffectsControlCenterModule setPreferredContentSize:](self, "setPreferredContentSize:");
      double v4 = v7;
    }
  }
}

- (double)preferredExpandedContentHeight
{
  [(RPVideoEffectsControlCenterModule *)self _preferredExpandedContentSize];
  double v4 = v3;
  v6.receiver = self;
  v6.super_class = (Class)RPVideoEffectsControlCenterModule;
  [(RPVideoEffectsControlCenterModule *)&v6 preferredExpandedContentHeight];
  if (v4 >= result) {
    return v4;
  }
  return result;
}

- (double)preferredExpandedContentWidth
{
  [(RPVideoEffectsControlCenterModule *)self _preferredExpandedContentSize];
  double v4 = v3;
  v6.receiver = self;
  v6.super_class = (Class)RPVideoEffectsControlCenterModule;
  [(RPVideoEffectsControlCenterModule *)&v6 preferredExpandedContentWidth];
  if (v4 >= result) {
    return v4;
  }
  return result;
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

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  return self->_isVideoModuleOn;
}

- (void)_expandActivityPicker
{
  if (self->_expanded)
  {
    [(CCUIContentModuleContext *)self->_contentModuleContext setHomeGestureDismissalAllowed:0];
    activityPickerViewController = self->_activityPickerViewController;
    contentModuleContext = self->_contentModuleContext;
    [(RPCCUIActivityPickerViewController *)activityPickerViewController setContentModuleContext:contentModuleContext];
  }
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  BOOL v3 = a3;
  self->_BOOL expanded = a3;
  [(RPCCModuleViewController *)self->_moduleViewController beginAppearanceTransition:a3 animated:+[UIView _isInAnimationBlockWithAnimationsEnabled]];
  if (objc_opt_respondsToSelector())
  {
    moduleViewController = self->_moduleViewController;
    BOOL expanded = self->_expanded;
    id v7 = [(RPVideoEffectsControlCenterModule *)self transitionCoordinator];
    [(RPCCModuleViewController *)moduleViewController setExpanded:expanded withTransitionCoordinator:v7];
  }
  [(RPCCUIActivityPickerViewController *)self->_activityPickerViewController beginAppearanceTransition:v3 animated:+[UIView _isInAnimationBlockWithAnimationsEnabled]];

  [(RPVideoEffectsControlCenterModule *)self _expandActivityPicker];
}

- (void)didTransitionToExpandedContentMode:(BOOL)a3
{
  BOOL v3 = a3;
  [(RPCCModuleViewController *)self->_moduleViewController endAppearanceTransition];
  [(RPCCUIActivityPickerViewController *)self->_activityPickerViewController endAppearanceTransition];
  [(UITapGestureRecognizer *)self->_tapGesture setEnabled:v3];
  if (v3)
  {
    contentModuleContext = self->_contentModuleContext;
    [(CCUIContentModuleContext *)contentModuleContext setHomeGestureDismissalAllowed:1];
  }
  else
  {
    [(RPVideoEffectsControlCenterModule *)self _invalidatePreferredExpandedContentSize];
  }
}

- (void)setContentModuleContext:(id)a3
{
  objc_storeStrong((id *)&self->_contentModuleContext, a3);
  id v5 = a3;
  [(RPCCActivityManager *)self->_activityManager setShouldLoadFromSensor:self->_shouldLoadFromSensor];
  [(RPCCActivityManager *)self->_activityManager setContentModuleContext:v5];
  [(RPCCUIActivityPickerViewController *)self->_activityPickerViewController setContentModuleContext:v5];
}

- (void)activeActivityDidChangeForManager:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(RPVideoEffectsControlCenterModule *)self _activityManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2AF68;
  block[3] = &unk_69230;
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
    id v8 = [(RPVideoEffectsControlCenterModule *)self _activityManagerQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_2B170;
    block[3] = &unk_69230;
    objc_copyWeak(&v12, &location);
    objc_super v11 = v7;
    id v9 = v7;
    dispatch_async(v8, block);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (id)_activityManagerQueue
{
  v2 = self;
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
  double height = self->_preferredExpandedContentSize.height;
  if (self->_preferredExpandedContentSize.width == 0.0 && height == 0.0)
  {
    [(RPVideoEffectsControlCenterModule *)self loadViewIfNeeded];
    CCUIReferenceScreenBounds();
    p_preferredExpandedContentSize->double width = v5;
    p_preferredExpandedContentSize->double height = v6;
    id v7 = +[UIDevice currentDevice];
    id v8 = (char *)[v7 userInterfaceIdiom];

    if (v8 == (unsigned char *)&dword_0 + 1)
    {
      CCUIDefaultExpandedContentModuleWidth();
      double v10 = v9;
      objc_super v11 = [(RPCCUIActivityPickerViewController *)self->_activityPickerViewController view];
      id v12 = [(RPVideoEffectsControlCenterModule *)self parentViewController];
      objc_super v13 = [v12 view];
      [v13 bounds];
      objc_msgSend(v11, "sizeThatFits:", v10, CGRectGetHeight(v18));
      UISizeRoundToScale();
      p_preferredExpandedContentSize->double width = v14;
      p_preferredExpandedContentSize->double height = v15;

      double height = p_preferredExpandedContentSize->height;
      if (self->_shouldLoadFromSensor)
      {
        double height = height + 50.0;
        p_preferredExpandedContentSize->double height = height;
      }
    }
    else
    {
      double height = p_preferredExpandedContentSize->height;
    }
  }
  double width = p_preferredExpandedContentSize->width;
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
  BOOL v3 = [(RPVideoEffectsControlCenterModule *)self viewIfLoaded];
  [v3 setNeedsLayout];

  if ([(RPVideoEffectsControlCenterModule *)self isViewLoaded]
    && [(RPVideoEffectsControlCenterModule *)self bs_isAppearingOrAppeared])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_2B5F4;
    v5[3] = &unk_68F10;
    v5[4] = self;
    id v4 = objc_retainBlock(v5);
    if (self->_expanded) {
      +[UIView performWithoutAnimation:v4];
    }
    else {
      +[UIView rpccui_animateWithSelectionParameters:v4 completion:0];
    }
  }
}

- (void)_updateActiveActivity:(id)a3
{
  p_activeActivitCGFloat y = &self->_activeActivity;
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_activeActivity, a3);
    if (*p_activeActivity) {
      -[RPVideoEffectsControlCenterModule _updatePreviouslyActiveActivity:](self, "_updatePreviouslyActiveActivity:");
    }
    if (self->_hasActiveSuggestion && *p_activeActivity) {
      BSEqualObjects();
    }
    [(RPVideoEffectsControlCenterModule *)self _invalidateAndAnimateViewLayoutIfAppropriate];
  }
}

- (void)_updatePreviouslyActiveActivity:(id)a3
{
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_previouslyActiveActivity, a3);
    id v6 = RPCCUILogModule;
    if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEFAULT))
    {
      previouslyActiveActivitCGFloat y = self->_previouslyActiveActivity;
      int v8 = 138543362;
      double v9 = previouslyActiveActivity;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Updated previously active activity: %{public}@", (uint8_t *)&v8, 0xCu);
    }
    if (!self->_activeActivity) {
      [(RPVideoEffectsControlCenterModule *)self _invalidateAndAnimateViewLayoutIfAppropriate];
    }
  }
}

- (void)_updateSuggestedActivity:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_suggestedActivity, a3);
  id v6 = RPCCUILogModule;
  if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEFAULT))
  {
    suggestedActivitCGFloat y = self->_suggestedActivity;
    int v8 = 138543362;
    double v9 = suggestedActivity;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Updated suggested activity: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  if (!self->_activeActivity && !self->_previouslyActiveActivity) {
    [(RPVideoEffectsControlCenterModule *)self _invalidateAndAnimateViewLayoutIfAppropriate];
  }
}

- (void)handleTap:(id)a3
{
  if (self->_tapGesture == a3) {
    [(CCUIContentModuleContext *)self->_contentModuleContext dismissModule];
  }
}

- (void)_updateModuleImageView
{
  BOOL v3 = [(RPVideoEffectsControlCenterModule *)self view];
  UIUserInterfaceLayoutDirection v4 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", [v3 semanticContentAttribute]);

  id v5 = [(RPVideoEffectsControlCenterModule *)self view];
  [v5 frame];
  if (v4 == UIUserInterfaceLayoutDirectionRightToLeft)
  {
    double MinX = CGRectGetMaxX(*(CGRect *)&v6) + -28.0;
    double v11 = -12.0;
  }
  else
  {
    double MinX = CGRectGetMinX(*(CGRect *)&v6);
    double v11 = 12.0;
  }
  double v12 = MinX + v11;

  videoImageView = self->_videoImageView;
  CGFloat v14 = [(RPVideoEffectsControlCenterModule *)self view];
  [v14 frame];
  -[UIImageView setFrame:](videoImageView, "setFrame:", v12, CGRectGetMidY(v22) + -9.0, 28.0, 18.0);

  CGFloat v15 = [(UIImage *)self->_videoImage imageWithRenderingMode:2];
  [(UIImageView *)self->_videoImageView setImage:v15];

  v16 = [(RPVideoEffectsControlCenterModule *)self view];
  [v16 addSubview:self->_videoImageView];

  videoOffImageView = self->_videoOffImageView;
  CGRect v18 = [(RPVideoEffectsControlCenterModule *)self view];
  [v18 frame];
  -[UIImageView setFrame:](videoOffImageView, "setFrame:", v12, CGRectGetMidY(v23) + -11.0, 28.0, 23.0);

  v19 = [(UIImage *)self->_videoOffImage imageWithRenderingMode:2];
  [(UIImageView *)self->_videoOffImageView setImage:v19];

  id v20 = [(RPVideoEffectsControlCenterModule *)self view];
  [v20 addSubview:self->_videoOffImageView];
}

- (void)_updateVideoImageViewWithCameraOn:(BOOL)a3
{
  LODWORD(v3) = a3;
  if (a3) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.0;
  }
  videoImageView = self->_videoImageView;
  if (a3) {
    double v7 = 0.0;
  }
  else {
    double v7 = 1.0;
  }
  [(UIImageView *)videoImageView setAlpha:v5];
  [(UIImageView *)self->_videoOffImageView setAlpha:v7];
  if (self->_expanded) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v3 ^ 1;
  }
  if (self->_expanded) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = v3;
  }
  [(UIImageView *)self->_videoImageView setHidden:v8];
  videoOffImageView = self->_videoOffImageView;

  [(UIImageView *)videoOffImageView setHidden:v3];
}

- (id)_cameraIndicatorImage
{
  v2 = [(RPVideoEffectsControlCenterModule *)self _imageSymbolConfiguration];
  uint64_t v3 = +[UIImage systemImageNamed:@"video.fill" withConfiguration:v2];

  return v3;
}

- (id)_cameraOffIndicatorImage
{
  v2 = [(RPVideoEffectsControlCenterModule *)self _imageSymbolConfiguration];
  uint64_t v3 = +[UIImage systemImageNamed:@"video.slash.fill" withConfiguration:v2];

  return v3;
}

- (id)_imageSymbolConfiguration
{
  v2 = [(RPVideoEffectsControlCenterModule *)self _fontForTitleLabel];
  uint64_t v3 = +[UIImageSymbolConfiguration configurationWithFont:v2 scale:3];

  return v3;
}

- (id)_fontForTitleLabel
{
  return +[UIFont systemFontOfSize:14.0 weight:UIFontWeightMedium];
}

- (void)_setupModuleImageView
{
  id v16 = +[UIImage systemImageNamed:@"video.fill"];
  uint64_t v3 = +[UIImage systemImageNamed:@"video.slash.fill"];
  v18.CGFloat height = 24.0;
  v18.CGFloat width = 38.0;
  UIGraphicsBeginImageContextWithOptions(v18, 0, 0.0);
  objc_msgSend(v16, "drawInRect:", 0.0, 0.0, 38.0, 24.0);
  UIGraphicsGetImageFromCurrentImageContext();
  UIUserInterfaceLayoutDirection v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
  expandedGlyphImage = self->_expandedGlyphImage;
  self->_expandedGlyphImage = v4;

  UIGraphicsEndImageContext();
  v19.CGFloat height = 30.0;
  v19.CGFloat width = 38.0;
  UIGraphicsBeginImageContextWithOptions(v19, 0, 0.0);
  objc_msgSend(v3, "drawInRect:", 0.0, 0.0, 38.0, 30.0);
  UIGraphicsGetImageFromCurrentImageContext();
  uint64_t v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
  expandedOffGlyphImage = self->_expandedOffGlyphImage;
  self->_expandedOffGlyphImage = v6;

  UIGraphicsEndImageContext();
  uint64_t v8 = [(RPVideoEffectsControlCenterModule *)self _cameraIndicatorImage];
  videoImage = self->_videoImage;
  self->_videoImage = v8;

  double v10 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:self->_videoImage];
  videoImageView = self->_videoImageView;
  self->_videoImageView = v10;

  [(UIImageView *)self->_videoImageView setAlpha:0.0];
  double v12 = [(RPVideoEffectsControlCenterModule *)self _cameraOffIndicatorImage];
  videoOffImage = self->_videoOffImage;
  self->_videoOffImage = v12;

  CGFloat v14 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:self->_videoOffImage];
  videoOffImageView = self->_videoOffImageView;
  self->_videoOffImageView = v14;

  [(UIImageView *)self->_videoOffImageView setAlpha:0.0];
}

- (void)_setupVideoImageTint
{
  if (self->_shouldIlluminate) {
    +[UIColor systemGreenColor];
  }
  else {
  uint64_t v3 = +[UIColor systemWhiteColor];
  }
  [(UIImageView *)self->_videoImageView setTintColor:v3];

  if (self->_shouldIlluminate) {
    +[UIColor systemGreenColor];
  }
  else {
  id v4 = +[UIColor systemWhiteColor];
  }
  [(UIImageView *)self->_videoOffImageView setTintColor:v4];
}

- (void)_updateCameraState
{
  self->_isVideoModuleOn = [(RPVideoEffectsControlCenterModule *)self _isVideoModuleEnabled];
  if (self->_shouldLoadFromSensor)
  {
    [(RPVideoEffectsControlCenterModule *)self _updateCameraStateControlCenter];
  }
  else
  {
    [(RPVideoEffectsControlCenterModule *)self updateCameraStateExternal];
  }
}

- (void)updateCameraStateExternal
{
  if (!self->_shouldLoadFromSensor)
  {
    id v7 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.cameracapture.volatile"];
    uint64_t v3 = [v7 stringForKey:@"show-system-ui-app-name"];
    applicationDisplayName = self->_applicationDisplayName;
    self->_applicationDisplayName = v3;

    double v5 = [v7 stringForKey:@"show-system-ui-bundle-id"];
    applicationBundleID = self->_applicationBundleID;
    self->_applicationBundleID = v5;
  }
}

- (void)_updateCameraStateControlCenter
{
  if (!self->_shouldLoadFromSensor) {
    return;
  }
  id v26 = [(CCUIContentModuleContext *)self->_contentModuleContext sensorActivityDataForActiveSensorType:1];
  double v5 = [(CCUIContentModuleContext *)self->_contentModuleContext sensorActivityDataForActiveSensorType:0];
  uint64_t v6 = v5;
  if (!v5)
  {
    CGFloat v15 = [v26 bundleIdentifier];
    if (([v15 isEqualToString:@"com.apple.TelephonyUtilities"] & 1) == 0)
    {
      id v16 = [v26 bundleIdentifier];
      if (([v16 isEqualToString:@"com.apple.facetime"] & 1) == 0)
      {
        v17 = [v26 bundleIdentifier];
        if (![v17 isEqualToString:@"com.apple.mediaserverd"])
        {
          CGRect v23 = [v26 bundleIdentifier];
          unsigned __int8 v24 = [v23 isEqualToString:@"com.apple.avconferenced"];

          if ((v24 & 1) == 0)
          {
            [(RPVideoEffectsControlCenterModule *)self _updateVideoImageViewWithCameraOn:0];
            self->_isVideoModuleOn = 0;
            goto LABEL_30;
          }
          goto LABEL_12;
        }
      }
    }

LABEL_12:
    CGSize v18 = [v26 displayName];
    applicationDisplayName = self->_applicationDisplayName;
    self->_applicationDisplayName = v18;

    applicationBundleID = self->_applicationBundleID;
    self->_applicationBundleID = (NSString *)@"com.apple.facetime";

    goto LABEL_27;
  }
  id v7 = [v5 displayName];
  uint64_t v8 = self->_applicationDisplayName;
  self->_applicationDisplayName = v7;

  double v9 = [v6 bundleIdentifier];
  unsigned __int8 v10 = [v9 isEqualToString:@"com.apple.TelephonyUtilities"];
  if (v10)
  {
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    CGFloat v14 = @"com.apple.facetime";
  }
  else
  {
    v2 = [v6 bundleIdentifier];
    CGFloat v14 = @"com.apple.facetime";
    if ([v2 isEqualToString:@"com.apple.facetime"])
    {
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
    }
    else
    {
      uint64_t v3 = [v6 bundleIdentifier];
      if ([v3 isEqualToString:@"com.apple.mediaserverd"])
      {
        int v12 = 0;
        int v13 = 0;
        int v11 = 1;
      }
      else
      {
        __int16 v25 = [v6 bundleIdentifier];
        if ([v25 isEqualToString:@"com.apple.avconferenced"])
        {
          int v13 = 0;
          int v11 = 1;
          int v12 = 1;
        }
        else
        {
          CGFloat v14 = [v6 bundleIdentifier];
          int v11 = 1;
          int v12 = 1;
          int v13 = 1;
        }
      }
    }
  }
  objc_storeStrong((id *)&self->_applicationBundleID, v14);
  if (v13)
  {

    if (!v12) {
      goto LABEL_19;
    }
  }
  else if (!v12)
  {
LABEL_19:
    if (v11) {
      goto LABEL_20;
    }
LABEL_24:
    if (v10) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }

  if (!v11) {
    goto LABEL_24;
  }
LABEL_20:

  if ((v10 & 1) == 0) {
LABEL_25:
  }

LABEL_26:
  if (![v6 usedRecently])
  {
    v21 = self;
    uint64_t v22 = 1;
    goto LABEL_29;
  }
LABEL_27:
  v21 = self;
  uint64_t v22 = 0;
LABEL_29:
  [(RPVideoEffectsControlCenterModule *)v21 _updateVideoImageViewWithCameraOn:v22];
LABEL_30:
}

- (BOOL)_isVideoModuleEnabled
{
  v2 = [(RPCCActivityManager *)self->_activityManager availableActivities];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)_updateActiveActivities
{
  id v3 = objc_alloc((Class)NSMutableArray);
  id v4 = [(RPCCActivityManager *)self->_activityManager activeActivities];
  id v5 = [v3 initWithArray:v4];

  [(RPCCModuleViewController *)self->_moduleViewController setActiveActivities:v5];
  self->_shouldIlluminate = [v5 count] != 0;
  [(RPVideoEffectsControlCenterModule *)self _setupVideoImageTint];
  [(RPCCModuleViewController *)self->_moduleViewController updateActivteActivityText];
}

- (BOOL)shouldLoadFromSensor
{
  return self->_shouldLoadFromSensor;
}

- (void)setShouldLoadFromSensor:(BOOL)a3
{
  self->_BOOL shouldLoadFromSensor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitRegistration, 0);
  objc_storeStrong((id *)&self->_applicationContainerPath, 0);
  objc_storeStrong((id *)&self->_applicationDisplayName, 0);
  objc_storeStrong((id *)&self->_applicationBundleID, 0);
  objc_storeStrong((id *)&self->_expandedOffGlyphImage, 0);
  objc_storeStrong((id *)&self->_expandedGlyphImage, 0);
  objc_storeStrong((id *)&self->_videoOffImageView, 0);
  objc_storeStrong((id *)&self->_videoImageView, 0);
  objc_storeStrong((id *)&self->_videoOffImage, 0);
  objc_storeStrong((id *)&self->_videoImage, 0);
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