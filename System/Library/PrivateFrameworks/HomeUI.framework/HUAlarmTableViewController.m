@interface HUAlarmTableViewController
- (COAlarmManager)alarmManager;
- (HUAlarmTableViewController)initWithMediaProfileContainer:(id)a3;
- (id)_baseMobileTimerObjectsFuture;
- (id)_canManagerControlAccessory;
- (id)_fakeMobileAlarmObjectsFuture;
- (id)_findTimerObjectForID:(id)a3;
- (id)_newCellForMTTimerObjectUUID:(id)a3;
- (id)addNotificationObserver;
- (id)canDispatchNotificationObserver;
- (id)editViewControllerForAlarm:(id)a3;
- (id)presentationDelegate;
- (id)removeNotificationObserver;
- (id)resetNotificationObserver;
- (id)updateNotificationObserver;
- (void)_extractUpdatedTimerObjectsFromNotification:(id)a3;
- (void)_removeTimerObjectAtIndexPath:(id)a3;
- (void)alarmEditController:(id)a3 didAddAlarm:(id)a4;
- (void)alarmEditController:(id)a3 didDeleteAlarm:(id)a4;
- (void)alarmEditController:(id)a3 didEditAlarm:(id)a4;
- (void)alarmEditControllerDidCancel:(id)a3;
- (void)alarmEditControllerGettingDismissed:(id)a3;
- (void)dealloc;
- (void)presentAddMobileTimerObjectViewControllerOnMainThread;
- (void)setAddNotificationObserver:(id)a3;
- (void)setAlarmEnabled:(BOOL)a3 forCell:(id)a4;
- (void)setAlarmManager:(id)a3;
- (void)setCanDispatchNotificationObserver:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setRemoveNotificationObserver:(id)a3;
- (void)setResetNotificationObserver:(id)a3;
- (void)setUpdateNotificationObserver:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation HUAlarmTableViewController

- (HUAlarmTableViewController)initWithMediaProfileContainer:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HUAlarmTableViewController;
  v5 = [(HUMobileTimerObjectTableViewController *)&v23 initWithMediaProfileContainer:v4];
  if (v5)
  {
    v6 = _HULocalizedStringWithDefaultValue(@"HUQuickControlAlarmsDetailsButtonTitle", @"HUQuickControlAlarmsDetailsButtonTitle", 1);
    [(HUAlarmTableViewController *)v5 setTitle:v6];

    v7 = _HULocalizedStringWithDefaultValue(@"HULoadingAlarms", @"HULoadingAlarms", 1);
    [(HUMobileTimerObjectTableViewController *)v5 setLoadingItemsTitle:v7];

    v8 = _HULocalizedStringWithDefaultValue(@"HUHomePodAlarmsUnavailableTitle", @"HUHomePodAlarmsUnavailableTitle", 1);
    [(HUMobileTimerObjectTableViewController *)v5 setUnavailableTitle:v8];

    v9 = _HULocalizedStringWithDefaultValue(@"HUHomePodAlarmsNewAlarm", @"HUHomePodAlarmsNewAlarm", 1);
    [(HUMobileTimerObjectTableViewController *)v5 setHeaderCellTitle:v9];

    [(HUMobileTimerObjectTableViewController *)v5 setIdentifier:*MEMORY[0x1E4F68510]];
    v10 = objc_msgSend(v4, "hf_categoryLowercaseLocalizedDescription");
    v17 = HULocalizedStringWithFormat(@"HUHomePodAlarmsUnavailableExplanation", @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v10);
    [(HUMobileTimerObjectTableViewController *)v5 setUnavailableText:v17];

    v18 = (void *)MEMORY[0x1E4F5AEF8];
    v19 = [(HUMobileTimerObjectTableViewController *)v5 accessory];
    uint64_t v20 = objc_msgSend(v18, "hf_AlarmManagerForAccessory:", v19);
    alarmManager = v5->_alarmManager;
    v5->_alarmManager = (COAlarmManager *)v20;

    if (!v5->_alarmManager) {
      NSLog(&cfstr_AlarmmanagerIs.isa);
    }
  }

  return v5;
}

- (void)viewDidLoad
{
  v25.receiver = self;
  v25.super_class = (Class)HUAlarmTableViewController;
  [(HUMobileTimerObjectTableViewController *)&v25 viewDidLoad];
  objc_initWeak(&location, self);
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __41__HUAlarmTableViewController_viewDidLoad__block_invoke;
  v22 = &unk_1E6388030;
  objc_copyWeak(&v23, &location);
  v3 = _Block_copy(&v19);
  id v4 = [(HUAlarmTableViewController *)self alarmManager];
  v5 = [MEMORY[0x1E4F28F08] mainQueue];
  v6 = [v4 addObserverForName:*MEMORY[0x1E4F5AE98] queue:v5 usingBlock:v3];
  [(HUAlarmTableViewController *)self setAddNotificationObserver:v6];

  v7 = [(HUAlarmTableViewController *)self alarmManager];
  v8 = [MEMORY[0x1E4F28F08] mainQueue];
  v9 = [v7 addObserverForName:*MEMORY[0x1E4F5AEA8] queue:v8 usingBlock:v3];
  [(HUAlarmTableViewController *)self setUpdateNotificationObserver:v9];

  v10 = [(HUAlarmTableViewController *)self alarmManager];
  uint64_t v11 = [MEMORY[0x1E4F28F08] mainQueue];
  uint64_t v12 = [v10 addObserverForName:*MEMORY[0x1E4F5AEA0] queue:v11 usingBlock:v3];
  [(HUAlarmTableViewController *)self setRemoveNotificationObserver:v12];

  uint64_t v13 = [(HUAlarmTableViewController *)self alarmManager];
  uint64_t v14 = [MEMORY[0x1E4F28F08] mainQueue];
  uint64_t v15 = [v13 addObserverForName:*MEMORY[0x1E4F5AEB0] queue:v14 usingBlock:v3];
  [(HUAlarmTableViewController *)self setCanDispatchNotificationObserver:v15];

  uint64_t v16 = [(HUAlarmTableViewController *)self alarmManager];
  v17 = [MEMORY[0x1E4F28F08] mainQueue];
  v18 = [v16 addObserverForName:*MEMORY[0x1E4F5AEB8] queue:v17 usingBlock:v3];
  [(HUAlarmTableViewController *)self setResetNotificationObserver:v18];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __41__HUAlarmTableViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v7 = WeakRetained;
    __int16 v8 = 2080;
    v9 = "-[HUAlarmTableViewController viewDidLoad]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "(%@)%s: received NSNotification = %@", buf, 0x20u);
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    NSLog(&cfstr_SShouldOnlyBeC.isa, WeakRetained, "-[HUAlarmTableViewController viewDidLoad]_block_invoke");
  }
  [WeakRetained _extractUpdatedTimerObjectsFromNotification:v3];
  [WeakRetained _checkAccessFetchDataAndReloadTable];
}

- (void)presentAddMobileTimerObjectViewControllerOnMainThread
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "-[HUAlarmTableViewController presentAddMobileTimerObjectViewControllerOnMainThread]";
    __int16 v17 = 2112;
    v18 = self;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "%s(%@) adding new alarm", buf, 0x16u);
  }

  id v4 = [(HUAlarmTableViewController *)self parentViewController];
  if (!v4) {
    goto LABEL_6;
  }
  v5 = [(HUAlarmTableViewController *)self view];
  v6 = [v5 window];
  BOOL v7 = v6 == 0;

  if (v7)
  {
LABEL_6:
    v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __int16 v10 = [(HUAlarmTableViewController *)self parentViewController];
      id v11 = [(HUAlarmTableViewController *)self view];
      uint64_t v12 = [v11 window];
      *(_DWORD *)buf = 136315906;
      uint64_t v16 = "-[HUAlarmTableViewController presentAddMobileTimerObjectViewControllerOnMainThread]";
      __int16 v17 = 2112;
      v18 = self;
      __int16 v19 = 2112;
      uint64_t v20 = v10;
      __int16 v21 = 2112;
      v22 = v12;
      _os_log_error_impl(&dword_1BE345000, v9, OS_LOG_TYPE_ERROR, "%s(%@) view hierarchy problem: parentViewController %@ / window %@", buf, 0x2Au);
    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    __int16 v8 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __83__HUAlarmTableViewController_presentAddMobileTimerObjectViewControllerOnMainThread__block_invoke;
    v13[3] = &unk_1E63862A0;
    objc_copyWeak(&v14, (id *)buf);
    [v8 performBlock:v13];

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
}

void __83__HUAlarmTableViewController_presentAddMobileTimerObjectViewControllerOnMainThread__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained editViewControllerForAlarm:0];
  [WeakRetained presentViewController:v1 animated:1 completion:0];
}

- (id)editViewControllerForAlarm:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [HUAlarmEditViewController alloc];
  v6 = [(HUMobileTimerObjectTableViewController *)self mediaProfileContainer];
  BOOL v7 = [(HUAlarmEditViewController *)v5 initWithMediaProfileContainer:v6 alarm:v4];

  __int16 v8 = [(HUMobileTimerObjectTableViewController *)self mediaProfileContainer];
  v9 = objc_msgSend(v8, "hf_appleMusicCurrentLoggedInAccountDSID");
  [(HUAlarmEditViewController *)v7 setLoggedInAppleMusicAccountDSID:v9];

  [(HUAlarmEditViewController *)v7 setDelegate:self];
  if (!v7)
  {
    __int16 v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315394;
      __int16 v17 = "-[HUAlarmTableViewController editViewControllerForAlarm:]";
      __int16 v18 = 2112;
      __int16 v19 = self;
      _os_log_error_impl(&dword_1BE345000, v10, OS_LOG_TYPE_ERROR, "%s(%@) No editAlarmViewController!", (uint8_t *)&v16, 0x16u);
    }
  }
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v7];
  if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials]) {
    [v11 setOverrideUserInterfaceStyle:2];
  }
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F428B8], "hu_alarmsBackgroundColor");
  uint64_t v13 = [v11 view];
  [v13 setBackgroundColor:v12];

  if (!v11)
  {
    id v14 = HFLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315394;
      __int16 v17 = "-[HUAlarmTableViewController editViewControllerForAlarm:]";
      __int16 v18 = 2112;
      __int16 v19 = self;
      _os_log_error_impl(&dword_1BE345000, v14, OS_LOG_TYPE_ERROR, "%s(%@) No navigationController!", (uint8_t *)&v16, 0x16u);
    }
  }

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  v9 = [(HUMobileTimerObjectTableViewController *)self tableViewDataSource];
  __int16 v10 = [v9 itemIdentifierForIndexPath:v7];

  id v11 = [(HUMobileTimerObjectTableViewController *)self headerUUID];
  int v12 = objc_msgSend(v10, "hmf_isEqualToUUID:", v11);

  if (v12)
  {
    [(HUMobileTimerObjectTableViewController *)self _checkAndAddTimerObject];
  }
  else
  {
    uint64_t v13 = [(HUAlarmTableViewController *)self _findTimerObjectForID:v10];
    id v14 = v13;
    if (v13)
    {
      uint64_t v15 = [v13 alarm];
      if (!v15)
      {
        __int16 v18 = [MEMORY[0x1E4F28B00] currentHandler];
        [v18 handleFailureInMethod:a2 object:self file:@"HUAlarmTableViewController.m" lineNumber:152 description:@"HUMobileTimerObject must wrap an alarm"];
      }
      int v16 = HFLogForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412290;
        uint64_t v20 = v15;
        _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "Editing alarm: %@", (uint8_t *)&v19, 0xCu);
      }

      __int16 v17 = [(HUAlarmTableViewController *)self editViewControllerForAlarm:v15];
      [(HUAlarmTableViewController *)self presentViewController:v17 animated:1 completion:0];
    }
  }
  [v8 deselectRowAtIndexPath:v7 animated:1];
}

- (void)setAlarmEnabled:(BOOL)a3 forCell:(id)a4
{
  BOOL v4 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  objc_opt_class();
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    __int16 v10 = [v9 alarm];
    id v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138413058;
      int v16 = self;
      __int16 v17 = 2080;
      __int16 v18 = "-[HUAlarmTableViewController setAlarmEnabled:forCell:]";
      __int16 v19 = 2112;
      uint64_t v20 = v10;
      __int16 v21 = 1024;
      BOOL v22 = v4;
      _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "(%@)%s: setting alarm %@ enabled to %{BOOL}d", (uint8_t *)&v15, 0x26u);
    }

    int v12 = (void *)[v10 mutableCopy];
    [v12 setEnabled:v4];
    uint64_t v13 = [(HUAlarmTableViewController *)self alarmManager];
    id v14 = (id)[v13 updateAlarm:v12];
  }
}

- (void)alarmEditControllerGettingDismissed:(id)a3
{
  id v3 = [(HUAlarmTableViewController *)self tableView];
  [v3 setUserInteractionEnabled:1];
}

- (void)alarmEditControllerDidCancel:(id)a3
{
}

- (void)alarmEditController:(id)a3 didAddAlarm:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    int v12 = self;
    __int16 v13 = 2080;
    id v14 = "-[HUAlarmTableViewController alarmEditController:didAddAlarm:]";
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "(%@)%s: Adding alarm %@", buf, 0x20u);
  }

  if (v5)
  {
    if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
      NSLog(&cfstr_SShouldOnlyBeC.isa, self, "-[HUAlarmTableViewController alarmEditController:didAddAlarm:]");
    }
    id v7 = [(HUMobileTimerObjectTableViewController *)self mobileTimerObjects];
    id v8 = [[HUMobileTimerObject alloc] initWithAlarm:v5];
    [v7 addObject:v8];

    id v9 = [(HUAlarmTableViewController *)self alarmManager];
    id v10 = (id)[v9 addAlarm:v5];

    [(HUMobileTimerObjectTableViewController *)self _checkAccessFetchDataAndReloadTable];
  }
  [(HUAlarmTableViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)alarmEditController:(id)a3 didEditAlarm:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412802;
    uint64_t v20 = self;
    __int16 v21 = 2080;
    BOOL v22 = "-[HUAlarmTableViewController alarmEditController:didEditAlarm:]";
    __int16 v23 = 2112;
    id v24 = v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "(%@)%s: Editing alarm %@", (uint8_t *)&v19, 0x20u);
  }

  id v7 = [(HUAlarmTableViewController *)self alarmManager];
  id v8 = (id)[v7 updateAlarm:v5];

  id v9 = [[HUMobileTimerObject alloc] initWithAlarm:v5];
  id v10 = [(HUMobileTimerObjectTableViewController *)self tableViewDataSource];
  id v11 = [(HUMobileTimerObject *)v9 uniqueIdentifier];
  int v12 = [v10 indexPathForItemIdentifier:v11];

  __int16 v13 = [(HUAlarmTableViewController *)self tableView];
  id v14 = [v13 cellForRowAtIndexPath:v12];

  __int16 v15 = [v14 alarm];
  id v16 = [v15 alarmID];
  uint64_t v17 = [v5 alarmID];
  int v18 = [v16 isEqual:v17];

  if (v18)
  {
    [v14 refreshUI:v5 roomName:0 animated:1];
    [(HUMobileTimerObjectTableViewController *)self _checkAccessFetchDataAndReloadTable];
  }
  [(HUAlarmTableViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)alarmEditController:(id)a3 didDeleteAlarm:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412802;
    id v11 = self;
    __int16 v12 = 2080;
    __int16 v13 = "-[HUAlarmTableViewController alarmEditController:didDeleteAlarm:]";
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "(%@)%s: Deleting alarm %@", (uint8_t *)&v10, 0x20u);
  }

  if ((HFPreferencesBoolForKey() & 1) == 0)
  {
    id v7 = [(HUAlarmTableViewController *)self alarmManager];
    id v8 = (id)[v7 removeAlarm:v5];
  }
  id v9 = [v5 alarmID];
  [(HUMobileTimerObjectTableViewController *)self _quickDeleteMobileTimerObjectFromTable:v9];

  [(HUAlarmTableViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)_extractUpdatedTimerObjectsFromNotification:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    __int16 v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"HUAlarmTableViewController.m" lineNumber:251 description:@"This shouldn't happen"];
  }
  id v6 = [v5 userInfo];
  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F78A58]];

  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    uint64_t v25 = self;
    __int16 v26 = 2080;
    v27 = "-[HUAlarmTableViewController _extractUpdatedTimerObjectsFromNotification:]";
    __int16 v28 = 2112;
    id v29 = v5;
    __int16 v30 = 2112;
    v31 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "(%@)%s: NSNotification %@ contained updated alarms: %@", buf, 0x2Au);
  }

  id v9 = [v5 name];
  int v10 = [v9 isEqualToString:*MEMORY[0x1E4F5AEA8]];

  if (v10)
  {
    id v11 = objc_msgSend(v7, "na_map:", &__block_literal_global_155);
    [(HUMobileTimerObjectTableViewController *)self setUpdatedMobileTimerObjects:v11];

    if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
      NSLog(&cfstr_SShouldOnlyBeC.isa, self, "-[HUAlarmTableViewController _extractUpdatedTimerObjectsFromNotification:]");
    }
    __int16 v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      __int16 v21 = [(HUMobileTimerObjectTableViewController *)self mobileTimerObjects];
      *(_DWORD *)buf = 138412802;
      uint64_t v25 = self;
      __int16 v26 = 2080;
      v27 = "-[HUAlarmTableViewController _extractUpdatedTimerObjectsFromNotification:]";
      __int16 v28 = 2112;
      id v29 = v21;
      _os_log_debug_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEBUG, "(%@)%s:BEFORE replace %@", buf, 0x20u);
    }
    __int16 v13 = [(HUMobileTimerObjectTableViewController *)self mobileTimerObjects];
    __int16 v14 = [(HUMobileTimerObjectTableViewController *)self updatedMobileTimerObjects];
    [v13 removeObjectsInArray:v14];

    id v15 = [(HUMobileTimerObjectTableViewController *)self mobileTimerObjects];
    uint64_t v16 = [(HUMobileTimerObjectTableViewController *)self updatedMobileTimerObjects];
    [v15 addObjectsFromArray:v16];

    uint64_t v17 = HFLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      BOOL v22 = [(HUMobileTimerObjectTableViewController *)self mobileTimerObjects];
      *(_DWORD *)buf = 138412802;
      uint64_t v25 = self;
      __int16 v26 = 2080;
      v27 = "-[HUAlarmTableViewController _extractUpdatedTimerObjectsFromNotification:]";
      __int16 v28 = 2112;
      id v29 = v22;
      _os_log_debug_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEBUG, "(%@)%s:AFTER replace %@", buf, 0x20u);
    }
  }
  int v18 = [v5 name];
  int v19 = [v18 isEqualToString:*MEMORY[0x1E4F5AEB8]];

  if (v19)
  {
    uint64_t v20 = [(HUMobileTimerObjectTableViewController *)self mobileTimerObjects];
    [(HUMobileTimerObjectTableViewController *)self setUpdatedMobileTimerObjects:v20];
  }
}

HUMobileTimerObject *__74__HUAlarmTableViewController__extractUpdatedTimerObjectsFromNotification___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = 0;
  }
  id v5 = v4;

  if (v5) {
    id v6 = [[HUMobileTimerObject alloc] initWithAlarm:v5];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  id v3 = [(HUAlarmTableViewController *)self alarmManager];
  BOOL v4 = [(HUAlarmTableViewController *)self addNotificationObserver];
  [v3 removeObserver:v4];

  [(HUAlarmTableViewController *)self setAddNotificationObserver:0];
  id v5 = [(HUAlarmTableViewController *)self alarmManager];
  id v6 = [(HUAlarmTableViewController *)self updateNotificationObserver];
  [v5 removeObserver:v6];

  [(HUAlarmTableViewController *)self setUpdateNotificationObserver:0];
  id v7 = [(HUAlarmTableViewController *)self alarmManager];
  id v8 = [(HUAlarmTableViewController *)self removeNotificationObserver];
  [v7 removeObserver:v8];

  [(HUAlarmTableViewController *)self setRemoveNotificationObserver:0];
  id v9 = [(HUAlarmTableViewController *)self alarmManager];
  int v10 = [(HUAlarmTableViewController *)self canDispatchNotificationObserver];
  [v9 removeObserver:v10];

  [(HUAlarmTableViewController *)self setCanDispatchNotificationObserver:0];
  id v11 = [(HUAlarmTableViewController *)self alarmManager];
  __int16 v12 = [(HUAlarmTableViewController *)self resetNotificationObserver];
  [v11 removeObserver:v12];

  [(HUAlarmTableViewController *)self setResetNotificationObserver:0];
  v13.receiver = self;
  v13.super_class = (Class)HUAlarmTableViewController;
  [(HUMobileTimerObjectTableViewController *)&v13 dealloc];
}

- (id)_baseMobileTimerObjectsFuture
{
  id v3 = [(HUMobileTimerObjectTableViewController *)self mediaProfileContainer];
  BOOL v4 = [v3 accessories];
  id v5 = [v4 allObjects];

  if (![v5 count])
  {
    id v6 = (void *)MEMORY[0x1E4F1C978];
    id v7 = [(HUMobileTimerObjectTableViewController *)self accessory];
    uint64_t v8 = [v6 arrayWithObject:v7];

    id v5 = (void *)v8;
  }
  id v9 = [(HUAlarmTableViewController *)self alarmManager];
  int v10 = [v9 alarmsForAccessories:v5];
  id v11 = [v10 flatMap:&__block_literal_global_55_0];

  return v11;
}

id __59__HUAlarmTableViewController__baseMobileTimerObjectsFuture__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_opt_new();
  BOOL v4 = [v2 objectEnumerator];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__HUAlarmTableViewController__baseMobileTimerObjectsFuture__block_invoke_2;
  v10[3] = &unk_1E6388098;
  id v11 = v3;
  id v5 = v3;
  objc_msgSend(v4, "na_each:", v10);

  id v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_60_1);
  id v7 = [v6 allObjects];

  uint64_t v8 = [MEMORY[0x1E4F7A0D8] futureWithResult:v7];

  return v8;
}

uint64_t __59__HUAlarmTableViewController__baseMobileTimerObjectsFuture__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObjectsFromArray:a2];
}

HUMobileTimerObject *__59__HUAlarmTableViewController__baseMobileTimerObjectsFuture__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[HUMobileTimerObject alloc] initWithAlarm:v2];

  return v3;
}

- (id)_newCellForMTTimerObjectUUID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HUAlarmTableViewController *)self _findTimerObjectForID:v4];
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136315650;
    id v11 = (HUAlarmTableViewController *)"-[HUAlarmTableViewController _newCellForMTTimerObjectUUID:]";
    __int16 v12 = 2112;
    objc_super v13 = self;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_debug_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEBUG, "%s(%@) new MT Cell for %@", (uint8_t *)&v10, 0x20u);
  }

  if (v5)
  {
    id v7 = [[HUAlarmTableViewCell alloc] initWithMobileTimerObject:v5 roomName:0];
    [(HUAlarmTableViewCell *)v7 setDelegate:self];
  }
  else
  {
    uint64_t v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412802;
      id v11 = self;
      __int16 v12 = 2080;
      objc_super v13 = (HUAlarmTableViewController *)"-[HUAlarmTableViewController _newCellForMTTimerObjectUUID:]";
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_error_impl(&dword_1BE345000, v8, OS_LOG_TYPE_ERROR, "(%@)%s: could not find mobileTimerObject for ID: %@", (uint8_t *)&v10, 0x20u);
    }

    id v7 = 0;
  }

  return v7;
}

- (id)_canManagerControlAccessory
{
  id v3 = [(HUMobileTimerObjectTableViewController *)self accessory];
  id v4 = [(HUAlarmTableViewController *)self alarmManager];
  id v5 = +[HUAlarmsAndTimersAccessUtility canAccess:v3 for:0 withManager:v4];
  id v6 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
  id v7 = [v5 reschedule:v6];

  return v7;
}

- (id)_fakeMobileAlarmObjectsFuture
{
  return (id)[MEMORY[0x1E4F7A0D8] futureWithBlock:&__block_literal_global_65];
}

void __59__HUAlarmTableViewController__fakeMobileAlarmObjectsFuture__block_invoke(uint64_t a1, void *a2)
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F78B58]) initWithHour:18 minute:0];
  [v3 setTitle:@"6pmAlarm"];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F78B58]) initWithHour:19 minute:0];
  [v4 setTitle:@"7pmAlarm"];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F78B58]) initWithHour:20 minute:0];
  [v5 setTitle:@"8pmAlarm"];
  v14[0] = v3;
  v14[1] = v4;
  v14[2] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
  id v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_77_1);
  dispatch_time_t v8 = dispatch_time(0, 5000000000);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__HUAlarmTableViewController__fakeMobileAlarmObjectsFuture__block_invoke_3;
  v11[3] = &unk_1E63850E0;
  id v12 = v2;
  id v13 = v7;
  id v9 = v7;
  id v10 = v2;
  dispatch_after(v8, MEMORY[0x1E4F14428], v11);
}

HUMobileTimerObject *__59__HUAlarmTableViewController__fakeMobileAlarmObjectsFuture__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[HUMobileTimerObject alloc] initWithAlarm:v2];

  return v3;
}

uint64_t __59__HUAlarmTableViewController__fakeMobileAlarmObjectsFuture__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:*(void *)(a1 + 40)];
}

- (id)_findTimerObjectForID:(id)a3
{
  id v4 = a3;
  id v5 = [(HUMobileTimerObjectTableViewController *)self mobileTimerObjects];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__HUAlarmTableViewController__findTimerObjectForID___block_invoke;
  v9[3] = &unk_1E63880E0;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __52__HUAlarmTableViewController__findTimerObjectForID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 alarm];
  id v4 = [v3 alarmID];
  uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];

  return v5;
}

- (void)_removeTimerObjectAtIndexPath:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HUAlarmTableViewController *)self tableView];
  id v6 = [v5 cellForRowAtIndexPath:v4];

  objc_opt_class();
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    dispatch_time_t v8 = v7;
  }
  else {
    dispatch_time_t v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    id v10 = [v9 alarm];
    id v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138413058;
      uint64_t v16 = self;
      __int16 v17 = 2080;
      int v18 = "-[HUAlarmTableViewController _removeTimerObjectAtIndexPath:]";
      __int16 v19 = 2112;
      uint64_t v20 = v10;
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "(%@)%s: Removing alarm %@ at %@", (uint8_t *)&v15, 0x2Au);
    }

    if (v10)
    {
      if ((HFPreferencesBoolForKey() & 1) == 0)
      {
        id v12 = [(HUAlarmTableViewController *)self alarmManager];
        id v13 = (id)[v12 removeAlarm:v10];
      }
      __int16 v14 = [v10 alarmID];
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

- (COAlarmManager)alarmManager
{
  return self->_alarmManager;
}

- (void)setAlarmManager:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resetNotificationObserver, 0);
  objc_storeStrong(&self->_canDispatchNotificationObserver, 0);
  objc_storeStrong(&self->_updateNotificationObserver, 0);
  objc_storeStrong(&self->_removeNotificationObserver, 0);
  objc_storeStrong(&self->_addNotificationObserver, 0);
  objc_storeStrong((id *)&self->_alarmManager, 0);

  objc_destroyWeak((id *)&self->presentationDelegate);
}

@end