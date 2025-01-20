@interface GKServiceViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BOOL)_useBackdropViewForWindowBackground;
- (BOOL)alwaysShowDoneButton;
- (BOOL)shouldAnimatePresentationForPrivateViewController:(id)a3;
- (GKServiceViewController)init;
- (UIViewController)privateViewController;
- (double)_statusBarHeightForCurrentInterfaceOrientation;
- (double)statusBarHeight;
- (id)daemonProxy;
- (id)observedKeyPaths;
- (int)hostPID;
- (void)_addDoneButtonToViewController:(id)a3;
- (void)_startObservingChangesToProperties;
- (void)_stopObservingChangesToProperties;
- (void)cancelServiceViewController;
- (void)constructPrivateViewController;
- (void)dashboardDidChangeToLeaderboardIdentifier:(id)a3;
- (void)dashboardDidChangeToLeaderboardTimeScope:(int64_t)a3;
- (void)dashboardDidChangeToViewState:(int64_t)a3;
- (void)dealloc;
- (void)didRotateFromInterfaceOrientation:(int64_t)a3;
- (void)finishAndPlayChallenge:(id)a3;
- (void)finishWithTurnBasedMatch:(id)a3;
- (void)nudge;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performSelectorOnHostController:(SEL)a3;
- (void)performSelectorOnHostController:(SEL)a3 withObject:(id)a4;
- (void)performSelectorOnHostController:(SEL)a3 withObject:(id)a4 withObject:(id)a5;
- (void)presentInitialViewController:(id)a3;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)quitTurnBasedMatch:(id)a3;
- (void)remoteViewControllerDidCancel;
- (void)remoteViewControllerDidFinish;
- (void)remoteViewControllerIsCanceling;
- (void)remoteViewControllerIsFinishing;
- (void)requestDashboardLogoImageWithHandler:(id)a3;
- (void)requestImagesForLeaderboardSetsWithHandler:(id)a3;
- (void)requestImagesForLeaderboardsInSet:(id)a3 handler:(id)a4;
- (void)resetPrivateViewController;
- (void)serviceViewControllerCreated:(id)a3;
- (void)setAlwaysShowDoneButton:(BOOL)a3;
- (void)setHostPID:(int)a3;
- (void)setInitialState:(id)a3 withReply:(id)a4;
- (void)setPrivateViewController:(id)a3;
- (void)setStatusBarHeight:(double)a3;
- (void)setValue:(id)a3 forKeyPath:(id)a4 withReply:(id)a5;
- (void)setViewControllers:(id)a3 animated:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation GKServiceViewController

- (GKServiceViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)GKServiceViewController;
  v2 = [(GKNavigationController *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v4 = [v3 userInterfaceIdiom];

    if (v4 == 1)
    {
      [(GKServiceViewController *)v2 setModalPresentationStyle:16];
      v5 = [MEMORY[0x1E4F63A10] sharedTheme];
      [v5 formSheetSize];
      -[GKServiceViewController setFormSheetSize:](v2, "setFormSheetSize:");

      *MEMORY[0x1E4F63A38] = 0;
    }
    v2->_alwaysShowDoneButton = 1;
    [(GKServiceViewController *)v2 _startObservingChangesToProperties];
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v2 selector:sel_serviceViewControllerCreated_ name:@"GKServiceViewControllerCreatedNotification" object:0];
    objc_storeStrong(&GKServiceInterfaceController, v2);
  }
  return v2;
}

- (void)dealloc
{
  [(GKServiceViewController *)self _stopObservingChangesToProperties];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)GKServiceViewController;
  [(GKServiceViewController *)&v4 dealloc];
}

- (id)daemonProxy
{
  return (id)[MEMORY[0x1E4F636C8] daemonProxy];
}

+ (id)_exportedInterface
{
  return +[GKRemoteViewServiceController serviceViewControllerInterface];
}

+ (id)_remoteViewControllerInterface
{
  return +[GKRemoteViewServiceController exportedInterface];
}

- (void)remoteViewControllerIsFinishing
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AF250000, v0, v1, "WILL DISMISS", v2, v3, v4, v5, v6);
}

- (void)remoteViewControllerDidFinish
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AF250000, v0, v1, "DISMISSED", v2, v3, v4, v5, v6);
}

- (void)remoteViewControllerIsCanceling
{
  if (!*MEMORY[0x1E4F63860]) {
    id v3 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63868], OS_LOG_TYPE_DEBUG)) {
    -[GKServiceViewController remoteViewControllerIsFinishing]();
  }
  uint64_t v4 = [(GKServiceViewController *)self _remoteViewControllerProxy];
  [v4 remoteViewControllerIsCanceling];
}

- (void)remoteViewControllerDidCancel
{
  if (!*MEMORY[0x1E4F63860]) {
    id v3 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63868], OS_LOG_TYPE_DEBUG)) {
    -[GKServiceViewController remoteViewControllerDidFinish]();
  }
  [(GKServiceViewController *)self dismissViewControllerAnimated:0 completion:&__block_literal_global_13];
}

- (void)cancelServiceViewController
{
  if (*MEMORY[0x1E4F63830]) {
    [(GKServiceViewController *)self remoteViewControllerIsFinishing];
  }
  else {
    [(GKServiceViewController *)self dismissViewControllerAnimated:1 completion:&__block_literal_global_15];
  }
}

- (void)setValue:(id)a3 forKeyPath:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  [(GKServiceViewController *)self setValue:v8 forKeyPath:v9];
  if (!*MEMORY[0x1E4F63860]) {
    id v11 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63868], OS_LOG_TYPE_DEBUG))
  {
    -[GKServiceViewController setValue:forKeyPath:withReply:]();
    if (!v10) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (v10) {
LABEL_5:
  }
    v10[2](v10, 1);
LABEL_6:
}

- (void)setInitialState:(id)a3 withReply:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  id v8 = [v6 objectForKey:@"LocalPlayer"];
  id v9 = [v6 objectForKey:@"StatusBarHeight"];
  v10 = v9;
  if (v9)
  {
    [v9 doubleValue];
    self->_statusBarHeight = v11;
  }
  if (!*MEMORY[0x1E4F63860]) {
    id v12 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63868], OS_LOG_TYPE_DEBUG))
  {
    -[GKServiceViewController setInitialState:withReply:]();
    if (!v8) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (v8)
  {
LABEL_7:
    v13 = [MEMORY[0x1E4F63760] localPlayer];
    [v13 updateFromLocalPlayer:v8];
  }
LABEL_8:
  v14 = [v6 objectForKeyedSubscript:@"HostPID"];
  -[GKServiceViewController setHostPID:](self, "setHostPID:", [v14 integerValue]);

  v15 = [(GKServiceViewController *)self daemonProxy];
  objc_msgSend(v15, "setHostPID:", -[GKServiceViewController hostPID](self, "hostPID"));

  if (!self->_privateViewController && [(GKServiceViewController *)self isViewLoaded]) {
    [(GKServiceViewController *)self constructPrivateViewController];
  }
  if (v7) {
    v7[2](v7, 1);
  }
  v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v19 = @"GKServiceViewControllerNewHostPIDKey";
  v17 = objc_msgSend(NSNumber, "numberWithInt:", -[GKServiceViewController hostPID](self, "hostPID"));
  v20[0] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  [v16 postNotificationName:@"GKServiceViewControllerCreatedNotification" object:self userInfo:v18];
}

- (void)serviceViewControllerCreated:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"GKServiceViewControllerNewHostPIDKey"];
  uint64_t v6 = [v5 integerValue];

  if (v6 != [(GKServiceViewController *)self hostPID])
  {
    [(GKServiceViewController *)self cancelServiceViewController];
  }
}

- (void)nudge
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AF250000, v0, v1, "NUDGE", v2, v3, v4, v5, v6);
}

- (UIViewController)privateViewController
{
  if (!self->_privateViewController && [(GKServiceViewController *)self isViewLoaded]) {
    [(GKServiceViewController *)self constructPrivateViewController];
  }
  privateViewController = self->_privateViewController;

  return privateViewController;
}

- (BOOL)shouldAnimatePresentationForPrivateViewController:(id)a3
{
  return 0;
}

- (void)presentInitialViewController:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(GKServiceViewController *)self shouldAnimatePresentationForPrivateViewController:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(GKServiceViewController *)self presentViewController:v5 animated:v4 completion:&__block_literal_global_21_0];
  }
  else {
    [(GKServiceViewController *)self pushViewController:v5 animated:v4];
  }
}

- (void)constructPrivateViewController
{
  if (self->_privateViewController)
  {
    uint64_t v3 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v4 = [v3 userInterfaceIdiom];

    if (v4 == 1)
    {
      [(GKServiceViewController *)self setModalPresentationStyle:16];
      id v5 = [MEMORY[0x1E4F63A10] sharedTheme];
      [v5 formSheetSize];
      -[GKServiceViewController setFormSheetSize:](self, "setFormSheetSize:");
    }
    else
    {
      [(GKServiceViewController *)self setModalPresentationStyle:17];
    }
    id v10 = [(GKServiceViewController *)self view];
    [v10 setClipsToBounds:0];
    uint8_t v6 = [MEMORY[0x1E4F639B0] sharedPalette];
    v7 = [v6 systemInteractionColor];
    [v10 setTintColor:v7];

    id v8 = [(GKServiceViewController *)self visibleViewController];

    if (v8)
    {
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObject:self->_privateViewController];
      [(GKServiceViewController *)self setViewControllers:v9 animated:0];
    }
    [(GKServiceViewController *)self presentInitialViewController:self->_privateViewController];
  }
}

- (void)resetPrivateViewController
{
  privateViewController = self->_privateViewController;
  if (privateViewController)
  {
    uint64_t v4 = [(UIViewController *)privateViewController view];
    [v4 removeFromSuperview];

    [(GKServiceViewController *)self setPrivateViewController:0];
  }
}

- (BOOL)_useBackdropViewForWindowBackground
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860]) {
    id v6 = (id)GKOSLoggers();
  }
  v7 = (os_log_t *)MEMORY[0x1E4F63868];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63868], OS_LOG_TYPE_DEBUG)) {
    -[GKRemoteViewServiceController viewWillAppear:]();
  }
  if (!*v5) {
    id v8 = (id)GKOSLoggers();
  }
  os_log_t v9 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEBUG)) {
    -[GKServiceViewController viewWillAppear:](v9);
  }
  id v10 = [(GKServiceViewController *)self daemonProxy];
  objc_msgSend(v10, "setHostPID:", -[GKServiceViewController hostPID](self, "hostPID"));

  double v11 = [(GKServiceViewController *)self daemonProxy];
  [v11 setDataUpdateDelegate:self];

  v17.receiver = self;
  v17.super_class = (Class)GKServiceViewController;
  [(GKServiceViewController *)&v17 viewWillAppear:v3];
  if ([(GKServiceViewController *)self _useBackdropViewForWindowBackground])
  {
    id v12 = [(GKServiceViewController *)self navigationBar];
    v13 = [v12 _backdropViewLayerGroupName];

    v14 = [(GKServiceViewController *)self parentViewController];
    v15 = [v14 view];
    v16 = [v15 window];
    [v16 _gkUseAsModalSheetBackgroundWithGroupName:v13];
  }
  else
  {
    v13 = [MEMORY[0x1E4F639B0] sharedPalette];
    v14 = [v13 viewBackgroundColor];
    v15 = [v14 colorWithAlphaComponent:1.0];
    v16 = [(GKServiceViewController *)self view];
    [v16 setBackgroundColor:v15];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860]) {
    id v6 = (id)GKOSLoggers();
  }
  v7 = (os_log_t *)MEMORY[0x1E4F63868];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63868], OS_LOG_TYPE_DEBUG)) {
    -[GKHostedViewController viewDidAppear:]();
  }
  if (!*v5) {
    id v8 = (id)GKOSLoggers();
  }
  os_log_t v9 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEBUG)) {
    -[GKServiceViewController viewWillAppear:](v9);
  }
  v10.receiver = self;
  v10.super_class = (Class)GKServiceViewController;
  [(GKServiceViewController *)&v10 viewDidAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860]) {
    id v6 = (id)GKOSLoggers();
  }
  v7 = (os_log_t *)MEMORY[0x1E4F63868];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63868], OS_LOG_TYPE_DEBUG)) {
    -[GKRemoteViewServiceController viewWillDisappear:]();
  }
  if (!*v5) {
    id v8 = (id)GKOSLoggers();
  }
  os_log_t v9 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEBUG)) {
    -[GKServiceViewController viewWillAppear:](v9);
  }
  v10.receiver = self;
  v10.super_class = (Class)GKServiceViewController;
  [(GKServiceViewController *)&v10 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860]) {
    id v6 = (id)GKOSLoggers();
  }
  v7 = (os_log_t *)MEMORY[0x1E4F63868];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63868], OS_LOG_TYPE_DEBUG)) {
    -[GKRemoteViewServiceController viewDidDisappear:]();
  }
  if (!*v5) {
    id v8 = (id)GKOSLoggers();
  }
  os_log_t v9 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEBUG)) {
    -[GKServiceViewController viewWillAppear:](v9);
  }
  v13.receiver = self;
  v13.super_class = (Class)GKServiceViewController;
  [(GKServiceViewController *)&v13 viewDidDisappear:v3];
  objc_super v10 = [(GKServiceViewController *)self daemonProxy];
  double v11 = [v10 dataUpdateDelegate];

  if (v11 == self)
  {
    id v12 = [(GKServiceViewController *)self daemonProxy];
    [v12 setDataUpdateDelegate:0];
  }
}

- (void)finishAndPlayChallenge:(id)a3
{
  id v4 = [a3 internal];
  [(GKServiceViewController *)self performSelectorOnHostController:sel_playPressedForChallenge_ withObject:v4];
}

- (void)finishWithTurnBasedMatch:(id)a3
{
  id v4 = [a3 internal];
  [(GKServiceViewController *)self performSelectorOnHostController:sel_finishWithMatch_ withObject:v4];
}

- (void)quitTurnBasedMatch:(id)a3
{
  id v4 = [a3 internal];
  [(GKServiceViewController *)self performSelectorOnHostController:sel_playerQuitMatch_ withObject:v4];
}

- (void)dashboardDidChangeToViewState:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(GKServiceViewController *)self performSelectorOnHostController:sel_setViewState_ withObject:v4];
}

- (void)dashboardDidChangeToLeaderboardTimeScope:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(GKServiceViewController *)self performSelectorOnHostController:sel_setLeaderboardTimeScope_ withObject:v4];
}

- (void)dashboardDidChangeToLeaderboardIdentifier:(id)a3
{
}

- (void)requestDashboardLogoImageWithHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  [(GKServiceViewController *)self performSelectorOnHostController:sel_requestDashboardLogoImageWithHandler_ withObject:v4];
}

- (void)requestImagesForLeaderboardSetsWithHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  [(GKServiceViewController *)self performSelectorOnHostController:sel_requestImagesForLeaderboardSetsWithHandler_ withObject:v4];
}

- (void)requestImagesForLeaderboardsInSet:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = _Block_copy(a4);
  [(GKServiceViewController *)self performSelectorOnHostController:sel_requestImagesForLeaderboardsInSet_handler_ withObject:v6 withObject:v7];
}

- (void)performSelectorOnHostController:(SEL)a3
{
  id v4 = [(GKServiceViewController *)self _remoteViewControllerProxy];
  [v4 _gkPerformSelector:a3];
}

- (void)performSelectorOnHostController:(SEL)a3 withObject:(id)a4
{
  id v6 = a4;
  id v7 = [(GKServiceViewController *)self _remoteViewControllerProxy];
  [v7 _gkPerformSelector:a3 withObject:v6];
}

- (void)performSelectorOnHostController:(SEL)a3 withObject:(id)a4 withObject:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(GKServiceViewController *)self _remoteViewControllerProxy];
  [v10 _gkPerformSelector:a3 withObject:v9 withObject:v8];
}

- (id)observedKeyPaths
{
  return (id)[MEMORY[0x1E4F1C978] array];
}

- (void)_startObservingChangesToProperties
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  if (![(GKServiceViewController *)v2 observationInfo])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    BOOL v3 = [(GKServiceViewController *)v2 observedKeyPaths];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v4)
    {
      uint64_t v6 = v4;
      uint64_t v7 = *(void *)v16;
      id v8 = (void *)MEMORY[0x1E4F63860];
      id v9 = (os_log_t *)MEMORY[0x1E4F63868];
      *(void *)&long long v5 = 138412290;
      long long v14 = v5;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v3);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          -[GKServiceViewController addObserver:forKeyPath:options:context:](v2, "addObserver:forKeyPath:options:context:", v2, v11, 0, 0, v14);
          if (!*v8) {
            id v12 = (id)GKOSLoggers();
          }
          objc_super v13 = *v9;
          if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v14;
            uint64_t v20 = v11;
            _os_log_debug_impl(&dword_1AF250000, v13, OS_LOG_TYPE_DEBUG, "observing keyPath %@", buf, 0xCu);
          }
        }
        uint64_t v6 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
      }
      while (v6);
    }
  }
}

- (void)_stopObservingChangesToProperties
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = [(GKServiceViewController *)self observedKeyPaths];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(GKServiceViewController *)self removeObserver:self forKeyPath:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a3;
  long long v8 = [(GKServiceViewController *)self observedKeyPaths];
  int v9 = [v8 containsObject:v7];

  if (v9)
  {
    long long v10 = [(GKServiceViewController *)self valueForKeyPath:v7];
    if (!*MEMORY[0x1E4F63860]) {
      id v11 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63868], OS_LOG_TYPE_DEBUG)) {
      -[GKServiceViewController observeValueForKeyPath:ofObject:change:context:]();
    }
  }
}

- (void)_addDoneButtonToViewController:(id)a3
{
  id v9 = a3;
  if (([v9 _gkServiceWantsCustomRightBarButtonItemInViewService] & 1) == 0)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB14A8]);
    uint64_t v5 = GKGameCenterUIFrameworkBundle();
    uint64_t v6 = GKGetLocalizedStringFromTableInBundle();
    id v7 = (void *)[v4 initWithTitle:v6 style:2 target:self action:sel_donePressed_];
    long long v8 = [v9 navigationItem];
    [v8 setRightBarButtonItem:v7];
  }
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(GKServiceViewController *)self alwaysShowDoneButton]) {
    [(GKServiceViewController *)self _addDoneButtonToViewController:v6];
  }
  v7.receiver = self;
  v7.super_class = (Class)GKServiceViewController;
  [(GKNavigationController *)&v7 pushViewController:v6 animated:v4];
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        if ([(GKServiceViewController *)self alwaysShowDoneButton]) {
          [(GKServiceViewController *)self _addDoneButtonToViewController:v11];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  v12.receiver = self;
  v12.super_class = (Class)GKServiceViewController;
  [(GKServiceViewController *)&v12 setViewControllers:v6 animated:v4];
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  if (!*MEMORY[0x1E4F63860]) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = (void *)*MEMORY[0x1E4F63868];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63868], OS_LOG_TYPE_DEBUG)) {
    [(GKServiceViewController *)a3 didRotateFromInterfaceOrientation:self];
  }
  v7.receiver = self;
  v7.super_class = (Class)GKServiceViewController;
  [(GKServiceViewController *)&v7 didRotateFromInterfaceOrientation:a3];
}

- (double)_statusBarHeightForCurrentInterfaceOrientation
{
  return self->_statusBarHeight;
}

- (void)setPrivateViewController:(id)a3
{
}

- (BOOL)alwaysShowDoneButton
{
  return self->_alwaysShowDoneButton;
}

- (void)setAlwaysShowDoneButton:(BOOL)a3
{
  self->_alwaysShowDoneButton = a3;
}

- (int)hostPID
{
  return self->_hostPID;
}

- (void)setHostPID:(int)a3
{
  self->_hostPID = a3;
}

- (double)statusBarHeight
{
  return self->_statusBarHeight;
}

- (void)setStatusBarHeight:(double)a3
{
  self->_statusBarHeight = a3;
}

- (void).cxx_destruct
{
}

- (void)setValue:forKeyPath:withReply:.cold.1()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_0_2(&dword_1AF250000, v0, v1, "host changed keyPath %@ to %@");
}

- (void)setInitialState:withReply:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_1AF250000, v0, OS_LOG_TYPE_DEBUG, "setting player LP:%@", v1, 0xCu);
}

- (void)viewWillAppear:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  BOOL v3 = [(id)OUTLINED_FUNCTION_1_3() callStackSymbols];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1AF250000, v4, v5, "%@", v6, v7, v8, v9, v10);
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.1()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_0_2(&dword_1AF250000, v0, v1, "changed keyPath %@ to %@");
}

- (void)didRotateFromInterfaceOrientation:(void *)a3 .cold.1(unint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a1 >= 5) {
    uint64_t v4 = @"UIInterfaceOrientationPortrait";
  }
  else {
    uint64_t v4 = off_1E5F65F00[a1];
  }
  uint64_t v5 = a2;
  unint64_t v6 = [a3 interfaceOrientation];
  if (v6 >= 5) {
    uint64_t v7 = @"UIInterfaceOrientationPortrait";
  }
  else {
    uint64_t v7 = off_1E5F65F00[v6];
  }
  int v8 = 138412546;
  uint64_t v9 = v4;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  _os_log_debug_impl(&dword_1AF250000, v5, OS_LOG_TYPE_DEBUG, "rotated from %@ to %@", (uint8_t *)&v8, 0x16u);
}

@end