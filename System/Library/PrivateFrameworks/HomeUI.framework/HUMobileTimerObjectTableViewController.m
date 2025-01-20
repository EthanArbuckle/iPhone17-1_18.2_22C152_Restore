@interface HUMobileTimerObjectTableViewController
- (BOOL)_activateAccessoryForMobileTimerCreation;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isSiriEndpointActive;
- (BOOL)_shouldAllowCellSelection;
- (BOOL)createNewMTObjectPendingSidekickActivation;
- (BOOL)itemShouldDisplaySpinner;
- (BOOL)redrawSpinnerCell;
- (BOOL)wasControllableAtLastCheck;
- (CGSize)_calculatePreferredContentSize;
- (HFMediaProfileContainer)mediaProfileContainer;
- (HMAccessory)accessory;
- (HUMobileTimerContentUnavailableView)noItemsView;
- (HUMobileTimerObjectTableViewController)initWithMediaProfileContainer:(id)a3;
- (HUPresentationDelegate)presentationDelegate;
- (HUQuickControlContentHelper)quickControlContentHelper;
- (NAFuture)checkAccessAndFetchDataFuture;
- (NAFuture)outstandingMobileTimerObjectsFuture;
- (NSArray)updatedMobileTimerObjects;
- (NSMutableArray)mobileTimerObjects;
- (NSString)headerCellTitle;
- (NSString)identifier;
- (NSString)loadingItemsTitle;
- (NSString)unavailableText;
- (NSString)unavailableTitle;
- (NSTimer)accessoryActivationTimer;
- (NSUUID)headerUUID;
- (UITableViewDiffableDataSource)tableViewDataSource;
- (id)_baseMobileTimerObjectsFuture;
- (id)_canManagerControlAccessory;
- (id)_checkAndFetchTimerObjects;
- (id)_findTimerObjectForID:(id)a3;
- (id)_newCellForHeaderTitle:(id)a3;
- (id)_newCellForMTTimerObjectUUID:(id)a3;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (unint64_t)accessoryAccessState;
- (unint64_t)numberOfMobileTimerObjects;
- (void)_accessoryActivationTimerFinished:(id)a3;
- (void)_checkAccessFetchDataAndReloadTable;
- (void)_checkAndAddTimerObject;
- (void)_configureNoItemsViewAnimated:(BOOL)a3;
- (void)_quickDeleteMobileTimerObjectFromTable:(id)a3;
- (void)_reloadTableViewWithExistingData;
- (void)_removeTimerObjectAtIndexPath:(id)a3;
- (void)_showSpinner:(BOOL)a3;
- (void)dealloc;
- (void)didReceiveSettingsUpdatesForAccessoryWithIdentifier:(id)a3 settings:(id)a4;
- (void)presentAddMobileTimerObjectViewControllerOnMainThread;
- (void)setAccessory:(id)a3;
- (void)setAccessoryAccessState:(unint64_t)a3;
- (void)setAccessoryActivationTimer:(id)a3;
- (void)setCheckAccessAndFetchDataFuture:(id)a3;
- (void)setCreateNewMTObjectPendingSidekickActivation:(BOOL)a3;
- (void)setHeaderCellTitle:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setItemShouldDisplaySpinner:(BOOL)a3;
- (void)setLoadingItemsTitle:(id)a3;
- (void)setMediaProfileContainer:(id)a3;
- (void)setMobileTimerObjects:(id)a3;
- (void)setNoItemsView:(id)a3;
- (void)setOutstandingMobileTimerObjectsFuture:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setQuickControlContentHelper:(id)a3;
- (void)setRedrawSpinnerCell:(BOOL)a3;
- (void)setTableViewDataSource:(id)a3;
- (void)setUnavailableText:(id)a3;
- (void)setUnavailableTitle:(id)a3;
- (void)setUpdatedMobileTimerObjects:(id)a3;
- (void)setWasControllableAtLastCheck:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HUMobileTimerObjectTableViewController

- (HUMobileTimerObjectTableViewController)initWithMediaProfileContainer:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HUMobileTimerObjectTableViewController;
  v6 = [(HUMobileTimerObjectTableViewController *)&v17 initWithStyle:2];
  if (v6)
  {
    v7 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    v8 = [v7 accessorySettingsDataSource];
    [v8 addObserver:v6];

    objc_storeStrong((id *)&v6->_mediaProfileContainer, a3);
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    mobileTimerObjects = v6->_mobileTimerObjects;
    v6->_mobileTimerObjects = v9;

    v11 = [v5 accessories];
    uint64_t v12 = objc_msgSend(v11, "na_firstObjectPassingTest:", &__block_literal_global_122);
    accessory = v6->_accessory;
    v6->_accessory = (HMAccessory *)v12;

    v6->_accessoryAccessState = 0;
    v14 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    headerUUID = v6->_headerUUID;
    v6->_headerUUID = v14;
  }
  return v6;
}

uint64_t __72__HUMobileTimerObjectTableViewController_initWithMediaProfileContainer___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "hf_isHomePod")) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = objc_msgSend(v2, "hf_isSiriEndpoint");
  }

  return v3;
}

- (unint64_t)numberOfMobileTimerObjects
{
  id v2 = [(HUMobileTimerObjectTableViewController *)self mobileTimerObjects];
  unint64_t v3 = [v2 count];

  return v3;
}

- (void)viewDidLoad
{
  v32.receiver = self;
  v32.super_class = (Class)HUMobileTimerObjectTableViewController;
  [(HUMobileTimerObjectTableViewController *)&v32 viewDidLoad];
  unint64_t v3 = [(HUMobileTimerObjectTableViewController *)self tableView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  v4 = [(HUMobileTimerObjectTableViewController *)self tableView];
  [v4 _setSectionContentInsetFollowsLayoutMargins:0];

  id v5 = [(HUMobileTimerObjectTableViewController *)self tableView];
  [v5 setAllowsSelectionDuringEditing:1];

  BOOL v6 = [(HUMobileTimerObjectTableViewController *)self _shouldAllowCellSelection];
  v7 = [(HUMobileTimerObjectTableViewController *)self tableView];
  [v7 setAllowsSelection:v6];

  v8 = [(HUMobileTimerObjectTableViewController *)self tableView];
  [v8 _setMarginWidth:1.0];

  v9 = [(HUMobileTimerObjectTableViewController *)self tableView];
  [v9 setLayoutMarginsFollowReadableWidth:1];

  v10 = [(HUMobileTimerObjectTableViewController *)self tableView];
  [v10 setEstimatedRowHeight:88.0];

  double v11 = *MEMORY[0x1E4F43D18];
  uint64_t v12 = [(HUMobileTimerObjectTableViewController *)self tableView];
  [v12 setRowHeight:v11];

  v13 = [(HUMobileTimerObjectTableViewController *)self tableView];
  [v13 setSectionHeaderHeight:0.0];

  v14 = [(HUMobileTimerObjectTableViewController *)self tableView];
  [v14 setSectionFooterHeight:10.0];

  v15 = [(HUMobileTimerObjectTableViewController *)self tableView];
  [v15 setSeparatorStyle:0];

  v16 = [MEMORY[0x1E4F428B8] clearColor];
  objc_super v17 = [(HUMobileTimerObjectTableViewController *)self tableView];
  [v17 setBackgroundColor:v16];

  v18 = [(HUMobileTimerObjectTableViewController *)self tableView];
  [v18 _setTopPadding:0.0];

  v19 = [(HUMobileTimerObjectTableViewController *)self tableView];
  [v19 _setBottomPadding:0.0];

  v20 = [(HUMobileTimerObjectTableViewController *)self view];
  [v20 setClipsToBounds:1];

  v21 = [(HUMobileTimerObjectTableViewController *)self tableView];
  v22 = [v21 layer];
  [v22 setCornerRadius:8.0];

  objc_initWeak(&location, self);
  id v23 = objc_alloc(MEMORY[0x1E4F42EB0]);
  v24 = [(HUMobileTimerObjectTableViewController *)self tableView];
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  v28 = __53__HUMobileTimerObjectTableViewController_viewDidLoad__block_invoke;
  v29 = &unk_1E638B328;
  objc_copyWeak(&v30, &location);
  v25 = (void *)[v23 initWithTableView:v24 cellProvider:&v26];
  -[HUMobileTimerObjectTableViewController setTableViewDataSource:](self, "setTableViewDataSource:", v25, v26, v27, v28, v29);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

id __53__HUMobileTimerObjectTableViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = [WeakRetained headerUUID];
  int v8 = objc_msgSend(v5, "hmf_isEqualToUUID:", v7);

  if (v8)
  {
    v9 = [WeakRetained headerCellTitle];
    v10 = (void *)[WeakRetained _newCellForHeaderTitle:v9];
  }
  else
  {
    v10 = (void *)[WeakRetained _newCellForMTTimerObjectUUID:v5];
  }

  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)HUMobileTimerObjectTableViewController;
  [(HUMobileTimerObjectTableViewController *)&v6 viewWillAppear:a3];
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    int v8 = self;
    __int16 v9 = 2080;
    v10 = "-[HUMobileTimerObjectTableViewController viewWillAppear:]";
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(%@)%s: Starting initial load of table view with no MTObjects", buf, 0x16u);
  }

  [(HUMobileTimerObjectTableViewController *)self _reloadTableViewWithExistingData];
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    int v8 = self;
    __int16 v9 = 2080;
    v10 = "-[HUMobileTimerObjectTableViewController viewWillAppear:]";
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "(%@)%s: beginning full check, fetch & reload sequence", buf, 0x16u);
  }

  [(HUMobileTimerObjectTableViewController *)self _checkAccessFetchDataAndReloadTable];
}

- (void)dealloc
{
  unint64_t v3 = [(HUMobileTimerObjectTableViewController *)self accessoryActivationTimer];
  [v3 invalidate];

  [(HUMobileTimerObjectTableViewController *)self setAccessoryActivationTimer:0];
  v4.receiver = self;
  v4.super_class = (Class)HUMobileTimerObjectTableViewController;
  [(HUMobileTimerObjectTableViewController *)&v4 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_checkAccessFetchDataAndReloadTable
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(HUMobileTimerObjectTableViewController *)self checkAccessAndFetchDataFuture];
  if (v3)
  {
    objc_super v4 = [(HUMobileTimerObjectTableViewController *)self checkAccessAndFetchDataFuture];
    char v5 = [v4 isFinished];

    if ((v5 & 1) == 0)
    {
      objc_super v6 = HFLogForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v14 = self;
        __int16 v15 = 2080;
        v16 = "-[HUMobileTimerObjectTableViewController _checkAccessFetchDataAndReloadTable]";
        _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "(%@)%s: Called with existing check+fetch future - cancelling existing future", buf, 0x16u);
      }

      v7 = [(HUMobileTimerObjectTableViewController *)self checkAccessAndFetchDataFuture];
      [v7 cancel];
    }
  }
  int v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = self;
    __int16 v15 = 2080;
    v16 = "-[HUMobileTimerObjectTableViewController _checkAccessFetchDataAndReloadTable]";
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "(%@)%s: Kicking off check+fetch future - will reload if successful", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  __int16 v9 = [(HUMobileTimerObjectTableViewController *)self _checkAndFetchTimerObjects];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__HUMobileTimerObjectTableViewController__checkAccessFetchDataAndReloadTable__block_invoke;
  v11[3] = &unk_1E638B350;
  objc_copyWeak(&v12, (id *)buf);
  v10 = [v9 flatMap:v11];
  [(HUMobileTimerObjectTableViewController *)self setCheckAccessAndFetchDataFuture:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

id __77__HUMobileTimerObjectTableViewController__checkAccessFetchDataAndReloadTable__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412546;
    id v6 = WeakRetained;
    __int16 v7 = 2080;
    int v8 = "-[HUMobileTimerObjectTableViewController _checkAccessFetchDataAndReloadTable]_block_invoke";
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "(%@)%s: Check+fetch future succeeded, reloading table view...", (uint8_t *)&v5, 0x16u);
  }

  [WeakRetained _reloadTableViewWithExistingData];
  unint64_t v3 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];

  return v3;
}

- (id)_checkAndFetchTimerObjects
{
  objc_initWeak(&location, self);
  unint64_t v3 = [(HUMobileTimerObjectTableViewController *)self _canManagerControlAccessory];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__HUMobileTimerObjectTableViewController__checkAndFetchTimerObjects__block_invoke;
  v8[3] = &unk_1E6386D40;
  objc_copyWeak(&v9, &location);
  objc_super v4 = [v3 flatMap:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__HUMobileTimerObjectTableViewController__checkAndFetchTimerObjects__block_invoke_2_33;
  v7[3] = &unk_1E6387340;
  v7[4] = self;
  int v5 = [v4 recover:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v5;
}

id __68__HUMobileTimerObjectTableViewController__checkAndFetchTimerObjects__block_invoke(uint64_t a1, void *a2)
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_super v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v6 = [WeakRetained wasControllableAtLastCheck];
  if (v6 != [v3 BOOLValue])
  {
    __int16 v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v35[0] = *MEMORY[0x1E4F683E8];
    int v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "BOOLValue"));
    v36[0] = v8;
    v35[1] = *MEMORY[0x1E4F683F0];
    id v9 = [WeakRetained identifier];
    v36[1] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
    [v7 postNotificationName:*MEMORY[0x1E4F683F8] object:WeakRetained userInfo:v10];
  }
  objc_msgSend(WeakRetained, "setWasControllableAtLastCheck:", objc_msgSend(v3, "BOOLValue"));
  if ([WeakRetained wasControllableAtLastCheck]) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = 2;
  }
  [WeakRetained setAccessoryAccessState:v11];
  id v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v26 = WeakRetained;
    __int16 v27 = 2080;
    v28 = "-[HUMobileTimerObjectTableViewController _checkAndFetchTimerObjects]_block_invoke";
    __int16 v29 = 1024;
    int v30 = [WeakRetained wasControllableAtLastCheck];
    _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "(%@)%s: (_canManagerControlAccessory future has returned) accessory is controllable = %{BOOL}d", buf, 0x1Cu);
  }

  if ([WeakRetained wasControllableAtLastCheck])
  {
    v13 = HFLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v14 = [WeakRetained accessoryAccessState] != 2;
      uint64_t v15 = [WeakRetained numberOfMobileTimerObjects];
      v16 = [WeakRetained mobileTimerObjects];
      *(_DWORD *)buf = 138413314;
      id v26 = WeakRetained;
      __int16 v27 = 2080;
      v28 = "-[HUMobileTimerObjectTableViewController _checkAndFetchTimerObjects]_block_invoke";
      __int16 v29 = 1024;
      int v30 = v14;
      __int16 v31 = 2048;
      uint64_t v32 = v15;
      __int16 v33 = 2112;
      v34 = v16;
      _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "(%@)%s: Requesting mobile timer objects from Coordination framework. Controllable: %{BOOL}d BEFORE REQUEST: %lu MT Objects = %@", buf, 0x30u);
    }
    uint64_t v17 = [WeakRetained _baseMobileTimerObjectsFuture];
    v18 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
    v19 = [v17 reschedule:v18];

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __68__HUMobileTimerObjectTableViewController__checkAndFetchTimerObjects__block_invoke_18;
    v23[3] = &unk_1E638AC40;
    objc_copyWeak(&v24, v4);
    v20 = [v19 addCompletionBlock:v23];
    v21 = [v20 flatMap:&__block_literal_global_31];

    objc_destroyWeak(&v24);
  }
  else
  {
    v21 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v21;
}

void __68__HUMobileTimerObjectTableViewController__checkAndFetchTimerObjects__block_invoke_18(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __int16 v7 = WeakRetained;
  if (a3)
  {
    [WeakRetained setWasControllableAtLastCheck:0];
    int v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v19 = v7;
      __int16 v20 = 2080;
      v21 = "-[HUMobileTimerObjectTableViewController _checkAndFetchTimerObjects]_block_invoke";
      __int16 v22 = 1024;
      BOOL v23 = [v7 accessoryAccessState] != 2;
      _os_log_error_impl(&dword_1BE345000, v8, OS_LOG_TYPE_ERROR, "(%@)%s: MOBILE TIMER FUTURE FAILED. Controllable: %{BOOL}d", buf, 0x1Cu);
    }
  }
  else
  {
    id v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      v19 = v7;
      __int16 v20 = 2080;
      v21 = "-[HUMobileTimerObjectTableViewController _checkAndFetchTimerObjects]_block_invoke";
      __int16 v22 = 1024;
      BOOL v23 = [v7 accessoryAccessState] != 2;
      __int16 v24 = 2048;
      uint64_t v25 = [v5 count];
      __int16 v26 = 2112;
      id v27 = v5;
      _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "(%@)%s: Received mobile timer objects from Coordination framework. Controllable: %{BOOL}d AFTER REQUEST: %lu MT Objects = %@", buf, 0x30u);
    }

    if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
      NSLog(&cfstr_SShouldOnlyBeC.isa, v7, "-[HUMobileTimerObjectTableViewController _checkAndFetchTimerObjects]_block_invoke");
    }
    v10 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v11 = objc_msgSend(v5, "na_filter:", &__block_literal_global_23_2);
    id v12 = [v10 arrayWithArray:v11];
    [v7 setMobileTimerObjects:v12];

    v13 = [v7 mobileTimerObjects];
    [v13 sortUsingComparator:&__block_literal_global_26_0];

    int v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v14 = [v7 accessoryAccessState] != 2;
      uint64_t v15 = [v7 mobileTimerObjects];
      uint64_t v16 = [v15 count];
      uint64_t v17 = [v7 mobileTimerObjects];
      *(_DWORD *)buf = 138413314;
      v19 = v7;
      __int16 v20 = 2080;
      v21 = "-[HUMobileTimerObjectTableViewController _checkAndFetchTimerObjects]_block_invoke";
      __int16 v22 = 1024;
      BOOL v23 = v14;
      __int16 v24 = 2048;
      uint64_t v25 = v16;
      __int16 v26 = 2112;
      id v27 = v17;
      _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "(%@)%s: Stripped unusable objects. Controllable: %{BOOL}d PRE RELOAD: %lu MTObjects = %@", buf, 0x30u);
    }
  }
}

uint64_t __68__HUMobileTimerObjectTableViewController__checkAndFetchTimerObjects__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isIgnorableTimerObject] ^ 1;
}

uint64_t __68__HUMobileTimerObjectTableViewController__checkAndFetchTimerObjects__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __68__HUMobileTimerObjectTableViewController__checkAndFetchTimerObjects__block_invoke_28()
{
  return [MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

id __68__HUMobileTimerObjectTableViewController__checkAndFetchTimerObjects__block_invoke_2_33(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) setWasControllableAtLastCheck:0];
  objc_super v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412802;
    uint64_t v9 = v7;
    __int16 v10 = 2080;
    uint64_t v11 = "-[HUMobileTimerObjectTableViewController _checkAndFetchTimerObjects]_block_invoke_2";
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "(%@)%s: MANAGER ACCESS FUTURE FAILED. Err=%@", (uint8_t *)&v8, 0x20u);
  }

  id v5 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];

  return v5;
}

- (void)_reloadTableViewWithExistingData
{
  objc_initWeak(&location, self);
  id v2 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __74__HUMobileTimerObjectTableViewController__reloadTableViewWithExistingData__block_invoke;
  v3[3] = &unk_1E63862A0;
  objc_copyWeak(&v4, &location);
  [v2 performBlock:v3];

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __74__HUMobileTimerObjectTableViewController__reloadTableViewWithExistingData__block_invoke(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained mobileTimerObjects];
  if ([v2 count]) {
    BOOL v3 = [WeakRetained accessoryAccessState] != 1;
  }
  else {
    BOOL v3 = 1;
  }

  id v4 = [WeakRetained quickControlContentHelper];
  id v5 = [WeakRetained identifier];
  [v4 shouldHideQuickControlHeaderButton:v3 forSectionIdentifier:v5];

  uint64_t v6 = [WeakRetained accessoryAccessState];
  uint64_t v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    *(_DWORD *)buf = 138413058;
    v44 = (const char *)WeakRetained;
    __int16 v45 = 2080;
    v46 = "-[HUMobileTimerObjectTableViewController _reloadTableViewWithExistingData]_block_invoke";
    __int16 v47 = 2112;
    id v48 = v9;
    __int16 v49 = 1024;
    BOOL v50 = v6 != 1;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "(%@)%s: Hiding the header for %@?: %{BOOL}d", buf, 0x26u);
  }
  __int16 v10 = [WeakRetained quickControlContentHelper];
  uint64_t v11 = [WeakRetained identifier];
  [v10 shouldHideQuickControlHeaderText:v6 != 1 forSectionIdentifier:v11];

  [WeakRetained _configureNoItemsViewAnimated:1];
  __int16 v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [WeakRetained accessoryAccessState];
    *(_DWORD *)buf = 138412802;
    v44 = (const char *)WeakRetained;
    __int16 v45 = 2080;
    v46 = "-[HUMobileTimerObjectTableViewController _reloadTableViewWithExistingData]_block_invoke";
    __int16 v47 = 1024;
    LODWORD(v48) = v13 != 2;
    _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "(%@)%s: Reload called & accessory available is %{BOOL}d", buf, 0x1Cu);
  }

  uint64_t v14 = objc_opt_new();
  if ([WeakRetained accessoryAccessState] == 1)
  {
    uint64_t v15 = [WeakRetained mobileTimerObjects];
    uint64_t v16 = [v15 count];

    if (!v16)
    {
      uint64_t v17 = [WeakRetained headerUUID];
      v42 = v17;
      v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
      [v14 appendSectionsWithIdentifiers:v18];

      v19 = [WeakRetained headerUUID];
      v41 = v19;
      __int16 v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
      v21 = [WeakRetained headerUUID];
      [v14 appendItemsWithIdentifiers:v20 intoSectionWithIdentifier:v21];
    }
    __int16 v22 = [WeakRetained mobileTimerObjects];
    BOOL v23 = objc_msgSend(v22, "na_map:", &__block_literal_global_40_0);
    [v14 appendSectionsWithIdentifiers:v23];

    __int16 v24 = [WeakRetained mobileTimerObjects];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __74__HUMobileTimerObjectTableViewController__reloadTableViewWithExistingData__block_invoke_2;
    v38[3] = &unk_1E638B3D8;
    id v25 = v14;
    id v39 = v25;
    objc_msgSend(v24, "na_each:", v38);

    __int16 v26 = [WeakRetained updatedMobileTimerObjects];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __74__HUMobileTimerObjectTableViewController__reloadTableViewWithExistingData__block_invoke_3;
    v37[3] = &unk_1E63880E0;
    v37[4] = WeakRetained;
    id v27 = objc_msgSend(v26, "na_filter:", v37);

    uint64_t v28 = HFLogForCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v44 = "-[HUMobileTimerObjectTableViewController _reloadTableViewWithExistingData]_block_invoke_4";
      __int16 v45 = 2112;
      v46 = (const char *)WeakRetained;
      __int16 v47 = 2112;
      id v48 = v27;
      _os_log_debug_impl(&dword_1BE345000, v28, OS_LOG_TYPE_DEBUG, "%s(%@) setting snapshot to reload updatedMobileTimerObjects: %@", buf, 0x20u);
    }

    __int16 v29 = objc_msgSend(v27, "na_map:", &__block_literal_global_45_1);
    [v25 reloadItemsWithIdentifiers:v29];

    if ([WeakRetained redrawSpinnerCell])
    {
      int v30 = [WeakRetained mobileTimerObjects];
      uint64_t v31 = [v30 count];

      if (!v31)
      {
        uint64_t v32 = [WeakRetained headerUUID];
        v40 = v32;
        __int16 v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
        [v25 reloadItemsWithIdentifiers:v33];
      }
    }
    [WeakRetained setUpdatedMobileTimerObjects:0];
    v34 = HFLogForCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v44 = (const char *)WeakRetained;
      __int16 v45 = 2080;
      v46 = "-[HUMobileTimerObjectTableViewController _reloadTableViewWithExistingData]_block_invoke_2";
      __int16 v47 = 2112;
      id v48 = v25;
      _os_log_impl(&dword_1BE345000, v34, OS_LOG_TYPE_DEFAULT, "(%@)%s: applying snapshot: %@", buf, 0x20u);
    }
  }
  v35 = [WeakRetained tableViewDataSource];
  [v35 applySnapshot:v14 animatingDifferences:1 completion:0];

  [WeakRetained _calculatePreferredContentSize];
  objc_msgSend(WeakRetained, "setPreferredContentSize:");
  [WeakRetained _configureNoItemsViewAnimated:1];
  v36 = [WeakRetained quickControlContentHelper];
  [v36 invalidateContentViewLayout];
}

uint64_t __74__HUMobileTimerObjectTableViewController__reloadTableViewWithExistingData__block_invoke_37(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

void __74__HUMobileTimerObjectTableViewController__reloadTableViewWithExistingData__block_invoke_2(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 uniqueIdentifier];
  v7[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  uint64_t v6 = [v3 uniqueIdentifier];

  [v2 appendItemsWithIdentifiers:v5 intoSectionWithIdentifier:v6];
}

uint64_t __74__HUMobileTimerObjectTableViewController__reloadTableViewWithExistingData__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 mobileTimerObjects];
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

uint64_t __74__HUMobileTimerObjectTableViewController__reloadTableViewWithExistingData__block_invoke_43(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

- (CGSize)_calculatePreferredContentSize
{
  unint64_t v3 = [(HUMobileTimerObjectTableViewController *)self numberOfMobileTimerObjects];
  id v4 = [(HUMobileTimerObjectTableViewController *)self tableView];
  uint64_t v5 = v4;
  if (v3)
  {
    [v4 contentSize];
    double v7 = v6;
    double v9 = v8;
    double v10 = *MEMORY[0x1E4F1DB30];
    double v11 = *(double *)(MEMORY[0x1E4F1DB30] + 8);

    __int16 v12 = [(HUMobileTimerObjectTableViewController *)self tableView];
    uint64_t v5 = v12;
    if (v7 == v10 && v9 == v11) {
      objc_msgSend(v12, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4F43B98], *(double *)(MEMORY[0x1E4F43B98] + 8));
    }
    else {
      [v12 contentSize];
    }
    double v17 = v14;
    uint64_t v18 = v15;
  }
  else
  {
    [v4 bounds];
    double v17 = v16;
    *(double *)&uint64_t v18 = 140.0;
  }

  double v19 = v17;
  double v20 = *(double *)&v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)_quickDeleteMobileTimerObjectFromTable:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __81__HUMobileTimerObjectTableViewController__quickDeleteMobileTimerObjectFromTable___block_invoke;
  v7[3] = &unk_1E63882F0;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 performBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __81__HUMobileTimerObjectTableViewController__quickDeleteMobileTimerObjectFromTable___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v3 = [WeakRetained tableViewDataSource];
  id v4 = [v3 snapshot];

  v7[0] = *(void *)(a1 + 32);
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v4 deleteSectionsWithIdentifiers:v5];

  id v6 = [WeakRetained tableViewDataSource];
  [v6 applySnapshot:v4 animatingDifferences:1];
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HUMobileTimerObjectTableViewController *)self tableViewDataSource];
  id v9 = [v8 itemIdentifierForIndexPath:v7];

  double v10 = [(HUMobileTimerObjectTableViewController *)self headerUUID];
  char v11 = objc_msgSend(v9, "hmf_isEqualToUUID:", v10);

  if (v11)
  {
    __int16 v12 = 0;
  }
  else
  {
    objc_initWeak(&location, self);
    uint64_t v13 = (void *)MEMORY[0x1E4F42900];
    double v14 = _HULocalizedStringWithDefaultValue(@"HUDeleteTitle", @"HUDeleteTitle", 1);
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    BOOL v23 = __103__HUMobileTimerObjectTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke;
    __int16 v24 = &unk_1E638B400;
    objc_copyWeak(&v26, &location);
    id v15 = v7;
    id v25 = v15;
    double v16 = [v13 contextualActionWithStyle:1 title:v14 handler:&v21];

    double v17 = HFLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      int v30 = self;
      __int16 v31 = 2112;
      id v32 = v15;
      _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "%@: User swiped for trailing actions on indexPath: %@", buf, 0x16u);
    }

    uint64_t v18 = (void *)MEMORY[0x1E4F42E68];
    uint64_t v28 = v16;
    double v19 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v28, 1, v21, v22, v23, v24);
    __int16 v12 = [v18 configurationWithActions:v19];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __103__HUMobileTimerObjectTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = (id *)(a1 + 40);
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _removeTimerObjectAtIndexPath:*(void *)(a1 + 32)];
  v6[2](v6, 1);
}

- (void)_configureNoItemsViewAnimated:(BOOL)a3
{
  unint64_t v5 = [(HUMobileTimerObjectTableViewController *)self accessoryAccessState];
  id v6 = [(HUMobileTimerObjectTableViewController *)self noItemsView];

  if (v6)
  {
    id v7 = [(HUMobileTimerObjectTableViewController *)self noItemsView];
    [v7 removeFromSuperview];

    [(HUMobileTimerObjectTableViewController *)self setNoItemsView:0];
  }
  if (v5 != 1 && [(HUMobileTimerObjectTableViewController *)self isViewLoaded])
  {
    id v8 = objc_alloc_init(HUMobileTimerContentUnavailableView);
    [(HUMobileTimerObjectTableViewController *)self setNoItemsView:v8];

    if ([(HUMobileTimerObjectTableViewController *)self accessoryAccessState] == 2)
    {
      id v9 = [(HUMobileTimerObjectTableViewController *)self unavailableTitle];
      double v10 = [(HUMobileTimerObjectTableViewController *)self noItemsView];
      [v10 setTitle:v9];

      char v11 = [(HUMobileTimerObjectTableViewController *)self unavailableText];
      __int16 v12 = [(HUMobileTimerObjectTableViewController *)self noItemsView];
      [v12 setMessage:v11];
    }
    else
    {
      char v11 = [(HUMobileTimerObjectTableViewController *)self loadingItemsTitle];
      __int16 v12 = [(HUMobileTimerObjectTableViewController *)self noItemsView];
      [v12 setTitle:v11];
    }

    uint64_t v13 = [(HUMobileTimerObjectTableViewController *)self noItemsView];
    [v13 setVibrantOptions:0];

    double v14 = [(HUMobileTimerObjectTableViewController *)self noItemsView];
    [v14 setUserInteractionEnabled:0];

    id v15 = [(HUMobileTimerObjectTableViewController *)self tableView];
    [v15 bounds];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    __int16 v24 = [(HUMobileTimerObjectTableViewController *)self noItemsView];
    objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

    id v25 = [(HUMobileTimerObjectTableViewController *)self tableView];
    id v26 = [(HUMobileTimerObjectTableViewController *)self noItemsView];
    [v25 addSubview:v26];
  }
  double v27 = 0.2;
  v28[1] = 3221225472;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[2] = __72__HUMobileTimerObjectTableViewController__configureNoItemsViewAnimated___block_invoke;
  v28[3] = &unk_1E6385A70;
  if (v5 == 1 || !a3) {
    double v27 = 0.0;
  }
  v28[4] = self;
  BOOL v29 = v5 == 1;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v28 animations:v27];
}

void __72__HUMobileTimerObjectTableViewController__configureNoItemsViewAnimated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  else {
    double v1 = 1.0;
  }
  id v2 = [*(id *)(a1 + 32) noItemsView];
  [v2 setAlpha:v1];
}

- (id)_newCellForHeaderTitle:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F42EA0]);
  id v6 = [MEMORY[0x1E4F42B58] cellConfiguration];
  if (![(HUMobileTimerObjectTableViewController *)self itemShouldDisplaySpinner]) {
    [v6 setText:v4];
  }
  if ([MEMORY[0x1E4F69758] shouldUseProxHandOffMaterials]) {
    [v5 tintColor];
  }
  else {
  id v7 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
  }
  id v8 = [v6 textProperties];
  [v8 setColor:v7];

  [v5 setContentConfiguration:v6];
  if ([(HUMobileTimerObjectTableViewController *)self itemShouldDisplaySpinner])
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v10 = [v5 contentView];
    [v10 addSubview:v9];

    char v11 = [v9 centerXAnchor];
    __int16 v12 = [v5 contentView];
    uint64_t v13 = [v12 centerXAnchor];
    double v14 = [v11 constraintEqualToAnchor:v13];
    [v14 setActive:1];

    id v15 = [v9 centerYAnchor];
    double v16 = [v5 contentView];
    double v17 = [v16 centerYAnchor];
    double v18 = [v15 constraintEqualToAnchor:v17];
    [v18 setActive:1];

    [v9 startAnimating];
  }
  double v19 = [MEMORY[0x1E4F427B0] listGroupedCellConfiguration];
  [v19 setBackgroundColorTransformer:&__block_literal_global_63];
  [v19 setCornerRadius:8.0];
  if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials])
  {
    double v20 = [MEMORY[0x1E4F5AE10] controlCenterTertiaryMaterial];
    [v19 setCustomView:v20];
  }
  [v5 setBackgroundConfiguration:v19];

  return v5;
}

uint64_t __65__HUMobileTimerObjectTableViewController__newCellForHeaderTitle___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E4F428B8], "hf_homePodControlCellBackgroundColor");
}

- (BOOL)_shouldAllowCellSelection
{
  id v2 = [MEMORY[0x1E4F69138] sharedInstance];
  if ([v2 hostProcess] == 100)
  {
  }
  else
  {
    unint64_t v3 = [MEMORY[0x1E4F69138] sharedInstance];
    uint64_t v4 = [v3 hostProcess];

    if (v4 != 3) {
      return 1;
    }
  }
  id v5 = (void *)MEMORY[0x1E4F69758];

  return [v5 isDeviceUnlocked];
}

- (void)_showSpinner:(BOOL)a3
{
  [(HUMobileTimerObjectTableViewController *)self setItemShouldDisplaySpinner:a3];

  [(HUMobileTimerObjectTableViewController *)self setRedrawSpinnerCell:1];
}

- (BOOL)_activateAccessoryForMobileTimerCreation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(HUMobileTimerObjectTableViewController *)self accessory];
  uint64_t v4 = objc_msgSend(v3, "hf_siriEndpointProfile");

  if (v4)
  {
    id v5 = [(HUMobileTimerObjectTableViewController *)self accessory];
    char v6 = objc_msgSend(v5, "hf_needsOnboarding");

    if (v6)
    {
      [(HUMobileTimerObjectTableViewController *)self _showSpinner:1];
      id v7 = HFLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = [(HUMobileTimerObjectTableViewController *)self accessory];
        *(_DWORD *)buf = 138412802;
        double v16 = self;
        __int16 v17 = 2080;
        double v18 = "-[HUMobileTimerObjectTableViewController _activateAccessoryForMobileTimerCreation]";
        __int16 v19 = 2112;
        double v20 = v8;
        _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "(%@)%s: Siri endpoint accessory %@ needs onboarding: kicking off Implicit Onboarding", buf, 0x20u);
      }
      id v9 = objc_alloc_init(MEMORY[0x1E4F2EB00]);
      objc_initWeak((id *)buf, self);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __82__HUMobileTimerObjectTableViewController__activateAccessoryForMobileTimerCreation__block_invoke;
      v13[3] = &unk_1E638B448;
      objc_copyWeak(&v14, (id *)buf);
      [v4 applyOnboardingSelections:v9 completionHandler:v13];
      objc_destroyWeak(&v14);
      objc_destroyWeak((id *)buf);
      LOBYTE(v10) = 0;
    }
    else
    {
      BOOL v10 = [(HUMobileTimerObjectTableViewController *)self _isSiriEndpointActive];
      id v9 = HFLogForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        char v11 = [(HUMobileTimerObjectTableViewController *)self accessory];
        *(_DWORD *)buf = 138413058;
        double v16 = self;
        __int16 v17 = 2080;
        double v18 = "-[HUMobileTimerObjectTableViewController _activateAccessoryForMobileTimerCreation]";
        __int16 v19 = 2112;
        double v20 = v11;
        __int16 v21 = 1024;
        BOOL v22 = v10;
        _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "(%@)%s: Siri endpoint accessory %@ is onboarded & active = %{BOOL}d", buf, 0x26u);
      }
    }
  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return v10;
}

void __82__HUMobileTimerObjectTableViewController__activateAccessoryForMobileTimerCreation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = HFLogForCategory();
  char v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412290;
      id v18 = v3;
      _os_log_error_impl(&dword_1BE345000, v6, OS_LOG_TYPE_ERROR, "[HMSiriEndpointProfile applyOnboardingSelections:completionHandler:] Implicit Onboarding failed with error: %@ - Add Timer/Alarm failed", (uint8_t *)&v17, 0xCu);
    }

    [WeakRetained _showSpinner:0];
    [WeakRetained _reloadTableViewWithExistingData];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = HMSiriEndpointOnboardingResultAsString();
      int v17 = 138412290;
      id v18 = v7;
      _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "[HMSiriEndpointProfile applyOnboardingSelections:completionHandler:] Implicit Onboarding succeeded with result: %@", (uint8_t *)&v17, 0xCu);
    }
    if ([WeakRetained _isSiriEndpointActive])
    {
      [WeakRetained _showSpinner:0];
      [WeakRetained _reloadTableViewWithExistingData];
      id v8 = HFLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [WeakRetained accessory];
        int v17 = 138412802;
        id v18 = WeakRetained;
        __int16 v19 = 2080;
        double v20 = "-[HUMobileTimerObjectTableViewController _activateAccessoryForMobileTimerCreation]_block_invoke";
        __int16 v21 = 2112;
        BOOL v22 = v9;
        _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "(%@)%s: Siri endpoint accessory %@ is onboarded & active", (uint8_t *)&v17, 0x20u);
      }
      [WeakRetained presentAddMobileTimerObjectViewControllerOnMainThread];
    }
    else
    {
      BOOL v10 = HFLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        char v11 = [WeakRetained accessory];
        int v17 = 138412802;
        id v18 = WeakRetained;
        __int16 v19 = 2080;
        double v20 = "-[HUMobileTimerObjectTableViewController _activateAccessoryForMobileTimerCreation]_block_invoke";
        __int16 v21 = 2112;
        BOOL v22 = v11;
        _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "(%@)%s: Siri endpoint accessory %@ is onboarded but NOT active, BEGINNING TO WAIT", (uint8_t *)&v17, 0x20u);
      }
      [WeakRetained setCreateNewMTObjectPendingSidekickActivation:1];
      id v12 = objc_alloc(MEMORY[0x1E4F1CB00]);
      uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
      id v14 = (void *)[v12 initWithFireDate:v13 interval:WeakRetained target:sel__accessoryActivationTimerFinished_ selector:0 userInfo:0 repeats:20.0];
      [WeakRetained setAccessoryActivationTimer:v14];

      id v15 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
      double v16 = [WeakRetained accessoryActivationTimer];
      [v15 addTimer:v16 forMode:*MEMORY[0x1E4F1C3A0]];
    }
  }
}

- (BOOL)_isSiriEndpointActive
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(HUMobileTimerObjectTableViewController *)self accessory];
  uint64_t v4 = objc_msgSend(v3, "hf_siriEndpointProfile");
  uint64_t v5 = [v4 sessionState];

  char v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(HUMobileTimerObjectTableViewController *)self accessory];
    int v9 = 138413314;
    BOOL v10 = self;
    __int16 v11 = 2080;
    id v12 = "-[HUMobileTimerObjectTableViewController _isSiriEndpointActive]";
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 1024;
    BOOL v16 = v5 == 1;
    __int16 v17 = 2048;
    uint64_t v18 = v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "(%@)%s: Siri endpoint accessory %@ isActive = %{BOOL}d state: %ld", (uint8_t *)&v9, 0x30u);
  }
  return v5 == 1;
}

- (void)_accessoryActivationTimerFinished:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (![(HUMobileTimerObjectTableViewController *)self createNewMTObjectPendingSidekickActivation])
  {
    uint64_t v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412546;
      BOOL v10 = self;
      __int16 v11 = 2080;
      id v12 = "-[HUMobileTimerObjectTableViewController _accessoryActivationTimerFinished:]";
      _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "(%@)%s: We shouldn't get here", (uint8_t *)&v9, 0x16u);
    }
    goto LABEL_10;
  }
  [(HUMobileTimerObjectTableViewController *)self _showSpinner:0];
  [(HUMobileTimerObjectTableViewController *)self _reloadTableViewWithExistingData];
  BOOL v4 = [(HUMobileTimerObjectTableViewController *)self _isSiriEndpointActive];
  uint64_t v5 = HFLogForCategory();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (v6)
    {
      id v8 = [(HUMobileTimerObjectTableViewController *)self accessory];
      int v9 = 138412802;
      BOOL v10 = self;
      __int16 v11 = 2080;
      id v12 = "-[HUMobileTimerObjectTableViewController _accessoryActivationTimerFinished:]";
      __int16 v13 = 2112;
      id v14 = v8;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "(%@)%s: Siri endpoint accessory %@ activation timer fired & is NOT activated - refreshing view to display unavailable text", (uint8_t *)&v9, 0x20u);
    }
LABEL_10:

    return;
  }
  if (v6)
  {
    id v7 = [(HUMobileTimerObjectTableViewController *)self accessory];
    int v9 = 138412802;
    BOOL v10 = self;
    __int16 v11 = 2080;
    id v12 = "-[HUMobileTimerObjectTableViewController _accessoryActivationTimerFinished:]";
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "(%@)%s: Siri endpoint accessory %@ activation timer fired & is activated - presenting add view controller...", (uint8_t *)&v9, 0x20u);
  }
  [(HUMobileTimerObjectTableViewController *)self presentAddMobileTimerObjectViewControllerOnMainThread];
}

- (void)_checkAndAddTimerObject
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HUMobileTimerObjectTableViewController *)self _activateAccessoryForMobileTimerCreation];
  BOOL v4 = HFLogForCategory();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v6 = 138412546;
      id v7 = self;
      __int16 v8 = 2080;
      int v9 = "-[HUMobileTimerObjectTableViewController _checkAndAddTimerObject]";
      _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(%@)%s: accessory active, kicking off New Mobile Timer object creation", (uint8_t *)&v6, 0x16u);
    }

    [(HUMobileTimerObjectTableViewController *)self presentAddMobileTimerObjectViewControllerOnMainThread];
  }
  else
  {
    if (v5)
    {
      int v6 = 138412546;
      id v7 = self;
      __int16 v8 = 2080;
      int v9 = "-[HUMobileTimerObjectTableViewController _checkAndAddTimerObject]";
      _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(%@)%s: accessory NOT active, kicking off reload", (uint8_t *)&v6, 0x16u);
    }

    [(HUMobileTimerObjectTableViewController *)self _reloadTableViewWithExistingData];
  }
}

- (void)didReceiveSettingsUpdatesForAccessoryWithIdentifier:(id)a3 settings:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![(HUMobileTimerObjectTableViewController *)self createNewMTObjectPendingSidekickActivation])
  {
    int v9 = HFLogForCategory();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    __int16 v13 = [(HUMobileTimerObjectTableViewController *)self accessory];
    int v15 = 138413058;
    BOOL v16 = self;
    __int16 v17 = 2080;
    uint64_t v18 = "-[HUMobileTimerObjectTableViewController didReceiveSettingsUpdatesForAccessoryWithIdentifier:settings:]";
    __int16 v19 = 2112;
    double v20 = v13;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "(%@)%s: ignoring for Accessory %@ because there are no pending attempts to create a MTObject (settings = %@)", (uint8_t *)&v15, 0x2Au);
LABEL_11:

    goto LABEL_12;
  }
  __int16 v8 = [(HUMobileTimerObjectTableViewController *)self accessory];
  int v9 = [v8 uniqueIdentifier];

  if (![v6 isEqual:v9]) {
    goto LABEL_12;
  }
  if (![(HUMobileTimerObjectTableViewController *)self _isSiriEndpointActive])
  {
    __int16 v13 = HFLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [(HUMobileTimerObjectTableViewController *)self accessory];
      int v15 = 138413058;
      BOOL v16 = self;
      __int16 v17 = 2080;
      uint64_t v18 = "-[HUMobileTimerObjectTableViewController didReceiveSettingsUpdatesForAccessoryWithIdentifier:settings:]";
      __int16 v19 = 2112;
      double v20 = v14;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "(%@)%s: Accessory %@ is still NOT activated (settings = %@)", (uint8_t *)&v15, 0x2Au);
    }
    goto LABEL_11;
  }
  uint64_t v10 = [(HUMobileTimerObjectTableViewController *)self accessoryActivationTimer];
  [v10 invalidate];

  [(HUMobileTimerObjectTableViewController *)self setAccessoryActivationTimer:0];
  [(HUMobileTimerObjectTableViewController *)self setCreateNewMTObjectPendingSidekickActivation:0];
  [(HUMobileTimerObjectTableViewController *)self _showSpinner:0];
  [(HUMobileTimerObjectTableViewController *)self _reloadTableViewWithExistingData];
  __int16 v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [(HUMobileTimerObjectTableViewController *)self accessory];
    int v15 = 138413058;
    BOOL v16 = self;
    __int16 v17 = 2080;
    uint64_t v18 = "-[HUMobileTimerObjectTableViewController didReceiveSettingsUpdatesForAccessoryWithIdentifier:settings:]";
    __int16 v19 = 2112;
    double v20 = v12;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "(%@)%s: Accessory %@ is now ACTIVATED (settings = %@)", (uint8_t *)&v15, 0x2Au);
  }
  [(HUMobileTimerObjectTableViewController *)self presentAddMobileTimerObjectViewControllerOnMainThread];
LABEL_12:
}

- (id)_baseMobileTimerObjectsFuture
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HUMobileTimerObjectTableViewController.m", 759, @"%s is an abstract method that must be overriden by subclass %@", "-[HUMobileTimerObjectTableViewController _baseMobileTimerObjectsFuture]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)_newCellForMTTimerObjectUUID:(id)a3
{
  BOOL v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, self, @"HUMobileTimerObjectTableViewController.m", 765, @"%s is an abstract method that must be overriden by subclass %@", "-[HUMobileTimerObjectTableViewController _newCellForMTTimerObjectUUID:]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)_canManagerControlAccessory
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HUMobileTimerObjectTableViewController.m", 771, @"%s is an abstract method that must be overriden by subclass %@", "-[HUMobileTimerObjectTableViewController _canManagerControlAccessory]", objc_opt_class() object file lineNumber description];

  BOOL v5 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v6 = MEMORY[0x1E4F1CC28];

  return (id)[v5 futureWithResult:v6];
}

- (id)_findTimerObjectForID:(id)a3
{
  BOOL v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, self, @"HUMobileTimerObjectTableViewController.m", 777, @"%s is an abstract method that must be overriden by subclass %@", "-[HUMobileTimerObjectTableViewController _findTimerObjectForID:]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (void)_removeTimerObjectAtIndexPath:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2, self, @"HUMobileTimerObjectTableViewController.m", 783, @"%s is an abstract method that must be overriden by subclass %@", "-[HUMobileTimerObjectTableViewController _removeTimerObjectAtIndexPath:]", objc_opt_class() object file lineNumber description];
}

- (void)presentAddMobileTimerObjectViewControllerOnMainThread
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HUMobileTimerObjectTableViewController.m", 788, @"%s is an abstract method that must be overriden by subclass %@", "-[HUMobileTimerObjectTableViewController presentAddMobileTimerObjectViewControllerOnMainThread]", objc_opt_class() object file lineNumber description];
}

- (HUPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->presentationDelegate);

  return (HUPresentationDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (HUQuickControlContentHelper)quickControlContentHelper
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->quickControlContentHelper);

  return (HUQuickControlContentHelper *)WeakRetained;
}

- (void)setQuickControlContentHelper:(id)a3
{
}

- (BOOL)wasControllableAtLastCheck
{
  return self->_wasControllableAtLastCheck;
}

- (void)setWasControllableAtLastCheck:(BOOL)a3
{
  self->_wasControllableAtLastCheck = a3;
}

- (NAFuture)checkAccessAndFetchDataFuture
{
  return self->_checkAccessAndFetchDataFuture;
}

- (void)setCheckAccessAndFetchDataFuture:(id)a3
{
}

- (unint64_t)accessoryAccessState
{
  return self->_accessoryAccessState;
}

- (void)setAccessoryAccessState:(unint64_t)a3
{
  self->_accessoryAccessState = a3;
}

- (HUMobileTimerContentUnavailableView)noItemsView
{
  return self->_noItemsView;
}

- (void)setNoItemsView:(id)a3
{
}

- (NSTimer)accessoryActivationTimer
{
  return self->_accessoryActivationTimer;
}

- (void)setAccessoryActivationTimer:(id)a3
{
}

- (BOOL)itemShouldDisplaySpinner
{
  return self->_itemShouldDisplaySpinner;
}

- (void)setItemShouldDisplaySpinner:(BOOL)a3
{
  self->_itemShouldDisplaySpinner = a3;
}

- (BOOL)redrawSpinnerCell
{
  return self->_redrawSpinnerCell;
}

- (void)setRedrawSpinnerCell:(BOOL)a3
{
  self->_redrawSpinnerCell = a3;
}

- (BOOL)createNewMTObjectPendingSidekickActivation
{
  return self->_createNewMTObjectPendingSidekickActivation;
}

- (void)setCreateNewMTObjectPendingSidekickActivation:(BOOL)a3
{
  self->_createNewMTObjectPendingSidekickActivation = a3;
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (void)setMediaProfileContainer:(id)a3
{
}

- (NSMutableArray)mobileTimerObjects
{
  return self->_mobileTimerObjects;
}

- (void)setMobileTimerObjects:(id)a3
{
}

- (NSArray)updatedMobileTimerObjects
{
  return self->_updatedMobileTimerObjects;
}

- (void)setUpdatedMobileTimerObjects:(id)a3
{
}

- (UITableViewDiffableDataSource)tableViewDataSource
{
  return self->_tableViewDataSource;
}

- (void)setTableViewDataSource:(id)a3
{
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
}

- (NAFuture)outstandingMobileTimerObjectsFuture
{
  return self->_outstandingMobileTimerObjectsFuture;
}

- (void)setOutstandingMobileTimerObjectsFuture:(id)a3
{
}

- (NSString)loadingItemsTitle
{
  return self->_loadingItemsTitle;
}

- (void)setLoadingItemsTitle:(id)a3
{
}

- (NSString)unavailableTitle
{
  return self->_unavailableTitle;
}

- (void)setUnavailableTitle:(id)a3
{
}

- (NSString)unavailableText
{
  return self->_unavailableText;
}

- (void)setUnavailableText:(id)a3
{
}

- (NSString)headerCellTitle
{
  return self->_headerCellTitle;
}

- (void)setHeaderCellTitle:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSUUID)headerUUID
{
  return self->_headerUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerUUID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_headerCellTitle, 0);
  objc_storeStrong((id *)&self->_unavailableText, 0);
  objc_storeStrong((id *)&self->_unavailableTitle, 0);
  objc_storeStrong((id *)&self->_loadingItemsTitle, 0);
  objc_storeStrong((id *)&self->_outstandingMobileTimerObjectsFuture, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_tableViewDataSource, 0);
  objc_storeStrong((id *)&self->_updatedMobileTimerObjects, 0);
  objc_storeStrong((id *)&self->_mobileTimerObjects, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
  objc_storeStrong((id *)&self->_accessoryActivationTimer, 0);
  objc_storeStrong((id *)&self->_noItemsView, 0);
  objc_storeStrong((id *)&self->_checkAccessAndFetchDataFuture, 0);
  objc_destroyWeak((id *)&self->quickControlContentHelper);

  objc_destroyWeak((id *)&self->presentationDelegate);
}

@end