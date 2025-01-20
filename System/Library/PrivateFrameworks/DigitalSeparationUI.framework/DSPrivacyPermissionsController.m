@interface DSPrivacyPermissionsController
- (BOOL)isFiltered;
- (DSAppSharing)appSharing;
- (DSNavigationDelegate)delegate;
- (DSPrivacyPermissionsController)init;
- (NSArray)apps;
- (NSArray)filteredApps;
- (NSArray)filteredSensors;
- (NSArray)sensors;
- (NSMutableSet)selectedApps;
- (NSMutableSet)selectedSensors;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)scope;
- (void)_pushNextPane;
- (void)_updateButton;
- (void)_updateTitle;
- (void)addUnsharedPermissions:(id)a3 andApps:(id)a4;
- (void)collectPermissionsByType;
- (void)filterContentForSearchText:(id)a3 category:(int64_t)a4;
- (void)handleResetErrors:(id)a3 pushNextPane:(BOOL)a4;
- (void)reloadData;
- (void)resetAllPermissions;
- (void)resetSelectedPermissions;
- (void)returnFromDetailAndDeleteApp:(id)a3;
- (void)returnFromDetailAndResetPermissionForSelectedApps:(id)a3 permission:(id)a4;
- (void)returnFromDetailAndResetSelectedPermissions:(id)a3 forApp:(id)a4;
- (void)returnFromDetailAndStopAllSharingForPermission:(id)a3;
- (void)searchBar:(id)a3 selectedScopeButtonIndexDidChange:(int64_t)a4;
- (void)setAppSharing:(id)a3;
- (void)setApps:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFilteredApps:(id)a3;
- (void)setFilteredSensors:(id)a3;
- (void)setIsFiltered:(BOOL)a3;
- (void)setScope:(unint64_t)a3;
- (void)setSelectedApps:(id)a3;
- (void)setSelectedSensors:(id)a3;
- (void)setSensors:(id)a3;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DSPrivacyPermissionsController

- (DSPrivacyPermissionsController)init
{
  v15.receiver = self;
  v15.super_class = (Class)DSPrivacyPermissionsController;
  v2 = [(DSTableWelcomeController *)&v15 initWithTitle:&stru_26E9097D0 detailText:&stru_26E9097D0 icon:0 adoptTableViewScrollView:1 shouldShowSearchBar:1];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    selectedApps = v2->_selectedApps;
    v2->_selectedApps = v3;

    v5 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    sensors = v2->_sensors;
    v2->_sensors = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    selectedSensors = v2->_selectedSensors;
    v2->_selectedSensors = v7;

    v9 = DSUILocStringForKey(@"SKIP");
    v10 = +[DSUIUtilities setUpBoldButtonForController:v2 title:v9 target:v2 selector:sel__pushNextPane];
    [(DSTableWelcomeController *)v2 setBoldButton:v10];

    v11 = DSUILocStringForKey(@"STOP_ALL_APP_SHARING");
    v12 = +[DSUIUtilities setUpLinkButtonForController:v2 title:v11 target:v2 selector:sel_resetAllPermissions];
    [(DSTableWelcomeController *)v2 setLinkButton:v12];

    v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 addObserver:v2 selector:sel_reloadData name:*MEMORY[0x263F833B8] object:0];
  }
  return v2;
}

- (void)viewDidLoad
{
  v21[2] = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)DSPrivacyPermissionsController;
  [(DSTableWelcomeController *)&v20 viewDidLoad];
  v3 = DSUILocStringForKey(@"BY_APP");
  v21[0] = v3;
  v4 = DSUILocStringForKey(@"BY_PERMISSION");
  v21[1] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
  v6 = [(DSTableWelcomeController *)self searchController];
  v7 = [v6 searchBar];
  [v7 setScopeButtonTitles:v5];

  v8 = DSUILocStringForKey(@"SEARCH_PRIVACY_APPS_PLACEHOLDER");
  v9 = [(DSTableWelcomeController *)self searchController];
  v10 = [v9 searchBar];
  [v10 setPlaceholder:v8];

  id v11 = objc_alloc_init(MEMORY[0x263F3A388]);
  v12 = (DSAppSharing *)[objc_alloc(MEMORY[0x263F3A348]) initWithTCCStore:v11];
  appSharing = self->_appSharing;
  self->_appSharing = v12;

  [(DSTableWelcomeController *)self startContentSpinner];
  objc_initWeak(&location, self);
  v14 = self->_appSharing;
  objc_super v15 = [MEMORY[0x263F3A390] allUserVisibleApps];
  id v16 = MEMORY[0x263EF83A0];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __45__DSPrivacyPermissionsController_viewDidLoad__block_invoke;
  v17[3] = &unk_264C6E8B8;
  objc_copyWeak(&v18, &location);
  v17[4] = self;
  [(DSAppSharing *)v14 collectPermissionsForApps:v15 queue:MEMORY[0x263EF83A0] handler:v17];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __45__DSPrivacyPermissionsController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setApps:v5];
    [v8 stopContentSpinner];
    if ([v6 count])
    {
      v9 = DSUILocStringForKey(@"COLLECT_APP_PERMISSIONS_FAILED_TITLE");
      v10 = DSUILocStringForKey(@"COLLECT_APP_PERMISSIONS_FAILED");
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __45__DSPrivacyPermissionsController_viewDidLoad__block_invoke_3;
      v11[3] = &unk_264C6E848;
      v11[4] = *(void *)(a1 + 32);
      [v8 presentErrorAlertWithTitle:v9 message:v10 continueHandler:&__block_literal_global_0 tryAgainHandler:v11];
    }
  }
}

uint64_t __45__DSPrivacyPermissionsController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadData];
}

- (void)resetAllPermissions
{
  v3 = (void *)MEMORY[0x263F82418];
  v4 = DSUILocStringForKey(@"RESET_ALL_PERMISSIONS_CONFIRMATION");
  id v5 = [v3 alertControllerWithTitle:0 message:v4 preferredStyle:0];

  id v6 = (void *)MEMORY[0x263F82400];
  v7 = DSUILocStringForKey(@"CANCEL");
  v8 = [v6 actionWithTitle:v7 style:1 handler:&__block_literal_global_335];

  v9 = (void *)MEMORY[0x263F82400];
  v10 = DSUILocStringForKey(@"STOP_ALL_APP_SHARING_CONFIRMATION");
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __53__DSPrivacyPermissionsController_resetAllPermissions__block_invoke_2;
  v12[3] = &unk_264C6E848;
  v12[4] = self;
  id v11 = [v9 actionWithTitle:v10 style:2 handler:v12];

  [v5 addAction:v11];
  [v5 addAction:v8];
  [(DSPrivacyPermissionsController *)self presentViewController:v5 animated:1 completion:0];
}

void __53__DSPrivacyPermissionsController_resetAllPermissions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) buttonTray];
  [v4 showButtonsBusy];

  objc_initWeak(&location, *(id *)(a1 + 32));
  id v5 = [*(id *)(a1 + 32) appSharing];
  id v6 = (void *)MEMORY[0x263EFFA08];
  v7 = [MEMORY[0x263F3A390] tccServices];
  v8 = [v6 setWithArray:v7];
  v9 = [MEMORY[0x263F3A390] allUserVisibleApps];
  uint64_t v10 = MEMORY[0x263EF83A0];
  id v11 = MEMORY[0x263EF83A0];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __53__DSPrivacyPermissionsController_resetAllPermissions__block_invoke_3;
  v12[3] = &unk_264C6E8E0;
  v12[4] = *(void *)(a1 + 32);
  objc_copyWeak(&v13, &location);
  [v5 resetPermissions:v8 forApps:v9 queue:v10 handler:v12];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __53__DSPrivacyPermissionsController_resetAllPermissions__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = (void *)MEMORY[0x263F3A390];
  id v6 = a2;
  v7 = [v5 tccServices];
  v8 = [v4 setWithArray:v7];
  v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = [*(id *)(a1 + 32) apps];
  id v11 = [v9 setWithArray:v10];
  [v3 addUnsharedPermissions:v8 andApps:v11];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleResetErrors:v6 pushNextPane:1];
}

- (void)resetSelectedPermissions
{
  id v3 = [(DSPrivacyPermissionsController *)self buttonTray];
  [v3 showButtonsBusy];

  objc_initWeak(&location, self);
  unint64_t scope = self->_scope;
  if (!scope)
  {
    id v5 = [(DSPrivacyPermissionsController *)self appSharing];
    id v6 = (void *)MEMORY[0x263EFFA08];
    v7 = [MEMORY[0x263F3A390] tccServices];
    v8 = [v6 setWithArray:v7];
    v9 = [(DSPrivacyPermissionsController *)self selectedApps];
    uint64_t v10 = [v9 valueForKey:@"appID"];
    uint64_t v11 = MEMORY[0x263EF83A0];
    id v12 = MEMORY[0x263EF83A0];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __58__DSPrivacyPermissionsController_resetSelectedPermissions__block_invoke;
    v26[3] = &unk_264C6E8E0;
    v26[4] = self;
    objc_copyWeak(&v27, &location);
    [v5 resetPermissions:v8 forApps:v10 queue:v11 handler:v26];

    objc_destroyWeak(&v27);
    unint64_t scope = self->_scope;
  }
  if (scope == 1)
  {
    id v13 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    v14 = [(DSPrivacyPermissionsController *)self selectedSensors];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __58__DSPrivacyPermissionsController_resetSelectedPermissions__block_invoke_2;
    v24[3] = &unk_264C6E908;
    id v15 = v13;
    id v25 = v15;
    [v14 enumerateObjectsUsingBlock:v24];

    id v16 = [(DSPrivacyPermissionsController *)self appSharing];
    v17 = [MEMORY[0x263F3A390] allUserVisibleApps];
    uint64_t v18 = MEMORY[0x263EF83A0];
    id v19 = MEMORY[0x263EF83A0];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __58__DSPrivacyPermissionsController_resetSelectedPermissions__block_invoke_3;
    void v21[3] = &unk_264C6E930;
    v21[4] = self;
    id v20 = v15;
    id v22 = v20;
    objc_copyWeak(&v23, &location);
    [v16 resetPermissions:v20 forApps:v17 queue:v18 handler:v21];

    objc_destroyWeak(&v23);
  }
  objc_destroyWeak(&location);
}

void __58__DSPrivacyPermissionsController_resetSelectedPermissions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = (void *)MEMORY[0x263F3A390];
  id v6 = a2;
  v7 = [v5 tccServices];
  v8 = [v4 setWithArray:v7];
  v9 = [*(id *)(a1 + 32) selectedApps];
  [v3 addUnsharedPermissions:v8 andApps:v9];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleResetErrors:v6 pushNextPane:1];
}

void __58__DSPrivacyPermissionsController_resetSelectedPermissions__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 tccPermission];
  [v2 addObject:v3];
}

void __58__DSPrivacyPermissionsController_resetSelectedPermissions__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = (void *)MEMORY[0x263EFFA08];
  id v6 = a2;
  v7 = [v3 apps];
  v8 = [v5 setWithArray:v7];
  [v3 addUnsharedPermissions:v4 andApps:v8];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained handleResetErrors:v6 pushNextPane:1];
}

- (void)returnFromDetailAndResetSelectedPermissions:(id)a3 forApp:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(DSPrivacyPermissionsController *)self buttonTray];
  [v8 showButtonsBusy];

  id v9 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __85__DSPrivacyPermissionsController_returnFromDetailAndResetSelectedPermissions_forApp___block_invoke;
  v24[3] = &unk_264C6E958;
  id v10 = v9;
  id v25 = v10;
  [v6 enumerateObjectsUsingBlock:v24];
  objc_initWeak(&location, self);
  uint64_t v11 = [(DSPrivacyPermissionsController *)self appSharing];
  id v12 = (void *)MEMORY[0x263EFFA08];
  id v13 = [v7 appID];
  v14 = [v12 setWithObject:v13];
  uint64_t v15 = MEMORY[0x263EF83A0];
  id v16 = MEMORY[0x263EF83A0];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __85__DSPrivacyPermissionsController_returnFromDetailAndResetSelectedPermissions_forApp___block_invoke_2;
  v19[3] = &unk_264C6E980;
  v19[4] = self;
  id v17 = v10;
  id v20 = v17;
  id v18 = v7;
  id v21 = v18;
  objc_copyWeak(&v22, &location);
  [v11 resetPermissions:v17 forApps:v14 queue:v15 handler:v19];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __85__DSPrivacyPermissionsController_returnFromDetailAndResetSelectedPermissions_forApp___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 tccPermission];
  [v2 addObject:v3];
}

void __85__DSPrivacyPermissionsController_returnFromDetailAndResetSelectedPermissions_forApp___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = a2;
  v8 = [v5 setWithObject:v6];
  [v3 addUnsharedPermissions:v4 andApps:v8];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained handleResetErrors:v7 pushNextPane:0];
}

- (void)returnFromDetailAndDeleteApp:(id)a3
{
  id v4 = a3;
  id v5 = [(DSPrivacyPermissionsController *)self appSharing];
  uint64_t v6 = [v4 appID];

  id v7 = [v5 deleteApp:v6 forTest:0];

  if (v7 && [v7 code] == 8)
  {
    v8 = objc_msgSend(MEMORY[0x263F82418], "ds_alertControllerWithAppDeletionError:", v7);
    id v9 = (void *)MEMORY[0x263F82400];
    id v10 = DSUILocStringForKey(@"OK");
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __63__DSPrivacyPermissionsController_returnFromDetailAndDeleteApp___block_invoke;
    v14[3] = &unk_264C6E848;
    v14[4] = self;
    uint64_t v11 = [v9 actionWithTitle:v10 style:1 handler:v14];
    [v8 addAction:v11];

    [(DSPrivacyPermissionsController *)self presentViewController:v8 animated:1 completion:0];
  }
  [(DSPrivacyPermissionsController *)self reloadData];
  id v12 = [(DSPrivacyPermissionsController *)self navigationController];
  id v13 = (id)[v12 popViewControllerAnimated:1];
}

void __63__DSPrivacyPermissionsController_returnFromDetailAndDeleteApp___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) buttonTray];
  [v1 showButtonsAvailable];
}

- (void)returnFromDetailAndResetPermissionForSelectedApps:(id)a3 permission:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(DSPrivacyPermissionsController *)self buttonTray];
  [v8 showButtonsBusy];

  id v9 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __95__DSPrivacyPermissionsController_returnFromDetailAndResetPermissionForSelectedApps_permission___block_invoke;
  v24[3] = &unk_264C6E9A8;
  id v10 = v9;
  id v25 = v10;
  [v6 enumerateObjectsUsingBlock:v24];
  objc_initWeak(&location, self);
  uint64_t v11 = [(DSPrivacyPermissionsController *)self appSharing];
  id v12 = (void *)MEMORY[0x263EFFA08];
  id v13 = [v7 tccPermission];
  v14 = [v12 setWithObject:v13];
  uint64_t v15 = MEMORY[0x263EF83A0];
  id v16 = MEMORY[0x263EF83A0];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __95__DSPrivacyPermissionsController_returnFromDetailAndResetPermissionForSelectedApps_permission___block_invoke_2;
  v19[3] = &unk_264C6E980;
  v19[4] = self;
  id v17 = v7;
  id v20 = v17;
  id v18 = v6;
  id v21 = v18;
  objc_copyWeak(&v22, &location);
  [v11 resetPermissions:v14 forApps:v10 queue:v15 handler:v19];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __95__DSPrivacyPermissionsController_returnFromDetailAndResetPermissionForSelectedApps_permission___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 appID];
  [v2 addObject:v3];
}

void __95__DSPrivacyPermissionsController_returnFromDetailAndResetPermissionForSelectedApps_permission___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = *(void **)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v6 = a2;
  id v7 = [v5 tccPermission];
  v8 = [v3 setWithObject:v7];
  id v9 = [MEMORY[0x263EFFA08] setWithArray:*(void *)(a1 + 48)];
  [v4 addUnsharedPermissions:v8 andApps:v9];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained handleResetErrors:v6 pushNextPane:0];
}

- (void)returnFromDetailAndStopAllSharingForPermission:(id)a3
{
  id v4 = a3;
  id v5 = [(DSPrivacyPermissionsController *)self buttonTray];
  [v5 showButtonsBusy];

  objc_initWeak(&location, self);
  id v6 = [(DSPrivacyPermissionsController *)self appSharing];
  id v7 = (void *)MEMORY[0x263EFFA08];
  v8 = [v4 tccPermission];
  id v9 = [v7 setWithObject:v8];
  id v10 = [MEMORY[0x263F3A390] allUserVisibleApps];
  uint64_t v11 = MEMORY[0x263EF83A0];
  id v12 = MEMORY[0x263EF83A0];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __81__DSPrivacyPermissionsController_returnFromDetailAndStopAllSharingForPermission___block_invoke;
  v14[3] = &unk_264C6E930;
  v14[4] = self;
  id v13 = v4;
  id v15 = v13;
  objc_copyWeak(&v16, &location);
  [v6 resetPermissions:v9 forApps:v10 queue:v11 handler:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __81__DSPrivacyPermissionsController_returnFromDetailAndStopAllSharingForPermission___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = *(void **)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v6 = a2;
  id v7 = [v5 tccPermission];
  v8 = [v3 setWithObject:v7];
  id v9 = (void *)MEMORY[0x263EFFA08];
  id v10 = [*(id *)(a1 + 32) apps];
  uint64_t v11 = [v9 setWithArray:v10];
  [v4 addUnsharedPermissions:v8 andApps:v11];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained handleResetErrors:v6 pushNextPane:0];
}

- (void)handleResetErrors:(id)a3 pushNextPane:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 count])
  {
    id v7 = [MEMORY[0x263F3A360] errorWithCode:4 underlyingErrors:v6];
    v8 = objc_msgSend(MEMORY[0x263F82418], "ds_alertControllerWithStopPermissionSharingError:", v7);
    id v9 = (void *)MEMORY[0x263F82400];
    id v10 = DSUILocStringForKey(@"OK");
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __65__DSPrivacyPermissionsController_handleResetErrors_pushNextPane___block_invoke;
    v15[3] = &unk_264C6E848;
    v15[4] = self;
    uint64_t v11 = [v9 actionWithTitle:v10 style:1 handler:v15];
    [v8 addAction:v11];

    [(DSPrivacyPermissionsController *)self presentViewController:v8 animated:1 completion:0];
  }
  else
  {
    [(DSPrivacyPermissionsController *)self reloadData];
    if (v4)
    {
      [(DSPrivacyPermissionsController *)self _pushNextPane];
    }
    else
    {
      id v12 = [(DSPrivacyPermissionsController *)self navigationController];
      id v13 = (id)[v12 popViewControllerAnimated:1];
    }
    v14 = [(DSPrivacyPermissionsController *)self buttonTray];
    [v14 showButtonsAvailable];
  }
}

void __65__DSPrivacyPermissionsController_handleResetErrors_pushNextPane___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263EFF9C0] set];
  [*(id *)(a1 + 32) setSelectedSensors:v2];

  id v3 = [MEMORY[0x263EFF9C0] set];
  [*(id *)(a1 + 32) setSelectedApps:v3];

  [*(id *)(a1 + 32) _updateButton];
  [*(id *)(a1 + 32) reloadData];
  id v4 = [*(id *)(a1 + 32) buttonTray];
  [v4 showButtonsAvailable];
}

- (void)collectPermissionsByType
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_apps;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(MEMORY[0x263F3A340], "ensureApp:inSensorDict:", *(void *)(*((void *)&v11 + 1) + 8 * v8++), v3, (void)v11);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  id v9 = [MEMORY[0x263F3A340] sortSensorDict:v3];
  sensors = self->_sensors;
  self->_sensors = v9;
}

- (void)setApps:(id)a3
{
  objc_storeStrong((id *)&self->_apps, a3);
  id v5 = a3;
  uint64_t v6 = [v5 count];

  [(DSTableWelcomeController *)self setIsModelEmpty:v6 == 0];
  [(DSPrivacyPermissionsController *)self collectPermissionsByType];
  uint64_t v7 = [(OBTableWelcomeController *)self tableView];
  [v7 reloadData];

  [(DSPrivacyPermissionsController *)self _updateButton];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DSPrivacyPermissionsController;
  [(OBTableWelcomeController *)&v4 viewWillAppear:a3];
  [(DSPrivacyPermissionsController *)self _updateButton];
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v7 = [a3 searchBar];
  objc_super v4 = [v7 text];
  id v5 = [(DSTableWelcomeController *)self searchController];
  uint64_t v6 = [v5 searchBar];
  -[DSPrivacyPermissionsController filterContentForSearchText:category:](self, "filterContentForSearchText:category:", v4, [v6 selectedScopeButtonIndex]);
}

- (void)searchBar:(id)a3 selectedScopeButtonIndexDidChange:(int64_t)a4
{
  uint64_t v6 = [(DSPrivacyPermissionsController *)self headerView];
  if (a4)
  {
    id v7 = DSUILocStringForKey(@"PRIVACY_PERMISSIONS_INFORMATION");
    [v6 setTitle:v7];

    uint64_t v8 = [(DSPrivacyPermissionsController *)self headerView];
    id v9 = DSUILocStringForKey(@"PRIVACY_PERMISSIONS_DETAIL_PERMISSIONS");
    [v8 setDetailText:v9];

    id v10 = @"SEARCH_PRIVACY_INFORMATION_PLACEHOLDER";
  }
  else
  {
    long long v11 = DSUILocStringForKey(@"PRIVACY_PERMISSIONS_APPS");
    [v6 setTitle:v11];

    long long v12 = [(DSPrivacyPermissionsController *)self headerView];
    long long v13 = DSUILocStringForKey(@"PRIVACY_PERMISSIONS_DETAIL_APPS");
    [v12 setDetailText:v13];

    id v10 = @"SEARCH_PRIVACY_APPS_PLACEHOLDER";
  }
  long long v14 = DSUILocStringForKey(v10);
  id v15 = [(DSTableWelcomeController *)self searchController];
  uint64_t v16 = [v15 searchBar];
  [v16 setPlaceholder:v14];

  id v17 = [(DSTableWelcomeController *)self searchController];
  id v18 = [v17 searchBar];
  id v19 = [v18 text];
  [(DSPrivacyPermissionsController *)self filterContentForSearchText:v19 category:a4];

  self->_unint64_t scope = a4;
  [(DSPrivacyPermissionsController *)self _updateButton];
}

- (void)filterContentForSearchText:(id)a3 category:(int64_t)a4
{
  if (self->_scope)
  {
    id v10 = [MEMORY[0x263F08A98] predicateWithFormat:@"localizedName contains[c] %@", a4, a3];
    id v5 = [(DSPrivacyPermissionsController *)self sensors];
    uint64_t v6 = [v5 filteredArrayUsingPredicate:v10];
    [(DSPrivacyPermissionsController *)self setFilteredSensors:v6];
  }
  else
  {
    id v10 = [MEMORY[0x263F08A98] predicateWithFormat:@"displayName contains[c] %@", a4, a3];
    id v5 = [(DSPrivacyPermissionsController *)self apps];
    uint64_t v6 = [v5 filteredArrayUsingPredicate:v10];
    [(DSPrivacyPermissionsController *)self setFilteredApps:v6];
  }

  id v7 = [(DSPrivacyPermissionsController *)self headerView];
  [v7 setTitle:&stru_26E9097D0];

  uint64_t v8 = [(DSPrivacyPermissionsController *)self headerView];
  [v8 setDetailText:&stru_26E9097D0];

  id v9 = [(OBTableWelcomeController *)self tableView];
  [v9 reloadData];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  unint64_t scope = self->_scope;
  BOOL v7 = [(DSTableWelcomeController *)self isFiltering];
  if (scope == 1)
  {
    if (v7) {
      [(DSPrivacyPermissionsController *)self filteredSensors];
    }
    else {
    uint64_t v8 = [(DSPrivacyPermissionsController *)self sensors];
    }
    id v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));

    id v10 = (void *)MEMORY[0x263F3A340];
    long long v11 = [(DSPrivacyPermissionsController *)self apps];
    long long v12 = [v10 localizedDescriptionFromApps:v11 permission:v9];

    long long v13 = (void *)MEMORY[0x263F3A340];
    long long v14 = [v9 tccPermission];
    id v15 = [v13 iconForPermission:v14 tableFormat:1];

    uint64_t v16 = [(OBTableWelcomeController *)self tableView];
    uint64_t v17 = [v9 localizedName];
    id v18 = +[DSIconTableViewCell iconTableViewCellFromTableView:v16 withText:v17 detail:v12 icon:v15];

    [v18 setAccessoryType:4];
    [v18 setEditingAccessoryType:4];
    id v19 = [(DSPrivacyPermissionsController *)self selectedSensors];
    LOBYTE(v17) = [v19 containsObject:v9];

    if ((v17 & 1) == 0) {
      goto LABEL_9;
    }
  }
  else
  {
    if (v7) {
      [(DSPrivacyPermissionsController *)self filteredApps];
    }
    else {
    id v23 = [(DSPrivacyPermissionsController *)self apps];
    }
    id v9 = objc_msgSend(v23, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));

    long long v12 = [MEMORY[0x263F3A340] localizedDescriptionFromPermissions:v9];
    v24 = [v9 appID];
    id v15 = +[DSUIUtilities appIconForAppID:v24 format:0];

    id v25 = [(OBTableWelcomeController *)self tableView];
    v26 = [v9 displayName];
    id v18 = +[DSIconTableViewCell iconTableViewCellFromTableView:v25 withText:v26 detail:v12 icon:v15];

    [v18 setAccessoryType:4];
    [v18 setEditingAccessoryType:4];
    id v27 = [(DSPrivacyPermissionsController *)self selectedApps];
    LODWORD(v26) = [v27 containsObject:v9];

    if (!v26) {
      goto LABEL_9;
    }
  }
  id v20 = [(OBTableWelcomeController *)self tableView];
  [v20 selectRowAtIndexPath:v5 animated:1 scrollPosition:0];

LABEL_9:
  id v21 = v18;

  return v21;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = a3;
  unint64_t scope = self->_scope;
  BOOL v7 = [(DSTableWelcomeController *)self isFiltering];
  if (scope)
  {
    if (v7) {
      [(DSPrivacyPermissionsController *)self filteredSensors];
    }
    else {
      [(DSPrivacyPermissionsController *)self sensors];
    }
  }
  else if (v7)
  {
    [(DSPrivacyPermissionsController *)self filteredApps];
  }
  else
  {
    [(DSPrivacyPermissionsController *)self apps];
  uint64_t v8 = };
  id v9 = v8;
  int64_t v10 = [v8 count];

  if ([(DSTableWelcomeController *)self isFiltering])
  {
    if (v10)
    {
      [(DSTableWelcomeController *)self hideNoResultsView];
    }
    else
    {
      long long v11 = [(DSTableWelcomeController *)self searchController];
      long long v12 = [v11 searchBar];
      long long v13 = [v12 text];
      [(DSTableWelcomeController *)self showNoResultsViewWithSearchText:v13];
    }
  }
  else if (v10)
  {
    [(DSTableWelcomeController *)self hideNoSharingView];
    [(DSTableWelcomeController *)self setIsModelEmpty:0];
    [(DSPrivacyPermissionsController *)self _updateButton];
    [(DSPrivacyPermissionsController *)self _updateTitle];
  }
  else
  {
    long long v14 = DSUILocStringForKey(@"NO_SHARING_APPS");
    id v15 = [MEMORY[0x263F827E8] _systemImageNamed:@"app.3.stack.3d.fill"];
    [(DSTableWelcomeController *)self showNoSharingViewWithText:v14 image:v15];

    [(DSTableWelcomeController *)self setIsModelEmpty:1];
    [(DSPrivacyPermissionsController *)self _updateButton];
  }

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  unint64_t scope = self->_scope;
  BOOL v8 = [(DSTableWelcomeController *)self isFiltering];
  if (scope)
  {
    id v9 = [(DSPrivacyPermissionsController *)self selectedSensors];
    if (v8) {
      [(DSPrivacyPermissionsController *)self filteredSensors];
    }
    else {
      [(DSPrivacyPermissionsController *)self sensors];
    }
  }
  else
  {
    id v9 = [(DSPrivacyPermissionsController *)self selectedApps];
    if (v8) {
      [(DSPrivacyPermissionsController *)self filteredApps];
    }
    else {
      [(DSPrivacyPermissionsController *)self apps];
    }
  int64_t v10 = };
  long long v11 = v10;
  long long v12 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  [v9 addObject:v12];

  [(DSPrivacyPermissionsController *)self _updateButton];
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  unint64_t scope = self->_scope;
  BOOL v8 = [(DSTableWelcomeController *)self isFiltering];
  if (scope)
  {
    id v9 = [(DSPrivacyPermissionsController *)self selectedSensors];
    if (v8) {
      [(DSPrivacyPermissionsController *)self filteredSensors];
    }
    else {
      [(DSPrivacyPermissionsController *)self sensors];
    }
  }
  else
  {
    id v9 = [(DSPrivacyPermissionsController *)self selectedApps];
    if (v8) {
      [(DSPrivacyPermissionsController *)self filteredApps];
    }
    else {
      [(DSPrivacyPermissionsController *)self apps];
    }
  int64_t v10 = };
  long long v11 = v10;
  long long v12 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  [v9 removeObject:v12];

  [(DSPrivacyPermissionsController *)self _updateButton];
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v21 = a4;
  unint64_t scope = self->_scope;
  BOOL v6 = [(DSTableWelcomeController *)self isFiltering];
  if (scope)
  {
    if (v6) {
      [(DSPrivacyPermissionsController *)self filteredSensors];
    }
    else {
    BOOL v7 = [(DSPrivacyPermissionsController *)self sensors];
    }
    BOOL v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v21, "row"));

    id v9 = [DSPrivacyPermissionDetailController alloc];
    int64_t v10 = [v8 localizedName];
    long long v11 = NSString;
    long long v12 = DSUILocStringForKey(@"PRIVACY_PERMISSIONS_INFORMATION_DETAIL");
    id v13 = [v8 localizedName];
    long long v14 = objc_msgSend(v11, "localizedStringWithFormat:", v12, v13);
    id v15 = [(DSPrivacyPermissionsController *)self apps];
    uint64_t v16 = [(DSPrivacyPermissionDetailController *)v9 initWithTitle:v10 detailText:v14 symbolName:0 permission:v8 apps:v15];
  }
  else
  {
    if (v6) {
      [(DSPrivacyPermissionsController *)self filteredApps];
    }
    else {
    uint64_t v17 = [(DSPrivacyPermissionsController *)self apps];
    }
    BOOL v8 = objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v21, "row"));

    id v18 = [DSPrivacyAppDetailController alloc];
    int64_t v10 = [v8 displayName];
    id v19 = NSString;
    long long v12 = DSUILocStringForKey(@"PRIVACY_PERMISSIONS_APP_DETAIL");
    id v13 = [v8 displayName];
    long long v14 = objc_msgSend(v19, "localizedStringWithFormat:", v12, v13);
    uint64_t v16 = [(DSPrivacyAppDetailController *)v18 initWithTitle:v10 detailText:v14 symbolName:0 app:v8];
  }

  [(DSPrivacyPermissionDetailController *)v16 setDelegate:self];
  id v20 = [(DSPrivacyPermissionsController *)self navigationController];
  [v20 pushViewController:v16 animated:1];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if (([(DSTableWelcomeController *)self isKeyboardActive]
     || [(DSTableWelcomeController *)self isFiltering])
    && ![(DSTableWelcomeController *)self isShowingNoResultsView])
  {
    if (self->_scope) {
      BOOL v8 = @"SEARCH_PRIVACY_TITLE_INFORMATION";
    }
    else {
      BOOL v8 = @"SEARCH_PRIVACY_TITLE_APPS";
    }
    id v9 = DSUILocStringForKey(v8);
    BOOL v7 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    int64_t v10 = [v7 defaultContentConfiguration];
    [v10 setText:v9];
    [v7 setContentConfiguration:v10];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)DSPrivacyPermissionsController;
    BOOL v7 = [(DSTableWelcomeController *)&v12 tableView:v6 viewForHeaderInSection:a4];
  }

  return v7;
}

- (void)reloadData
{
  objc_initWeak(&location, self);
  appSharing = self->_appSharing;
  objc_super v4 = [MEMORY[0x263F3A390] allUserVisibleApps];
  uint64_t v5 = MEMORY[0x263EF83A0];
  id v6 = MEMORY[0x263EF83A0];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__DSPrivacyPermissionsController_reloadData__block_invoke;
  v7[3] = &unk_264C6E8B8;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  [(DSAppSharing *)appSharing collectPermissionsForApps:v4 queue:v5 handler:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __44__DSPrivacyPermissionsController_reloadData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = [v6 count];

  if (v8)
  {
    id v9 = DSUILocStringForKey(@"COLLECT_APP_PERMISSIONS_FAILED_TITLE");
    int64_t v10 = DSUILocStringForKey(@"COLLECT_APP_PERMISSIONS_FAILED");
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __44__DSPrivacyPermissionsController_reloadData__block_invoke_3;
    v19[3] = &unk_264C6E848;
    id v20 = WeakRetained;
    [v20 presentErrorAlertWithTitle:v9 message:v10 continueHandler:&__block_literal_global_406 tryAgainHandler:v19];
  }
  if (WeakRetained) {
    [WeakRetained setApps:v5];
  }
  long long v11 = [*(id *)(a1 + 32) selectedSensors];
  objc_super v12 = (void *)MEMORY[0x263EFFA08];
  id v13 = [*(id *)(a1 + 32) sensors];
  long long v14 = [v12 setWithArray:v13];
  [v11 intersectSet:v14];

  id v15 = [*(id *)(a1 + 32) selectedApps];
  uint64_t v16 = (void *)MEMORY[0x263EFFA08];
  uint64_t v17 = [*(id *)(a1 + 32) apps];
  id v18 = [v16 setWithArray:v17];
  [v15 intersectSet:v18];

  [*(id *)(a1 + 32) _updateButton];
}

uint64_t __44__DSPrivacyPermissionsController_reloadData__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadData];
}

- (void)addUnsharedPermissions:(id)a3 andApps:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(DSPrivacyPermissionsController *)self delegate];
  id v9 = [MEMORY[0x263F3A340] enumerateAppPermissionPairsFromApps:v6 permissions:v7];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __65__DSPrivacyPermissionsController_addUnsharedPermissions_andApps___block_invoke;
  v11[3] = &unk_264C6E9F8;
  id v12 = v8;
  id v10 = v8;
  [v9 enumerateKeysAndObjectsUsingBlock:v11];
}

void __65__DSPrivacyPermissionsController_addUnsharedPermissions_andApps___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v7 = [*(id *)(a1 + 32) unsharedPermissions];
    [v7 addObject:v5];
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v28;
    long long v11 = v24;
    id v12 = &unk_264C6E9D0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(obj);
        }
        long long v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          id v15 = [*(id *)(a1 + 32) unsharedApps];
          [v14 appID];
          uint64_t v16 = v9;
          uint64_t v17 = v11;
          uint64_t v18 = a1;
          uint64_t v19 = v10;
          id v20 = v5;
          id v22 = v21 = v12;
          [v15 addObject:v22];

          id v12 = v21;
          id v5 = v20;
          uint64_t v10 = v19;
          a1 = v18;
          long long v11 = v17;
          uint64_t v9 = v16;
        }
        v24[0] = __65__DSPrivacyPermissionsController_addUnsharedPermissions_andApps___block_invoke_2;
        v24[1] = v12;
        id v25 = v5;
        v26 = v14;
        AnalyticsSendEventLazy();
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v9);
  }
}

id __65__DSPrivacyPermissionsController_addUnsharedPermissions_andApps___block_invoke_2(uint64_t a1)
{
  v7[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v1 = *(void **)(a1 + 40);
  v6[0] = @"permission";
  v6[1] = @"app";
  v7[0] = v2;
  id v3 = [v1 appID];
  v7[1] = v3;
  objc_super v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)_pushNextPane
{
  id v3 = [(DSPrivacyPermissionsController *)self delegate];
  [v3 pushNextPane];

  id v4 = [(DSTableWelcomeController *)self searchController];
  [v4 setActive:0];
}

- (void)_updateTitle
{
  unint64_t scope = self->_scope;
  id v4 = [(DSPrivacyPermissionsController *)self headerView];
  if (scope)
  {
    id v5 = DSUILocStringForKey(@"PRIVACY_PERMISSIONS_INFORMATION");
    [v4 setTitle:v5];

    id v9 = [(DSPrivacyPermissionsController *)self headerView];
    id v6 = @"PRIVACY_PERMISSIONS_DETAIL_PERMISSIONS";
  }
  else
  {
    id v7 = DSUILocStringForKey(@"PRIVACY_PERMISSIONS_APPS");
    [v4 setTitle:v7];

    id v9 = [(DSPrivacyPermissionsController *)self headerView];
    id v6 = @"PRIVACY_PERMISSIONS_DETAIL_APPS";
  }
  uint64_t v8 = DSUILocStringForKey(v6);
  [v9 setDetailText:v8];
}

- (void)_updateButton
{
  if ([(DSPrivacyPermissionsController *)self scope]) {
    [(DSPrivacyPermissionsController *)self selectedSensors];
  }
  else {
  id v3 = [(DSPrivacyPermissionsController *)self selectedApps];
  }
  uint64_t v4 = [v3 count];

  id v5 = [(DSTableWelcomeController *)self boldButton];
  [v5 removeTarget:0 action:0 forControlEvents:0xFFFFFFFFLL];

  if (v4)
  {
    id v6 = [(DSTableWelcomeController *)self boldButton];
    id v7 = DSUILocStringForKey(@"STOP_ACCESS");
    [v6 setTitle:v7 forState:0];

    uint64_t v8 = [(DSTableWelcomeController *)self boldButton];
    [v8 addTarget:self action:sel_resetSelectedPermissions forControlEvents:64];
  }
  else
  {
    if ([(DSTableWelcomeController *)self isModelEmpty]) {
      id v9 = @"CONTINUE";
    }
    else {
      id v9 = @"SKIP";
    }
    uint64_t v8 = DSUILocStringForKey(v9);
    uint64_t v10 = [(DSTableWelcomeController *)self boldButton];
    [v10 setTitle:v8 forState:0];

    long long v11 = [(DSTableWelcomeController *)self boldButton];
    [v11 addTarget:self action:sel__pushNextPane forControlEvents:64];
  }
  [(DSTableWelcomeController *)self hideButtonsIfSearching];
}

- (DSNavigationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DSNavigationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DSAppSharing)appSharing
{
  return self->_appSharing;
}

- (void)setAppSharing:(id)a3
{
}

- (NSArray)apps
{
  return self->_apps;
}

- (NSArray)filteredApps
{
  return self->_filteredApps;
}

- (void)setFilteredApps:(id)a3
{
}

- (BOOL)isFiltered
{
  return self->_isFiltered;
}

- (void)setIsFiltered:(BOOL)a3
{
  self->_isFiltered = a3;
}

- (NSMutableSet)selectedApps
{
  return self->_selectedApps;
}

- (void)setSelectedApps:(id)a3
{
}

- (unint64_t)scope
{
  return self->_scope;
}

- (void)setScope:(unint64_t)a3
{
  self->_unint64_t scope = a3;
}

- (NSArray)sensors
{
  return self->_sensors;
}

- (void)setSensors:(id)a3
{
}

- (NSMutableSet)selectedSensors
{
  return self->_selectedSensors;
}

- (void)setSelectedSensors:(id)a3
{
}

- (NSArray)filteredSensors
{
  return self->_filteredSensors;
}

- (void)setFilteredSensors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filteredSensors, 0);
  objc_storeStrong((id *)&self->_selectedSensors, 0);
  objc_storeStrong((id *)&self->_sensors, 0);
  objc_storeStrong((id *)&self->_selectedApps, 0);
  objc_storeStrong((id *)&self->_filteredApps, 0);
  objc_storeStrong((id *)&self->_apps, 0);
  objc_storeStrong((id *)&self->_appSharing, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end