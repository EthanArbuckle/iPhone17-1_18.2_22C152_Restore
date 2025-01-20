@interface DSPrivacyAppDetailController
- (DSApp)app;
- (DSPrivacyAppDetailController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 app:(id)a6;
- (DSPrivacyPermissionsDelegate)delegate;
- (NSArray)sortedPermissions;
- (NSMutableArray)selectedPermissions;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_updateButton;
- (void)back;
- (void)returnFromDetailAndDeleteApp;
- (void)returnFromDetailAndRevokeSelectedPermissions;
- (void)setApp:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSelectedPermissions:(id)a3;
- (void)setSortedPermissions:(id)a3;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation DSPrivacyAppDetailController

- (DSPrivacyAppDetailController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 app:(id)a6
{
  id v10 = a6;
  v22.receiver = self;
  v22.super_class = (Class)DSPrivacyAppDetailController;
  v11 = [(DSTableWelcomeController *)&v22 initWithTitle:a3 detailText:a4 icon:0 adoptTableViewScrollView:1 shouldShowSearchBar:0];
  v12 = [v10 appID];
  v13 = +[DSUIUtilities appIconForAppID:v12 format:2];
  [(DSTableWelcomeController *)v11 addBorderedIcon:v13];

  if (v11)
  {
    objc_storeStrong((id *)&v11->_app, a6);
    v14 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    sortedPermissions = v11->_sortedPermissions;
    v11->_sortedPermissions = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    selectedPermissions = v11->_selectedPermissions;
    v11->_selectedPermissions = v16;

    id v18 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [MEMORY[0x263F3A340] ensureApp:v11->_app inSensorDict:v18];
    uint64_t v19 = [MEMORY[0x263F3A340] sortSensorDict:v18];
    v20 = v11->_sortedPermissions;
    v11->_sortedPermissions = (NSArray *)v19;
  }
  return v11;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)DSPrivacyAppDetailController;
  [(DSTableWelcomeController *)&v7 viewDidLoad];
  v3 = DSUILocStringForKey(@"SKIP");
  v4 = +[DSUIUtilities setUpBoldButtonForController:self title:v3 target:self selector:sel_back];
  [(DSTableWelcomeController *)self setBoldButton:v4];

  v5 = DSUILocStringForKey(@"DELETE_APP");
  v6 = +[DSUIUtilities setUpLinkButtonForController:self title:v5 target:self selector:sel_returnFromDetailAndDeleteApp];
  [(DSTableWelcomeController *)self setLinkButton:v6];
}

- (void)returnFromDetailAndRevokeSelectedPermissions
{
  id v5 = [(DSPrivacyAppDetailController *)self delegate];
  v3 = [(DSPrivacyAppDetailController *)self selectedPermissions];
  v4 = [(DSPrivacyAppDetailController *)self app];
  [v5 returnFromDetailAndResetSelectedPermissions:v3 forApp:v4];
}

- (void)returnFromDetailAndDeleteApp
{
  id v4 = [(DSPrivacyAppDetailController *)self delegate];
  v3 = [(DSPrivacyAppDetailController *)self app];
  [v4 returnFromDetailAndDeleteApp:v3];
}

- (void)back
{
  id v3 = [(DSPrivacyAppDetailController *)self navigationController];
  id v2 = (id)[v3 popViewControllerAnimated:1];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = [(DSPrivacyAppDetailController *)self sortedPermissions];
  uint64_t v7 = [v5 row];

  v8 = [v6 objectAtIndexedSubscript:v7];

  v9 = [v8 tccPermission];
  if ([v9 isEqualToString:@"DSLocationAlways"])
  {

LABEL_4:
    v12 = [v8 tccPermission];
    if ([v12 isEqualToString:@"DSLocationAlways"]) {
      v13 = @"LOCATION_ALWAYS";
    }
    else {
      v13 = @"LOCATION_WHILE_USING";
    }
    DSUILocStringForKey(v13);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  id v10 = [v8 tccPermission];
  int v11 = [v10 isEqualToString:@"DSLocationWhenInUse"];

  if (v11) {
    goto LABEL_4;
  }
  v14 = &stru_26E9097D0;
LABEL_9:
  v15 = (void *)MEMORY[0x263F3A340];
  v16 = [v8 tccPermission];
  v17 = [v15 iconForPermission:v16 tableFormat:1];

  id v18 = [(OBTableWelcomeController *)self tableView];
  uint64_t v19 = [v8 localizedName];
  v20 = +[DSIconTableViewCell iconTableViewCellFromTableView:v18 withRightAlignedLabel:v19 detail:v14 icon:v17];

  [v20 setAccessoryType:0];
  return v20;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_sortedPermissions count];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = [(DSPrivacyAppDetailController *)self selectedPermissions];
  uint64_t v7 = [(DSPrivacyAppDetailController *)self sortedPermissions];
  uint64_t v8 = [v5 row];

  v9 = [v7 objectAtIndexedSubscript:v8];
  [v6 addObject:v9];

  [(DSPrivacyAppDetailController *)self _updateButton];
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = [(DSPrivacyAppDetailController *)self selectedPermissions];
  uint64_t v7 = [(DSPrivacyAppDetailController *)self sortedPermissions];
  uint64_t v8 = [v5 row];

  v9 = [v7 objectAtIndexedSubscript:v8];
  [v6 removeObject:v9];

  [(DSPrivacyAppDetailController *)self _updateButton];
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
    v9 = &selRef_returnFromDetailAndRevokeSelectedPermissions;
  }
  else {
    v9 = &selRef_back;
  }
  id v10 = DSUILocStringForKey(v8);
  [v7 setTitle:v10 forState:0];

  id v11 = [(DSTableWelcomeController *)self boldButton];
  [v11 addTarget:self action:*v9 forControlEvents:64];
}

- (DSApp)app
{
  return self->_app;
}

- (void)setApp:(id)a3
{
}

- (NSMutableArray)selectedPermissions
{
  return self->_selectedPermissions;
}

- (void)setSelectedPermissions:(id)a3
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

- (NSArray)sortedPermissions
{
  return self->_sortedPermissions;
}

- (void)setSortedPermissions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedPermissions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedPermissions, 0);
  objc_storeStrong((id *)&self->_app, 0);
}

@end