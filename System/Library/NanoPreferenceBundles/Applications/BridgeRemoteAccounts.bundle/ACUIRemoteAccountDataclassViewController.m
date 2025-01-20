@interface ACUIRemoteAccountDataclassViewController
- (ACAccount)account;
- (ACUIRemoteAccountDataclassViewController)init;
- (ACUIRemoteAccountSyncController)syncController;
- (ACUIRemoteDeviceSettingsController)settingsController;
- (BOOL)_isPresentedAsModalSheet;
- (BOOL)didDeleteAccount;
- (BOOL)didModifyAccount;
- (BOOL)isDeleting;
- (BOOL)isFirstTimeSetup;
- (BOOL)isSaving;
- (BOOL)shouldShowSpecifierForDataclass:(id)a3;
- (BOOL)showDeleteButton;
- (UIBarButtonItem)cancelButton;
- (UIBarButtonItem)doneButton;
- (id)_navigationTitle;
- (id)dataclassSwitchStateForSpecifier:(id)a3;
- (id)specifierForDataclass:(id)a3;
- (id)specifiers;
- (id)specifiersForDataclasses:(id)a3;
- (void)_dismiss;
- (void)_displayFailedToDeleteAlert;
- (void)_displayFailedToSaveAlertShouldDismiss:(BOOL)a3;
- (void)cancelButtonTapped:(id)a3;
- (void)dataclassSwitchStateDidChange:(id)a3 withSpecifier:(id)a4;
- (void)deleteButtonTapped:(id)a3;
- (void)doneButtonTapped:(id)a3;
- (void)setAccount:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setDeleting:(BOOL)a3;
- (void)setDidDeleteAccount:(BOOL)a3;
- (void)setDidModifyAccount:(BOOL)a3;
- (void)setDoneButton:(id)a3;
- (void)setIsFirstTimeSetup:(BOOL)a3;
- (void)setSaving:(BOOL)a3;
- (void)setSettingsController:(id)a3;
- (void)setShowDeleteButton:(BOOL)a3;
- (void)setSyncController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ACUIRemoteAccountDataclassViewController

- (ACUIRemoteAccountDataclassViewController)init
{
  SEL v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)ACUIRemoteAccountDataclassViewController;
  v6 = [(ACUIRemoteAccountDataclassViewController *)&v4 init];
  objc_storeStrong((id *)&v6, v6);
  if (v6)
  {
    [(ACUIRemoteAccountDataclassViewController *)v6 setIsFirstTimeSetup:0];
    [(ACUIRemoteAccountDataclassViewController *)v6 setShowDeleteButton:1];
    [(ACUIRemoteAccountDataclassViewController *)v6 setSaving:0];
    [(ACUIRemoteAccountDataclassViewController *)v6 setDeleting:0];
    [(ACUIRemoteAccountDataclassViewController *)v6 setDidModifyAccount:0];
    [(ACUIRemoteAccountDataclassViewController *)v6 setDidDeleteAccount:0];
  }
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (void)viewDidLoad
{
  v34 = self;
  v33[1] = (id)a2;
  id v27 = [(ACUIRemoteAccountDataclassViewController *)self specifier];
  id v26 = [v27 userInfo];
  v33[0] = [v26 objectForKeyedSubscript:ACUIAccountKey];

  if (v33[0])
  {
    id location = (id)_ACUILogSystem();
    os_log_type_t v31 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
    {
      sub_96D0((uint64_t)v35, (uint64_t)"-[ACUIRemoteAccountDataclassViewController viewDidLoad]", 68, (uint64_t)v33[0]);
      _os_log_debug_impl(&def_10DA8, (os_log_t)location, v31, "%s (%d) \"Set account: %@\"", v35, 0x1Cu);
    }
    objc_storeStrong(&location, 0);
    [(ACUIRemoteAccountDataclassViewController *)v34 setAccount:v33[0]];
  }
  id v25 = [(ACUIRemoteAccountDataclassViewController *)v34 specifier];
  id v24 = [v25 userInfo];
  id v30 = [v24 objectForKeyedSubscript:ACUIRemoteSyncControllerKey];

  if (v30) {
    [(ACUIRemoteAccountDataclassViewController *)v34 setSyncController:v30];
  }
  id v22 = [(ACUIRemoteAccountDataclassViewController *)v34 specifier];
  id v21 = [v22 userInfo];
  id v23 = [v21 objectForKeyedSubscript:ACUIShowDeleteButtonKey];

  if (v23)
  {
    id v20 = [(ACUIRemoteAccountDataclassViewController *)v34 specifier];
    id v19 = [v20 userInfo];
    id v18 = [v19 objectForKeyedSubscript:ACUIShowDeleteButtonKey];
    unsigned __int8 v2 = [v18 BOOLValue];
    [(ACUIRemoteAccountDataclassViewController *)v34 setShowDeleteButton:v2 & 1];
  }
  else
  {
    [(ACUIRemoteAccountDataclassViewController *)v34 setShowDeleteButton:0];
  }
  id v11 = objc_alloc((Class)UIBarButtonItem);
  v13 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = -[NSBundle localizedStringForKey:value:table:](v13, "localizedStringForKey:value:table:", @"CANCEL");
  v3 = (UIBarButtonItem *)objc_msgSend(v11, "initWithTitle:style:target:action:");
  cancelButton = v34->_cancelButton;
  v34->_cancelButton = v3;

  id v14 = objc_alloc((Class)UIBarButtonItem);
  v16 = +[NSBundle bundleForClass:objc_opt_class()];
  v15 = [(NSBundle *)v16 localizedStringForKey:@"DONE" value:&stru_187E8 table:@"Localizable"];
  SEL v5 = (UIBarButtonItem *)objc_msgSend(v14, "initWithTitle:style:target:action:");
  doneButton = v34->_doneButton;
  v34->_doneButton = v5;

  id v29 = [(ACUIRemoteAccountDataclassViewController *)v34 navigationItem];
  [v29 setLeftBarButtonItem:v34->_cancelButton];
  [v29 setRightBarButtonItem:v34->_doneButton];
  id v17 = [(ACUIRemoteAccountDataclassViewController *)v34 _navigationTitle];
  objc_msgSend(v29, "setTitle:");

  if ([(ACUIRemoteAccountDataclassViewController *)v34 isFirstTimeSetup])
  {
    [v29 setHidesBackButton:1];
    v10 = +[NSBundle bundleForClass:objc_opt_class()];
    v9 = [(NSBundle *)v10 localizedStringForKey:@"SAVE" value:&stru_187E8 table:@"Localizable"];
    id v8 = [v29 rightBarButtonItem];
    [v8 setTitle:v9];
  }
  else
  {
    if (![(ACUIRemoteAccountDataclassViewController *)v34 _isPresentedAsModalSheet]) {
      [v29 setRightBarButtonItem:0];
    }
    objc_msgSend(v29, "setLeftBarButtonItem:");
    [(ACUIRemoteAccountDataclassViewController *)v34 setCancelButton:0];
    [v29 setHidesBackButton:0];
  }
  id v7 = [(ACUIRemoteAccountDataclassViewController *)v34 table];
  [v7 setAccessibilityIdentifier:@"DATACLASS_CONFIGURATION_TABLE"];

  v28.receiver = v34;
  v28.super_class = (Class)ACUIRemoteAccountDataclassViewController;
  [(ACUIRemoteAccountDataclassViewController *)&v28 viewDidLoad];
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(v33, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  v9 = self;
  SEL v8 = a2;
  BOOL v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ACUIRemoteAccountDataclassViewController;
  [(ACUIRemoteAccountDataclassViewController *)&v6 viewWillAppear:a3];
  os_log_t oslog = (os_log_t)(id)_ACUILogSystem();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = [(ACUIRemoteAccountDataclassViewController *)v9 account];
    v3 = [(ACAccount *)v4 identifier];
    sub_220C((uint64_t)v10, (uint64_t)"-[ACUIRemoteAccountDataclassViewController viewWillAppear:]", 120, (uint64_t)v3);
    _os_log_impl(&def_10DA8, oslog, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Presenting dataclass view for %{public}@\"", v10, 0x1Cu);
  }
  objc_storeStrong((id *)&oslog, 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ACUIRemoteAccountDataclassViewController;
  [(ACUIRemoteAccountDataclassViewController *)&v8 viewWillDisappear:a3];
  os_log_t oslog = (os_log_t)(id)_ACUILogSystem();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = [(ACUIRemoteAccountDataclassViewController *)v11 account];
    SEL v5 = [(ACAccount *)v6 identifier];
    sub_220C((uint64_t)v12, (uint64_t)"-[ACUIRemoteAccountDataclassViewController viewWillDisappear:]", 125, (uint64_t)v5);
    _os_log_impl(&def_10DA8, oslog, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Dismissing dataclass view for %{public}@\"", v12, 0x1Cu);
  }
  objc_storeStrong((id *)&oslog, 0);
  if ([(ACUIRemoteAccountDataclassViewController *)v11 didModifyAccount]
    && ![(ACUIRemoteAccountDataclassViewController *)v11 isFirstTimeSetup]
    && ![(ACUIRemoteAccountDataclassViewController *)v11 didDeleteAccount])
  {
    account = v11->_account;
    id v4 = [(ACUIRemoteAccountSyncController *)v11->_syncController topLevelAccounts];
    +[ACUIRemoteAccountsAnalytics reportAccountActionForAccount:action:numberOfAccounts:](ACUIRemoteAccountsAnalytics, "reportAccountActionForAccount:action:numberOfAccounts:", account, 3, [v4 count]);
  }
}

- (id)_navigationTitle
{
  if ([(ACUIRemoteAccountDataclassViewController *)self isFirstTimeSetup])
  {
    SEL v5 = [(ACUIRemoteAccountDataclassViewController *)self account];
    id v4 = [(ACAccount *)v5 accountType];
    BOOL v7 = [(ACAccountType *)v4 accountTypeDescription];
  }
  else
  {
    v3 = [(ACUIRemoteAccountDataclassViewController *)self account];
    BOOL v7 = [(ACAccount *)v3 accountDescription];
  }

  return v7;
}

- (BOOL)_isPresentedAsModalSheet
{
  id v2 = [(ACUIRemoteAccountDataclassViewController *)self navigationController];
  BOOL v4 = v2 == 0;

  return v4;
}

- (id)specifiers
{
  id v30 = self;
  v29[1] = (id)a2;
  if (!*(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers])
  {
    v29[0] = (id)objc_opt_new();
    if (!v30->_isFirstTimeSetup)
    {
      id v28 = +[PSSpecifier groupSpecifierWithID:@"ACUIRemoteAcountDetailAccountNameGroupID"];
      [v29[0] addObject:v28];
      id v18 = [(ACUIRemoteAccountDataclassViewController *)v30 account];
      id v17 = [(ACUIRemoteAccountDataclassViewController *)v30 account];
      id v16 = [(ACAccount *)v17 displayUsername];
      id v27 = +[ACUIAccountSummaryCell specifierWithStyle:account:valueText:detailControllerClass:presentationStyle:](ACUIAccountSummaryCell, "specifierWithStyle:account:valueText:detailControllerClass:presentationStyle:", 1, v18);

      [v29[0] addObject:v27];
      objc_storeStrong(&v27, 0);
      objc_storeStrong(&v28, 0);
    }
    v13 = v30;
    v15 = [(ACUIRemoteAccountDataclassViewController *)v30 account];
    id v14 = [(ACAccount *)v15 provisionedDataclasses];
    id v26 = -[ACUIRemoteAccountDataclassViewController specifiersForDataclasses:](v13, "specifiersForDataclasses:");

    [v29[0] addObjectsFromArray:v26];
    id location = (id)_ACUILogSystem();
    os_log_type_t v24 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
    {
      v12 = [(ACUIRemoteAccountDataclassViewController *)v30 account];
      id v11 = [(ACAccount *)v12 provisionedDataclasses];
      sub_AA48((uint64_t)v32, (uint64_t)"-[ACUIRemoteAccountDataclassViewController specifiers]", 167, (uint64_t)[v11 count]);
      _os_log_debug_impl(&def_10DA8, (os_log_t)location, v24, "%s (%d) \"Number of provisioned data classes: %ld\"", v32, 0x1Cu);
    }
    objc_storeStrong(&location, 0);
    id v23 = (id)_ACUILogSystem();
    os_log_type_t v22 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEBUG))
    {
      sub_AA48((uint64_t)v31, (uint64_t)"-[ACUIRemoteAccountDataclassViewController specifiers]", 168, (uint64_t)[v26 count]);
      _os_log_debug_impl(&def_10DA8, (os_log_t)v23, v22, "%s (%d) \"Presenting data classes for configuration: %ld\"", v31, 0x1Cu);
    }
    objc_storeStrong(&v23, 0);
    if ([(ACUIRemoteAccountDataclassViewController *)v30 showDeleteButton]
      && ![(ACUIRemoteAccountDataclassViewController *)v30 isFirstTimeSetup])
    {
      id v21 = +[PSSpecifier groupSpecifierWithID:@"ACUIRemoteAcountDetailDeleteGroupID"];
      [v29[0] addObject:v21];
      if ([(ACUIRemoteAccountDataclassViewController *)v30 isDeleting])
      {
        SEL v10 = +[NSBundle bundleForClass:objc_opt_class()];
        BOOL v9 = [(NSBundle *)v10 localizedStringForKey:@"DELETING_ACCOUNT" value:&stru_187E8 table:@"Localizable"];
        id v20 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);

        [v29[0] addObject:v20];
        objc_storeStrong(&v20, 0);
      }
      else
      {
        objc_super v8 = +[NSBundle bundleForClass:objc_opt_class()];
        BOOL v7 = [(NSBundle *)v8 localizedStringForKey:@"DELETE_ACCOUNT" value:&stru_187E8 table:@"Localizable"];
        id v19 = +[PSSpecifier deleteButtonSpecifierWithName:target:action:](PSSpecifier, "deleteButtonSpecifierWithName:target:action:");

        [v29[0] addObject:v19];
        objc_storeStrong(&v19, 0);
      }
      objc_storeStrong(&v21, 0);
    }
    id v2 = [v29[0] copy];
    v3 = (void **)&v30->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
    BOOL v4 = *v3;
    ACAccount *v3 = v2;

    objc_storeStrong(&v26, 0);
    objc_storeStrong(v29, 0);
  }
  SEL v5 = *(void **)&v30->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];

  return v5;
}

- (BOOL)shouldShowSpecifierForDataclass:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 1;
}

- (id)specifiersForDataclasses:(id)a3
{
  os_log_type_t v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = +[NSMutableArray array];
  id v21 = (id)ACUIOrderedDataClassList();
  id v20 = +[PSSpecifier groupSpecifierWithID:@"ACUIRemoteAcountDetailDataClassGroupID"];
  [v22 addObject:v20];
  memset(__b, 0, sizeof(__b));
  id obj = v21;
  id v12 = [obj countByEnumeratingWithState:__b objects:v25 count:16];
  if (v12)
  {
    uint64_t v8 = *(void *)__b[2];
    uint64_t v9 = 0;
    id v10 = v12;
    while (1)
    {
      uint64_t v7 = v9;
      if (*(void *)__b[2] != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v19 = *(void *)(__b[1] + 8 * v9);
      unsigned __int8 v3 = [(ACUIRemoteAccountDataclassViewController *)v24 shouldShowSpecifierForDataclass:v19];
      char v16 = 0;
      char v14 = 0;
      unsigned __int8 v6 = 0;
      if (v3)
      {
        id v17 = [(ACUIRemoteAccountDataclassViewController *)v24 account];
        char v16 = 1;
        id v15 = [v17 provisionedDataclasses];
        char v14 = 1;
        unsigned __int8 v6 = [v15 containsObject:v19];
      }
      if (v14) {

      }
      if (v16) {
      if (v6)
      }
      {
        id v13 = [(ACUIRemoteAccountDataclassViewController *)v24 specifierForDataclass:v19];
        if (v13) {
          [v22 addObject:v13];
        }
        objc_storeStrong(&v13, 0);
      }
      ++v9;
      if (v7 + 1 >= (unint64_t)v10)
      {
        uint64_t v9 = 0;
        id v10 = [obj countByEnumeratingWithState:__b objects:v25 count:16];
        if (!v10) {
          break;
        }
      }
    }
  }

  id v5 = v22;
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);

  return v5;
}

- (id)specifierForDataclass:(id)a3
{
  id v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([location[0] isEqualToString:kAccountDataclassContactsSearch])
  {
    id v21 = 0;
    int v18 = 1;
  }
  else
  {
    id v5 = location[0];
    unsigned __int8 v6 = [(ACUIRemoteAccountDataclassViewController *)v20 account];
    id v17 = +[PSSpecifier acui_specifierForDataclass:account:target:set:get:](PSSpecifier, "acui_specifierForDataclass:account:target:set:get:", v5);

    CFStringRef v22 = @"ACUIRemoteAcountDetailDataclassKey";
    id v23 = location[0];
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    objc_msgSend(v17, "setUserInfo:");

    uint64_t v8 = [(ACUIRemoteAccountDataclassViewController *)v20 account];
    id v16 = [(ACAccount *)v8 accountPropertyForKey:ACAccountPropertyGrantedDataclasses];

    char v14 = 0;
    char v12 = 0;
    char v10 = 0;
    BOOL v9 = 0;
    if ([(ACUIRemoteAccountDataclassViewController *)v20 isFirstTimeSetup])
    {
      id v15 = [(ACUIRemoteAccountDataclassViewController *)v20 account];
      char v14 = 1;
      id v13 = [(ACAccount *)v15 accountType];
      char v12 = 1;
      id v11 = [(ACAccountType *)v13 identifier];
      char v10 = 1;
      BOOL v9 = 0;
      if ([(NSString *)v11 isEqualToString:ACAccountTypeIdentifierGmail]) {
        BOOL v9 = v16 != 0;
      }
    }
    if (v10) {

    }
    if (v12) {
    if (v14)
    }

    if (v9 && ([v16 containsObject:location[0]] & 1) == 0) {
      [v17 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
    }
    id v21 = v17;
    int v18 = 1;
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v17, 0);
  }
  objc_storeStrong(location, 0);
  unsigned __int8 v3 = v21;

  return v3;
}

- (id)dataclassSwitchStateForSpecifier:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = objc_msgSend(location[0], "acui_dataclass");
  id v5 = [(ACUIRemoteAccountDataclassViewController *)v11 account];
  unsigned __int8 v6 = [(ACAccount *)v5 isEnabledForDataclass:v9];

  char v8 = v6 & 1;
  os_log_t oslog = (os_log_t)(id)_ACUILogSystem();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    sub_B414((uint64_t)v12, (uint64_t)"-[ACUIRemoteAccountDataclassViewController dataclassSwitchStateForSpecifier:]", 247, (uint64_t)v9, v8 & 1);
    _os_log_debug_impl(&def_10DA8, oslog, OS_LOG_TYPE_DEBUG, "%s (%d) \"%{public}@: %d\"", v12, 0x22u);
  }
  objc_storeStrong((id *)&oslog, 0);
  BOOL v4 = +[NSNumber numberWithBool:v8 & 1];
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);

  return v4;
}

- (void)dataclassSwitchStateDidChange:(id)a3 withSpecifier:(id)a4
{
  v64 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v62 = 0;
  objc_storeStrong(&v62, a4);
  id v61 = objc_msgSend(v62, "acui_dataclass");
  id v60 = (id)_ACUILogSystem();
  os_log_type_t v59 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v60, OS_LOG_TYPE_DEFAULT))
  {
    sub_B414((uint64_t)v66, (uint64_t)"-[ACUIRemoteAccountDataclassViewController dataclassSwitchStateDidChange:withSpecifier:]", 253, (uint64_t)v61, [location[0] BOOLValue] & 1);
    _os_log_impl(&def_10DA8, (os_log_t)v60, v59, "%s (%d) \"Recieved data class state change for class %{public}@, value %d\"", v66, 0x22u);
  }
  objc_storeStrong(&v60, 0);
  os_log_type_t v24 = [(ACUIRemoteAccountDataclassViewController *)v64 account];
  id v58 = [(ACAccount *)v24 accountPropertyForKey:ACAccountPropertyGrantedDataclasses];

  char v57 = 0;
  char v55 = 0;
  char v53 = 0;
  char v51 = 0;
  unsigned __int8 v23 = 0;
  if (![(ACUIRemoteAccountDataclassViewController *)v64 isFirstTimeSetup])
  {
    v56 = [(ACUIRemoteAccountDataclassViewController *)v64 account];
    char v55 = 1;
    v54 = [(ACAccount *)v56 accountType];
    char v53 = 1;
    v52 = [(ACAccountType *)v54 identifier];
    char v51 = 1;
    unsigned __int8 v23 = 0;
    if ([(NSString *)v52 isEqualToString:ACAccountTypeIdentifierGmail])
    {
      unsigned __int8 v23 = 0;
      if (v58) {
        unsigned __int8 v23 = [location[0] BOOLValue];
      }
    }
  }
  if (v51) {

  }
  if (v53) {
  if (v55)
  }

  char v57 = v23 & 1;
  if (v23 & 1) == 0 || ([v58 containsObject:v61])
  {
    if ([(ACUIRemoteAccountDataclassViewController *)v64 isFirstTimeSetup])
    {
      char v10 = [(ACUIRemoteAccountDataclassViewController *)v64 account];
      unsigned __int8 v11 = [location[0] BOOLValue];
      [(ACAccount *)v10 setEnabled:v11 & 1 forDataclass:v61];
    }
    else
    {
      id v9 = [(ACUIRemoteAccountDataclassViewController *)v64 account];
      id v40 = [(ACAccount *)v9 copy];

      unsigned __int8 v8 = [location[0] BOOLValue];
      [v40 setEnabled:v8 & 1 forDataclass:v61];
      dispatch_object_t object = (dispatch_object_t)[v62 _switchSpinnerTimer];
      dispatch_resume(object);
      os_log_t oslog = (os_log_t)(id)_ACUILogSystem();
      os_log_type_t v37 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = [(ACUIRemoteAccountDataclassViewController *)v64 account];
        unsigned __int8 v6 = [(ACAccount *)v7 identifier];
        sub_220C((uint64_t)v65, (uint64_t)"-[ACUIRemoteAccountDataclassViewController dataclassSwitchStateDidChange:withSpecifier:]", 279, (uint64_t)v6);
        _os_log_impl(&def_10DA8, oslog, v37, "%s (%d) \"Beginning update on remote device for account: %{public}@\"", v65, 0x1Cu);
      }
      objc_storeStrong((id *)&oslog, 0);
      objc_initWeak(&v36, v64);
      BOOL v4 = [(ACUIRemoteAccountDataclassViewController *)v64 syncController];
      id v5 = v40;
      id v26 = _NSConcreteStackBlock;
      int v27 = -1073741824;
      int v28 = 0;
      id v29 = sub_C280;
      id v30 = &unk_18528;
      objc_copyWeak(&v35, &v36);
      os_log_type_t v31 = v64;
      id v32 = location[0];
      id v33 = v61;
      v34 = object;
      [(ACUIRemoteAccountSyncController *)v4 updateRemoteAccount:v5 completion:&v26];

      objc_storeStrong((id *)&v34, 0);
      objc_storeStrong(&v33, 0);
      objc_storeStrong(&v32, 0);
      objc_storeStrong((id *)&v31, 0);
      objc_destroyWeak(&v35);
      objc_destroyWeak(&v36);
      objc_storeStrong((id *)&object, 0);
      objc_storeStrong(&v40, 0);
    }
  }
  else
  {
    id v22 = v61;
    id v21 = [(ACUIRemoteAccountDataclassViewController *)v64 account];
    id v50 = +[ACUILocalization localizedStringForDataclass:withSuffix:forAccount:](ACUILocalization, "localizedStringForDataclass:withSuffix:forAccount:", v22, @"LABEL");

    id v20 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v19 = [(NSBundle *)v20 localizedStringForKey:@"GOOGLE_BRIDGE_UNGRANTED_SCOPE_ALERT_TITLE" value:&stru_187E8 table:@"Localizable"];
    int v18 = +[NSBundle bundleForClass:objc_opt_class()];
    id v17 = [(NSBundle *)v18 localizedStringForKey:@"GOOGLE_BRIDGE_UNGRANTED_SCOPE_ALERT_MESSAGE" value:&stru_187E8 table:@"Localizable"];
    id v16 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v50, v50);
    id v49 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v19);

    objc_initWeak(&from, v64);
    id v15 = v49;
    char v14 = +[NSBundle bundleForClass:objc_opt_class()];
    id v13 = [(NSBundle *)v14 localizedStringForKey:@"OK" value:&stru_187E8 table:@"Localizable"];
    v41 = _NSConcreteStackBlock;
    int v42 = -1073741824;
    int v43 = 0;
    v44 = sub_C1E8;
    v45 = &unk_18500;
    objc_copyWeak(&v47, &from);
    id v46 = v62;
    char v12 = +[UIAlertAction actionWithTitle:v13 style:1 handler:&v41];
    objc_msgSend(v15, "addAction:");

    [(ACUIRemoteAccountDataclassViewController *)v64 presentViewController:v49 animated:1 completion:0];
    objc_storeStrong(&v46, 0);
    objc_destroyWeak(&v47);
    objc_destroyWeak(&from);
    objc_storeStrong(&v49, 0);
    objc_storeStrong(&v50, 0);
  }
  objc_storeStrong(&v58, 0);
  objc_storeStrong(&v61, 0);
  objc_storeStrong(&v62, 0);
  objc_storeStrong(location, 0);
}

- (void)deleteButtonTapped:(id)a3
{
  unsigned __int8 v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
  id v21 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", @"REMOTE_DELETE_CONFIRMATION_MESSAGE");

  id v9 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned __int8 v8 = [(NSBundle *)v9 localizedStringForKey:@"DELETE_ACCOUNT" value:&stru_187E8 table:@"Localizable"];
  id v20 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:");

  objc_initWeak(&v19, v23);
  char v12 = _NSConcreteStackBlock;
  int v13 = -1073741824;
  int v14 = 0;
  id v15 = sub_CB2C;
  id v16 = &unk_18578;
  objc_copyWeak(&v17, &v19);
  id v18 = objc_retainBlock(&v12);
  unsigned __int8 v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [(NSBundle *)v6 localizedStringForKey:@"DELETE" value:&stru_187E8 table:@"Localizable"];
  id v11 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:");

  BOOL v4 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned __int8 v3 = [(NSBundle *)v4 localizedStringForKey:@"CANCEL" value:&stru_187E8 table:@"Localizable"];
  id v10 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:");

  [v20 addAction:v11];
  [v20 addAction:v10];
  [(ACUIRemoteAccountDataclassViewController *)v23 presentViewController:v20 animated:1 completion:0];
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v18, 0);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

- (void)setDeleting:(BOOL)a3
{
  int v14 = self;
  SEL v13 = a2;
  BOOL v12 = a3;
  if (self->_deleting != a3)
  {
    v14->_deleting = v12;
    unsigned __int8 v3 = [(ACUIRemoteAccountDataclassViewController *)v14 cancelButton];
    [(UIBarButtonItem *)v3 setEnabled:!v14->_deleting];

    BOOL v4 = [(ACUIRemoteAccountDataclassViewController *)v14 doneButton];
    [(UIBarButtonItem *)v4 setEnabled:!v14->_deleting];

    dispatch_queue_t queue = &_dispatch_main_q;
    unsigned __int8 v6 = _NSConcreteStackBlock;
    int v7 = -1073741824;
    int v8 = 0;
    id v9 = sub_D44C;
    id v10 = &unk_18408;
    id v11 = v14;
    dispatch_async(queue, &v6);

    objc_storeStrong((id *)&v11, 0);
  }
}

- (void)setSaving:(BOOL)a3
{
  BOOL v12 = self;
  SEL v11 = a2;
  BOOL v10 = a3;
  if (self->_saving != a3)
  {
    v12->_saving = v10;
    dispatch_queue_t queue = &_dispatch_main_q;
    BOOL v4 = _NSConcreteStackBlock;
    int v5 = -1073741824;
    int v6 = 0;
    int v7 = sub_D5A0;
    int v8 = &unk_18408;
    id v9 = v12;
    dispatch_async(queue, &v4);

    objc_storeStrong((id *)&v9, 0);
  }
}

- (void)cancelButtonTapped:(id)a3
{
  BOOL v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(ACUIRemoteAccountDataclassViewController *)v4 _dismiss];
  objc_storeStrong(location, 0);
}

- (void)doneButtonTapped:(id)a3
{
  id v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_initWeak(&from, v21);
  [(ACUIRemoteAccountDataclassViewController *)v21 setSaving:1];
  id v18 = (id)_ACUILogSystem();
  os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(ACUIRemoteAccountDataclassViewController *)v21 account];
    int v8 = [(ACAccount *)v9 identifier];
    sub_220C((uint64_t)v22, (uint64_t)"-[ACUIRemoteAccountDataclassViewController doneButtonTapped:]", 379, (uint64_t)v8);
    _os_log_impl(&def_10DA8, (os_log_t)v18, v17, "%s (%d) \"Beginning saving to remote device for account: %{public}@\"", v22, 0x1Cu);
  }
  objc_storeStrong(&v18, 0);
  int v6 = [(ACUIRemoteAccountDataclassViewController *)v21 account];
  unsigned __int8 v7 = [(ACAccount *)v6 supportsPush];

  if ((v7 & 1) == 0)
  {
    int v5 = [(ACUIRemoteAccountDataclassViewController *)v21 settingsController];
    [(ACUIRemoteDeviceSettingsController *)v5 setDefaultPollIntervalIfNeeded];
  }
  BOOL v4 = [(ACUIRemoteAccountDataclassViewController *)v21 syncController];
  unsigned __int8 v3 = [(ACUIRemoteAccountDataclassViewController *)v21 account];
  BOOL v10 = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  SEL v13 = sub_DB8C;
  int v14 = &unk_185F0;
  objc_copyWeak(&v16, &from);
  id v15 = v21;
  [(ACUIRemoteAccountSyncController *)v4 saveRemoteAccount:v3 completion:&v10];

  objc_storeStrong((id *)&v15, 0);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0);
}

- (void)_dismiss
{
  id v19 = self;
  SEL v18 = a2;
  id v14 = [(ACUIRemoteAccountDataclassViewController *)self presentingViewController];

  if (v14)
  {
    id v13 = [(ACUIRemoteAccountDataclassViewController *)v19 navigationController];
    [v13 dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    memset(__b, 0, sizeof(__b));
    id v10 = [(ACUIRemoteAccountDataclassViewController *)v19 navigationController];
    id obj = [v10 viewControllers];

    id v12 = [obj countByEnumeratingWithState:__b objects:v20 count:16];
    if (v12)
    {
      uint64_t v7 = *(void *)__b[2];
      uint64_t v8 = 0;
      id v9 = v12;
      while (1)
      {
        uint64_t v6 = v8;
        if (*(void *)__b[2] != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(__b[1] + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        ++v8;
        if (v6 + 1 >= (unint64_t)v9)
        {
          uint64_t v8 = 0;
          id v9 = [obj countByEnumeratingWithState:__b objects:v20 count:16];
          if (!v9) {
            goto LABEL_11;
          }
        }
      }
      id v5 = [(ACUIRemoteAccountDataclassViewController *)v19 navigationController];
      id v2 = [v5 popToViewController:v17 animated:1];

      int v15 = 1;
    }
    else
    {
LABEL_11:
      int v15 = 0;
    }

    if (!v15)
    {
      id v4 = [(ACUIRemoteAccountDataclassViewController *)v19 navigationController];
      id v3 = [v4 popViewControllerAnimated:1];
    }
  }
}

- (void)_displayFailedToSaveAlertShouldDismiss:(BOOL)a3
{
  id v26 = self;
  SEL v25 = a2;
  BOOL v24 = a3;
  id v12 = +[NSBundle bundleForClass:objc_opt_class()];
  int v11 = [(NSBundle *)v12 localizedStringForKey:@"FAILED_TO_SAVE" value:&stru_187E8 table:@"Localizable"];
  id v10 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [(NSBundle *)v10 localizedStringForKey:@"PLEASE_TRY_AGAIN" value:&stru_187E8 table:@"Localizable"];
  id v23 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v11);

  objc_initWeak(&location, v26);
  id v8 = v23;
  uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v6 = [(NSBundle *)v7 localizedStringForKey:@"OK" value:&stru_187E8 table:@"Localizable"];
  id v14 = _NSConcreteStackBlock;
  int v15 = -1073741824;
  int v16 = 0;
  uint64_t v17 = sub_EFB0;
  SEL v18 = &unk_18640;
  id v19 = v23;
  objc_copyWeak(&v20, &location);
  BOOL v21 = v24;
  id v5 = +[UIAlertAction actionWithTitle:v6 style:0 handler:&v14];
  objc_msgSend(v8, "addAction:");

  id v13 = (id)_ACUILogSystem();
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(ACUIRemoteAccountDataclassViewController *)v26 account];
    id v3 = [(ACAccount *)v4 identifier];
    sub_220C((uint64_t)v27, (uint64_t)"-[ACUIRemoteAccountDataclassViewController _displayFailedToSaveAlertShouldDismiss:]", 450, (uint64_t)v3);
    _os_log_impl(&def_10DA8, (os_log_t)v13, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Displaying failed to save alert for account: %{public}@\"", v27, 0x1Cu);
  }
  objc_storeStrong(&v13, 0);
  [(ACUIRemoteAccountDataclassViewController *)v26 presentViewController:v23 animated:1 completion:0];
  objc_destroyWeak(&v20);
  objc_storeStrong(&v19, 0);
  objc_destroyWeak(&location);
  objc_storeStrong(&v23, 0);
}

- (void)_displayFailedToDeleteAlert
{
  id v13 = self;
  v12[1] = (id)a2;
  uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v6 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", @"FAILED_TO_DELETE");
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [(NSBundle *)v5 localizedStringForKey:@"PLEASE_TRY_AGAIN" value:&stru_187E8 table:@"Localizable"];
  v12[0] = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v6);

  id v10 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [(NSBundle *)v10 localizedStringForKey:@"OK" value:&stru_187E8 table:@"Localizable"];
  id v8 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:");
  objc_msgSend(v12[0], "addAction:");

  id location = (id)_ACUILogSystem();
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [(ACUIRemoteAccountDataclassViewController *)v13 account];
    id v2 = [(ACAccount *)v3 identifier];
    sub_220C((uint64_t)v14, (uint64_t)"-[ACUIRemoteAccountDataclassViewController _displayFailedToDeleteAlert]", 459, (uint64_t)v2);
    _os_log_impl(&def_10DA8, (os_log_t)location, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Displaying failed to delete alert for account: %{public}@\"", v14, 0x1Cu);
  }
  objc_storeStrong(&location, 0);
  [(ACUIRemoteAccountDataclassViewController *)v13 presentViewController:v12[0] animated:1 completion:0];
  objc_storeStrong(v12, 0);
}

- (BOOL)isFirstTimeSetup
{
  return self->_isFirstTimeSetup;
}

- (void)setIsFirstTimeSetup:(BOOL)a3
{
  self->_isFirstTimeSetup = a3;
}

- (BOOL)showDeleteButton
{
  return self->_showDeleteButton;
}

- (void)setShowDeleteButton:(BOOL)a3
{
  self->_showDeleteButton = a3;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (ACUIRemoteDeviceSettingsController)settingsController
{
  return self->_settingsController;
}

- (void)setSettingsController:(id)a3
{
}

- (ACUIRemoteAccountSyncController)syncController
{
  return self->_syncController;
}

- (void)setSyncController:(id)a3
{
}

- (UIBarButtonItem)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
}

- (UIBarButtonItem)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (BOOL)isSaving
{
  return self->_saving;
}

- (BOOL)isDeleting
{
  return self->_deleting;
}

- (BOOL)didModifyAccount
{
  return self->_didModifyAccount;
}

- (void)setDidModifyAccount:(BOOL)a3
{
  self->_didModifyAccount = a3;
}

- (BOOL)didDeleteAccount
{
  return self->_didDeleteAccount;
}

- (void)setDidDeleteAccount:(BOOL)a3
{
  self->_didDeleteAccount = a3;
}

- (void).cxx_destruct
{
}

@end