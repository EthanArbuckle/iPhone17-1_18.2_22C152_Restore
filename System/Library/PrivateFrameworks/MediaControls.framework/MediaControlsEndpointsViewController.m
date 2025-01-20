@interface MediaControlsEndpointsViewController
+ (BOOL)_shouldTransitionEarlyOnSystemRoute;
- (AVExternalPlaybackMonitor)externalPlaybackMonitor;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isReadyForAppearanceTransition;
- (BOOL)_isSelectedRouteInRoutes;
- (BOOL)canDismissPresentedContent;
- (BOOL)isDismissing;
- (BOOL)isOnScreen;
- (BOOL)mediaControlsCollectionViewController:(id)a3 canSelectItemAtIndex:(int64_t)a4;
- (BOOL)providesOwnPlatter;
- (BOOL)shouldExpandModuleOnTouch:(id)a3;
- (BOOL)shouldPerformHoverInteraction;
- (BOOL)shouldPresentUsingViewService;
- (BOOL)shouldPresentUsingViewServicePlatterViewController:(id)a3;
- (MPAVEndpointRoute)selectedRoute;
- (MPAVRoutingViewController)routingViewController;
- (MPMediaControlsConfiguration)configuration;
- (MediaControlsEndpointsManager)endpointsManager;
- (MediaControlsEndpointsViewController)init;
- (NSString)routingContextUID;
- (double)preferredExpandedContentHeight;
- (double)preferredItemHeight;
- (double)preferredItemHeightGivenWidth:(double)a3;
- (id)homeGestureDismissalAllowedBlock;
- (id)mediaControlsCollectionViewController:(id)a3 viewControllerForItemAtIndex:(int64_t)a4;
- (id)routingCornerViewTappedBlock;
- (int64_t)defaultSelectedItemIndexForCollectionViewController:(id)a3;
- (int64_t)numberOfItemsInCollectionViewController:(id)a3;
- (void)_assignRouteViewControllerToSelectedPanelViewController;
- (void)_routeDidChangeNotification:(id)a3;
- (void)_selectActiveSystemRouteIfNeeded;
- (void)_setSelectedRoute:(id)a3 isUserSelected:(BOOL)a4 animated:(BOOL)a5;
- (void)_setupEndpointsManager;
- (void)_setupRoutingViewController;
- (void)_supportedModesForSelectedRoute:(unint64_t *)a3 selectedMode:(int64_t *)a4;
- (void)_transitionToVisible:(BOOL)a3;
- (void)_transitionToVisibleIfNeeded;
- (void)_updateDiscoveryMode;
- (void)_updateEndpointRouteForOutputDeviceDataSource:(id)a3;
- (void)_updateModesForSelectedPlatterViewController;
- (void)_updateSupportedModesForSelectedPlatterViewController;
- (void)dealloc;
- (void)dismissPlatterViewController:(id)a3 completion:(id)a4;
- (void)dismissPresentedContentAnimated:(BOOL)a3 completion:(id)a4;
- (void)endUpdates;
- (void)endpointsManager:(id)a3 activeSystemRouteDidChange:(id)a4;
- (void)endpointsManager:(id)a3 defersRoutesReplacement:(id)a4;
- (void)mediaControlsCollectionViewController:(id)a3 didDisplayViewController:(id)a4 forItemAtIndex:(int64_t)a5;
- (void)mediaControlsCollectionViewController:(id)a3 didEndDisplayingViewController:(id)a4 forItemAtIndex:(int64_t)a5;
- (void)mediaControlsCollectionViewController:(id)a3 willDisplayViewController:(id)a4 forItemAtIndex:(int64_t)a5;
- (void)mediaControlsCollectionViewController:(id)a3 willSelectItemAtIndex:(int64_t)a4 withReason:(int64_t)a5;
- (void)platterViewController:(id)a3 didPickRoute:(id)a4;
- (void)platterViewController:(id)a3 didToggleRoutingPicker:(BOOL)a4;
- (void)platterViewController:(id)a3 homeGestureDismisalAllowedDidChange:(BOOL)a4;
- (void)platterViewController:(id)a3 willToggleRoutingPicker:(BOOL)a4;
- (void)reloadData;
- (void)setConfiguration:(id)a3;
- (void)setDismissing:(BOOL)a3;
- (void)setDisplayMode:(int64_t)a3;
- (void)setEndpointsManager:(id)a3;
- (void)setExternalPlaybackMonitor:(id)a3;
- (void)setHomeGestureDismissalAllowedBlock:(id)a3;
- (void)setOnScreen:(BOOL)a3;
- (void)setRoutingContextUID:(id)a3;
- (void)setRoutingCornerViewTappedBlock:(id)a3;
- (void)setRoutingViewController:(id)a3;
- (void)setSelectedRoute:(id)a3;
- (void)setShouldPresentUsingViewService:(BOOL)a3;
- (void)startPrewarming;
- (void)stopPrewarming;
- (void)updateContentInsets;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MediaControlsEndpointsViewController

- (MediaControlsEndpointsViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)MediaControlsEndpointsViewController;
  v2 = [(MediaControlsCollectionViewController *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(MediaControlsEndpointsViewController *)v2 setShouldPresentUsingViewService:1];
    [(MediaControlsEndpointsViewController *)v3 setDisplayMode:1];
  }
  return v3;
}

- (void)dealloc
{
  [(MediaControlsCollectionViewController *)self setDelegate:0];
  [(MediaControlsEndpointsManager *)self->_endpointsManager setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)MediaControlsEndpointsViewController;
  [(MediaControlsEndpointsViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)MediaControlsEndpointsViewController;
  [(MediaControlsCollectionViewController *)&v3 viewDidLoad];
  [(MediaControlsCollectionViewController *)self setDataSource:self];
  [(MediaControlsCollectionViewController *)self setDelegate:self];
  [(MediaControlsEndpointsViewController *)self reloadData];
}

- (void)viewWillAppear:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)MediaControlsEndpointsViewController;
  [(MediaControlsCollectionViewController *)&v15 viewWillAppear:a3];
  [(MediaControlsEndpointsViewController *)self setDismissing:0];
  [(MediaControlsEndpointsViewController *)self setOnScreen:1];
  v4 = [(MediaControlsEndpointsViewController *)self view];
  objc_super v5 = [v4 window];

  if (v5)
  {
    v6 = [(MediaControlsEndpointsViewController *)self configuration];
    uint64_t v7 = [v6 style];

    if (v7)
    {
      v8 = [(MediaControlsEndpointsViewController *)self configuration];
      v9 = [v8 presentingAppBundleID];
      int v10 = [v9 isEqualToString:@"com.apple.Music"];

      if (v10)
      {
        uint64_t v11 = 2;
      }
      else
      {
        v12 = [(MediaControlsEndpointsViewController *)self configuration];
        v13 = [v12 presentingAppBundleID];
        int v14 = [v13 isEqualToString:@"com.apple.springboard"];

        if (v14) {
          uint64_t v11 = 4;
        }
        else {
          uint64_t v11 = 3;
        }
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
    +[MediaControlsAnalytics postAnalyticKind:v11];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MediaControlsEndpointsViewController;
  -[MediaControlsCollectionViewController viewWillDisappear:](&v5, sel_viewWillDisappear_);
  [(MPAVRoutingViewController *)self->_routingViewController viewWillDisappear:v3];
  [(MediaControlsEndpointsViewController *)self setDismissing:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MediaControlsEndpointsViewController;
  -[MediaControlsCollectionViewController viewDidDisappear:](&v6, sel_viewDidDisappear_);
  [(MediaControlsEndpointsViewController *)self stopPrewarming];
  [(MediaControlsEndpointsViewController *)self setDismissing:0];
  [(MediaControlsEndpointsViewController *)self setOnScreen:0];
  objc_super v5 = [(MediaControlsEndpointsViewController *)self routingViewController];
  [v5 viewDidDisappear:v3];
}

- (void)viewDidLayoutSubviews
{
  if (self->_configuration)
  {
    v2.receiver = self;
    v2.super_class = (Class)MediaControlsEndpointsViewController;
    [(MediaControlsCollectionViewController *)&v2 viewDidLayoutSubviews];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setConfiguration:(id)a3
{
  p_configuration = &self->_configuration;
  id v7 = a3;
  if ((-[MPMediaControlsConfiguration isEqual:](*p_configuration, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_configuration, a3);
    objc_super v6 = [(MPMediaControlsConfiguration *)*p_configuration routingContextUID];
    [(MediaControlsEndpointsViewController *)self setRoutingContextUID:v6];

    [(MediaControlsEndpointsViewController *)self _setupEndpointsManager];
    [(MediaControlsEndpointsViewController *)self _setupRoutingViewController];
  }
}

- (void)setSelectedRoute:(id)a3
{
}

- (void)startPrewarming
{
  self->_prewarming = 1;
  [(MediaControlsEndpointsViewController *)self _updateDiscoveryMode];
}

- (void)stopPrewarming
{
  self->_prewarming = 0;
  [(MediaControlsEndpointsViewController *)self _updateDiscoveryMode];
}

- (void)setRoutingCornerViewTappedBlock:(id)a3
{
  if (self->_routingCornerViewTappedBlock != a3)
  {
    v4 = _Block_copy(a3);
    id routingCornerViewTappedBlock = self->_routingCornerViewTappedBlock;
    self->_id routingCornerViewTappedBlock = v4;

    id v6 = [(MediaControlsCollectionViewController *)self viewControllerForSelectedItem];
    [v6 setRoutingCornerViewTappedBlock:self->_routingCornerViewTappedBlock];
  }
}

- (double)preferredExpandedContentHeight
{
  objc_super v2 = [(MediaControlsEndpointsViewController *)self view];
  BOOL v3 = [v2 window];
  [v3 bounds];
  double Height = CGRectGetHeight(v6);

  return Height;
}

- (BOOL)providesOwnPlatter
{
  return 1;
}

- (BOOL)canDismissPresentedContent
{
  objc_super v2 = [(MediaControlsEndpointsViewController *)self presentedViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)dismissPresentedContentAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  homeGestureDismissalAllowedBlock = (void (**)(id, void))self->_homeGestureDismissalAllowedBlock;
  if (homeGestureDismissalAllowedBlock) {
    homeGestureDismissalAllowedBlock[2](homeGestureDismissalAllowedBlock, 0);
  }
  id v7 = [(MediaControlsEndpointsViewController *)self presentedViewController];
  v8 = [v7 presentedViewController];
  [v8 dismissViewControllerAnimated:v4 completion:0];

  [v7 dismissViewControllerAnimated:v4 completion:v9];
}

- (BOOL)shouldPerformHoverInteraction
{
  return 0;
}

- (BOOL)shouldExpandModuleOnTouch:(id)a3
{
  return [a3 _isPointerTouch];
}

- (void)platterViewController:(id)a3 didToggleRoutingPicker:(BOOL)a4
{
  routingViewController = self->_routingViewController;
  if (a4) {
    [(MPAVRoutingViewController *)routingViewController setDiscoveryModeOverride:&unk_1F069F128];
  }
  else {
    [(MPAVRoutingViewController *)routingViewController resetDisplayedRoutes];
  }
}

- (void)platterViewController:(id)a3 willToggleRoutingPicker:(BOOL)a4
{
  if (a4) {
    [(MPAVRoutingViewController *)self->_routingViewController resetScrollPosition];
  }
}

- (BOOL)shouldPresentUsingViewServicePlatterViewController:(id)a3
{
  return self->_shouldPresentUsingViewService;
}

- (void)platterViewController:(id)a3 homeGestureDismisalAllowedDidChange:(BOOL)a4
{
  homeGestureDismissalAllowedBlock = (void (**)(id, BOOL))self->_homeGestureDismissalAllowedBlock;
  if (homeGestureDismissalAllowedBlock) {
    homeGestureDismissalAllowedBlock[2](homeGestureDismissalAllowedBlock, a4);
  }
}

- (void)platterViewController:(id)a3 didPickRoute:(id)a4
{
  id v12 = a3;
  uint64_t v5 = [(MPMediaControlsConfiguration *)self->_configuration style];
  if (v5 == 4)
  {
    [(MediaControlsCollectionViewController *)self dismissViewControllerAnimated:1 completion:0];
    CGRect v6 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
    id v7 = [(MediaControlsEndpointsViewController *)self configuration];
    v8 = [v7 presentingAppBundleID];
    [v6 setAttribute:v8 forKey:*MEMORY[0x1E4F74AB0] error:0];
  }
  else if (v5 == 1)
  {
    [(MediaControlsCollectionViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
  id v9 = [v12 endpointController];
  int v10 = [v9 route];
  if ([v10 isDeviceRoute]) {
    uint64_t v11 = 7;
  }
  else {
    uint64_t v11 = 8;
  }
  +[MediaControlsAnalytics postAnalyticKind:v11];
}

- (void)dismissPlatterViewController:(id)a3 completion:(id)a4
{
}

- (void)setRoutingContextUID:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_routingContextUID, "isEqualToString:"))
  {
    BOOL v4 = (NSString *)[v6 copy];
    routingContextUID = self->_routingContextUID;
    self->_routingContextUID = v4;

    if (self->_routingContextUID) {
      [(MPAVOutputDeviceRoutingDataSource *)self->_outputDeviceRoutingDataSource setRoutingContextUID:"setRoutingContextUID:"];
    }
  }
}

- (void)setOnScreen:(BOOL)a3
{
  if (self->_onScreen != a3)
  {
    self->_onScreen = a3;
    [(MediaControlsEndpointsViewController *)self _updateDiscoveryMode];
  }
}

- (AVExternalPlaybackMonitor)externalPlaybackMonitor
{
  externalPlaybackMonitor = self->_externalPlaybackMonitor;
  if (!externalPlaybackMonitor)
  {
    BOOL v4 = [MEMORY[0x1E4F16510] longFormVideoExternalPlaybackMonitor];
    uint64_t v5 = self->_externalPlaybackMonitor;
    self->_externalPlaybackMonitor = v4;

    externalPlaybackMonitor = self->_externalPlaybackMonitor;
  }

  return externalPlaybackMonitor;
}

- (void)updateContentInsets
{
  BOOL v3 = [(MediaControlsEndpointsViewController *)self configuration];
  uint64_t v4 = [v3 style];

  if (v4)
  {
    v13.receiver = self;
    v13.super_class = (Class)MediaControlsEndpointsViewController;
    [(MediaControlsCollectionViewController *)&v13 updateContentInsets];
  }
  else if ([(MediaControlsCollectionViewController *)self displayMode] == 1 {
         && ([MEMORY[0x1E4FB16C8] currentDevice],
  }
             uint64_t v5 = objc_claimAutoreleasedReturnValue(),
             uint64_t v6 = [v5 userInterfaceIdiom],
             v5,
             v6 == 1))
  {
    CCUIExpandedModuleEdgeInsets();
    double v8 = v7;
    CCUIExpandedModuleEdgeInsets();
    double v10 = v9;
    uint64_t v11 = [(MediaControlsCollectionViewController *)self scrollView];
    [v11 setAlwaysBounceVertical:1];

    id v12 = [(MediaControlsCollectionViewController *)self scrollView];
    objc_msgSend(v12, "setContentInset:", v8, 0.0, v10, 0.0);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)MediaControlsEndpointsViewController;
    [(MediaControlsCollectionViewController *)&v14 updateContentInsets];
  }
}

- (void)setDisplayMode:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MediaControlsEndpointsViewController;
  -[MediaControlsCollectionViewController setDisplayMode:](&v10, sel_setDisplayMode_);
  [(MediaControlsEndpointsViewController *)self _updateDiscoveryMode];
  if (a3 == 1)
  {
    uint64_t v5 = [(MediaControlsEndpointsViewController *)self configuration];
    uint64_t v6 = [v5 style];

    if (!v6)
    {
      double v7 = [MEMORY[0x1E4F28B50] mainBundle];
      double v8 = [v7 bundleIdentifier];
      int v9 = [v8 isEqualToString:@"com.apple.springboard"];

      if (v9) {
        +[MediaControlsAnalytics postAnalyticKind:1];
      }
    }
  }
}

- (void)reloadData
{
  v3.receiver = self;
  v3.super_class = (Class)MediaControlsEndpointsViewController;
  [(MediaControlsCollectionViewController *)&v3 reloadData];
  [(MediaControlsEndpointsViewController *)self _transitionToVisibleIfNeeded];
}

- (void)_transitionToVisible:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__MediaControlsEndpointsViewController__transitionToVisible___block_invoke;
  aBlock[3] = &unk_1E5F0D8C0;
  aBlock[4] = self;
  BOOL v22 = a3;
  uint64_t v5 = (void (**)(void))_Block_copy(aBlock);
  if ([(MediaControlsEndpointsViewController *)self _isReadyForAppearanceTransition]
    || !v3)
  {
    v5[2](v5);
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v6 = [(MediaControlsCollectionViewController *)self visibleViewControllers];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [*(id *)(*((void *)&v17 + 1) + 8 * v10) view];
          [v11 setHidden:1];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v8);
    }

    self->_shouldTransitionToVisibleWhenReady = 1;
    objc_initWeak(&location, self);
    dispatch_time_t v12 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__MediaControlsEndpointsViewController__transitionToVisible___block_invoke_2;
    block[3] = &unk_1E5F0DF40;
    objc_copyWeak(&v15, &location);
    objc_super v14 = v5;
    dispatch_after(v12, MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

id __61__MediaControlsEndpointsViewController__transitionToVisible___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v2 = [*(id *)(a1 + 32) visibleViewControllers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [*(id *)(*((void *)&v11 + 1) + 8 * v6) view];
        [v7 setHidden:0];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 1219) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 1220) = *(unsigned char *)(a1 + 40);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 40);
  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)MediaControlsEndpointsViewController;
  return objc_msgSendSuper2(&v10, sel__transitionToVisible_, v8);
}

void __61__MediaControlsEndpointsViewController__transitionToVisible___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && WeakRetained[1219])
  {
    uint64_t v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }
}

- (double)preferredItemHeight
{
  CCUIDefaultExpandedContentModuleWidth();

  -[MediaControlsEndpointsViewController preferredItemHeightGivenWidth:](self, "preferredItemHeightGivenWidth:");
  return result;
}

- (double)preferredItemHeightGivenWidth:(double)a3
{
  uint64_t v5 = [(MediaControlsEndpointsViewController *)self traitCollection];
  [v5 displayScale];

  UIRoundToScale();
  double v7 = v6;
  UIRoundToScale();
  double v9 = v8;
  UIRoundToScale();
  double v11 = v10;
  UIRoundToScale();
  double v13 = v12;
  unint64_t v14 = [(MPMediaControlsConfiguration *)self->_configuration style];
  if (v14 > 6) {
    return 0.0;
  }
  if (((1 << v14) & 0x2F) != 0) {
    return v11 + v7 + v9 + v13;
  }
  uint64_t v16 = [(MediaControlsEndpointsManager *)self->_endpointsManager routes];
  long long v17 = -[MediaControlsCollectionViewController viewControllerForItemAtIndex:](self, "viewControllerForItemAtIndex:", [v16 indexOfObject:self->_selectedRoute]);

  if ([v17 style] == 5)
  {
    if (v17)
    {
      long long v18 = [v17 effectiveHeaderView];
      objc_msgSend(v18, "sizeThatFits:", a3, 1.79769313e308);
      double v9 = v19;
    }
    else
    {
      UIRoundToScale();
      double v9 = v20;
    }
    UIRoundToScale();
    double v11 = v21;
    UIRoundToScale();
    double v13 = v22;
  }
  double v15 = v11 + v7 + v9 + v13;

  return v15;
}

- (int64_t)numberOfItemsInCollectionViewController:(id)a3
{
  uint64_t v3 = [(MediaControlsEndpointsManager *)self->_endpointsManager routes];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)mediaControlsCollectionViewController:(id)a3 viewControllerForItemAtIndex:(int64_t)a4
{
  uint64_t v5 = [a3 dequeueReusableViewControllerForItemAtIndex:a4];
  if (!v5)
  {
    switch([(MPMediaControlsConfiguration *)self->_configuration style])
    {
      case 0:
      case 1:
      case 2:
      case 3:
      case 5:
        double v6 = [[MRPlatterViewController alloc] initWithNibName:0 bundle:0];
        goto LABEL_4;
      case 4:
        double v6 = [[MRPlatterViewController alloc] initWithStyle:5];
LABEL_4:
        uint64_t v5 = v6;
        break;
      case 6:
        double v8 = [(MediaControlsEndpointsViewController *)self externalPlaybackMonitor];
        int v9 = [v8 isAirPlayVideoActive];

        double v10 = MCLogCategoryRouting();
        BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
        if (v9)
        {
          if (v11)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AE7DF000, v10, OS_LOG_TYPE_DEFAULT, "Present local transport control picker because AirPlay video is active", buf, 2u);
          }

          double v12 = (void *)[(MPMediaControlsConfiguration *)self->_configuration copy];
          [v12 setStyle:5];
          [v12 setInitatorStyle:6];
          [(MediaControlsEndpointsViewController *)self setConfiguration:v12];
          double v13 = [[MRPlatterViewController alloc] initWithNibName:0 bundle:0];
        }
        else
        {
          if (v11)
          {
            *(_WORD *)unint64_t v14 = 0;
            _os_log_impl(&dword_1AE7DF000, v10, OS_LOG_TYPE_DEFAULT, "Present video picker because because AirPlay video is inactive", v14, 2u);
          }

          double v12 = (void *)[(MPMediaControlsConfiguration *)self->_configuration copy];
          [v12 setStyle:4];
          [v12 setInitatorStyle:6];
          [(MediaControlsEndpointsViewController *)self setConfiguration:v12];
          double v13 = [[MRPlatterViewController alloc] initWithStyle:5];
        }
        uint64_t v5 = v13;

        break;
      default:
        uint64_t v5 = 0;
        break;
    }
  }

  return v5;
}

- (int64_t)defaultSelectedItemIndexForCollectionViewController:(id)a3
{
  int64_t v4 = [(MediaControlsEndpointsManager *)self->_endpointsManager routes];
  int64_t v5 = [v4 indexOfObject:self->_selectedRoute];

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v6 = [(MediaControlsEndpointsManager *)self->_endpointsManager routes];
    uint64_t v7 = [v6 count];

    if (v7) {
      return 0;
    }
    else {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v5;
}

- (void)mediaControlsCollectionViewController:(id)a3 willDisplayViewController:(id)a4 forItemAtIndex:(int64_t)a5
{
  id v15 = a4;
  uint64_t v7 = [(MediaControlsEndpointsViewController *)self configuration];
  unint64_t v8 = [v7 style];
  if (v8 > 8) {
    int v9 = @"MediaControls-<Unknown>";
  }
  else {
    int v9 = off_1E5F0DFD8[v8];
  }
  [v15 setLabel:v9];

  double v10 = [(MediaControlsEndpointsViewController *)self routingCornerViewTappedBlock];
  [v15 setRoutingCornerViewTappedBlock:v10];

  BOOL v11 = [(MediaControlsEndpointsManager *)self->_endpointsManager routes];

  if (v11)
  {
    double v12 = [(MediaControlsEndpointsManager *)self->_endpointsManager routes];
    double v13 = [v12 objectAtIndex:a5];

    unint64_t v14 = [(MediaControlsEndpointsManager *)self->_endpointsManager endpointControllerForRoute:v13];
    [v14 setAllowsAutomaticResponseLoading:1];
    [v15 setEndpointController:v14];
  }
  [v15 setDelegate:self];
  if ([(MediaControlsCollectionViewController *)self selectedItemIndex] == a5)
  {
    [(MediaControlsEndpointsViewController *)self _assignRouteViewControllerToSelectedPanelViewController];
    [(MediaControlsEndpointsViewController *)self _updateSupportedModesForSelectedPlatterViewController];
  }
}

- (void)mediaControlsCollectionViewController:(id)a3 didDisplayViewController:(id)a4 forItemAtIndex:(int64_t)a5
{
  objc_msgSend(a4, "view", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 setHidden:self->_shouldTransitionToVisibleWhenReady];
}

- (void)mediaControlsCollectionViewController:(id)a3 didEndDisplayingViewController:(id)a4 forItemAtIndex:(int64_t)a5
{
  id v8 = a4;
  if ([(MediaControlsCollectionViewController *)self selectedItemIndex] == a5) {
    self->_lastSelectedModeForActivePlatterViewController = [v8 selectedMode];
  }
  uint64_t v7 = [v8 endpointController];
  [v7 setAllowsAutomaticResponseLoading:0];
}

- (BOOL)mediaControlsCollectionViewController:(id)a3 canSelectItemAtIndex:(int64_t)a4
{
  uint64_t v6 = [(MPMediaControlsConfiguration *)self->_configuration style];
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"WHADoNotExpandOnSelection", @"com.apple.Music", 0);
  if (v6) {
    BOOL v8 = AppBooleanValue == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (a4 != 0x7FFFFFFFFFFFFFFFLL) {
      return 1;
    }
  }
  else
  {
    double v10 = [(MediaControlsEndpointsManager *)self->_endpointsManager routes];
    BOOL v11 = [v10 objectAtIndex:a4];

    [MEMORY[0x1E4F31850] setActiveRoute:v11 reason:@"Analytics: User selected" completion:0];
  }
  double v12 = [(MediaControlsCollectionViewController *)self dismissalBlock];

  if (v12)
  {
    double v13 = [(MediaControlsCollectionViewController *)self dismissalBlock];
    v13[2](v13, 0);
  }
  else
  {
    [(MediaControlsCollectionViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
  return 0;
}

- (void)mediaControlsCollectionViewController:(id)a3 willSelectItemAtIndex:(int64_t)a4 withReason:(int64_t)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int v9 = [(MediaControlsEndpointsManager *)self->_endpointsManager routes];
    double v10 = [v9 objectAtIndex:a4];

    BOOL v11 = [(MediaControlsEndpointsManager *)self->_endpointsManager endpointControllerForRoute:v10];
    if (!a5)
    {
      double v12 = MCLogCategoryRouting();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        double v13 = [v10 routeName];
        *(_DWORD *)buf = 138543362;
        v26 = v13;
        _os_log_impl(&dword_1AE7DF000, v12, OS_LOG_TYPE_DEFAULT, "User selected platter: %{public}@", buf, 0xCu);
      }
      +[MediaControlsAnalytics postAnalyticKind:6];
    }
    [(MediaControlsEndpointsViewController *)self _setSelectedRoute:v10 isUserSelected:a5 == 0 animated:a5 == 0];
    objc_initWeak((id *)buf, self);
    unint64_t v14 = dispatch_group_create();
    dispatch_group_enter(v14);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __111__MediaControlsEndpointsViewController_mediaControlsCollectionViewController_willSelectItemAtIndex_withReason___block_invoke;
    block[3] = &unk_1E5F0DF68;
    objc_copyWeak(v24, (id *)buf);
    id v15 = v10;
    id v23 = v15;
    v24[1] = (id)a5;
    dispatch_group_notify(v14, MEMORY[0x1E4F14428], block);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __111__MediaControlsEndpointsViewController_mediaControlsCollectionViewController_willSelectItemAtIndex_withReason___block_invoke_2;
    v18[3] = &unk_1E5F0DC98;
    objc_copyWeak(&v21, (id *)buf);
    id v16 = v15;
    id v19 = v16;
    long long v17 = v14;
    double v20 = v17;
    [v11 connectAllowingAuthenticationWithCompletion:v18];

    objc_destroyWeak(&v21);
    objc_destroyWeak(v24);

    objc_destroyWeak((id *)buf);
  }
}

void __111__MediaControlsEndpointsViewController_mediaControlsCollectionViewController_willSelectItemAtIndex_withReason___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained[158] isEqual:*(void *)(a1 + 32)] && !*(void *)(a1 + 48))
  {
    objc_super v2 = (void *)[objc_alloc(MEMORY[0x1E4F770C0]) initWithName:@"mediaControlsCollectionViewController:willSelectItemAtIndex:withReason:" requestID:0 reason:@"Analytics: User selected" userInitiated:1];
    [WeakRetained[156] setActiveSystemRoute:*(void *)(a1 + 32) requestDetails:v2];
    [WeakRetained didSelectEndpoint:*(void *)(a1 + 32)];
  }
}

void __111__MediaControlsEndpointsViewController_mediaControlsCollectionViewController_willSelectItemAtIndex_withReason___block_invoke_2(uint64_t a1, char a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v16 = WeakRetained;
    int v5 = [*(id *)(a1 + 32) isEqual:WeakRetained[158]];
    WeakRetained = v16;
    if (v5)
    {
      if ((a2 & 1) == 0)
      {
        uint64_t v6 = [MEMORY[0x1E4F28B50] mediaControlsBundle];
        uint64_t v7 = objc_msgSend(v6, "mediaControls_localizedStringForKey:inTable:expectedFormat:", @"AIRPLAY_ERROR_TITLE", @"MediaControls", 0);
        id v8 = NSString;
        int v9 = objc_msgSend(v6, "mediaControls_localizedStringForKey:inTable:expectedFormat:", @"AIRPLAY_CONNECTION_ERROR_MESSAGE", @"MediaControls", @"%@");
        double v10 = [*(id *)(a1 + 32) routeName];
        BOOL v11 = objc_msgSend(v8, "stringWithFormat:", v9, v10);

        double v12 = objc_msgSend(v6, "mediaControls_localizedStringForKey:inTable:expectedFormat:", @"OK_BUTTON_TITLE", @"MediaControls", 0);
        id v13 = objc_alloc_init(MEMORY[0x1E4F77A20]);
        unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F77A18]) initWithOptions:v13];
        [v13 setAlertHeader:v7];
        [v13 setAlertMessage:v11];
        [v13 setDefaultButtonTitle:v12];
        [v14 presentWithCompletion:0];
        id v15 = [v16[156] activeSystemRoute];
        [v16 _setSelectedRoute:v15 isUserSelected:1 animated:1];
      }
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
      WeakRetained = v16;
    }
  }
}

- (void)endpointsManager:(id)a3 activeSystemRouteDidChange:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  self->_didRetrieveActiveSystemRouteOnce = 1;
  self->_shouldReselectActiveSystemRoute = 1;
  uint64_t v6 = MCLogCategoryRouting();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [(MPMediaControlsConfiguration *)self->_configuration presentingAppBundleID];
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2114;
    BOOL v11 = v7;
    _os_log_impl(&dword_1AE7DF000, v6, OS_LOG_TYPE_DEFAULT, "activeSystemRouteDidChange %{public}@ : %{public}@", (uint8_t *)&v8, 0x16u);
  }
  [(MediaControlsEndpointsViewController *)self _selectActiveSystemRouteIfNeeded];
  [(MediaControlsEndpointsViewController *)self _updateEndpointRouteForOutputDeviceDataSource:v5];
  [(MediaControlsEndpointsViewController *)self _transitionToVisibleIfNeeded];
}

- (void)endpointsManager:(id)a3 defersRoutesReplacement:(id)a4
{
  id v5 = (void (**)(void))a4;
  if ([(MediaControlsEndpointsViewController *)self isViewLoaded])
  {
    if (self->_shouldTransitionToVisibleWhenReady || !self->_onScreen)
    {
      uint64_t v6 = v5[2](v5);
      if (v6)
      {
        [(MediaControlsEndpointsViewController *)self reloadData];
        [(MediaControlsEndpointsViewController *)self _selectActiveSystemRouteIfNeeded];
      }
    }
    else
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __81__MediaControlsEndpointsViewController_endpointsManager_defersRoutesReplacement___block_invoke;
      v9[3] = &unk_1E5F0DFB8;
      v9[4] = self;
      __int16 v10 = v5;
      [(MediaControlsCollectionViewController *)self performBatchUpdates:v9];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__MediaControlsEndpointsViewController_endpointsManager_defersRoutesReplacement___block_invoke_3;
    block[3] = &unk_1E5F0D7F8;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    id v7 = (id)((uint64_t (*)(void))v5[2])(v5);
  }
}

void __81__MediaControlsEndpointsViewController_endpointsManager_defersRoutesReplacement___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  objc_super v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v3 = [v2 insertedItemIndexPaths];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v28;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(a1 + 32), "insertItemAtIndex:", objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v7++), "row"));
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v5);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  int v8 = [v2 deletedItemIndexPaths];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(a1 + 32), "deleteItemAtIndex:", objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v12++), "row"));
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v32 count:16];
    }
    while (v10);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v13 = [v2 updatedItemIndexPaths];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(*(id *)(a1 + 32), "reloadItemAtIndex:", objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v17++), "row"));
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v31 count:16];
    }
    while (v15);
  }

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __81__MediaControlsEndpointsViewController_endpointsManager_defersRoutesReplacement___block_invoke_2;
  v18[3] = &unk_1E5F0DF90;
  void v18[4] = *(void *)(a1 + 32);
  [v2 enumerateItemMovesWithBlock:v18];
  [*(id *)(a1 + 32) _selectActiveSystemRouteIfNeeded];
}

uint64_t __81__MediaControlsEndpointsViewController_endpointsManager_defersRoutesReplacement___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  uint64_t v6 = [a2 row];
  uint64_t v7 = [v5 row];

  return [v4 moveItemAtIndex:v6 toIndex:v7];
}

void __81__MediaControlsEndpointsViewController_endpointsManager_defersRoutesReplacement___block_invoke_3(uint64_t a1)
{
  v1 = *(id **)(a1 + 32);
  id v2 = [v1[156] activeSystemRoute];
  [v1 _updateEndpointRouteForOutputDeviceDataSource:v2];
}

- (BOOL)_isSelectedRouteInRoutes
{
  id v2 = self;
  uint64_t v3 = [(MediaControlsEndpointsManager *)self->_endpointsManager routes];
  LOBYTE(v2) = [v3 indexOfObject:v2->_selectedRoute] != 0x7FFFFFFFFFFFFFFFLL;

  return (char)v2;
}

- (void)_updateDiscoveryMode
{
  if (self->_onScreen && [(MediaControlsCollectionViewController *)self displayMode] == 1
    || self->_prewarming)
  {
    uint64_t onScreen = 3;
  }
  else
  {
    uint64_t onScreen = self->_onScreen;
  }
  uint64_t v4 = [NSNumber numberWithInteger:onScreen];
  [(MPAVRoutingViewController *)self->_routingViewController setDiscoveryModeOverride:v4];

  endpointsManager = self->_endpointsManager;

  [(MediaControlsEndpointsManager *)endpointsManager setDiscoveryMode:onScreen];
}

- (void)_assignRouteViewControllerToSelectedPanelViewController
{
  uint64_t v3 = [(MediaControlsEndpointsManager *)self->_endpointsManager routes];
  -[MediaControlsCollectionViewController viewControllerForItemAtIndex:](self, "viewControllerForItemAtIndex:", [v3 indexOfObject:self->_selectedRoute]);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v4 = [(MPAVRoutingViewController *)self->_routingViewController parentViewController];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 routingViewController];
    [v6 willMoveToParentViewController:0];
    [v5 setRoutingViewController:0];
    [v6 endAppearanceTransition];
  }
  uint64_t v7 = [v11 routingViewController];
  if (!v11 || v7 == self->_routingViewController)
  {
    int v8 = v7;
  }
  else
  {
    int v8 = [v11 routingViewController];

    [v8 willMoveToParentViewController:0];
    [v11 setRoutingViewController:0];
    [v8 endAppearanceTransition];
    [v11 addChildViewController:self->_routingViewController];
    [v11 setRoutingViewController:self->_routingViewController];
    [(MPAVRoutingViewController *)self->_routingViewController didMoveToParentViewController:v11];
    uint64_t v9 = [(MPMediaControlsConfiguration *)self->_configuration style];
    if ([v11 selectedMode] == 1 || v9 != 0) {
      [(MPAVRoutingViewController *)self->_routingViewController setDiscoveryModeOverride:&unk_1F069F128];
    }
  }
}

- (void)_updateEndpointRouteForOutputDeviceDataSource:(id)a3
{
  id v6 = a3;
  if (!v6
    || (char v4 = [v6 isDeviceRoute], v6, (v4 & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [(MPAVOutputDeviceRoutingDataSource *)self->_outputDeviceRoutingDataSource setEndpointRoute:v6];
    id v5 = [(MPAVOutputDeviceRoutingDataSource *)self->_outputDeviceRoutingDataSource endpointRoute];
    [(MPAVRoutingViewController *)self->_routingViewController setEndpointRoute:v5];
  }
}

- (void)_supportedModesForSelectedRoute:(unint64_t *)a3 selectedMode:(int64_t *)a4
{
  if ([(MPAVEndpointRoute *)self->_selectedRoute canModifyGroupMembership])
  {
    if ([(MPAVEndpointRoute *)self->_selectedRoute supportsGrouping]) {
      unsigned int v7 = 1;
    }
    else {
      unsigned int v7 = [(MPAVEndpointRoute *)self->_selectedRoute isDeviceRoute];
    }
  }
  else
  {
    unsigned int v7 = 0;
  }
  int v8 = [(MediaControlsEndpointsViewController *)self configuration];
  uint64_t v9 = [v8 style];

  switch(v9)
  {
    case 0:
      int64_t v12 = [(MediaControlsCollectionViewController *)self displayMode];
      unint64_t v10 = 3;
      if (!v7) {
        unint64_t v10 = 1;
      }
      if (!v12) {
        goto LABEL_17;
      }
      int64_t lastSelectedModeForActivePlatterViewController = self->_lastSelectedModeForActivePlatterViewController;
      if (a3) {
        goto LABEL_24;
      }
      break;
    case 1:
    case 2:
    case 3:
      unint64_t v10 = 1;
      if (v7) {
        unint64_t v10 = 2;
      }
      int64_t lastSelectedModeForActivePlatterViewController = v7;
      if (a3) {
        goto LABEL_24;
      }
      break;
    case 4:
      int64_t lastSelectedModeForActivePlatterViewController = 1;
      unint64_t v10 = 2;
      if (a3) {
        goto LABEL_24;
      }
      break;
    case 5:
      int64_t lastSelectedModeForActivePlatterViewController = 0;
      unint64_t v10 = 3;
      if (!v7) {
        unint64_t v10 = 1;
      }
      if (a3) {
        goto LABEL_24;
      }
      break;
    default:
      unint64_t v10 = 0;
LABEL_17:
      int64_t lastSelectedModeForActivePlatterViewController = 0;
      if (a3) {
LABEL_24:
      }
        *a3 = v10;
      break;
  }
  if (a4) {
    *a4 = lastSelectedModeForActivePlatterViewController;
  }
}

- (void)_updateModesForSelectedPlatterViewController
{
  uint64_t v3 = [(MediaControlsCollectionViewController *)self viewControllerForSelectedItem];
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    [(MediaControlsEndpointsViewController *)self _supportedModesForSelectedRoute:&v5 selectedMode:&v4];
    [v3 setSupportedModes:v5];
    [v3 setSelectedMode:v4];
  }
}

- (void)_updateSupportedModesForSelectedPlatterViewController
{
  uint64_t v3 = [(MediaControlsCollectionViewController *)self viewControllerForSelectedItem];
  if (v3)
  {
    uint64_t v4 = 0;
    [(MediaControlsEndpointsViewController *)self _supportedModesForSelectedRoute:&v4 selectedMode:0];
    [v3 setSupportedModes:v4];
  }
}

- (void)_setupEndpointsManager
{
  if (self->_configuration)
  {
    uint64_t v3 = [[MediaControlsEndpointsManager alloc] initWithConfiguration:self->_configuration];
    endpointsManager = self->_endpointsManager;
    self->_endpointsManager = v3;

    [(MediaControlsEndpointsManager *)self->_endpointsManager setDelegate:self];
    [(MediaControlsEndpointsViewController *)self _updateDiscoveryMode];
    [(MediaControlsEndpointsViewController *)self reloadData];
    id v5 = [(MediaControlsEndpointsManager *)self->_endpointsManager activeSystemRoute];
    [(MediaControlsEndpointsViewController *)self _setSelectedRoute:v5 isUserSelected:0 animated:0];
  }
}

- (void)_setupRoutingViewController
{
  if (self->_configuration)
  {
    uint64_t v3 = NSString;
    uint64_t v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    id v16 = [v3 stringWithFormat:@"%@(devices)", v5];

    id v6 = (MPAVOutputDeviceRoutingDataSource *)objc_alloc_init(MEMORY[0x1E4F31838]);
    outputDeviceRoutingDataSource = self->_outputDeviceRoutingDataSource;
    self->_outputDeviceRoutingDataSource = v6;

    if (self->_routingContextUID) {
      [(MPAVOutputDeviceRoutingDataSource *)self->_outputDeviceRoutingDataSource setRoutingContextUID:"setRoutingContextUID:"];
    }
    uint64_t v8 = [(MPMediaControlsConfiguration *)self->_configuration style];
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    switch(v8)
    {
      case 0:
      case 2:
      case 3:
        uint64_t v10 = 0;
        uint64_t v9 = 1;
        goto LABEL_8;
      case 1:
      case 5:
        goto LABEL_8;
      case 4:
      case 6:
        uint64_t v9 = 0;
        uint64_t v10 = 2;
LABEL_8:
        [(MPAVOutputDeviceRoutingDataSource *)self->_outputDeviceRoutingDataSource setSupportsMultipleSelection:v9];
        [(MPAVOutputDeviceRoutingDataSource *)self->_outputDeviceRoutingDataSource setFilterMode:v10];
        break;
      default:
        break;
    }
    unint64_t v11 = [(MPMediaControlsConfiguration *)self->_configuration initatorStyle];
    if (v11 <= 7 && ((0xDDu >> v11) & 1) != 0) {
      [(MPAVOutputDeviceRoutingDataSource *)self->_outputDeviceRoutingDataSource setInitiator:**((void **)&unk_1E5F0E020 + v11)];
    }
    int64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F31850]) initWithDataSource:self->_outputDeviceRoutingDataSource name:v16];
    id v13 = [(MPMediaControlsConfiguration *)self->_configuration presentingAppBundleID];
    [v12 setPresentedBundleID:v13];

    uint64_t v14 = [(MPAVRoutingViewController *)[MediaControlsRoutingViewController alloc] initWithStyle:3 routingController:v12];
    routingViewController = self->_routingViewController;
    self->_routingViewController = &v14->super;

    [(MPAVRoutingViewController *)self->_routingViewController setSortByIsVideoRoute:[(MPMediaControlsConfiguration *)self->_configuration sortByIsVideoRoute]];
    [v12 setPlaybackDataSource:self->_endpointsManager];
    [(MediaControlsEndpointsViewController *)self _assignRouteViewControllerToSelectedPanelViewController];
  }
}

- (void)endUpdates
{
  [(MediaControlsEndpointsManager *)self->_endpointsManager setDelegate:0];
  routingViewController = self->_routingViewController;

  [(MPAVRoutingViewController *)routingViewController _endUpdates];
}

- (void)_setSelectedRoute:(id)a3 isUserSelected:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v23 = a3;
  p_selectedRoute = &self->_selectedRoute;
  char v10 = [(MPAVEndpointRoute *)self->_selectedRoute isEqual:v23];
  unint64_t v11 = v23;
  if (v10) {
    goto LABEL_20;
  }
  int64_t v12 = (void *)MEMORY[0x1E4F31240];
  if (*p_selectedRoute)
  {
    id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 removeObserver:self name:*v12 object:*p_selectedRoute];
  }
  objc_storeStrong((id *)&self->_selectedRoute, a3);
  if (*p_selectedRoute)
  {
    uint64_t v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:self selector:sel__routeDidChangeNotification_ name:*v12 object:*p_selectedRoute];
  }
  if (v5)
  {
    if (self->_didTransitionToVisible) {
      goto LABEL_13;
    }
    uint64_t v15 = [(MediaControlsEndpointsViewController *)self configuration];
    BOOL v16 = [v15 style] == 0;

    if (a4) {
      goto LABEL_13;
    }
  }
  else
  {
    BOOL v16 = 0;
    if (a4)
    {
LABEL_13:
      BOOL v17 = [(MediaControlsCollectionViewController *)self selectedItemIndex] != 0x7FFFFFFFFFFFFFFFLL;
      BOOL v16 = !self->_shouldTransitionToVisibleWhenReady;
      goto LABEL_14;
    }
  }
  if (v16) {
    goto LABEL_13;
  }
  BOOL v17 = 0;
LABEL_14:
  if (v23)
  {
    long long v18 = [(MediaControlsEndpointsManager *)self->_endpointsManager routes];
    -[MediaControlsCollectionViewController setSelectedItemIndex:animated:shouldScroll:](self, "setSelectedItemIndex:animated:shouldScroll:", [v18 indexOfObject:v23], v17, v16);
  }
  [(MediaControlsEndpointsViewController *)self _updateEndpointRouteForOutputDeviceDataSource:"_updateEndpointRouteForOutputDeviceDataSource:"];
  long long v19 = [(MPAVRoutingViewController *)self->_routingViewController _tableView];
  [v19 reloadData];

  [(MediaControlsEndpointsViewController *)self _assignRouteViewControllerToSelectedPanelViewController];
  [(MediaControlsEndpointsViewController *)self _updateModesForSelectedPlatterViewController];
  if (!a4)
  {
    long long v20 = [(MediaControlsEndpointsManager *)self->_endpointsManager routes];
    long long v21 = [(MediaControlsEndpointsManager *)self->_endpointsManager activeSystemRoute];
    char v22 = [v20 containsObject:v21];

    if ((v22 & 1) == 0) {
      self->_shouldReselectActiveSystemRoute = 1;
    }
  }
  [(MediaControlsEndpointsViewController *)self _transitionToVisibleIfNeeded];
  unint64_t v11 = v23;
LABEL_20:
}

- (void)_routeDidChangeNotification:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__MediaControlsEndpointsViewController__routeDidChangeNotification___block_invoke;
  block[3] = &unk_1E5F0D7F8;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __68__MediaControlsEndpointsViewController__routeDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSupportedModesForSelectedPlatterViewController];
}

- (void)_selectActiveSystemRouteIfNeeded
{
  id v5 = [(MediaControlsEndpointsManager *)self->_endpointsManager resolvedActiveSystemRoute];
  if (self->_shouldReselectActiveSystemRoute)
  {
    uint64_t v3 = [(MediaControlsEndpointsManager *)self->_endpointsManager routes];
    int v4 = [v3 containsObject:v5];

    if (v4)
    {
      [(MediaControlsEndpointsViewController *)self setSelectedRoute:v5];
      self->_shouldReselectActiveSystemRoute = 0;
      self->_didRetrieveActiveSystemRouteOnce = 1;
    }
  }
}

- (BOOL)_isReadyForAppearanceTransition
{
  return self->_didRetrieveActiveSystemRouteOnce
      && (-[MediaControlsEndpointsManager isActiveSystemEndpointEqualToLocalEndpoint](self->_endpointsManager, "isActiveSystemEndpointEqualToLocalEndpoint")&& ([(id)objc_opt_class() _shouldTransitionEarlyOnSystemRoute] & 1) != 0|| -[MediaControlsEndpointsViewController _isSelectedRouteInRoutes](self, "_isSelectedRouteInRoutes"));
}

- (void)_transitionToVisibleIfNeeded
{
  if (self->_shouldTransitionToVisibleWhenReady) {
    [(MediaControlsEndpointsViewController *)self _transitionToVisible:1];
  }
}

+ (BOOL)_shouldTransitionEarlyOnSystemRoute
{
  if (_shouldTransitionEarlyOnSystemRoute_onceToken != -1) {
    dispatch_once(&_shouldTransitionEarlyOnSystemRoute_onceToken, &__block_literal_global_5);
  }
  return _shouldTransitionEarlyOnSystemRoute___shouldTransitionEarlyOnSystemRoute;
}

void __75__MediaControlsEndpointsViewController__shouldTransitionEarlyOnSystemRoute__block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  memset(&v5, 0, 512);
  uname(&v5);
  v0 = [NSString stringWithCString:v5.machine encoding:4];
  v1 = [MEMORY[0x1E4F28B88] letterCharacterSet];
  id v2 = [v0 stringByTrimmingCharactersInSet:v1];

  uint64_t v3 = [v2 integerValue];
  if ([v0 hasPrefix:@"iPhone"]) {
    goto LABEL_5;
  }
  if ([v0 hasPrefix:@"iPad"])
  {
    unint64_t v4 = 4;
LABEL_6:
    _shouldTransitionEarlyOnSystemRoute___shouldTransitionEarlyOnSystemRoute = v3 - 1 < v4;
    goto LABEL_7;
  }
  if ([v0 hasPrefix:@"iPod"])
  {
LABEL_5:
    unint64_t v4 = 7;
    goto LABEL_6;
  }
LABEL_7:
}

- (MPMediaControlsConfiguration)configuration
{
  return self->_configuration;
}

- (id)routingCornerViewTappedBlock
{
  return self->_routingCornerViewTappedBlock;
}

- (id)homeGestureDismissalAllowedBlock
{
  return self->_homeGestureDismissalAllowedBlock;
}

- (void)setHomeGestureDismissalAllowedBlock:(id)a3
{
}

- (BOOL)shouldPresentUsingViewService
{
  return self->_shouldPresentUsingViewService;
}

- (void)setShouldPresentUsingViewService:(BOOL)a3
{
  self->_shouldPresentUsingViewService = a3;
}

- (BOOL)isDismissing
{
  return self->_dismissing;
}

- (void)setDismissing:(BOOL)a3
{
  self->_dismissing = a3;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (MediaControlsEndpointsManager)endpointsManager
{
  return self->_endpointsManager;
}

- (void)setEndpointsManager:(id)a3
{
}

- (MPAVRoutingViewController)routingViewController
{
  return self->_routingViewController;
}

- (void)setRoutingViewController:(id)a3
{
}

- (MPAVEndpointRoute)selectedRoute
{
  return self->_selectedRoute;
}

- (NSString)routingContextUID
{
  return self->_routingContextUID;
}

- (void)setExternalPlaybackMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalPlaybackMonitor, 0);
  objc_storeStrong((id *)&self->_routingContextUID, 0);
  objc_storeStrong((id *)&self->_selectedRoute, 0);
  objc_storeStrong((id *)&self->_routingViewController, 0);
  objc_storeStrong((id *)&self->_endpointsManager, 0);
  objc_storeStrong(&self->_homeGestureDismissalAllowedBlock, 0);
  objc_storeStrong(&self->_routingCornerViewTappedBlock, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_outputDeviceRoutingDataSource, 0);
}

@end