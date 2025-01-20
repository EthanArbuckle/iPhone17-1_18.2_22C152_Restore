@interface ACUIAddAccountViewController
+ (id)_debugStringForAction:(int64_t)a3;
- (ACUIAccountViewProvidersManager)viewProvidersManager;
- (ACUIAddAccountDataSource)addAccountDataSource;
- (ACUIAddAccountViewController)init;
- (BOOL)_viewControllerIsNotAddOrAddOther:(id)a3;
- (BOOL)isStolenDeviceProtectionFeatureAvailableAndEnabled;
- (BOOL)shouldAddSpecifierForAccountTypeID:(id)a3;
- (BOOL)shouldAddSpecifierForOtherAccountTypes;
- (NSString)filteredDataclass;
- (id)_specifierForAOLAccount;
- (id)_specifierForCustomControlledAccountWithName:(id)a3 accountTypeID:(id)a4;
- (id)_specifierForExchangeAccount;
- (id)_specifierForGmailAccount;
- (id)_specifierForOutlookAccount;
- (id)_specifierForPrimaryiCloudAccount;
- (id)_specifierForRegionalAccountType:(id)a3;
- (id)_specifierForYahooAccount;
- (id)_specifierForiCloudAccount;
- (id)_specifiersForRegionalMailAccounts;
- (id)giantSpecifierWithName:(id)a3 forAccountTypeID:(id)a4;
- (id)specifierForOtherAccounts;
- (id)specifiers;
- (void)_addAccountSpecifierWasTapped:(id)a3;
- (void)_alertIfAccountTypePreventsMultiples:(id)a3 withCompletion:(id)a4;
- (void)_allowedToAddAccountTypeID:(id)a3 fromSpecifier:(id)a4;
- (void)_createCustomControlledAccountTapped:(id)a3;
- (void)_dismissAndBecomeFirstResponder;
- (void)_popToLayerAboveAddAccountFlow;
- (void)_presentPrimaryAppleIDSignInController:(id)a3;
- (void)dealloc;
- (void)nonModalDataclassConfigurationControllerDidCompleteWithSuccess:(BOOL)a3;
- (void)setAddAccountDataSource:(id)a3;
- (void)setFilteredDataclass:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)setupViewControllerDidDismiss:(id)a3;
- (void)signInControllerDidCancel;
- (void)signInControllerDidCompleteWithSuccess:(BOOL)a3 error:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ACUIAddAccountViewController

- (ACUIAddAccountViewController)init
{
  SEL v10 = a2;
  v11 = 0;
  v9.receiver = self;
  v9.super_class = (Class)ACUIAddAccountViewController;
  v8 = [(ACUIAddAccountViewController *)&v9 init];
  v11 = v8;
  objc_storeStrong((id *)&v11, v8);
  if (v8)
  {
    uint64_t v2 = SBSSpringBoardServerPort();
    MEMORY[0x1E01CBA70](v2, &v11->_originalCellFlag, &v11->_originalWifiFlag);
    uint64_t v3 = SBSSpringBoardServerPort();
    MEMORY[0x1E01CBAA0](v3, 1);
    v4 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E4F179C8]);
    accountStore = v11->_accountStore;
    v11->_accountStore = v4;
  }
  v7 = v11;
  objc_storeStrong((id *)&v11, 0);
  return v7;
}

- (ACUIAccountViewProvidersManager)viewProvidersManager
{
  return +[ACUIAccountViewProvidersManager sharedInstance];
}

- (ACUIAddAccountDataSource)addAccountDataSource
{
  if (!self->_addAccountDataSource)
  {
    id v4 = (id)[(ACUIAddAccountViewController *)self specifier];
    id v5 = (id)[v4 propertyForKey:@"ACUIAddAccountDataSourceKey"];
    char v6 = 0;
    if (v5)
    {
      objc_storeStrong((id *)&self->_addAccountDataSource, v5);
    }
    else
    {
      v7 = objc_alloc_init(ACUIDefaultAddAccountDataSource);
      char v6 = 1;
      objc_storeStrong((id *)&self->_addAccountDataSource, v7);
    }
    if (v6) {
  }
    }
  addAccountDataSource = self->_addAccountDataSource;
  return addAccountDataSource;
}

- (void)dealloc
{
  id v5 = self;
  SEL v4 = a2;
  uint64_t v2 = SBSSpringBoardServerPort();
  MEMORY[0x1E01CBAA0](v2, v5->_originalCellFlag, v5->_originalWifiFlag);
  v3.receiver = v5;
  v3.super_class = (Class)ACUIAddAccountViewController;
  [(ACUIAddAccountViewController *)&v3 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v9 = self;
  SEL v8 = a2;
  BOOL v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ACUIAddAccountViewController;
  [(ACUIAddAccountViewController *)&v6 viewWillAppear:a3];
  if (([MEMORY[0x1E4F42738] shouldMakeUIForDefaultPNG] & 1) == 0)
  {
    id v5 = (id)[(ACUIAddAccountViewController *)v9 navigationItem];
    id v4 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v3 = (id)[v4 localizedStringForKey:@"ADD_ACCOUNT_TITLE" value:&stru_1F39EF5C0 table:@"Localizable"];
    objc_msgSend(v5, "setTitle:");
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  SEL v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ACUIAddAccountViewController;
  [(ACUIAddAccountViewController *)&v5 viewDidAppear:a3];
  id v3 = (id)[(ACUIAddAccountViewController *)v8 specifier];
  id v4 = (id)[v3 propertyForKey:*MEMORY[0x1E4F93078]];

  +[ACUIUtils emitNavigationEventForSubPane:subPath:account:inHostAppBundleID:](ACUIUtils, "emitNavigationEventForSubPane:subPath:account:inHostAppBundleID:", v8, @"ADD_ACCOUNT");
  objc_storeStrong(&v4, 0);
}

- (void)setSpecifier:(id)a3
{
  SEL v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)ACUIAddAccountViewController;
  [(ACUIAddAccountViewController *)&v5 setSpecifier:location[0]];
  id v3 = (id)[location[0] propertyForKey:*MEMORY[0x1E4F93058]];
  -[ACUIAddAccountViewController setFilteredDataclass:](v7, "setFilteredDataclass:");

  id obj = (id)[location[0] propertyForKey:@"ACUIAddAccountDataSourceKey"];
  if (obj)
  {
    objc_storeStrong((id *)&v7->_addAccountDataSource, obj);
    [(ACUIAddAccountViewController *)v7 reloadSpecifiers];
  }
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)shouldAddSpecifierForAccountTypeID:(id)a3
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  SEL v7 = [(ACUIAddAccountViewController *)v15 addAccountDataSource];
  char v8 = [(ACUIAddAccountDataSource *)v7 shouldAddSpecifierForAccountTypeID:location[0]];

  char v13 = v8 & 1;
  char v11 = 0;
  BOOL v9 = 0;
  if (v8)
  {
    v12 = [(ACUIAddAccountViewController *)v15 filteredDataclass];
    char v11 = 1;
    BOOL v9 = v12 != 0;
  }
  if (v11) {

  }
  if (v9)
  {
    SEL v10 = [(ACAccountStore *)v15->_accountStore accountTypeWithAccountTypeIdentifier:location[0]];
    id v6 = (id)[(ACAccountType *)v10 supportedDataclasses];
    objc_super v5 = [(ACUIAddAccountViewController *)v15 filteredDataclass];
    char v13 = objc_msgSend(v6, "containsObject:") & 1;

    objc_storeStrong((id *)&v10, 0);
  }
  char v4 = v13;
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (BOOL)shouldAddSpecifierForOtherAccountTypes
{
  v16[5] = *MEMORY[0x1E4F143B8];
  char v13 = self;
  location[1] = (id)a2;
  v16[0] = *MEMORY[0x1E4F177E8];
  v16[1] = *MEMORY[0x1E4F17778];
  v16[2] = *MEMORY[0x1E4F17818];
  v16[3] = *MEMORY[0x1E4F17770];
  v16[4] = *MEMORY[0x1E4F17858];
  location[0] = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:5];
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  uint64_t v8 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
  if (v8)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0;
    unint64_t v6 = v8;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void *)(__b[1] + 8 * v5);
      if ([(ACUIAddAccountViewController *)v13 shouldAddSpecifierForAccountTypeID:v11])
      {
        break;
      }
      ++v5;
      if (v3 + 1 >= v6)
      {
        uint64_t v5 = 0;
        unint64_t v6 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
        if (!v6) {
          goto LABEL_9;
        }
      }
    }
    char v14 = 1;
    int v9 = 1;
  }
  else
  {
LABEL_9:
    int v9 = 0;
  }

  if (!v9) {
    char v14 = 0;
  }
  objc_storeStrong(location, 0);
  return v14 & 1;
}

- (id)specifiers
{
  v20 = self;
  v19[1] = (id)a2;
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]))
  {
    id v17 = (id)[(ACUIAddAccountViewController *)v20 table];
    [v17 _setMarginWidth:50.0];

    v19[0] = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (([MEMORY[0x1E4F42738] shouldMakeUIForDefaultPNG] & 1) == 0)
    {
      id v16 = (id)[MEMORY[0x1E4F92E70] emptyGroupSpecifier];
      objc_msgSend(v19[0], "addObject:");

      if ([(ACUIAddAccountViewController *)v20 shouldAddSpecifierForAccountTypeID:*MEMORY[0x1E4F17750]])
      {
        id v15 = [(ACUIAddAccountViewController *)v20 _specifierForiCloudAccount];
        objc_msgSend(v19[0], "addObject:");
      }
      if ([(ACUIAddAccountViewController *)v20 shouldAddSpecifierForAccountTypeID:*MEMORY[0x1E4F17798]])
      {
        id v14 = [(ACUIAddAccountViewController *)v20 _specifierForExchangeAccount];
        objc_msgSend(v19[0], "addObject:");
      }
      if ([(ACUIAddAccountViewController *)v20 shouldAddSpecifierForAccountTypeID:*MEMORY[0x1E4F177E8]])
      {
        id location = [(ACUIAddAccountViewController *)v20 _specifiersForRegionalMailAccounts];
        if ([location count]) {
          [v19[0] addObjectsFromArray:location];
        }
        objc_storeStrong(&location, 0);
      }
      if ([(ACUIAddAccountViewController *)v20 shouldAddSpecifierForAccountTypeID:*MEMORY[0x1E4F177C0]])
      {
        id v12 = v19[0];
        id v13 = [(ACUIAddAccountViewController *)v20 _specifierForGmailAccount];
        objc_msgSend(v12, "addObject:");
      }
      if ([(ACUIAddAccountViewController *)v20 shouldAddSpecifierForAccountTypeID:*MEMORY[0x1E4F17878]])
      {
        id v10 = v19[0];
        id v11 = [(ACUIAddAccountViewController *)v20 _specifierForYahooAccount];
        objc_msgSend(v10, "addObject:");
      }
      if ([(ACUIAddAccountViewController *)v20 shouldAddSpecifierForAccountTypeID:*MEMORY[0x1E4F17740]])
      {
        id v8 = v19[0];
        id v9 = [(ACUIAddAccountViewController *)v20 _specifierForAOLAccount];
        objc_msgSend(v8, "addObject:");
      }
      if ([(ACUIAddAccountViewController *)v20 shouldAddSpecifierForAccountTypeID:*MEMORY[0x1E4F177D0]])
      {
        id v6 = v19[0];
        id v7 = [(ACUIAddAccountViewController *)v20 _specifierForOutlookAccount];
        objc_msgSend(v6, "addObject:");
      }
      if ([(ACUIAddAccountViewController *)v20 shouldAddSpecifierForOtherAccountTypes])
      {
        id v4 = v19[0];
        id v5 = [(ACUIAddAccountViewController *)v20 specifierForOtherAccounts];
        objc_msgSend(v4, "addObject:");
      }
    }
    objc_storeStrong((id *)((char *)&v20->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]), v19[0]);
    objc_storeStrong(v19, 0);
  }
  uint64_t v2 = *(Class *)((char *)&v20->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]);
  return v2;
}

- (id)_specifierForiCloudAccount
{
  id v16 = self;
  v15[1] = (id)a2;
  v15[0] = 0;
  id v10 = [(ACUIAddAccountViewController *)self viewProvidersManager];
  id location = [(ACUIAccountViewProvidersManager *)v10 configurationInfoForCreatingAccountWithType:*MEMORY[0x1E4F17750]];

  char v12 = 0;
  char v11 = 0;
  if (location)
  {
    id v13 = (id)[location objectForKeyedSubscript:@"ACUISpecifierAccountIdentifier"];
    char v12 = 1;
    char v11 = [v13 isEqualToString:@"primary"];
  }
  if (v12) {

  }
  if (v11) {
    id v2 = [(ACUIAddAccountViewController *)v16 _specifierForPrimaryiCloudAccount];
  }
  else {
    id v2 = [(ACUIAddAccountViewController *)v16 giantSpecifierWithName:@"iCloud" forAccountTypeID:*MEMORY[0x1E4F17750]];
  }
  id v3 = v15[0];
  v15[0] = v2;

  id v6 = v15[0];
  id v5 = (void *)MEMORY[0x1E4F42A80];
  id v8 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v7 = (id)objc_msgSend(v5, "imageNamed:inBundle:", @"iCloud");
  objc_msgSend(v6, "setProperty:forKey:");

  [v15[0] accessibilitySetIdentification:@"appleid"];
  id v9 = v15[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v15, 0);
  return v9;
}

- (id)_specifierForPrimaryiCloudAccount
{
  id v8 = self;
  v7[1] = (id)a2;
  v7[0] = (id)[MEMORY[0x1E4F92E70] preferenceSpecifierNamed:@"iCloud" target:self set:0 get:0 detail:0 cell:10 edit:0];
  [v7[0] setButtonAction:sel__presentPrimaryAppleIDSignInController_];
  id v5 = [(ACUIAddAccountViewController *)v8 viewProvidersManager];
  id v4 = [(ACUIAccountViewProvidersManager *)v5 configurationInfoForCreatingAccountWithType:*MEMORY[0x1E4F17750]];
  id location = (id)[v4 mutableCopy];

  if ([location count]) {
    [v7[0] setUserInfo:location];
  }
  id v3 = v7[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v7, 0);
  return v3;
}

- (void)_presentPrimaryAppleIDSignInController:(id)a3
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  Class v12 = 0;
  id v5 = [(ACUIAddAccountViewController *)v14 addAccountDataSource];
  id v6 = (void *)MEMORY[0x1E4F17750];
  uint64_t v3 = *MEMORY[0x1E4F17750];
  id v4 = [(ACUIAddAccountViewController *)v14 viewProvidersManager];
  Class v12 = (Class)-[ACUIAddAccountDataSource viewControllerClassForCreatingAccountWithType:withViewProviderManager:](v5, "viewControllerClassForCreatingAccountWithType:withViewProviderManager:", v3);

  id v11 = objc_alloc_init(v12);
  id v7 = [(ACUIAddAccountViewController *)v14 viewProvidersManager];
  [(ACUIAccountViewProvidersManager *)v7 setDelegate:v14 forSignInController:v11 forAccountWithType:*v6];

  uint64_t v15 = 0;
  id v8 = (id)[MEMORY[0x1E4F42948] currentDevice];
  uint64_t v9 = [v8 userInterfaceIdiom];

  uint64_t v15 = v9;
  BOOL v10 = 1;
  if (v9 != 1) {
    BOOL v10 = v15 == 5;
  }
  if (v10)
  {
    [v11 setModalPresentationStyle:2];
    [v11 setModalTransitionStyle:0];
  }
  -[ACUIAddAccountViewController presentViewController:animated:completion:](v14, "presentViewController:animated:completion:", v11, 1);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)signInControllerDidCompleteWithSuccess:(BOOL)a3 error:(id)a4
{
  id v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  [(ACUIAddAccountViewController *)v8 _dismissAndBecomeFirstResponder];
  if (v6)
  {
    -[ACUIAddAccountViewController setupViewControllerDidDismiss:](v8, "setupViewControllerDidDismiss:");
    id v4 = (id)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"ACUIAccountSetupDidFinish" object:0];
  }
  objc_storeStrong(&location, 0);
}

- (void)signInControllerDidCancel
{
}

- (void)_dismissAndBecomeFirstResponder
{
  v8[2] = self;
  v8[1] = (id)a2;
  uint64_t v3 = MEMORY[0x1E4F143A8];
  int v4 = -1073741824;
  int v5 = 0;
  BOOL v6 = __63__ACUIAddAccountViewController__dismissAndBecomeFirstResponder__block_invoke;
  SEL v7 = &unk_1E6D20118;
  v8[0] = self;
  -[ACUIAddAccountViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1);
  objc_storeStrong(v8, 0);
}

uint64_t __63__ACUIAddAccountViewController__dismissAndBecomeFirstResponder__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isFirstResponder];
  if ((result & 1) == 0) {
    return [*(id *)(a1 + 32) becomeFirstResponder];
  }
  return result;
}

- (id)_specifierForExchangeAccount
{
  v8[2] = self;
  v8[1] = (id)a2;
  v8[0] = [(ACUIAddAccountViewController *)self giantSpecifierWithName:@"Exchange ActiveSync" forAccountTypeID:*MEMORY[0x1E4F17798]];
  id v4 = v8[0];
  uint64_t v3 = (void *)MEMORY[0x1E4F42A80];
  id v6 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = (id)objc_msgSend(v3, "imageNamed:inBundle:", @"Exchange");
  objc_msgSend(v4, "setProperty:forKey:");

  [v8[0] accessibilitySetIdentification:@"mail-exchange"];
  id v7 = v8[0];
  objc_storeStrong(v8, 0);
  return v7;
}

- (id)_specifierForGmailAccount
{
  id v14 = self;
  v13[1] = (id)a2;
  if (__UseGoogleMail()) {
    id v2 = @"Google Mail";
  }
  else {
    id v2 = @"Gmail";
  }
  v13[0] = v2;
  if (__UseGoogleMail()) {
    uint64_t v3 = @"googlemail.png";
  }
  else {
    uint64_t v3 = @"Gmail";
  }
  Class v12 = v3;
  id v11 = [(ACUIAddAccountViewController *)v14 _specifierForCustomControlledAccountWithName:v13[0] accountTypeID:*MEMORY[0x1E4F177C0]];
  id v7 = v11;
  id v6 = (void *)MEMORY[0x1E4F42A80];
  id v5 = v12;
  id v9 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v8 = (id)objc_msgSend(v6, "imageNamed:inBundle:", v5);
  objc_msgSend(v7, "setProperty:forKey:");

  [v11 accessibilitySetIdentification:@"mail-gmail"];
  id v10 = v11;
  objc_storeStrong(&v11, 0);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(v13, 0);
  return v10;
}

- (id)_specifierForCustomControlledAccountWithName:(id)a3 accountTypeID:(id)a4
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  id v11 = [(ACUIAddAccountViewController *)v14 giantSpecifierWithName:location[0] forAccountTypeID:v12];
  id v9 = [(ACUIAddAccountViewController *)v14 addAccountDataSource];
  id v7 = v12;
  id v8 = [(ACUIAddAccountViewController *)v14 viewProvidersManager];
  uint64_t v10 = -[ACUIAddAccountDataSource controllerClassForCreatingAccountWithType:withViewProviderManager:](v9, "controllerClassForCreatingAccountWithType:withViewProviderManager:", v7);

  if (v10)
  {
    [v11 setDetailControllerClass:0];
    [v11 setTarget:v14];
    [v11 setButtonAction:sel__createCustomControlledAccountTapped_];
  }
  id v5 = v11;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (void)_addAccountSpecifierWasTapped:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v41 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v39 = (id)[location[0] propertyForKey:@"ACUIAccountType"];
  id v38 = _ACUILogSystem();
  os_log_type_t v37 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v44, (uint64_t)"-[ACUIAddAccountViewController _addAccountSpecifierWasTapped:]", 403, (uint64_t)v39);
    _os_log_impl(&dword_1DDFE5000, (os_log_t)v38, v37, "%s (%d) \"Add account tapped for '%@'\"", v44, 0x1Cu);
  }
  objc_storeStrong(&v38, 0);
  BOOL v36 = 0;
  BOOL v18 = 0;
  if ([v39 isEqualToString:*MEMORY[0x1E4F17798]]) {
    BOOL v18 = [(ACUIAddAccountViewController *)v41 isStolenDeviceProtectionFeatureAvailableAndEnabled];
  }
  BOOL v36 = v18;
  if (v18)
  {
    uint64_t v35 = [objc_alloc(MEMORY[0x1E4F30B70]) initWithIdentifier:@"com.apple.account.Exchange.add"];
    id v5 = (id)v35;
    v42[0] = &unk_1F39F60F8;
    id v17 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v16 = (id)objc_msgSend(v17, "localizedStringForKey:value:table:", @"EXCHANGE_DTO_RATCHET_TITLE");
    v43[0] = v16;
    v42[1] = &unk_1F39F6110;
    id v15 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v14 = (id)[v15 localizedStringForKey:@"EXCHANGE_DTO_RATCHET_TEXT" value:&stru_1F39EF5C0 table:@"Localizable"];
    v43[1] = v14;
    v42[2] = &unk_1F39F6128;
    id v13 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v12 = (id)[v13 localizedStringForKey:@"EXCHANGE_DTO_RATCHET_COUNTDOWN_TEXT" value:&stru_1F39EF5C0 table:@"Localizable"];
    v43[2] = v12;
    v42[3] = &unk_1F39F6140;
    id v11 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v10 = (id)[v11 localizedStringForKey:@"EXCHANGE_DTO_LOCALIZED_REASON" value:&stru_1F39EF5C0 table:@"Localizable"];
    v43[3] = v10;
    v42[4] = &unk_1F39F6158;
    id v9 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v8 = (id)[v9 localizedStringForKey:@"EXCHANGE_DTO_LOCALIZED_CALLOUT" value:&stru_1F39EF5C0 table:@"Localizable"];
    v43[4] = v8;
    v42[5] = &unk_1F39F6170;
    id v7 = (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=ACCOUNTS_AND_PASSWORDS&path=ADD_ACCOUNT"];
    v43[5] = v7;
    id v6 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:6];
    uint64_t v27 = MEMORY[0x1E4F143A8];
    int v28 = -1073741824;
    int v29 = 0;
    v30 = __62__ACUIAddAccountViewController__addAccountSpecifierWasTapped___block_invoke;
    v31 = &unk_1E6D20168;
    v32 = v41;
    id v33 = v39;
    id v34 = location[0];
    [v5 armWithOptions:v6 completion:&v27];

    objc_storeStrong(&v34, 0);
    objc_storeStrong(&v33, 0);
    objc_storeStrong((id *)&v32, 0);
    objc_storeStrong((id *)&v35, 0);
  }
  else
  {
    id v4 = v41;
    id v3 = v39;
    uint64_t v19 = MEMORY[0x1E4F143A8];
    int v20 = -1073741824;
    int v21 = 0;
    v22 = __62__ACUIAddAccountViewController__addAccountSpecifierWasTapped___block_invoke_137;
    v23 = &unk_1E6D20190;
    v24 = v41;
    id v25 = v39;
    id v26 = location[0];
    [(ACUIAddAccountViewController *)v4 _alertIfAccountTypePreventsMultiples:v3 withCompletion:&v19];
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v25, 0);
    objc_storeStrong((id *)&v24, 0);
  }
  objc_storeStrong(&v39, 0);
  objc_storeStrong(location, 0);
}

void __62__ACUIAddAccountViewController__addAccountSpecifierWasTapped___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v24 = 0;
  objc_storeStrong(&v24, a3);
  v23[1] = a1;
  BOOL v10 = 1;
  if (!location[0]) {
    BOOL v10 = v24 != 0;
  }
  if (!v10) {
    __assert_rtn("-[ACUIAddAccountViewController _addAccountSpecifierWasTapped:]_block_invoke", "ACUIAddAccountViewController.m", 424, "result != nil || error != nil");
  }
  id v7 = (id)[location[0] objectForKeyedSubscript:&unk_1F39F6158];

  if (v7)
  {
    v23[0] = (id)_ACLogSystem();
    char v22 = 2;
    if (os_log_type_enabled((os_log_t)v23[0], OS_LOG_TYPE_DEBUG))
    {
      log = v23[0];
      os_log_type_t type = v22;
      __os_log_helper_16_0_0(v21);
      _os_log_debug_impl(&dword_1DDFE5000, log, type, "@\"Ratchet armed! Showing the exchange account login flow\"", v21, 2u);
    }
    objc_storeStrong(v23, 0);
    queue = MEMORY[0x1E4F14428];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    int v14 = -1073741824;
    int v15 = 0;
    id v16 = __62__ACUIAddAccountViewController__addAccountSpecifierWasTapped___block_invoke_135;
    id v17 = &unk_1E6D20140;
    id v18 = a1[4];
    id v19 = a1[5];
    id v20 = a1[6];
    dispatch_async(queue, &v13);

    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v18, 0);
  }
  else
  {
    id v3 = (id)[v24 userInfo];
    id v12 = (id)[v3 objectForKeyedSubscript:*MEMORY[0x1E4F30B48]];

    if ([v24 code] || !v12)
    {
      os_log_t oslog = (os_log_t)(id)_ACLogSystem();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v26, (uint64_t)v24);
        _os_log_debug_impl(&dword_1DDFE5000, oslog, OS_LOG_TYPE_DEBUG, "@\"Ratchet not armed. Reason: %@\"", v26, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
}

uint64_t __62__ACUIAddAccountViewController__addAccountSpecifierWasTapped___block_invoke_135(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_allowedToAddAccountTypeID:fromSpecifier:", *(void *)(a1 + 40), *(void *)(a1 + 48), a1, a1);
}

uint64_t __62__ACUIAddAccountViewController__addAccountSpecifierWasTapped___block_invoke_137(uint64_t result, char a2)
{
  if (a2) {
    return [*(id *)(result + 32) _allowedToAddAccountTypeID:*(void *)(result + 40) fromSpecifier:*(void *)(result + 48)];
  }
  return result;
}

- (void)_allowedToAddAccountTypeID:(id)a3 fromSpecifier:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v19 = 0;
  objc_storeStrong(&v19, a4);
  id v18 = _ACUILogSystem();
  os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v22, (uint64_t)"-[ACUIAddAccountViewController _allowedToAddAccountTypeID:fromSpecifier:]", 450, (uint64_t)location[0]);
    _os_log_impl(&dword_1DDFE5000, (os_log_t)v18, v17, "%s (%d) \"Allowed to add accounts for '%@'\"", v22, 0x1Cu);
  }
  objc_storeStrong(&v18, 0);
  id v16 = [(ACUIAddAccountViewController *)v21 viewProvidersManager];
  BOOL v10 = [(ACUIAddAccountViewController *)v21 addAccountDataSource];
  Class v15 = (Class)[(ACUIAddAccountDataSource *)v10 viewControllerClassForCreatingAccountWithType:location[0] withViewProviderManager:v16];

  id v4 = (id)[v19 userInfo];
  BOOL v11 = v4 != 0;

  if (!v11)
  {
    id v9 = (id)[v16 configurationInfoForCreatingAccountWithType:location[0]];
    id v14 = (id)[v9 mutableCopy];

    if ([v14 count]) {
      [v19 setUserInfo:v14];
    }
    objc_storeStrong(&v14, 0);
  }
  id v5 = v19;
  id v6 = NSStringFromClass(v15);
  objc_msgSend(v5, "setProperty:forKey:");

  id v13 = (id)objc_opt_new();
  [v13 setSpecifier:v19];
  [v13 setParentController:v21];
  id v7 = v13;
  id v8 = (id)[(ACUIAddAccountViewController *)v21 rootController];
  objc_msgSend(v7, "setRootController:");

  [(ACUIAddAccountViewController *)v21 showController:v13];
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
}

- (void)_createCustomControlledAccountTapped:(id)a3
{
  Class v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = (id)[location[0] propertyForKey:@"ACUIAccountType"];
  id v4 = v15;
  id v3 = v13;
  uint64_t v5 = MEMORY[0x1E4F143A8];
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = __69__ACUIAddAccountViewController__createCustomControlledAccountTapped___block_invoke;
  id v9 = &unk_1E6D20190;
  BOOL v10 = v15;
  id v11 = v13;
  id v12 = location[0];
  -[ACUIAddAccountViewController _alertIfAccountTypePreventsMultiples:withCompletion:](v4, "_alertIfAccountTypePreventsMultiples:withCompletion:", v3);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __69__ACUIAddAccountViewController__createCustomControlledAccountTapped___block_invoke(uint64_t a1, char a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v35 = a1;
  char v34 = a2 & 1;
  uint64_t v33 = a1;
  if (a2)
  {
    Class v32 = 0;
    id v11 = (id)[*(id *)(a1 + 32) addAccountDataSource];
    uint64_t v12 = *(void *)(a1 + 40);
    id v10 = (id)[*(id *)(a1 + 32) viewProvidersManager];
    Class v32 = (Class)objc_msgSend(v11, "controllerClassForCreatingAccountWithType:withViewProviderManager:", v12);

    id v2 = (id)[*(id *)(a1 + 48) userInfo];
    BOOL v9 = v2 != 0;

    if (!v9)
    {
      id v8 = (id)[*(id *)(a1 + 32) viewProvidersManager];
      id v7 = (id)[v8 configurationInfoForCreatingAccountWithType:*(void *)(a1 + 40)];
      id location = (id)[v7 copy];

      if ([location count]) {
        [*(id *)(a1 + 48) setUserInfo:location];
      }
      objc_storeStrong(&location, 0);
    }
    if ([(objc_class *)v32 conformsToProtocol:&unk_1F3A1F518])
    {
      uint64_t v24 = 0;
      id v25 = &v24;
      int v26 = 838860800;
      int v27 = 48;
      int v28 = __Block_byref_object_copy__0;
      int v29 = __Block_byref_object_dispose__0;
      id v30 = objc_alloc_init(v32);
      id v23 = _ACUILogSystem();
      os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_3_8_32_4_0_8_66((uint64_t)v36, (uint64_t)"-[ACUIAddAccountViewController _createCustomControlledAccountTapped:]_block_invoke", 486, v25[5]);
        _os_log_impl(&dword_1DDFE5000, (os_log_t)v23, v22, "%s (%d) \"Begining account creation controller %{public}@\"", v36, 0x1Cu);
      }
      objc_storeStrong(&v23, 0);
      id v6 = (id)[*(id *)(a1 + 32) addAccountDataSource];
      [v6 configureAccountCreationController:v25[5]];

      objc_initWeak(&from, *(id *)(a1 + 32));
      id v3 = (void *)v25[5];
      uint64_t v4 = *(void *)(a1 + 48);
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v14 = MEMORY[0x1E4F143A8];
      int v15 = -1073741824;
      int v16 = 0;
      os_log_type_t v17 = __69__ACUIAddAccountViewController__createCustomControlledAccountTapped___block_invoke_183;
      id v18 = &unk_1E6D20208;
      v19[1] = &v24;
      objc_copyWeak(&v20, &from);
      v19[0] = *(id *)(a1 + 48);
      [v3 beginAccountCreationWithSpecifier:v4 fromViewController:v5 completion:&v14];
      objc_storeStrong(v19, 0);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&from);
      _Block_object_dispose(&v24, 8);
      objc_storeStrong(&v30, 0);
    }
  }
}

void __69__ACUIAddAccountViewController__createCustomControlledAccountTapped___block_invoke_183(id *a1, void *a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  uint64_t v24 = a3;
  id v23 = 0;
  objc_storeStrong(&v23, a4);
  v22[1] = a1;
  v22[0] = _ACUILogSystem();
  os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v22[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v22[0];
    os_log_type_t type = v21;
    id v7 = +[ACUIAddAccountViewController _debugStringForAction:v24];
    id v20 = v7;
    __os_log_helper_16_2_3_8_32_4_0_8_66((uint64_t)v26, (uint64_t)"-[ACUIAddAccountViewController _createCustomControlledAccountTapped:]_block_invoke", 492, (uint64_t)v20);
    _os_log_impl(&dword_1DDFE5000, log, type, "%s (%d) \"Account Creation Controller completed with action: %{public}@\"", v26, 0x1Cu);

    objc_storeStrong(&v20, 0);
  }
  objc_storeStrong(v22, 0);
  queue = MEMORY[0x1E4F14428];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  int v12 = -1073741824;
  int v13 = 0;
  uint64_t v14 = __69__ACUIAddAccountViewController__createCustomControlledAccountTapped___block_invoke_184;
  int v15 = &unk_1E6D201E0;
  v18[1] = a1[5];
  objc_copyWeak(v19, a1 + 6);
  id v16 = location[0];
  v19[1] = v24;
  id v17 = v23;
  v18[0] = a1[4];
  dispatch_async(queue, &v11);

  objc_storeStrong(v18, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_destroyWeak(v19);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

void __69__ACUIAddAccountViewController__createCustomControlledAccountTapped___block_invoke_184(uint64_t a1)
{
  v14[2] = (id)a1;
  v14[1] = (id)a1;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), 0);
  v14[0] = objc_loadWeakRetained((id *)(a1 + 64));
  if (v14[0])
  {
    id v6 = (id)[v14[0] addAccountDataSource];
    uint64_t v1 = *(void *)(a1 + 32);
    uint64_t v2 = *(void *)(a1 + 72);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = v14[0];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    int v9 = -1073741824;
    int v10 = 0;
    uint64_t v11 = __69__ACUIAddAccountViewController__createCustomControlledAccountTapped___block_invoke_2;
    int v12 = &unk_1E6D201B8;
    id v13 = v14[0];
    [v6 accountControllerCompletedWithAccount:v1 action:v2 data:v3 specifier:v4 viewController:v5 completion:&v8];

    objc_storeStrong(&v13, 0);
  }
  objc_storeStrong(v14, 0);
}

uint64_t __69__ACUIAddAccountViewController__createCustomControlledAccountTapped___block_invoke_2(uint64_t a1, char a2)
{
  return [*(id *)(a1 + 32) nonModalDataclassConfigurationControllerDidCompleteWithSuccess:a2 & 1];
}

+ (id)_debugStringForAction:(int64_t)a3
{
  id v8 = a1;
  SEL v7 = a2;
  int64_t v6 = a3;
  id location = @"unknown";
  if (v6)
  {
    if (v6 == 1)
    {
      objc_storeStrong(&location, @"dataclass configuration");
    }
    else if (v6 == 2)
    {
      objc_storeStrong(&location, @"alternate configuration");
    }
  }
  else
  {
    objc_storeStrong(&location, @"none");
  }
  id v4 = location;
  objc_storeStrong(&location, 0);
  return v4;
}

- (id)_specifierForYahooAccount
{
  v8[2] = self;
  v8[1] = (id)a2;
  v8[0] = [(ACUIAddAccountViewController *)self _specifierForCustomControlledAccountWithName:@"Yahoo!\u200E" accountTypeID:*MEMORY[0x1E4F17878]];
  id v4 = v8[0];
  uint64_t v3 = (void *)MEMORY[0x1E4F42A80];
  id v6 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = (id)objc_msgSend(v3, "imageNamed:inBundle:", @"Yahoo");
  objc_msgSend(v4, "setProperty:forKey:");

  [v8[0] accessibilitySetIdentification:@"mail-yahoo"];
  id v7 = v8[0];
  objc_storeStrong(v8, 0);
  return v7;
}

- (id)_specifierForAOLAccount
{
  v8[2] = self;
  v8[1] = (id)a2;
  v8[0] = -[ACUIAddAccountViewController _specifierForCustomControlledAccountWithName:accountTypeID:](self, "_specifierForCustomControlledAccountWithName:accountTypeID:");
  id v4 = v8[0];
  uint64_t v3 = (void *)MEMORY[0x1E4F42A80];
  id v6 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = (id)objc_msgSend(v3, "imageNamed:inBundle:", @"AOL");
  objc_msgSend(v4, "setProperty:forKey:");

  [v8[0] accessibilitySetIdentification:@"mail-aol"];
  id v7 = v8[0];
  objc_storeStrong(v8, 0);
  return v7;
}

- (id)_specifierForOutlookAccount
{
  v8[2] = self;
  v8[1] = (id)a2;
  v8[0] = -[ACUIAddAccountViewController _specifierForCustomControlledAccountWithName:accountTypeID:](self, "_specifierForCustomControlledAccountWithName:accountTypeID:");
  id v4 = v8[0];
  uint64_t v3 = (void *)MEMORY[0x1E4F42A80];
  id v6 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = (id)objc_msgSend(v3, "imageNamed:inBundle:", @"Outlook");
  objc_msgSend(v4, "setProperty:forKey:");

  [v8[0] setProperty:MEMORY[0x1E4F1CC38] forKey:@"isHotmail"];
  [v8[0] accessibilitySetIdentification:@"mail-hotmail"];
  id v7 = v8[0];
  objc_storeStrong(v8, 0);
  return v7;
}

- (id)_specifiersForRegionalMailAccounts
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  Class v32 = self;
  v31[1] = (id)a2;
  id v13 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v31[0] = (id)[v13 URLForResource:@"RegionalMailAccountTypes" withExtension:@"plist"];

  if (v31[0])
  {
    id v27 = (id)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfURL:v31[0]];
    if (v27)
    {
      uint64_t v11 = [(ACUIAddAccountViewController *)v32 filteredDataclass];
      char v23 = 0;
      char v21 = 0;
      char v12 = 0;
      if (v11)
      {
        id v24 = [(ACUIAddAccountViewController *)v32 filteredDataclass];
        char v23 = 1;
        char v10 = 1;
        if (([v24 isEqualToString:*MEMORY[0x1E4F17AD8]] & 1) == 0)
        {
          id v22 = [(ACUIAddAccountViewController *)v32 filteredDataclass];
          char v21 = 1;
          char v10 = [v22 isEqualToString:*MEMORY[0x1E4F17B00]];
        }
        char v12 = v10 ^ 1;
      }
      if (v21) {

      }
      if (v23) {
      if (v12)
      }
      {
        id v33 = 0;
        int v28 = 1;
      }
      else
      {
        id v20 = __MailRegionCode();
        id v19 = (id)[v27 objectForKeyedSubscript:@"AccountTypes"];
        id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        memset(__b, 0, sizeof(__b));
        id obj = v19;
        uint64_t v9 = [obj countByEnumeratingWithState:__b objects:v34 count:16];
        if (v9)
        {
          uint64_t v5 = *(void *)__b[2];
          uint64_t v6 = 0;
          unint64_t v7 = v9;
          while (1)
          {
            uint64_t v4 = v6;
            if (*(void *)__b[2] != v5) {
              objc_enumerationMutation(obj);
            }
            id v17 = *(id *)(__b[1] + 8 * v6);
            id v15 = (id)[v17 objectForKeyedSubscript:@"Regions"];
            if ([v15 containsObject:v20])
            {
              id v14 = [(ACUIAddAccountViewController *)v32 _specifierForRegionalAccountType:v17];
              if (v14) {
                [v18 addObject:v14];
              }
              objc_storeStrong(&v14, 0);
              int v28 = 0;
            }
            else
            {
              int v28 = 3;
            }
            objc_storeStrong(&v15, 0);
            ++v6;
            if (v4 + 1 >= v7)
            {
              uint64_t v6 = 0;
              unint64_t v7 = [obj countByEnumeratingWithState:__b objects:v34 count:16];
              if (!v7) {
                break;
              }
            }
          }
        }

        id v33 = v18;
        int v28 = 1;
        objc_storeStrong(&v18, 0);
        objc_storeStrong(&v19, 0);
        objc_storeStrong(&v20, 0);
      }
    }
    else
    {
      os_log_t oslog = (os_log_t)_ACUILogSystem();
      os_log_type_t v25 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_32_4_0((uint64_t)v35, (uint64_t)"-[ACUIAddAccountViewController _specifiersForRegionalMailAccounts]", 557);
        _os_log_error_impl(&dword_1DDFE5000, oslog, v25, "%s (%d) \"Failed to parse contents of RegionalMailAccountTypes.plist!\"", v35, 0x12u);
      }
      objc_storeStrong((id *)&oslog, 0);
      id v33 = 0;
      int v28 = 1;
    }
    objc_storeStrong(&v27, 0);
  }
  else
  {
    id location = _ACUILogSystem();
    os_log_type_t v29 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_4_0((uint64_t)v36, (uint64_t)"-[ACUIAddAccountViewController _specifiersForRegionalMailAccounts]", 551);
      _os_log_error_impl(&dword_1DDFE5000, (os_log_t)location, v29, "%s (%d) \"Could not find RegionalMailAccountTypes.plist.\"", v36, 0x12u);
    }
    objc_storeStrong(&location, 0);
    id v33 = 0;
    int v28 = 1;
  }
  objc_storeStrong(v31, 0);
  uint64_t v2 = v33;
  return v2;
}

- (id)_specifierForRegionalAccountType:(id)a3
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = (id)[location[0] objectForKeyedSubscript:@"RegionalDisplayName"];
  id v14 = (id)[location[0] objectForKeyedSubscript:@"LargeIcon"];
  id v13 = (id)[location[0] objectForKeyedSubscript:@"AccessibilityLabel"];
  id v12 = 0;
  if (v14)
  {
    id v8 = (void *)MEMORY[0x1E4F42A80];
    id v9 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v3 = (id)objc_msgSend(v8, "imageNamed:inBundle:", v14);
    id v4 = v12;
    id v12 = v3;
  }
  uint64_t v11 = 0;
  uint64_t v5 = 11;
  if (v12) {
    uint64_t v5 = 10;
  }
  uint64_t v11 = v5;
  id v10 = (id)[MEMORY[0x1E4F92E70] preferenceSpecifierNamed:v15 target:v17 set:0 get:0 detail:objc_opt_class() cell:v5 edit:0];
  [v10 setButtonAction:sel__addAccountSpecifierWasTapped_];
  [v10 setProperty:*MEMORY[0x1E4F177E8] forKey:@"ACUIAccountType"];
  [v10 setUserInfo:location[0]];
  if (v12) {
    [v10 setProperty:v12 forKey:*MEMORY[0x1E4F93190]];
  }
  if (v13) {
    [v10 accessibilitySetIdentification:v13];
  }
  id v7 = v10;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (id)specifierForOtherAccounts
{
  id v18 = self;
  v17[1] = (id)a2;
  id v10 = (id)MEMORY[0x1E4F92E70];
  uint64_t v8 = MEMORY[0x1E4F28B50];
  id v12 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v13 = @"OTHER";
  id v11 = (id)objc_msgSend(v12, "localizedStringForKey:value:table:");
  id v9 = v18;
  v17[0] = (id)[v10 preferenceSpecifierNamed:v11 target:v18 set:0 get:0 detail:objc_opt_class() cell:11 edit:0];

  [v17[0] setProperty:v13 forKey:*MEMORY[0x1E4F93188]];
  id v14 = v17[0];
  id v15 = [(ACUIAddAccountViewController *)v18 addAccountDataSource];
  objc_msgSend(v14, "setProperty:forKey:");

  id v16 = [(ACUIAddAccountViewController *)v18 filteredDataclass];
  if (v16)
  {
    id v6 = v17[0];
    id v7 = [(ACUIAddAccountViewController *)v18 filteredDataclass];
    objc_msgSend(v6, "setProperty:forKey:");
  }
  id location = v17;
  id v5 = v17[0];
  objc_storeStrong(location, 0);
  id v2 = v5;
  return v2;
}

- (id)giantSpecifierWithName:(id)a3 forAccountTypeID:(id)a4
{
  id obj = a4;
  id v19 = self;
  location[1] = (id)a2;
  id v13 = location;
  id v14 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = &v17;
  id v17 = 0;
  objc_storeStrong(&v17, obj);
  uint64_t v10 = MEMORY[0x1E4F92E70];
  id v8 = location[0];
  id v9 = v19;
  id v4 = (id)[MEMORY[0x1E4F92E70] preferenceSpecifierNamed:location[0] target:v19 set:0 get:0 detail:objc_opt_class() cell:10 edit:0];
  id v11 = &v16;
  id v16 = v4;
  [v4 setButtonAction:sel__addAccountSpecifierWasTapped_];
  [v16 setProperty:v17 forKey:@"ACUIAccountType"];
  id v15 = v16;
  objc_storeStrong(v11, v14);
  objc_storeStrong(v12, v14);
  objc_storeStrong(v13, v14);
  id v5 = v15;
  return v5;
}

- (void)setupViewControllerDidDismiss:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(ACUIAddAccountViewController *)v4 _popToLayerAboveAddAccountFlow];
  objc_storeStrong(location, 0);
}

- (void)_popToLayerAboveAddAccountFlow
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  Class v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  id v21 = (id)[(ACUIAddAccountViewController *)self navigationController];
  id v30 = (id)[v21 viewControllers];

  char v29 = 0;
  char v27 = 0;
  char v22 = 0;
  if (([v30 containsObject:v32] & 1) == 0)
  {
    id v28 = (id)[(ACUIAddAccountViewController *)v32 parentViewController];
    char v27 = 1;
    char v22 = objc_msgSend(v30, "containsObject:");
  }
  if (v27) {

  }
  char v29 = v22 & 1;
  memset(__b, 0, sizeof(__b));
  id obj = (id)[v30 reverseObjectEnumerator];
  uint64_t v20 = [obj countByEnumeratingWithState:__b objects:v35 count:16];
  if (v20)
  {
    uint64_t v16 = *(void *)__b[2];
    uint64_t v17 = 0;
    unint64_t v18 = v20;
    while (1)
    {
      uint64_t v15 = v17;
      if (*(void *)__b[2] != v16) {
        objc_enumerationMutation(obj);
      }
      id v26 = *(id *)(__b[1] + 8 * v17);
      if (v29)
      {
        memset(v23, 0, sizeof(v23));
        id v13 = (id)[v26 childViewControllers];
        uint64_t v14 = [v13 countByEnumeratingWithState:v23 objects:v34 count:16];
        if (v14)
        {
          uint64_t v10 = *(void *)v23[2];
          uint64_t v11 = 0;
          unint64_t v12 = v14;
          while (1)
          {
            uint64_t v9 = v11;
            if (*(void *)v23[2] != v10) {
              objc_enumerationMutation(v13);
            }
            uint64_t v24 = *(void *)(v23[1] + 8 * v11);
            if ([(ACUIAddAccountViewController *)v32 _viewControllerIsNotAddOrAddOther:v24])
            {
              break;
            }
            ++v11;
            if (v9 + 1 >= v12)
            {
              uint64_t v11 = 0;
              unint64_t v12 = [v13 countByEnumeratingWithState:v23 objects:v34 count:16];
              if (!v12) {
                goto LABEL_18;
              }
            }
          }
          objc_storeStrong(location, v26);
        }
LABEL_18:

        if (location[0]) {
          break;
        }
      }
      else if ([(ACUIAddAccountViewController *)v32 _viewControllerIsNotAddOrAddOther:v26])
      {
        objc_storeStrong(location, v26);
        break;
      }
      ++v17;
      if (v15 + 1 >= v18)
      {
        uint64_t v17 = 0;
        unint64_t v18 = [obj countByEnumeratingWithState:__b objects:v35 count:16];
        if (!v18) {
          break;
        }
      }
    }
  }

  uint64_t v33 = 0;
  id v6 = (id)[MEMORY[0x1E4F42948] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  uint64_t v33 = v7;
  BOOL v8 = 1;
  if (v7 != 1) {
    BOOL v8 = v33 == 5;
  }
  if (location[0])
  {
    id v5 = (id)[(ACUIAddAccountViewController *)v32 navigationController];
    id v2 = (id)[v5 popToViewController:location[0] animated:v8];
  }
  else
  {
    id v4 = (id)[(ACUIAddAccountViewController *)v32 navigationController];
    id v3 = (id)[v4 popToRootViewControllerAnimated:v8];
  }
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_viewControllerIsNotAddOrAddOther:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_opt_class();
  BOOL v4 = 0;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    BOOL v4 = 0;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      BOOL v4 = (objc_opt_isKindOfClass() & 1) == 0;
    }
  }
  objc_storeStrong(location, 0);
  return v4;
}

- (void)nonModalDataclassConfigurationControllerDidCompleteWithSuccess:(BOOL)a3
{
}

- (void)_alertIfAccountTypePreventsMultiples:(id)a3 withCompletion:(id)a4
{
  os_log_type_t v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v23 = 0;
  objc_storeStrong(&v23, a4);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  int v17 = -1073741824;
  int v18 = 0;
  id v19 = __84__ACUIAddAccountViewController__alertIfAccountTypePreventsMultiples_withCompletion___block_invoke;
  uint64_t v20 = &unk_1E6D20258;
  id v21 = v23;
  id v22 = (id)MEMORY[0x1E01CBE70](&v16);
  objc_initWeak(&v15, v25);
  accountStore = v25->_accountStore;
  id v5 = location[0];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  int v8 = -1073741824;
  int v9 = 0;
  uint64_t v10 = __84__ACUIAddAccountViewController__alertIfAccountTypePreventsMultiples_withCompletion___block_invoke_3;
  uint64_t v11 = &unk_1E6D202A8;
  objc_copyWeak(&v14, &v15);
  unint64_t v12 = v25;
  id v13 = v22;
  [(ACAccountStore *)accountStore accountTypeWithIdentifier:v5 completion:&v7];
  objc_storeStrong(&v13, 0);
  objc_storeStrong((id *)&v12, 0);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v15);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

void __84__ACUIAddAccountViewController__alertIfAccountTypePreventsMultiples_withCompletion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v13 = a1;
  char v12 = a2 & 1;
  uint64_t v11 = a1;
  queue = MEMORY[0x1E4F14428];
  uint64_t v4 = MEMORY[0x1E4F143A8];
  int v5 = -1073741824;
  int v6 = 0;
  uint64_t v7 = __84__ACUIAddAccountViewController__alertIfAccountTypePreventsMultiples_withCompletion___block_invoke_2;
  int v8 = &unk_1E6D20230;
  id v9 = *(id *)(a1 + 32);
  char v10 = v12 & 1;
  dispatch_async(queue, &v4);

  objc_storeStrong(&v9, 0);
}

uint64_t __84__ACUIAddAccountViewController__alertIfAccountTypePreventsMultiples_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned char *)(a1 + 40) & 1);
}

void __84__ACUIAddAccountViewController__alertIfAccountTypePreventsMultiples_withCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v17 = 0;
  objc_storeStrong(&v17, a3);
  v16[1] = (id)a1;
  v16[0] = objc_loadWeakRetained((id *)(a1 + 48));
  if ([location[0] supportsMultipleAccounts])
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v5 = (id)[v16[0] addAccountDataSource];
    id v3 = location[0];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 1416);
    uint64_t v8 = MEMORY[0x1E4F143A8];
    int v9 = -1073741824;
    int v10 = 0;
    uint64_t v11 = __84__ACUIAddAccountViewController__alertIfAccountTypePreventsMultiples_withCompletion___block_invoke_4;
    char v12 = &unk_1E6D20280;
    id v13 = location[0];
    id v14 = v16[0];
    id v15 = *(id *)(a1 + 40);
    [v5 hasAccountWithType:v3 accountStore:v4 completion:&v8];

    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v13, 0);
  }
  objc_storeStrong(v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

void __84__ACUIAddAccountViewController__alertIfAccountTypePreventsMultiples_withCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v11[1] = (id)a1;
  if (location[0])
  {
    queue = MEMORY[0x1E4F14428];
    uint64_t v4 = MEMORY[0x1E4F143A8];
    int v5 = -1073741824;
    int v6 = 0;
    uint64_t v7 = __84__ACUIAddAccountViewController__alertIfAccountTypePreventsMultiples_withCompletion___block_invoke_5;
    uint64_t v8 = &unk_1E6D20140;
    id v9 = *(id *)(a1 + 32);
    id v10 = location[0];
    v11[0] = *(id *)(a1 + 40);
    dispatch_async(queue, &v4);

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    objc_storeStrong(v11, 0);
    objc_storeStrong(&v10, 0);
    objc_storeStrong(&v9, 0);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  objc_storeStrong(location, 0);
}

void __84__ACUIAddAccountViewController__alertIfAccountTypePreventsMultiples_withCompletion___block_invoke_5(id *a1)
{
  id v18[2] = a1;
  v18[1] = a1;
  uint64_t v1 = NSString;
  id v4 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = (id)objc_msgSend(v4, "localizedStringForKey:value:table:", @"SINGLETON_ACCOUNT_ERROR_TITLE");
  id v2 = (id)[a1[4] accountTypeDescription];
  v18[0] = (id)objc_msgSend(v1, "stringWithFormat:", v3, v2);

  int v5 = NSString;
  id v9 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v8 = (id)[v9 localizedStringForKey:@"SINGLETON_ACCOUNT_ERROR_MESSAGE" value:&stru_1F39EF5C0 table:@"Localizable"];
  id v7 = (id)[a1[4] accountTypeDescription];
  id v6 = (id)[a1[5] username];
  id v17 = (id)objc_msgSend(v5, "stringWithFormat:", v8, v7, v6);

  id v16 = (id)[MEMORY[0x1E4F42728] alertControllerWithTitle:v18[0] message:v17 preferredStyle:1];
  id v11 = v16;
  id v10 = (void *)MEMORY[0x1E4F42720];
  id v14 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v13 = (id)[v14 localizedStringForKey:@"OK" value:&stru_1F39EF5C0 table:@"Localizable"];
  id v12 = (id)objc_msgSend(v10, "actionWithTitle:style:handler:");
  objc_msgSend(v11, "addAction:");

  [a1[6] presentViewController:v16 animated:1 completion:0];
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v18, 0);
}

- (BOOL)isStolenDeviceProtectionFeatureAvailableAndEnabled
{
  if ((_os_feature_enabled_impl() & 1) == 0) {
    return 0;
  }
  id v6 = (id)[MEMORY[0x1E4F30B78] sharedInstance];
  char v7 = [v6 isFeatureSupported];

  if ((v7 & 1) == 0) {
    return 0;
  }
  id v4 = (id)[MEMORY[0x1E4F30B78] sharedInstance];
  char v5 = [v4 isFeatureAvailable];

  if ((v5 & 1) == 0) {
    return 0;
  }
  id v3 = (id)[MEMORY[0x1E4F30B78] sharedInstance];
  BOOL v8 = [v3 isFeatureEnabled] & 1;

  return v8;
}

- (NSString)filteredDataclass
{
  return (NSString *)objc_getProperty(self, a2, 1424, 1);
}

- (void)setFilteredDataclass:(id)a3
{
}

- (void)setAddAccountDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end