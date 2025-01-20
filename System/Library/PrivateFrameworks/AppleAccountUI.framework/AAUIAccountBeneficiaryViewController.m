@interface AAUIAccountBeneficiaryViewController
- (AAUIAccountBeneficiaryViewController)init;
- (AAUIAccountBeneficiaryViewController)initWithAccountManager:(id)a3;
- (AAUIAccountBeneficiaryViewController)initWithAccountManager:(id)a3 highlightRowIdentifier:(id)a4;
- (BOOL)_canBeBeneficiary;
- (BOOL)_canHaveBeneficiary;
- (id)_addBeneficiarySpecifier;
- (id)_idmsAccount;
- (id)_myBenefactorsGroupSpecifier;
- (id)_myBenefactorsSpecifiers;
- (id)_myBeneficiariesGroupSpecifier;
- (id)_myBeneficiariesSpecifiers;
- (id)_noBenefactorSpecifier;
- (id)specifiers;
- (void)_beginObservingTrustedContactChangeNotification;
- (void)_fetchAllBeneficiaryContacts;
- (void)_learnMoreWasTapped;
- (void)_myBenefactorWasTapped:(id)a3;
- (void)_myBeneficiaryWasTapped:(id)a3;
- (void)_showAddBeneficiary;
- (void)_showViewController:(id)a3;
- (void)_stopObservingTrustedContactChangeNotification;
- (void)_syncTrustedContactsFromCloudKit;
- (void)dealloc;
- (void)viewDidLoad;
@end

@implementation AAUIAccountBeneficiaryViewController

- (AAUIAccountBeneficiaryViewController)init
{
  v14.receiver = self;
  v14.super_class = (Class)AAUIAccountBeneficiaryViewController;
  v2 = [(AAUIAccountBeneficiaryViewController *)&v14 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    contactsProvider = v2->_contactsProvider;
    v2->_contactsProvider = (AAUIContactsProvider *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.appleaccountsettings.fetchbeneficiaries", v5);
    contactWorkQueue = v2->_contactWorkQueue;
    v2->_contactWorkQueue = (OS_dispatch_queue *)v6;

    myBeneficiaries = v2->_myBeneficiaries;
    v9 = (NSArray *)MEMORY[0x263EFFA68];
    v2->_myBeneficiaries = (NSArray *)MEMORY[0x263EFFA68];

    myBenefactors = v2->_myBenefactors;
    v2->_myBenefactors = v9;

    uint64_t v11 = objc_opt_new();
    viewModel = v2->_viewModel;
    v2->_viewModel = (AAAccountBeneficiaryManagementViewModel *)v11;
  }
  return v2;
}

- (AAUIAccountBeneficiaryViewController)initWithAccountManager:(id)a3
{
  id v5 = a3;
  dispatch_queue_t v6 = [(AAUIAccountBeneficiaryViewController *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accountManager, a3);
  }

  return v7;
}

- (AAUIAccountBeneficiaryViewController)initWithAccountManager:(id)a3 highlightRowIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(AAUIAccountBeneficiaryViewController *)self init];
  if (v9)
  {
    v10 = _AAUILogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[AAUIAccountBeneficiaryViewController initWithAccountManager:highlightRowIdentifier:]((uint64_t)v8, v10);
    }

    objc_storeStrong((id *)((char *)&v9->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDA0]), a4);
    objc_storeStrong((id *)&v9->_accountManager, a3);
  }

  return v9;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    self;
    v4 = (objc_class *)objc_claimAutoreleasedReturnValue();
    id v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "dealloc %@", buf, 0xCu);
  }
  [(AAUIAccountBeneficiaryViewController *)self _stopObservingTrustedContactChangeNotification];
  v6.receiver = self;
  v6.super_class = (Class)AAUIAccountBeneficiaryViewController;
  [(AAUIAccountBeneficiaryViewController *)&v6 dealloc];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)AAUIAccountBeneficiaryViewController;
  [(AAUIAccountBeneficiaryViewController *)&v8 viewDidLoad];
  if (!self->_accountManager)
  {
    uint64_t v3 = [(AAUIAccountBeneficiaryViewController *)self specifier];
    v4 = [v3 objectForKeyedSubscript:@"icloudAccountManager"];
    accountManager = self->_accountManager;
    self->_accountManager = v4;
  }
  objc_super v6 = [(AAAccountBeneficiaryManagementViewModel *)self->_viewModel title];
  id v7 = [(AAUIAccountBeneficiaryViewController *)self navigationItem];
  [v7 setTitle:v6];

  [(AAUIAccountBeneficiaryViewController *)self _fetchAllBeneficiaryContacts];
  [(AAUIAccountBeneficiaryViewController *)self _beginObservingTrustedContactChangeNotification];
  [(AAUIAccountBeneficiaryViewController *)self _syncTrustedContactsFromCloudKit];
}

- (void)_beginObservingTrustedContactChangeNotification
{
  id v3 = [MEMORY[0x263F087C8] defaultCenter];
  [v3 addObserver:self selector:sel__fetchAllBeneficiaryContacts name:*MEMORY[0x263F256D8] object:0 suspensionBehavior:4];
}

- (void)_stopObservingTrustedContactChangeNotification
{
  id v3 = [MEMORY[0x263F087C8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F256D8] object:0];
}

- (id)specifiers
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v3))
  {
    v4 = _AAUILogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "Loading Account Beneficiary specifiers.", (uint8_t *)&v20, 2u);
    }

    id v5 = objc_opt_new();
    if ([(AAUIAccountBeneficiaryViewController *)self _canHaveBeneficiary])
    {
      objc_super v6 = _AAUILogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "Account can have beneficiary, adding beneficiary specifiers to UI...", (uint8_t *)&v20, 2u);
      }

      id v7 = [(AAUIAccountBeneficiaryViewController *)self _myBeneficiariesGroupSpecifier];
      [v5 addObject:v7];

      objc_super v8 = [(AAUIAccountBeneficiaryViewController *)self _myBeneficiariesSpecifiers];
      [v5 addObjectsFromArray:v8];

      uint64_t v9 = [(AAUIAccountBeneficiaryViewController *)self _addBeneficiarySpecifier];
      [v5 addObject:v9];
    }
    if ([(AAUIAccountBeneficiaryViewController *)self _canBeBeneficiary])
    {
      v10 = _AAUILogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_209754000, v10, OS_LOG_TYPE_DEFAULT, "Account can have benefactors, adding benefactor specifiers to UI...", (uint8_t *)&v20, 2u);
      }

      if ([(NSArray *)self->_myBenefactors count])
      {
        uint64_t v11 = [(AAUIAccountBeneficiaryViewController *)self _myBenefactorsGroupSpecifier];
        [v5 addObject:v11];

        v12 = [(AAUIAccountBeneficiaryViewController *)self _myBenefactorsSpecifiers];
        [v5 addObjectsFromArray:v12];
      }
    }
    if (![(NSArray *)self->_myBenefactors count]
      && ![(AAUIAccountBeneficiaryViewController *)self _canHaveBeneficiary])
    {
      v13 = _AAUILogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_209754000, v13, OS_LOG_TYPE_DEFAULT, "Account can't have beneficiary and does not have any benefactors, adding no benefactor specifier to UI...", (uint8_t *)&v20, 2u);
      }

      objc_super v14 = [(AAUIAccountBeneficiaryViewController *)self _noBenefactorSpecifier];
      [v5 addObject:v14];
    }
    v15 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;
  }
  v16 = _AAUILogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + v3);
    int v20 = 138412290;
    uint64_t v21 = v17;
    _os_log_impl(&dword_209754000, v16, OS_LOG_TYPE_DEFAULT, "AAUIAccountBeneficiaryViewController specifiers: returning %@", (uint8_t *)&v20, 0xCu);
  }

  v18 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  return v18;
}

- (void)_syncTrustedContactsFromCloudKit
{
  id v2 = objc_alloc_init(MEMORY[0x263F257E8]);
  [v2 pullTrustedContactsFromCloudKitWithCompletion:&__block_literal_global_9];
}

void __72__AAUIAccountBeneficiaryViewController__syncTrustedContactsFromCloudKit__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "Completed sync of trusted contacts from CloudKit with error: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_fetchAllBeneficiaryContacts
{
  objc_initWeak(&location, self);
  contactsProvider = self->_contactsProvider;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__AAUIAccountBeneficiaryViewController__fetchAllBeneficiaryContacts__block_invoke;
  v7[3] = &unk_263F92EB8;
  objc_copyWeak(&v8, &location);
  [(AAContactsProvider *)contactsProvider fetchMyBeneficiaries:v7];
  int v4 = self->_contactsProvider;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __68__AAUIAccountBeneficiaryViewController__fetchAllBeneficiaryContacts__block_invoke_3;
  v5[3] = &unk_263F92EB8;
  objc_copyWeak(&v6, &location);
  [(AAContactsProvider *)v4 fetchMyBenefactors:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __68__AAUIAccountBeneficiaryViewController__fetchAllBeneficiaryContacts__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = (void *)WeakRetained[176];
  WeakRetained[176] = v3;
  id v6 = v3;

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__AAUIAccountBeneficiaryViewController__fetchAllBeneficiaryContacts__block_invoke_2;
  block[3] = &unk_263F92168;
  block[4] = WeakRetained;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __68__AAUIAccountBeneficiaryViewController__fetchAllBeneficiaryContacts__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void __68__AAUIAccountBeneficiaryViewController__fetchAllBeneficiaryContacts__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = (void *)WeakRetained[177];
  WeakRetained[177] = v3;
  id v6 = v3;

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__AAUIAccountBeneficiaryViewController__fetchAllBeneficiaryContacts__block_invoke_4;
  block[3] = &unk_263F92168;
  block[4] = WeakRetained;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __68__AAUIAccountBeneficiaryViewController__fetchAllBeneficiaryContacts__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (id)_myBeneficiariesGroupSpecifier
{
  id v3 = objc_opt_new();
  int v4 = [(AAAccountBeneficiaryManagementViewModel *)self->_viewModel myBeneficiariesGroupTitle];
  id v5 = [v4 uppercaseString];
  id v6 = [(AAAccountBeneficiaryManagementViewModel *)self->_viewModel myBeneficiariesGroupTitle];
  id v7 = [(AAAccountBeneficiaryManagementViewModel *)self->_viewModel myBeneficiariesGroupFooter];
  id v8 = [(AAAccountBeneficiaryManagementViewModel *)self->_viewModel learnMore];
  uint64_t v9 = [v3 createGroupSpecifierWithIdentifier:v5 title:v6 footerText:v7 linkText:v8 actionMethodName:@"_learnMoreWasTapped" target:self];

  return v9;
}

- (id)_noBenefactorSpecifier
{
  id v3 = objc_opt_new();
  int v4 = [(AAAccountBeneficiaryManagementViewModel *)self->_viewModel noBenefactorFooter];
  id v5 = [(AAAccountBeneficiaryManagementViewModel *)self->_viewModel learnMore];
  id v6 = [v3 createGroupSpecifierWithIdentifier:@"noBenefactor" title:0 footerText:v4 linkText:v5 actionMethodName:@"_learnMoreWasTapped" target:self];

  return v6;
}

- (id)_myBeneficiariesSpecifiers
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v4 = self->_myBeneficiaries;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = +[AAUITrustedContactListCell specifierForContact:loadAction:target:](AAUITrustedContactListCell, "specifierForContact:loadAction:target:", *(void *)(*((void *)&v11 + 1) + 8 * i), sel__myBeneficiaryWasTapped_, self, (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_addBeneficiarySpecifier
{
  id v3 = objc_opt_new();
  int v4 = [(AAAccountBeneficiaryManagementViewModel *)self->_viewModel myBeneficiariesAdd];
  uint64_t v5 = [v3 createAddTableCellWithTitle:v4 loadAction:sel__showAddBeneficiary target:self];

  return v5;
}

- (id)_myBenefactorsGroupSpecifier
{
  id v3 = (void *)MEMORY[0x263F5FC40];
  int v4 = [(AAAccountBeneficiaryManagementViewModel *)self->_viewModel beneficiaryForGroupTitle];
  uint64_t v5 = [v4 uppercaseString];
  uint64_t v6 = [(AAAccountBeneficiaryManagementViewModel *)self->_viewModel beneficiaryForGroupTitle];
  uint64_t v7 = [v3 groupSpecifierWithID:v5 name:v6];

  return v7;
}

- (id)_myBenefactorsSpecifiers
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v4 = self->_myBenefactors;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "trustedContactStatus", (void)v12) == 2)
        {
          v10 = +[AAUITrustedContactListCell specifierForContact:v9 loadAction:sel__myBenefactorWasTapped_ target:self];
          [v3 addObject:v10];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_myBeneficiaryWasTapped:(id)a3
{
  id v10 = [a3 userInfo];
  uint64_t v4 = [v10 trustedContactStatus];
  uint64_t v5 = off_263F912F0;
  if (v4 != 1) {
    uint64_t v5 = off_263F912E0;
  }
  uint64_t v6 = (void *)[objc_alloc(*v5) initWithAccountManager:self->_accountManager localContact:v10];
  uint64_t v7 = objc_opt_new();
  id v8 = [v7 viewModelForFlow:2 withContact:v10];

  uint64_t v9 = [[AAUITrustedContactDetailsViewController alloc] initWithContact:v10 viewModel:v8 actionHandler:v6];
  [(AAUIAccountBeneficiaryViewController *)self _showViewController:v9];
}

- (void)_learnMoreWasTapped
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(AAAccountBeneficiaryManagementViewModel *)self->_viewModel learnMoreURL];
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "Learn more was tapped, URL is: %@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v6 = [(AAAccountBeneficiaryManagementViewModel *)self->_viewModel learnMoreURL];
  [v5 openURL:v6 withCompletionHandler:0];
}

- (void)_myBenefactorWasTapped:(id)a3
{
  id v8 = [a3 userInfo];
  uint64_t v4 = [[AAUIMyBenefactorActionHandler alloc] initWithAccountManager:self->_accountManager localContact:v8];
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = [v5 viewModelForFlow:3 withContact:v8];

  int v7 = [[AAUITrustedContactDetailsViewController alloc] initWithContact:v8 viewModel:v6 actionHandler:v4];
  [(AAUIAccountBeneficiaryViewController *)self _showViewController:v7];
}

- (void)_showAddBeneficiary
{
  id v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "Initiating Inheritance Beneficiary setup flow...", v9, 2u);
  }

  uint64_t v4 = [(AIDAAccountManager *)self->_accountManager accounts];
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  if (v5)
  {
    uint64_t v6 = [[AAUIInheritanceSetupFlowController alloc] initWithAccount:v5];
    inheritanceSetupFlowController = self->_inheritanceSetupFlowController;
    self->_inheritanceSetupFlowController = v6;

    [(AAUIInheritanceSetupFlowController *)self->_inheritanceSetupFlowController start];
    id v8 = [(AAUIInheritanceSetupFlowController *)self->_inheritanceSetupFlowController navigationController];
    [(AAUIAccountBeneficiaryViewController *)self _showViewController:v8];
  }
}

- (void)_showViewController:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(AAUIAccountBeneficiaryViewController *)self presentViewController:v4 animated:1 completion:0];
  }
  else {
    [(AAUIAccountBeneficiaryViewController *)self showViewController:v4 sender:self];
  }
}

- (id)_idmsAccount
{
  idmsAccount = self->_idmsAccount;
  if (!idmsAccount)
  {
    id v4 = [(AIDAAccountManager *)self->_accountManager accounts];
    uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

    uint64_t v6 = [MEMORY[0x263F290F0] sharedInstance];
    int v7 = objc_msgSend(v5, "aa_altDSID");
    id v8 = [v6 authKitAccountWithAltDSID:v7];
    uint64_t v9 = self->_idmsAccount;
    self->_idmsAccount = v8;

    idmsAccount = self->_idmsAccount;
  }
  return idmsAccount;
}

- (BOOL)_canHaveBeneficiary
{
  id v3 = [MEMORY[0x263F290F0] sharedInstance];
  id v4 = [(AAUIAccountBeneficiaryViewController *)self _idmsAccount];
  char v5 = [v3 canHaveBeneficiaryForAccount:v4];

  return v5;
}

- (BOOL)_canBeBeneficiary
{
  id v3 = [MEMORY[0x263F290F0] sharedInstance];
  id v4 = [(AAUIAccountBeneficiaryViewController *)self _idmsAccount];
  char v5 = [v3 canBeBeneficiaryForAccount:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idmsAccount, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_inheritanceSetupFlowController, 0);
  objc_storeStrong((id *)&self->_myBenefactors, 0);
  objc_storeStrong((id *)&self->_myBeneficiaries, 0);
  objc_storeStrong((id *)&self->_contactWorkQueue, 0);
  objc_storeStrong((id *)&self->_contactsProvider, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

- (void)initWithAccountManager:(uint64_t)a1 highlightRowIdentifier:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_209754000, a2, OS_LOG_TYPE_DEBUG, "Highlighting row %@", (uint8_t *)&v2, 0xCu);
}

@end