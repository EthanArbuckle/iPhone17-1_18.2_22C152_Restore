@interface DSSharingPermissionsController
+ (void)initialize;
- (BOOL)isFindMyASource;
- (DSNavigationDelegate)delegate;
- (DSSharingPermissions)permissions;
- (DSSharingPermissionsController)init;
- (DSSourceRepository)repo;
- (NSError)cachedFetchError;
- (NSMutableDictionary)personIconCache;
- (NSMutableSet)selectedPeople;
- (NSMutableSet)selectedTypes;
- (OS_dispatch_queue)workQueue;
- (id)personForIndexPath:(id)a3;
- (id)sharingTypeForIndexPath:(id)a3;
- (id)tableIconForPerson:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)fetchCompletedTime;
- (void)_fetchCompletedWithError:(id)a3;
- (void)_pushNextPane;
- (void)_updateButton;
- (void)_updateTitle;
- (void)addUnsharedPerson:(id)a3;
- (void)addUnsharedSource:(id)a3 resources:(id)a4;
- (void)fetchSharingPermissions;
- (void)filterContentForSearchText:(id)a3 category:(int64_t)a4;
- (void)postAnalytics;
- (void)presentFetchErrorMessage:(id)a3;
- (void)registerForNotifications;
- (void)reloadTableViewData;
- (void)requestNewFetchImmediately:(BOOL)a3;
- (void)reviewSelectedSharing;
- (void)reviewSelectedSharingFlowCompleted;
- (void)searchBar:(id)a3 selectedScopeButtonIndexDidChange:(int64_t)a4;
- (void)setCachedFetchError:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFetchCompletedTime:(unint64_t)a3;
- (void)setFetchNeeded;
- (void)setPermissions:(id)a3;
- (void)setPersonIconCache:(id)a3;
- (void)setRepo:(id)a3;
- (void)setSelectedPeople:(id)a3;
- (void)setSelectedTypes:(id)a3;
- (void)setUrgentFetchNeeded;
- (void)setWorkQueue:(id)a3;
- (void)sharingStoppedForPerson:(id)a3 sourceNames:(id)a4;
- (void)sharingStoppedForType:(id)a3 people:(id)a4;
- (void)stopAllSharing;
- (void)stopSharingFailedWithError:(id)a3;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)unregisterForNotifications;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DSSharingPermissionsController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    DSLogSharingPermissions = (uint64_t)os_log_create("com.apple.DigitalSeparation", "DSSharingPermissions");
    MEMORY[0x270F9A758]();
  }
}

- (DSSharingPermissionsController)init
{
  v17.receiver = self;
  v17.super_class = (Class)DSSharingPermissionsController;
  v2 = [(DSTableWelcomeController *)&v17 initWithTitle:&stru_26E9097D0 detailText:&stru_26E9097D0 icon:0 adoptTableViewScrollView:1 shouldShowSearchBar:1];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F3A370]);
    [(DSSharingPermissionsController *)v2 setPermissions:v3];

    dispatch_queue_t v4 = dispatch_queue_create("SharingPermissionsControllerWork", 0);
    [(DSSharingPermissionsController *)v2 setWorkQueue:v4];

    id v5 = objc_alloc_init(MEMORY[0x263F3A380]);
    [(DSSharingPermissionsController *)v2 setRepo:v5];

    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    selectedPeople = v2->_selectedPeople;
    v2->_selectedPeople = v6;

    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    selectedTypes = v2->_selectedTypes;
    v2->_selectedTypes = v8;

    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    personIconCache = v2->_personIconCache;
    v2->_personIconCache = (NSMutableDictionary *)v10;

    v12 = DSUILocStringForKey(@"SKIP");
    v13 = +[DSUIUtilities setUpBoldButtonForController:v2 title:v12 target:v2 selector:sel__pushNextPane];
    [(DSTableWelcomeController *)v2 setBoldButton:v13];

    v14 = DSUILocStringForKey(@"STOP_ALL_SHARING");
    v15 = +[DSUIUtilities setUpLinkButtonForController:v2 title:v14 target:v2 selector:sel_stopAllSharing];
    [(DSTableWelcomeController *)v2 setLinkButton:v15];
  }
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DSSharingPermissionsController;
  [(OBTableWelcomeController *)&v4 viewWillAppear:a3];
  [(DSSharingPermissionsController *)self registerForNotifications];
  [(DSSharingPermissionsController *)self setFetchNeeded];
  [(DSSharingPermissionsController *)self _updateButton];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DSSharingPermissionsController;
  [(OBBaseWelcomeController *)&v6 viewDidAppear:a3];
  objc_super v4 = [(DSSharingPermissionsController *)self cachedFetchError];

  if (v4)
  {
    id v5 = [(DSSharingPermissionsController *)self cachedFetchError];
    [(DSSharingPermissionsController *)self presentFetchErrorMessage:v5];

    [(DSSharingPermissionsController *)self setCachedFetchError:0];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(DSSharingPermissionsController *)self postAnalytics];
  [(DSSharingPermissionsController *)self unregisterForNotifications];
  v5.receiver = self;
  v5.super_class = (Class)DSSharingPermissionsController;
  [(DSSharingPermissionsController *)&v5 viewDidDisappear:v3];
}

- (void)postAnalytics
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [(DSSharingPermissionsController *)self permissions];
  BOOL v3 = [v2 elapsedUnfinishedFetchesBySource];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = MEMORY[0x263EF8330];
        uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v9 = v4;
        AnalyticsSendEventLazy();
      }
      uint64_t v6 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v12, v16, 16, v10, 3221225472, __47__DSSharingPermissionsController_postAnalytics__block_invoke, &unk_264C6E9D0, v11);
    }
    while (v6);
  }
}

id __47__DSSharingPermissionsController_postAnalytics__block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v6[0] = @"sourceName";
  v6[1] = @"elapsedTime";
  v7[0] = v2;
  BOOL v3 = objc_msgSend(v1, "objectForKeyedSubscript:");
  v7[1] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)registerForNotifications
{
  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_setUrgentFetchNeeded name:*MEMORY[0x263F833B8] object:0];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_didEnterBackground name:*MEMORY[0x263F83330] object:0];
}

- (void)unregisterForNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];
}

- (void)setFetchNeeded
{
}

- (void)setUrgentFetchNeeded
{
}

- (void)requestNewFetchImmediately:(BOOL)a3
{
  int v4 = 0;
  atomic_compare_exchange_strong(&self->_fetchState, (unsigned int *)&v4, 1u);
  if (a3)
  {
    [(DSSharingPermissionsController *)self setFetchCompletedTime:0];
    [(DSSharingPermissionsController *)self setCachedFetchError:0];
  }
  [(DSSharingPermissionsController *)self fetchSharingPermissions];
}

- (void)viewDidLoad
{
  v12[2] = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)DSSharingPermissionsController;
  [(DSTableWelcomeController *)&v11 viewDidLoad];
  id v3 = DSUILocStringForKey(@"BY_PERSON");
  v12[0] = v3;
  int v4 = DSUILocStringForKey(@"BY_TYPE");
  v12[1] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  uint64_t v6 = [(DSTableWelcomeController *)self searchController];
  uint64_t v7 = [v6 searchBar];
  [v7 setScopeButtonTitles:v5];

  v8 = DSUILocStringForKey(@"SEARCH_SHARING_PEOPLE_PLACEHOLDER");
  id v9 = [(DSTableWelcomeController *)self searchController];
  uint64_t v10 = [v9 searchBar];
  [v10 setPlaceholder:v8];
}

- (void)fetchSharingPermissions
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134349312;
  uint64_t v4 = a1;
  __int16 v5 = 2050;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_235BFC000, log, OS_LOG_TYPE_FAULT, "mach_continuous_time walked backwards (now: %{public}llu, then: %{public}llu)", (uint8_t *)&v3, 0x16u);
}

void __57__DSSharingPermissionsController_fetchSharingPermissions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__DSSharingPermissionsController_fetchSharingPermissions__block_invoke_2;
  v5[3] = &unk_264C6EA98;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v7);
}

void __57__DSSharingPermissionsController_fetchSharingPermissions__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _fetchCompletedWithError:*(void *)(a1 + 32)];
}

- (void)_fetchCompletedWithError:(id)a3
{
  id v6 = a3;
  atomic_store(0, (unsigned int *)&self->_fetchState);
  [(DSSharingPermissionsController *)self setFetchCompletedTime:clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW)];
  [(DSTableWelcomeController *)self stopContentSpinner];
  if (v6) {
    [(DSSharingPermissionsController *)self presentFetchErrorMessage:v6];
  }
  id v4 = [(DSSharingPermissionsController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    __int16 v5 = [(DSSharingPermissionsController *)self permissions];
    [v4 setFetchedSharingPermissions:v5];
  }
  [(DSSharingPermissionsController *)self reloadTableViewData];
}

- (void)presentFetchErrorMessage:(id)a3
{
  id v4 = a3;
  __int16 v5 = [(DSSharingPermissionsController *)self navigationController];
  id v6 = [v5 visibleViewController];

  id v7 = DSLogSharingPermissions;
  if (v6 == self)
  {
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_ERROR)) {
      -[DSSharingPermissionsController presentFetchErrorMessage:]((uint64_t)v4, v7);
    }
    v8 = objc_msgSend(MEMORY[0x263F82418], "ds_alertControllerWithFetchSharingError:", v4);
    [(DSTableWelcomeController *)self presentErrorAlertController:v8];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_235BFC000, v7, OS_LOG_TYPE_INFO, "Caching fetch error until we are the visible view controller", v9, 2u);
    }
    [(DSSharingPermissionsController *)self setCachedFetchError:v4];
  }
}

- (void)reloadTableViewData
{
  id v3 = [(DSSharingPermissionsController *)self permissions];
  [v3 sort];

  id v4 = [(DSSharingPermissionsController *)self permissions];
  -[DSTableWelcomeController setIsModelEmpty:](self, "setIsModelEmpty:", [v4 peopleCountWithFilter:0] == 0);

  __int16 v5 = [(OBTableWelcomeController *)self tableView];
  id v6 = [MEMORY[0x263F088D0] indexSetWithIndex:0];
  [v5 reloadSections:v6 withRowAnimation:100];

  id v7 = [(OBTableWelcomeController *)self tableView];
  [v7 layoutIfNeeded];

  v8 = [(DSSharingPermissionsController *)self selectedPeople];
  id v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = [(DSSharingPermissionsController *)self permissions];
  objc_super v11 = [v10 allPeople];
  long long v12 = [v9 setWithArray:v11];
  [v8 intersectSet:v12];

  long long v13 = [(DSSharingPermissionsController *)self selectedTypes];
  long long v14 = (void *)MEMORY[0x263EFFA08];
  long long v15 = [(DSSharingPermissionsController *)self permissions];
  v16 = [v15 allSharingTypes];
  uint64_t v17 = [v14 setWithArray:v16];
  [v13 intersectSet:v17];

  [(DSSharingPermissionsController *)self _updateButton];
}

- (BOOL)isFindMyASource
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v2 = [(DSSharingPermissionsController *)self permissions];
  id v3 = [v2 allSharingTypes];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    uint64_t v7 = *MEMORY[0x263F3A320];
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v9 = [*(id *)(*((void *)&v14 + 1) + 8 * i) source];
        uint64_t v10 = [v9 name];
        char v11 = [v10 isEqualToString:v7];

        if (v11)
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (void)stopAllSharing
{
  v15[2] = *MEMORY[0x263EF8340];
  id v3 = DSUILocStringForKey(@"STOP_ALL_SHARING_CONFIRMATION");
  if ([(DSSharingPermissionsController *)self isFindMyASource])
  {
    v15[0] = v3;
    uint64_t v4 = DSUILocStringForKey(@"FIND_MY_NOTIFICATION_WARNING");
    v15[1] = v4;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
    uint64_t v6 = [v5 componentsJoinedByString:@" "];

    id v3 = (void *)v6;
  }
  uint64_t v7 = [MEMORY[0x263F82418] alertControllerWithTitle:0 message:v3 preferredStyle:0];
  v8 = (void *)MEMORY[0x263F82400];
  id v9 = DSUILocStringForKey(@"CANCEL");
  uint64_t v10 = [v8 actionWithTitle:v9 style:1 handler:&__block_literal_global_2];

  char v11 = (void *)MEMORY[0x263F82400];
  BOOL v12 = DSUILocStringForKey(@"STOP_ALL_SHARING_BY_TYPE_ALERT_LABEL");
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __48__DSSharingPermissionsController_stopAllSharing__block_invoke_2;
  v14[3] = &unk_264C6E848;
  v14[4] = self;
  long long v13 = [v11 actionWithTitle:v12 style:2 handler:v14];

  [v7 addAction:v13];
  [v7 addAction:v10];
  [(DSSharingPermissionsController *)self presentViewController:v7 animated:1 completion:0];
}

void __48__DSSharingPermissionsController_stopAllSharing__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) buttonTray];
  [v4 showButtonsBusy];

  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v5 = [*(id *)(a1 + 32) permissions];
  uint64_t v6 = [*(id *)(a1 + 32) workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__DSSharingPermissionsController_stopAllSharing__block_invoke_3;
  void v7[3] = &unk_264C6E8B8;
  objc_copyWeak(&v8, &location);
  v7[4] = *(void *)(a1 + 32);
  [v5 stopAllSharingOnQueue:v6 completion:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __48__DSSharingPermissionsController_stopAllSharing__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v27 = a3;
  uint64_t v28 = a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = [WeakRetained permissions];
  v31 = [v7 allPeople];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v30 = *(void *)v43;
    do
    {
      uint64_t v10 = 0;
      do
      {
        char v11 = WeakRetained;
        if (*(void *)v43 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v42 + 1) + 8 * v10);
        long long v13 = objc_msgSend(MEMORY[0x263EFF9C0], "set", v27, v28);
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v14 = v31;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v38 objects:v47 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v39;
          do
          {
            uint64_t v18 = 0;
            do
            {
              if (*(void *)v39 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = [*(id *)(*((void *)&v38 + 1) + 8 * v18) sharedResourcesForSourceName:v12];
              [v13 unionSet:v19];

              ++v18;
            }
            while (v16 != v18);
            uint64_t v16 = [v14 countByEnumeratingWithState:&v38 objects:v47 count:16];
          }
          while (v16);
        }

        id WeakRetained = v11;
        [v11 addUnsharedSource:v12 resources:v13];

        ++v10;
      }
      while (v10 != v9);
      uint64_t v9 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v9);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v20 = v31;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v35;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * v24), "displayName", v27, v28);
        [WeakRetained addUnsharedPerson:v25];

        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v46 count:16];
    }
    while (v22);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__DSSharingPermissionsController_stopAllSharing__block_invoke_4;
  block[3] = &unk_264C6EAE8;
  block[4] = *(void *)(v28 + 32);
  block[5] = WeakRetained;
  id v33 = v27;
  id v26 = v27;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __48__DSSharingPermissionsController_stopAllSharing__block_invoke_4(id *a1)
{
  uint64_t v2 = [a1[4] buttonTray];
  [v2 showButtonsAvailable];

  [a1[5] reloadTableViewData];
  if ([a1[6] count])
  {
    id v4 = [MEMORY[0x263F3A360] errorWithCode:2 underlyingErrors:a1[6]];
    [a1[5] stopSharingFailedWithError:v4];
  }
  else
  {
    id v3 = a1[5];
    [v3 _pushNextPane];
  }
}

- (void)reviewSelectedSharing
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = [(OBTableWelcomeController *)self tableView];
  id v4 = [v3 indexPathsForSelectedRows];
  id v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_369];

  uint64_t v6 = [(DSTableWelcomeController *)self searchController];
  uint64_t v7 = [v6 searchBar];
  uint64_t v8 = [v7 selectedScopeButtonIndex];

  uint64_t v9 = [MEMORY[0x263EFF980] array];
  uint64_t v10 = [MEMORY[0x263EFF980] array];
  if (v8 == 1)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v18 = v5;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v27;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = -[DSSharingPermissionsController sharingTypeForIndexPath:](self, "sharingTypeForIndexPath:", *(void *)(*((void *)&v26 + 1) + 8 * v22), (void)v26);
          if (v23) {
            [v10 addObject:v23];
          }

          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v20);
    }

    if ([v10 count])
    {
      uint64_t v17 = +[DSSharingPermissionsDetailController detailControllerWithSharingTypes:v10 startingViewController:self delegate:self];
      goto LABEL_25;
    }
  }
  else if (!v8)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v11 = v5;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v31;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = [(DSSharingPermissionsController *)self personForIndexPath:*(void *)(*((void *)&v30 + 1) + 8 * v15)];
          if (v16) {
            [v9 addObject:v16];
          }

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v13);
    }

    if ([v9 count])
    {
      uint64_t v17 = +[DSSharingPermissionsDetailController detailControllerWithPeople:v9 startingViewController:self delegate:self];
LABEL_25:
      uint64_t v24 = (void *)v17;
      v25 = [(DSSharingPermissionsController *)self navigationController];
      [v25 pushViewController:v24 animated:1];
    }
  }
}

uint64_t __55__DSSharingPermissionsController_reviewSelectedSharing__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 row];
  if (v6 >= [v5 row])
  {
    uint64_t v8 = [v4 row];
    uint64_t v7 = v8 > [v5 row];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

- (id)personForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(DSSharingPermissionsController *)self permissions];
  uint64_t v6 = [v4 row];

  uint64_t v7 = objc_msgSend(v5, "person:withFilter:", v6, -[DSTableWelcomeController isFiltering](self, "isFiltering"));

  return v7;
}

- (id)sharingTypeForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(DSSharingPermissionsController *)self permissions];
  uint64_t v6 = [v4 row];

  uint64_t v7 = objc_msgSend(v5, "sharingType:withFilter:", v6, -[DSTableWelcomeController isFiltering](self, "isFiltering"));

  return v7;
}

- (id)tableIconForPerson:(id)a3
{
  id v4 = a3;
  id v5 = [v4 contact];
  uint64_t v6 = [v5 identifier];

  if (v6)
  {
    uint64_t v7 = [(DSSharingPermissionsController *)self personIconCache];
    uint64_t v8 = [v7 objectForKeyedSubscript:v6];

    if (!v8)
    {
      uint64_t v8 = [v4 iconForTable];
      uint64_t v9 = [(DSSharingPermissionsController *)self personIconCache];
      [v9 setObject:v8 forKeyedSubscript:v6];
    }
    id v10 = v8;
  }
  else
  {
    id v10 = [v4 iconForTable];
  }

  return v10;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v7 = [a3 searchBar];
  id v4 = [v7 text];
  id v5 = [(DSTableWelcomeController *)self searchController];
  uint64_t v6 = [v5 searchBar];
  -[DSSharingPermissionsController filterContentForSearchText:category:](self, "filterContentForSearchText:category:", v4, [v6 selectedScopeButtonIndex]);
}

- (void)searchBar:(id)a3 selectedScopeButtonIndexDidChange:(int64_t)a4
{
  id v18 = a3;
  if (a4 == 1)
  {
    uint64_t v6 = DSUILocStringForKey(@"SHARING_PERMISSIONS_BY_TYPE_DETAIL");
    id v7 = DSUILocStringForKey(@"SHARING_PERMISSIONS_INFORMATION");
    uint64_t v8 = @"SEARCH_SHARING_INFORMATION_PLACEHOLDER";
    goto LABEL_5;
  }
  if (!a4)
  {
    uint64_t v6 = DSUILocStringForKey(@"SHARING_PERMISSIONS_BY_PEOPLE_DETAIL");
    id v7 = DSUILocStringForKey(@"SHARING_PERMISSIONS_PEOPLE");
    uint64_t v8 = @"SEARCH_SHARING_PEOPLE_PLACEHOLDER";
LABEL_5:
    uint64_t v9 = DSUILocStringForKey(v8);
    id v10 = [(DSTableWelcomeController *)self searchController];
    id v11 = [v10 searchBar];
    [v11 setPlaceholder:v9];

    goto LABEL_7;
  }
  uint64_t v6 = 0;
  id v7 = 0;
LABEL_7:
  uint64_t v12 = [(DSSharingPermissionsController *)self headerView];
  [v12 setTitle:v7];

  uint64_t v13 = [(DSSharingPermissionsController *)self headerView];
  [v13 setDetailText:v6];

  uint64_t v14 = [(DSTableWelcomeController *)self searchController];
  uint64_t v15 = [v14 searchBar];
  uint64_t v16 = [v15 text];
  [(DSSharingPermissionsController *)self filterContentForSearchText:v16 category:a4];

  uint64_t v17 = [(OBTableWelcomeController *)self tableView];
  [v17 layoutIfNeeded];
}

- (void)filterContentForSearchText:(id)a3 category:(int64_t)a4
{
  v20[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a4 == 1)
  {
    uint64_t v12 = [MEMORY[0x263F08A98] predicateWithFormat:@"displayName contains[c] %@", v6];
    id v7 = [(DSSharingPermissionsController *)self permissions];
    [v7 filterSharingTypesWithPredicate:v12];
LABEL_5:

    if (v12) {
      goto LABEL_9;
    }
    goto LABEL_6;
  }
  if (!a4)
  {
    id v7 = [MEMORY[0x263F08A98] predicateWithFormat:@"displayName contains[c] %@", v6];
    uint64_t v8 = (void *)MEMORY[0x263F08A98];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __70__DSSharingPermissionsController_filterContentForSearchText_category___block_invoke;
    v18[3] = &unk_264C6EB30;
    id v19 = v6;
    uint64_t v9 = [v8 predicateWithBlock:v18];
    id v10 = (void *)MEMORY[0x263F08730];
    v20[0] = v7;
    v20[1] = v9;
    id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
    uint64_t v12 = [v10 orPredicateWithSubpredicates:v11];

    uint64_t v13 = [(DSSharingPermissionsController *)self permissions];
    [v13 filterPeopleWithPredicate:v12];

    goto LABEL_5;
  }
LABEL_6:
  uint64_t v14 = DSLogSharingPermissions;
  if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_FAULT)) {
    -[DSSharingPermissionsController filterContentForSearchText:category:](a4, v14);
  }
  uint64_t v12 = 0;
LABEL_9:
  uint64_t v15 = [(DSSharingPermissionsController *)self headerView];
  [v15 setTitle:&stru_26E9097D0];

  uint64_t v16 = [(DSSharingPermissionsController *)self headerView];
  [v16 setDetailText:&stru_26E9097D0];

  uint64_t v17 = [(OBTableWelcomeController *)self tableView];
  [v17 reloadData];

  [(DSSharingPermissionsController *)self _updateButton];
}

uint64_t __70__DSSharingPermissionsController_filterContentForSearchText_category___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 contact];
  id v5 = [v4 phoneticGivenName];
  if ([v5 localizedCaseInsensitiveContainsString:*(void *)(a1 + 32)])
  {
    uint64_t v6 = 1;
  }
  else
  {
    id v7 = [v3 contact];
    uint64_t v8 = [v7 phoneticMiddleName];
    if ([v8 localizedCaseInsensitiveContainsString:*(void *)(a1 + 32)])
    {
      uint64_t v6 = 1;
    }
    else
    {
      uint64_t v9 = [v3 contact];
      id v10 = [v9 phoneticFamilyName];
      uint64_t v6 = [v10 localizedCaseInsensitiveContainsString:*(void *)(a1 + 32)];
    }
  }

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(DSTableWelcomeController *)self searchController];
  id v7 = [v6 searchBar];
  uint64_t v8 = [v7 selectedScopeButtonIndex];

  if (v8 == 1)
  {
    uint64_t v9 = [(DSSharingPermissionsController *)self sharingTypeForIndexPath:v5];
    id v10 = [v9 displayName];
    id v11 = [v9 localizedDetailText];
    uint64_t v12 = [v9 iconForTable];
    uint64_t v15 = [(DSSharingPermissionsController *)self selectedTypes];
    int v16 = [v15 containsObject:v9];

    if (!v16)
    {
LABEL_7:

      goto LABEL_9;
    }
LABEL_6:
    uint64_t v17 = [(OBTableWelcomeController *)self tableView];
    [v17 selectRowAtIndexPath:v5 animated:1 scrollPosition:0];

    goto LABEL_7;
  }
  if (!v8)
  {
    uint64_t v9 = [(DSSharingPermissionsController *)self personForIndexPath:v5];
    id v10 = [v9 displayName];
    id v11 = [v9 localizedDetail];
    uint64_t v12 = [(DSSharingPermissionsController *)self tableIconForPerson:v9];
    uint64_t v13 = [(DSSharingPermissionsController *)self selectedPeople];
    char v14 = [v13 containsObject:v9];

    if ((v14 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v12 = 0;
  id v11 = 0;
  id v10 = 0;
LABEL_9:
  id v18 = [(OBTableWelcomeController *)self tableView];
  id v19 = +[DSIconTableViewCell iconTableViewCellFromTableView:v18 withText:v10 detail:v11 icon:v12];

  [v19 setAccessoryType:0];
  return v19;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a3;
  signed int v6 = atomic_load((unsigned int *)&self->_fetchState);
  if ((unint64_t)(v6 - 1) < 2) {
    goto LABEL_11;
  }
  id v7 = [(DSTableWelcomeController *)self searchController];
  uint64_t v8 = [v7 searchBar];
  uint64_t v9 = [v8 selectedScopeButtonIndex];

  if (v9 == 1)
  {
    id v10 = [(DSSharingPermissionsController *)self permissions];
    uint64_t v11 = objc_msgSend(v10, "sharingTypesCountWithFilter:", -[DSTableWelcomeController isFiltering](self, "isFiltering"));
    goto LABEL_6;
  }
  if (!v9)
  {
    id v10 = [(DSSharingPermissionsController *)self permissions];
    uint64_t v11 = objc_msgSend(v10, "peopleCountWithFilter:", -[DSTableWelcomeController isFiltering](self, "isFiltering"));
LABEL_6:
    int64_t v12 = v11;

    if ([(DSTableWelcomeController *)self isFiltering])
    {
      if (v12)
      {
        [(DSTableWelcomeController *)self hideNoResultsView];
        goto LABEL_12;
      }
      goto LABEL_10;
    }
    if (v12)
    {
      [(DSTableWelcomeController *)self hideNoSharingView];
      [(DSTableWelcomeController *)self setIsModelEmpty:0];
      [(DSSharingPermissionsController *)self _updateTitle];
      [(DSSharingPermissionsController *)self _updateButton];
      goto LABEL_12;
    }
    goto LABEL_15;
  }
  if ([(DSTableWelcomeController *)self isFiltering])
  {
LABEL_10:
    uint64_t v13 = [(DSTableWelcomeController *)self searchController];
    char v14 = [v13 searchBar];
    uint64_t v15 = [v14 text];
    [(DSTableWelcomeController *)self showNoResultsViewWithSearchText:v15];

LABEL_11:
    int64_t v12 = 0;
    goto LABEL_12;
  }
LABEL_15:
  id v35 = v5;
  id v17 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v18 = [(DSSharingPermissionsController *)self repo];
  id v19 = [v18 sources];

  uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v37 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = (void *)MEMORY[0x263F3A378];
        v25 = [*(id *)(*((void *)&v36 + 1) + 8 * i) name];
        long long v26 = [v24 sourceDescriptorForSource:v25];
        long long v27 = [v26 localizedAppName];

        [v17 addObject:v27];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v21);
  }

  long long v28 = (void *)MEMORY[0x263F08950];
  long long v29 = [v17 allObjects];
  long long v30 = [v28 localizedStringByJoiningStrings:v29];

  long long v31 = NSString;
  long long v32 = DSUILocStringForKey(@"NO_SHARING_INFORMATION");
  long long v33 = objc_msgSend(v31, "localizedStringWithFormat:", v32, v30);

  long long v34 = [MEMORY[0x263F827E8] systemImageNamed:@"person.3.fill"];
  [(DSTableWelcomeController *)self showNoSharingViewWithText:v33 image:v34];

  [(DSTableWelcomeController *)self setIsModelEmpty:1];
  [(DSSharingPermissionsController *)self _updateButton];

  int64_t v12 = 0;
  id v5 = v35;
LABEL_12:

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v11 = a4;
  id v5 = [(DSTableWelcomeController *)self searchController];
  signed int v6 = [v5 searchBar];
  uint64_t v7 = [v6 selectedScopeButtonIndex];

  if (v7 == 1)
  {
    uint64_t v8 = [(DSSharingPermissionsController *)self selectedTypes];
    uint64_t v9 = [(DSSharingPermissionsController *)self sharingTypeForIndexPath:v11];
  }
  else
  {
    if (v7) {
      goto LABEL_6;
    }
    uint64_t v8 = [(DSSharingPermissionsController *)self selectedPeople];
    uint64_t v9 = [(DSSharingPermissionsController *)self personForIndexPath:v11];
  }
  id v10 = (void *)v9;
  [v8 addObject:v9];

LABEL_6:
  [(DSSharingPermissionsController *)self _updateButton];
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v11 = a4;
  id v5 = [(DSTableWelcomeController *)self searchController];
  signed int v6 = [v5 searchBar];
  uint64_t v7 = [v6 selectedScopeButtonIndex];

  if (v7 == 1)
  {
    uint64_t v8 = [(DSSharingPermissionsController *)self selectedTypes];
    uint64_t v9 = [(DSSharingPermissionsController *)self sharingTypeForIndexPath:v11];
  }
  else
  {
    if (v7) {
      goto LABEL_6;
    }
    uint64_t v8 = [(DSSharingPermissionsController *)self selectedPeople];
    uint64_t v9 = [(DSSharingPermissionsController *)self personForIndexPath:v11];
  }
  id v10 = (void *)v9;
  [v8 removeObject:v9];

LABEL_6:
  [(DSSharingPermissionsController *)self _updateButton];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if (![(DSTableWelcomeController *)self isKeyboardActive]
    && ![(DSTableWelcomeController *)self isFiltering]
    || [(DSTableWelcomeController *)self isShowingNoResultsView])
  {
    v15.receiver = self;
    v15.super_class = (Class)DSSharingPermissionsController;
    uint64_t v7 = [(DSTableWelcomeController *)&v15 tableView:v6 viewForHeaderInSection:a4];
    goto LABEL_12;
  }
  uint64_t v8 = [(DSTableWelcomeController *)self searchController];
  uint64_t v9 = [v8 searchBar];
  uint64_t v10 = [v9 selectedScopeButtonIndex];

  if (v10)
  {
    if (v10 != 1)
    {
      int64_t v12 = &stru_26E9097D0;
      goto LABEL_11;
    }
    id v11 = @"SEARCH_SHARING_TITLE_INFORMATION";
  }
  else
  {
    id v11 = @"SEARCH_SHARING_TITLE_PEOPLE";
  }
  DSUILocStringForKey(v11);
  int64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_11:
  uint64_t v7 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
  uint64_t v13 = [v7 defaultContentConfiguration];
  [v13 setText:v12];
  [v7 setContentConfiguration:v13];

LABEL_12:
  return v7;
}

- (void)_updateTitle
{
  id v3 = [(DSTableWelcomeController *)self searchController];
  id v4 = [v3 searchBar];
  uint64_t v5 = [v4 selectedScopeButtonIndex];

  if (v5 == 1)
  {
    uint64_t v9 = [(DSSharingPermissionsController *)self headerView];
    uint64_t v10 = DSUILocStringForKey(@"SHARING_PERMISSIONS_INFORMATION");
    [v9 setTitle:v10];

    id v12 = [(DSSharingPermissionsController *)self headerView];
    uint64_t v8 = @"SHARING_PERMISSIONS_BY_TYPE_DETAIL";
  }
  else
  {
    if (v5) {
      return;
    }
    id v6 = [(DSSharingPermissionsController *)self headerView];
    uint64_t v7 = DSUILocStringForKey(@"SHARING_PERMISSIONS_PEOPLE");
    [v6 setTitle:v7];

    id v12 = [(DSSharingPermissionsController *)self headerView];
    uint64_t v8 = @"SHARING_PERMISSIONS_BY_PEOPLE_DETAIL";
  }
  id v11 = DSUILocStringForKey(v8);
  [v12 setDetailText:v11];
}

- (void)_pushNextPane
{
  id v3 = [(DSSharingPermissionsController *)self delegate];
  [v3 pushNextPane];

  id v4 = [(DSTableWelcomeController *)self searchController];
  [v4 setActive:0];
}

- (void)_updateButton
{
  id v3 = [(DSTableWelcomeController *)self searchController];
  id v4 = [v3 searchBar];
  uint64_t v5 = [v4 selectedScopeButtonIndex];

  if (v5) {
    [(DSSharingPermissionsController *)self selectedTypes];
  }
  else {
  id v6 = [(DSSharingPermissionsController *)self selectedPeople];
  }
  uint64_t v7 = [v6 count];

  uint64_t v8 = [(DSTableWelcomeController *)self boldButton];
  [v8 removeTarget:0 action:0 forControlEvents:0xFFFFFFFFLL];

  if (v7)
  {
    uint64_t v9 = [(DSTableWelcomeController *)self boldButton];
    uint64_t v10 = DSUILocStringForKey(@"REVIEW_SHARING");
    [v9 setTitle:v10 forState:0];

    id v11 = [(DSTableWelcomeController *)self boldButton];
    [v11 addTarget:self action:sel_reviewSelectedSharing forControlEvents:64];
  }
  else
  {
    if ([(DSTableWelcomeController *)self isModelEmpty]) {
      id v12 = @"CONTINUE";
    }
    else {
      id v12 = @"SKIP";
    }
    id v11 = DSUILocStringForKey(v12);
    uint64_t v13 = [(DSTableWelcomeController *)self boldButton];
    [v13 setTitle:v11 forState:0];

    char v14 = [(DSTableWelcomeController *)self boldButton];
    [v14 addTarget:self action:sel__pushNextPane forControlEvents:64];
  }
  [(DSTableWelcomeController *)self hideButtonsIfSearching];
}

- (void)sharingStoppedForPerson:(id)a3 sourceNames:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263EFF980] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v24;
    *(void *)&long long v11 = 138543362;
    long long v22 = v11;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * v14);
        int v16 = [(DSSharingPermissionsController *)self repo];
        id v17 = [v16 objectForKeyedSubscript:v15];

        if (v17)
        {
          [v8 addObject:v17];
          id v18 = [v6 sharedResourcesForSourceName:v15];
          [(DSSharingPermissionsController *)self addUnsharedSource:v15 resources:v18];
        }
        else
        {
          id v19 = DSLogSharingPermissions;
          if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v22;
            uint64_t v28 = v15;
            _os_log_fault_impl(&dword_235BFC000, v19, OS_LOG_TYPE_FAULT, "Failed to find source named %{public}@", buf, 0xCu);
          }
        }

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v12);
  }

  uint64_t v20 = [v6 displayName];
  [(DSSharingPermissionsController *)self addUnsharedPerson:v20];

  uint64_t v21 = [(DSSharingPermissionsController *)self permissions];
  [v21 removePerson:v6 sources:v8];

  [(DSSharingPermissionsController *)self reloadTableViewData];
}

- (void)sharingStoppedForType:(id)a3 people:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(DSSharingPermissionsController *)self permissions];
  [v8 removeSharingType:v6 people:v7];

  id v9 = [MEMORY[0x263EFF9C0] set];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v7;
  uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * v13);
        uint64_t v15 = [v6 source];
        int v16 = [v15 name];
        id v17 = [v14 sharedResourcesForSourceName:v16];
        [v9 unionSet:v17];

        id v18 = [v14 displayName];
        [(DSSharingPermissionsController *)self addUnsharedPerson:v18];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  id v19 = [v6 source];
  uint64_t v20 = [v19 name];
  [(DSSharingPermissionsController *)self addUnsharedSource:v20 resources:v9];

  [(DSSharingPermissionsController *)self reloadTableViewData];
}

- (void)stopSharingFailedWithError:(id)a3
{
  objc_msgSend(MEMORY[0x263F82418], "ds_alertControllerWithStopSharingError:", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(DSTableWelcomeController *)self presentErrorAlertController:v4];
}

- (void)reviewSelectedSharingFlowCompleted
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v3 = [(OBTableWelcomeController *)self tableView];
  id v4 = [v3 indexPathsForSelectedRows];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v27 + 1) + 8 * v8);
        uint64_t v10 = [(OBTableWelcomeController *)self tableView];
        [v10 deselectRowAtIndexPath:v9 animated:0];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v6);
  }

  id v11 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  [(DSSharingPermissionsController *)self setSelectedPeople:v11];

  id v12 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  [(DSSharingPermissionsController *)self setSelectedTypes:v12];

  uint64_t v13 = [(DSSharingPermissionsController *)self delegate];
  [v13 pushPaneAfterPaneType:objc_opt_class()];

  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v15 = [(DSSharingPermissionsController *)self navigationController];
  int v16 = [v15 viewControllers];

  uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v23 + 1) + 8 * v20);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [v14 addObject:v21];
        }
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v18);
  }

  long long v22 = [(DSSharingPermissionsController *)self navigationController];
  [v22 setViewControllers:v14];
}

- (void)addUnsharedSource:(id)a3 resources:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(DSSharingPermissionsController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [v8 unsharedResourcesBySource];
    [v9 setObject:v7 forKeyedSubscript:v6];
  }
  id v11 = v6;
  id v10 = v6;
  AnalyticsSendEventLazy();
}

id __62__DSSharingPermissionsController_addUnsharedSource_resources___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  id v4 = @"source";
  v5[0] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (void)addUnsharedPerson:(id)a3
{
  id v6 = a3;
  id v4 = [(DSSharingPermissionsController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [v4 unsharedPeople];
    [v5 addObject:v6];
  }
}

- (DSNavigationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DSNavigationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DSSourceRepository)repo
{
  return self->_repo;
}

- (void)setRepo:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (DSSharingPermissions)permissions
{
  return self->_permissions;
}

- (void)setPermissions:(id)a3
{
}

- (NSMutableSet)selectedPeople
{
  return self->_selectedPeople;
}

- (void)setSelectedPeople:(id)a3
{
}

- (NSMutableSet)selectedTypes
{
  return self->_selectedTypes;
}

- (void)setSelectedTypes:(id)a3
{
}

- (unint64_t)fetchCompletedTime
{
  return self->_fetchCompletedTime;
}

- (void)setFetchCompletedTime:(unint64_t)a3
{
  self->_fetchCompletedTime = a3;
}

- (NSError)cachedFetchError
{
  return self->_cachedFetchError;
}

- (void)setCachedFetchError:(id)a3
{
}

- (NSMutableDictionary)personIconCache
{
  return self->_personIconCache;
}

- (void)setPersonIconCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personIconCache, 0);
  objc_storeStrong((id *)&self->_cachedFetchError, 0);
  objc_storeStrong((id *)&self->_selectedTypes, 0);
  objc_storeStrong((id *)&self->_selectedPeople, 0);
  objc_storeStrong((id *)&self->_permissions, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_repo, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)presentFetchErrorMessage:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_235BFC000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch permissions because %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)filterContentForSearchText:(uint64_t)a1 category:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134349056;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_235BFC000, a2, OS_LOG_TYPE_FAULT, "Failed to find a predicate for search scope %{public}ld", (uint8_t *)&v2, 0xCu);
}

@end