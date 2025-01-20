@interface HUTimerTableViewController
- (COTimerManager)timerManager;
- (HUTimerTableViewController)initWithMediaProfileContainer:(id)a3;
- (NSTimer)animationTimer;
- (id)_baseMobileTimerObjectsFuture;
- (id)_canManagerControlAccessory;
- (id)_findTimerObjectForID:(id)a3;
- (id)_newCellForMTTimerObjectUUID:(id)a3;
- (id)addNotificationObserver;
- (id)canDispatchNotificationObserver;
- (id)firingNotificationObserver;
- (id)presentationDelegate;
- (id)removeNotificationObserver;
- (id)resetNotificationObserver;
- (id)updateNotificationObserver;
- (void)_extractUpdatedTimerObjectsFromNotification:(id)a3;
- (void)_removeTimerObjectAtIndexPath:(id)a3;
- (void)animationTimerTick:(id)a3;
- (void)dealloc;
- (void)presentAddMobileTimerObjectViewControllerOnMainThread;
- (void)setAddNotificationObserver:(id)a3;
- (void)setAnimationTimer:(id)a3;
- (void)setCanDispatchNotificationObserver:(id)a3;
- (void)setFiringNotificationObserver:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setRemoveNotificationObserver:(id)a3;
- (void)setResetNotificationObserver:(id)a3;
- (void)setTimerManager:(id)a3;
- (void)setUpdateNotificationObserver:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)timerCreationViewController:(id)a3 didCreateTimer:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HUTimerTableViewController

- (HUTimerTableViewController)initWithMediaProfileContainer:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HUTimerTableViewController;
  v5 = [(HUMobileTimerObjectTableViewController *)&v23 initWithMediaProfileContainer:v4];
  if (v5)
  {
    v6 = _HULocalizedStringWithDefaultValue(@"HUQuickControlTimersDetailsButtonTitle", @"HUQuickControlTimersDetailsButtonTitle", 1);
    [(HUTimerTableViewController *)v5 setTitle:v6];

    v7 = _HULocalizedStringWithDefaultValue(@"HULoadingTimers", @"HULoadingTimers", 1);
    [(HUMobileTimerObjectTableViewController *)v5 setLoadingItemsTitle:v7];

    v8 = _HULocalizedStringWithDefaultValue(@"HUHomePodTimersUnavailableTitle", @"HUHomePodTimersUnavailableTitle", 1);
    [(HUMobileTimerObjectTableViewController *)v5 setUnavailableTitle:v8];

    v9 = _HULocalizedStringWithDefaultValue(@"HUNewTimer", @"HUNewTimer", 1);
    [(HUMobileTimerObjectTableViewController *)v5 setHeaderCellTitle:v9];

    [(HUMobileTimerObjectTableViewController *)v5 setIdentifier:*MEMORY[0x1E4F685A8]];
    v10 = objc_msgSend(v4, "hf_categoryLowercaseLocalizedDescription");
    v17 = HULocalizedStringWithFormat(@"HUHomePodTimersUnavailableExplanation", @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v10);
    [(HUMobileTimerObjectTableViewController *)v5 setUnavailableText:v17];

    v18 = (void *)MEMORY[0x1E4F5AF08];
    v19 = [(HUMobileTimerObjectTableViewController *)v5 accessory];
    uint64_t v20 = objc_msgSend(v18, "hf_TimerManagerForAccessory:", v19);
    timerManager = v5->_timerManager;
    v5->_timerManager = (COTimerManager *)v20;

    if (!v5->_timerManager) {
      NSLog(&cfstr_TimermanagerIs.isa);
    }
  }

  return v5;
}

- (void)viewDidLoad
{
  v28.receiver = self;
  v28.super_class = (Class)HUTimerTableViewController;
  [(HUMobileTimerObjectTableViewController *)&v28 viewDidLoad];
  objc_initWeak(&location, self);
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __41__HUTimerTableViewController_viewDidLoad__block_invoke;
  v25 = &unk_1E6388030;
  objc_copyWeak(&v26, &location);
  v3 = _Block_copy(&v22);
  id v4 = [(HUTimerTableViewController *)self timerManager];
  v5 = [MEMORY[0x1E4F28F08] mainQueue];
  v6 = [v4 addObserverForName:*MEMORY[0x1E4F5AEE0] queue:v5 usingBlock:v3];
  [(HUTimerTableViewController *)self setAddNotificationObserver:v6];

  v7 = [(HUTimerTableViewController *)self timerManager];
  v8 = [MEMORY[0x1E4F28F08] mainQueue];
  v9 = [v7 addObserverForName:*MEMORY[0x1E4F5AEF0] queue:v8 usingBlock:v3];
  [(HUTimerTableViewController *)self setUpdateNotificationObserver:v9];

  v10 = [(HUTimerTableViewController *)self timerManager];
  uint64_t v11 = [MEMORY[0x1E4F28F08] mainQueue];
  uint64_t v12 = [v10 addObserverForName:*MEMORY[0x1E4F5AEE8] queue:v11 usingBlock:v3];
  [(HUTimerTableViewController *)self setRemoveNotificationObserver:v12];

  uint64_t v13 = [(HUTimerTableViewController *)self timerManager];
  uint64_t v14 = [MEMORY[0x1E4F28F08] mainQueue];
  uint64_t v15 = [v13 addObserverForName:*MEMORY[0x1E4F5AEC8] queue:v14 usingBlock:v3];
  [(HUTimerTableViewController *)self setCanDispatchNotificationObserver:v15];

  uint64_t v16 = [(HUTimerTableViewController *)self timerManager];
  v17 = [MEMORY[0x1E4F28F08] mainQueue];
  v18 = [v16 addObserverForName:*MEMORY[0x1E4F5AED8] queue:v17 usingBlock:v3];
  [(HUTimerTableViewController *)self setResetNotificationObserver:v18];

  v19 = [(HUTimerTableViewController *)self timerManager];
  uint64_t v20 = [MEMORY[0x1E4F28F08] mainQueue];
  v21 = [v19 addObserverForName:*MEMORY[0x1E4F5AED0] queue:v20 usingBlock:v3];
  [(HUTimerTableViewController *)self setFiringNotificationObserver:v21];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __41__HUTimerTableViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v9 = WeakRetained;
    __int16 v10 = 2080;
    uint64_t v11 = "-[HUTimerTableViewController viewDidLoad]_block_invoke";
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "(%@)%s: received NSNotification = %@", buf, 0x20u);
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    NSLog(&cfstr_SShouldOnlyBeC.isa, WeakRetained, "-[HUTimerTableViewController viewDidLoad]_block_invoke");
  }
  v6 = [v3 name];
  int v7 = [v6 isEqualToString:*MEMORY[0x1E4F5AEF0]];

  if (v7) {
    [WeakRetained _extractUpdatedTimerObjectsFromNotification:v3];
  }
  [WeakRetained _checkAccessFetchDataAndReloadTable];
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HUTimerTableViewController;
  [(HUMobileTimerObjectTableViewController *)&v10 viewWillAppear:a3];
  id v4 = [(HUTimerTableViewController *)self animationTimer];

  if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1CB00]);
    v6 = [MEMORY[0x1E4F1C9C8] date];
    int v7 = (void *)[v5 initWithFireDate:v6 interval:self target:sel_animationTimerTick_ selector:0 userInfo:1 repeats:0.25];
    [(HUTimerTableViewController *)self setAnimationTimer:v7];

    v8 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    id v9 = [(HUTimerTableViewController *)self animationTimer];
    [v8 addTimer:v9 forMode:*MEMORY[0x1E4F1C3A0]];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HUTimerTableViewController;
  [(HUTimerTableViewController *)&v5 viewWillDisappear:a3];
  id v4 = [(HUTimerTableViewController *)self animationTimer];
  [v4 invalidate];

  [(HUTimerTableViewController *)self setAnimationTimer:0];
}

- (void)animationTimerTick:(id)a3
{
  id v4 = [(HUTimerTableViewController *)self tableView];
  uint64_t v5 = [v4 numberOfSections];

  if (v5 >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      objc_opt_class();
      int v7 = [(HUTimerTableViewController *)self tableView];
      v8 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:v6];
      id v9 = [v7 cellForRowAtIndexPath:v8];
      if (objc_opt_isKindOfClass()) {
        objc_super v10 = v9;
      }
      else {
        objc_super v10 = 0;
      }
      id v11 = v10;

      [v11 updateTimerInfo];
      ++v6;
      __int16 v12 = [(HUTimerTableViewController *)self tableView];
      uint64_t v13 = [v12 numberOfSections];
    }
    while (v6 < v13);
  }
}

- (void)presentAddMobileTimerObjectViewControllerOnMainThread
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "-[HUTimerTableViewController presentAddMobileTimerObjectViewControllerOnMainThread]";
    __int16 v17 = 2112;
    v18 = self;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "%s(%@) adding new timer", buf, 0x16u);
  }

  id v4 = [(HUTimerTableViewController *)self parentViewController];
  if (!v4) {
    goto LABEL_6;
  }
  uint64_t v5 = [(HUTimerTableViewController *)self view];
  uint64_t v6 = [v5 window];
  BOOL v7 = v6 == 0;

  if (v7)
  {
LABEL_6:
    id v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_super v10 = [(HUTimerTableViewController *)self parentViewController];
      id v11 = [(HUTimerTableViewController *)self view];
      __int16 v12 = [v11 window];
      *(_DWORD *)buf = 136315906;
      uint64_t v16 = "-[HUTimerTableViewController presentAddMobileTimerObjectViewControllerOnMainThread]";
      __int16 v17 = 2112;
      v18 = self;
      __int16 v19 = 2112;
      uint64_t v20 = v10;
      __int16 v21 = 2112;
      uint64_t v22 = v12;
      _os_log_error_impl(&dword_1BE345000, v9, OS_LOG_TYPE_ERROR, "%s(%@) view hierarchy problem: parentViewController %@ / window %@", buf, 0x2Au);
    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v8 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __83__HUTimerTableViewController_presentAddMobileTimerObjectViewControllerOnMainThread__block_invoke;
    v13[3] = &unk_1E63862A0;
    objc_copyWeak(&v14, (id *)buf);
    [v8 performBlock:v13];

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
}

void __83__HUTimerTableViewController_presentAddMobileTimerObjectViewControllerOnMainThread__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [HUTimerCreationViewController alloc];
  id v3 = [WeakRetained mediaProfileContainer];
  id v4 = [(HUTimerCreationViewController *)v2 initWithMediaProfileContainer:v3];

  [(HUTimerCreationViewController *)v4 setDelegate:WeakRetained];
  if (!v4)
  {
    uint64_t v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      id v11 = "-[HUTimerTableViewController presentAddMobileTimerObjectViewControllerOnMainThread]_block_invoke";
      __int16 v12 = 2112;
      id v13 = WeakRetained;
      _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "%s(%@) No tableviewController!", (uint8_t *)&v10, 0x16u);
    }
  }
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v4];
  [v6 setModalPresentationStyle:2];
  if (!v6)
  {
    BOOL v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      id v11 = "-[HUTimerTableViewController presentAddMobileTimerObjectViewControllerOnMainThread]_block_invoke";
      __int16 v12 = 2112;
      id v13 = WeakRetained;
      _os_log_error_impl(&dword_1BE345000, v7, OS_LOG_TYPE_ERROR, "%s(%@) No navController!", (uint8_t *)&v10, 0x16u);
    }
  }
  [WeakRetained presentViewController:v6 animated:1 completion:0];
  if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials]) {
    [v6 setOverrideUserInterfaceStyle:2];
  }
  v8 = objc_msgSend(MEMORY[0x1E4F428B8], "hu_alarmsBackgroundColor");
  id v9 = [v6 view];
  [v9 setBackgroundColor:v8];
}

- (void)timerCreationViewController:(id)a3 didCreateTimer:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v10 = v5;
    if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
      NSLog(&cfstr_SShouldOnlyBeC.isa, self, "-[HUTimerTableViewController timerCreationViewController:didCreateTimer:]");
    }
    uint64_t v6 = [(HUMobileTimerObjectTableViewController *)self mobileTimerObjects];
    BOOL v7 = [[HUMobileTimerObject alloc] initWithTimer:v10];
    [v6 addObject:v7];

    v8 = [(HUTimerTableViewController *)self timerManager];
    id v9 = (id)[v8 addTimer:v10];

    [(HUMobileTimerObjectTableViewController *)self _checkAccessFetchDataAndReloadTable];
    id v5 = v10;
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HUMobileTimerObjectTableViewController *)self tableViewDataSource];
  id v9 = [v8 itemIdentifierForIndexPath:v7];

  id v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(HUMobileTimerObjectTableViewController *)self headerUUID];
    int v14 = 136316162;
    uint64_t v15 = "-[HUTimerTableViewController tableView:didSelectRowAtIndexPath:]";
    __int16 v16 = 2112;
    __int16 v17 = self;
    __int16 v18 = 2112;
    id v19 = v7;
    __int16 v20 = 2112;
    __int16 v21 = v9;
    __int16 v22 = 2112;
    uint64_t v23 = v11;
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%s(%@) tapping indexPath = %@/objectID = %@ (FYI header ID: %@)", (uint8_t *)&v14, 0x34u);
  }
  __int16 v12 = [(HUMobileTimerObjectTableViewController *)self headerUUID];
  int v13 = objc_msgSend(v9, "hmf_isEqualToUUID:", v12);

  if (v13) {
    [(HUMobileTimerObjectTableViewController *)self _checkAndAddTimerObject];
  }
  [v6 deselectRowAtIndexPath:v7 animated:1];
}

- (void)_extractUpdatedTimerObjectsFromNotification:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"HUTimerTableViewController.m" lineNumber:199 description:@"This shouldn't happen"];
  }
  id v6 = [v5 userInfo];
  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F78B30]];

  v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v25 = self;
    __int16 v26 = 2080;
    v27 = "-[HUTimerTableViewController _extractUpdatedTimerObjectsFromNotification:]";
    __int16 v28 = 2112;
    id v29 = v5;
    __int16 v30 = 2112;
    v31 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "(%@)%s: NSNotification %@ contained updated timers: %@", buf, 0x2Au);
  }

  id v9 = [v5 name];
  int v10 = [v9 isEqualToString:*MEMORY[0x1E4F5AEF0]];

  if (v10)
  {
    id v11 = objc_msgSend(v7, "na_map:", &__block_literal_global_56);
    [(HUMobileTimerObjectTableViewController *)self setUpdatedMobileTimerObjects:v11];

    if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
      NSLog(&cfstr_SShouldOnlyBeC.isa, self, "-[HUTimerTableViewController _extractUpdatedTimerObjectsFromNotification:]");
    }
    __int16 v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      __int16 v21 = [(HUMobileTimerObjectTableViewController *)self mobileTimerObjects];
      *(_DWORD *)buf = 138412802;
      v25 = self;
      __int16 v26 = 2080;
      v27 = "-[HUTimerTableViewController _extractUpdatedTimerObjectsFromNotification:]";
      __int16 v28 = 2112;
      id v29 = v21;
      _os_log_debug_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEBUG, "(%@)%s:BEFORE replace %@", buf, 0x20u);
    }
    int v13 = [(HUMobileTimerObjectTableViewController *)self mobileTimerObjects];
    int v14 = [(HUMobileTimerObjectTableViewController *)self updatedMobileTimerObjects];
    [v13 removeObjectsInArray:v14];

    uint64_t v15 = [(HUMobileTimerObjectTableViewController *)self mobileTimerObjects];
    __int16 v16 = [(HUMobileTimerObjectTableViewController *)self updatedMobileTimerObjects];
    [v15 addObjectsFromArray:v16];

    __int16 v17 = HFLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      __int16 v22 = [(HUMobileTimerObjectTableViewController *)self mobileTimerObjects];
      *(_DWORD *)buf = 138412802;
      v25 = self;
      __int16 v26 = 2080;
      v27 = "-[HUTimerTableViewController _extractUpdatedTimerObjectsFromNotification:]";
      __int16 v28 = 2112;
      id v29 = v22;
      _os_log_debug_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEBUG, "(%@)%s:AFTER replace %@", buf, 0x20u);
    }
  }
  __int16 v18 = [v5 name];
  int v19 = [v18 isEqualToString:*MEMORY[0x1E4F5AED8]];

  if (v19)
  {
    __int16 v20 = [(HUMobileTimerObjectTableViewController *)self mobileTimerObjects];
    [(HUMobileTimerObjectTableViewController *)self setUpdatedMobileTimerObjects:v20];
  }
}

HUMobileTimerObject *__74__HUTimerTableViewController__extractUpdatedTimerObjectsFromNotification___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5) {
    id v6 = [[HUMobileTimerObject alloc] initWithTimer:v5];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  id v3 = [(HUTimerTableViewController *)self timerManager];
  id v4 = [(HUTimerTableViewController *)self addNotificationObserver];
  [v3 removeObserver:v4];

  [(HUTimerTableViewController *)self setAddNotificationObserver:0];
  id v5 = [(HUTimerTableViewController *)self timerManager];
  id v6 = [(HUTimerTableViewController *)self updateNotificationObserver];
  [v5 removeObserver:v6];

  [(HUTimerTableViewController *)self setUpdateNotificationObserver:0];
  id v7 = [(HUTimerTableViewController *)self timerManager];
  v8 = [(HUTimerTableViewController *)self removeNotificationObserver];
  [v7 removeObserver:v8];

  [(HUTimerTableViewController *)self setRemoveNotificationObserver:0];
  id v9 = [(HUTimerTableViewController *)self timerManager];
  int v10 = [(HUTimerTableViewController *)self canDispatchNotificationObserver];
  [v9 removeObserver:v10];

  [(HUTimerTableViewController *)self setCanDispatchNotificationObserver:0];
  id v11 = [(HUTimerTableViewController *)self timerManager];
  __int16 v12 = [(HUTimerTableViewController *)self resetNotificationObserver];
  [v11 removeObserver:v12];

  [(HUTimerTableViewController *)self setResetNotificationObserver:0];
  int v13 = [(HUTimerTableViewController *)self timerManager];
  int v14 = [(HUTimerTableViewController *)self firingNotificationObserver];
  [v13 removeObserver:v14];

  [(HUTimerTableViewController *)self setFiringNotificationObserver:0];
  v15.receiver = self;
  v15.super_class = (Class)HUTimerTableViewController;
  [(HUMobileTimerObjectTableViewController *)&v15 dealloc];
}

- (id)_baseMobileTimerObjectsFuture
{
  id v3 = [(HUMobileTimerObjectTableViewController *)self mediaProfileContainer];
  id v4 = [v3 accessories];
  id v5 = [v4 allObjects];

  if (![v5 count])
  {
    id v6 = (void *)MEMORY[0x1E4F1C978];
    id v7 = [(HUMobileTimerObjectTableViewController *)self accessory];
    uint64_t v8 = [v6 arrayWithObject:v7];

    id v5 = (void *)v8;
  }
  id v9 = [(HUTimerTableViewController *)self timerManager];
  int v10 = [v9 timersForAccessories:v5];
  id v11 = [v10 flatMap:&__block_literal_global_59_0];

  return v11;
}

id __59__HUTimerTableViewController__baseMobileTimerObjectsFuture__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_opt_new();
  id v4 = [v2 objectEnumerator];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__HUTimerTableViewController__baseMobileTimerObjectsFuture__block_invoke_2;
  v10[3] = &unk_1E6388098;
  id v11 = v3;
  id v5 = v3;
  objc_msgSend(v4, "na_each:", v10);

  id v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_64_0);
  id v7 = [v6 allObjects];

  uint64_t v8 = [MEMORY[0x1E4F7A0D8] futureWithResult:v7];

  return v8;
}

uint64_t __59__HUTimerTableViewController__baseMobileTimerObjectsFuture__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObjectsFromArray:a2];
}

HUMobileTimerObject *__59__HUTimerTableViewController__baseMobileTimerObjectsFuture__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[HUMobileTimerObject alloc] initWithTimer:v2];

  return v3;
}

- (id)_newCellForMTTimerObjectUUID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HUTimerTableViewController *)self _findTimerObjectForID:v4];
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315650;
    __int16 v12 = (HUTimerTableViewController *)"-[HUTimerTableViewController _newCellForMTTimerObjectUUID:]";
    __int16 v13 = 2112;
    int v14 = self;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_debug_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEBUG, "%s(%@) new MT Cell for %@", (uint8_t *)&v11, 0x20u);
  }

  if (v5)
  {
    id v7 = [HUTimerTableViewCell alloc];
    uint64_t v8 = [(HUTimerTableViewController *)self timerManager];
    id v9 = [(HUTimerTableViewCell *)v7 initWithMobileTimerObject:v5 manager:v8 roomName:0];
  }
  else
  {
    uint64_t v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412802;
      __int16 v12 = self;
      __int16 v13 = 2080;
      int v14 = (HUTimerTableViewController *)"-[HUTimerTableViewController _newCellForMTTimerObjectUUID:]";
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_error_impl(&dword_1BE345000, v8, OS_LOG_TYPE_ERROR, "(%@)%s: could not find mobileTimerObject for ID: %@", (uint8_t *)&v11, 0x20u);
    }
    id v9 = 0;
  }

  return v9;
}

- (id)_canManagerControlAccessory
{
  id v3 = [(HUMobileTimerObjectTableViewController *)self accessory];
  id v4 = [(HUTimerTableViewController *)self timerManager];
  id v5 = +[HUAlarmsAndTimersAccessUtility canAccess:v3 for:1 withManager:v4];
  id v6 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
  id v7 = [v5 reschedule:v6];

  return v7;
}

- (id)_findTimerObjectForID:(id)a3
{
  id v4 = a3;
  id v5 = [(HUMobileTimerObjectTableViewController *)self mobileTimerObjects];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__HUTimerTableViewController__findTimerObjectForID___block_invoke;
  v9[3] = &unk_1E63880E0;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __52__HUTimerTableViewController__findTimerObjectForID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 timer];
  id v4 = [v3 timerID];
  uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];

  return v5;
}

- (void)_removeTimerObjectAtIndexPath:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HUTimerTableViewController *)self tableView];
  id v6 = [v5 cellForRowAtIndexPath:v4];

  objc_opt_class();
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    id v10 = [v9 timer];
    int v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138413058;
      id v16 = self;
      __int16 v17 = 2080;
      __int16 v18 = "-[HUTimerTableViewController _removeTimerObjectAtIndexPath:]";
      __int16 v19 = 2112;
      __int16 v20 = v10;
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "(%@)%s: Removing timer %@ at %@", (uint8_t *)&v15, 0x2Au);
    }

    if (v10)
    {
      __int16 v12 = [(HUTimerTableViewController *)self timerManager];
      id v13 = (id)[v12 removeTimer:v10];

      int v14 = [v10 timerID];
      [(HUMobileTimerObjectTableViewController *)self _quickDeleteMobileTimerObjectFromTable:v14];
    }
  }
}

- (id)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->presentationDelegate);

  return WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (COTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
}

- (NSTimer)animationTimer
{
  return self->_animationTimer;
}

- (void)setAnimationTimer:(id)a3
{
}

- (id)addNotificationObserver
{
  return self->_addNotificationObserver;
}

- (void)setAddNotificationObserver:(id)a3
{
}

- (id)removeNotificationObserver
{
  return self->_removeNotificationObserver;
}

- (void)setRemoveNotificationObserver:(id)a3
{
}

- (id)updateNotificationObserver
{
  return self->_updateNotificationObserver;
}

- (void)setUpdateNotificationObserver:(id)a3
{
}

- (id)canDispatchNotificationObserver
{
  return self->_canDispatchNotificationObserver;
}

- (void)setCanDispatchNotificationObserver:(id)a3
{
}

- (id)resetNotificationObserver
{
  return self->_resetNotificationObserver;
}

- (void)setResetNotificationObserver:(id)a3
{
}

- (id)firingNotificationObserver
{
  return self->_firingNotificationObserver;
}

- (void)setFiringNotificationObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_firingNotificationObserver, 0);
  objc_storeStrong(&self->_resetNotificationObserver, 0);
  objc_storeStrong(&self->_canDispatchNotificationObserver, 0);
  objc_storeStrong(&self->_updateNotificationObserver, 0);
  objc_storeStrong(&self->_removeNotificationObserver, 0);
  objc_storeStrong(&self->_addNotificationObserver, 0);
  objc_storeStrong((id *)&self->_animationTimer, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);

  objc_destroyWeak((id *)&self->presentationDelegate);
}

@end