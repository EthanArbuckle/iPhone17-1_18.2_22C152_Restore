@interface DSPrivacyPermissionDetailController
- (DSPrivacyPermissionDetailController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 permission:(id)a6 apps:(id)a7;
- (DSPrivacyPermissionsDelegate)delegate;
- (DSSensor)permission;
- (NSArray)apps;
- (NSMutableArray)selectedApps;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_updateButton;
- (void)back;
- (void)returnFromDetailAndResetPermissionForSelectedApps;
- (void)returnFromDetailAndStopAllSharingForPermission;
- (void)setApps:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPermission:(id)a3;
- (void)setSelectedApps:(id)a3;
- (void)stopAllPressed;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation DSPrivacyPermissionDetailController

- (DSPrivacyPermissionDetailController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 permission:(id)a6 apps:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  v25.receiver = self;
  v25.super_class = (Class)DSPrivacyPermissionDetailController;
  v14 = [(DSTableWelcomeController *)&v25 initWithTitle:a3 detailText:a4 icon:0 adoptTableViewScrollView:1 shouldShowSearchBar:0];
  v15 = (void *)MEMORY[0x263F3A340];
  v16 = [v12 tccPermission];
  v17 = [v15 iconForPermission:v16 tableFormat:0];
  [(DSTableWelcomeController *)v14 addBorderedIcon:v17];

  if (v14)
  {
    objc_storeStrong((id *)&v14->_permission, a6);
    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    selectedApps = v14->_selectedApps;
    v14->_selectedApps = v18;

    v20 = (void *)MEMORY[0x263F3A340];
    v21 = [v12 tccPermission];
    uint64_t v22 = [v20 appsWithPermission:v21 fromAllApps:v13];
    apps = v14->_apps;
    v14->_apps = (NSArray *)v22;
  }
  return v14;
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)DSPrivacyPermissionDetailController;
  [(DSTableWelcomeController *)&v11 viewDidLoad];
  v3 = DSUILocStringForKey(@"SKIP");
  v4 = +[DSUIUtilities setUpBoldButtonForController:self title:v3 target:self selector:sel_back];
  [(DSTableWelcomeController *)self setBoldButton:v4];

  v5 = NSString;
  v6 = DSUILocStringForKey(@"STOP_ALL_APP_SHARING");
  v7 = [(DSPrivacyPermissionDetailController *)self permission];
  v8 = [v7 localizedName];
  v9 = objc_msgSend(v5, "localizedStringWithFormat:", v6, v8);
  v10 = +[DSUIUtilities setUpLinkButtonForController:self title:v9 target:self selector:sel_stopAllPressed];
  [(DSTableWelcomeController *)self setLinkButton:v10];
}

- (void)returnFromDetailAndResetPermissionForSelectedApps
{
  id v5 = [(DSPrivacyPermissionDetailController *)self delegate];
  v3 = [(DSPrivacyPermissionDetailController *)self selectedApps];
  v4 = [(DSPrivacyPermissionDetailController *)self permission];
  [v5 returnFromDetailAndResetPermissionForSelectedApps:v3 permission:v4];
}

- (void)returnFromDetailAndStopAllSharingForPermission
{
  id v4 = [(DSPrivacyPermissionDetailController *)self delegate];
  v3 = [(DSPrivacyPermissionDetailController *)self permission];
  [v4 returnFromDetailAndStopAllSharingForPermission:v3];
}

- (void)stopAllPressed
{
  v3 = (void *)MEMORY[0x263F3A340];
  id v4 = [(DSPrivacyPermissionDetailController *)self permission];
  id v5 = [v4 tccPermission];
  v6 = [v3 stringKeyForPermission:v5];
  v7 = [@"RESET_ALL_CONFIRMATION_" stringByAppendingString:v6];
  v8 = DSUILocStringForKey(v7);

  v9 = [MEMORY[0x263F82418] alertControllerWithTitle:0 message:v8 preferredStyle:0];
  v10 = (void *)MEMORY[0x263F82400];
  objc_super v11 = DSUILocStringForKey(@"CANCEL");
  id v12 = [v10 actionWithTitle:v11 style:1 handler:&__block_literal_global_16];

  id v13 = (void *)MEMORY[0x263F82400];
  v14 = DSUILocStringForKey(@"STOP_ALL_PERMISSION_ACCESS");
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __53__DSPrivacyPermissionDetailController_stopAllPressed__block_invoke_2;
  v16[3] = &unk_264C6E848;
  v16[4] = self;
  v15 = [v13 actionWithTitle:v14 style:2 handler:v16];

  [v9 addAction:v15];
  [v9 addAction:v12];
  [(DSPrivacyPermissionDetailController *)self presentViewController:v9 animated:1 completion:0];
}

uint64_t __53__DSPrivacyPermissionDetailController_stopAllPressed__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) returnFromDetailAndStopAllSharingForPermission];
}

- (void)back
{
  id v3 = [(DSPrivacyPermissionDetailController *)self navigationController];
  id v2 = (id)[v3 popViewControllerAnimated:1];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = [(DSPrivacyPermissionDetailController *)self apps];
  uint64_t v7 = [v5 row];

  v8 = [v6 objectAtIndexedSubscript:v7];

  v9 = [v8 appID];
  v10 = +[DSUIUtilities appIconForAppID:v9 format:0];

  objc_super v11 = [(OBTableWelcomeController *)self tableView];
  id v12 = [v8 displayName];
  id v13 = +[DSIconTableViewCell iconTableViewCellFromTableView:v11 withRightAlignedLabel:v12 detail:&stru_26E9097D0 icon:v10];

  [v13 setAccessoryType:0];
  return v13;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(DSPrivacyPermissionDetailController *)self apps];
  int64_t v5 = [v4 count];

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = [(DSPrivacyPermissionDetailController *)self selectedApps];
  uint64_t v7 = [(DSPrivacyPermissionDetailController *)self apps];
  uint64_t v8 = [v5 row];

  v9 = [v7 objectAtIndexedSubscript:v8];
  [v6 addObject:v9];

  [(DSPrivacyPermissionDetailController *)self _updateButton];
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = [(DSPrivacyPermissionDetailController *)self selectedApps];
  uint64_t v7 = [(DSPrivacyPermissionDetailController *)self apps];
  uint64_t v8 = [v5 row];

  v9 = [v7 objectAtIndexedSubscript:v8];
  [v6 removeObject:v9];

  [(DSPrivacyPermissionDetailController *)self _updateButton];
}

- (void)_updateButton
{
  id v3 = [(DSTableWelcomeController *)self boldButton];
  [v3 removeTarget:0 action:0 forControlEvents:0xFFFFFFFFLL];

  id v4 = [(OBTableWelcomeController *)self tableView];
  id v5 = [v4 indexPathsForSelectedRows];
  uint64_t v6 = [v5 count];

  uint64_t v7 = [(DSTableWelcomeController *)self boldButton];
  if (v6) {
    uint64_t v8 = @"STOP_ACCESS";
  }
  else {
    uint64_t v8 = @"SKIP";
  }
  if (v6) {
    v9 = &selRef_returnFromDetailAndResetPermissionForSelectedApps;
  }
  else {
    v9 = &selRef_back;
  }
  v10 = DSUILocStringForKey(v8);
  [v7 setTitle:v10 forState:0];

  id v11 = [(DSTableWelcomeController *)self boldButton];
  [v11 addTarget:self action:*v9 forControlEvents:64];
}

- (DSSensor)permission
{
  return self->_permission;
}

- (void)setPermission:(id)a3
{
}

- (NSMutableArray)selectedApps
{
  return self->_selectedApps;
}

- (void)setSelectedApps:(id)a3
{
}

- (DSPrivacyPermissionsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DSPrivacyPermissionsDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)apps
{
  return self->_apps;
}

- (void)setApps:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apps, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedApps, 0);
  objc_storeStrong((id *)&self->_permission, 0);
}

@end