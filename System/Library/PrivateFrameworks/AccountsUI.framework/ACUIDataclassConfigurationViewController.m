@interface ACUIDataclassConfigurationViewController
+ (BOOL)shouldPresentAsModalSheet;
- (ACAccount)account;
- (ACUIDataclassConfigurationViewController)init;
- (BOOL)_confirmDeleteLocalDataForDataclasses:(id)a3;
- (BOOL)_confirmKeepLocalDataForDataclasses:(id)a3;
- (BOOL)_confirmSyncDelete;
- (BOOL)_isShowingDeleteAccountButton;
- (BOOL)_isUserOverridableForDataclass:(id)a3;
- (BOOL)_promptUserToConfirmAccountDeletion;
- (BOOL)dataclassStateForSpecifier:(id)a3;
- (BOOL)isAccountDataclassListRedesignFFEnabled;
- (BOOL)isAccountModificationDisabled;
- (BOOL)isAppleMailAccount:(id)a3;
- (BOOL)isFirstTimeSetup;
- (BOOL)isMailSetupForced;
- (BOOL)operationsHelper:(id)a3 shouldRemoveAccount:(id)a4;
- (BOOL)shouldAutomaticallyTryEnablingDataclassDuringSetup:(id)a3;
- (BOOL)shouldEnableAccountSettingsCell;
- (BOOL)shouldEnableAccountSummaryCell;
- (BOOL)shouldEnableDataclassSwitches;
- (BOOL)shouldEnableDeleteAccountButton;
- (BOOL)shouldShowDeleteAccountButton;
- (BOOL)shouldShowOtherSpecifiersDuringFirstSetup;
- (BOOL)shouldShowSpecifierForDataclass:(id)a3;
- (BOOL)shouldVerifyBeforeAccountSave;
- (BOOL)textFieldShouldReturn:(id)a3;
- (Class)accountInfoControllerClass;
- (NSArray)preEnabledDataclasses;
- (PSSpecifier)dataclassGroupSpecifier;
- (PSSpecifier)deleteButtonSpecifier;
- (id)_accountIdentifier;
- (id)_getDescription:(id)a3;
- (id)_navigationTitle;
- (id)_orderDataclassList:(id)a3;
- (id)_specifiersForDataclasses:(id)a3;
- (id)configurationCompletion;
- (id)dataclassLinkListStateForSpecifier:(id)a3;
- (id)dataclassSwitchStateForSpecifier:(id)a3;
- (id)deviceMessage;
- (id)displayedAccountTypeString;
- (id)displayedShortAccountTypeString;
- (id)messageForAccountDeletionProgressUI;
- (id)messageForAccountDeletionWarning;
- (id)operationsHelper:(id)a3 desiredDataclassActionFromPicker:(id)a4;
- (id)otherSpecifiers;
- (id)specifierForAccountSettingsCell;
- (id)specifierForAccountSummaryCell;
- (id)specifierForDataclass:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)titleForDeleteButton;
- (id)valueForAccountSummaryCell;
- (int64_t)_promptUserToConfirmAccountSyncDeletion;
- (int64_t)deleteButtonIndex;
- (int64_t)operationsHelper:(id)a3 shouldRemoveOrDisableAccount:(id)a4;
- (void)_enableAllProvisionedDataclassesWithoutRequringUserInteraction;
- (void)_notifyOfAccountSetupCompletion;
- (void)_presentUndoAlert:(id)a3 reason:(id)a4;
- (void)_setDataclass:(id)a3 enabled:(BOOL)a4 onAccount:(id)a5 completion:(id)a6;
- (void)_setDescription:(id)a3;
- (void)_textFieldValueDidChange:(id)a3;
- (void)_updateDoneButton;
- (void)appendDeleteAccountButton;
- (void)cancelButtonTapped:(id)a3;
- (void)dataclassSwitchStateDidChange:(id)a3 withSpecifier:(id)a4;
- (void)dealloc;
- (void)deleteButtonTapped:(id)a3;
- (void)doneButtonTapped:(id)a3;
- (void)forceMailSetup;
- (void)operationsHelper:(id)a3 didRemoveAccount:(id)a4 withSuccess:(BOOL)a5 error:(id)a6;
- (void)operationsHelper:(id)a3 didSaveAccount:(id)a4 withSuccess:(BOOL)a5 error:(id)a6;
- (void)operationsHelper:(id)a3 willRemoveAccount:(id)a4;
- (void)operationsHelper:(id)a3 willSaveAccount:(id)a4;
- (void)reloadDynamicSpecifiersWithAnimation:(BOOL)a3;
- (void)setAccount:(id)a3;
- (void)setConfigurationCompletion:(id)a3;
- (void)setDataclass:(id)a3 enabled:(BOOL)a4;
- (void)setDataclassGroupSpecifier:(id)a3;
- (void)setFirstTimeSetup:(BOOL)a3;
- (void)setIsAccountModificationDisabled:(BOOL)a3;
- (void)setIsMailSetupForced:(BOOL)a3;
- (void)setPreEnabledDataclasses:(id)a3;
- (void)setShouldEnableAccountSettingsCell:(BOOL)a3;
- (void)setShouldEnableAccountSummaryCell:(BOOL)a3;
- (void)setShouldEnableDataclassSwitches:(BOOL)a3;
- (void)setShouldEnableDeleteAccountButton:(BOOL)a3;
- (void)setShouldShowDeleteAccountButton:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ACUIDataclassConfigurationViewController

+ (BOOL)shouldPresentAsModalSheet
{
  id v3 = (id)[MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  BOOL v5 = 1;
  if (v4 != 1) {
    return v4 == 5;
  }
  return v5;
}

- (ACUIDataclassConfigurationViewController)init
{
  SEL v9 = a2;
  v10 = 0;
  v8.receiver = self;
  v8.super_class = (Class)ACUIDataclassConfigurationViewController;
  v10 = [(ACUIViewController *)&v8 init];
  objc_storeStrong((id *)&v10, v10);
  if (v10)
  {
    [(ACUIDataclassConfigurationViewController *)v10 setShouldEnableAccountSummaryCell:1];
    [(ACUIDataclassConfigurationViewController *)v10 setShouldEnableAccountSettingsCell:1];
    [(ACUIDataclassConfigurationViewController *)v10 setShouldEnableDeleteAccountButton:1];
    [(ACUIDataclassConfigurationViewController *)v10 setShouldEnableDataclassSwitches:1];
    [(ACUIDataclassConfigurationViewController *)v10 setFirstTimeSetup:0];
    v2 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    allDesiredDataclassActions = v10->_allDesiredDataclassActions;
    v10->_allDesiredDataclassActions = v2;

    [(ACUIDataclassConfigurationViewController *)v10 setShouldShowDeleteAccountButton:(ACUIIsSharedIPadMode() & 1) == 0];
    id v7 = (id)[MEMORY[0x1E4F74230] sharedConnection];
    BOOL v4 = [v7 effectiveBoolValueForSetting:*MEMORY[0x1E4F73ED0]] == 2;
    [(ACUIDataclassConfigurationViewController *)v10 setIsAccountModificationDisabled:v4];
  }
  v6 = v10;
  objc_storeStrong((id *)&v10, 0);
  return v6;
}

- (void)dealloc
{
  BOOL v5 = self;
  SEL v4 = a2;
  id v2 = (id)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 removeObserver:v5];

  v3.receiver = v5;
  v3.super_class = (Class)ACUIDataclassConfigurationViewController;
  [(ACUIViewController *)&v3 dealloc];
}

- (BOOL)isAccountDataclassListRedesignFFEnabled
{
  return _os_feature_enabled_impl() & 1;
}

- (void)forceMailSetup
{
  self->_forceMailSetup = 1;
}

- (id)displayedAccountTypeString
{
  SEL v4 = [(ACUIDataclassConfigurationViewController *)self account];
  objc_super v3 = [(ACAccount *)v4 accountType];
  BOOL v5 = [(ACAccountType *)v3 accountTypeDescription];

  return v5;
}

- (Class)accountInfoControllerClass
{
  return 0;
}

- (id)displayedShortAccountTypeString
{
  SEL v4 = [(ACUIDataclassConfigurationViewController *)self account];
  objc_super v3 = [(ACAccount *)v4 accountType];
  BOOL v5 = [(ACAccountType *)v3 accountTypeDescription];

  return v5;
}

- (id)valueForAccountSummaryCell
{
  objc_super v3 = [(ACUIDataclassConfigurationViewController *)self account];
  id v4 = [(ACAccount *)v3 displayUsername];

  return v4;
}

- (int64_t)deleteButtonIndex
{
  return -[ACUIDataclassConfigurationViewController indexOfSpecifier:](self, "indexOfSpecifier:", self->_deleteButtonSpecifier, a2, self);
}

- (void)setFirstTimeSetup:(BOOL)a3
{
  BOOL v3 = a3;
  [(ACUIDataclassConfigurationViewController *)self setShouldShowDeleteAccountButton:!a3];
  self->_firstTimeSetup = v3;
}

- (BOOL)isMailSetupForced
{
  return self->_forceMailSetup;
}

- (id)titleForDeleteButton
{
  id v3 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v4 = (id)[v3 localizedStringForKey:@"DELETE_ACCOUNT" value:&stru_1F39EF5C0 table:@"Localizable"];

  return v4;
}

- (id)messageForAccountDeletionWarning
{
  id v3 = NSString;
  id v7 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v6 = (id)objc_msgSend(v7, "localizedStringForKey:value:table:", @"DELETE_ACCOUNT_WARNING_FORMAT");
  id v5 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v4 = (id)[v5 localizedStringForKey:@"DATA" value:&stru_1F39EF5C0 table:@"Localizable"];
  id v8 = (id)objc_msgSend(v3, "stringWithFormat:", v6, v4);

  return v8;
}

- (id)messageForAccountDeletionProgressUI
{
  id v3 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v4 = (id)[v3 localizedStringForKey:@"DELETING" value:&stru_1F39EF5C0 table:@"Localizable"];

  return v4;
}

- (BOOL)shouldShowOtherSpecifiersDuringFirstSetup
{
  return 0;
}

- (void)viewDidLoad
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v34 = self;
  v33[1] = (id)a2;
  v21 = [(ACUIDataclassConfigurationViewController *)self account];
  id v22 = (id)[(ACAccount *)v21 managingOwnerIdentifier];
  char v31 = 0;
  char v29 = 0;
  if (v22)
  {
    id v2 = v22;
  }
  else
  {
    v32 = [(ACUIDataclassConfigurationViewController *)v34 account];
    char v31 = 1;
    id v30 = (id)[(ACAccount *)v32 objectForKeyedSubscript:*MEMORY[0x1E4F17660]];
    char v29 = 1;
    id v2 = v30;
  }
  v33[0] = v2;
  if (v29) {

  }
  if (v31) {
  if (v33[0])
  }
  {
    id location = _ACUILogSystem();
    os_log_type_t v27 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
    {
      v20 = [(ACUIDataclassConfigurationViewController *)v34 account];
      __os_log_helper_16_2_4_8_32_4_0_8_64_8_64((uint64_t)v36, (uint64_t)"-[ACUIDataclassConfigurationViewController viewDidLoad]", 154, (uint64_t)v20, (uint64_t)v33[0]);
      _os_log_debug_impl(&dword_1DDFE5000, (os_log_t)location, v27, "%s (%d) \"Hiding delete button for %@, account is managed by %@\"", v36, 0x26u);
    }
    objc_storeStrong(&location, 0);
    [(ACUIDataclassConfigurationViewController *)v34 setShouldShowDeleteAccountButton:0];
  }
  if ([(ACUIDataclassConfigurationViewController *)v34 isAccountModificationDisabled])
  {
    id v26 = _ACUILogSystem();
    os_log_type_t v25 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEBUG))
    {
      v19 = [(ACUIDataclassConfigurationViewController *)v34 account];
      __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v35, (uint64_t)"-[ACUIDataclassConfigurationViewController viewDidLoad]", 159, (uint64_t)v19);
      _os_log_debug_impl(&dword_1DDFE5000, (os_log_t)v26, v25, "%s (%d) \"Hiding delete button for %@, account modification is disabled\"", v35, 0x1Cu);
    }
    objc_storeStrong(&v26, 0);
    [(ACUIDataclassConfigurationViewController *)v34 setShouldShowDeleteAccountButton:0];
    [(ACUIDataclassConfigurationViewController *)v34 setShouldEnableAccountSummaryCell:0];
    [(ACUIDataclassConfigurationViewController *)v34 setShouldEnableAccountSettingsCell:0];
    [(ACUIDataclassConfigurationViewController *)v34 setShouldEnableDataclassSwitches:0];
  }
  v24.receiver = v34;
  v24.super_class = (Class)ACUIDataclassConfigurationViewController;
  [(ACUIViewController *)&v24 viewDidLoad];
  id v23 = (id)[(ACUIDataclassConfigurationViewController *)v34 navigationItem];
  if ([(ACUIDataclassConfigurationViewController *)v34 isAccountDataclassListRedesignFFEnabled])
  {
    id v3 = [(ACUIViewController *)v34 doneButton];
    BOOL v18 = v3 != 0;

    if (!v18)
    {
      id v14 = objc_alloc(MEMORY[0x1E4F427C0]);
      id v17 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v16 = (id)[v17 localizedStringForKey:@"DONE" value:&stru_1F39EF5C0 table:@"Localizable"];
      id v15 = (id)objc_msgSend(v14, "initWithTitle:style:target:action:");
      -[ACUIViewController setDoneButton:](v34, "setDoneButton:");
    }
    v13 = [(ACUIViewController *)v34 doneButton];
    objc_msgSend(v23, "setRightBarButtonItem:");
  }
  if ([(ACUIDataclassConfigurationViewController *)v34 isFirstTimeSetup])
  {
    [v23 setHidesBackButton:1];
    id v11 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v10 = (id)[v11 localizedStringForKey:@"SAVE" value:&stru_1F39EF5C0 table:@"Localizable"];
    id v9 = (id)[v23 rightBarButtonItem];
    [v9 setTitle:v10];
  }
  else
  {
    if (![(ACUIViewController *)v34 isPresentedAsModalSheet])
    {
      if ([(ACUIDataclassConfigurationViewController *)v34 isAccountDataclassListRedesignFFEnabled])
      {
        id v12 = (id)[v23 rightBarButtonItem];
        [v12 setHidden:1];
      }
      else
      {
        [v23 setRightBarButtonItem:0];
      }
    }
    objc_msgSend(v23, "setLeftBarButtonItem:");
    [(ACUIViewController *)v34 setCancelButton:0];
    [v23 setHidesBackButton:0];
  }
  id v6 = [(ACUIDataclassConfigurationViewController *)v34 _navigationTitle];
  objc_msgSend(v23, "setTitle:");

  id v7 = [(ACUIDataclassConfigurationViewController *)v34 account];
  id v4 = [(ACAccount *)v7 accountDescription];
  initialAccountDescription = v34->_initialAccountDescription;
  v34->_initialAccountDescription = v4;

  id v8 = (id)[(ACUIDataclassConfigurationViewController *)v34 table];
  [v8 setAccessibilityIdentifier:@"DATACLASS_CONFIGURATION_TABLE"];

  objc_storeStrong(&v23, 0);
  objc_storeStrong(v33, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ACUIDataclassConfigurationViewController;
  [(ACUIDataclassConfigurationViewController *)&v10 viewWillAppear:a3];
  id location = (id)[(ACUIDataclassConfigurationViewController *)v13 navigationItem];
  id v7 = [(ACUIDataclassConfigurationViewController *)v13 _navigationTitle];
  objc_msgSend(location, "setTitle:");

  os_log_t oslog = (os_log_t)_ACUILogSystem();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    BOOL v3 = [(ACUIDataclassConfigurationViewController *)v13 isFirstTimeSetup];
    id v4 = @"First-time-setup";
    if (!v3) {
      id v4 = @"existing-setup";
    }
    uint64_t v5 = (uint64_t)v4;
    id v6 = [(ACUIDataclassConfigurationViewController *)v13 account];
    __os_log_helper_16_2_4_8_32_4_0_8_66_8_64((uint64_t)v14, (uint64_t)"-[ACUIDataclassConfigurationViewController viewWillAppear:]", 209, v5, (uint64_t)v6);
    _os_log_debug_impl(&dword_1DDFE5000, oslog, OS_LOG_TYPE_DEBUG, "%s (%d) \"Presenting %{public}@ for %@\"", v14, 0x26u);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(&location, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  SEL v12 = self;
  SEL v11 = a2;
  BOOL v10 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACUIDataclassConfigurationViewController;
  [(ACUIDataclassConfigurationViewController *)&v9 viewDidAppear:a3];
  if (![(ACUIDataclassConfigurationViewController *)v12 isFirstTimeSetup])
  {
    id v3 = (id)[(ACUIDataclassConfigurationViewController *)v12 specifier];
    id v8 = (id)[v3 propertyForKey:*MEMORY[0x1E4F93078]];

    id v4 = v12;
    id v7 = [(ACUIDataclassConfigurationViewController *)v12 account];
    id v6 = [(ACAccount *)v7 identifier];
    uint64_t v5 = [(ACUIDataclassConfigurationViewController *)v12 account];
    +[ACUIUtils emitNavigationEventForSubPane:subPath:account:inHostAppBundleID:](ACUIUtils, "emitNavigationEventForSubPane:subPath:account:inHostAppBundleID:", v4, v6);

    objc_storeStrong(&v8, 0);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  SEL v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ACUIDataclassConfigurationViewController;
  [(ACUIDataclassConfigurationViewController *)&v8 viewWillDisappear:a3];
  char v6 = 0;
  BOOL v5 = 0;
  if ([(ACUIDataclassConfigurationViewController *)v11 isAccountDataclassListRedesignFFEnabled])
  {
    id v7 = [(ACUIDataclassConfigurationViewController *)v11 account];
    char v6 = 1;
    BOOL v5 = v7 != 0;
  }
  if (v6) {

  }
  if (v5)
  {
    id v4 = [(ACUIViewController *)v11 accountStore];
    id v3 = [(ACUIDataclassConfigurationViewController *)v11 account];
    -[ACAccountStore saveAccount:withCompletionHandler:](v4, "saveAccount:withCompletionHandler:");
  }
}

void __62__ACUIDataclassConfigurationViewController_viewWillDisappear___block_invoke(NSObject *a1, char a2, id obj)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v9 = a1;
  char v8 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  oslog[1] = a1;
  if ((v8 & 1) == 0)
  {
    oslog[0] = (os_log_t)_ACUILogSystem();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_4_0((uint64_t)v11, (uint64_t)"-[ACUIDataclassConfigurationViewController viewWillDisappear:]_block_invoke", 230);
      _os_log_error_impl(&dword_1DDFE5000, oslog[0], type, "%s (%d) \"Account did not save\"", v11, 0x12u);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  if (location)
  {
    os_log_t v4 = (os_log_t)_ACUILogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v10, (uint64_t)"-[ACUIDataclassConfigurationViewController viewWillDisappear:]_block_invoke", 233, (uint64_t)location);
      _os_log_error_impl(&dword_1DDFE5000, v4, OS_LOG_TYPE_ERROR, "%s (%d) \"Error occurred while saving account. Error: %@\"", v10, 0x1Cu);
    }
    objc_storeStrong((id *)&v4, 0);
  }
  objc_storeStrong(&location, 0);
}

- (id)_navigationTitle
{
  if ([(ACUIDataclassConfigurationViewController *)self isFirstTimeSetup])
  {
    BOOL v5 = (NSString *)[(ACUIDataclassConfigurationViewController *)self displayedShortAccountTypeString];
  }
  else
  {
    id v3 = [(ACUIDataclassConfigurationViewController *)self account];
    BOOL v5 = [(ACAccount *)v3 accountDescription];
  }
  return v5;
}

- (void)doneButtonTapped:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v46 = self;
  SEL v45 = a2;
  id location = 0;
  objc_storeStrong(&location, a3);
  id v43 = _ACUILogSystem();
  os_log_type_t v42 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_DEFAULT))
  {
    log = v43;
    os_log_type_t type = v42;
    v20 = v46;
    id v23 = NSStringFromSelector(v45);
    v41 = v23;
    __os_log_helper_16_2_5_8_32_4_0_8_66_8_66_8_66((uint64_t)v47, (uint64_t)"-[ACUIDataclassConfigurationViewController doneButtonTapped:]", 248, (uint64_t)v20, (uint64_t)v41, (uint64_t)location);
    _os_log_impl(&dword_1DDFE5000, log, type, "%s (%d) @\"%{public}@ %{public}@: %{public}@\"", v47, 0x30u);

    objc_storeStrong((id *)&v41, 0);
  }
  objc_storeStrong(&v43, 0);
  if ([(ACUIDataclassConfigurationViewController *)v46 isFirstTimeSetup])
  {
    uint64_t v33 = MEMORY[0x1E4F143A8];
    int v34 = -1073741824;
    int v35 = 0;
    v36 = __61__ACUIDataclassConfigurationViewController_doneButtonTapped___block_invoke;
    uint64_t v37 = &unk_1E6D20118;
    v38 = v46;
    id v39 = (id)MEMORY[0x1E01CBE70](&v33);
    BOOL forceMailSetup = v46->_forceMailSetup;
    char v31 = 0;
    BOOL v19 = 0;
    if (forceMailSetup)
    {
      v32 = [(ACUIDataclassConfigurationViewController *)v46 account];
      char v31 = 1;
      BOOL v19 = ([(ACAccount *)v32 isProvisionedForDataclass:*MEMORY[0x1E4F17AD8]] & 1) == 0;
    }
    if (v31) {

    }
    if (v19)
    {
      os_log_t v4 = (void *)MEMORY[0x1E4F42728];
      id v8 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v7 = (id)objc_msgSend(v8, "localizedStringForKey:value:table:", @"CONTINUE_WITHOUT_MAIL_TITLE");
      id v6 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v5 = (id)[v6 localizedStringForKey:@"CONTINUE_WITHOUT_MAIL_MESSAGE" value:&stru_1F39EF5C0 table:@"Localizable"];
      id v30 = (id)objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v7);

      id v10 = v30;
      BOOL v9 = (void *)MEMORY[0x1E4F42720];
      id v13 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v12 = (id)[v13 localizedStringForKey:@"CANCEL" value:&stru_1F39EF5C0 table:@"Localizable"];
      id v11 = (id)objc_msgSend(v9, "actionWithTitle:style:handler:");
      objc_msgSend(v10, "addAction:");

      id v15 = v30;
      id v14 = (void *)MEMORY[0x1E4F42720];
      id v18 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v17 = (id)[v18 localizedStringForKey:@"CONTINUE" value:&stru_1F39EF5C0 table:@"Localizable"];
      uint64_t v24 = MEMORY[0x1E4F143A8];
      int v25 = -1073741824;
      int v26 = 0;
      os_log_type_t v27 = __61__ACUIDataclassConfigurationViewController_doneButtonTapped___block_invoke_2;
      v28 = &unk_1E6D203A8;
      id v29 = v39;
      id v16 = (id)[v14 actionWithTitle:v17 style:0 handler:&v24];
      objc_msgSend(v15, "addAction:");

      [(ACUIDataclassConfigurationViewController *)v46 presentViewController:v30 animated:1 completion:0];
      objc_storeStrong(&v29, 0);
      objc_storeStrong(&v30, 0);
    }
    else
    {
      (*((void (**)(void))v39 + 2))();
    }
    objc_storeStrong(&v39, 0);
    objc_storeStrong((id *)&v38, 0);
    int v40 = 0;
  }
  else
  {
    [(ACUIViewController *)v46 dismissAnimated:1];
    int v40 = 1;
  }
  objc_storeStrong(&location, 0);
}

void __61__ACUIDataclassConfigurationViewController_doneButtonTapped___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) shouldVerifyBeforeAccountSave];
  id v3 = (id)[*(id *)(a1 + 32) accountOperationsHelper];
  id v2 = (id)[*(id *)(a1 + 32) account];
  objc_msgSend(v3, "saveAccount:withDataclassActions:requireVerification:");
}

void __61__ACUIDataclassConfigurationViewController_doneButtonTapped___block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

- (void)cancelButtonTapped:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v15 = self;
  SEL v14 = a2;
  id location = 0;
  objc_storeStrong(&location, a3);
  id v12 = _ACUILogSystem();
  os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
  {
    log = v12;
    os_log_type_t type = v11;
    id v5 = v15;
    id v8 = NSStringFromSelector(v14);
    id v10 = v8;
    __os_log_helper_16_2_5_8_32_4_0_8_66_8_66_8_66((uint64_t)v16, (uint64_t)"-[ACUIDataclassConfigurationViewController cancelButtonTapped:]", 278, (uint64_t)v5, (uint64_t)v10, (uint64_t)location);
    _os_log_impl(&dword_1DDFE5000, log, type, "%s (%d) @\"%{public}@ %{public}@: %{public}@\"", v16, 0x30u);

    objc_storeStrong((id *)&v10, 0);
  }
  objc_storeStrong(&v12, 0);
  id v9 = (id)[(ACUIDataclassConfigurationViewController *)v15 rootController];
  id v4 = [(ACUIDataclassConfigurationViewController *)v15 configurationCompletion];

  if (v4)
  {
    id v3 = (void (**)(id, void))[(ACUIDataclassConfigurationViewController *)v15 configurationCompletion];
    v3[2](v3, 0);

    [(ACUIDataclassConfigurationViewController *)v15 setConfigurationCompletion:0];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v9 dismiss];
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&location, 0);
}

- (BOOL)shouldVerifyBeforeAccountSave
{
  return 1;
}

- (id)specifiers
{
  uint64_t v33 = self;
  SEL v32 = a2;
  if (!*(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]))
  {
    id v31 = (id)[MEMORY[0x1E4F1CA48] array];
    id v2 = [(ACUIDataclassConfigurationViewController *)v33 account];
    BOOL v25 = v2 == 0;

    if (v25)
    {
      id v24 = (id)[MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:v32, v33, @"ACUIDataclassConfigurationViewController.m", 313, @"Nil account in %@.", objc_opt_class() object file lineNumber description];
    }
    if (![(ACUIDataclassConfigurationViewController *)v33 isFirstTimeSetup])
    {
      id v3 = (PSSpecifier *)[(ACUIDataclassConfigurationViewController *)v33 specifierForAccountSummaryCell];
      accountSummaryCellSpecifier = v33->_accountSummaryCellSpecifier;
      v33->_accountSummaryCellSpecifier = v3;

      if (v33->_accountSummaryCellSpecifier)
      {
        id v30 = [(ACUIDataclassConfigurationViewController *)v33 displayedAccountTypeString];
        id v29 = (id)[MEMORY[0x1E4F92E70] groupSpecifierWithName:v30];
        [v31 addObject:v29];
        [v31 addObject:v33->_accountSummaryCellSpecifier];
        objc_storeStrong(&v29, 0);
        objc_storeStrong(&v30, 0);
      }
    }
    id v23 = [(ACUIDataclassConfigurationViewController *)v33 account];
    id v28 = (id)[(ACAccount *)v23 provisionedDataclasses];

    if ([v28 count])
    {
      id v5 = (NSArray *)[(ACUIDataclassConfigurationViewController *)v33 _specifiersForDataclasses:v28];
      dataclassSpecifiers = v33->_dataclassSpecifiers;
      v33->_dataclassSpecifiers = v5;

      [v31 addObjectsFromArray:v33->_dataclassSpecifiers];
    }
    if (![(ACUIDataclassConfigurationViewController *)v33 isFirstTimeSetup]
      || [(ACUIDataclassConfigurationViewController *)v33 shouldShowOtherSpecifiersDuringFirstSetup])
    {
      id v7 = (NSArray *)[(ACUIDataclassConfigurationViewController *)v33 otherSpecifiers];
      otherSpecifiers = v33->_otherSpecifiers;
      v33->_otherSpecifiers = v7;

      if ([(NSArray *)v33->_otherSpecifiers count])
      {
        id v21 = [(NSArray *)v33->_otherSpecifiers objectAtIndexedSubscript:0];
        BOOL v22 = [v21 cellType] == 0;

        if (!v22)
        {
          id v19 = v31;
          id v20 = (id)[MEMORY[0x1E4F92E70] emptyGroupSpecifier];
          objc_msgSend(v19, "addObject:");
        }
        [v31 addObjectsFromArray:v33->_otherSpecifiers];
      }
    }
    if (![(ACUIDataclassConfigurationViewController *)v33 isFirstTimeSetup]
      && [(ACUIDataclassConfigurationViewController *)v33 isAccountDataclassListRedesignFFEnabled])
    {
      id v9 = (PSSpecifier *)[(ACUIDataclassConfigurationViewController *)v33 specifierForAccountSettingsCell];
      accountSettingsCellSpecifier = v33->_accountSettingsCellSpecifier;
      v33->_accountSettingsCellSpecifier = v9;

      if (v33->_accountSettingsCellSpecifier)
      {
        id v27 = (id)[MEMORY[0x1E4F92E70] groupSpecifierWithID:@"accountSettingsSpecifier"];
        [v31 addObject:v27];
        [v31 addObject:v33->_accountSettingsCellSpecifier];
        objc_storeStrong(&v27, 0);
      }
    }
    if ([(ACUIDataclassConfigurationViewController *)v33 shouldShowDeleteAccountButton])
    {
      id v26 = (id)[MEMORY[0x1E4F92E70] emptyGroupSpecifier];
      [v31 addObject:v26];
      id v15 = (void *)MEMORY[0x1E4F92E70];
      id v16 = [(ACUIDataclassConfigurationViewController *)v33 titleForDeleteButton];
      os_log_type_t v11 = (PSSpecifier *)(id)objc_msgSend(v15, "deleteButtonSpecifierWithName:target:action:");
      deleteButtonSpecifier = v33->_deleteButtonSpecifier;
      v33->_deleteButtonSpecifier = v11;

      [(PSSpecifier *)v33->_deleteButtonSpecifier setProperty:@"ACUIDeleteButtonSpecifierID" forKey:*MEMORY[0x1E4F93188]];
      uint64_t v17 = v33->_deleteButtonSpecifier;
      id v18 = (id)objc_msgSend(NSNumber, "numberWithBool:", -[ACUIDataclassConfigurationViewController shouldEnableDeleteAccountButton](v33, "shouldEnableDeleteAccountButton"));
      -[PSSpecifier setProperty:forKey:](v17, "setProperty:forKey:");

      [v31 addObject:v33->_deleteButtonSpecifier];
      objc_storeStrong(&v26, 0);
    }
    objc_storeStrong((id *)((char *)&v33->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]), v31);
    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v31, 0);
  }
  id v13 = *(Class *)((char *)&v33->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]);
  return v13;
}

- (id)specifierForAccountSummaryCell
{
  v30[2] = *MEMORY[0x1E4F143B8];
  BOOL v25 = self;
  v24[1] = (id)a2;
  v24[0] = 0;
  id v23 = [(ACUIDataclassConfigurationViewController *)self accountInfoControllerClass];
  if (v23)
  {
    if ([(ACUIDataclassConfigurationViewController *)v25 isAccountDataclassListRedesignFFEnabled])
    {
      id v8 = (void *)MEMORY[0x1E4F92EB0];
      id v10 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v9 = (id)[v10 localizedStringForKey:@"LABEL" value:&stru_1F39EF5C0 table:@"Localizable"];
      id v4 = (id)objc_msgSend(v8, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, v25, sel__setDescription_, sel__getDescription_, objc_opt_class());
      id v5 = v24[0];
      v24[0] = v4;

      objc_msgSend(v24[0], "setKeyboardType:autoCaps:autoCorrection:", 0, 1);
      v27[0] = @"AccountSettingsAlreadyShowedEnableAndDeleteKey";
      v28[0] = MEMORY[0x1E4F1CC38];
      v27[1] = @"account";
      os_log_type_t v11 = [(ACUIDataclassConfigurationViewController *)v25 account];
      v28[1] = v11;
      id v19 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];

      id v12 = v24[0];
      id v13 = (id)objc_msgSend(NSNumber, "numberWithBool:", -[ACUIDataclassConfigurationViewController shouldEnableAccountSummaryCell](v25, "shouldEnableAccountSummaryCell"));
      objc_msgSend(v12, "setProperty:forKey:");

      [v24[0] setUserInfo:v19];
      objc_storeStrong(&v19, 0);
    }
    else
    {
      BOOL v21 = 0;
      BOOL v21 = [(ACUIViewController *)v25 isPresentedAsModalSheet]
         || ([(objc_class *)v23 shouldPresentAsModalSheet] & 1) == 0;
      id v15 = [(ACUIDataclassConfigurationViewController *)v25 account];
      id v14 = [(ACUIDataclassConfigurationViewController *)v25 valueForAccountSummaryCell];
      id v2 = +[ACUIAccountSummaryCell specifierWithStyle:account:valueText:detailControllerClass:presentationStyle:](ACUIAccountSummaryCell, "specifierWithStyle:account:valueText:detailControllerClass:presentationStyle:", 1, v15);
      id v3 = v24[0];
      v24[0] = v2;

      v29[0] = @"AccountSettingsAlreadyShowedEnableAndDeleteKey";
      v30[0] = MEMORY[0x1E4F1CC38];
      v29[1] = @"account";
      id v16 = [(ACUIDataclassConfigurationViewController *)v25 account];
      v30[1] = v16;
      id v20 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];

      [v24[0] setUserInfo:v20];
      id v17 = v24[0];
      id v18 = (id)objc_msgSend(NSNumber, "numberWithBool:", -[ACUIDataclassConfigurationViewController shouldEnableAccountSummaryCell](v25, "shouldEnableAccountSummaryCell"));
      objc_msgSend(v17, "setProperty:forKey:");

      objc_storeStrong(&v20, 0);
    }
    id v26 = v24[0];
    int v22 = 1;
  }
  else
  {
    id v26 = 0;
    int v22 = 1;
  }
  objc_storeStrong(v24, 0);
  id v6 = v26;
  return v6;
}

- (id)specifierForAccountSettingsCell
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v16 = self;
  v15[1] = (id)a2;
  v15[0] = 0;
  id v14 = [(ACUIDataclassConfigurationViewController *)self accountInfoControllerClass];
  if (v14)
  {
    BOOL v12 = 0;
    BOOL v12 = [(ACUIViewController *)v16 isPresentedAsModalSheet]
       || ([(objc_class *)v14 shouldPresentAsModalSheet] & 1) == 0;
    id v7 = [(ACUIDataclassConfigurationViewController *)v16 account];
    id v6 = [(ACUIDataclassConfigurationViewController *)v16 valueForAccountSummaryCell];
    id v2 = +[ACUIAccountSummaryCell specifierWithStyle:account:valueText:detailControllerClass:presentationStyle:](ACUIAccountSummaryCell, "specifierWithStyle:account:valueText:detailControllerClass:presentationStyle:");
    id v3 = v15[0];
    v15[0] = v2;

    v18[0] = @"AccountSettingsAlreadyShowedEnableAndDeleteKey";
    v19[0] = MEMORY[0x1E4F1CC38];
    v18[1] = @"account";
    id v8 = [(ACUIDataclassConfigurationViewController *)v16 account];
    v19[1] = v8;
    id v11 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

    [v15[0] setUserInfo:v11];
    id v9 = v15[0];
    id v10 = (id)objc_msgSend(NSNumber, "numberWithBool:", -[ACUIDataclassConfigurationViewController shouldEnableAccountSettingsCell](v16, "shouldEnableAccountSettingsCell"));
    objc_msgSend(v9, "setProperty:forKey:");

    id v17 = v15[0];
    int v13 = 1;
    objc_storeStrong(&v11, 0);
  }
  else
  {
    id v17 = 0;
    int v13 = 1;
  }
  objc_storeStrong(v15, 0);
  id v4 = v17;
  return v4;
}

- (id)_specifiersForDataclasses:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v19 = (id)[MEMORY[0x1E4F1CA48] array];
  id v9 = v21;
  id v10 = (id)[location[0] allObjects];
  id v18 = -[ACUIDataclassConfigurationViewController _orderDataclassList:](v9, "_orderDataclassList:");

  id v11 = (id)[MEMORY[0x1E4F92E70] emptyGroupSpecifier];
  -[ACUIDataclassConfigurationViewController setDataclassGroupSpecifier:](v21, "setDataclassGroupSpecifier:");

  BOOL v12 = [(ACUIDataclassConfigurationViewController *)v21 dataclassGroupSpecifier];
  objc_msgSend(v19, "addObject:");

  memset(__b, 0, sizeof(__b));
  id obj = v18;
  uint64_t v14 = [obj countByEnumeratingWithState:__b objects:v22 count:16];
  if (v14)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0;
    unint64_t v8 = v14;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(obj);
      }
      uint64_t v17 = *(void *)(__b[1] + 8 * v7);
      if ([(ACUIDataclassConfigurationViewController *)v21 shouldShowSpecifierForDataclass:v17])
      {
        id v15 = [(ACUIDataclassConfigurationViewController *)v21 specifierForDataclass:v17];
        if (v15) {
          [v19 addObject:v15];
        }
        objc_storeStrong(&v15, 0);
      }
      ++v7;
      if (v5 + 1 >= v8)
      {
        uint64_t v7 = 0;
        unint64_t v8 = [obj countByEnumeratingWithState:__b objects:v22 count:16];
        if (!v8) {
          break;
        }
      }
    }
  }

  id v4 = v19;
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)_getDescription:(id)a3
{
  uint64_t v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = [(ACUIDataclassConfigurationViewController *)v7 account];
  uint64_t v5 = [(ACAccount *)v4 accountDescription];

  objc_storeStrong(location, 0);
  return v5;
}

- (void)_setDescription:(id)a3
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v12 = 0;
  char v10 = 0;
  char v8 = 0;
  LOBYTE(v7) = 1;
  if ([(ACUIDataclassConfigurationViewController *)v15 isAccountDataclassListRedesignFFEnabled])
  {
    int v13 = [(ACUIDataclassConfigurationViewController *)v15 account];
    char v12 = 1;
    id v11 = [(ACAccount *)v13 accountType];
    char v10 = 1;
    id v9 = [(ACAccountType *)v11 identifier];
    char v8 = 1;
    int v7 = ![(NSString *)v9 isEqualToString:*MEMORY[0x1E4F17750]];
  }
  if (v8) {

  }
  if (v10) {
  if (v12)
  }

  if (v7)
  {
    id v5 = location[0];
    id v6 = (id)[(ACUIDataclassConfigurationViewController *)v15 navigationItem];
    [v6 setTitle:v5];
  }
  id v4 = [(ACUIDataclassConfigurationViewController *)v15 account];
  [(ACAccount *)v4 setAccountDescription:v3];

  objc_storeStrong(location, 0);
}

- (BOOL)shouldShowSpecifierForDataclass:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 1;
}

- (id)specifierForDataclass:(id)a3
{
  id v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([location[0] isEqualToString:*MEMORY[0x1E4F17A98]])
  {
    id v21 = 0;
    int v18 = 1;
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F92E70];
    id v5 = location[0];
    int v7 = [(ACUIDataclassConfigurationViewController *)v20 account];
    id v17 = (id)objc_msgSend(v6, "acui_specifierForDataclass:account:target:set:get:", v5);

    char v8 = [(ACUIDataclassConfigurationViewController *)v20 account];
    id v16 = (id)[(ACAccount *)v8 accountPropertyForKey:*MEMORY[0x1E4F176A0]];

    char v14 = 0;
    char v12 = 0;
    char v10 = 0;
    BOOL v9 = 0;
    if ([(ACUIDataclassConfigurationViewController *)v20 isFirstTimeSetup])
    {
      id v15 = [(ACUIDataclassConfigurationViewController *)v20 account];
      char v14 = 1;
      int v13 = [(ACAccount *)v15 accountType];
      char v12 = 1;
      id v11 = [(ACAccountType *)v13 identifier];
      char v10 = 1;
      BOOL v9 = 0;
      if ([(NSString *)v11 isEqualToString:*MEMORY[0x1E4F177C0]]) {
        BOOL v9 = v16 != 0;
      }
    }
    if (v10) {

    }
    if (v12) {
    if (v14)
    }

    if (v20->_forceMailSetup && ([location[0] isEqualToString:*MEMORY[0x1E4F17AD8]] & 1) != 0
      || v9 && ([v16 containsObject:location[0]] & 1) == 0
      || ![(ACUIDataclassConfigurationViewController *)v20 _isUserOverridableForDataclass:location[0]]|| ![(ACUIDataclassConfigurationViewController *)v20 shouldEnableDataclassSwitches])
    {
      [v17 setProperty:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F93130]];
    }
    id v21 = v17;
    int v18 = 1;
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v17, 0);
  }
  objc_storeStrong(location, 0);
  uint64_t v3 = v21;
  return v3;
}

- (BOOL)_isUserOverridableForDataclass:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  if ([location[0] isEqualToString:*MEMORY[0x1E4F17AD8]])
  {
    objc_storeStrong(&v9, (id)*MEMORY[0x1E4F74258]);
  }
  else if (([location[0] isEqualToString:*MEMORY[0x1E4F17A90]] & 1) != 0 {
         || ([location[0] isEqualToString:*MEMORY[0x1E4F17A98]] & 1) != 0)
  }
  {
    objc_storeStrong(&v9, (id)*MEMORY[0x1E4F74250]);
  }
  else if ([location[0] isEqualToString:*MEMORY[0x1E4F17A80]])
  {
    objc_storeStrong(&v9, (id)*MEMORY[0x1E4F74248]);
  }
  else if ([location[0] isEqualToString:*MEMORY[0x1E4F17B08]])
  {
    objc_storeStrong(&v9, (id)*MEMORY[0x1E4F74268]);
  }
  else if ([location[0] isEqualToString:*MEMORY[0x1E4F17B00]])
  {
    objc_storeStrong(&v9, (id)*MEMORY[0x1E4F74260]);
  }
  else
  {
    objc_storeStrong(&v9, 0);
  }
  char v8 = 0;
  if (v9)
  {
    id v5 = [(ACUIDataclassConfigurationViewController *)v11 account];
    id v7 = (id)[(ACAccount *)v5 objectForKeyedSubscript:v9];

    char v6 = 1;
    if (v7)
    {
      objc_opt_class();
      char v6 = 1;
      if (objc_opt_isKindOfClass()) {
        char v6 = [v7 BOOLValue];
      }
    }
    char v8 = v6 & 1;
    objc_storeStrong(&v7, 0);
  }
  else
  {
    char v8 = 1;
  }
  char v4 = v8;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (id)otherSpecifiers
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "array", a2, self);
}

- (void)reloadDynamicSpecifiersWithAnimation:(BOOL)a3
{
  int v18 = self;
  SEL v17 = a2;
  BOOL v16 = a3;
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v13 = v18->_accountSummaryCellSpecifier;
  if (v13) {
    [v15 addObject:v13];
  }
  id v12 = [(ACUIDataclassConfigurationViewController *)v18 specifierForAccountSummaryCell];
  if (v12) {
    [v14 addObject:v12];
  }
  id v11 = (id)[(NSArray *)v18->_dataclassSpecifiers copy];
  if (v11) {
    [v15 addObjectsFromArray:v11];
  }
  id v5 = [(ACUIDataclassConfigurationViewController *)v18 account];
  id v4 = (id)[(ACAccount *)v5 provisionedDataclasses];
  id v10 = -[ACUIDataclassConfigurationViewController _specifiersForDataclasses:](v18, "_specifiersForDataclasses:");

  if (v10) {
    [v14 addObjectsFromArray:v10];
  }
  id v9 = (id)[(NSArray *)v18->_otherSpecifiers copy];
  if (v9) {
    [v15 addObjectsFromArray:v9];
  }
  id v3 = [(ACUIDataclassConfigurationViewController *)v18 otherSpecifiers];
  id v8 = (id)[v3 copy];

  if (v8) {
    [v14 addObjectsFromArray:v8];
  }
  if (([v15 isEqualToArray:v14] & 1) == 0) {
    [(ACUIDataclassConfigurationViewController *)v18 replaceContiguousSpecifiers:v15 withSpecifiers:v14 animated:1];
  }
  if ([(ACUIDataclassConfigurationViewController *)v18 isAccountDataclassListRedesignFFEnabled])
  {
    id v7 = v18->_accountSettingsCellSpecifier;
    if (v7) {
      [v15 addObject:v7];
    }
    id obj = [(ACUIDataclassConfigurationViewController *)v18 specifierForAccountSettingsCell];
    if (obj) {
      [v14 addObject:obj];
    }
    objc_storeStrong((id *)&v18->_accountSettingsCellSpecifier, obj);
    objc_storeStrong(&obj, 0);
    objc_storeStrong(&v7, 0);
  }
  objc_storeStrong((id *)&v18->_accountSummaryCellSpecifier, v12);
  objc_storeStrong((id *)&v18->_dataclassSpecifiers, v10);
  objc_storeStrong((id *)&v18->_otherSpecifiers, v8);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
}

- (id)dataclassSwitchStateForSpecifier:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v3 = [(ACUIDataclassConfigurationViewController *)v7 dataclassStateForSpecifier:location[0]];
  id v5 = (id)[NSNumber numberWithBool:v3];
  objc_storeStrong(location, 0);
  return v5;
}

- (id)dataclassLinkListStateForSpecifier:(id)a3
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v12 = 0;
  char v10 = 0;
  char v8 = 0;
  char v6 = 0;
  if ([(ACUIDataclassConfigurationViewController *)v15 dataclassStateForSpecifier:location[0]])
  {
    id v13 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    char v12 = 1;
    id v11 = (id)[v13 localizedStringForKey:@"ON" value:&stru_1F39EF5C0 table:@"Localizable"];
    char v10 = 1;
    id v3 = v11;
  }
  else
  {
    id v9 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    char v8 = 1;
    id v7 = (id)[v9 localizedStringForKey:@"OFF" value:&stru_1F39EF5C0 table:@"Localizable"];
    char v6 = 1;
    id v3 = v7;
  }
  id v16 = v3;
  if (v6) {

  }
  if (v8) {
  if (v10)
  }

  if (v12) {
  objc_storeStrong(location, 0);
  }
  id v4 = v16;
  return v4;
}

- (BOOL)dataclassStateForSpecifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = (id)objc_msgSend(location[0], "acui_dataclass");
  unsigned __int8 v10 = 0;
  if (v13->_forceMailSetup && ([v11 isEqualToString:*MEMORY[0x1E4F17AD8]] & 1) != 0)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    char v8 = 0;
    BOOL v6 = 0;
    if ([(ACUIDataclassConfigurationViewController *)v13 isFirstTimeSetup])
    {
      id v9 = [(ACUIDataclassConfigurationViewController *)v13 preEnabledDataclasses];
      char v8 = 1;
      BOOL v6 = ([v9 containsObject:v11] & 1) == 1;
    }
    if (v8) {

    }
    if (v6)
    {
      unsigned __int8 v10 = 1;
    }
    else
    {
      id v5 = [(ACUIDataclassConfigurationViewController *)v13 account];
      unsigned __int8 v10 = [(ACAccount *)v5 isEnabledForDataclass:v11] & 1;
    }
  }
  os_log_t oslog = (os_log_t)_ACUILogSystem();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_4_8_32_4_0_8_66_4_0((uint64_t)v14, (uint64_t)"-[ACUIDataclassConfigurationViewController dataclassStateForSpecifier:]", 630, (uint64_t)v11, v10 & 1);
    _os_log_debug_impl(&dword_1DDFE5000, oslog, OS_LOG_TYPE_DEBUG, "%s (%d) \"%{public}@: %d\"", v14, 0x22u);
  }
  objc_storeStrong((id *)&oslog, 0);
  uint64_t v4 = v10;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, (id)HIDWORD(v4));
  return v4 & 1;
}

- (void)dataclassSwitchStateDidChange:(id)a3 withSpecifier:(id)a4
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  v75 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v73 = 0;
  objc_storeStrong(&v73, a4);
  id v72 = (id)objc_msgSend(v73, "acui_dataclass");
  if (v72)
  {
    id v30 = [(ACUIDataclassConfigurationViewController *)v75 account];
    id v68 = (id)[(ACAccount *)v30 accountPropertyForKey:*MEMORY[0x1E4F176A0]];

    char v67 = 0;
    char v65 = 0;
    char v63 = 0;
    char v61 = 0;
    char v29 = 0;
    if (![(ACUIDataclassConfigurationViewController *)v75 isFirstTimeSetup])
    {
      v66 = [(ACUIDataclassConfigurationViewController *)v75 account];
      char v65 = 1;
      v64 = [(ACAccount *)v66 accountType];
      char v63 = 1;
      v62 = [(ACAccountType *)v64 identifier];
      char v61 = 1;
      char v29 = 0;
      if ([(NSString *)v62 isEqualToString:*MEMORY[0x1E4F177C0]])
      {
        char v29 = 0;
        if (v68) {
          char v29 = [location[0] BOOLValue];
        }
      }
    }
    if (v61) {

    }
    if (v63) {
    if (v65)
    }

    char v67 = v29 & 1;
    if (v29 & 1) == 0 || ([v68 containsObject:v72])
    {
      if ([(ACUIDataclassConfigurationViewController *)v75 isFirstTimeSetup])
      {
        -[ACUIDataclassConfigurationViewController setDataclass:enabled:](v75, "setDataclass:enabled:", v72, [location[0] BOOLValue] & 1);
      }
      else
      {
        objc_initWeak(&v44, v75);
        id v10 = objc_loadWeakRetained(&v44);
        id v9 = (id)[v10 account];
        id v43 = (id)[v9 copy];

        char v8 = MEMORY[0x1E4F14428];
        dispatch_assert_queue_V2(v8);

        dispatch_object_t object = (dispatch_object_t)(id)[v73 _switchSpinnerTimer];
        dispatch_resume(object);
        id v5 = v75;
        id v6 = v72;
        char v7 = [location[0] BOOLValue];
        id v4 = v43;
        uint64_t v32 = MEMORY[0x1E4F143A8];
        int v33 = -1073741824;
        int v34 = 0;
        int v35 = __88__ACUIDataclassConfigurationViewController_dataclassSwitchStateDidChange_withSpecifier___block_invoke_3;
        v36 = &unk_1E6D20448;
        objc_copyWeak(&v41, &v44);
        id v37 = v72;
        id v38 = v43;
        id v39 = object;
        id v40 = v73;
        [(ACUIDataclassConfigurationViewController *)v5 _setDataclass:v6 enabled:v7 & 1 onAccount:v4 completion:&v32];
        objc_storeStrong(&v40, 0);
        objc_storeStrong((id *)&v39, 0);
        objc_storeStrong(&v38, 0);
        objc_storeStrong(&v37, 0);
        objc_destroyWeak(&v41);
        objc_storeStrong((id *)&object, 0);
        objc_storeStrong(&v43, 0);
        objc_destroyWeak(&v44);
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      id v28 = [(ACUIDataclassConfigurationViewController *)v75 account];
      id v60 = +[ACUILocalization localizedStringForDataclass:withSuffix:forAccount:](ACUILocalization, "localizedStringForDataclass:withSuffix:forAccount:", v72, @"LABEL");

      id v27 = (void *)MEMORY[0x1E4F42728];
      id v26 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v24 = (id)[v26 localizedStringForKey:@"GOOGLE_LOGIN_REQUIRED_TITLE" value:&stru_1F39EF5C0 table:@"Localizable"];
      BOOL v25 = NSString;
      id v23 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v22 = (id)[v23 localizedStringForKey:@"GOOGLE_GRANTED_DATACLASS_LOGIN_MESSAGE" value:&stru_1F39EF5C0 table:@"Localizable"];
      id v21 = (id)[v25 localizedStringWithFormat:v60];
      id v59 = (id)objc_msgSend(v27, "alertControllerWithTitle:message:preferredStyle:", v24);

      objc_initWeak(&from, v75);
      id v19 = v59;
      id v20 = (void *)MEMORY[0x1E4F42720];
      id v18 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v17 = (id)[v18 localizedStringForKey:@"LOGIN" value:&stru_1F39EF5C0 table:@"Localizable"];
      uint64_t v52 = MEMORY[0x1E4F143A8];
      int v53 = -1073741824;
      int v54 = 0;
      v55 = __88__ACUIDataclassConfigurationViewController_dataclassSwitchStateDidChange_withSpecifier___block_invoke;
      v56 = &unk_1E6D203D0;
      objc_copyWeak(&v57, &from);
      id v16 = (id)[v20 actionWithTitle:v17 style:0 handler:&v52];
      objc_msgSend(v19, "addAction:");

      id v14 = v59;
      uint64_t v15 = (void *)MEMORY[0x1E4F42720];
      id v13 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v12 = (id)[v13 localizedStringForKey:@"CANCEL" value:&stru_1F39EF5C0 table:@"Localizable"];
      uint64_t v45 = MEMORY[0x1E4F143A8];
      int v46 = -1073741824;
      int v47 = 0;
      uint64_t v48 = __88__ACUIDataclassConfigurationViewController_dataclassSwitchStateDidChange_withSpecifier___block_invoke_2;
      v49 = &unk_1E6D203F8;
      objc_copyWeak(&v51, &from);
      id v50 = v73;
      id v11 = (id)[v15 actionWithTitle:v12 style:1 handler:&v45];
      objc_msgSend(v14, "addAction:");

      [(ACUIDataclassConfigurationViewController *)v75 presentViewController:v59 animated:1 completion:0];
      objc_storeStrong(&v50, 0);
      objc_destroyWeak(&v51);
      objc_destroyWeak(&v57);
      objc_destroyWeak(&from);
      objc_storeStrong(&v59, 0);
      objc_storeStrong(&v60, 0);
    }
    objc_storeStrong(&v68, 0);
    int v69 = 0;
  }
  else
  {
    id v71 = _ACUILogSystem();
    os_log_type_t v70 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v71, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_4_0((uint64_t)v76, (uint64_t)"-[ACUIDataclassConfigurationViewController dataclassSwitchStateDidChange:withSpecifier:]", 638);
      _os_log_error_impl(&dword_1DDFE5000, (os_log_t)v71, v70, "%s (%d) \"sender of dataclassSwitchStateDidChange:withSpecifier: has nil dataclass. Please file a bug!\"", v76, 0x12u);
    }
    objc_storeStrong(&v71, 0);
    int v69 = 1;
  }
  objc_storeStrong(&v72, 0);
  objc_storeStrong(&v73, 0);
  objc_storeStrong(location, 0);
}

void __88__ACUIDataclassConfigurationViewController_dataclassSwitchStateDidChange_withSpecifier___block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  if (v3[0] && (objc_opt_respondsToSelector() & 1) != 0) {
    [v3[0] performSelector:sel__reAuthenticationButtonTapped_ withObject:0];
  }
  objc_storeStrong(v3, 0);
  objc_storeStrong(location, 0);
}

void __88__ACUIDataclassConfigurationViewController_dataclassSwitchStateDidChange_withSpecifier___block_invoke_2(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3[1] = (id)a1;
  v3[0] = objc_loadWeakRetained((id *)(a1 + 40));
  if (v3[0]) {
    [v3[0] reloadSpecifier:*(void *)(a1 + 32) animated:1];
  }
  objc_storeStrong(v3, 0);
  objc_storeStrong(location, 0);
}

void __88__ACUIDataclassConfigurationViewController_dataclassSwitchStateDidChange_withSpecifier___block_invoke_3(uint64_t a1, char a2, id obj)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  uint64_t v23 = a1;
  char v22 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v20[1] = (id)a1;
  char v7 = MEMORY[0x1E4F14428];
  dispatch_assert_queue_V2(v7);

  v20[0] = objc_loadWeakRetained((id *)(a1 + 64));
  if (v20[0])
  {
    if (v22)
    {
      dispatch_source_cancel(*(dispatch_source_t *)(a1 + 48));
      [v20[0] reloadSpecifier:*(void *)(a1 + 56) animated:1];
    }
    else
    {
      char v17 = 0;
      if (location)
      {
        uint64_t v24 = *(void *)(a1 + 32);
        v25[0] = location;
        id v18 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
        char v17 = 1;
        id v3 = v18;
      }
      else
      {
        id v3 = 0;
      }
      id v19 = v3;
      if (v17) {

      }
      id v4 = (id)[v20[0] accountOperationsHelper];
      uint64_t v5 = *(void *)(a1 + 40);
      id v6 = v19;
      uint64_t v9 = MEMORY[0x1E4F143A8];
      int v10 = -1073741824;
      int v11 = 0;
      id v12 = __88__ACUIDataclassConfigurationViewController_dataclassSwitchStateDidChange_withSpecifier___block_invoke_4;
      id v13 = &unk_1E6D20420;
      objc_copyWeak(&v16, (id *)(a1 + 64));
      id v14 = *(id *)(a1 + 48);
      id v15 = *(id *)(a1 + 56);
      [v4 saveAccount:v5 withDataclassActions:v6 requireVerification:0 completion:&v9];

      objc_storeStrong(&v15, 0);
      objc_storeStrong(&v14, 0);
      objc_destroyWeak(&v16);
      objc_storeStrong(&v19, 0);
    }
  }
  objc_storeStrong(v20, 0);
  objc_storeStrong(&location, 0);
}

void __88__ACUIDataclassConfigurationViewController_dataclassSwitchStateDidChange_withSpecifier___block_invoke_4(uint64_t a1, char a2, id obj)
{
  uint64_t v9 = a1;
  char v8 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v6[1] = (id)a1;
  id v3 = MEMORY[0x1E4F14428];
  dispatch_assert_queue_V2(v3);

  v6[0] = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = (id)[v6[0] account];
  [v4 refresh];

  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  [v6[0] reloadSpecifier:*(void *)(a1 + 40) animated:1];
  objc_storeStrong(v6, 0);
  objc_storeStrong(&location, 0);
}

- (void)_enableAllProvisionedDataclassesWithoutRequringUserInteraction
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v40 = self;
  location[1] = (os_log_t)a2;
  location[0] = (os_log_t)_ACUILogSystem();
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(location[0], OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_32_4_0((uint64_t)v45, (uint64_t)"-[ACUIDataclassConfigurationViewController _enableAllProvisionedDataclassesWithoutRequringUserInteraction]", 706);
    _os_log_debug_impl(&dword_1DDFE5000, location[0], type, "%s (%d) \"Attempting to enable all provisioned dataclasses.\"", v45, 0x12u);
  }
  objc_storeStrong((id *)location, 0);
  memset(__b, 0, sizeof(__b));
  id obj = (id)[(ACAccount *)v40->_account provisionedDataclasses];
  uint64_t v22 = [obj countByEnumeratingWithState:__b objects:v44 count:16];
  if (v22)
  {
    uint64_t v18 = *(void *)__b[2];
    uint64_t v19 = 0;
    unint64_t v20 = v22;
    while (1)
    {
      uint64_t v17 = v19;
      if (*(void *)__b[2] != v18) {
        objc_enumerationMutation(obj);
      }
      uint64_t v37 = *(void *)(__b[1] + 8 * v19);
      if ([(ACUIDataclassConfigurationViewController *)v40 shouldAutomaticallyTryEnablingDataclassDuringSetup:v37])
      {
        [(ACAccount *)v40->_account setEnabled:1 forDataclass:v37];
      }
      else
      {
        id v35 = _ACUILogSystem();
        os_log_type_t v34 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_DEBUG))
        {
          id v16 = v35;
          __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v43, (uint64_t)"-[ACUIDataclassConfigurationViewController _enableAllProvisionedDataclassesWithoutRequringUserInteraction]", 711, v37);
          _os_log_debug_impl(&dword_1DDFE5000, v16, v34, "%s (%d) \"Skipping dataclass %@...\"", v43, 0x1Cu);
        }
        objc_storeStrong(&v35, 0);
        id v12 = [(ACUIDataclassConfigurationViewController *)v40 account];
        id v13 = [(ACAccount *)v12 accountType];
        id v14 = [(ACAccountType *)v13 identifier];
        BOOL v2 = [(NSString *)v14 isEqualToString:*MEMORY[0x1E4F177C0]];
        char v32 = 0;
        char v30 = 0;
        BOOL v15 = 0;
        if (v2)
        {
          int v33 = [(ACUIDataclassConfigurationViewController *)v40 account];
          char v32 = 1;
          id v31 = (id)[(ACAccount *)v33 accountPropertyForKey:*MEMORY[0x1E4F176A0]];
          char v30 = 1;
          BOOL v15 = v31 != 0;
        }
        if (v30) {

        }
        if (v32) {
        if (v15)
        }
          [(ACAccount *)v40->_account setEnabled:0 forDataclass:v37];
      }
      ++v19;
      if (v17 + 1 >= v20)
      {
        uint64_t v19 = 0;
        unint64_t v20 = [obj countByEnumeratingWithState:__b objects:v44 count:16];
        if (!v20) {
          break;
        }
      }
    }
  }

  uint64_t v9 = [(ACUIViewController *)v40 accountStore];
  id v29 = (id)[(ACAccountStore *)v9 dataclassActionsForAccountSave:v40->_account];

  memset(v27, 0, sizeof(v27));
  id v10 = (id)[(ACAccount *)v40->_account provisionedDataclasses];
  uint64_t v11 = [v10 countByEnumeratingWithState:v27 objects:v42 count:16];
  if (v11)
  {
    uint64_t v6 = *(void *)v27[2];
    uint64_t v7 = 0;
    unint64_t v8 = v11;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)v27[2] != v6) {
        objc_enumerationMutation(v10);
      }
      uint64_t v28 = *(void *)(v27[1] + 8 * v7);
      id v26 = (id)[v29 objectForKeyedSubscript:v28];
      if (v26)
      {
        char v25 = 1;
        if ([v26 count] == 1)
        {
          id v24 = (id)[v26 lastObject];
          if ([v24 type])
          {
            os_log_t oslog = (os_log_t)_ACUILogSystem();
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
            {
              id v4 = oslog;
              uint64_t v3 = [v24 type];
              __os_log_helper_16_2_4_8_32_4_0_8_0_8_64((uint64_t)v41, (uint64_t)"-[ACUIDataclassConfigurationViewController _enableAllProvisionedDataclassesWithoutRequringUserInteraction]", 732, v3, v28);
              _os_log_debug_impl(&dword_1DDFE5000, v4, OS_LOG_TYPE_DEBUG, "%s (%d) \"Setting action %lu for dataclass %@\"", v41, 0x26u);
            }
            objc_storeStrong((id *)&oslog, 0);
            [(NSMutableDictionary *)v40->_allDesiredDataclassActions setObject:v24 forKey:v28];
            char v25 = 0;
          }
          objc_storeStrong(&v24, 0);
        }
        if (v25) {
          [(ACAccount *)v40->_account setEnabled:0 forDataclass:v28];
        }
      }
      objc_storeStrong(&v26, 0);
      ++v7;
      if (v5 + 1 >= v8)
      {
        uint64_t v7 = 0;
        unint64_t v8 = [v10 countByEnumeratingWithState:v27 objects:v42 count:16];
        if (!v8) {
          break;
        }
      }
    }
  }

  objc_storeStrong(&v29, 0);
}

- (BOOL)shouldAutomaticallyTryEnablingDataclassDuringSetup:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = [(ACUIDataclassConfigurationViewController *)v12 account];
  id v10 = (id)[(ACAccount *)v4 accountPropertyForKey:*MEMORY[0x1E4F176A0]];

  uint64_t v5 = [(ACUIDataclassConfigurationViewController *)v12 account];
  uint64_t v6 = [(ACAccount *)v5 accountType];
  uint64_t v7 = [(ACAccountType *)v6 identifier];
  BOOL v8 = 0;
  if ([(NSString *)v7 isEqualToString:*MEMORY[0x1E4F177C0]]) {
    BOOL v8 = v10 != 0;
  }

  BOOL v9 = 1;
  if (v8) {
    BOOL v9 = ([v10 containsObject:location[0]] & 1) != 0;
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v9;
}

- (void)setDataclass:(id)a3 enabled:(BOOL)a4
{
  unint64_t v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v18 = a4;
  objc_initWeak(&from, v20);
  uint64_t v6 = v20;
  id v7 = location[0];
  BOOL v8 = v18;
  id v4 = [(ACUIDataclassConfigurationViewController *)v20 account];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  int v10 = -1073741824;
  int v11 = 0;
  id v12 = __65__ACUIDataclassConfigurationViewController_setDataclass_enabled___block_invoke;
  id v13 = &unk_1E6D20470;
  objc_copyWeak(&v15, &from);
  BOOL v16 = v18;
  id v14 = location[0];
  [(ACUIDataclassConfigurationViewController *)v6 _setDataclass:v7 enabled:v8 onAccount:v4 completion:&v9];

  objc_storeStrong(&v14, 0);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0);
}

void __65__ACUIDataclassConfigurationViewController_setDataclass_enabled___block_invoke(uint64_t a1, char a2, id obj)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = a1;
  char v8 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v6[1] = (id)a1;
  id v4 = MEMORY[0x1E4F14428];
  dispatch_assert_queue_V2(v4);

  if ((v8 & 1) == 0)
  {
    v6[0] = objc_loadWeakRetained((id *)(a1 + 40));
    if (v6[0])
    {
      if ([v6[0] isFirstTimeSetup] & 1) == 0 || (*(unsigned char *)(a1 + 48))
      {
        if (location) {
          [*((id *)v6[0] + 184) setObject:location forKey:*(void *)(a1 + 32)];
        }
        else {
          [*((id *)v6[0] + 184) removeObjectForKey:*(void *)(a1 + 32)];
        }
      }
      else
      {
        os_log_t oslog = (os_log_t)_ACUILogSystem();
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_2_3_8_32_4_0_8_66((uint64_t)v10, (uint64_t)"-[ACUIDataclassConfigurationViewController setDataclass:enabled:]_block_invoke", 766, *(void *)(a1 + 32));
          _os_log_debug_impl(&dword_1DDFE5000, oslog, OS_LOG_TYPE_DEBUG, "%s (%d) \"ACUIDCVC: Clearing any accumulated actions for dataclass %{public}@\"", v10, 0x1Cu);
        }
        objc_storeStrong((id *)&oslog, 0);
        [*((id *)v6[0] + 184) removeObjectForKey:*(void *)(a1 + 32)];
      }
    }
    objc_storeStrong(v6, 0);
  }
  objc_storeStrong(&location, 0);
}

- (void)_setDataclass:(id)a3 enabled:(BOOL)a4 onAccount:(id)a5 completion:(id)a6
{
  id v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v22 = a4;
  id v21 = 0;
  objc_storeStrong(&v21, a5);
  id v20 = 0;
  objc_storeStrong(&v20, a6);
  queue = dispatch_get_global_queue(2, 0);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  int v11 = -1073741824;
  int v12 = 0;
  id v13 = __87__ACUIDataclassConfigurationViewController__setDataclass_enabled_onAccount_completion___block_invoke;
  id v14 = &unk_1E6D20048;
  BOOL v19 = v22;
  id v15 = location[0];
  id v16 = v21;
  uint64_t v17 = v24;
  id v18 = v20;
  dispatch_async(queue, &v10);

  objc_storeStrong(&v18, 0);
  objc_storeStrong((id *)&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

void __87__ACUIDataclassConfigurationViewController__setDataclass_enabled_onAccount_completion___block_invoke(uint64_t a1)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  os_log_t oslog[2] = (os_log_t)a1;
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)_ACUILogSystem();
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
  {
    if (*(unsigned char *)(a1 + 64)) {
      v1 = @"Enabling";
    }
    else {
      v1 = @"Disabling";
    }
    __os_log_helper_16_2_5_8_32_4_0_8_66_8_66_8_64((uint64_t)v57, (uint64_t)"-[ACUIDataclassConfigurationViewController _setDataclass:enabled:onAccount:completion:]_block_invoke", 783, (uint64_t)v1, *(void *)(a1 + 32), *(void *)(a1 + 40));
    _os_log_debug_impl(&dword_1DDFE5000, oslog[0], type, "%s (%d) \"ACUIDCVC: %{public}@ dataclass toggle %{public}@ for account %@.\"", v57, 0x30u);
  }
  objc_storeStrong((id *)oslog, 0);
  [*(id *)(a1 + 40) setEnabled:*(unsigned char *)(a1 + 64) & 1 forDataclass:*(void *)(a1 + 32)];
  id v50 = 0;
  id v49 = MEMORY[0x1E4F1CBF0];
  if (([*(id *)(a1 + 48) isFirstTimeSetup] & 1) != 0 && (*(unsigned char *)(a1 + 64) & 1) != 1)
  {
    os_log_t v47 = (os_log_t)_ACUILogSystem();
    os_log_type_t v46 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_3_8_32_4_0_8_66((uint64_t)v56, (uint64_t)"-[ACUIDataclassConfigurationViewController _setDataclass:enabled:onAccount:completion:]_block_invoke", 795, *(void *)(a1 + 32));
      _os_log_debug_impl(&dword_1DDFE5000, v47, v46, "%s (%d) \"ACUIDCVC: Disabling dataclass %{public}@ during first time setup, skipping requesting actions\"", v56, 0x1Cu);
    }
    objc_storeStrong((id *)&v47, 0);
  }
  else
  {
    id v15 = (id)[*(id *)(a1 + 48) accountOperationsHelper];
    uint64_t v2 = *(void *)(a1 + 40);
    uint64_t v3 = *(void *)(a1 + 32);
    id obj = v50;
    id v14 = (id)[v15 dataclassActionsForAccountSave:v2 forDataclass:v3 error:&obj];
    objc_storeStrong(&v50, obj);
    id v4 = v49;
    id v49 = v14;
  }
  id v45 = 0;
  BOOL v44 = 1;
  if (v50)
  {
    os_log_t v43 = (os_log_t)_ACUILogSystem();
    os_log_type_t v42 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v55, (uint64_t)"-[ACUIDataclassConfigurationViewController _setDataclass:enabled:onAccount:completion:]_block_invoke", 802, (uint64_t)v50);
      _os_log_error_impl(&dword_1DDFE5000, v43, v42, "%s (%d) \"ACUIDCVC: Error returned for dataclassActionsForAccountSave: %@\"", v55, 0x1Cu);
    }
    objc_storeStrong((id *)&v43, 0);
  }
  else if ((unint64_t)[v49 count] <= 1)
  {
    if ([v49 count] == 1)
    {
      id v8 = (id)[v49 lastObject];
      id v9 = v45;
      id v45 = v8;
    }
    else
    {
      BOOL v44 = [v49 count] != 0;
    }
  }
  else
  {
    uint64_t v5 = [ACUIDataclassActionPicker alloc];
    id v41 = [(ACUIDataclassActionPicker *)v5 initWithActions:v49 affectingAccount:*(void *)(a1 + 40)];
    [(ACUIDataclassActionPicker *)v41 addAffectedDataclass:*(void *)(a1 + 32)];
    id v6 = [(ACUIDataclassActionPicker *)v41 showInViewController:*(void *)(a1 + 48)];
    id v7 = v45;
    id v45 = v6;

    objc_storeStrong((id *)&v41, 0);
  }
  if (v45 && [v45 type])
  {
    os_log_t v40 = (os_log_t)_ACUILogSystem();
    os_log_type_t v39 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_4_8_32_4_0_8_66_8_66((uint64_t)v54, (uint64_t)"-[ACUIDataclassConfigurationViewController _setDataclass:enabled:onAccount:completion:]_block_invoke", 815, (uint64_t)v45, *(void *)(a1 + 32));
      _os_log_debug_impl(&dword_1DDFE5000, v40, v39, "%s (%d) \"ACUIDCVC: Setting action %{public}@ for dataclass %{public}@\"", v54, 0x26u);
    }
    objc_storeStrong((id *)&v40, 0);
    BOOL v44 = 0;
  }
  if (v44)
  {
    char v38 = 0;
    char v38 = (*(unsigned char *)(a1 + 64) ^ 1) & 1;
    os_log_t v37 = (os_log_t)_ACUILogSystem();
    os_log_type_t v36 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      if (v38) {
        uint64_t v10 = @"Re-enabling";
      }
      else {
        uint64_t v10 = @"Re-disabling";
      }
      __os_log_helper_16_2_5_8_32_4_0_8_66_8_66_8_64((uint64_t)v53, (uint64_t)"-[ACUIDataclassConfigurationViewController _setDataclass:enabled:onAccount:completion:]_block_invoke", 821, (uint64_t)v10, *(void *)(a1 + 32), *(void *)(a1 + 40));
      _os_log_debug_impl(&dword_1DDFE5000, v37, v36, "%s (%d) \"ACUIDCVC: %{public}@ dataclass toggle %{public}@ for account %@.\"", v53, 0x30u);
    }
    objc_storeStrong((id *)&v37, 0);
    [*(id *)(a1 + 40) setEnabled:v38 & 1 forDataclass:*(void *)(a1 + 32)];
    char v34 = 0;
    char v32 = 0;
    BOOL v13 = 0;
    if ([v49 count] == 1)
    {
      BOOL v13 = 0;
      if (v45)
      {
        id v35 = (id)[v45 undoAlertTitle];
        char v34 = 1;
        BOOL v13 = 0;
        if (v35)
        {
          id v33 = (id)[v45 undoAlertMessage];
          char v32 = 1;
          BOOL v13 = v33 != 0;
        }
      }
    }
    if (v32) {

    }
    if (v34) {
    if (v13)
    }
    {
      queue = MEMORY[0x1E4F14428];
      uint64_t v25 = MEMORY[0x1E4F143A8];
      int v26 = -1073741824;
      int v27 = 0;
      uint64_t v28 = __87__ACUIDataclassConfigurationViewController__setDataclass_enabled_onAccount_completion___block_invoke_148;
      id v29 = &unk_1E6D20098;
      id v30 = *(id *)(a1 + 48);
      id v31 = v45;
      dispatch_async(queue, &v25);

      objc_storeStrong(&v31, 0);
      objc_storeStrong(&v30, 0);
    }
  }
  if (*(void *)(a1 + 56))
  {
    int v11 = MEMORY[0x1E4F14428];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    int v18 = -1073741824;
    int v19 = 0;
    id v20 = __87__ACUIDataclassConfigurationViewController__setDataclass_enabled_onAccount_completion___block_invoke_2;
    id v21 = &unk_1E6D1FF80;
    id v23 = *(id *)(a1 + 56);
    BOOL v24 = v44;
    id v22 = v45;
    dispatch_async(v11, &v17);

    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v23, 0);
  }
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v49, 0);
  objc_storeStrong(&v50, 0);
}

void __87__ACUIDataclassConfigurationViewController__setDataclass_enabled_onAccount_completion___block_invoke_148(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = (id)[*(id *)(a1 + 40) undoAlertTitle];
  id v3 = (id)[*(id *)(a1 + 40) undoAlertMessage];
  objc_msgSend(v2, "_presentUndoAlert:reason:", v4);
}

uint64_t __87__ACUIDataclassConfigurationViewController__setDataclass_enabled_onAccount_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned char *)(a1 + 48) & 1);
}

- (void)_presentUndoAlert:(id)a3 reason:(id)a4
{
  BOOL v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  id v10 = (id)[MEMORY[0x1E4F42728] alertControllerWithTitle:location[0] message:v11 preferredStyle:1];
  id v6 = v10;
  uint64_t v5 = (void *)MEMORY[0x1E4F42720];
  id v9 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v8 = (id)[v9 localizedStringForKey:@"OK" value:&stru_1F39EF5C0 table:@"Localizable"];
  id v7 = (id)objc_msgSend(v5, "actionWithTitle:style:handler:");
  objc_msgSend(v6, "addAction:");

  [(ACUIDataclassConfigurationViewController *)v13 presentViewController:v10 animated:1 completion:0];
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (id)_orderDataclassList:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([location[0] containsObject:*MEMORY[0x1E4F17B38]]) {
    [v5 addObject:*MEMORY[0x1E4F17B38]];
  }
  if ([location[0] containsObject:*MEMORY[0x1E4F17AE0]]) {
    [v5 addObject:*MEMORY[0x1E4F17AE0]];
  }
  if ([location[0] containsObject:*MEMORY[0x1E4F17AD8]]) {
    [v5 addObject:*MEMORY[0x1E4F17AD8]];
  }
  if ([location[0] containsObject:*MEMORY[0x1E4F17A90]]) {
    [v5 addObject:*MEMORY[0x1E4F17A90]];
  }
  if ([location[0] containsObject:*MEMORY[0x1E4F17A80]]) {
    [v5 addObject:*MEMORY[0x1E4F17A80]];
  }
  if ([location[0] containsObject:*MEMORY[0x1E4F17B08]]) {
    [v5 addObject:*MEMORY[0x1E4F17B08]];
  }
  if ([location[0] containsObject:*MEMORY[0x1E4F17A70]]) {
    [v5 addObject:*MEMORY[0x1E4F17A70]];
  }
  if ([location[0] containsObject:*MEMORY[0x1E4F17AC0]]) {
    [v5 addObject:*MEMORY[0x1E4F17AC0]];
  }
  if ([location[0] containsObject:*MEMORY[0x1E4F17B00]]) {
    [v5 addObject:*MEMORY[0x1E4F17B00]];
  }
  if ([location[0] containsObject:*MEMORY[0x1E4F17AF8]]) {
    [v5 addObject:*MEMORY[0x1E4F17AF8]];
  }
  if ([location[0] containsObject:*MEMORY[0x1E4F17AB8]]) {
    [v5 addObject:*MEMORY[0x1E4F17AB8]];
  }
  if ([location[0] containsObject:*MEMORY[0x1E4F17B20]]) {
    [v5 addObject:*MEMORY[0x1E4F17B20]];
  }
  if ([location[0] containsObject:*MEMORY[0x1E4F17AC8]]) {
    [v5 addObject:*MEMORY[0x1E4F17AC8]];
  }
  if ([location[0] containsObject:*MEMORY[0x1E4F17AD0]]) {
    [v5 addObject:*MEMORY[0x1E4F17AD0]];
  }
  if ([location[0] containsObject:*MEMORY[0x1E4F17A68]]) {
    [v5 addObject:*MEMORY[0x1E4F17A68]];
  }
  if ([location[0] containsObject:*MEMORY[0x1E4F17AB0]]) {
    [v5 addObject:*MEMORY[0x1E4F17AB0]];
  }
  if ([location[0] containsObject:*MEMORY[0x1E4F17AF0]]) {
    [v5 addObject:*MEMORY[0x1E4F17AF0]];
  }
  id v4 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)_accountIdentifier
{
  id v8 = self;
  v7[1] = (id)a2;
  if (!self->_accountIdentifier)
  {
    id v6 = (id)[(ACUIDataclassConfigurationViewController *)v8 specifier];
    v7[0] = (id)[v6 userInfo];

    uint64_t v2 = (NSString *)(id)[v7[0] objectForKey:@"ACUISpecifierAccountIdentifier"];
    accountIdentifier = v8->_accountIdentifier;
    v8->_accountIdentifier = v2;

    objc_storeStrong(v7, 0);
  }
  id v4 = v8->_accountIdentifier;
  return v4;
}

- (ACAccount)account
{
  id v14 = self;
  location[1] = (id)a2;
  if (!self->_account)
  {
    id v9 = (id)[(ACUIDataclassConfigurationViewController *)v14 specifier];
    location[0] = (id)[v9 userInfo];

    uint64_t v2 = (ACAccount *)(id)[location[0] objectForKey:@"account"];
    account = v14->_account;
    v14->_account = v2;

    char v11 = 0;
    BOOL v10 = 0;
    if (!v14->_account)
    {
      id v12 = [(ACUIDataclassConfigurationViewController *)v14 _accountIdentifier];
      char v11 = 1;
      BOOL v10 = v12 != 0;
    }
    if (v11) {

    }
    if (v10)
    {
      id v8 = [(ACUIViewController *)v14 accountStore];
      id v4 = [(ACAccountStore *)v8 accountWithIdentifier:v14->_accountIdentifier];
      id v5 = v14->_account;
      v14->_account = v4;
    }
    if (v14->_account && [(ACUIDataclassConfigurationViewController *)v14 isFirstTimeSetup]) {
      [(ACUIDataclassConfigurationViewController *)v14 _enableAllProvisionedDataclassesWithoutRequringUserInteraction];
    }
    objc_storeStrong(location, 0);
  }
  id v6 = v14->_account;
  return v6;
}

- (void)operationsHelper:(id)a3 willSaveAccount:(id)a4
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  queue = MEMORY[0x1E4F14428];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  int v8 = -1073741824;
  int v9 = 0;
  BOOL v10 = __77__ACUIDataclassConfigurationViewController_operationsHelper_willSaveAccount___block_invoke;
  char v11 = &unk_1E6D20118;
  id v12 = v15;
  dispatch_async(queue, &v7);

  v6.receiver = v15;
  v6.super_class = (Class)ACUIDataclassConfigurationViewController;
  [(ACUIViewController *)&v6 operationsHelper:location[0] willSaveAccount:v13];
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __77__ACUIDataclassConfigurationViewController_operationsHelper_willSaveAccount___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isFirstTimeSetup] & 1) == 1)
  {
    v1 = *(void **)(a1 + 32);
    id v3 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v2 = (id)[v3 localizedStringForKey:@"ADDING_ACCOUNT" value:&stru_1F39EF5C0 table:@"Localizable"];
    objc_msgSend(v1, "startValidationWithPrompt:");
  }
}

- (id)operationsHelper:(id)a3 desiredDataclassActionFromPicker:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v27 = 0;
  objc_storeStrong(&v27, a4);
  if ([location[0] isRemovingAccount]) {
    v29->_didShowDataclassActionPickerDuringRemoval = 1;
  }
  v25.receiver = v29;
  v25.super_class = (Class)ACUIDataclassConfigurationViewController;
  id v26 = [(ACUIViewController *)&v25 operationsHelper:location[0] desiredDataclassActionFromPicker:v27];
  if ([v26 type])
  {
    if ([v26 type] == 4)
    {
      int v18 = v29;
      id v19 = (id)[v27 affectedDataclasses];
      BOOL v20 = -[ACUIDataclassConfigurationViewController _confirmKeepLocalDataForDataclasses:](v18, "_confirmKeepLocalDataForDataclasses:");

      if (!v20) {
        goto LABEL_6;
      }
    }
    if ([v26 type] == 6)
    {
      id v15 = v29;
      id v16 = (id)[v27 affectedDataclasses];
      BOOL v17 = -[ACUIDataclassConfigurationViewController _confirmDeleteLocalDataForDataclasses:](v15, "_confirmDeleteLocalDataForDataclasses:");

      if (!v17)
      {
LABEL_6:
        id v30 = (id)[MEMORY[0x1E4F179E0] actionWithType:0];
        int v24 = 1;
        goto LABEL_21;
      }
    }
    if ([v26 type] == 2) {
      v29->_isMergingSyncData = 1;
    }
  }
  else if (([location[0] isRemovingAccount] & 1) == 0)
  {
    memset(__b, 0, sizeof(__b));
    id v13 = (id)[v27 affectedDataclasses];
    uint64_t v14 = [v13 countByEnumeratingWithState:__b objects:v31 count:16];
    if (v14)
    {
      uint64_t v10 = *(void *)__b[2];
      uint64_t v11 = 0;
      unint64_t v12 = v14;
      while (1)
      {
        uint64_t v9 = v11;
        if (*(void *)__b[2] != v10) {
          objc_enumerationMutation(v13);
        }
        uint64_t v23 = *(void *)(__b[1] + 8 * v11);
        id v6 = (id)[v27 affectedAccount];
        char v7 = [v6 isEnabledForDataclass:v23];

        id v8 = (id)[v27 affectedAccount];
        [v8 setEnabled:!(v7 & 1) forDataclass:v23];

        ++v11;
        if (v9 + 1 >= v12)
        {
          uint64_t v11 = 0;
          unint64_t v12 = [v13 countByEnumeratingWithState:__b objects:v31 count:16];
          if (!v12) {
            break;
          }
        }
      }
    }
  }
  id v30 = v26;
  int v24 = 1;
LABEL_21:
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
  id v4 = v30;
  return v4;
}

- (void)operationsHelper:(id)a3 didSaveAccount:(id)a4 withSuccess:(BOOL)a5 error:(id)a6
{
  id v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v19 = 0;
  objc_storeStrong(&v19, a4);
  BOOL v18 = a5;
  id v17 = 0;
  objc_storeStrong(&v17, a6);
  queue = MEMORY[0x1E4F14428];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  int v12 = -1073741824;
  int v13 = 0;
  uint64_t v14 = __94__ACUIDataclassConfigurationViewController_operationsHelper_didSaveAccount_withSuccess_error___block_invoke;
  id v15 = &unk_1E6D20118;
  id v16 = v21;
  dispatch_async(queue, &v11);

  v10.receiver = v21;
  v10.super_class = (Class)ACUIDataclassConfigurationViewController;
  [(ACUIViewController *)&v10 operationsHelper:location[0] didSaveAccount:v19 withSuccess:v18 error:v17];
  objc_storeStrong((id *)&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
}

uint64_t __94__ACUIDataclassConfigurationViewController_operationsHelper_didSaveAccount_withSuccess_error___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isFirstTimeSetup] & 1) != 1) {
    return [*(id *)(a1 + 32) hideActivityInProgressUIWithDelay:0.0];
  }
  id v2 = *(void **)(a1 + 32);
  id v4 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = (id)[v4 localizedStringForKey:@"ACCOUNT_ADDED" value:&stru_1F39EF5C0 table:@"Localizable"];
  objc_msgSend(v2, "stopValidationWithPrompt:showButtons:");

  return [*(id *)(a1 + 32) performSelector:sel__notifyOfAccountSetupCompletion withObject:0 afterDelay:1.0];
}

- (void)_notifyOfAccountSetupCompletion
{
  id v7 = [(ACUIDataclassConfigurationViewController *)self configurationCompletion];

  if (v7)
  {
    id v6 = (void (**)(id, uint64_t))[(ACUIDataclassConfigurationViewController *)self configurationCompletion];
    v6[2](v6, 1);

    [(ACUIDataclassConfigurationViewController *)self setConfigurationCompletion:0];
  }
  else
  {
    id v4 = (id)[(ACUIDataclassConfigurationViewController *)self rootController];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v3 = (id)[(ACUIDataclassConfigurationViewController *)self rootController];
      id v2 = [(ACUIDataclassConfigurationViewController *)self account];
      objc_msgSend(v3, "controller:didFinishSettingUpAccount:", self);
    }
  }
}

- (BOOL)_isShowingDeleteAccountButton
{
  id v2 = (id)[(ACUIDataclassConfigurationViewController *)self specifierForID:@"ACUIDeleteButtonSpecifierID"];
  BOOL v4 = v2 != 0;

  return v4;
}

- (void)appendDeleteAccountButton
{
  if (![(ACUIDataclassConfigurationViewController *)self _isShowingDeleteAccountButton])
  {
    [(ACUIDataclassConfigurationViewController *)self setShouldShowDeleteAccountButton:1];
    id v4 = (id)[MEMORY[0x1E4F92E70] emptyGroupSpecifier];
    -[ACUIDataclassConfigurationViewController addSpecifier:](self, "addSpecifier:");

    char v5 = (void *)MEMORY[0x1E4F92E70];
    id v6 = [(ACUIDataclassConfigurationViewController *)self titleForDeleteButton];
    id v2 = (PSSpecifier *)(id)objc_msgSend(v5, "deleteButtonSpecifierWithName:target:action:");
    deleteButtonSpecifier = self->_deleteButtonSpecifier;
    self->_deleteButtonSpecifier = v2;

    [(PSSpecifier *)self->_deleteButtonSpecifier setProperty:@"ACUIDeleteButtonSpecifierID" forKey:*MEMORY[0x1E4F93188]];
    [(ACUIDataclassConfigurationViewController *)self addSpecifier:self->_deleteButtonSpecifier];
  }
}

- (void)deleteButtonTapped:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = [(ACUIViewController *)v6 accountOperationsHelper];
  id v3 = [(ACUIDataclassConfigurationViewController *)v6 account];
  -[ACUIAccountOperationsHelper removeAccount:](v4, "removeAccount:");

  objc_storeStrong(location, 0);
}

- (BOOL)operationsHelper:(id)a3 shouldRemoveAccount:(id)a4
{
  uint64_t v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  if (v14->_didShowDataclassActionPickerDuringRemoval)
  {
    v14->_didShowDataclassActionPickerDuringRemoval = 0;
    char v15 = 1;
  }
  else
  {
    char v11 = [(ACUIDataclassConfigurationViewController *)v14 _promptUserToConfirmAccountDeletion];
    char v9 = 0;
    char v7 = 0;
    BOOL v5 = 0;
    if (v11)
    {
      BOOL v5 = 0;
      if (ACDAccountSyncEnabled())
      {
        id v10 = (id)ACDAccountSyncDevices();
        char v9 = 1;
        BOOL v5 = 0;
        if ([v10 count])
        {
          id v8 = [(ACUIDataclassConfigurationViewController *)v14 account];
          char v7 = 1;
          BOOL v5 = 0;
          if (ACDAccountSyncAccountIsSyncable()) {
            BOOL v5 = [(ACUIDataclassConfigurationViewController *)v14 isAppleMailAccount:v12];
          }
        }
      }
    }
    if (v7) {

    }
    if (v9) {
    if (v5)
    }
      char v11 = [(ACUIDataclassConfigurationViewController *)v14 _confirmSyncDelete];
    char v15 = v11;
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v15 & 1;
}

- (int64_t)operationsHelper:(id)a3 shouldRemoveOrDisableAccount:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  char v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  if (v11->_didShowDataclassActionPickerDuringRemoval)
  {
    v11->_didShowDataclassActionPickerDuringRemoval = 0;
    int64_t v12 = (int64_t)&stru_1F39EF5C0;
    int v8 = 1;
  }
  else
  {
    uint64_t v7 = [(ACUIDataclassConfigurationViewController *)v11 _promptUserToConfirmAccountSyncDeletion];
    os_log_t oslog = (os_log_t)_ACUILogSystem();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_3_8_32_4_0_8_0((uint64_t)v13, (uint64_t)"-[ACUIDataclassConfigurationViewController operationsHelper:shouldRemoveOrDisableAccount:]", 1099, v7);
      _os_log_debug_impl(&dword_1DDFE5000, oslog, OS_LOG_TYPE_DEBUG, "%s (%d) \"The button index returned was %ld\"", v13, 0x1Cu);
    }
    objc_storeStrong((id *)&oslog, 0);
    if (v7)
    {
      if (v7 != 1) {
        goto LABEL_14;
      }
      if (![(ACUIDataclassConfigurationViewController *)v11 isAppleMailAccount:v9])
      {
        int64_t v12 = 2;
        int v8 = 1;
        goto LABEL_15;
      }
      if (![(ACUIDataclassConfigurationViewController *)v11 _confirmSyncDelete])
      {
LABEL_14:
        int64_t v12 = 0;
        int v8 = 1;
        goto LABEL_15;
      }
      int64_t v12 = 2;
      int v8 = 1;
    }
    else
    {
      int64_t v12 = 1;
      int v8 = 1;
    }
  }
LABEL_15:
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v12;
}

- (BOOL)_promptUserToConfirmAccountDeletion
{
  v43[2] = *MEMORY[0x1E4F143B8];
  id v41 = self;
  SEL v40 = a2;
  uint64_t v35 = 0;
  os_log_type_t v36 = &v35;
  int v37 = 0x20000000;
  int v38 = 32;
  char v39 = 0;
  id v34 = 0;
  id v33 = 0;
  char v31 = 0;
  char v29 = 0;
  char IsSyncable = 0;
  if (ACDAccountSyncEnabled())
  {
    id v32 = (id)ACDAccountSyncDevices();
    char v31 = 1;
    char IsSyncable = 0;
    if ([v32 count])
    {
      id v30 = [(ACUIDataclassConfigurationViewController *)v41 account];
      char v29 = 1;
      char IsSyncable = ACDAccountSyncAccountIsSyncable();
    }
  }
  if (v29) {

  }
  if (v31) {
  if (IsSyncable)
  }
  {
    id v17 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v16 = (id)[v17 localizedStringForKey:@"DELETE_ACCOUNT_SYNC" value:&stru_1F39EF5C0 table:@"Localizable"];
    v43[0] = v16;
    id v15 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v14 = (id)[v15 localizedStringForKey:@"CANCEL" value:&stru_1F39EF5C0 table:@"Localizable"];
    v43[1] = v14;
    id v2 = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
    id v3 = v34;
    id v34 = v2;

    id v4 = [(ACUIDataclassConfigurationViewController *)v41 deviceMessage];
  }
  else
  {
    id v13 = [(ACUIDataclassConfigurationViewController *)v41 titleForDeleteButton];
    v42[0] = v13;
    id v12 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v11 = (id)[v12 localizedStringForKey:@"CANCEL" value:&stru_1F39EF5C0 table:@"Localizable"];
    v42[1] = v11;
    id v6 = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
    id v7 = v34;
    id v34 = v6;

    id v4 = [(ACUIDataclassConfigurationViewController *)v41 messageForAccountDeletionWarning];
  }
  id v5 = v33;
  id v33 = v4;

  id v28 = dispatch_semaphore_create(0);
  queue = MEMORY[0x1E4F14428];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  int v20 = -1073741824;
  int v21 = 0;
  id v22 = __79__ACUIDataclassConfigurationViewController__promptUserToConfirmAccountDeletion__block_invoke;
  uint64_t v23 = &unk_1E6D20498;
  int v24 = v41;
  id v25 = v34;
  id v26 = v33;
  v27[1] = &v35;
  v27[0] = v28;
  dispatch_async(queue, &v19);

  dispatch_semaphore_wait((dispatch_semaphore_t)v28, 0xFFFFFFFFFFFFFFFFLL);
  char v9 = *((unsigned char *)v36 + 24);
  objc_storeStrong(v27, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong((id *)&v24, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  _Block_object_dispose(&v35, 8);
  return v9 & 1;
}

void __79__ACUIDataclassConfigurationViewController__promptUserToConfirmAccountDeletion__block_invoke(uint64_t a1)
{
  v12[3] = (id)a1;
  v12[2] = (id)a1;
  id v4 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v5 = (id)[v4 titleForDeleteButton];
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v6 = MEMORY[0x1E4F143A8];
  int v7 = -1073741824;
  int v8 = 0;
  char v9 = __79__ACUIDataclassConfigurationViewController__promptUserToConfirmAccountDeletion__block_invoke_2;
  id v10 = &unk_1E6D1FF08;
  v12[1] = *(id *)(a1 + 64);
  id v11 = *(id *)(a1 + 40);
  v12[0] = *(id *)(a1 + 56);
  objc_msgSend(v4, "showConfirmationWithButtons:title:message:destructive:completion:", v2, v5, v3, 1);

  objc_storeStrong(v12, 0);
  objc_storeStrong(&v11, 0);
}

intptr_t __79__ACUIDataclassConfigurationViewController__promptUserToConfirmAccountDeletion__block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2 != [*(id *)(a1 + 32) count] - 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (int64_t)_promptUserToConfirmAccountSyncDeletion
{
  void v30[3] = *MEMORY[0x1E4F143B8];
  char v29 = self;
  SEL v28 = a2;
  uint64_t v23 = 0;
  int v24 = &v23;
  int v25 = 0x20000000;
  int v26 = 32;
  uint64_t v27 = 0;
  id v10 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v9 = (id)[v10 localizedStringForKey:@"TURN_OFF" value:&stru_1F39EF5C0 table:@"Localizable"];
  v30[0] = v9;
  id v8 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v7 = (id)[v8 localizedStringForKey:@"DELETE_ACCOUNT_SYNC" value:&stru_1F39EF5C0 table:@"Localizable"];
  v30[1] = v7;
  id v6 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = (id)[v6 localizedStringForKey:@"CANCEL" value:&stru_1F39EF5C0 table:@"Localizable"];
  v30[2] = v5;
  id v22 = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:3];

  id v21 = [(ACUIDataclassConfigurationViewController *)v29 deviceMessage];
  id v20 = dispatch_semaphore_create(0);
  queue = MEMORY[0x1E4F14428];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  int v12 = -1073741824;
  int v13 = 0;
  id v14 = __83__ACUIDataclassConfigurationViewController__promptUserToConfirmAccountSyncDeletion__block_invoke;
  id v15 = &unk_1E6D20498;
  id v16 = v29;
  id v17 = v22;
  id v18 = v21;
  v19[1] = &v23;
  v19[0] = v20;
  dispatch_async(queue, &v11);

  dispatch_semaphore_wait((dispatch_semaphore_t)v20, 0xFFFFFFFFFFFFFFFFLL);
  int64_t v3 = v24[3];
  objc_storeStrong(v19, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong((id *)&v16, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  _Block_object_dispose(&v23, 8);
  return v3;
}

void __83__ACUIDataclassConfigurationViewController__promptUserToConfirmAccountSyncDeletion__block_invoke(uint64_t a1)
{
  v12[3] = (id)a1;
  v12[2] = (id)a1;
  id v4 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v6 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = (id)[v6 localizedStringForKey:@"DELETE_ACCOUNT" value:&stru_1F39EF5C0 table:@"Localizable"];
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  int v8 = -1073741824;
  int v9 = 0;
  id v10 = __83__ACUIDataclassConfigurationViewController__promptUserToConfirmAccountSyncDeletion__block_invoke_2;
  uint64_t v11 = &unk_1E6D204C0;
  v12[1] = *(id *)(a1 + 64);
  v12[0] = *(id *)(a1 + 56);
  objc_msgSend(v4, "showConfirmationWithButtons:title:message:destructive:completion:", v2, v5, v3, 1);

  objc_storeStrong(v12, 0);
}

intptr_t __83__ACUIDataclassConfigurationViewController__promptUserToConfirmAccountSyncDeletion__block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)deviceMessage
{
  char v31 = self;
  SEL v30 = a2;
  id v29 = (id)ACDAccountSyncDevices();
  id location = (id)[MEMORY[0x1E4F1CA80] setWithArray:v29];
  if (![location count] && !objc_msgSend(location, "count"))
  {
    id v19 = (id)[MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:v30, v31, @"ACUIDataclassConfigurationViewController.m", 1180, @"No devices found for Account Sync Delete UI %@.", objc_opt_class() object file lineNumber description];
  }
  if ([location count] == 1)
  {
    int v12 = NSString;
    id v18 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v17 = (id)objc_msgSend(v18, "localizedStringForKey:value:table:", @"DELETE_ACCOUNT_SYNC_WARNING_FORMAT_ONE_DEVICE");
    id v16 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v15 = (id)[v16 localizedStringForKey:@"DATA" value:&stru_1F39EF5C0 table:@"Localizable"];
    id v14 = (id)[location allObjects];
    id v13 = (id)[v14 firstObject];
    id v32 = (id)objc_msgSend(v12, "stringWithFormat:", v17, v15, v13);
  }
  else
  {
    id v2 = (id)[location allObjects];
    id v3 = v29;
    id v29 = v2;

    uint64_t v11 = NSString;
    char v26 = 0;
    char v24 = 0;
    char v22 = 0;
    char v20 = 0;
    if ([location count] == 2)
    {
      id v27 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      char v26 = 1;
      id v25 = (id)[v27 localizedStringForKey:@"DELETE_ACCOUNT_SYNC_WARNING_FORMAT_TWO_DEVICES" value:&stru_1F39EF5C0 table:@"Localizable"];
      char v24 = 1;
      id v10 = v25;
    }
    else
    {
      id v23 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      char v22 = 1;
      id v21 = (id)[v23 localizedStringForKey:@"DELETE_ACCOUNT_SYNC_WARNING_FORMAT_THREE_OR_MORE_DEVICES" value:&stru_1F39EF5C0 table:@"Localizable"];
      char v20 = 1;
      id v10 = v21;
    }
    id v9 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v8 = (id)[v9 localizedStringForKey:@"DATA" value:&stru_1F39EF5C0 table:@"Localizable"];
    id v7 = (id)[v29 objectAtIndex:0];
    id v6 = (id)[v29 objectAtIndex:1];
    id v32 = (id)objc_msgSend(v11, "stringWithFormat:", v10, v8, v7, v6);

    if (v20) {
    if (v22)
    }

    if (v24) {
    if (v26)
    }
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v29, 0);
  id v4 = v32;
  return v4;
}

- (BOOL)isAppleMailAccount:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = (id)[location[0] accountType];
  id v17 = (id)[v16 identifier];
  char v3 = [v17 isEqualToString:*MEMORY[0x1E4F177E8]];
  char v23 = 0;
  char v21 = 0;
  char v18 = 1;
  if ((v3 & 1) == 0)
  {
    id v24 = (id)[location[0] accountType];
    char v23 = 1;
    id v22 = (id)[v24 identifier];
    char v21 = 1;
    char v18 = [v22 isEqualToString:*MEMORY[0x1E4F177F0]];
  }
  if (v21) {

  }
  if (v23) {
  if (v18)
  }
  {
    id v20 = &unk_1F39F6188;
    id v19 = 0;
    id v14 = (id)[location[0] objectForKeyedSubscript:*MEMORY[0x1E4F176A8]];
    uint64_t v15 = [v14 length];

    if (v15)
    {
      id v13 = (id)[location[0] objectForKeyedSubscript:*MEMORY[0x1E4F176A8]];
      id v4 = (id)[v13 lowercaseString];
      id v5 = v19;
      id v19 = v4;
    }
    else
    {
      id v11 = (id)[location[0] objectForKeyedSubscript:*MEMORY[0x1E4F17668]];
      uint64_t v12 = [v11 length];

      if (v12)
      {
        id v10 = (id)[location[0] objectForKeyedSubscript:*MEMORY[0x1E4F17668]];
        id v6 = (id)[v10 lowercaseString];
        id v7 = v19;
        id v19 = v6;
      }
    }
    char v26 = objc_msgSend(v20, "containsObject:", v19, &v19) & 1;
    objc_storeStrong(v9, 0);
    objc_storeStrong(&v20, 0);
  }
  else
  {
    char v26 = 0;
  }
  objc_storeStrong(location, 0);
  return v26 & 1;
}

- (void)operationsHelper:(id)a3 willRemoveAccount:(id)a4
{
  uint64_t v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  queue = MEMORY[0x1E4F14428];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  int v8 = -1073741824;
  int v9 = 0;
  id v10 = __79__ACUIDataclassConfigurationViewController_operationsHelper_willRemoveAccount___block_invoke;
  id v11 = &unk_1E6D20118;
  uint64_t v12 = v15;
  dispatch_async(queue, &v7);

  v6.receiver = v15;
  v6.super_class = (Class)ACUIDataclassConfigurationViewController;
  [(ACUIViewController *)&v6 operationsHelper:location[0] willRemoveAccount:v13];
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __79__ACUIDataclassConfigurationViewController_operationsHelper_willRemoveAccount___block_invoke(id *a1)
{
  v5[2] = a1;
  v5[1] = a1;
  if ((*((unsigned char *)a1[4] + 1480) & 1) == 1)
  {
    id v1 = a1[4];
    id v3 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v2 = (id)[v3 localizedStringForKey:@"SAVING" value:&stru_1F39EF5C0 table:@"Localizable"];
    objc_msgSend(v1, "showActivityInProgressUIWithMessage:");
  }
  else
  {
    v5[0] = (id)[a1[4] messageForAccountDeletionProgressUI];
    [a1[4] showActivityInProgressUIWithMessage:v5[0]];
    objc_storeStrong(v5, 0);
  }
}

- (void)operationsHelper:(id)a3 didRemoveAccount:(id)a4 withSuccess:(BOOL)a5 error:(id)a6
{
  id v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = 0;
  objc_storeStrong(&v20, a4);
  BOOL v19 = a5;
  id v18 = 0;
  objc_storeStrong(&v18, a6);
  v22->_isMergingSyncData = 0;
  queue = MEMORY[0x1E4F14428];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  int v12 = -1073741824;
  int v13 = 0;
  id v14 = __96__ACUIDataclassConfigurationViewController_operationsHelper_didRemoveAccount_withSuccess_error___block_invoke;
  uint64_t v15 = &unk_1E6D1FE88;
  id v16 = v22;
  BOOL v17 = v19;
  dispatch_async(queue, &v11);

  v10.receiver = v22;
  v10.super_class = (Class)ACUIDataclassConfigurationViewController;
  [(ACUIViewController *)&v10 operationsHelper:location[0] didRemoveAccount:v20 withSuccess:v19 error:v18];
  objc_storeStrong((id *)&v16, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

void __96__ACUIDataclassConfigurationViewController_operationsHelper_didRemoveAccount_withSuccess_error___block_invoke(uint64_t a1)
{
  v11[2] = (id)a1;
  v11[1] = (id)a1;
  [*(id *)(a1 + 32) hideActivityInProgressUI];
  if ((*(unsigned char *)(a1 + 40) & 1) == 0)
  {
    id v1 = (void *)MEMORY[0x1E4F42728];
    id v5 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v4 = (id)objc_msgSend(v5, "localizedStringForKey:value:table:", @"COULDNT_DELETE_ACCOUNT");
    id v3 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v2 = (id)[v3 localizedStringForKey:@"COULDNT_DELETE_ACCOUNT_DESCRIPTION" value:&stru_1F39EF5C0 table:@"Localizable"];
    v11[0] = (id)objc_msgSend(v1, "alertControllerWithTitle:message:preferredStyle:", v4);

    objc_super v6 = (void *)MEMORY[0x1E4F42720];
    id v8 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v7 = (id)[v8 localizedStringForKey:@"OK" value:&stru_1F39EF5C0 table:@"Localizable"];
    id v10 = (id)objc_msgSend(v6, "actionWithTitle:style:handler:");

    [v11[0] addAction:v10];
    [*(id *)(a1 + 32) presentViewController:v11[0] animated:1 completion:0];
    objc_storeStrong(&v10, 0);
    objc_storeStrong(v11, 0);
  }
}

- (BOOL)_confirmKeepLocalDataForDataclasses:(id)a3
{
  v67[2] = *MEMORY[0x1E4F143B8];
  char v65 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v59 = 0;
  id v60 = &v59;
  int v61 = 0x20000000;
  int v62 = 32;
  char v63 = 0;
  id v34 = (id)[location[0] lastObject];
  id v58 = +[ACUILocalization localizedTitleForDataclass:](ACUILocalization, "localizedTitleForDataclass:");

  id v33 = NSString;
  id v32 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v31 = (id)[v32 localizedStringForKey:@"REALLY_KEEP_EXISTING_DATA_WARNING_FORMAT_TITLE" value:&stru_1F39EF5C0 table:@"Localizable"];
  id v57 = (id)[v33 stringWithFormat:v58];

  id v56 = 0;
  char v54 = 0;
  char v52 = 0;
  char IsSyncable = 0;
  if (ACDAccountSyncEnabled())
  {
    id v55 = (id)ACDAccountSyncDevices();
    char v54 = 1;
    char IsSyncable = 0;
    if ([v55 count])
    {
      int v53 = [(ACUIDataclassConfigurationViewController *)v65 account];
      char v52 = 1;
      char IsSyncable = ACDAccountSyncAccountIsSyncable();
    }
  }
  if (v52) {

  }
  if (v54) {
  if (IsSyncable)
  }
  {
    id v29 = NSString;
    id v28 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v26 = (id)[v28 localizedStringForKey:@"REALLY_KEEP_EXISTING_DATA_WARNING_ACCOUNT_SYNC_FORMAT" value:&stru_1F39EF5C0 table:@"Localizable"];
    id v27 = location[0];
    id v25 = [(ACUIDataclassConfigurationViewController *)v65 account];
    id v24 = +[ACUILocalization localizedTextForDataclasses:usedAtBeginningOfSentence:forAccount:](ACUILocalization, "localizedTextForDataclasses:usedAtBeginningOfSentence:forAccount:", v27, 0);
    id v3 = (id)objc_msgSend(v29, "stringWithFormat:", v26, v24);
    id v4 = v56;
    id v56 = v3;
  }
  else
  {
    char v23 = NSString;
    id v22 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v20 = (id)[v22 localizedStringForKey:@"REALLY_KEEP_EXISTING_DATA_WARNING_FORMAT" value:&stru_1F39EF5C0 table:@"Localizable"];
    id v21 = location[0];
    BOOL v19 = [(ACUIDataclassConfigurationViewController *)v65 account];
    id v18 = +[ACUILocalization localizedTextForDataclasses:usedAtBeginningOfSentence:forAccount:](ACUILocalization, "localizedTextForDataclasses:usedAtBeginningOfSentence:forAccount:", v21, 0);
    id v5 = (id)objc_msgSend(v23, "stringWithFormat:", v20, v18);
    id v6 = v56;
    id v56 = v5;
  }
  char v49 = 0;
  char v47 = 0;
  uint64_t v66 = 0;
  id v16 = (id)[MEMORY[0x1E4F42948] currentDevice];
  uint64_t v17 = [v16 userInterfaceIdiom];

  uint64_t v66 = v17;
  BOOL v15 = 1;
  if (v17 != 1) {
    BOOL v15 = v66 == 5;
  }
  if (v15)
  {
    id v7 = @"KEEP";
  }
  else
  {
    id v50 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    char v49 = 1;
    id v48 = (id)[v50 localizedStringForKey:@"KEEP_LOCAL_DATA" value:&stru_1F39EF5C0 table:@"Localizable"];
    char v47 = 1;
    id v7 = (__CFString *)v48;
  }
  id v51 = v7;
  if (v47) {

  }
  if (v49) {
  id v14 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  }
  id v13 = (id)[v14 localizedStringForKey:v51 value:&stru_1F39EF5C0 table:@"Localizable"];
  v67[0] = v13;
  id v12 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v11 = (id)[v12 localizedStringForKey:@"CANCEL" value:&stru_1F39EF5C0 table:@"Localizable"];
  v67[1] = v11;
  id v46 = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:2];

  id v45 = dispatch_semaphore_create(0);
  queue = MEMORY[0x1E4F14428];
  uint64_t v35 = MEMORY[0x1E4F143A8];
  int v36 = -1073741824;
  int v37 = 0;
  int v38 = __80__ACUIDataclassConfigurationViewController__confirmKeepLocalDataForDataclasses___block_invoke;
  char v39 = &unk_1E6D20510;
  id v40 = v46;
  v44[1] = &v59;
  id v41 = v45;
  os_log_type_t v42 = v65;
  id v43 = v57;
  v44[0] = v56;
  dispatch_async(queue, &v35);

  dispatch_semaphore_wait((dispatch_semaphore_t)v45, 0xFFFFFFFFFFFFFFFFLL);
  char v9 = *((unsigned char *)v60 + 24);
  objc_storeStrong(v44, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong((id *)&v42, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v51, 0);
  objc_storeStrong(&v56, 0);
  objc_storeStrong(&v57, 0);
  objc_storeStrong(&v58, 0);
  _Block_object_dispose(&v59, 8);
  objc_storeStrong(location, 0);
  return v9 & 1;
}

void __80__ACUIDataclassConfigurationViewController__confirmKeepLocalDataForDataclasses___block_invoke(uint64_t a1)
{
  v9[2] = (id)a1;
  v9[1] = (id)a1;
  uint64_t v2 = MEMORY[0x1E4F143A8];
  int v3 = -1073741824;
  int v4 = 0;
  id v5 = __80__ACUIDataclassConfigurationViewController__confirmKeepLocalDataForDataclasses___block_invoke_2;
  id v6 = &unk_1E6D204E8;
  id v7 = *(id *)(a1 + 32);
  v8[1] = *(id *)(a1 + 72);
  v8[0] = *(id *)(a1 + 40);
  v9[0] = (id)MEMORY[0x1E01CBE70]();
  [*(id *)(a1 + 48) showConfirmationWithButtons:*(void *)(a1 + 32) title:*(void *)(a1 + 56) message:*(void *)(a1 + 64) destructive:0 completion:v9[0]];
  objc_storeStrong(v9, 0);
  objc_storeStrong(v8, 0);
  objc_storeStrong(&v7, 0);
}

intptr_t __80__ACUIDataclassConfigurationViewController__confirmKeepLocalDataForDataclasses___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2 != [*(id *)(a1 + 32) count] - 1) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)_confirmDeleteLocalDataForDataclasses:(id)a3
{
  v57[2] = *MEMORY[0x1E4F143B8];
  id v56 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v50 = 0;
  id v51 = &v50;
  int v52 = 0x20000000;
  int v53 = 32;
  char v54 = 0;
  id v30 = (id)[location[0] lastObject];
  id v49 = +[ACUILocalization localizedTitleForDataclass:](ACUILocalization, "localizedTitleForDataclass:");

  id v29 = NSString;
  id v28 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v27 = (id)[v28 localizedStringForKey:@"REALLY_DELETE_EXISTING_DATA_WARNING_FORMAT_TITLE" value:&stru_1F39EF5C0 table:@"Localizable"];
  id v48 = (id)[v29 stringWithFormat:v49];

  id v47 = 0;
  char v45 = 0;
  char v43 = 0;
  char IsSyncable = 0;
  if (ACDAccountSyncEnabled())
  {
    id v46 = (id)ACDAccountSyncDevices();
    char v45 = 1;
    char IsSyncable = 0;
    if ([v46 count])
    {
      BOOL v44 = [(ACUIDataclassConfigurationViewController *)v56 account];
      char v43 = 1;
      char IsSyncable = ACDAccountSyncAccountIsSyncable();
    }
  }
  if (v43) {

  }
  if (v45) {
  if (IsSyncable)
  }
  {
    id v25 = NSString;
    id v24 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v22 = (id)[v24 localizedStringForKey:@"REALLY_DELETE_EXISTING_DATA_WARNING_FORMAT_ACCOUNT_SYNC" value:&stru_1F39EF5C0 table:@"Localizable"];
    id v23 = location[0];
    id v21 = [(ACUIDataclassConfigurationViewController *)v56 account];
    id v20 = +[ACUILocalization localizedTextForDataclasses:usedAtBeginningOfSentence:forAccount:](ACUILocalization, "localizedTextForDataclasses:usedAtBeginningOfSentence:forAccount:", v23, 0);
    id v3 = (id)objc_msgSend(v25, "stringWithFormat:", v22, v20);
    id v4 = v47;
    id v47 = v3;
  }
  else
  {
    BOOL v19 = NSString;
    id v18 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v16 = (id)[v18 localizedStringForKey:@"REALLY_DELETE_EXISTING_DATA_WARNING_FORMAT" value:&stru_1F39EF5C0 table:@"Localizable"];
    id v17 = location[0];
    BOOL v15 = [(ACUIDataclassConfigurationViewController *)v56 account];
    id v14 = +[ACUILocalization localizedTextForDataclasses:usedAtBeginningOfSentence:forAccount:](ACUILocalization, "localizedTextForDataclasses:usedAtBeginningOfSentence:forAccount:", v17, 0);
    id v5 = (id)objc_msgSend(v19, "stringWithFormat:", v16, v14);
    id v6 = v47;
    id v47 = v5;
  }
  id v13 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v12 = (id)[v13 localizedStringForKey:@"DELETE" value:&stru_1F39EF5C0 table:@"Localizable"];
  v57[0] = v12;
  id v11 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v10 = (id)[v11 localizedStringForKey:@"CANCEL" value:&stru_1F39EF5C0 table:@"Localizable"];
  v57[1] = v10;
  id v42 = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];

  id v41 = dispatch_semaphore_create(0);
  queue = MEMORY[0x1E4F14428];
  uint64_t v31 = MEMORY[0x1E4F143A8];
  int v32 = -1073741824;
  int v33 = 0;
  id v34 = __82__ACUIDataclassConfigurationViewController__confirmDeleteLocalDataForDataclasses___block_invoke;
  uint64_t v35 = &unk_1E6D20510;
  id v36 = v42;
  v40[1] = &v50;
  id v37 = v41;
  int v38 = v56;
  id v39 = v48;
  v40[0] = v47;
  dispatch_async(queue, &v31);

  dispatch_semaphore_wait((dispatch_semaphore_t)v41, 0xFFFFFFFFFFFFFFFFLL);
  char v8 = *((unsigned char *)v51 + 24);
  objc_storeStrong(v40, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong((id *)&v38, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(&v49, 0);
  _Block_object_dispose(&v50, 8);
  objc_storeStrong(location, 0);
  return v8 & 1;
}

void __82__ACUIDataclassConfigurationViewController__confirmDeleteLocalDataForDataclasses___block_invoke(uint64_t a1)
{
  v9[2] = (id)a1;
  v9[1] = (id)a1;
  uint64_t v2 = MEMORY[0x1E4F143A8];
  int v3 = -1073741824;
  int v4 = 0;
  id v5 = __82__ACUIDataclassConfigurationViewController__confirmDeleteLocalDataForDataclasses___block_invoke_2;
  id v6 = &unk_1E6D204E8;
  id v7 = *(id *)(a1 + 32);
  v8[1] = *(id *)(a1 + 72);
  v8[0] = *(id *)(a1 + 40);
  v9[0] = (id)MEMORY[0x1E01CBE70]();
  [*(id *)(a1 + 48) showConfirmationWithButtons:*(void *)(a1 + 32) title:*(void *)(a1 + 56) message:*(void *)(a1 + 64) destructive:1 completion:v9[0]];
  objc_storeStrong(v9, 0);
  objc_storeStrong(v8, 0);
  objc_storeStrong(&v7, 0);
}

intptr_t __82__ACUIDataclassConfigurationViewController__confirmDeleteLocalDataForDataclasses___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2 != [*(id *)(a1 + 32) count] - 1) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)_confirmSyncDelete
{
  id v25 = self;
  SEL v24 = a2;
  uint64_t v19 = 0;
  id v20 = &v19;
  int v21 = 0x20000000;
  int v22 = 32;
  char v23 = 0;
  id v18 = @"(AppleInternal) Are you sure you want to delete your Apple Mail account EVERYWHERE?";
  id v17 = [(ACUIDataclassConfigurationViewController *)v25 deviceMessage];
  id v16 = &unk_1F39F61A0;
  dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
  queue = MEMORY[0x1E4F14428];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  int v6 = -1073741824;
  int v7 = 0;
  char v8 = __62__ACUIDataclassConfigurationViewController__confirmSyncDelete__block_invoke;
  char v9 = &unk_1E6D20510;
  id v10 = v16;
  v14[1] = &v19;
  id v11 = v15;
  id v12 = v25;
  id v13 = v18;
  v14[0] = v17;
  dispatch_async(queue, &v5);

  dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  char v4 = *((unsigned char *)v20 + 24);
  objc_storeStrong(v14, 0);
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong((id *)&v18, 0);
  _Block_object_dispose(&v19, 8);
  return v4 & 1;
}

void __62__ACUIDataclassConfigurationViewController__confirmSyncDelete__block_invoke(uint64_t a1)
{
  v9[2] = (id)a1;
  v9[1] = (id)a1;
  uint64_t v2 = MEMORY[0x1E4F143A8];
  int v3 = -1073741824;
  int v4 = 0;
  uint64_t v5 = __62__ACUIDataclassConfigurationViewController__confirmSyncDelete__block_invoke_2;
  int v6 = &unk_1E6D204E8;
  id v7 = *(id *)(a1 + 32);
  v8[1] = *(id *)(a1 + 72);
  v8[0] = *(id *)(a1 + 40);
  v9[0] = (id)MEMORY[0x1E01CBE70]();
  [*(id *)(a1 + 48) showConfirmationWithButtons:*(void *)(a1 + 32) title:*(void *)(a1 + 56) message:*(void *)(a1 + 64) destructive:1 completion:v9[0]];
  objc_storeStrong(v9, 0);
  objc_storeStrong(v8, 0);
  objc_storeStrong(&v7, 0);
}

intptr_t __62__ACUIDataclassConfigurationViewController__confirmSyncDelete__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2 != [*(id *)(a1 + 32) count] - 1) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v25 = 0;
  objc_storeStrong(&v25, a4);
  id v24 = 0;
  v23.receiver = v27;
  v23.super_class = (Class)ACUIDataclassConfigurationViewController;
  id v4 = [(ACUIDataclassConfigurationViewController *)&v23 tableView:location[0] cellForRowAtIndexPath:v25];
  id v5 = v24;
  id v24 = v4;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v22 = (id)[v24 textField];
    if (v22)
    {
      if (v27->_textFieldTextDidChangeObserver)
      {
        id v13 = (id)[MEMORY[0x1E4F28EB8] defaultCenter];
        [v13 removeObserver:v27->_textFieldTextDidChangeObserver name:*MEMORY[0x1E4F43E28] object:v22];
      }
      objc_initWeak(&from, v27);
      id v10 = (id)[MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v11 = *MEMORY[0x1E4F43E28];
      id v12 = v22;
      uint64_t v15 = MEMORY[0x1E4F143A8];
      int v16 = -1073741824;
      int v17 = 0;
      id v18 = __76__ACUIDataclassConfigurationViewController_tableView_cellForRowAtIndexPath___block_invoke;
      uint64_t v19 = &unk_1E6D20538;
      objc_copyWeak(&v20, &from);
      id v6 = (id)[v10 addObserverForName:v11 object:v12 queue:0 usingBlock:&v15];
      id textFieldTextDidChangeObserver = v27->_textFieldTextDidChangeObserver;
      v27->_id textFieldTextDidChangeObserver = v6;

      objc_destroyWeak(&v20);
      objc_destroyWeak(&from);
    }
    [v22 setDelegate:v27];
    objc_storeStrong(&v22, 0);
  }
  id v9 = v24;
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  return v9;
}

void __76__ACUIDataclassConfigurationViewController_tableView_cellForRowAtIndexPath___block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  [v3[0] _textFieldValueDidChange:location[0]];
  objc_storeStrong(v3, 0);
  objc_storeStrong(location, 0);
}

- (void)_textFieldValueDidChange:(id)a3
{
  int v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  for (int i = 0; ; ++i)
  {
    unint64_t v11 = i;
    if (v11 >= [*(id *)((char *)&v17->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]) count])break; {
    id v14 = (id)[(ACUIDataclassConfigurationViewController *)v17 indexPathForIndex:i];
    }
    id v9 = (id)[*(id *)((char *)&v17->super.super.super.super.super.super.isa+ (int)*MEMORY[0x1E4F92F10]) cellForRowAtIndexPath:v14];
    char v10 = [v9 isEditing];

    if (v10)
    {
      id v13 = (id)[*(id *)((char *)&v17->super.super.super.super.super.super.isa+ (int)*MEMORY[0x1E4F92F10]) cellForRowAtIndexPath:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = (id)[v13 textField];
        id v12 = (id)[v8 text];

        [(ACUIDataclassConfigurationViewController *)v17 _setDescription:v12];
        objc_storeStrong(&v12, 0);
      }
      objc_storeStrong(&v13, 0);
    }
    objc_storeStrong(&v14, 0);
  }
  id v6 = [(ACUIDataclassConfigurationViewController *)v17 account];
  id v5 = [(ACAccount *)v6 accountDescription];
  BOOL v7 = [(NSString *)v5 isEqualToString:v17->_initialAccountDescription];

  if (v7)
  {
    id v4 = (id)[(ACUIDataclassConfigurationViewController *)v17 navigationItem];
    id v3 = (id)[v4 rightBarButtonItem];
    [v3 setHidden:1];
  }
  else
  {
    [(ACUIDataclassConfigurationViewController *)v17 _updateDoneButton];
  }
  objc_storeStrong(location, 0);
}

- (void)_updateDoneButton
{
  id v3 = (id)[(ACUIDataclassConfigurationViewController *)self navigationItem];
  id v2 = (id)[v3 rightBarButtonItem];
  [v2 setHidden:0];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] resignFirstResponder];
  id v4 = v9;
  id v5 = (id)[location[0] text];
  -[ACUIDataclassConfigurationViewController _setDescription:](v4, "_setDescription:");

  id v7 = (id)[(ACUIDataclassConfigurationViewController *)v9 navigationItem];
  id v6 = (id)[v7 rightBarButtonItem];
  [v6 setHidden:1];

  objc_storeStrong(location, 0);
  return 1;
}

- (BOOL)isFirstTimeSetup
{
  return self->_firstTimeSetup;
}

- (NSArray)preEnabledDataclasses
{
  return self->_preEnabledDataclasses;
}

- (void)setPreEnabledDataclasses:(id)a3
{
}

- (void)setAccount:(id)a3
{
}

- (PSSpecifier)dataclassGroupSpecifier
{
  return self->_dataclassGroupSpecifier;
}

- (void)setDataclassGroupSpecifier:(id)a3
{
}

- (PSSpecifier)deleteButtonSpecifier
{
  return self->_deleteButtonSpecifier;
}

- (BOOL)shouldShowDeleteAccountButton
{
  return self->_shouldShowDeleteAccountButton;
}

- (void)setShouldShowDeleteAccountButton:(BOOL)a3
{
  self->_shouldShowDeleteAccountButton = a3;
}

- (BOOL)shouldEnableDeleteAccountButton
{
  return self->_shouldEnableDeleteAccountButton;
}

- (void)setShouldEnableDeleteAccountButton:(BOOL)a3
{
  self->_shouldEnableDeleteAccountButton = a3;
}

- (BOOL)shouldEnableAccountSummaryCell
{
  return self->_shouldEnableAccountSummaryCell;
}

- (void)setShouldEnableAccountSummaryCell:(BOOL)a3
{
  self->_shouldEnableAccountSummaryCell = a3;
}

- (BOOL)shouldEnableAccountSettingsCell
{
  return self->_shouldEnableAccountSettingsCell;
}

- (void)setShouldEnableAccountSettingsCell:(BOOL)a3
{
  self->_shouldEnableAccountSettingsCell = a3;
}

- (BOOL)shouldEnableDataclassSwitches
{
  return self->_shouldEnableDataclassSwitches;
}

- (void)setShouldEnableDataclassSwitches:(BOOL)a3
{
  self->_shouldEnableDataclassSwitches = a3;
}

- (void)setIsMailSetupForced:(BOOL)a3
{
  self->_isMailSetupForced = a3;
}

- (id)configurationCompletion
{
  return self->_configurationCompletion;
}

- (void)setConfigurationCompletion:(id)a3
{
}

- (BOOL)isAccountModificationDisabled
{
  return self->_isAccountModificationDisabled;
}

- (void)setIsAccountModificationDisabled:(BOOL)a3
{
  self->_isAccountModificationDisabled = a3;
}

- (void).cxx_destruct
{
}

@end