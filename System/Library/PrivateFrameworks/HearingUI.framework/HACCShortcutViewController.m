@interface HACCShortcutViewController
- (AXHAShortcutUpdateProtocol)delegate;
- (AXRemoteHearingAidDevice)currentHearingDevice;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isMainStackForModule:(unint64_t)a3;
- (BOOL)_isShownInGallery;
- (BOOL)_isStandaloneHeadphoneLevels;
- (BOOL)_isStandaloneHeadphoneLevelsFromMainStackOrderArray:(id)a3;
- (BOOL)_isStandalonePMEModule;
- (BOOL)_isStandalonePMEModuleFromMainStackOrderArray:(id)a3;
- (BOOL)addPartialSeparatorAboveModule:(unint64_t)a3;
- (BOOL)addSeparatorAboveModule:(unint64_t)a3;
- (BOOL)bluetoothAvailable;
- (BOOL)headphoneAudioAvailable;
- (BOOL)isExpanded;
- (BOOL)listeningForHeadphoneUpdates;
- (BOOL)listeningForHearingAidUpdates;
- (BOOL)prefersContentToAlwaysExpand;
- (BOOL)providesOwnPlatter;
- (BOOL)shouldDisplayControlForModule:(unint64_t)a3;
- (BOOL)shouldDisplayControlForModule:(unint64_t)a3 fromModulesArray:(id)a4 mainStackOrderArrayCopy:(id)a5;
- (BOOL)shouldDisplayOtherDevice;
- (BOOL)shouldShowHeadphoneLevelUnavailable;
- (BOOL)showPMEExpandedOptions;
- (CCUIContentModuleContext)contentModuleContext;
- (CCUILabeledRoundButtonViewController)otherDevicesButtonViewController;
- (HACCContentViewController)expandedController;
- (HACCShortcutViewController)initWithDelegate:(id)a3;
- (HACCShortcutViewController)initWithDelegate:(id)a3 andAvailableModules:(id)a4;
- (NSArray)availableModules;
- (NSArray)mainStackOrderArray;
- (NSDictionary)previousListeningModeForAddress;
- (NSIndexSet)mainStackIndexSet;
- (NSMutableDictionary)moduleToViewControllerMap;
- (NSString)currentOtherDeviceName;
- (NSString)currentOtherDeviceType;
- (UIScrollView)scrollView;
- (UIStackView)stackView;
- (UIView)platterView;
- (double)moduleHeight;
- (double)preferredContentWidth;
- (id)backgroundUpdateQueue;
- (id)contentControllerForModule:(unint64_t)a3;
- (id)parentViewControllerForModule:(unint64_t)a3;
- (id)stackOrder;
- (unint64_t)_mainStackIndexForModule:(unint64_t)a3;
- (void)_logLiveListenAnalytics;
- (void)bluetoothAvailabilityDidChange:(id)a3;
- (void)contentCategoryDidChange:(id)a3;
- (void)controlDidActivate:(id)a3;
- (void)dealloc;
- (void)hearingStatusBarTapped:(id)a3;
- (void)listenForHearingAidUpdates;
- (void)mediaPlaybackDidChange:(id)a3;
- (void)mediaServerDied;
- (void)registerNotifications;
- (void)resetHeadphoneLevelModule;
- (void)setAvailableModules:(id)a3;
- (void)setBluetoothAvailable:(BOOL)a3;
- (void)setContentModuleContext:(id)a3;
- (void)setCurrentHearingDevice:(id)a3;
- (void)setCurrentOtherDeviceName:(id)a3;
- (void)setCurrentOtherDeviceType:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExpandedController:(id)a3;
- (void)setHeadphoneAudioAvailable:(BOOL)a3;
- (void)setListeningForHeadphoneUpdates:(BOOL)a3;
- (void)setListeningForHearingAidUpdates:(BOOL)a3;
- (void)setMainStackIndexSet:(id)a3;
- (void)setMainStackOrderArray:(id)a3;
- (void)setModuleToViewControllerMap:(id)a3;
- (void)setOtherDevicesButtonViewController:(id)a3;
- (void)setPlatterView:(id)a3;
- (void)setPrefersContentToAlwaysExpand:(BOOL)a3;
- (void)setPreviousListeningModeForAddress:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setShouldDisplayOtherDevice:(BOOL)a3;
- (void)setStackView:(id)a3;
- (void)startListeningForHeadphoneUpdates;
- (void)stopListeningForHeadphoneUpdates;
- (void)updateAvailableControls;
- (void)updateContentViewListeners:(BOOL)a3;
- (void)updateHeight;
- (void)updateNoiseControl:(id)a3;
- (void)updateRoutes;
- (void)updateView;
- (void)updateViewForModule:(unint64_t)a3;
- (void)updateViewForProperties:(id)a3;
- (void)viewController:(id)a3 didExpand:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation HACCShortcutViewController

- (HACCShortcutViewController)initWithDelegate:(id)a3
{
  return [(HACCShortcutViewController *)self initWithDelegate:a3 andAvailableModules:0];
}

- (HACCShortcutViewController)initWithDelegate:(id)a3 andAvailableModules:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)HACCShortcutViewController;
  v8 = [(HACCShortcutViewController *)&v32 init];
  v9 = v8;
  if (v8)
  {
    v8->_bluetoothAvailable = 1;
    [(HACCShortcutViewController *)v8 setDelegate:v6];
    id v10 = (id)[MEMORY[0x263F5D450] sharedInstance];
    v11 = [MEMORY[0x263F47568] sharedUtilities];
    [v11 requestCurrentRoutesWithCompletion:0];

    v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 addObserver:v9 selector:sel_bluetoothAvailabilityDidChange_ name:*MEMORY[0x263F2B8E8] object:0];

    v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 addObserver:v9 selector:sel_bluetoothAvailabilityDidChange_ name:*MEMORY[0x263F2B980] object:0];

    v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 addObserver:v9 selector:sel_updateRoutes name:*MEMORY[0x263F474E0] object:0];

    v15 = [MEMORY[0x263F08A00] defaultCenter];
    [v15 addObserver:v9 selector:sel_hearingStatusBarTapped_ name:@"SBStatusBarReturnToHearingAidNotification" object:0];

    id v16 = objc_alloc(MEMORY[0x263F21398]);
    v17 = [MEMORY[0x263F47568] sharedUtilities];
    v18 = [v17 routingQueue];
    uint64_t v19 = [v16 initWithTargetSerialQueue:v18];
    noiseControlUpdateTimer = v9->_noiseControlUpdateTimer;
    v9->_noiseControlUpdateTimer = (AXDispatchTimer *)v19;

    [(AXDispatchTimer *)v9->_noiseControlUpdateTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    v21 = [MEMORY[0x263F08A00] defaultCenter];
    [v21 addObserver:v9 selector:sel_updateNoiseControl_ name:*MEMORY[0x263F2B8E0] object:0];

    [(HACCShortcutViewController *)v9 registerNotifications];
    v22 = [MEMORY[0x263F08A00] defaultCenter];
    [v22 addObserver:v9 selector:sel_contentCategoryDidChange_ name:*MEMORY[0x263F83428] object:0];

    v23 = [MEMORY[0x263EFF9A0] dictionary];
    [(HACCShortcutViewController *)v9 setModuleToViewControllerMap:v23];

    v24 = (AXDispatchTimer *)objc_alloc_init(MEMORY[0x263F21398]);
    bluetoothAvailabilityTimer = v9->_bluetoothAvailabilityTimer;
    v9->_bluetoothAvailabilityTimer = v24;

    [(HACCShortcutViewController *)v9 setAvailableModules:v7];
    id v26 = objc_alloc_init(MEMORY[0x263F089C8]);
    [v26 addIndex:0];
    [v26 addIndex:31];
    [v26 addIndex:24];
    [v26 addIndex:30];
    [v26 addIndex:23];
    [v26 addIndex:29];
    uint64_t v27 = [v26 copy];
    mainStackIndexSet = v9->_mainStackIndexSet;
    v9->_mainStackIndexSet = (NSIndexSet *)v27;

    uint64_t v29 = [(HACCShortcutViewController *)v9 stackOrder];
    mainStackOrderArray = v9->_mainStackOrderArray;
    v9->_mainStackOrderArray = (NSArray *)v29;
  }
  return v9;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)HACCShortcutViewController;
  [(HACCShortcutViewController *)&v4 dealloc];
}

- (id)stackOrder
{
  v2 = (void *)MEMORY[0x263EFF980];
  v3 = [(HACCShortcutViewController *)self availableModules];
  objc_super v4 = [v2 arrayWithArray:v3];

  if ([v4 count])
  {
    v5 = v4;
  }
  else
  {
    id v6 = (void *)MEMORY[0x263EFF980];
    id v7 = [MEMORY[0x263F47558] sharedInstance];
    v8 = [v7 hearingControlCenterOrder];
    v5 = [v6 arrayWithArray:v8];

    uint64_t v9 = [v5 indexOfObject:&unk_26DAB9820];
    if (([v5 containsObject:&unk_26DAB9838] & 1) == 0 && v9 != 0x7FFFFFFFFFFFFFFFLL) {
      [v5 insertObject:&unk_26DAB9838 atIndex:v9 + 1];
    }
  }
  return v5;
}

- (void)registerNotifications
{
  v14[2] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F544E0] sharedAVSystemController];
  objc_super v4 = (uint64_t *)MEMORY[0x263F543C0];
  v5 = (uint64_t *)MEMORY[0x263F54470];
  uint64_t v6 = *MEMORY[0x263F54470];
  v14[0] = *MEMORY[0x263F543C0];
  v14[1] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  [v3 setAttribute:v7 forKey:*MEMORY[0x263F544A0] error:0];

  v8 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v9 = *v4;
  id v10 = [MEMORY[0x263F544E0] sharedAVSystemController];
  [v8 addObserver:self selector:sel_mediaPlaybackDidChange_ name:v9 object:v10];

  v11 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v12 = *v5;
  v13 = [MEMORY[0x263F544E0] sharedAVSystemController];
  [v11 addObserver:self selector:sel_mediaServerDied name:v12 object:v13];
}

- (void)mediaServerDied
{
  dispatch_time_t v3 = dispatch_time(0, 2000000000);
  objc_super v4 = [(HACCShortcutViewController *)self backgroundUpdateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__HACCShortcutViewController_mediaServerDied__block_invoke;
  block[3] = &unk_2647CD1B8;
  block[4] = self;
  dispatch_after(v3, v4, block);
}

uint64_t __45__HACCShortcutViewController_mediaServerDied__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 removeObserver:*(void *)(a1 + 32)];

  dispatch_time_t v3 = *(void **)(a1 + 32);
  return [v3 registerNotifications];
}

- (void)mediaPlaybackDidChange:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  HAInitializeLogging();
  objc_super v4 = [NSString stringWithFormat:@"Media playback did change %@", v3];
  v5 = [NSString stringWithFormat:@"%s:%d %@", "-[HACCShortcutViewController mediaPlaybackDidChange:]", 215, v4];
  uint64_t v6 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v5;
    v8 = v6;
    *(_DWORD *)buf = 136446210;
    uint64_t v11 = [v7 UTF8String];
    _os_log_impl(&dword_226B65000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  id v9 = v3;
  AXPerformBlockOnMainThread();
}

uint64_t __53__HACCShortcutViewController_mediaPlaybackDidChange___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 40) userInfo];
  id v3 = [v2 valueForKey:@"State"];
  *(unsigned char *)(*(void *)(a1 + 32) + 1056) = [v3 BOOLValue];

  objc_super v4 = *(void **)(a1 + 32);
  return [v4 updateView];
}

- (id)backgroundUpdateQueue
{
  if (backgroundUpdateQueue_onceToken != -1) {
    dispatch_once(&backgroundUpdateQueue_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)backgroundUpdateQueue_backgroundUpdateQueue;
  return v2;
}

void __51__HACCShortcutViewController_backgroundUpdateQueue__block_invoke()
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v1 = dispatch_queue_create("hucc.background.queue", v0);
  v2 = (void *)backgroundUpdateQueue_backgroundUpdateQueue;
  backgroundUpdateQueue_backgroundUpdateQueue = (uint64_t)v1;
}

- (void)updateRoutes
{
  id v3 = [MEMORY[0x263F47568] sharedUtilities];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__HACCShortcutViewController_updateRoutes__block_invoke;
  v4[3] = &unk_2647CD910;
  v4[4] = self;
  [v3 requestCurrentRoutesWithCompletion:v4];
}

void __42__HACCShortcutViewController_updateRoutes__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [*(id *)(a1 + 32) previousListeningModeForAddress];
  objc_super v4 = [v3 allKeys];
  v5 = [v4 firstObject];

  if ([v5 length])
  {
    uint64_t v6 = [v9 objectForKey:@"AXSHARoutePicked"];
    id v7 = [v6 objectForKey:*MEMORY[0x263F47518]];
    char v8 = [v7 containsString:v5];

    if ((v8 & 1) == 0) {
      [*(id *)(a1 + 32) setPreviousListeningModeForAddress:0];
    }
  }
}

- (void)hearingStatusBarTapped:(id)a3
{
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)HACCShortcutViewController;
  [(HACCShortcutViewController *)&v8 viewDidLoad];
  id v3 = objc_alloc_init(MEMORY[0x263F82B88]);
  [v3 setShowsVerticalScrollIndicator:0];
  [v3 setShowsHorizontalScrollIndicator:0];
  [v3 setClipsToBounds:0];
  objc_super v4 = [(HACCShortcutViewController *)self view];
  [v4 addSubview:v3];

  [(HACCShortcutViewController *)self setScrollView:v3];
  v5 = (UIStackView *)objc_alloc_init(MEMORY[0x263F82BF8]);
  stackView = self->_stackView;
  self->_stackView = v5;

  [(UIStackView *)self->_stackView setSpacing:12.0];
  [(UIStackView *)self->_stackView setDistribution:3];
  [(UIStackView *)self->_stackView setAxis:1];
  [v3 addSubview:self->_stackView];
  id v7 = [MEMORY[0x263F47528] sharedInstance];
  [v7 sendMessagesPriorityDefault];
}

- (void)listenForHearingAidUpdates
{
  id v3 = [MEMORY[0x263F47550] sharedInstance];
  objc_super v4 = [v3 pairedHearingAids];

  if ([(HACCShortcutViewController *)self listeningForHearingAidUpdates] || !v4)
  {
    if (!v4) {
      [(HACCShortcutViewController *)self setCurrentHearingDevice:0];
    }
  }
  else
  {
    [(HACCShortcutViewController *)self setListeningForHearingAidUpdates:1];
    objc_initWeak(&location, self);
    v5 = [MEMORY[0x263F47528] sharedInstance];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __56__HACCShortcutViewController_listenForHearingAidUpdates__block_invoke;
    v17[3] = &unk_2647CD938;
    objc_copyWeak(&v18, &location);
    [v5 registerListener:self forAvailableDeviceHandler:v17];

    uint64_t v6 = [MEMORY[0x263F47528] sharedInstance];
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    v14 = __56__HACCShortcutViewController_listenForHearingAidUpdates__block_invoke_2;
    v15 = &unk_2647CD9D8;
    objc_copyWeak(&v16, &location);
    [v6 registerListener:self forPropertyUpdateHandler:&v12];

    uint64_t v11 = MEMORY[0x263EF8330];
    AXPerformBlockOnMainThreadAfterDelay();
    id v7 = [(HACCShortcutViewController *)self currentHearingDevice];
    [v7 setKeepInSync:1];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  objc_super v8 = [(HACCShortcutViewController *)self currentHearingDevice];
  char v9 = [v8 didLoadRequiredProperties];

  if ((v9 & 1) == 0)
  {
    id v10 = [(HACCShortcutViewController *)self currentHearingDevice];
    [v10 loadRequiredProperties];
  }
}

void __56__HACCShortcutViewController_listenForHearingAidUpdates__block_invoke(uint64_t a1, void *a2)
{
  id v8 = [a2 lastObject];
  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);
  v5 = [WeakRetained currentHearingDevice];

  if (!v5)
  {
    id v6 = objc_loadWeakRetained(v3);
    [v6 setShouldDisplayOtherDevice:0];
  }
  id v7 = objc_loadWeakRetained(v3);
  [v7 setCurrentHearingDevice:v8];

  [v8 loadRequiredProperties];
}

void __56__HACCShortcutViewController_listenForHearingAidUpdates__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = [WeakRetained currentHearingDevice];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__HACCShortcutViewController_listenForHearingAidUpdates__block_invoke_3;
  v8[3] = &unk_2647CD9B0;
  id v7 = v6;
  id v9 = v7;
  objc_copyWeak(&v10, v4);
  [v3 enumerateKeysAndObjectsInDependentOrderUsingBlock:v8];
  objc_destroyWeak(&v10);
}

void __56__HACCShortcutViewController_listenForHearingAidUpdates__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([*(id *)(a1 + 32) containsPeripheralWithUUID:v5])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        HAInitializeLogging();
        id v7 = [NSString stringWithFormat:@"Update %@", v6];
        id v8 = [NSString stringWithFormat:@"%s:%d %@", "-[HACCShortcutViewController listenForHearingAidUpdates]_block_invoke_3", 305, v7];
        id v9 = (void *)*MEMORY[0x263F47290];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
        {
          id v10 = v8;
          uint64_t v11 = v9;
          *(_DWORD *)buf = 136446210;
          uint64_t v17 = [v10 UTF8String];
          _os_log_impl(&dword_226B65000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __56__HACCShortcutViewController_listenForHearingAidUpdates__block_invoke_323;
        void v14[3] = &unk_2647CD960;
        id v15 = *(id *)(a1 + 32);
        [v6 enumerateKeysAndObjectsUsingBlock:v14];
        objc_copyWeak(&v13, (id *)(a1 + 40));
        id v12 = v6;
        AXPerformBlockOnMainThread();

        objc_destroyWeak(&v13);
      }
    }
  }
}

void __56__HACCShortcutViewController_listenForHearingAidUpdates__block_invoke_323(uint64_t a1, void *a2, void *a3)
{
  objc_super v4 = *(void **)(a1 + 32);
  id v5 = a3;
  objc_msgSend(v4, "setValue:forProperty:", v5, objc_msgSend(a2, "unsignedLongLongValue"));
}

void __56__HACCShortcutViewController_listenForHearingAidUpdates__block_invoke_2_325(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [*(id *)(a1 + 32) allKeys];
  [WeakRetained updateViewForProperties:v2];
}

uint64_t __56__HACCShortcutViewController_listenForHearingAidUpdates__block_invoke_3_327(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateView];
}

- (void)startListeningForHeadphoneUpdates
{
  if (![(HACCShortcutViewController *)self listeningForHeadphoneUpdates])
  {
    id v3 = [MEMORY[0x263F47550] sharedInstance];
    int v4 = [v3 liveHeadphoneLevelEnabled];

    if (v4)
    {
      [(HACCShortcutViewController *)self setListeningForHeadphoneUpdates:1];
      objc_initWeak(&location, self);
      id v5 = HCLogSoundMeter();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226B65000, v5, OS_LOG_TYPE_INFO, "Registering listener to start receiving headphone audio updates", buf, 2u);
      }

      if ([(HACCShortcutViewController *)self _isStandaloneHeadphoneLevels])
      {
        if (![(HACCShortcutViewController *)self headphoneAudioAvailable]) {
          [(HACCShortcutViewController *)self resetHeadphoneLevelModule];
        }
      }
      id v6 = [MEMORY[0x263F47528] sharedInstance];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __63__HACCShortcutViewController_startListeningForHeadphoneUpdates__block_invoke;
      v7[3] = &unk_2647CD9D8;
      objc_copyWeak(&v8, &location);
      [v6 registerListener:self forLiveHeadphoneLevelHandler:v7];

      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

void __63__HACCShortcutViewController_startListeningForHeadphoneUpdates__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 objectForKey:*MEMORY[0x263F474F8]];
  uint64_t v5 = [v4 BOOLValue];

  id v6 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v6);
  int v8 = [WeakRetained headphoneAudioAvailable];

  if (v5 != v8 && (!UIAccessibilityIsVoiceOverRunning() | v5) == 1)
  {
    id v9 = objc_loadWeakRetained(v6);
    [v9 setHeadphoneAudioAvailable:v5];

    objc_copyWeak(&v13, v6);
    AXPerformBlockOnMainThread();
    objc_destroyWeak(&v13);
  }
  id v10 = objc_loadWeakRetained(v6);
  uint64_t v11 = [v10 moduleToViewControllerMap];
  id v12 = [v11 objectForKey:&unk_26DAB9838];

  [v12 updateWithValue:v3];
}

void __63__HACCShortcutViewController_startListeningForHeadphoneUpdates__block_invoke_2(uint64_t a1)
{
  dispatch_queue_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [WeakRetained _isStandaloneHeadphoneLevels];

  id v4 = objc_loadWeakRetained(v1);
  id v5 = v4;
  if (v3) {
    [v4 resetHeadphoneLevelModule];
  }
  else {
    [v4 updateView];
  }
}

- (void)resetHeadphoneLevelModule
{
  int v3 = [(HACCShortcutViewController *)self moduleToViewControllerMap];
  id v6 = [v3 objectForKey:&unk_26DAB9838];

  [v6 removeFromParentViewController];
  id v4 = [v6 view];
  [v4 removeFromSuperview];

  id v5 = [(HACCShortcutViewController *)self moduleToViewControllerMap];
  [v5 removeObjectForKey:&unk_26DAB9838];

  [(HACCShortcutViewController *)self updateView];
}

- (void)stopListeningForHeadphoneUpdates
{
  int v3 = HCLogSoundMeter();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_226B65000, v3, OS_LOG_TYPE_INFO, "Unregistering listener to stop receiving headphone audio updates", v5, 2u);
  }

  id v4 = [MEMORY[0x263F47528] sharedInstance];
  [v4 unregisterLiveHeadphoneLevelHandler:self];

  [(HACCShortcutViewController *)self setListeningForHeadphoneUpdates:0];
  [(HACCShortcutViewController *)self setHeadphoneAudioAvailable:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HACCShortcutViewController;
  [(HACCShortcutViewController *)&v4 viewDidAppear:a3];
  [(HACCShortcutViewController *)self updateAvailableControls];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HACCShortcutViewController;
  [(HACCShortcutViewController *)&v6 viewWillAppear:a3];
  objc_super v4 = [MEMORY[0x263F47568] sharedUtilities];
  [v4 clearAudioRoutes];

  [(HACCShortcutViewController *)self updateRoutes];
  [(HACCShortcutViewController *)self listenForHearingAidUpdates];
  [(HACCShortcutViewController *)self startListeningForHeadphoneUpdates];
  id v5 = [MEMORY[0x263F47528] sharedInstance];
  [v5 sendMessagesPriorityHigh];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HACCShortcutViewController;
  [(HACCShortcutViewController *)&v7 viewDidDisappear:a3];
  if (![(HACCShortcutViewController *)self isExpanded])
  {
    objc_super v4 = [MEMORY[0x263F47528] sharedInstance];
    [v4 unregisterUpdateListener:self];

    id v5 = [(HACCShortcutViewController *)self currentHearingDevice];
    [v5 setKeepInSync:0];

    [(HACCShortcutViewController *)self setListeningForHearingAidUpdates:0];
    [(HACCShortcutViewController *)self stopListeningForHeadphoneUpdates];
    objc_super v6 = [MEMORY[0x263F47528] sharedInstance];
    [v6 sendMessagesPriorityDefault];
  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HACCShortcutViewController;
  [(HACCShortcutViewController *)&v5 viewIsAppearing:a3];
  objc_super v4 = [(HACCShortcutViewController *)self view];
  [v4 setClipsToBounds:0];

  [(HACCShortcutViewController *)self updateAvailableControls];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  uint64_t v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)HACCShortcutViewController;
  id v6 = a3;
  [(HACCShortcutViewController *)&v7 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
  NSClassFromString(&cfstr_Sbtransientove.isa);
  LOBYTE(v4) = objc_opt_isKindOfClass();

  if (v4) {
    [(HACCShortcutViewController *)self updateAvailableControls];
  }
}

- (BOOL)_isShownInGallery
{
  v2 = [(HACCShortcutViewController *)self view];
  int v3 = [v2 _accessibilityViewAncestorIsKindOf:NSClassFromString(&cfstr_Sbhaddwidgetsh.isa)];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HACCShortcutViewController;
  -[HACCShortcutViewController viewWillTransitionToSize:withTransitionCoordinator:](&v13, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __81__HACCShortcutViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v10[3] = &unk_2647CDA00;
  objc_copyWeak(&v11, &location);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __81__HACCShortcutViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v8[3] = &unk_2647CDA00;
  objc_copyWeak(&v9, &location);
  [v7 animateAlongsideTransition:v10 completion:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __81__HACCShortcutViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  dispatch_queue_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateAvailableControls];

  id v3 = objc_loadWeakRetained(v1);
  [v3 updateHeight];
}

void __81__HACCShortcutViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  char v5 = [WeakRetained isExpanded];

  if ((v5 & 1) == 0)
  {
    id v6 = objc_loadWeakRetained(v2);
    [v6 updateHeight];
  }
  id v11 = [v3 viewControllerForKey:*MEMORY[0x263F83C00]];
  id v7 = [v3 viewControllerForKey:*MEMORY[0x263F83C10]];

  NSClassFromString(&cfstr_Ccuimainviewco.isa);
  NSClassFromString(&cfstr_Ccuicontentmod.isa);
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass())
  {
    id v8 = objc_loadWeakRetained(v2);
    id v9 = v8;
    uint64_t v10 = 1;
LABEL_9:
    [v8 updateContentViewListeners:v10];

    goto LABEL_10;
  }
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass())
  {
    id v8 = objc_loadWeakRetained(v2);
    id v9 = v8;
    uint64_t v10 = 0;
    goto LABEL_9;
  }
LABEL_10:
}

- (void)bluetoothAvailabilityDidChange:(id)a3
{
  [(AXDispatchTimer *)self->_bluetoothAvailabilityTimer cancel];
  bluetoothAvailabilityTimer = self->_bluetoothAvailabilityTimer;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __61__HACCShortcutViewController_bluetoothAvailabilityDidChange___block_invoke;
  v5[3] = &unk_2647CD1B8;
  v5[4] = self;
  [(AXDispatchTimer *)bluetoothAvailabilityTimer afterDelay:v5 processBlock:0.5];
}

void __61__HACCShortcutViewController_bluetoothAvailabilityDidChange___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F2B998] sharedInstance];
  if (([v2 available] & 1) == 0)
  {

LABEL_6:
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = *(unsigned __int8 *)(v7 + 1058);
    *(unsigned char *)(v7 + 1058) = 0;
    if (!v8) {
      return;
    }
    goto LABEL_7;
  }
  id v3 = [MEMORY[0x263F2B998] sharedInstance];
  char v4 = [v3 powered];

  if ((v4 & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = *(unsigned __int8 *)(v5 + 1058);
  *(unsigned char *)(v5 + 1058) = 1;
  if (v6) {
    return;
  }
LABEL_7:
  AXPerformBlockOnMainThread();
}

uint64_t __61__HACCShortcutViewController_bluetoothAvailabilityDidChange___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateView];
}

- (void)updateNoiseControl:(id)a3
{
  char v4 = [(HACCShortcutViewController *)self backgroundUpdateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__HACCShortcutViewController_updateNoiseControl___block_invoke;
  block[3] = &unk_2647CD1B8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __49__HACCShortcutViewController_updateNoiseControl___block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x263EF8340];
  v2 = paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
  id v3 = [v2 address];
  uint64_t v4 = [v2 listeningMode];
  if (v3)
  {
    uint64_t v5 = v4;
    int v6 = [*(id *)(a1 + 32) previousListeningModeForAddress];
    uint64_t v7 = [v6 objectForKey:v3];

    if (v7)
    {
      int v8 = *(void **)(a1 + 32);
      id v11 = v3;
      id v9 = [NSNumber numberWithUnsignedInt:v5];
      v12[0] = v9;
      uint64_t v10 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
      [v8 setPreviousListeningModeForAddress:v10];
    }
  }
}

- (void)contentCategoryDidChange:(id)a3
{
  uint64_t v4 = [(HACCShortcutViewController *)self moduleToViewControllerMap];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__HACCShortcutViewController_contentCategoryDidChange___block_invoke;
  v6[3] = &unk_2647CDA28;
  v6[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];

  uint64_t v5 = [(HACCShortcutViewController *)self moduleToViewControllerMap];
  [v5 removeAllObjects];

  [(HACCShortcutViewController *)self updateAvailableControls];
}

void __55__HACCShortcutViewController_contentCategoryDidChange___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a3;
  uint64_t v5 = [v3 stackView];
  int v6 = [v4 view];
  [v5 removeArrangedSubview:v6];

  id v7 = [v4 view];

  [v7 removeFromSuperview];
}

- (BOOL)shouldDisplayControlForModule:(unint64_t)a3
{
  uint64_t v5 = [(HACCShortcutViewController *)self mainStackOrderArray];
  int v6 = [(HACCShortcutViewController *)self mainStackOrderArray];
  LOBYTE(a3) = [(HACCShortcutViewController *)self shouldDisplayControlForModule:a3 fromModulesArray:v5 mainStackOrderArrayCopy:v6];

  return a3;
}

- (BOOL)shouldDisplayControlForModule:(unint64_t)a3 fromModulesArray:(id)a4 mainStackOrderArrayCopy:(id)a5
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(HACCShortcutViewController *)self currentHearingDevice];
  if (v10)
  {
    id v11 = [MEMORY[0x263F47528] sharedInstance];
    if ([v11 hearingAidReachable]) {
      BOOL bluetoothAvailable = self->_bluetoothAvailable;
    }
    else {
      BOOL bluetoothAvailable = 0;
    }
  }
  else
  {
    BOOL bluetoothAvailable = 0;
  }

  objc_super v13 = [(HACCShortcutViewController *)self currentHearingDevice];
  v14 = v13;
  switch(a3)
  {
    case 0uLL:
      uint64_t v19 = &unk_26DAB9820;
      goto LABEL_88;
    case 1uLL:
      char v25 = [v13 propertyIsAvailable:0x4000000000 forEar:2];
      id v26 = v14;
      uint64_t v27 = 0x4000000000;
      goto LABEL_26;
    case 2uLL:
      char v25 = [v13 propertyIsAvailable:0x4000000000 forEar:4];
      v28 = v14;
      uint64_t v29 = 0x4000000000;
      goto LABEL_29;
    case 3uLL:
      char v30 = [v13 propertyIsAvailable:0x4000000000 forEar:2];
      char v31 = [v14 propertyIsAvailable:0x4000000000 forEar:4];
      objc_super v32 = v14;
      uint64_t v33 = 0x4000000000;
      goto LABEL_33;
    case 4uLL:
      char v25 = [v13 propertyIsAvailable:64 forEar:2];
      id v26 = v14;
      uint64_t v27 = 64;
      goto LABEL_26;
    case 5uLL:
      char v25 = [v13 propertyIsAvailable:64 forEar:4];
      v28 = v14;
      uint64_t v29 = 64;
      goto LABEL_29;
    case 6uLL:
      char v30 = [v13 propertyIsAvailable:64 forEar:2];
      char v31 = [v14 propertyIsAvailable:64 forEar:4];
      objc_super v32 = v14;
      uint64_t v33 = 64;
      goto LABEL_33;
    case 7uLL:
      char v25 = [v13 propertyIsAvailable:0x80000000 forEar:2];
      id v26 = v14;
      uint64_t v27 = 0x80000000;
LABEL_26:
      char v34 = [v26 shouldOnlyShowIndividualVolumesForProperty:v27];
      if (!bluetoothAvailable) {
        goto LABEL_128;
      }
      char v35 = v34;
      char v36 = [v14 isLeftConnected];
      goto LABEL_31;
    case 8uLL:
      char v25 = [v13 propertyIsAvailable:0x80000000 forEar:4];
      v28 = v14;
      uint64_t v29 = 0x80000000;
LABEL_29:
      char v37 = [v28 shouldOnlyShowIndividualVolumesForProperty:v29];
      if (!bluetoothAvailable) {
        goto LABEL_128;
      }
      char v35 = v37;
      char v36 = [v14 isRightConnected];
LABEL_31:
      LOBYTE(v38) = v36 & v25 & v35;
      goto LABEL_161;
    case 9uLL:
      char v30 = [v13 propertyIsAvailable:0x80000000 forEar:2];
      char v31 = [v14 propertyIsAvailable:0x80000000 forEar:4];
      objc_super v32 = v14;
      uint64_t v33 = 0x80000000;
LABEL_33:
      char v39 = [v32 shouldOnlyShowIndividualVolumesForProperty:v33];
      if (!bluetoothAvailable) {
        goto LABEL_128;
      }
      char v40 = v39;
      if (![v14 isLeftConnected] || !objc_msgSend(v14, "isRightConnected")) {
        goto LABEL_128;
      }
      LOBYTE(v38) = (v30 | v31) & ~v40;
      goto LABEL_161;
    case 0xAuLL:
      if ([v13 propertyIsAvailable:0x2000000000 forEar:2]) {
        goto LABEL_40;
      }
      v41 = v14;
      uint64_t v42 = 0x2000000000;
      goto LABEL_103;
    case 0xBuLL:
      if ([v13 propertyIsAvailable:0x1000000000 forEar:2])
      {
LABEL_40:
        LOBYTE(v38) = 1;
        if (!bluetoothAvailable)
        {
LABEL_128:
          LOBYTE(v38) = 0;
          goto LABEL_161;
        }
      }
      else
      {
        v41 = v14;
        uint64_t v42 = 0x1000000000;
LABEL_103:
        LOBYTE(v38) = [v41 propertyIsAvailable:v42 forEar:4];
        if (!bluetoothAvailable) {
          goto LABEL_128;
        }
      }
      if (([v14 isLeftConnected] & 1) == 0 && !objc_msgSend(v14, "isRightConnected")) {
        goto LABEL_128;
      }
      goto LABEL_161;
    case 0xCuLL:
      char v43 = [v13 propertyIsAvailable:128 forEar:2];
      char v44 = [v14 shouldOnlyShowIndividualVolumesForProperty:128];
      v45 = [v14 leftSelectedStreamingProgram];
      if ([v45 isSelected]) {
        char v46 = [v45 isStreamOrMixingStream];
      }
      else {
        char v46 = 0;
      }
      if (!bluetoothAvailable) {
        goto LABEL_157;
      }
      char v86 = [v14 isLeftConnected];
      goto LABEL_113;
    case 0xDuLL:
      char v43 = [v13 propertyIsAvailable:128 forEar:4];
      char v44 = [v14 shouldOnlyShowIndividualVolumesForProperty:128];
      v45 = [v14 rightSelectedStreamingProgram];
      if ([v45 isSelected]) {
        char v46 = [v45 isStreamOrMixingStream];
      }
      else {
        char v46 = 0;
      }
      if (!bluetoothAvailable) {
        goto LABEL_157;
      }
      char v86 = [v14 isRightConnected];
LABEL_113:
      LOBYTE(v38) = v86 & v43 & v44 & v46;
      goto LABEL_160;
    case 0xEuLL:
      char v95 = [v13 propertyIsAvailable:128 forEar:2];
      char v47 = [v14 propertyIsAvailable:128 forEar:4];
      int v48 = [v14 shouldOnlyShowIndividualVolumesForProperty:128];
      v45 = [v14 leftSelectedStreamingProgram];
      v49 = [v14 rightSelectedStreamingProgram];
      if ([v45 isSelected]) {
        char v50 = [v45 isStreamOrMixingStream];
      }
      else {
        char v50 = 0;
      }
      if ([v49 isSelected]) {
        char v87 = [v49 isStreamOrMixingStream];
      }
      else {
        char v87 = 0;
      }
      if (!bluetoothAvailable
        || ![v14 isLeftConnected]
        || (([v14 isRightConnected] ^ 1 | v48) & 1) != 0)
      {
        goto LABEL_138;
      }
      LOBYTE(v38) = v50 & v95 | v87 & v47;
      goto LABEL_150;
    case 0xFuLL:
      v51 = [v13 leftPrograms];
      uint64_t v52 = [v51 count];

      BOOL v53 = v52 == 0;
      goto LABEL_52;
    case 0x10uLL:
      v54 = [v13 rightPrograms];
      uint64_t v55 = [v54 count];

      BOOL v56 = v55 == 0;
      goto LABEL_59;
    case 0x11uLL:
      v57 = [v13 programs];
      uint64_t v58 = [v57 count];

      BOOL v59 = v58 == 0;
      goto LABEL_66;
    case 0x12uLL:
      v60 = [v13 leftPrograms];
      uint64_t v61 = [v60 indexOfObjectPassingTest:&__block_literal_global_358];

      BOOL v53 = v61 == 0x7FFFFFFFFFFFFFFFLL;
LABEL_52:
      BOOL v62 = !v53 && bluetoothAvailable;
      if (!v62 || ([v14 showCombinedPrograms] & 1) != 0) {
        goto LABEL_128;
      }
      char v63 = [v14 isLeftConnected];
      goto LABEL_142;
    case 0x13uLL:
      v64 = [v13 rightPrograms];
      uint64_t v65 = [v64 indexOfObjectPassingTest:&__block_literal_global_360];

      BOOL v56 = v65 == 0x7FFFFFFFFFFFFFFFLL;
LABEL_59:
      BOOL v66 = !v56 && bluetoothAvailable;
      if (!v66 || ([v14 showCombinedPrograms] & 1) != 0) {
        goto LABEL_128;
      }
      goto LABEL_72;
    case 0x14uLL:
      v67 = [v13 programs];
      uint64_t v68 = [v67 indexOfObjectPassingTest:&__block_literal_global_362];

      BOOL v59 = v68 == 0x7FFFFFFFFFFFFFFFLL;
LABEL_66:
      BOOL v69 = !v59 && bluetoothAvailable;
      if (!v69 || ![v14 showCombinedPrograms]) {
        goto LABEL_128;
      }
      if ([v14 isLeftConnected]) {
        goto LABEL_77;
      }
LABEL_72:
      char v63 = [v14 isRightConnected];
      goto LABEL_142;
    case 0x15uLL:
      v70 = [(HACCShortcutViewController *)self currentHearingDevice];
      if ([v70 propertyIsAvailable:0x10000000000 forEar:2])
      {
        unsigned int v71 = 1;
      }
      else
      {
        v88 = [(HACCShortcutViewController *)self currentHearingDevice];
        unsigned int v71 = [v88 propertyIsAvailable:0x10000000000 forEar:4];
      }
      if ((bluetoothAvailable & v71) == 1 && [v14 availableInputEars]) {
        unsigned int v38 = hearingAidReceivingAudio() ^ 1;
      }
      else {
        unsigned int v38 = 0;
      }
      HAInitializeLogging();
      v45 = [NSString stringWithFormat:@"Showing mic control %d = [%d, %d, %d, %d]", v38, bluetoothAvailable, v71, objc_msgSend(v14, "availableInputEars"), hearingAidReceivingAudio()];
      v49 = [NSString stringWithFormat:@"%s:%d %@", "-[HACCShortcutViewController shouldDisplayControlForModule:fromModulesArray:mainStackOrderArrayCopy:]", 833, v45];
      v89 = (void *)*MEMORY[0x263F47290];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_150;
      }
      id v90 = v49;
      v73 = v89;
      *(_DWORD *)buf = 136446210;
      uint64_t v98 = [v90 UTF8String];
      _os_log_impl(&dword_226B65000, v73, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      goto LABEL_149;
    case 0x16uLL:
      LOBYTE(v38) = bluetoothAvailable;
      goto LABEL_161;
    case 0x17uLL:
      if ([(HACCShortcutViewController *)self _isStandaloneHeadphoneLevelsFromMainStackOrderArray:v9])
      {
        goto LABEL_77;
      }
      if (![(HACCShortcutViewController *)self headphoneAudioAvailable]) {
        goto LABEL_128;
      }
      v45 = [MEMORY[0x263F47550] sharedInstance];
      if ([v45 liveHeadphoneLevelEnabled])
      {
        v72 = &unk_26DAB9820;
        goto LABEL_127;
      }
LABEL_157:
      LOBYTE(v38) = 0;
      goto LABEL_160;
    case 0x18uLL:
      v45 = [MEMORY[0x263F47548] sharedInstance];
      if (![v45 comfortSoundsAvailable]) {
        goto LABEL_157;
      }
      goto LABEL_82;
    case 0x19uLL:
      v45 = [MEMORY[0x263F47548] sharedInstance];
      if (![v45 comfortSoundsAvailable] || self->_mediaIsPlaying) {
        goto LABEL_157;
      }
LABEL_82:
      v72 = &unk_26DAB9898;
      goto LABEL_127;
    case 0x1AuLL:
      v45 = [MEMORY[0x263F47548] sharedInstance];
      if (![v45 comfortSoundsAvailable]) {
        goto LABEL_157;
      }
      v49 = [MEMORY[0x263F47548] sharedInstance];
      if (![v49 mixesWithMedia] || !self->_mediaIsPlaying) {
        goto LABEL_138;
      }
      LOBYTE(v38) = [v8 containsObject:&unk_26DAB9898];
      goto LABEL_150;
    case 0x1BuLL:
    case 0x1CuLL:
      if (![(HACCShortcutViewController *)self shouldDisplayControlForModule:25 fromModulesArray:v8 mainStackOrderArrayCopy:v9]&& ![(HACCShortcutViewController *)self shouldDisplayControlForModule:26 fromModulesArray:v8 mainStackOrderArrayCopy:v9])
      {
        goto LABEL_128;
      }
      uint64_t v19 = &unk_26DAB9898;
LABEL_88:
      char v63 = [v8 containsObject:v19];
      goto LABEL_142;
    case 0x1DuLL:
      uint64_t v19 = &unk_26DAB9868;
      goto LABEL_88;
    case 0x1EuLL:
      v45 = paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
      v49 = [MEMORY[0x263F5D458] sharedInstance];
      if (([v49 personalMediaEnabled] & 1) != 0
        || !paCurrentRouteSupportsTransparencyAccommodations()
        || !paBluetoothDeviceSupportsSSL()
        || ![v8 containsObject:&unk_26DAB9880])
      {
        goto LABEL_138;
      }
      v73 = [MEMORY[0x263F5D450] sharedInstance];
      v74 = [v45 address];
      unsigned int v38 = [v73 yodelEnabledForAddress:v74] ^ 1;
      goto LABEL_148;
    case 0x1FuLL:
    case 0x20uLL:
    case 0x23uLL:
      id v15 = [MEMORY[0x263F5D450] sharedInstance];
      id v16 = paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
      uint64_t v17 = [v16 address];
      char v18 = [v15 yodelEnabledForAddress:v17];

      if (v18)
      {
        if (([v8 containsObject:&unk_26DAB9850] & 1) == 0) {
          goto LABEL_141;
        }
LABEL_77:
        LOBYTE(v38) = 1;
        goto LABEL_161;
      }
      v20 = [MEMORY[0x263F5D458] sharedInstance];
      if (![v20 personalMediaEnabled]) {
        goto LABEL_140;
      }
      v21 = [MEMORY[0x263F5D458] sharedInstance];
      uint64_t v22 = [v21 personalMediaConfiguration];
      if (!v22)
      {

LABEL_140:
        goto LABEL_141;
      }
      v23 = (void *)v22;
      char v24 = [v8 containsObject:&unk_26DAB9850];

      if (v24) {
        goto LABEL_77;
      }
LABEL_141:
      char v63 = [(HACCShortcutViewController *)self _isStandalonePMEModuleFromMainStackOrderArray:v9];
LABEL_142:
      LOBYTE(v38) = v63;
LABEL_161:

      return v38;
    case 0x21uLL:
      v45 = paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
      v75 = [MEMORY[0x263F5D450] sharedInstance];
      v76 = [v45 address];
      char v77 = [v75 yodelEnabledForAddress:v76];

      if (v77)
      {
        v72 = &unk_26DAB9850;
LABEL_127:
        char v91 = [v8 containsObject:v72];
LABEL_159:
        LOBYTE(v38) = v91;
      }
      else
      {
        v49 = [MEMORY[0x263F5D458] sharedInstance];
        if ([v49 personalMediaEnabled])
        {
          v73 = [MEMORY[0x263F5D458] sharedInstance];
          v74 = [v73 personalMediaConfiguration];
          if (v74)
          {
            v92 = [MEMORY[0x263F5D458] sharedInstance];
            v93 = [v45 address];
            if ([v92 transparencyCustomizedForAddress:v93]) {
              LOBYTE(v38) = [v8 containsObject:&unk_26DAB9850];
            }
            else {
              LOBYTE(v38) = 0;
            }
          }
          else
          {
            LOBYTE(v38) = 0;
          }
LABEL_148:

LABEL_149:
        }
        else
        {
LABEL_138:
          LOBYTE(v38) = 0;
        }
LABEL_150:
      }
LABEL_160:

      goto LABEL_161;
    case 0x22uLL:
      v45 = paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
      unsigned int v78 = [v45 getAACPCapabilityInteger:6];
      int v79 = paCurrentRouteSupportsTransparencyAccommodations();
      if (v79)
      {
        char v80 = 0;
        if (_os_feature_enabled_impl() && v78 >= 2)
        {
          v81 = [MEMORY[0x263F5D458] sharedInstance];
          if ([v81 personalMediaEnabled])
          {
            v82 = [MEMORY[0x263F5D458] sharedInstance];
            v83 = [v82 personalMediaConfiguration];
            if (v83)
            {
              v84 = [MEMORY[0x263F5D458] sharedInstance];
              [v45 address];
              v85 = v96 = v82;
              char v80 = [v84 transparencyCustomizedForAddress:v85];

              v82 = v96;
            }
            else
            {
              char v80 = 0;
            }
          }
          else
          {
            char v80 = 0;
          }
        }
        int v79 = paBluetoothDeviceSupportsSSL();
      }
      else
      {
        char v80 = 0;
      }
      if ((v80 & 1) == 0 && !v79) {
        goto LABEL_157;
      }
      char v91 = [(HACCShortcutViewController *)self shouldDisplayControlForModule:33 fromModulesArray:v8 mainStackOrderArrayCopy:v9];
      goto LABEL_159;
    default:
      goto LABEL_128;
  }
}

uint64_t __101__HACCShortcutViewController_shouldDisplayControlForModule_fromModulesArray_mainStackOrderArrayCopy___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isMixingStream];
}

uint64_t __101__HACCShortcutViewController_shouldDisplayControlForModule_fromModulesArray_mainStackOrderArrayCopy___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isMixingStream];
}

uint64_t __101__HACCShortcutViewController_shouldDisplayControlForModule_fromModulesArray_mainStackOrderArrayCopy___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 isMixingStream];
}

- (BOOL)addSeparatorAboveModule:(unint64_t)a3
{
  return a3 != 0;
}

- (BOOL)addPartialSeparatorAboveModule:(unint64_t)a3
{
  return a3 == 34 || a3 - 25 < 2;
}

- (id)parentViewControllerForModule:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
      id v3 = [(HACCShortcutViewController *)self moduleToViewControllerMap];
      id v4 = v3;
      uint64_t v5 = &unk_26DAB9820;
      goto LABEL_3;
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
      id v3 = [(HACCShortcutViewController *)self moduleToViewControllerMap];
      id v4 = v3;
      uint64_t v5 = &unk_26DAB9898;
      goto LABEL_3;
    case 0x20uLL:
    case 0x21uLL:
    case 0x22uLL:
    case 0x23uLL:
      id v3 = [(HACCShortcutViewController *)self moduleToViewControllerMap];
      id v4 = v3;
      uint64_t v5 = &unk_26DAB9850;
LABEL_3:
      int v6 = [v3 objectForKey:v5];

      break;
    default:
      int v6 = self;
      break;
  }
  return v6;
}

- (BOOL)_isMainStackForModule:(unint64_t)a3
{
  id v4 = [(HACCShortcutViewController *)self mainStackIndexSet];
  LOBYTE(a3) = [v4 containsIndex:a3];

  return a3;
}

- (unint64_t)_mainStackIndexForModule:(unint64_t)a3
{
  id v4 = [(HACCShortcutViewController *)self mainStackOrderArray];
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:a3];
  unint64_t v6 = [v4 indexOfObject:v5];

  return v6;
}

- (id)contentControllerForModule:(unint64_t)a3
{
  id v3 = [[HACCContentViewController alloc] initWithContentModule:a3 andDelegate:self];
  return v3;
}

- (void)updateContentViewListeners:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(HACCShortcutViewController *)self moduleToViewControllerMap];
  uint64_t v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = [v10 contentView];
        if (v3)
        {
          char v12 = objc_opt_respondsToSelector();

          if ((v12 & 1) == 0) {
            continue;
          }
          objc_super v13 = [v10 contentView];
          [v13 subscribeListeners];
        }
        else
        {
          char v14 = objc_opt_respondsToSelector();

          if ((v14 & 1) == 0) {
            continue;
          }
          objc_super v13 = [v10 contentView];
          [v13 unsubscribeListeners];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (void)updateAvailableControls
{
  if (![(HACCShortcutViewController *)self _isShownInGallery])
  {
    [(HACCShortcutViewController *)self listenForHearingAidUpdates];
    [(HACCShortcutViewController *)self startListeningForHeadphoneUpdates];
    BOOL v3 = [(HACCShortcutViewController *)self view];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;

    uint64_t v8 = [(HACCShortcutViewController *)self view];
    [v8 frame];
    double v10 = v9;
    double v12 = v11;

    objc_super v13 = [(HACCShortcutViewController *)self scrollView];
    objc_msgSend(v13, "setFrame:", v5, v7, v10, v12);

    char v14 = [(HACCShortcutViewController *)self mainStackOrderArray];
    long long v15 = (void *)[v14 copy];

    long long v16 = [MEMORY[0x263F47528] sharedInstance];
    long long v17 = [v16 connectionQueue];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __53__HACCShortcutViewController_updateAvailableControls__block_invoke;
    v19[3] = &unk_2647CD360;
    v19[4] = self;
    id v20 = v15;
    id v18 = v15;
    dispatch_async(v17, v19);
  }
}

void __53__HACCShortcutViewController_updateAvailableControls__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F089C8] indexSet];
  BOOL v3 = [*(id *)(a1 + 32) stackOrder];
  for (uint64_t i = 0; i != 36; ++i)
  {
    if ([*(id *)(a1 + 32) shouldDisplayControlForModule:i fromModulesArray:v3 mainStackOrderArrayCopy:*(void *)(a1 + 40)])objc_msgSend(v2, "addIndex:", i); {
  }
    }
  double v7 = v2;
  id v5 = v2;
  id v6 = v3;
  AXPerformBlockOnMainThread();
}

uint64_t __53__HACCShortcutViewController_updateAvailableControls__block_invoke_2(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setMainStackOrderArray:*(void *)(a1 + 40)];
  uint64_t v2 = 0;
  *(void *)&long long v3 = 138412802;
  long long v46 = v3;
  do
  {
    double v4 = objc_msgSend(*(id *)(a1 + 32), "moduleToViewControllerMap", v46);
    id v5 = [NSNumber numberWithUnsignedInteger:v2];
    id v6 = [v4 objectForKey:v5];

    if ([*(id *)(a1 + 48) containsIndex:v2])
    {
      if (!v6)
      {
        id v6 = [*(id *)(a1 + 32) contentControllerForModule:v2];
        double v7 = [*(id *)(a1 + 32) moduleToViewControllerMap];
        uint64_t v8 = [NSNumber numberWithUnsignedInteger:v2];
        [v7 setObject:v6 forKey:v8];

        double v9 = [*(id *)(a1 + 32) parentViewControllerForModule:v2];
        [v9 addChildViewController:v6];

        double v10 = AXLogCommon();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          double v11 = [NSNumber numberWithUnsignedInteger:v2];
          double v12 = NSNumber;
          objc_super v13 = [*(id *)(a1 + 32) parentViewControllerForModule:v2];
          char v14 = [v13 childViewControllers];
          long long v15 = objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
          *(_DWORD *)buf = v46;
          int v48 = v11;
          __int16 v49 = 2112;
          char v50 = v6;
          __int16 v51 = 2112;
          uint64_t v52 = v15;
          _os_log_impl(&dword_226B65000, v10, OS_LOG_TYPE_DEFAULT, "HACCShortcutViewController module %@, add controller %@, children %@", buf, 0x20u);
        }
      }
      int v16 = [*(id *)(a1 + 32) _isMainStackForModule:v2];
      long long v17 = *(void **)(a1 + 32);
      if (v16)
      {
        uint64_t v18 = [v17 _mainStackIndexForModule:v2];
        if (v18 == 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_22:
          [v6 updateValue];
          goto LABEL_31;
        }
        unint64_t v19 = v18;
        id v20 = [v6 view];
        v21 = [v20 superview];

        if (v21)
        {
          uint64_t v22 = [*(id *)(a1 + 32) stackView];
          v23 = [v6 view];
          [v22 removeArrangedSubview:v23];
        }
        char v24 = [*(id *)(a1 + 32) stackView];
        char v25 = [v24 arrangedSubviews];
        unint64_t v26 = [v25 count];

        if (v19 >= v26) {
          unint64_t v27 = v26;
        }
        else {
          unint64_t v27 = v19;
        }
        v28 = [*(id *)(a1 + 32) stackView];
        uint64_t v29 = [v6 view];
        [v28 insertArrangedSubview:v29 atIndex:v27];
      }
      else
      {
        v28 = [v17 parentViewControllerForModule:v2];
        if (!v28) {
          goto LABEL_21;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_21;
        }
        char v34 = [v6 view];
        char v35 = [v34 superview];

        if (v35) {
          goto LABEL_21;
        }
        uint64_t v29 = [v6 view];
        objc_msgSend(v28, "addExpandedView:shouldAlwaysExpand:", v29, objc_msgSend(*(id *)(a1 + 32), "prefersContentToAlwaysExpand"));
      }

LABEL_21:
      goto LABEL_22;
    }
    int v30 = [*(id *)(a1 + 32) _isMainStackForModule:v2];
    char v31 = *(void **)(a1 + 32);
    if (v30)
    {
      objc_super v32 = [v31 stackView];
      uint64_t v33 = [v6 view];
      [v32 removeArrangedSubview:v33];
    }
    else
    {
      objc_super v32 = [v31 parentViewControllerForModule:v2];
      if (!v32) {
        goto LABEL_27;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_27;
      }
      uint64_t v33 = [v6 view];
      [v32 removeExpandedView:v33];
    }

LABEL_27:
    [v6 removeFromParentViewController];
    char v36 = [v6 view];
    [v36 removeFromSuperview];

    char v37 = [*(id *)(a1 + 32) moduleToViewControllerMap];
    unsigned int v38 = [NSNumber numberWithUnsignedInteger:v2];
    [v37 removeObjectForKey:v38];

    if (!v6) {
      goto LABEL_32;
    }
    char v39 = AXLogCommon();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      char v40 = [NSNumber numberWithUnsignedInteger:v2];
      v41 = NSNumber;
      uint64_t v42 = [*(id *)(a1 + 32) parentViewControllerForModule:v2];
      char v43 = [v42 childViewControllers];
      char v44 = objc_msgSend(v41, "numberWithUnsignedInteger:", objc_msgSend(v43, "count"));
      *(_DWORD *)buf = v46;
      int v48 = v40;
      __int16 v49 = 2112;
      char v50 = v6;
      __int16 v51 = 2112;
      uint64_t v52 = v44;
      _os_log_impl(&dword_226B65000, v39, OS_LOG_TYPE_DEFAULT, "HACCShortcutViewController module %@, remove controller %@, children %@", buf, 0x20u);
    }
LABEL_31:

LABEL_32:
    ++v2;
  }
  while (v2 != 36);
  return [*(id *)(a1 + 32) updateHeight];
}

- (void)updateHeight
{
  uint64_t v19 = 0;
  id v20 = (double *)&v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  long long v3 = [(HACCShortcutViewController *)self view];
  [v3 bounds];
  double v5 = v4;

  id v6 = [(HACCShortcutViewController *)self mainStackIndexSet];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __42__HACCShortcutViewController_updateHeight__block_invoke;
  v18[3] = &unk_2647CDA50;
  v18[4] = self;
  v18[5] = &v19;
  [v6 enumerateIndexesUsingBlock:v18];

  self->_moduleHeight = v20[3];
  double v7 = [(HACCShortcutViewController *)self stackView];
  [v7 frame];
  double v9 = v8;
  double v11 = v10;

  double v12 = v20[3];
  objc_super v13 = [(HACCShortcutViewController *)self stackView];
  objc_msgSend(v13, "setFrame:", v9, v11, v5, v12);

  char v14 = [(HACCShortcutViewController *)self scrollView];
  [(HACCShortcutViewController *)self moduleHeight];
  objc_msgSend(v14, "setFrame:", 0.0, 0.0, v5, v15);

  int v16 = [(HACCShortcutViewController *)self scrollView];
  objc_msgSend(v16, "setContentSize:", v5, v20[3]);

  long long v17 = [(HACCShortcutViewController *)self delegate];
  [v17 shortcutDidChangeSize:self];

  _Block_object_dispose(&v19, 8);
}

void __42__HACCShortcutViewController_updateHeight__block_invoke(uint64_t a1, uint64_t a2)
{
  double v4 = [*(id *)(a1 + 32) moduleToViewControllerMap];
  double v5 = [NSNumber numberWithUnsignedInteger:a2];
  id v9 = [v4 objectForKey:v5];

  id v6 = v9;
  if (v9)
  {
    if (a2) {
      *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
    }
                                                                              + 24)
                                                                  + 12.0;
    double v7 = [v9 view];
    objc_msgSend(v7, "systemLayoutSizeFittingSize:", *MEMORY[0x263F83810], *(double *)(MEMORY[0x263F83810] + 8));
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8
                                                                + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24);

    id v6 = v9;
  }
}

- (double)moduleHeight
{
  double moduleHeight = self->_moduleHeight;
  double v4 = [(HACCShortcutViewController *)self view];
  [v4 bounds];
  double v5 = CGRectGetMidY(v11) - moduleHeight * 0.5;

  double v6 = MEMORY[0x22A662100]() * 0.5;
  if (v5 >= v6) {
    double v7 = v5;
  }
  else {
    double v7 = v6;
  }
  double v8 = [MEMORY[0x263F82B60] mainScreen];
  [v8 bounds];
  double v9 = CGRectGetHeight(v12) + v7 * -2.0;

  self->_mainModuleOrigin.x = 0.0;
  self->_mainModuleOrigin.y = v7;
  if (v9 >= moduleHeight) {
    return moduleHeight;
  }
  else {
    return v9;
  }
}

- (double)preferredContentWidth
{
  uint64_t v2 = [MEMORY[0x263F82B60] mainScreen];
  [v2 bounds];
  double Width = CGRectGetWidth(v5);

  return Width;
}

- (BOOL)providesOwnPlatter
{
  return 1;
}

- (HACCContentViewController)expandedController
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x3032000000;
  double v9 = __Block_byref_object_copy__1;
  double v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  uint64_t v2 = [(HACCShortcutViewController *)self moduleToViewControllerMap];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__HACCShortcutViewController_expandedController__block_invoke;
  v5[3] = &unk_2647CDA78;
  v5[4] = &v6;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (HACCContentViewController *)v3;
}

void __48__HACCShortcutViewController_expandedController__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v9 = a3;
  double v7 = [v9 presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    *a4 = 1;
  }
}

- (BOOL)isExpanded
{
  uint64_t v2 = [(HACCShortcutViewController *)self expandedController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)updateView
{
  BOOL v3 = [(HACCShortcutViewController *)self view];
  [v3 alpha];
  double v5 = v4;

  if (v5 > 0.0)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __40__HACCShortcutViewController_updateView__block_invoke;
    v6[3] = &unk_2647CD1B8;
    v6[4] = self;
    [MEMORY[0x263F82E00] animateWithDuration:0 delay:v6 options:&__block_literal_global_389 animations:0.35 completion:0.0];
  }
}

uint64_t __40__HACCShortcutViewController_updateView__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateAvailableControls];
}

- (void)updateViewForModule:(unint64_t)a3
{
  id v6 = [(HACCShortcutViewController *)self moduleToViewControllerMap];
  double v4 = [NSNumber numberWithUnsignedInteger:a3];
  double v5 = [v6 objectForKey:v4];
  [v5 updateValue];
}

- (void)updateViewForProperties:(id)a3
{
  id v4 = a3;
  double v5 = [MEMORY[0x263F47528] sharedInstance];
  char v6 = [v5 hearingAidReachable];

  if (v6)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __54__HACCShortcutViewController_updateViewForProperties___block_invoke_2;
    v8[3] = &unk_2647CDAC0;
    void v8[4] = self;
    [v4 enumerateObjectsUsingBlock:v8];
  }
  else if ([(HACCShortcutViewController *)self isExpanded])
  {
    double v7 = [(HACCShortcutViewController *)self moduleToViewControllerMap];
    [v7 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_391];
  }
}

uint64_t __54__HACCShortcutViewController_updateViewForProperties___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 updateViewConstraints];
}

void __54__HACCShortcutViewController_updateViewForProperties___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 integerValue];
  if (v6 > 0xFFFFFFFFLL)
  {
    if (v6 > 0xFFFFFFFFFLL)
    {
      if (v6 > 0x3FFFFFFFFFLL)
      {
        if (v6 == 0x4000000000 || v6 == 0x8000000000)
        {
          char v14 = [*(id *)(a1 + 32) moduleToViewControllerMap];
          double v15 = [v14 objectForKey:&unk_26DAB9988];
          [v15 updateValue];

          int v16 = [*(id *)(a1 + 32) moduleToViewControllerMap];
          long long v17 = [v16 objectForKey:&unk_26DAB99A0];
          [v17 updateValue];

          double v7 = [*(id *)(a1 + 32) moduleToViewControllerMap];
          id v40 = v7;
          uint64_t v8 = &unk_26DAB99B8;
          goto LABEL_28;
        }
      }
      else
      {
        if (v6 == 0x1000000000)
        {
          double v7 = [*(id *)(a1 + 32) moduleToViewControllerMap];
          id v40 = v7;
          uint64_t v8 = &unk_26DAB99E8;
          goto LABEL_28;
        }
        if (v6 == 0x2000000000)
        {
          double v7 = [*(id *)(a1 + 32) moduleToViewControllerMap];
          id v40 = v7;
          uint64_t v8 = &unk_26DAB99D0;
LABEL_28:
          char v36 = [v7 objectForKey:v8];
          [v36 updateValue];

          return;
        }
      }
      goto LABEL_31;
    }
    if (v6 != 0x100000000)
    {
      if (v6 != 0x200000000)
      {
        uint64_t v9 = 0x400000000;
        goto LABEL_18;
      }
LABEL_24:
      uint64_t v22 = [*(id *)(a1 + 32) moduleToViewControllerMap];
      v23 = [v22 objectForKey:&unk_26DAB9940];
      [v23 updateValue];

      char v24 = [*(id *)(a1 + 32) moduleToViewControllerMap];
      char v25 = [v24 objectForKey:&unk_26DAB9958];
      [v25 updateValue];

      double v7 = [*(id *)(a1 + 32) moduleToViewControllerMap];
      id v40 = v7;
      uint64_t v8 = &unk_26DAB9970;
      goto LABEL_28;
    }
    goto LABEL_23;
  }
  if (v6 <= 255)
  {
    if (v6 != 4)
    {
      if (v6 != 64)
      {
        if (v6 != 128) {
          goto LABEL_31;
        }
        goto LABEL_24;
      }
LABEL_23:
      uint64_t v18 = [*(id *)(a1 + 32) moduleToViewControllerMap];
      uint64_t v19 = [v18 objectForKey:&unk_26DAB98B0];
      [v19 updateValue];

      id v20 = [*(id *)(a1 + 32) moduleToViewControllerMap];
      uint64_t v21 = [v20 objectForKey:&unk_26DAB98C8];
      [v21 updateValue];

      double v7 = [*(id *)(a1 + 32) moduleToViewControllerMap];
      id v40 = v7;
      uint64_t v8 = &unk_26DAB98E0;
      goto LABEL_28;
    }
LABEL_25:
    double v7 = [*(id *)(a1 + 32) moduleToViewControllerMap];
    id v40 = v7;
    uint64_t v8 = &unk_26DAB9820;
    goto LABEL_28;
  }
  if (v6 == 256)
  {
    unint64_t v26 = [*(id *)(a1 + 32) moduleToViewControllerMap];
    unint64_t v27 = [v26 objectForKey:&unk_26DAB9A00];
    [v27 updateValue];

    v28 = [*(id *)(a1 + 32) moduleToViewControllerMap];
    uint64_t v29 = [v28 objectForKey:&unk_26DAB9A18];
    [v29 updateValue];

    int v30 = [*(id *)(a1 + 32) moduleToViewControllerMap];
    char v31 = [v30 objectForKey:&unk_26DAB9A30];
    [v31 updateValue];

    objc_super v32 = [*(id *)(a1 + 32) moduleToViewControllerMap];
    uint64_t v33 = [v32 objectForKey:&unk_26DAB9A48];
    [v33 updateValue];

    char v34 = [*(id *)(a1 + 32) moduleToViewControllerMap];
    char v35 = [v34 objectForKey:&unk_26DAB9A60];
    [v35 updateValue];

    double v7 = [*(id *)(a1 + 32) moduleToViewControllerMap];
    id v40 = v7;
    uint64_t v8 = &unk_26DAB9A78;
    goto LABEL_28;
  }
  if (v6 == 0x40000) {
    goto LABEL_25;
  }
  uint64_t v9 = 0x80000000;
LABEL_18:
  if (v6 == v9)
  {
    double v10 = [*(id *)(a1 + 32) moduleToViewControllerMap];
    id v11 = [v10 objectForKey:&unk_26DAB98F8];
    [v11 updateValue];

    CGRect v12 = [*(id *)(a1 + 32) moduleToViewControllerMap];
    objc_super v13 = [v12 objectForKey:&unk_26DAB9910];
    [v13 updateValue];

    double v7 = [*(id *)(a1 + 32) moduleToViewControllerMap];
    id v40 = v7;
    uint64_t v8 = &unk_26DAB9928;
    goto LABEL_28;
  }
LABEL_31:
  int v37 = [*(id *)(a1 + 32) isExpanded];
  unsigned int v38 = *(void **)(a1 + 32);
  if (v37)
  {
    char v39 = [v38 moduleToViewControllerMap];
    [v39 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_434];
  }
  else
  {
    [v38 updateAvailableControls];
  }
  *a4 = 1;
}

uint64_t __54__HACCShortcutViewController_updateViewForProperties___block_invoke_432(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 updateValue];
}

- (BOOL)_isStandaloneHeadphoneLevels
{
  BOOL v3 = [(HACCShortcutViewController *)self mainStackOrderArray];
  if ([v3 count] == 1)
  {
    id v4 = [(HACCShortcutViewController *)self mainStackOrderArray];
    char v5 = [v4 containsObject:&unk_26DAB9838];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)_isStandaloneHeadphoneLevelsFromMainStackOrderArray:(id)a3
{
  id v3 = a3;
  if ([v3 count] == 1) {
    char v4 = [v3 containsObject:&unk_26DAB9838];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)shouldShowHeadphoneLevelUnavailable
{
  BOOL v3 = [(HACCShortcutViewController *)self _isStandaloneHeadphoneLevels];
  if ([(HACCShortcutViewController *)self headphoneAudioAvailable])
  {
    char v4 = [MEMORY[0x263F47550] sharedInstance];
    int v5 = [v4 liveHeadphoneLevelEnabled] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v3 & v5;
}

- (BOOL)_isStandalonePMEModule
{
  BOOL v3 = [(HACCShortcutViewController *)self mainStackOrderArray];
  if ([v3 count] == 1)
  {
    char v4 = [(HACCShortcutViewController *)self mainStackOrderArray];
    char v5 = [v4 containsObject:&unk_26DAB9850];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)_isStandalonePMEModuleFromMainStackOrderArray:(id)a3
{
  id v3 = a3;
  if ([v3 count] == 1) {
    char v4 = [v3 containsObject:&unk_26DAB9850];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)showPMEExpandedOptions
{
  uint64_t v2 = [MEMORY[0x263F5D458] sharedInstance];
  if ([v2 personalMediaEnabled])
  {
    id v3 = [MEMORY[0x263F5D458] sharedInstance];
    char v4 = [v3 personalMediaConfiguration];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  uint64_t v6 = paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
  double v7 = [v6 address];

  uint64_t v8 = [MEMORY[0x263F5D450] sharedInstance];
  char v9 = [v8 yodelEnabledForAddress:v7];

  return v9 | v5;
}

- (void)viewController:(id)a3 didExpand:(BOOL)a4
{
  if (!a4) {
    a3 = 0;
  }
  [(HACCShortcutViewController *)self setExpandedController:a3];
}

- (void)controlDidActivate:(id)a3
{
  uint64_t v103 = *MEMORY[0x263EF8340];
  id v4 = a3;
  HAInitializeLogging();
  BOOL v5 = NSString;
  uint64_t v6 = [v4 module];
  double v7 = [v4 contentValue];
  uint64_t v8 = [v5 stringWithFormat:@"Activated %ld - %@", v6, v7];

  char v9 = [NSString stringWithFormat:@"%s:%d %@", "-[HACCShortcutViewController controlDidActivate:]", 1394, v8];
  double v10 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v9;
    CGRect v12 = v10;
    *(_DWORD *)buf = 136446210;
    uint64_t v102 = [v11 UTF8String];
    _os_log_impl(&dword_226B65000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  objc_super v13 = [(HACCShortcutViewController *)self currentHearingDevice];
  switch([v4 module])
  {
    case 1:
      char v14 = [v4 contentValue];
      [v14 doubleValue];
      objc_msgSend(v13, "setLeftMixedVolume:");
      goto LABEL_23;
    case 2:
      goto LABEL_6;
    case 3:
      double v15 = [v4 contentValue];
      [v15 doubleValue];
      objc_msgSend(v13, "setLeftMixedVolume:");

LABEL_6:
      char v14 = [v4 contentValue];
      [v14 doubleValue];
      objc_msgSend(v13, "setRightMixedVolume:");
      goto LABEL_23;
    case 4:
      char v14 = [v4 contentValue];
      [v14 doubleValue];
      objc_msgSend(v13, "setLeftMicrophoneVolume:");
      goto LABEL_23;
    case 5:
      goto LABEL_9;
    case 6:
      int v16 = [v4 contentValue];
      [v16 doubleValue];
      objc_msgSend(v13, "setLeftMicrophoneVolume:");

LABEL_9:
      char v14 = [v4 contentValue];
      [v14 doubleValue];
      objc_msgSend(v13, "setRightMicrophoneVolume:");
      goto LABEL_23;
    case 7:
      char v14 = [v4 contentValue];
      [v14 doubleValue];
      objc_msgSend(v13, "setLeftSensitivity:");
      goto LABEL_23;
    case 8:
      goto LABEL_12;
    case 9:
      long long v17 = [v4 contentValue];
      [v17 doubleValue];
      objc_msgSend(v13, "setLeftSensitivity:");

LABEL_12:
      char v14 = [v4 contentValue];
      [v14 doubleValue];
      objc_msgSend(v13, "setRightSensitivity:");
      goto LABEL_23;
    case 10:
      uint64_t v18 = [v4 contentValue];
      [v18 doubleValue];
      uint64_t v20 = (int)((v19 + -0.5) * 255.0);

      [v13 setLeftTreble:v20];
      [v13 setRightTreble:v20];
      break;
    case 11:
      uint64_t v21 = [v4 contentValue];
      [v21 doubleValue];
      uint64_t v23 = (int)((v22 + -0.5) * 255.0);

      [v13 setLeftBass:v23];
      [v13 setRightBass:v23];
      break;
    case 12:
      char v14 = [v4 contentValue];
      [v14 doubleValue];
      objc_msgSend(v13, "setLeftStreamVolume:");
      goto LABEL_23;
    case 13:
      goto LABEL_17;
    case 14:
      char v24 = [v4 contentValue];
      [v24 doubleValue];
      objc_msgSend(v13, "setLeftStreamVolume:");

LABEL_17:
      char v14 = [v4 contentValue];
      [v14 doubleValue];
      objc_msgSend(v13, "setRightStreamVolume:");
      goto LABEL_23;
    case 24:
      char v25 = [MEMORY[0x263F47548] sharedInstance];
      int v26 = [v25 comfortSoundsAvailable];

      if (!v26) {
        break;
      }
      unint64_t v27 = [MEMORY[0x263F47548] sharedInstance];
      int v28 = [v27 comfortSoundsEnabled];

      char v14 = [MEMORY[0x263F47548] sharedInstance];
      [v14 setComfortSoundsEnabled:v28 ^ 1u];
      goto LABEL_23;
    case 25:
      char v14 = [MEMORY[0x263F47548] sharedInstance];
      uint64_t v29 = [v4 contentValue];
      [v29 doubleValue];
      objc_msgSend(v14, "setRelativeVolume:");
      goto LABEL_22;
    case 26:
      char v14 = [MEMORY[0x263F47548] sharedInstance];
      uint64_t v29 = [v4 contentValue];
      [v29 doubleValue];
      objc_msgSend(v14, "setMediaVolume:");
LABEL_22:

LABEL_23:
      break;
    case 29:
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v30 = v4;
      }
      else {
        id v30 = 0;
      }
      __int16 v49 = [v4 contentValue];
      int v50 = [v49 BOOLValue];

      hearingLocString();
      if (v50) {
        __int16 v51 = {;
      }
        [v30 setAccessibilityValueString:v51];

        uint64_t v52 = [MEMORY[0x263F47528] sharedInstance];
        [v52 stopLiveListen];
      }
      else {
        v64 = {;
      }
        [v30 setAccessibilityValueString:v64];

        uint64_t v65 = [MEMORY[0x263F47528] sharedInstance];
        [v65 startLiveListen];

        [(HACCShortcutViewController *)self _logLiveListenAnalytics];
      }
      goto LABEL_56;
    case 30:
      char v31 = paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
      objc_super v32 = [v31 address];

      if ([v32 length])
      {
        uint64_t v33 = [MEMORY[0x263F5D458] sharedInstance];
        if ([v33 personalMediaEnabled])
        {
          char v34 = [MEMORY[0x263F5D458] sharedInstance];
          char v35 = [v34 personalMediaConfiguration];
          BOOL v36 = v35 != 0;
        }
        else
        {
          BOOL v36 = 0;
        }

        BOOL v66 = [MEMORY[0x263F5D458] sharedInstance];
        unsigned int v67 = [v66 transparencyCustomizedForAddress:v32];

        uint64_t v68 = [MEMORY[0x263F5D458] sharedInstance];
        uint64_t v98 = v32;
        int v69 = [v68 sslEnabledForAddress:v32];

        v70 = paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
        int v96 = [v70 listeningMode];

        PAInitializeLogging();
        uint64_t v97 = v69 ^ 1u;
        unsigned int v71 = [NSString stringWithFormat:@"SSL toggled-%i, headphoneAcc-%i, transparencySettings-%i", v97, v36, v67];
        v72 = [NSString stringWithFormat:@"%s:%d %@", "-[HACCShortcutViewController controlDidActivate:]", 1523, v71];
        v73 = (void *)*MEMORY[0x263F472C8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
        {
          id v74 = v72;
          v75 = v73;
          uint64_t v76 = [v74 UTF8String];
          *(_DWORD *)buf = 136446210;
          uint64_t v102 = v76;
          _os_log_impl(&dword_226B65000, v75, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
        objc_super v32 = v98;
        if ((v69 & 1) == 0)
        {
          uint64_t v99 = v98;
          char v77 = NSNumber;
          unsigned int v78 = paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
          int v79 = objc_msgSend(v77, "numberWithUnsignedInt:", objc_msgSend(v78, "listeningMode"));
          v100 = v79;
          char v80 = [NSDictionary dictionaryWithObjects:&v100 forKeys:&v99 count:1];
          [(HACCShortcutViewController *)self setPreviousListeningModeForAddress:v80];

          if (v96 != 3)
          {
            v81 = paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
            [v81 setListeningMode:3];

            PAInitializeLogging();
            v82 = [NSString stringWithFormat:@"SSL force turning on transparency mode"];
            v83 = [NSString stringWithFormat:@"%s:%d %@", "-[HACCShortcutViewController controlDidActivate:]", 1534, v82];
            v84 = (void *)*MEMORY[0x263F472C8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
            {
              id v85 = v83;
              char v86 = v84;
              uint64_t v87 = [v85 UTF8String];
              *(_DWORD *)buf = 136446210;
              uint64_t v102 = v87;
              _os_log_impl(&dword_226B65000, v86, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
            }
          }
        }
        v88 = [MEMORY[0x263F5D458] sharedInstance];
        [v88 setSslEnabled:v97 forAddress:v98];

        [v4 updateValue];
      }

      break;
    case 34:
      int v37 = paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
      id v30 = [v37 address];

      unsigned int v38 = [MEMORY[0x263F5D450] sharedInstance];
      int v39 = [v38 yodelEnabledForAddress:v30];

      if (v39)
      {
        id v40 = [MEMORY[0x263F5D450] sharedInstance];
        unsigned int v41 = [v40 beamformingForAddress:v30];

        PAInitializeLogging();
        uint64_t v42 = objc_msgSend(NSString, "stringWithFormat:", @"Yodel beamformer toggled %d", v41);
        char v43 = [NSString stringWithFormat:@"%s:%d %@", "-[HACCShortcutViewController controlDidActivate:]", 1553, v42];
        char v44 = (void *)*MEMORY[0x263F472C8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
        {
          id v45 = v43;
          long long v46 = v44;
          uint64_t v47 = [v45 UTF8String];
          *(_DWORD *)buf = 136446210;
          uint64_t v102 = v47;
          _os_log_impl(&dword_226B65000, v46, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
        int v48 = [MEMORY[0x263F5D450] sharedInstance];
        [v48 setBeamforming:v41 ^ 1 forAddress:v30];
      }
      else
      {
        uint64_t v53 = [MEMORY[0x263F5D458] sharedInstance];
        int v54 = [v53 transparencyCustomizedForAddress:v30];

        uint64_t v55 = [MEMORY[0x263F5D458] sharedInstance];
        BOOL v56 = v55;
        if (v54)
        {
          unsigned int v57 = [v55 transparencyBeamformingForAddress:v30];

          PAInitializeLogging();
          uint64_t v58 = objc_msgSend(NSString, "stringWithFormat:", @"Beamformer toggled %d", v57);
          BOOL v59 = [NSString stringWithFormat:@"%s:%d %@", "-[HACCShortcutViewController controlDidActivate:]", 1562, v58];
          v60 = (void *)*MEMORY[0x263F472C8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
          {
            id v61 = v59;
            BOOL v62 = v60;
            uint64_t v63 = [v61 UTF8String];
            *(_DWORD *)buf = 136446210;
            uint64_t v102 = v63;
            _os_log_impl(&dword_226B65000, v62, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
          }
          int v48 = [MEMORY[0x263F5D458] sharedInstance];
          [v48 setTransparencyBeamforming:v57 ^ 1 forAddress:v30];
        }
        else
        {
          unsigned int v89 = [v55 sslEnabledForAddress:v30];

          PAInitializeLogging();
          id v90 = objc_msgSend(NSString, "stringWithFormat:", @"SSL toggled %d", v89);
          char v91 = [NSString stringWithFormat:@"%s:%d %@", "-[HACCShortcutViewController controlDidActivate:]", 1570, v90];
          v92 = (void *)*MEMORY[0x263F472C8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
          {
            id v93 = v91;
            v94 = v92;
            uint64_t v95 = [v93 UTF8String];
            *(_DWORD *)buf = 136446210;
            uint64_t v102 = v95;
            _os_log_impl(&dword_226B65000, v94, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
          }
          int v48 = [MEMORY[0x263F5D458] sharedInstance];
          [v48 setSslEnabled:v89 ^ 1 forAddress:v30];
        }
      }

      [(HACCShortcutViewController *)self updateViewForModule:34];
LABEL_56:

      break;
    default:
      break;
  }
}

- (void)_logLiveListenAnalytics
{
  v15[2] = *MEMORY[0x263EF8340];
  id v3 = [(HACCShortcutViewController *)self currentOtherDeviceType];
  id v4 = v3;
  if (v3)
  {
    BOOL v5 = v3;
  }
  else
  {
    BOOL v5 = [(HACCShortcutViewController *)self currentOtherDeviceName];
  }
  uint64_t v6 = v5;

  v14[0] = @"enabled";
  v14[1] = @"headset_model";
  double v7 = @"Unknown";
  if (v6) {
    double v7 = v6;
  }
  v15[0] = MEMORY[0x263EFFA88];
  v15[1] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  char v9 = AXLogAggregate();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    objc_super v13 = v8;
    _os_log_impl(&dword_226B65000, v9, OS_LOG_TYPE_INFO, "Live listen enabled: %@", buf, 0xCu);
  }

  id v11 = v8;
  id v10 = v8;
  AnalyticsSendEventLazy();
}

id __53__HACCShortcutViewController__logLiveListenAnalytics__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (AXHAShortcutUpdateProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXHAShortcutUpdateProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setExpandedController:(id)a3
{
}

- (CCUIContentModuleContext)contentModuleContext
{
  return self->_contentModuleContext;
}

- (void)setContentModuleContext:(id)a3
{
}

- (NSArray)availableModules
{
  return self->_availableModules;
}

- (void)setAvailableModules:(id)a3
{
}

- (BOOL)prefersContentToAlwaysExpand
{
  return self->_prefersContentToAlwaysExpand;
}

- (void)setPrefersContentToAlwaysExpand:(BOOL)a3
{
  self->_prefersContentToAlwaysExpand = a3;
}

- (NSMutableDictionary)moduleToViewControllerMap
{
  return self->_moduleToViewControllerMap;
}

- (void)setModuleToViewControllerMap:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (NSIndexSet)mainStackIndexSet
{
  return self->_mainStackIndexSet;
}

- (void)setMainStackIndexSet:(id)a3
{
}

- (NSArray)mainStackOrderArray
{
  return self->_mainStackOrderArray;
}

- (void)setMainStackOrderArray:(id)a3
{
}

- (UIView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
}

- (CCUILabeledRoundButtonViewController)otherDevicesButtonViewController
{
  return self->_otherDevicesButtonViewController;
}

- (void)setOtherDevicesButtonViewController:(id)a3
{
}

- (AXRemoteHearingAidDevice)currentHearingDevice
{
  return self->_currentHearingDevice;
}

- (void)setCurrentHearingDevice:(id)a3
{
}

- (NSString)currentOtherDeviceName
{
  return self->_currentOtherDeviceName;
}

- (void)setCurrentOtherDeviceName:(id)a3
{
}

- (NSString)currentOtherDeviceType
{
  return self->_currentOtherDeviceType;
}

- (void)setCurrentOtherDeviceType:(id)a3
{
}

- (BOOL)bluetoothAvailable
{
  return self->_bluetoothAvailable;
}

- (void)setBluetoothAvailable:(BOOL)a3
{
  self->_BOOL bluetoothAvailable = a3;
}

- (BOOL)listeningForHearingAidUpdates
{
  return self->_listeningForHearingAidUpdates;
}

- (void)setListeningForHearingAidUpdates:(BOOL)a3
{
  self->_listeningForHearingAidUpdates = a3;
}

- (BOOL)listeningForHeadphoneUpdates
{
  return self->_listeningForHeadphoneUpdates;
}

- (void)setListeningForHeadphoneUpdates:(BOOL)a3
{
  self->_listeningForHeadphoneUpdates = a3;
}

- (BOOL)headphoneAudioAvailable
{
  return self->_headphoneAudioAvailable;
}

- (void)setHeadphoneAudioAvailable:(BOOL)a3
{
  self->_headphoneAudioAvailable = a3;
}

- (BOOL)shouldDisplayOtherDevice
{
  return self->_shouldDisplayOtherDevice;
}

- (void)setShouldDisplayOtherDevice:(BOOL)a3
{
  self->_shouldDisplayOtherDevice = a3;
}

- (NSDictionary)previousListeningModeForAddress
{
  return (NSDictionary *)objc_getProperty(self, a2, 1176, 1);
}

- (void)setPreviousListeningModeForAddress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousListeningModeForAddress, 0);
  objc_storeStrong((id *)&self->_currentOtherDeviceType, 0);
  objc_storeStrong((id *)&self->_currentOtherDeviceName, 0);
  objc_storeStrong((id *)&self->_currentHearingDevice, 0);
  objc_storeStrong((id *)&self->_otherDevicesButtonViewController, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_mainStackOrderArray, 0);
  objc_storeStrong((id *)&self->_mainStackIndexSet, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_moduleToViewControllerMap, 0);
  objc_storeStrong((id *)&self->_availableModules, 0);
  objc_storeStrong((id *)&self->_contentModuleContext, 0);
  objc_storeStrong((id *)&self->_expandedController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_listeningModeButton, 0);
  objc_storeStrong((id *)&self->_noiseControlUpdateTimer, 0);
  objc_storeStrong((id *)&self->_bluetoothAvailabilityTimer, 0);
  objc_storeStrong((id *)&self->_detailTransitioningDelegate, 0);
}

@end