@interface DSNavigationController
+ (void)initialize;
- (BOOL)isDetailControllerClass:(Class)a3;
- (BOOL)isInFamiliarLocation;
- (BOOL)isNetworkReachable;
- (BOOL)isReachable;
- (BOOL)isShowingNetworkError;
- (BOOL)requiresAuthForEntry;
- (BOOL)shouldFinishFlow;
- (Class)deepLinkPaneType;
- (Class)startingPaneType;
- (Class)topViewControllerType;
- (DSDaemonProxy)daemonProxy;
- (DSDeepLinkRepresentation)deepLink;
- (DSNavigationController)init;
- (DSNavigationManager)navigationManager;
- (DSRemoteUILoader)remoteUILoader;
- (DSSharingPermissions)fetchedSharingPermissions;
- (LAContext)authContext;
- (NSArray)navigationOrder;
- (NSDictionary)cachedPanes;
- (NSDictionary)navigationChapters;
- (NSMutableDictionary)unsharedResourcesBySource;
- (NSMutableSet)reviewedComputers;
- (NSMutableSet)unpairedComputers;
- (NSMutableSet)unsharedApps;
- (NSMutableSet)unsharedPeople;
- (NSMutableSet)unsharedPermissions;
- (NSString)entryMethod;
- (OS_dispatch_queue)workQueue;
- (OS_nw_path_monitor)pathMonitor;
- (UINavigationController)connectionErrorNavigation;
- (UIViewController)networkErrorController;
- (UIWindow)obfuscationWindow;
- (id)deepLinkForCurrentFlowAndPane;
- (id)flowTypeForAnalytics;
- (id)initStartingWithDeviceAccess;
- (id)initStartingWithEmergencyReset;
- (id)initStartingWithMangeSharing;
- (id)initStartingWithURL:(id)a3;
- (id)paneBeforePane:(id)a3;
- (id)paneInstanceForType:(Class)a3;
- (id)popViewControllerAnimated:(BOOL)a3;
- (int64_t)currentChapter;
- (int64_t)currentChapterForAnalytics;
- (int64_t)currentFlowType;
- (void)_pushWelcomeControllerAsTopView;
- (void)_setupRatchetObserver;
- (void)authToReturnToSafetyCheck;
- (void)cancel;
- (void)dealloc;
- (void)didEnterBackground:(id)a3;
- (void)displayNetworkError;
- (void)exitFlowForRatchetWait;
- (void)finishFlow;
- (void)goToCustomizeSharing;
- (void)hideNetworkError;
- (void)learnMorePressedForController:(id)a3 withURL:(id)a4;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)popToPreviousPane:(id)a3;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)pushNextPane;
- (void)pushPaneAfterPaneType:(Class)a3;
- (void)pushPaneType:(Class)a3;
- (void)pushPaneType:(Class)a3 loadRemoteUI:(BOOL)a4;
- (void)pushPaneWithController:(id)a3 paneType:(Class)a4 shouldShow:(BOOL)a5;
- (void)quickExit;
- (void)ratchetStateDidChange:(id)a3;
- (void)resetRemoteUI;
- (void)sendSummaryAnalyticsWithEventName:(id)a3;
- (void)sendSummaryAnalyticsWithQuickExit:(BOOL)a3 finalScreen:(BOOL)a4;
- (void)setAuthContext:(id)a3;
- (void)setCachedPanes:(id)a3;
- (void)setConnectionErrorNavigation:(id)a3;
- (void)setCurrentChapter:(int64_t)a3;
- (void)setCurrentChapterForAnalytics:(int64_t)a3;
- (void)setCurrentFlowType:(int64_t)a3;
- (void)setDaemonProxy:(id)a3;
- (void)setDeepLink:(id)a3;
- (void)setDeepLinkPaneType:(Class)a3;
- (void)setEntryMethod:(id)a3;
- (void)setFetchedSharingPermissions:(id)a3;
- (void)setIsReachable:(BOOL)a3;
- (void)setIsShowingNetworkError:(BOOL)a3;
- (void)setNavigationChapters:(id)a3;
- (void)setNavigationManager:(id)a3;
- (void)setNavigationOrder:(id)a3;
- (void)setNavigationOrderAndChapters;
- (void)setNetworkErrorController:(id)a3;
- (void)setObfuscationWindow:(id)a3;
- (void)setRemoteUILoader:(id)a3;
- (void)setRequiresAuthForEntry:(BOOL)a3;
- (void)setReviewedComputers:(id)a3;
- (void)setStartingPaneType:(Class)a3;
- (void)setUnpairedComputers:(id)a3;
- (void)setUnsharedApps:(id)a3;
- (void)setUnsharedPeople:(id)a3;
- (void)setUnsharedPermissions:(id)a3;
- (void)setUnsharedResourcesBySource:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)setupCancelButtonWithController:(id)a3;
- (void)setupChapterIndicatorWithController:(id)a3;
- (void)setupConnectionError;
- (void)setupQuickExitButtonWithController:(id)a3;
- (void)startFlowWithType:(int64_t)a3;
- (void)startWithURL:(id)a3;
- (void)updateCurrentChapterWithPaneType:(Class)a3;
- (void)updateDaemonModelForCurrentPane;
- (void)updateReachabilityState:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willEnterForeground:(id)a3;
- (void)willResignActive:(id)a3;
@end

@implementation DSNavigationController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    os_log_t v2 = os_log_create("com.apple.DigitalSeparation", "DSNavigationController");
    uint64_t v3 = DSLog_13;
    DSLog_13 = (uint64_t)v2;
    MEMORY[0x270F9A758](v2, v3);
  }
}

- (DSNavigationController)init
{
  v34.receiver = self;
  v34.super_class = (Class)DSNavigationController;
  id v2 = [(DSNavigationController *)&v34 init];
  if (v2)
  {
    uint64_t v3 = DSLog_13;
    if (os_log_type_enabled((os_log_t)DSLog_13, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_235BFC000, v3, OS_LOG_TYPE_INFO, "Initializing DSNavigationController", (uint8_t *)buf, 2u);
    }
    v4 = objc_alloc_init(DSNavigationManager);
    [v2 setNavigationManager:v4];

    if ([MEMORY[0x263F3A390] shouldShowBioRatchetFlow]) {
      [v2 _setupRatchetObserver];
    }
    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    v6 = (void *)*((void *)v2 + 198);
    *((void *)v2 + 198) = v5;

    uint64_t v7 = [MEMORY[0x263EFF9C0] set];
    v8 = (void *)*((void *)v2 + 199);
    *((void *)v2 + 199) = v7;

    uint64_t v9 = [MEMORY[0x263EFF9C0] set];
    v10 = (void *)*((void *)v2 + 200);
    *((void *)v2 + 200) = v9;

    uint64_t v11 = [MEMORY[0x263EFF9C0] set];
    v12 = (void *)*((void *)v2 + 201);
    *((void *)v2 + 201) = v11;

    uint64_t v13 = [MEMORY[0x263EFF9C0] set];
    v14 = (void *)*((void *)v2 + 202);
    *((void *)v2 + 202) = v13;

    uint64_t v15 = [MEMORY[0x263EFF9C0] set];
    v16 = (void *)*((void *)v2 + 203);
    *((void *)v2 + 203) = v15;

    [v2 setCurrentChapterForAnalytics:1];
    [v2 setDelegate:v2];
    v17 = [v2 presentationController];
    [v17 setDelegate:v2];

    id v18 = objc_alloc_init(MEMORY[0x263F10468]);
    v19 = (void *)*((void *)v2 + 180);
    *((void *)v2 + 180) = v18;

    [v2 setupConnectionError];
    dispatch_queue_t v20 = dispatch_queue_create("NetworkUpdateQueue", 0);
    [v2 setWorkQueue:v20];

    id v21 = objc_alloc_init(MEMORY[0x263F3A358]);
    [v2 setDaemonProxy:v21];

    nw_path_monitor_t v22 = nw_path_monitor_create();
    v23 = (void *)*((void *)v2 + 194);
    *((void *)v2 + 194) = v22;

    objc_initWeak(buf, v2);
    v24 = [v2 pathMonitor];
    update_handler[0] = MEMORY[0x263EF8330];
    update_handler[1] = 3221225472;
    update_handler[2] = __30__DSNavigationController_init__block_invoke;
    update_handler[3] = &unk_264C6F328;
    objc_copyWeak(&v32, buf);
    nw_path_monitor_set_update_handler(v24, update_handler);

    v25 = [v2 pathMonitor];
    v26 = [v2 workQueue];
    nw_path_monitor_set_queue(v25, v26);

    nw_path_monitor_start(*((nw_path_monitor_t *)v2 + 194));
    v27 = [MEMORY[0x263F08A00] defaultCenter];
    [v27 addObserver:v2 selector:sel_willEnterForeground_ name:*MEMORY[0x263F833B8] object:0];

    v28 = [MEMORY[0x263F08A00] defaultCenter];
    [v28 addObserver:v2 selector:sel_didEnterBackground_ name:*MEMORY[0x263F83330] object:0];

    v29 = [MEMORY[0x263F08A00] defaultCenter];
    [v29 addObserver:v2 selector:sel_willResignActive_ name:*MEMORY[0x263F833C0] object:0];

    objc_destroyWeak(&v32);
    objc_destroyWeak(buf);
  }
  return (DSNavigationController *)v2;
}

void __30__DSNavigationController_init__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained updateReachabilityState:v3];
}

- (void)setNavigationOrderAndChapters
{
  id v3 = [(DSNavigationController *)self navigationManager];
  v4 = objc_msgSend(v3, "navigationOrderForFlowType:", -[DSNavigationController currentFlowType](self, "currentFlowType"));
  [(DSNavigationController *)self setNavigationOrder:v4];

  id v6 = [(DSNavigationController *)self navigationManager];
  uint64_t v5 = objc_msgSend(v6, "navigationChaptersForFlowType:", -[DSNavigationController currentFlowType](self, "currentFlowType"));
  [(DSNavigationController *)self setNavigationChapters:v5];
}

- (void)updateReachabilityState:(id)a3
{
  v4 = a3;
  uint64_t v5 = [(DSNavigationController *)self workQueue];
  dispatch_assert_queue_V2((dispatch_queue_t)v5);

  LODWORD(v5) = nw_path_get_status(v4);
  [(DSNavigationController *)self setIsReachable:(v5 & 0xFFFFFFFD) == 1];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__DSNavigationController_updateReachabilityState___block_invoke;
  v6[3] = &unk_264C6F350;
  v6[4] = self;
  BOOL v7 = (v5 & 0xFFFFFFFD) == 1;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __50__DSNavigationController_updateReachabilityState___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isShowingNetworkError];
  if (result)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      [*(id *)(a1 + 32) hideNetworkError];
      uint64_t v3 = [*(id *)(a1 + 32) topViewControllerType];
      uint64_t result = objc_opt_class();
      if (v3 == result)
      {
        v4 = *(void **)(a1 + 32);
        return [v4 resetRemoteUI];
      }
    }
  }
  return result;
}

- (id)initStartingWithEmergencyReset
{
  id v2 = [(DSNavigationController *)self init];
  if (v2)
  {
    [(DSNavigationController *)v2 setStartingPaneType:objc_opt_class()];
    [(DSNavigationController *)v2 setCurrentFlowType:0];
    [(DSNavigationController *)v2 setNavigationOrderAndChapters];
  }
  return v2;
}

- (id)initStartingWithMangeSharing
{
  id v2 = [(DSNavigationController *)self init];
  if (v2)
  {
    [(DSNavigationController *)v2 setStartingPaneType:objc_opt_class()];
    [(DSNavigationController *)v2 setCurrentFlowType:1];
    [(DSNavigationController *)v2 setNavigationOrderAndChapters];
  }
  return v2;
}

- (id)initStartingWithDeviceAccess
{
  id v2 = [(DSNavigationController *)self init];
  uint64_t v3 = v2;
  if (v2)
  {
    v4 = [(DSNavigationController *)v2 navigationBar];
    [v4 setHidden:1];

    uint64_t v5 = [(DSNavigationController *)v3 navigationItem];
    [v5 setHidesBackButton:1];

    [(DSNavigationController *)v3 setCurrentFlowType:2];
    [(DSNavigationController *)v3 setNavigationOrderAndChapters];
    id v6 = [(DSNavigationController *)v3 navigationOrder];
    -[DSNavigationController setStartingPaneType:](v3, "setStartingPaneType:", [v6 firstObject]);
  }
  return v3;
}

- (id)initStartingWithURL:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(DSNavigationController *)self init];
  id v6 = v5;
  if (!v5) {
    goto LABEL_4;
  }
  BOOL v7 = [(DSNavigationController *)v5 navigationManager];
  char v8 = [v7 shouldIngestURL:v4];

  if (v8)
  {
    [(DSNavigationController *)v6 startWithURL:v4];
LABEL_4:
    uint64_t v9 = v6;
    goto LABEL_8;
  }
  v10 = DSLog_13;
  if (os_log_type_enabled((os_log_t)DSLog_13, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl(&dword_235BFC000, v10, OS_LOG_TYPE_INFO, "Safety Check will not act on URL path %@, staying on landing page", (uint8_t *)&v12, 0xCu);
  }
  uint64_t v9 = 0;
LABEL_8:

  return v9;
}

- (void)startWithURL:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(DSNavigationController *)self navigationManager];
  id v6 = [v5 navigationForURL:v4];

  BOOL v7 = DSLog_13;
  if (os_log_type_enabled((os_log_t)DSLog_13, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412290;
    int v12 = v6;
    _os_log_impl(&dword_235BFC000, v7, OS_LOG_TYPE_INFO, "Initiating new flow for deep link: %@", (uint8_t *)&v11, 0xCu);
  }
  [(DSNavigationController *)self setDeepLink:v6];
  char v8 = [v6 navigationOrder];
  -[DSNavigationController setStartingPaneType:](self, "setStartingPaneType:", [v8 firstObject]);

  -[DSNavigationController setCurrentFlowType:](self, "setCurrentFlowType:", [v6 flowType]);
  uint64_t v9 = [v6 navigationOrder];
  [(DSNavigationController *)self setNavigationOrder:v9];

  v10 = [v6 navigationChapters];
  [(DSNavigationController *)self setNavigationChapters:v10];
}

- (void)viewWillAppear:(BOOL)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  v9.receiver = self;
  v9.super_class = (Class)DSNavigationController;
  [(DSNavigationController *)&v9 viewWillAppear:a3];
  id v4 = [(DSNavigationController *)self cachedPanes];

  if (!v4)
  {
    if ((MGGetBoolAnswer() & 1) != 0 || [(DSNavigationController *)self currentFlowType] == 2)
    {
      [(DSNavigationController *)self setCachedPanes:MEMORY[0x263EFFA78]];
    }
    else
    {
      uint64_t v5 = objc_alloc_init(DSSharingPermissionsController);
      [(DSSharingPermissionsController *)v5 setDelegate:self];
      [(DSSharingPermissionsController *)v5 setUrgentFetchNeeded];
      id v6 = (objc_class *)objc_opt_class();
      BOOL v7 = NSStringFromClass(v6);
      v10 = v7;
      v11[0] = v5;
      char v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
      [(DSNavigationController *)self setCachedPanes:v8];
    }
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)DSNavigationController;
  [(OBNavigationController *)&v3 viewDidLoad];
  [(DSNavigationController *)self pushPaneType:[(DSNavigationController *)self startingPaneType]];
}

- (void)dealloc
{
  objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F833C0] object:0];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F83318] object:0];

  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x263F833B8] object:0];

  v6.receiver = self;
  v6.super_class = (Class)DSNavigationController;
  [(DSNavigationController *)&v6 dealloc];
}

- (void)setupConnectionError
{
  objc_super v3 = (UIViewController *)objc_alloc_init(MEMORY[0x263F82E10]);
  networkErrorController = self->_networkErrorController;
  self->_networkErrorController = v3;

  uint64_t v5 = [(DSNavigationController *)self networkErrorController];
  [v5 setModalPresentationStyle:0];

  id v6 = objc_alloc(MEMORY[0x263F829B8]);
  BOOL v7 = [(DSNavigationController *)self networkErrorController];
  char v8 = (UINavigationController *)[v6 initWithRootViewController:v7];
  connectionErrorNavigation = self->_connectionErrorNavigation;
  self->_connectionErrorNavigation = v8;

  v10 = [(DSNavigationController *)self connectionErrorNavigation];
  [v10 setModalPresentationStyle:0];

  int v11 = [(DSNavigationController *)self networkErrorController];
  int v12 = [v11 navigationItem];
  id v13 = objc_alloc(MEMORY[0x263F824A8]);
  uint64_t v14 = DSUILocStringForKey(@"CANCEL");
  uint64_t v15 = (void *)[v13 initWithTitle:v14 style:0 target:self action:sel_cancel];
  [v12 setLeftBarButtonItem:v15];

  v16 = [(DSNavigationController *)self networkErrorController];
  v17 = [v16 navigationItem];
  id v18 = objc_alloc(MEMORY[0x263F824A8]);
  v19 = DSUILocStringForKey(@"QUICK_EXIT");
  dispatch_queue_t v20 = (void *)[v18 initWithTitle:v19 style:0 target:self action:sel_quickExit];
  [v17 setRightBarButtonItem:v20];

  id v36 = [MEMORY[0x263F82600] emptyProminentConfiguration];
  id v21 = DSUILocStringForKey(@"NO_CONNECTION_TITLE");
  [v36 setText:v21];

  int v22 = MGGetBoolAnswer();
  v23 = @"WIFI";
  if (v22) {
    v23 = @"WLAN";
  }
  v24 = [NSString stringWithFormat:@"%@_NO_CONNECTION_DETAIL", v23];
  v25 = DSUILocStringForKey(v24);

  [v36 setSecondaryText:v25];
  v26 = [MEMORY[0x263F827E8] systemImageNamed:@"bolt.horizontal.fill"];
  [v36 setImage:v26];

  v27 = DSUILocStringForKey(@"GO_TO_SETTINGS");
  v28 = [v36 buttonProperties];
  v29 = [v28 configuration];
  [v29 setTitle:v27];

  v30 = [MEMORY[0x263F823D0] actionWithHandler:&__block_literal_global_17];
  v31 = [v36 buttonProperties];
  [v31 setPrimaryAction:v30];

  id v32 = [(DSNavigationController *)self networkErrorController];
  [v32 _setContentUnavailableConfiguration:v36];

  v33 = [MEMORY[0x263F825C8] systemBackgroundColor];
  objc_super v34 = [(DSNavigationController *)self networkErrorController];
  v35 = [v34 view];
  [v35 setBackgroundColor:v33];
}

void __46__DSNavigationController_setupConnectionError__block_invoke()
{
  id v1 = [MEMORY[0x263F01880] defaultWorkspace];
  v0 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings"];
  [v1 openSensitiveURL:v0 withOptions:MEMORY[0x263EFFA78]];
}

- (void)displayNetworkError
{
  objc_super v3 = [(DSNavigationController *)self connectionErrorNavigation];
  [(DSNavigationController *)self presentViewController:v3 animated:1 completion:0];

  self->_isShowingNetworkError = 1;
}

- (void)hideNetworkError
{
  objc_super v3 = [(DSNavigationController *)self networkErrorController];
  [(DSNavigationController *)self dismissViewControllerAnimated:v3 != 0 completion:0];

  self->_isShowingNetworkError = 0;
}

- (void)goToCustomizeSharing
{
  objc_super v3 = [(DSNavigationController *)self presentingViewController];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__DSNavigationController_goToCustomizeSharing__block_invoke;
  v5[3] = &unk_264C6E7D0;
  v5[4] = self;
  [v3 dismissViewControllerAnimated:1 completion:v5];

  [(DSNavigationController *)self setStartingPaneType:objc_opt_class()];
  [(DSNavigationController *)self setCurrentFlowType:1];
  [(DSNavigationController *)self setNavigationOrderAndChapters];
  [(DSNavigationController *)self pushPaneType:[(DSNavigationController *)self startingPaneType]];
  id v4 = [(DSNavigationController *)self presentingViewController];
  [v4 presentViewController:self animated:1 completion:0];
}

uint64_t __46__DSNavigationController_goToCustomizeSharing__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setViewControllers:MEMORY[0x263EFFA68]];
}

- (void)pushNextPane
{
  [(DSNavigationController *)self updateDaemonModelForCurrentPane];
  if ([(DSNavigationController *)self shouldFinishFlow]) {
    [(DSNavigationController *)self finishFlow];
  }
  objc_super v3 = [(DSNavigationController *)self topViewControllerType];
  [(DSNavigationController *)self pushPaneAfterPaneType:v3];
}

- (BOOL)shouldFinishFlow
{
  objc_super v3 = [(DSNavigationController *)self topViewControllerType];
  id v4 = [(DSNavigationController *)self navigationOrder];
  LOBYTE(v3) = v3 == (objc_class *)[v4 lastObject];

  return (char)v3;
}

- (void)finishFlow
{
  [(DSNavigationController *)self sendSummaryAnalyticsWithQuickExit:0 finalScreen:1];
  id v3 = [(DSNavigationController *)self presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)exitFlowForRatchetWait
{
  id v2 = [(DSNavigationController *)self presentingViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  id v4 = [(DSNavigationController *)self topViewController];
  [(DSNavigationController *)self popToPreviousPane:v4];
  return v4;
}

- (id)paneBeforePane:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DSNavigationController *)self viewControllers];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 - 1 >= (unint64_t)[v5 count])
  {
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = [v5 objectAtIndex:v6 - 1];
  }

  return v7;
}

- (void)popToPreviousPane:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  uint64_t v5 = [(DSNavigationController *)self paneBeforePane:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
    if (objc_opt_respondsToSelector())
    {
      char v8 = [v7 buttonTray];
      [v8 showButtonsAvailable];
    }
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ![(DSNavigationController *)self isDetailControllerClass:objc_opt_class()])
    {
      if (![v7 shouldShow])
      {
        [(DSNavigationController *)self popToPreviousPane:v7];
        goto LABEL_14;
      }
      v16.receiver = self;
      v16.super_class = (Class)DSNavigationController;
      id v9 = [(DSNavigationController *)&v16 popToViewController:v7 animated:1];
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0
        && ![(DSNavigationController *)self isDetailControllerClass:objc_opt_class()])
      {
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __44__DSNavigationController_popToPreviousPane___block_invoke;
        v12[3] = &unk_264C6F3C0;
        id v13 = v7;
        uint64_t v14 = self;
        id v15 = v13;
        [v15 shouldShowWithCompletion:v12];

        goto LABEL_14;
      }
      v11.receiver = self;
      v11.super_class = (Class)DSNavigationController;
      id v9 = [(DSNavigationController *)&v11 popToViewController:v7 animated:1];
    }
    id v10 = v9;
LABEL_14:
  }
}

void __44__DSNavigationController_popToPreviousPane___block_invoke(uint64_t a1, char a2)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__DSNavigationController_popToPreviousPane___block_invoke_2;
  v6[3] = &unk_264C6F398;
  char v10 = a2;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(a1 + 48);
  id v7 = v3;
  uint64_t v8 = v4;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

id __44__DSNavigationController_popToPreviousPane___block_invoke_2(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 56);
  id v3 = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v7.receiver = v3;
    v7.super_class = (Class)DSNavigationController;
    return objc_msgSendSuper2(&v7, sel_popToViewController_animated_, v4, 1);
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    return (id)[v3 popToPreviousPane:v6];
  }
}

- (void)pushPaneAfterPaneType:(Class)a3
{
  uint64_t v5 = [(DSNavigationController *)self navigationOrder];
  uint64_t v6 = [v5 indexOfObject:a3];
  unint64_t v7 = v6 + 1;
  BOOL v8 = v6 == -1;

  if (!v8)
  {
    id v9 = [(DSNavigationController *)self navigationOrder];
    unint64_t v10 = [v9 count];

    if (v7 < v10)
    {
      objc_super v11 = [(DSNavigationController *)self navigationOrder];
      uint64_t v12 = [v11 objectAtIndex:v7];

      if (v12)
      {
        [(DSNavigationController *)self pushPaneType:v12];
      }
    }
  }
}

- (void)pushPaneType:(Class)a3 loadRemoteUI:(BOOL)a4
{
  BOOL v4 = a4;
  if ((Class)objc_opt_class() != a3 || !v4)
  {
    BOOL v8 = [(DSNavigationController *)self navigationManager];
    id v9 = [v8 panesRequiringNetwork];
    if ([v9 containsObject:a3])
    {
      BOOL v10 = [(DSNavigationController *)self isNetworkReachable];

      if (!v10) {
        goto LABEL_14;
      }
    }
    else
    {
    }
    id v21 = [(DSNavigationController *)self paneInstanceForType:a3];
    [v21 setDelegate:self];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v22 = [v21 shouldShow];
      v23 = self;
      v24 = v21;
      Class v25 = a3;
    }
    else
    {
      if (objc_opt_respondsToSelector())
      {
        v26 = [(DSNavigationController *)self topViewController];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v28 = [(DSNavigationController *)self topViewController];
          v29 = [v28 buttonTray];
          [v29 showButtonsBusy];
        }
        else
        {
          v28 = 0;
        }
        objc_initWeak(&location, self);
        v34[0] = MEMORY[0x263EF8330];
        v34[1] = 3221225472;
        v34[2] = __52__DSNavigationController_pushPaneType_loadRemoteUI___block_invoke;
        v34[3] = &unk_264C6F410;
        objc_copyWeak(v38, &location);
        id v33 = v28;
        id v35 = v33;
        id v36 = self;
        v38[1] = a3;
        id v37 = v21;
        [v37 shouldShowWithCompletion:v34];

        objc_destroyWeak(v38);
        objc_destroyWeak(&location);

        goto LABEL_34;
      }
      v23 = self;
      v24 = v21;
      Class v25 = a3;
      uint64_t v22 = 1;
    }
    [(DSNavigationController *)v23 pushPaneWithController:v24 paneType:v25 shouldShow:v22];
LABEL_34:

    return;
  }
  if ([(DSNavigationController *)self isNetworkReachable])
  {
    if (_os_feature_enabled_impl())
    {
      [(DSNavigationController *)self _pushWelcomeControllerAsTopView];
      uint64_t v11 = [(DSNavigationController *)self deepLink];
      if (v11
        && (uint64_t v12 = (void *)v11,
            [(DSNavigationController *)self deepLink],
            id v13 = objc_claimAutoreleasedReturnValue(),
            uint64_t v14 = [v13 navigationType],
            v13,
            v12,
            v14 == 2))
      {
        id v15 = [DSRemoteUILoader alloc];
        objc_super v16 = [(DSNavigationController *)self topViewController];
        v17 = [(DSNavigationController *)self deepLink];
        id v18 = [v17 remoteUIURL];
        v19 = [(DSRemoteUILoader *)v15 initWithPresenter:v16 delegate:self URL:v18];
        remoteUILoader = self->_remoteUILoader;
        self->_remoteUILoader = v19;
      }
      else
      {
        v30 = [DSRemoteUILoader alloc];
        objc_super v16 = [(DSNavigationController *)self topViewController];
        v31 = [(DSRemoteUILoader *)v30 initWithPresenter:v16 delegate:self];
        v17 = self->_remoteUILoader;
        self->_remoteUILoader = v31;
      }

      id v32 = self->_remoteUILoader;
      [(DSRemoteUILoader *)v32 loadRemoteUI];
    }
    else
    {
      [(DSNavigationController *)self pushPaneAfterPaneType:a3];
    }
    return;
  }
LABEL_14:
  [(DSNavigationController *)self displayNetworkError];
}

void __52__DSNavigationController_pushPaneType_loadRemoteUI___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__DSNavigationController_pushPaneType_loadRemoteUI___block_invoke_2;
  v8[3] = &unk_264C6F3E8;
  id v5 = *(id *)(a1 + 32);
  char v14 = a2;
  uint64_t v6 = *(void *)(a1 + 40);
  unint64_t v7 = *(void **)(a1 + 48);
  id v9 = v5;
  uint64_t v10 = v6;
  uint64_t v13 = *(void *)(a1 + 64);
  id v11 = WeakRetained;
  id v12 = v7;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

uint64_t __52__DSNavigationController_pushPaneType_loadRemoteUI___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  int v2 = *(void **)(a1 + 32);
  if (v2 && *(unsigned char *)(a1 + 72))
  {
    id v3 = [v2 buttonTray];
    [v3 showButtonsAvailable];
  }
  if (*(unsigned char *)(a1 + 72)) {
    goto LABEL_5;
  }
  uint64_t v9 = [*(id *)(a1 + 40) deepLink];
  if (!v9) {
    goto LABEL_5;
  }
  uint64_t v10 = (void *)v9;
  uint64_t v11 = *(void *)(a1 + 64);
  id v12 = [*(id *)(a1 + 40) deepLink];
  uint64_t v13 = [v12 navigationOrder];
  uint64_t v14 = [v13 firstObject];

  if (v11 == v14)
  {
    id v15 = (void *)DSLog_13;
    if (os_log_type_enabled((os_log_t)DSLog_13, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v16 = *(void **)(a1 + 40);
      v17 = v15;
      id v18 = [v16 deepLink];
      int v19 = 138412290;
      dispatch_queue_t v20 = v18;
      _os_log_impl(&dword_235BFC000, v17, OS_LOG_TYPE_DEFAULT, "Asked to open to entrypoint %@ but shouldShow returns false", (uint8_t *)&v19, 0xCu);
    }
    return [*(id *)(a1 + 48) pushPaneWithController:*(void *)(a1 + 56) paneType:*(void *)(a1 + 64) shouldShow:1];
  }
  else
  {
LABEL_5:
    BOOL v4 = *(void **)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 64);
    uint64_t v7 = *(unsigned __int8 *)(a1 + 72);
    return [v4 pushPaneWithController:v5 paneType:v6 shouldShow:v7];
  }
}

- (void)pushPaneWithController:(id)a3 paneType:(Class)a4 shouldShow:(BOOL)a5
{
  id v8 = a3;
  id v9 = v8;
  if (a5)
  {
    if ([v8 conformsToProtocol:&unk_26E932160])
    {
      if ([(DSNavigationController *)self currentFlowType] != 2) {
        [(DSNavigationController *)self setupQuickExitButtonWithController:v9];
      }
      [(OBNavigationController *)self pushViewController:v9 animated:1];
    }
  }
  else
  {
    [(DSNavigationController *)self pushPaneAfterPaneType:a4];
  }
}

- (void)pushPaneType:(Class)a3
{
}

- (Class)topViewControllerType
{
  id v3 = [(DSNavigationController *)self topViewController];
  BOOL v4 = objc_opt_class();

  uint64_t v5 = [(DSNavigationController *)self navigationOrder];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    id v7 = v4;
  }
  else
  {
    id v8 = [(DSNavigationController *)self navigationManager];
    id v7 = [v8 topViewControllerForUnorderedClass:v4];
  }
  return (Class)v7;
}

- (id)paneInstanceForType:(Class)a3
{
  BOOL v4 = [(DSNavigationController *)self cachedPanes];
  uint64_t v5 = NSStringFromClass(a3);
  int v6 = [v4 objectForKeyedSubscript:v5];

  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = objc_alloc_init(a3);
  }
  id v8 = v7;

  return v8;
}

- (void)startFlowWithType:(int64_t)a3
{
  uint64_t v5 = [(DSNavigationController *)self topViewControllerType];
  if (v5 == (objc_class *)objc_opt_class())
  {
    [(DSNavigationController *)self goToCustomizeSharing];
  }
  else
  {
    [(DSNavigationController *)self setCurrentFlowType:a3];
    [(DSNavigationController *)self pushNextPane];
  }
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v7 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__DSNavigationController_presentViewController_animated_completion___block_invoke;
  v10[3] = &unk_264C6ED28;
  id v11 = v7;
  id v12 = self;
  v9.receiver = self;
  v9.super_class = (Class)DSNavigationController;
  id v8 = v7;
  [(DSNavigationController *)&v9 presentViewController:v8 animated:v5 completion:v10];
}

void __68__DSNavigationController_presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = *(id *)(a1 + 32);
    int v2 = [v10 topViewController];
    id v3 = [v2 navigationItem];
    BOOL v4 = [v3 rightBarButtonItem];

    if (!v4)
    {
      id v5 = objc_alloc(MEMORY[0x263F824A8]);
      int v6 = DSUILocStringForKey(@"QUICK_EXIT");
      id v7 = (void *)[v5 initWithTitle:v6 style:0 target:*(void *)(a1 + 40) action:sel_quickExit];
      id v8 = [v10 topViewController];
      objc_super v9 = [v8 navigationItem];
      [v9 setRightBarButtonItem:v7];
    }
  }
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v10 = a4;
  if ([(DSNavigationController *)self currentFlowType] != 2)
  {
    int v6 = [v10 navigationItem];
    id v7 = [v6 rightBarButtonItem];

    if (!v7) {
      [(DSNavigationController *)self setupQuickExitButtonWithController:v10];
    }
    uint64_t v8 = objc_opt_class();
    if (v8 == objc_opt_class() || (uint64_t v9 = objc_opt_class(), v9 == objc_opt_class())) {
      [(DSNavigationController *)self setupCancelButtonWithController:v10];
    }
    [(DSNavigationController *)self updateCurrentChapterWithPaneType:[(DSNavigationController *)self topViewControllerType]];
    [(DSNavigationController *)self setupChapterIndicatorWithController:v10];
  }
}

- (void)setupQuickExitButtonWithController:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x263F824A8];
  id v5 = a3;
  id v6 = [v4 alloc];
  DSUILocStringForKey(@"QUICK_EXIT");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = (void *)[v6 initWithTitle:v9 style:0 target:self action:sel_quickExit];
  uint64_t v8 = [v5 navigationItem];

  [v8 setRightBarButtonItem:v7];
}

- (void)setupCancelButtonWithController:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x263F824A8];
  id v5 = a3;
  id v6 = [v4 alloc];
  DSUILocStringForKey(@"CANCEL");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = (void *)[v6 initWithTitle:v9 style:0 target:self action:sel_finishFlow];
  uint64_t v8 = [v5 navigationItem];

  [v8 setLeftBarButtonItem:v7];
}

- (void)updateCurrentChapterWithPaneType:(Class)a3
{
  id v5 = [(DSNavigationController *)self navigationChapters];
  id v6 = NSStringFromClass(a3);
  id v8 = [v5 valueForKey:v6];

  if (v8) {
    uint64_t v7 = [v8 integerValue];
  }
  else {
    uint64_t v7 = 0;
  }
  [(DSNavigationController *)self setCurrentChapter:v7];
  if ([(DSNavigationController *)self currentChapter]) {
    [(DSNavigationController *)self setCurrentChapterForAnalytics:[(DSNavigationController *)self currentChapter]];
  }
}

- (void)setupChapterIndicatorWithController:(id)a3
{
  id v9 = a3;
  BOOL v4 = [v9 navigationItem];
  [v4 setBackButtonDisplayMode:1];

  int64_t v5 = [(DSNavigationController *)self currentChapter];
  switch(v5)
  {
    case 3:
      id v8 = [v9 navigationItem];
      id v6 = @"CHAPTER_THREE";
      break;
    case 2:
      id v8 = [v9 navigationItem];
      id v6 = @"CHAPTER_TWO";
      break;
    case 1:
      id v8 = [v9 navigationItem];
      id v6 = @"CHAPTER_ONE";
      break;
    default:
      id v8 = [v9 navigationItem];
      [v8 setTitle:0];
      goto LABEL_9;
  }
  uint64_t v7 = DSUILocStringForKey(v6);
  [v8 setTitle:v7];

LABEL_9:
}

- (void)quickExit
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = [(DSNavigationController *)self visibleViewController];
  if (objc_opt_respondsToSelector()) {
    [v3 performSelector:sel_postAnalytics];
  }
  [(DSNavigationController *)self sendSummaryAnalyticsWithQuickExit:1 finalScreen:[(DSNavigationController *)self shouldFinishFlow]];
  BOOL v4 = [MEMORY[0x263F82438] sharedApplication];
  int64_t v5 = [v4 connectedScenes];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v7)
  {
LABEL_13:

    goto LABEL_15;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v22;
LABEL_5:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v22 != v9) {
      objc_enumerationMutation(v6);
    }
    id v11 = *(void **)(*((void *)&v21 + 1) + 8 * v10);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_11;
    }
    id v12 = v11;
    uint64_t v13 = objc_msgSend(v12, "windows", (void)v21);
    uint64_t v14 = [v13 count];

    if (v14) {
      break;
    }

LABEL_11:
    if (v8 == ++v10)
    {
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v8) {
        goto LABEL_5;
      }
      goto LABEL_13;
    }
  }

  if (v12) {
    goto LABEL_16;
  }
LABEL_15:
  id v15 = [(DSNavigationController *)self view];
  objc_super v16 = [v15 window];
  id v12 = [v16 windowScene];

  if (v12)
  {
LABEL_16:
    v17 = [v12 _FBSScene];
    id v18 = objc_alloc(MEMORY[0x263F82660]);
    int v19 = (void *)[v18 initWithPreferredAnimationType:1 callbackQueue:MEMORY[0x263EF83A0] completion:&__block_literal_global_479];
    dispatch_queue_t v20 = [MEMORY[0x263EFFA08] setWithObject:v19];
    [v17 sendActions:v20];
  }
}

void __35__DSNavigationController_quickExit__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = DSLog_13;
  if (os_log_type_enabled((os_log_t)DSLog_13, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_235BFC000, v3, OS_LOG_TYPE_DEFAULT, "Scene destruction request completed with response: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)willEnterForeground:(id)a3
{
  uint64_t v4 = [(DSNavigationController *)self deepLink];
  if (v4
    && (id v5 = (void *)v4,
        [(DSNavigationController *)self obfuscationWindow],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        !v6))
  {
    uint64_t v8 = DSLog_13;
    if (os_log_type_enabled((os_log_t)DSLog_13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_235BFC000, v8, OS_LOG_TYPE_DEFAULT, "Skipping authentication check for URL launch", buf, 2u);
    }
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F10488] sharedInstance];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __46__DSNavigationController_willEnterForeground___block_invoke;
    v9[3] = &unk_264C6E870;
    v9[4] = self;
    [v7 stateWithCompletion:v9];
  }
}

void __46__DSNavigationController_willEnterForeground___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 rawValue] == 2)
  {
    id v3 = v6;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    uint64_t v4 = __46__DSNavigationController_willEnterForeground___block_invoke_2;
  }
  else
  {
    id v3 = v5;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    uint64_t v4 = __46__DSNavigationController_willEnterForeground___block_invoke_3;
  }
  v3[2] = v4;
  v3[3] = &unk_264C6E7D0;
  v3[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

void __46__DSNavigationController_willEnterForeground___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) obfuscationWindow];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) obfuscationWindow];
    [v3 setHidden:1];

    uint64_t v4 = *(void **)(a1 + 32);
    [v4 setObfuscationWindow:0];
  }
}

uint64_t __46__DSNavigationController_willEnterForeground___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) authToReturnToSafetyCheck];
}

- (void)authToReturnToSafetyCheck
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_235BFC000, a2, OS_LOG_TYPE_ERROR, "Cannot evaluate authentication policy for Safety Check, policy error %@", (uint8_t *)&v2, 0xCu);
}

void __51__DSNavigationController_authToReturnToSafetyCheck__block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = [v2 obfuscationWindow];

    if (v3)
    {
      uint64_t v4 = [*(id *)(a1 + 32) obfuscationWindow];
      [v4 setHidden:1];

      id v5 = *(void **)(a1 + 32);
      [v5 setObfuscationWindow:0];
    }
  }
}

void __51__DSNavigationController_authToReturnToSafetyCheck__block_invoke_486(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = DSLog_13;
  if (os_log_type_enabled((os_log_t)DSLog_13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v14) = a2;
    _os_log_impl(&dword_235BFC000, v7, OS_LOG_TYPE_INFO, "Asked user to auth for Safety Check when foregrounding with success: %d", buf, 8u);
  }
  if (a2)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __51__DSNavigationController_authToReturnToSafetyCheck__block_invoke_2;
    v12[3] = &unk_264C6E7D0;
    void v12[4] = WeakRetained;
    uint64_t v8 = MEMORY[0x263EF83A0];
    uint64_t v9 = v12;
LABEL_9:
    dispatch_async(v8, v9);
    goto LABEL_10;
  }
  if ([v5 code] != -4)
  {
    uint64_t v10 = DSLog_13;
    if (os_log_type_enabled((os_log_t)DSLog_13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v5;
      _os_log_impl(&dword_235BFC000, v10, OS_LOG_TYPE_INFO, "Error authenticating for Safety Check, going back to base Preferences %@", buf, 0xCu);
    }
    uint64_t v8 = MEMORY[0x263EF83A0];
    uint64_t v9 = &__block_literal_global_489;
    goto LABEL_9;
  }
LABEL_10:
  if (v5)
  {
    id v11 = DSLog_13;
    if (os_log_type_enabled((os_log_t)DSLog_13, OS_LOG_TYPE_ERROR)) {
      __51__DSNavigationController_authToReturnToSafetyCheck__block_invoke_486_cold_1((uint64_t)v5, v11);
    }
  }
}

void __51__DSNavigationController_authToReturnToSafetyCheck__block_invoke_487()
{
  v4[1] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F01880] defaultWorkspace];
  id v1 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings"];
  uint64_t v3 = *MEMORY[0x263F01820];
  v4[0] = MEMORY[0x263EFFA88];
  int v2 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  [v0 openSensitiveURL:v1 withOptions:v2];
}

void __51__DSNavigationController_authToReturnToSafetyCheck__block_invoke_2(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = [v2 obfuscationWindow];

    if (v3)
    {
      uint64_t v4 = [*(id *)(a1 + 32) obfuscationWindow];
      [v4 setHidden:1];

      id v5 = *(void **)(a1 + 32);
      [v5 setObfuscationWindow:0];
    }
  }
}

- (void)didEnterBackground:(id)a3
{
  if (!self->_obfuscationWindow)
  {
    id v7 = [(DSNavigationController *)self view];
    uint64_t v4 = [v7 window];
    id v5 = +[DSObfuscationWindow showDSObfuscationWindowForApplicationWindow:v4];
    obfuscationWindow = self->_obfuscationWindow;
    self->_obfuscationWindow = v5;
  }
}

- (void)willResignActive:(id)a3
{
  [(DSNavigationController *)self updateDaemonModelForCurrentPane];
  id v4 = [(DSNavigationController *)self daemonProxy];
  [v4 sendAggregatedSignals];
}

- (void)cancel
{
  [(DSNavigationController *)self sendSummaryAnalyticsWithQuickExit:0 finalScreen:0];
  uint64_t v3 = [(DSNavigationController *)self presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];

  [(DSNavigationController *)self setCachedPanes:0];
}

- (void)learnMorePressedForController:(id)a3 withURL:(id)a4
{
}

- (BOOL)isNetworkReachable
{
  return self->_isReachable;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  BOOL v4 = [(DSNavigationController *)self shouldFinishFlow];
  [(DSNavigationController *)self sendSummaryAnalyticsWithQuickExit:0 finalScreen:v4];
}

- (void)sendSummaryAnalyticsWithQuickExit:(BOOL)a3 finalScreen:(BOOL)a4
{
  uint64_t v6 = MEMORY[0x263EF8330];
  LOBYTE(v8) = a4;
  BYTE1(v8) = a3;
  AnalyticsSendEventLazy();
  [(DSNavigationController *)self updateDaemonModelForCurrentPane];
  id v5 = [(DSNavigationController *)self daemonProxy];
  [v5 sendAggregatedSignals];
}

id __72__DSNavigationController_sendSummaryAnalyticsWithQuickExit_finalScreen___block_invoke(uint64_t a1)
{
  v23[10] = *MEMORY[0x263EF8340];
  v22[0] = @"numPeopleStoppedSharing";
  int v2 = NSNumber;
  long long v21 = [*(id *)(a1 + 32) unsharedPeople];
  dispatch_queue_t v20 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v21, "count"));
  v23[0] = v20;
  v22[1] = @"numSourcesStoppedSharing";
  uint64_t v3 = NSNumber;
  int v19 = [*(id *)(a1 + 32) unsharedResourcesBySource];
  id v18 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v19, "count"));
  v23[1] = v18;
  v22[2] = @"numAppsStoppedPermissions";
  BOOL v4 = NSNumber;
  v17 = [*(id *)(a1 + 32) unsharedApps];
  id v5 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
  v23[2] = v5;
  v22[3] = @"numTypesStoppedPermissions";
  uint64_t v6 = NSNumber;
  id v7 = [*(id *)(a1 + 32) unsharedPermissions];
  uint64_t v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
  v23[3] = v8;
  v22[4] = @"chapter";
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "currentChapterForAnalytics"));
  v23[4] = v9;
  v22[5] = @"flowType";
  uint64_t v10 = [*(id *)(a1 + 32) flowTypeForAnalytics];
  v23[5] = v10;
  v22[6] = @"wasFinalScreen";
  id v11 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v23[6] = v11;
  v22[7] = @"wasQuickExit";
  id v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 41)];
  v23[7] = v12;
  v22[8] = @"wasRatchetEnabled";
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(MEMORY[0x263F3A390], "shouldShowBioRatchetFlow"));
  v23[8] = v13;
  v22[9] = @"wasFamiliarLocation";
  id v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isInFamiliarLocation"));
  v23[9] = v14;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:10];

  return v15;
}

- (void)sendSummaryAnalyticsWithEventName:(id)a3
{
  id v4 = a3;
  if ([(DSNavigationController *)self deepLinkPaneType]) {
    [(DSNavigationController *)self deepLinkPaneType];
  }
  else {
    [(DSNavigationController *)self topViewControllerType];
  }
  AnalyticsSendEventLazy();
}

id __60__DSNavigationController_sendSummaryAnalyticsWithEventName___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x263EF8340];
  v6[0] = @"FlowType";
  int v2 = [*(id *)(a1 + 32) flowTypeForAnalytics];
  v6[1] = @"Operation";
  v7[0] = v2;
  uint64_t v3 = NSStringFromClass(*(Class *)(a1 + 40));
  v7[1] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (id)flowTypeForAnalytics
{
  if ([(DSNavigationController *)self currentFlowType]) {
    int v2 = @"Review";
  }
  else {
    int v2 = @"Reset";
  }
  return v2;
}

- (void)resetRemoteUI
{
  uint64_t v3 = [(DSNavigationController *)self viewControllers];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    unint64_t v5 = 0;
    for (unsigned int i = 1; ; ++i)
    {
      id v7 = [(DSNavigationController *)self viewControllers];
      id v13 = [v7 objectAtIndexedSubscript:v5];

      [(DSNavigationController *)self currentFlowType];
      uint64_t v8 = objc_opt_class();
      unint64_t v5 = i;
      if (objc_opt_class() == v8) {
        break;
      }

      uint64_t v9 = [(DSNavigationController *)self viewControllers];
      unint64_t v10 = [v9 count];

      if (v10 <= v5) {
        return;
      }
    }
    id v11 = [(DSNavigationController *)self viewControllers];
    id v12 = objc_msgSend(v11, "subarrayWithRange:", 0, i);
    [(OBNavigationController *)self setViewControllers:v12];
  }
}

- (id)deepLinkForCurrentFlowAndPane
{
  uint64_t v3 = [(DSNavigationController *)self navigationManager];
  uint64_t v4 = objc_msgSend(v3, "deepLinkToPane:inFlow:", -[DSNavigationController topViewControllerType](self, "topViewControllerType"), -[DSNavigationController currentFlowType](self, "currentFlowType"));

  [(DSNavigationController *)self setDeepLinkPaneType:[(DSNavigationController *)self topViewControllerType]];
  return v4;
}

- (BOOL)isDetailControllerClass:(Class)a3
{
  uint64_t v4 = [(DSNavigationController *)self navigationManager];
  unint64_t v5 = [v4 detailControllerPanes];
  LOBYTE(a3) = [v5 containsObject:a3];

  return (char)a3;
}

- (void)_pushWelcomeControllerAsTopView
{
  uint64_t v3 = [(DSNavigationController *)self topViewController];
  if (!v3)
  {
    if (![MEMORY[0x263F3A390] shouldShowBioRatchetFlow]) {
      return;
    }
    [(DSNavigationController *)self currentFlowType];
    id v4 = [(DSNavigationController *)self paneInstanceForType:objc_opt_class()];
    [(OBNavigationController *)self pushViewController:v4 animated:1];
    uint64_t v3 = v4;
  }
}

- (BOOL)isInFamiliarLocation
{
  v14[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = (LAContext *)objc_alloc_init(MEMORY[0x263F10468]);
  authContext = self->_authContext;
  self->_authContext = v3;

  unint64_t v5 = self->_authContext;
  v13[0] = &unk_26E91FBD8;
  v13[1] = &unk_26E91FBF0;
  v14[0] = MEMORY[0x263EFFA88];
  v14[1] = MEMORY[0x263EFFA88];
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  uint64_t v12 = 0;
  id v7 = [(LAContext *)v5 evaluatePolicy:1025 options:v6 error:&v12];
  uint64_t v8 = v12;

  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  BOOL v10 = v9;

  return v10;
}

- (void)ratchetStateDidChange:(id)a3
{
  if ([a3 rawValue] == 1)
  {
    [(DSNavigationController *)self sendSummaryAnalyticsWithEventName:@"com.apple.DigitalSeparation.RatchetStarted"];
  }
}

- (void)_setupRatchetObserver
{
  id v3 = [MEMORY[0x263F10488] sharedInstance];
  [v3 addObserver:self];
}

- (void)updateDaemonModelForCurrentPane
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = [(DSNavigationController *)self topViewControllerType];
  if (v3 == (objc_class *)objc_opt_class())
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v4 = [(DSNavigationController *)self unpairedComputers];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v33 count:16];
    uint64_t v6 = (uint64_t *)MEMORY[0x263F65F80];
    if (v5)
    {
      uint64_t v7 = v5;
      uint64_t v8 = *(void *)v29;
      uint64_t v9 = *MEMORY[0x263F65F80];
      uint64_t v10 = *MEMORY[0x263F65F88];
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v12 = *(void *)(*((void *)&v28 + 1) + 8 * v11);
          id v13 = [(DSNavigationController *)self daemonProxy];
          [v13 removeSignalWithIdentifier:v12 sharingType:v9 signalType:v10];

          id v14 = [(DSNavigationController *)self reviewedComputers];
          [v14 removeObject:v12];

          ++v11;
        }
        while (v7 != v11);
        uint64_t v7 = [v4 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v7);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v15 = [(DSNavigationController *)self reviewedComputers];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v25;
      uint64_t v19 = *v6;
      uint64_t v20 = *MEMORY[0x263F65F88];
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v22 = *(void *)(*((void *)&v24 + 1) + 8 * v21);
          long long v23 = [(DSNavigationController *)self daemonProxy];
          [v23 addSignalWithIdentifier:v22 sharingType:v19 signalType:v20];

          ++v21;
        }
        while (v17 != v21);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v17);
    }
  }
}

- (NSString)entryMethod
{
  id v3 = [(DSNavigationController *)self deepLink];
  if (v3)
  {
    id v4 = [(DSNavigationController *)self deepLink];
    uint64_t v5 = [v4 entrypoint];
  }
  else
  {
    uint64_t v5 = @"Default";
  }

  return (NSString *)v5;
}

- (BOOL)requiresAuthForEntry
{
  id v3 = [(DSNavigationController *)self deepLink];
  if (v3)
  {
    id v4 = [(DSNavigationController *)self deepLink];
    char v5 = [v4 flowRequiresAuth];
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (DSSharingPermissions)fetchedSharingPermissions
{
  return self->fetchedSharingPermissions;
}

- (void)setFetchedSharingPermissions:(id)a3
{
}

- (LAContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
}

- (void)setEntryMethod:(id)a3
{
}

- (void)setRequiresAuthForEntry:(BOOL)a3
{
  self->_requiresAuthForEntry = a3;
}

- (DSNavigationManager)navigationManager
{
  return self->_navigationManager;
}

- (void)setNavigationManager:(id)a3
{
}

- (NSDictionary)navigationChapters
{
  return self->_navigationChapters;
}

- (void)setNavigationChapters:(id)a3
{
}

- (NSArray)navigationOrder
{
  return self->_navigationOrder;
}

- (void)setNavigationOrder:(id)a3
{
}

- (DSRemoteUILoader)remoteUILoader
{
  return self->_remoteUILoader;
}

- (void)setRemoteUILoader:(id)a3
{
}

- (int64_t)currentFlowType
{
  return self->_currentFlowType;
}

- (void)setCurrentFlowType:(int64_t)a3
{
  self->_currentFlowType = a3;
}

- (Class)startingPaneType
{
  return self->_startingPaneType;
}

- (void)setStartingPaneType:(Class)a3
{
  self->_startingPaneType = a3;
}

- (int64_t)currentChapter
{
  return self->_currentChapter;
}

- (void)setCurrentChapter:(int64_t)a3
{
  self->_currentChapter = a3;
}

- (int64_t)currentChapterForAnalytics
{
  return self->_currentChapterForAnalytics;
}

- (void)setCurrentChapterForAnalytics:(int64_t)a3
{
  self->_currentChapterForAnalytics = a3;
}

- (UIViewController)networkErrorController
{
  return self->_networkErrorController;
}

- (void)setNetworkErrorController:(id)a3
{
}

- (BOOL)isShowingNetworkError
{
  return self->_isShowingNetworkError;
}

- (void)setIsShowingNetworkError:(BOOL)a3
{
  self->_isShowingNetworkError = a3;
}

- (UINavigationController)connectionErrorNavigation
{
  return self->_connectionErrorNavigation;
}

- (void)setConnectionErrorNavigation:(id)a3
{
}

- (NSDictionary)cachedPanes
{
  return self->_cachedPanes;
}

- (void)setCachedPanes:(id)a3
{
}

- (UIWindow)obfuscationWindow
{
  return self->_obfuscationWindow;
}

- (void)setObfuscationWindow:(id)a3
{
}

- (OS_nw_path_monitor)pathMonitor
{
  return self->_pathMonitor;
}

- (BOOL)isReachable
{
  return self->_isReachable;
}

- (void)setIsReachable:(BOOL)a3
{
  self->_isReachable = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (DSDaemonProxy)daemonProxy
{
  return self->_daemonProxy;
}

- (void)setDaemonProxy:(id)a3
{
}

- (DSDeepLinkRepresentation)deepLink
{
  return self->_deepLink;
}

- (void)setDeepLink:(id)a3
{
}

- (NSMutableDictionary)unsharedResourcesBySource
{
  return self->_unsharedResourcesBySource;
}

- (void)setUnsharedResourcesBySource:(id)a3
{
}

- (NSMutableSet)unsharedPeople
{
  return self->_unsharedPeople;
}

- (void)setUnsharedPeople:(id)a3
{
}

- (NSMutableSet)unsharedApps
{
  return self->_unsharedApps;
}

- (void)setUnsharedApps:(id)a3
{
}

- (NSMutableSet)unsharedPermissions
{
  return self->_unsharedPermissions;
}

- (void)setUnsharedPermissions:(id)a3
{
}

- (NSMutableSet)unpairedComputers
{
  return self->_unpairedComputers;
}

- (void)setUnpairedComputers:(id)a3
{
}

- (NSMutableSet)reviewedComputers
{
  return self->_reviewedComputers;
}

- (void)setReviewedComputers:(id)a3
{
}

- (Class)deepLinkPaneType
{
  return self->_deepLinkPaneType;
}

- (void)setDeepLinkPaneType:(Class)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deepLinkPaneType, 0);
  objc_storeStrong((id *)&self->_reviewedComputers, 0);
  objc_storeStrong((id *)&self->_unpairedComputers, 0);
  objc_storeStrong((id *)&self->_unsharedPermissions, 0);
  objc_storeStrong((id *)&self->_unsharedApps, 0);
  objc_storeStrong((id *)&self->_unsharedPeople, 0);
  objc_storeStrong((id *)&self->_unsharedResourcesBySource, 0);
  objc_storeStrong((id *)&self->_deepLink, 0);
  objc_storeStrong((id *)&self->_daemonProxy, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_pathMonitor, 0);
  objc_storeStrong((id *)&self->_obfuscationWindow, 0);
  objc_storeStrong((id *)&self->_cachedPanes, 0);
  objc_storeStrong((id *)&self->_connectionErrorNavigation, 0);
  objc_storeStrong((id *)&self->_networkErrorController, 0);
  objc_storeStrong((id *)&self->_remoteUILoader, 0);
  objc_storeStrong((id *)&self->_navigationOrder, 0);
  objc_storeStrong((id *)&self->_navigationChapters, 0);
  objc_storeStrong((id *)&self->_navigationManager, 0);
  objc_storeStrong((id *)&self->_entryMethod, 0);
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->fetchedSharingPermissions, 0);
}

void __51__DSNavigationController_authToReturnToSafetyCheck__block_invoke_486_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_235BFC000, a2, OS_LOG_TYPE_ERROR, "Error while evaluating authentication policy for Safety Check, error %@", (uint8_t *)&v2, 0xCu);
}

@end