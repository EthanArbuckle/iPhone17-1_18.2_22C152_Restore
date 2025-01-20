@interface AAUIAccountRecoveryViewController
- (AAUIAccountRecoveryViewController)initWithAccountManager:(id)a3;
- (AAUIAccountRecoveryViewController)initWithAccountManager:(id)a3 highlightRowIdentifier:(id)a4;
- (BOOL)_canBeCustodian;
- (BOOL)_canHaveCustodian;
- (BOOL)_isEligibleForRecoveryKey;
- (BOOL)_isPrintableSummaryEnabled;
- (id)_accountRecoveryDetailsSpecifier;
- (id)_accountRecoveryDetailsSpecifierForIneligibleAccount;
- (id)_addRecoveryContactSpecifier;
- (id)_appleAccount;
- (id)_generateSpecifiers;
- (id)_idmsAccount;
- (id)_myRecoveryOptionsSpecifiers;
- (id)_printableSummarySpecifiers;
- (id)_recoveryContactForGroupSpecifier;
- (id)_recoveryContactForSpecifiers;
- (id)_recoveryKeySpecifiers;
- (id)_recoveryKeyState;
- (id)_recoveryOptionsGroupSpecifier;
- (id)_recoveryOptionsGroupSpecifierForIneligibleAccount;
- (id)specifiers;
- (void)_beginObservingNotifications;
- (void)_beginObservingReviewCustodianDismissedNotification;
- (void)_beginObservingTrustedContactChangeNotification;
- (void)_continueShowingAddCustodian;
- (void)_custodianshipOwnerWasTapped:(id)a3;
- (void)_displayCustodianAddNotAllowedAlert;
- (void)_displayRatchetGenericErrorAlert;
- (void)_fetchAllCustodianContacts;
- (void)_fetchRecoveryKeyUpdate;
- (void)_footerLearnMoreWasTapped;
- (void)_generateSpecifiers;
- (void)_isPrintableSummaryEnabled;
- (void)_learnMoreWasTapped;
- (void)_myRecoveryContactWasTapped:(id)a3;
- (void)_printAccountAccessSummary:(id)a3;
- (void)_printableSummaryLearnMoreTapped;
- (void)_reloadSpecifiersAnimated;
- (void)_rkFooterLearnMoreTapped;
- (void)_showAddCustodian;
- (void)_showRecoveryKey:(id)a3;
- (void)_showViewController:(id)a3;
- (void)_startSpinnerInSpecifier:(id)a3;
- (void)_stopObservingNotifications;
- (void)_stopObservingReviewCustodianDismissedNotification;
- (void)_stopObservingTrustedContactChangeNotification;
- (void)_syncAccountRecoveryFactorsWithCompletion:(id)a3;
- (void)_syncTrustedContactsFromCloudKit;
- (void)dealloc;
- (void)finishingRepair;
- (void)remoteUIRequestComplete:(id)a3 error:(id)a4;
- (void)reviewCustodianSheetDismissed:(id)a3 withUUIDs:(id)a4;
- (void)showReviewCustodiansModalIfNeeded;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AAUIAccountRecoveryViewController

- (AAUIAccountRecoveryViewController)initWithAccountManager:(id)a3
{
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)AAUIAccountRecoveryViewController;
  v6 = [(AAUIAccountRecoveryViewController *)&v26 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountManager, a3);
    uint64_t v8 = objc_opt_new();
    contactsProvider = v7->_contactsProvider;
    v7->_contactsProvider = (AAUIContactsProvider *)v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.appleaccountsettings.fetchcustodians", v10);
    contactWorkQueue = v7->_contactWorkQueue;
    v7->_contactWorkQueue = (OS_dispatch_queue *)v11;

    v13 = objc_alloc_init(AAUICustodianRepairHelper);
    repairHelper = v7->_repairHelper;
    v7->_repairHelper = v13;

    [(AAUICustodianRepairHelper *)v7->_repairHelper setRepairDelegate:v7];
    myCustodianshipOwners = v7->_myCustodianshipOwners;
    v7->_myCustodianshipOwners = (NSArray *)MEMORY[0x263EFFA68];

    uint64_t v16 = objc_opt_new();
    viewModel = v7->_viewModel;
    v7->_viewModel = (AAAccountRecoveryManagementViewModel *)v16;

    v18 = (AACustodianController *)objc_alloc_init(MEMORY[0x263F257E8]);
    custodianController = v7->_custodianController;
    v7->_custodianController = v18;

    v20 = (AKAppleIDAuthenticationController *)objc_alloc_init(MEMORY[0x263F29118]);
    authenticationController = v7->_authenticationController;
    v7->_authenticationController = v20;

    v7->_didShowCustodianReviewSheet = 0;
    id v22 = objc_alloc_init(MEMORY[0x263F29198]);
    v23 = [[AAUIDTOHelper alloc] initWithDTOController:v22];
    dtoHelper = v7->_dtoHelper;
    v7->_dtoHelper = v23;
  }
  return v7;
}

- (AAUIAccountRecoveryViewController)initWithAccountManager:(id)a3 highlightRowIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AAUIAccountRecoveryViewController;
  uint64_t v8 = [(AAUIAccountRecoveryViewController *)&v12 init];
  if (v8)
  {
    v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[AAUIAccountRecoveryViewController initWithAccountManager:highlightRowIdentifier:]();
    }

    objc_storeStrong((id *)((char *)&v8->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDA0]), a4);
  }
  v10 = [(AAUIAccountRecoveryViewController *)v8 initWithAccountManager:v6];

  return v10;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    self;
    v4 = (objc_class *)objc_claimAutoreleasedReturnValue();
    id v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "dealloc %@", buf, 0xCu);
  }
  [(AAUIAccountRecoveryViewController *)self _stopObservingNotifications];
  v6.receiver = self;
  v6.super_class = (Class)AAUIAccountRecoveryViewController;
  [(AAUIAccountRecoveryViewController *)&v6 dealloc];
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)AAUIAccountRecoveryViewController;
  [(AAUIAccountRecoveryViewController *)&v12 viewDidLoad];
  if (!self->_accountManager)
  {
    v3 = [(AAUIAccountRecoveryViewController *)self specifier];
    v4 = [v3 objectForKeyedSubscript:@"icloudAccountManager"];
    accountManager = self->_accountManager;
    self->_accountManager = v4;
  }
  objc_super v6 = [(AAAccountRecoveryManagementViewModel *)self->_viewModel title];
  id v7 = [(AAUIAccountRecoveryViewController *)self navigationItem];
  [v7 setTitle:v6];

  uint64_t v8 = [AAUISpinnerManager alloc];
  uint64_t v9 = [(AAUIAccountRecoveryViewController *)self navigationItem];
  v10 = [(AAUISpinnerManager *)v8 initWithNavigationItem:v9 hideBackButton:0];
  spinnerManager = self->_spinnerManager;
  self->_spinnerManager = v10;

  [(AAUIAccountRecoveryViewController *)self _fetchAllCustodianContacts];
  [(AAUIAccountRecoveryViewController *)self _beginObservingNotifications];
  [(AAUIAccountRecoveryViewController *)self _syncTrustedContactsFromCloudKit];
}

- (void)showReviewCustodiansModalIfNeeded
{
  id v3 = objc_alloc_init(MEMORY[0x263F25868]);
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __70__AAUIAccountRecoveryViewController_showReviewCustodiansModalIfNeeded__block_invoke;
  v4[3] = &unk_263F93C38;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  [v3 pendingFollowUpWithIdentifier:@"com.apple.AAFollowUpIdentifier.custodianReview" completion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __70__AAUIAccountRecoveryViewController_showReviewCustodiansModalIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = _AAUILogSystem();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "Found Custodian Review followup. Presenting Custodian Review sheet", buf, 2u);
    }

    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __70__AAUIAccountRecoveryViewController_showReviewCustodiansModalIfNeeded__block_invoke_57;
    v6[3] = &unk_263F92668;
    objc_copyWeak(&v7, (id *)(a1 + 40));
    v6[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], v6);
    objc_destroyWeak(&v7);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __70__AAUIAccountRecoveryViewController_showReviewCustodiansModalIfNeeded__block_invoke_cold_1();
    }
  }
}

void __70__AAUIAccountRecoveryViewController_showReviewCustodiansModalIfNeeded__block_invoke_57(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = +[AAUIReviewCustodianListViewFactory createWithAccountManager:*(void *)(*(void *)(a1 + 32) + 1384) repairHelper:WeakRetained[177]];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __70__AAUIAccountRecoveryViewController_showReviewCustodiansModalIfNeeded__block_invoke_2;
    v5[3] = &unk_263F92AB8;
    objc_copyWeak(&v6, v2);
    [WeakRetained presentViewController:v4 animated:1 completion:v5];
    objc_destroyWeak(&v6);
  }
}

void __70__AAUIAccountRecoveryViewController_showReviewCustodiansModalIfNeeded__block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  WeakRetained[1504] = 1;
  v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __70__AAUIAccountRecoveryViewController_showReviewCustodiansModalIfNeeded__block_invoke_2_cold_1();
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AAUIAccountRecoveryViewController;
  [(AAUIAccountRecoveryViewController *)&v4 viewWillAppear:a3];
  [(AAUIAccountRecoveryViewController *)self _fetchRecoveryKeyUpdate];
  [(AAUIAccountRecoveryViewController *)self reloadSpecifiers];
  if (!self->_didShowCustodianReviewSheet) {
    [(AAUIAccountRecoveryViewController *)self showReviewCustodiansModalIfNeeded];
  }
}

- (void)_beginObservingNotifications
{
  [(AAUIAccountRecoveryViewController *)self _beginObservingReviewCustodianDismissedNotification];
  [(AAUIAccountRecoveryViewController *)self _beginObservingTrustedContactChangeNotification];
}

- (void)reviewCustodianSheetDismissed:(id)a3 withUUIDs:(id)a4
{
  id v5 = a3;
  if ([(AAUIAccountRecoveryViewController *)self isViewLoaded]
    && ([(AAUIAccountRecoveryViewController *)self view],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v6 window],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    uint64_t v8 = CFPreferencesCopyAppValue(@"DismissCustodianReviewCFU", (CFStringRef)*MEMORY[0x263F256E0]);
    uint64_t v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[AAUIAccountRecoveryViewController reviewCustodianSheetDismissed:withUUIDs:]();
    }

    if (v8 && [MEMORY[0x263F259D8] canRepairCustodian])
    {
      v10 = _AAUILogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[AAUIAccountRecoveryViewController reviewCustodianSheetDismissed:withUUIDs:]();
      }

      id v11 = objc_alloc_init(MEMORY[0x263F257E8]);
      objc_super v12 = [v5 userInfo];
      v13 = [v12 valueForKey:@"custodianUUIDs"];
      [v11 repairCustodians:v13 remove:MEMORY[0x263EFFA68] completion:&__block_literal_global_18];
    }
  }
  else
  {
    uint64_t v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AAUIAccountRecoveryViewController reviewCustodianSheetDismissed:withUUIDs:]();
    }
  }
}

void __77__AAUIAccountRecoveryViewController_reviewCustodianSheetDismissed_withUUIDs___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _AAUILogSystem();
  objc_super v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __77__AAUIAccountRecoveryViewController_reviewCustodianSheetDismissed_withUUIDs___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "Successfully repaired custodians.", v5, 2u);
  }
}

- (void)_stopObservingNotifications
{
  [(AAUIAccountRecoveryViewController *)self _stopObservingReviewCustodianDismissedNotification];
  [(AAUIAccountRecoveryViewController *)self _stopObservingTrustedContactChangeNotification];
}

- (void)_beginObservingReviewCustodianDismissedNotification
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_reviewCustodianSheetDismissed_withUUIDs_ name:@"AAUICustodianReviewSheetDismissed" object:0];
}

- (void)_beginObservingTrustedContactChangeNotification
{
  id v3 = [MEMORY[0x263F087C8] defaultCenter];
  [v3 addObserver:self selector:sel__fetchAllCustodianContacts name:*MEMORY[0x263F256F0] object:0 suspensionBehavior:4];
}

- (void)_stopObservingTrustedContactChangeNotification
{
  id v3 = [MEMORY[0x263F087C8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F256F0] object:0];
}

- (void)_stopObservingReviewCustodianDismissedNotification
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"AAUICustodianReviewSheetDismissed" object:0];
}

- (id)specifiers
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v3))
  {
    objc_super v4 = [(AAUIAccountRecoveryViewController *)self _generateSpecifiers];
    id v5 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v4;
  }
  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + v3);
    int v10 = 138412290;
    uint64_t v11 = v7;
    _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "AAUIAccountRecoveryViewController specifiers: returning %@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v8 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  return v8;
}

- (id)_generateSpecifiers
{
  uint64_t v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "Loading Account Recovery specifiers.", buf, 2u);
  }

  objc_super v4 = objc_opt_new();
  BOOL v5 = [(AAUIAccountRecoveryViewController *)self _canHaveCustodian];
  id v6 = _AAUILogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "Account can have custodians, adding custodian specifiers to UI...", v24, 2u);
    }

    uint64_t v8 = [(AAUIAccountRecoveryViewController *)self _accountRecoveryDetailsSpecifier];
    [v4 addObject:v8];

    uint64_t v9 = [(AAUIAccountRecoveryViewController *)self _recoveryOptionsGroupSpecifier];
    [v4 addObject:v9];

    int v10 = [(AAUIAccountRecoveryViewController *)self _myRecoveryOptionsSpecifiers];
    [v4 addObjectsFromArray:v10];

    uint64_t v11 = [(AAUIAccountRecoveryViewController *)self _addRecoveryContactSpecifier];
    [v4 addObject:v11];
  }
  else
  {
    if (v7)
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "Account not eligible to have custodians, adding ineligible specifiers to UI...", v23, 2u);
    }

    uint64_t v12 = [(AAUIAccountRecoveryViewController *)self _accountRecoveryDetailsSpecifierForIneligibleAccount];
    [v4 addObject:v12];

    v13 = [(AAUIAccountRecoveryViewController *)self _recoveryOptionsGroupSpecifierForIneligibleAccount];
    [v4 addObject:v13];

    uint64_t v11 = [(AAUIAccountRecoveryViewController *)self _myRecoveryOptionsSpecifiers];
    [v4 addObjectsFromArray:v11];
  }

  if ([(AAUIAccountRecoveryViewController *)self _isEligibleForRecoveryKey])
  {
    v14 = [(AAUIAccountRecoveryViewController *)self _recoveryKeySpecifiers];
    [v4 addObjectsFromArray:v14];
  }
  if ([(AAUIAccountRecoveryViewController *)self _canBeCustodian])
  {
    v15 = _AAUILogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v22 = 0;
      _os_log_impl(&dword_209754000, v15, OS_LOG_TYPE_DEFAULT, "Account can be a custodian, adding custodianship owner specifiers, if any, to UI...", v22, 2u);
    }

    if ([(NSArray *)self->_myCustodianshipOwners count])
    {
      uint64_t v16 = [(AAUIAccountRecoveryViewController *)self _recoveryContactForGroupSpecifier];
      [v4 addObject:v16];

      v17 = [(AAUIAccountRecoveryViewController *)self _recoveryContactForSpecifiers];
      [v4 addObjectsFromArray:v17];
    }
  }
  BOOL v18 = [(AAUIAccountRecoveryViewController *)self _isPrintableSummaryEnabled];
  v19 = _AAUILogSystem();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
  if (v18)
  {
    if (v20) {
      -[AAUIAccountRecoveryViewController _generateSpecifiers]();
    }

    v19 = [(AAUIAccountRecoveryViewController *)self _printableSummarySpecifiers];
    [v4 addObjectsFromArray:v19];
  }
  else if (v20)
  {
    -[AAUIAccountRecoveryViewController _generateSpecifiers]();
  }

  return v4;
}

- (void)_reloadSpecifiersAnimated
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (v3 && *((unsigned char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDA8]))
  {
    id v4 = v3;
    BOOL v5 = [(AAUIAccountRecoveryViewController *)self _generateSpecifiers];
    id v6 = [v5 differenceFromArray:v4 withOptions:0 usingEquivalenceTest:&__block_literal_global_80];
    [(AAUIAccountRecoveryViewController *)self beginUpdates];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    BOOL v7 = [v6 removals];
    uint64_t v8 = [v7 reverseObjectEnumerator];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v8);
          }
          -[AAUIAccountRecoveryViewController removeSpecifierAtIndex:animated:](self, "removeSpecifierAtIndex:animated:", [*(id *)(*((void *)&v24 + 1) + 8 * i) index], 1);
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v10);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v13 = objc_msgSend(v6, "insertions", 0);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          BOOL v18 = *(void **)(*((void *)&v20 + 1) + 8 * j);
          v19 = [v18 object];
          -[AAUIAccountRecoveryViewController insertSpecifier:atIndex:animated:](self, "insertSpecifier:atIndex:animated:", v19, [v18 index], 1);
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v15);
    }

    [(AAUIAccountRecoveryViewController *)self endUpdates];
  }
  else
  {
    [(AAUIAccountRecoveryViewController *)self reloadSpecifiers];
  }
}

uint64_t __62__AAUIAccountRecoveryViewController__reloadSpecifiersAnimated__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 identifier];
  BOOL v7 = [v5 identifier];
  uint64_t v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    uint64_t v9 = [v4 userInfo];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v11 = [v5 userInfo];
      objc_opt_class();
      char v12 = objc_opt_isKindOfClass();

      if (v12)
      {
        v13 = [v4 userInfo];
        uint64_t v14 = [v5 userInfo];
        uint64_t v15 = [v13 displayName];
        uint64_t v16 = [v14 displayName];
        if (v15 == (void *)v16)
        {
        }
        else
        {
          v17 = (void *)v16;
          BOOL v18 = [v13 displayName];
          v19 = [v14 displayName];
          int v20 = [v18 isEqualToString:v19];

          if (!v20) {
            goto LABEL_11;
          }
        }
        long long v21 = [v13 detailsText];
        uint64_t v22 = [v14 detailsText];
        if (v21 == (void *)v22)
        {
        }
        else
        {
          long long v23 = (void *)v22;
          long long v24 = [v13 detailsText];
          long long v25 = [v14 detailsText];
          int v26 = [v24 isEqualToString:v25];

          if (!v26)
          {
LABEL_11:
            uint64_t v8 = 0;
LABEL_14:

            goto LABEL_15;
          }
        }
        int v27 = [v13 shouldGrayOutContactRow];
        uint64_t v8 = v27 ^ [v14 shouldGrayOutContactRow] ^ 1;
        goto LABEL_14;
      }
    }
    uint64_t v8 = 1;
  }
LABEL_15:

  return v8;
}

- (BOOL)_isPrintableSummaryEnabled
{
  BOOL v3 = +[AAUIFeatureFlags isPrintableSummaryEnabled];
  id v4 = _AAUILogSystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      -[AAUIAccountRecoveryViewController _isPrintableSummaryEnabled].cold.5();
    }

    id v6 = (void *)MEMORY[0x263F34328];
    BOOL v7 = [(AAUIAccountRecoveryViewController *)self _idmsAccount];
    uint64_t v8 = objc_msgSend(v7, "aa_altDSID");
    int v9 = [v6 isHSA2Enabled:v8];

    uint64_t v10 = _AAUILogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[AAUIAccountRecoveryViewController _isPrintableSummaryEnabled].cold.4();
    }

    uint64_t v11 = (void *)MEMORY[0x263F34328];
    char v12 = [(AAUIAccountRecoveryViewController *)self _appleAccount];
    v13 = objc_msgSend(v12, "aa_personID");
    int v14 = [v11 isICDPEnabledForDSID:v13];

    uint64_t v15 = _AAUILogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[AAUIAccountRecoveryViewController _isPrintableSummaryEnabled]();
    }

    uint64_t v16 = [MEMORY[0x263F290F0] sharedInstance];
    v17 = [(AAUIAccountRecoveryViewController *)self _idmsAccount];
    char v18 = [v16 userUnderAgeForAccount:v17];

    v19 = _AAUILogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[AAUIAccountRecoveryViewController _isPrintableSummaryEnabled]();
    }

    int v20 = [(AAUIAccountRecoveryViewController *)self _appleAccount];
    char v21 = objc_msgSend(v20, "aa_isManagedAppleID");

    uint64_t v22 = _AAUILogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[AAUIAccountRecoveryViewController _isPrintableSummaryEnabled]();
    }

    if ((v9 & v14) == 1) {
      return (v18 | v21) ^ 1;
    }
  }
  else
  {
    if (v5) {
      -[AAUIAccountRecoveryViewController _isPrintableSummaryEnabled].cold.6();
    }
  }
  return 0;
}

- (void)_printAccountAccessSummary:(id)a3
{
  id v4 = a3;
  BOOL v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "Print Account Access Summary button was tapped.", buf, 2u);
  }

  *(void *)buf = 0;
  uint64_t v10 = buf;
  uint64_t v11 = 0x3032000000;
  char v12 = __Block_byref_object_copy__10;
  v13 = __Block_byref_object_dispose__10;
  id v14 = +[AAUIPasscodeValidateController stingrayControllerWithPresenter:self forceInline:1];
  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[AAUIAccountRecoveryViewController _printAccountAccessSummary:]();
  }

  BOOL v7 = (void *)*((void *)v10 + 5);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__AAUIAccountRecoveryViewController__printAccountAccessSummary___block_invoke;
  v8[3] = &unk_263F93C80;
  v8[4] = self;
  v8[5] = buf;
  [v7 validatePasscodeStateWithCompletion:v8];
  _Block_object_dispose(buf, 8);
}

void __64__AAUIAccountRecoveryViewController__printAccountAccessSummary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    BOOL v7 = +[AAUIPrintableAccountRecoverySummaryViewFactory createWithContext:@"settings"];
    [*(id *)(a1 + 32) presentViewController:v7 animated:1 completion:0];
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  int v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;

  uint64_t v10 = _AAUILogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __64__AAUIAccountRecoveryViewController__printAccountAccessSummary___block_invoke_cold_1();
  }
}

- (void)remoteUIRequestComplete:(id)a3 error:(id)a4
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __67__AAUIAccountRecoveryViewController_remoteUIRequestComplete_error___block_invoke;
  v4[3] = &unk_263F92AB8;
  objc_copyWeak(&v5, &location);
  dispatch_async(MEMORY[0x263EF83A0], v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __67__AAUIAccountRecoveryViewController_remoteUIRequestComplete_error___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[182] stopAllSpinners];
  v1 = [WeakRetained view];
  [v1 setUserInteractionEnabled:1];
}

- (void)_syncTrustedContactsFromCloudKit
{
  objc_initWeak(&location, self);
  custodianController = self->_custodianController;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __69__AAUIAccountRecoveryViewController__syncTrustedContactsFromCloudKit__block_invoke;
  v4[3] = &unk_263F93CA8;
  objc_copyWeak(&v5, &location);
  [(AACustodianController *)custodianController pullTrustedContactsFromCloudKitWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __69__AAUIAccountRecoveryViewController__syncTrustedContactsFromCloudKit__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "Completed sync of trusted contacts from CloudKit with error: %@", buf, 0xCu);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__AAUIAccountRecoveryViewController__syncTrustedContactsFromCloudKit__block_invoke_88;
  block[3] = &unk_263F92AB8;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v6);
}

void __69__AAUIAccountRecoveryViewController__syncTrustedContactsFromCloudKit__block_invoke_88(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _fetchAllCustodianContacts];
    id WeakRetained = v2;
  }
}

- (void)_fetchAllCustodianContacts
{
  [(AAUISpinnerManager *)self->_spinnerManager startNavigationSpinner];
  objc_initWeak(location, self);
  id v3 = dispatch_group_create();
  id v4 = objc_opt_new();
  dispatch_group_enter(v3);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __63__AAUIAccountRecoveryViewController__fetchAllCustodianContacts__block_invoke;
  v27[3] = &unk_263F93CD0;
  id v5 = v3;
  v28 = v5;
  objc_copyWeak(&v29, location);
  [v4 isWalrusRecoveryKeyAvailableWithCompletion:v27];
  id v6 = objc_opt_new();
  if (!self->_myCustodiansRequestId)
  {
    BOOL v7 = [(AAUICustodianRepairHelper *)self->_repairHelper localContacts];
    uint64_t v8 = [v7 count];

    if (!v8)
    {
      dispatch_group_enter(v5);
      contactsProvider = self->_contactsProvider;
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __63__AAUIAccountRecoveryViewController__fetchAllCustodianContacts__block_invoke_98;
      v23[3] = &unk_263F93D20;
      objc_copyWeak(&v26, location);
      long long v24 = v5;
      long long v25 = v6;
      [(AAContactsProvider *)contactsProvider fetchMyCachedCustodians:v23];

      objc_destroyWeak(&v26);
    }
  }
  dispatch_group_enter(v5);
  uint64_t v10 = self->_contactsProvider;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __63__AAUIAccountRecoveryViewController__fetchAllCustodianContacts__block_invoke_3;
  v19[3] = &unk_263F93D20;
  objc_copyWeak(&v22, location);
  uint64_t v11 = v5;
  int v20 = v11;
  char v21 = v6;
  [(AAContactsProvider *)v10 fetchMyCustodians:v19];
  objc_storeStrong((id *)&self->_myCustodiansRequestId, v6);
  dispatch_group_enter(v11);
  char v12 = self->_contactsProvider;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __63__AAUIAccountRecoveryViewController__fetchAllCustodianContacts__block_invoke_5;
  v16[3] = &unk_263F93D70;
  objc_copyWeak(&v18, location);
  v13 = v11;
  v17 = v13;
  [(AAContactsProvider *)v12 fetchMyCustodianshipOwners:v16];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__AAUIAccountRecoveryViewController__fetchAllCustodianContacts__block_invoke_7;
  block[3] = &unk_263F92AB8;
  objc_copyWeak(&v15, location);
  dispatch_group_notify(v13, MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&v29);
  objc_destroyWeak(location);
}

void __63__AAUIAccountRecoveryViewController__fetchAllCustodianContacts__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _AAUILogSystem();
  BOOL v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __63__AAUIAccountRecoveryViewController__fetchAllCustodianContacts__block_invoke_cold_1();
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = @"NO";
      if (a2) {
        uint64_t v8 = @"YES";
      }
      int v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_209754000, v7, OS_LOG_TYPE_DEFAULT, "Recovery key state: %@ (fetch all)", (uint8_t *)&v12, 0xCu);
    }

    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v10 = WeakRetained;
    if (WeakRetained && *((unsigned __int8 *)WeakRetained + 1488) != a2)
    {
      *((unsigned char *)WeakRetained + 1488) = a2;
      uint64_t v11 = [WeakRetained[180] recoveryKeyLabel];
      [v10 reloadSpecifierID:v11];
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void __63__AAUIAccountRecoveryViewController__fetchAllCustodianContacts__block_invoke_98(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__AAUIAccountRecoveryViewController__fetchAllCustodianContacts__block_invoke_2;
  v7[3] = &unk_263F93CF8;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = v4;
  uint64_t v9 = v5;
  id v10 = v3;
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v7);

  objc_destroyWeak(&v11);
}

void __63__AAUIAccountRecoveryViewController__fetchAllCustodianContacts__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && [*(id *)(a1 + 40) isEqual:WeakRetained[176]])
  {
    [WeakRetained[177] setLocalContacts:*(void *)(a1 + 48)];
    [WeakRetained _reloadSpecifiersAnimated];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __63__AAUIAccountRecoveryViewController__fetchAllCustodianContacts__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__AAUIAccountRecoveryViewController__fetchAllCustodianContacts__block_invoke_4;
  v7[3] = &unk_263F93CF8;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = v4;
  uint64_t v9 = v5;
  id v10 = v3;
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v7);

  objc_destroyWeak(&v11);
}

void __63__AAUIAccountRecoveryViewController__fetchAllCustodianContacts__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && [*(id *)(a1 + 40) isEqual:*((void *)WeakRetained + 176)])
  {
    id v2 = (void *)*((void *)WeakRetained + 176);
    *((void *)WeakRetained + 176) = 0;

    [*((id *)WeakRetained + 177) setLocalContacts:*(void *)(a1 + 48)];
    [WeakRetained _reloadSpecifiersAnimated];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __63__AAUIAccountRecoveryViewController__fetchAllCustodianContacts__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__AAUIAccountRecoveryViewController__fetchAllCustodianContacts__block_invoke_6;
  block[3] = &unk_263F93D48;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v8);
}

void __63__AAUIAccountRecoveryViewController__fetchAllCustodianContacts__block_invoke_6(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 178, *(id *)(a1 + 40));
    [WeakRetained _reloadSpecifiersAnimated];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __63__AAUIAccountRecoveryViewController__fetchAllCustodianContacts__block_invoke_7(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained[182] stopNavigationSpinner];
    id WeakRetained = v2;
  }
}

- (void)_fetchRecoveryKeyUpdate
{
  objc_initWeak(&location, self);
  id v2 = objc_opt_new();
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __60__AAUIAccountRecoveryViewController__fetchRecoveryKeyUpdate__block_invoke;
  v3[3] = &unk_263F93B20;
  objc_copyWeak(&v4, &location);
  [v2 isWalrusRecoveryKeyAvailableWithCompletion:v3];
  objc_destroyWeak(&v4);

  objc_destroyWeak(&location);
}

void __60__AAUIAccountRecoveryViewController__fetchRecoveryKeyUpdate__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = _AAUILogSystem();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __60__AAUIAccountRecoveryViewController__fetchRecoveryKeyUpdate__block_invoke_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = @"NO";
      if (a2) {
        uint64_t v9 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      int v12 = v9;
      _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "Recovery key state: %@ (fetch recovery key)", buf, 0xCu);
    }

    if (WeakRetained && WeakRetained[1488] != a2)
    {
      WeakRetained[1488] = a2;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __60__AAUIAccountRecoveryViewController__fetchRecoveryKeyUpdate__block_invoke_100;
      block[3] = &unk_263F92168;
      void block[4] = WeakRetained;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

void __60__AAUIAccountRecoveryViewController__fetchRecoveryKeyUpdate__block_invoke_100(uint64_t a1)
{
  v1 = *(id **)(a1 + 32);
  id v2 = [v1[180] recoveryKeyLabel];
  [v1 reloadSpecifierID:v2];
}

- (void)_syncAccountRecoveryFactorsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_group_create();
  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to sync recovery factors and walrus status", buf, 2u);
  }

  dispatch_group_enter(v5);
  custodianController = self->_custodianController;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __79__AAUIAccountRecoveryViewController__syncAccountRecoveryFactorsWithCompletion___block_invoke;
  v15[3] = &unk_263F92730;
  id v8 = v5;
  uint64_t v16 = v8;
  [(AACustodianController *)custodianController performTrustedContactsDataSyncWithCompletion:v15];
  dispatch_group_enter(v8);
  authenticationController = self->_authenticationController;
  id v10 = [(AAUIAccountRecoveryViewController *)self _appleAccount];
  id v11 = objc_msgSend(v10, "aa_altDSID");
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __79__AAUIAccountRecoveryViewController__syncAccountRecoveryFactorsWithCompletion___block_invoke_101;
  v13[3] = &unk_263F92730;
  uint64_t v14 = v8;
  int v12 = v8;
  [(AKAppleIDAuthenticationController *)authenticationController performCheckInForAccountWithAltDSID:v11 completion:v13];

  dispatch_group_notify(v12, MEMORY[0x263EF83A0], v4);
}

void __79__AAUIAccountRecoveryViewController__syncAccountRecoveryFactorsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v4 = _AAUILogSystem();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __79__AAUIAccountRecoveryViewController__syncAccountRecoveryFactorsWithCompletion___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "Successfully performed trusted contacts data sync", v6, 2u);
  }
}

void __79__AAUIAccountRecoveryViewController__syncAccountRecoveryFactorsWithCompletion___block_invoke_101(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v4 = _AAUILogSystem();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __79__AAUIAccountRecoveryViewController__syncAccountRecoveryFactorsWithCompletion___block_invoke_101_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "Successfully performed liveness check-in", v6, 2u);
  }
}

- (id)_accountRecoveryDetailsSpecifier
{
  id v3 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"ACCOUNT RECOVERY DETAILS" name:0];
  id v4 = [(AAAccountRecoveryManagementViewModel *)self->_viewModel details];
  [v3 setProperty:v4 forKey:*MEMORY[0x263F600F8]];

  return v3;
}

- (id)_accountRecoveryDetailsSpecifierForIneligibleAccount
{
  id v3 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"ACCOUNT RECOVERY DETAILS INELIGIBLE" name:0];
  id v4 = [(AAAccountRecoveryManagementViewModel *)self->_viewModel detailsForIneligibleAccount];
  [v3 setProperty:v4 forKey:*MEMORY[0x263F600F8]];

  return v3;
}

- (id)_recoveryOptionsGroupSpecifier
{
  id v3 = objc_opt_new();
  id v4 = [(AAAccountRecoveryManagementViewModel *)self->_viewModel myRecoveryContactsGroupTitle];
  id v5 = [(AAAccountRecoveryManagementViewModel *)self->_viewModel myRecoveryContactsFooter];
  id v6 = [(AAAccountRecoveryManagementViewModel *)self->_viewModel learnMore];
  id v7 = [v3 createGroupSpecifierWithIdentifier:@"RECOVERY CONTACT" title:v4 footerText:v5 linkText:v6 actionMethodName:@"_footerLearnMoreWasTapped" target:self];

  return v7;
}

- (id)_recoveryOptionsGroupSpecifierForIneligibleAccount
{
  id v3 = objc_opt_new();
  id v4 = [(AAAccountRecoveryManagementViewModel *)self->_viewModel myRecoveryContactsGroupTitle];
  id v5 = [(AAAccountRecoveryManagementViewModel *)self->_viewModel myRecoveryContactsFooterForIneligibleAccount];
  id v6 = [(AAAccountRecoveryManagementViewModel *)self->_viewModel learnMore];
  id v7 = [v3 createGroupSpecifierWithIdentifier:@"RECOVERY CONTACT INELIGIBLE" title:v4 footerText:v5 linkText:v6 actionMethodName:@"_footerLearnMoreWasTapped" target:self];

  return v7;
}

- (id)_myRecoveryOptionsSpecifiers
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  if ([(AAUIAccountRecoveryViewController *)self _canHaveCustodian])
  {
    id v4 = [(AAUICustodianRepairHelper *)self->_repairHelper localContacts];
    id v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_121];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    obuint64_t j = v5;
    uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v11 = +[AAUITrustedContactListCell specifierForContact:v10 loadAction:sel__myRecoveryContactWasTapped_ target:self];
          int v12 = [v10 handle];
          uint64_t v13 = [@"RecoveryOption-" stringByAppendingString:v12];
          [v11 setIdentifier:v13];

          [v3 addObject:v11];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }
  }
  return v3;
}

uint64_t __65__AAUIAccountRecoveryViewController__myRecoveryOptionsSpecifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 displayName];
  uint64_t v6 = [v4 displayName];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)_addRecoveryContactSpecifier
{
  id v3 = objc_opt_new();
  id v4 = [(AAAccountRecoveryManagementViewModel *)self->_viewModel myRecoveryContactsAdd];
  id v5 = [v3 createAddTableCellWithTitle:v4 loadAction:sel__showAddCustodian target:self];

  return v5;
}

- (id)_printableSummarySpecifiers
{
  id v3 = objc_opt_new();
  long long v17 = objc_opt_new();
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [(AAAccountRecoveryManagementViewModel *)self->_viewModel printableSummaryFooter];
  uint64_t v6 = [v4 localizedStringForKey:v5 value:&stru_26BD39CD8 table:@"Localizable"];
  uint64_t v7 = [(AAAccountRecoveryManagementViewModel *)self->_viewModel learnMore];
  uint64_t v8 = [v17 createGroupSpecifierWithIdentifier:@"PRINTABLE SUMMARY" title:&stru_26BD39CD8 footerText:v6 linkText:v7 actionMethodName:@"_printableSummaryLearnMoreTapped" target:self];

  [v3 addObject:v8];
  uint64_t v9 = (void *)MEMORY[0x263F5FC40];
  id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v11 = [(AAAccountRecoveryManagementViewModel *)self->_viewModel printableSummaryLabel];
  int v12 = [v10 localizedStringForKey:v11 value:&stru_26BD39CD8 table:@"Localizable"];
  uint64_t v13 = [v9 preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:0 cell:13 edit:0];

  uint64_t v14 = [(AAAccountRecoveryManagementViewModel *)self->_viewModel printableSummaryLabel];
  [v13 setProperty:v14 forKey:*MEMORY[0x263F602D0]];

  id v15 = [(AAAccountRecoveryManagementViewModel *)self->_viewModel printableSummaryLabel];
  [v13 setIdentifier:v15];

  [v13 setButtonAction:sel__printAccountAccessSummary_];
  [v3 addObject:v13];

  return v3;
}

- (id)_recoveryKeySpecifiers
{
  id v3 = objc_opt_new();
  id v4 = objc_opt_new();
  id v5 = [(AAAccountRecoveryManagementViewModel *)self->_viewModel recoveryKeyLabel];
  uint64_t v6 = [(AAAccountRecoveryManagementViewModel *)self->_viewModel recoveryKeyDetails];
  uint64_t v7 = [(AAAccountRecoveryManagementViewModel *)self->_viewModel learnMore];
  uint64_t v8 = [v4 createGroupSpecifierWithIdentifier:@"RECOVERY KEY" title:v5 footerText:v6 linkText:v7 actionMethodName:@"_rkFooterLearnMoreTapped" target:self];

  [v3 addObject:v8];
  uint64_t v9 = (void *)MEMORY[0x263F5FC40];
  id v10 = [(AAAccountRecoveryManagementViewModel *)self->_viewModel recoveryKeyLabel];
  id v11 = [v9 preferenceSpecifierNamed:v10 target:self set:0 get:sel__recoveryKeyState detail:0 cell:2 edit:0];

  int v12 = [(AAAccountRecoveryManagementViewModel *)self->_viewModel recoveryKeyLabel];
  [v11 setIdentifier:v12];

  uint64_t v13 = [(AAAccountRecoveryManagementViewModel *)self->_viewModel recoveryKeyLabel];
  [v11 setProperty:v13 forKey:*MEMORY[0x263F602D0]];

  [v11 setControllerLoadAction:sel__showRecoveryKey_];
  [v3 addObject:v11];

  return v3;
}

- (id)_recoveryContactForGroupSpecifier
{
  id v2 = (void *)MEMORY[0x263F5FC40];
  id v3 = [(AAAccountRecoveryManagementViewModel *)self->_viewModel recoveryContactForGroupTitle];
  id v4 = [v2 groupSpecifierWithID:@"ACCOUNT RECOVERY FOR" name:v3];

  return v4;
}

- (id)_recoveryContactForSpecifiers
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  obuint64_t j = self->_myCustodianshipOwners;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v9 = +[AAUITrustedContactListCell specifierForContact:v8 loadAction:sel__custodianshipOwnerWasTapped_ target:self];
        id v10 = [v8 handle];
        id v11 = [@"RecoveryContact-" stringByAppendingString:v10];
        [v9 setIdentifier:v11];

        [v3 addObject:v9];
      }
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  return v3;
}

- (void)_myRecoveryContactWasTapped:(id)a3
{
  id v10 = [a3 userInfo];
  uint64_t v4 = [v10 trustedContactStatus];
  uint64_t v5 = off_263F912F8;
  if (v4 != 1) {
    uint64_t v5 = off_263F912E8;
  }
  uint64_t v6 = (void *)[objc_alloc(*v5) initWithAccountManager:self->_accountManager localContact:v10];
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = [v7 viewModelForFlow:0 withContact:v10];

  uint64_t v9 = [[AAUITrustedContactDetailsViewController alloc] initWithContact:v10 viewModel:v8 actionHandler:v6];
  [(AAUIAccountRecoveryViewController *)self _showViewController:v9];
}

- (void)_learnMoreWasTapped
{
  id v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "iCDRS Learn More was tapped", v6, 2u);
  }

  uint64_t v4 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v5 = [(AAAccountRecoveryManagementViewModel *)self->_viewModel learnMoreURL];
  [v4 openURL:v5 withCompletionHandler:0];
}

- (void)_footerLearnMoreWasTapped
{
  id v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "iCDRS Footer Learn More was tapped", v6, 2u);
  }

  uint64_t v4 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v5 = [(AAAccountRecoveryManagementViewModel *)self->_viewModel footerLearnMoreURL];
  [v4 openURL:v5 withCompletionHandler:0];
}

- (void)_custodianshipOwnerWasTapped:(id)a3
{
  id v8 = [a3 userInfo];
  uint64_t v4 = [[AAUICustodianForActionHandler alloc] initWithLocalContact:v8];
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = [v5 viewModelForFlow:1 withContact:v8];

  uint64_t v7 = [[AAUITrustedContactDetailsViewController alloc] initWithContact:v8 viewModel:v6 actionHandler:v4];
  [(AAUIAccountRecoveryViewController *)self _showViewController:v7];
}

- (void)_showAddCustodian
{
  id v3 = [(AIDAAccountManager *)self->_accountManager accounts];
  uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  if (v4)
  {
    dtoHelper = self->_dtoHelper;
    uint64_t v6 = objc_msgSend(v4, "aa_altDSID");
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __54__AAUIAccountRecoveryViewController__showAddCustodian__block_invoke;
    v8[3] = &unk_263F92968;
    v8[4] = self;
    [(AAUIDTOHelper *)dtoHelper shouldGateUsingRatchetForAltDSID:v6 completion:v8];
  }
  else
  {
    uint64_t v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[AAUIRecoveryFactorController startAddingRecoveryContact]();
    }
  }
}

void __54__AAUIAccountRecoveryViewController__showAddCustodian__block_invoke(uint64_t a1, int a2)
{
  if (!a2)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __54__AAUIAccountRecoveryViewController__showAddCustodian__block_invoke_168;
    v13[3] = &unk_263F92168;
    void v13[4] = *(void *)(a1 + 32);
    id v11 = MEMORY[0x263EF83A0];
    int v12 = v13;
LABEL_10:
    dispatch_async(v11, v12);
    return;
  }
  id v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_cold_2();
  }

  if (![*(id *)(*(void *)(a1 + 32) + 1480) isDTOGatingEnabled])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__AAUIAccountRecoveryViewController__showAddCustodian__block_invoke_2;
    block[3] = &unk_263F92168;
    void block[4] = *(void *)(a1 + 32);
    id v11 = MEMORY[0x263EF83A0];
    int v12 = block;
    goto LABEL_10;
  }
  uint64_t v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_cold_1();
  }

  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = (void *)v5[185];
  uint64_t v7 = [v5 presentingViewController];
  id v8 = [v6 makeRatchetContextWithPresentationContext:v7 DTOContextType:1];

  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 1480);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __54__AAUIAccountRecoveryViewController__showAddCustodian__block_invoke_166;
  v15[3] = &unk_263F929D0;
  void v15[4] = v9;
  [v10 shouldAllowOpForContext:v8 completion:v15];
}

void __54__AAUIAccountRecoveryViewController__showAddCustodian__block_invoke_166(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __54__AAUIAccountRecoveryViewController__showAddCustodian__block_invoke_166_cold_1();
  }

  if (a2)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__AAUIAccountRecoveryViewController__showAddCustodian__block_invoke_167;
    block[3] = &unk_263F92168;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __54__AAUIAccountRecoveryViewController__showAddCustodian__block_invoke_167(uint64_t a1)
{
  return [*(id *)(a1 + 32) _continueShowingAddCustodian];
}

uint64_t __54__AAUIAccountRecoveryViewController__showAddCustodian__block_invoke_2(uint64_t a1)
{
  id v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_2_cold_1();
  }

  return [*(id *)(a1 + 32) _continueShowingAddCustodian];
}

uint64_t __54__AAUIAccountRecoveryViewController__showAddCustodian__block_invoke_168(uint64_t a1)
{
  id v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_39_cold_1();
  }

  return [*(id *)(a1 + 32) _displayCustodianAddNotAllowedAlert];
}

- (void)_continueShowingAddCustodian
{
  id v3 = [[AAUICustodianSetupFlowController alloc] initWithAccountManager:self->_accountManager];
  custodianSetupFlowController = self->_custodianSetupFlowController;
  self->_custodianSetupFlowController = v3;

  [(AAUICustodianSetupFlowController *)self->_custodianSetupFlowController setIsWalrusEnabled:+[AAUICDPHelper isWalrusEnabled]];
  [(AAUICustodianSetupFlowController *)self->_custodianSetupFlowController startWithoutFirstTimeSetup];
  id v5 = [(AAUICustodianSetupFlowController *)self->_custodianSetupFlowController navigationController];
  [(AAUIAccountRecoveryViewController *)self _showViewController:v5];
}

- (void)_displayCustodianAddNotAllowedAlert
{
  id v3 = [(AAUIDTOHelper *)self->_dtoHelper makeCustodianAddOpNotAllowedAlert];
  [(AAUIAccountRecoveryViewController *)self presentViewController:v3 animated:1 completion:0];
}

- (void)_displayRatchetGenericErrorAlert
{
  id v3 = [(AAUIDTOHelper *)self->_dtoHelper makeGenericRatchetFailedAlert];
  [(AAUIAccountRecoveryViewController *)self presentViewController:v3 animated:1 completion:0];
}

- (id)_recoveryKeyState
{
  return (id)[(AAAccountRecoveryManagementViewModel *)self->_viewModel recoveryKeyStatusText:self->_recoveryKeyStateIsEnabled];
}

- (void)_showRecoveryKey:(id)a3
{
  id v4 = a3;
  id v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "Show recovery key management...", buf, 2u);
  }

  uint64_t v6 = [MEMORY[0x263F29270] sharedBag];
  uint64_t v7 = [v6 urlAtKey:*MEMORY[0x263F290D0]];

  if (v7)
  {
    [(AAUIAccountRecoveryViewController *)self _startSpinnerInSpecifier:v4];
    id v8 = [MEMORY[0x263F08BD8] requestWithURL:v7];
    uint64_t v9 = [[AAUIGrandSlamRemoteUIPresenter alloc] initWithAccountManager:self->_accountManager presenter:self];
    remoteUIPresenter = self->_remoteUIPresenter;
    self->_remoteUIPresenter = v9;

    [(AAUIGrandSlamRemoteUIPresenter *)self->_remoteUIPresenter setDelegate:self];
    [(AAUIGrandSlamRemoteUIPresenter *)self->_remoteUIPresenter loadRequest:v8];
  }
  else
  {
    id v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "Unable to load Recovery Key UI. We're missing the URL from the URL bag.", v11, 2u);
    }
  }
}

- (void)_startSpinnerInSpecifier:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__AAUIAccountRecoveryViewController__startSpinnerInSpecifier___block_invoke;
  block[3] = &unk_263F92668;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __62__AAUIAccountRecoveryViewController__startSpinnerInSpecifier___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained[182] startNavigationSpinner];
  id v2 = WeakRetained[182];
  id v3 = *(void **)(a1 + 32);
  id v4 = [v3 identifier];
  [v2 startSpinnerInSpecifier:v3 forKey:v4];

  id v5 = [WeakRetained view];
  [v5 setUserInteractionEnabled:0];
}

- (void)_showViewController:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(AAUIAccountRecoveryViewController *)self presentViewController:v4 animated:1 completion:0];
  }
  else {
    [(AAUIAccountRecoveryViewController *)self showViewController:v4 sender:self];
  }
}

- (id)_appleAccount
{
  id v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  id v3 = [v2 objectForKey:*MEMORY[0x263F26D28]];

  return v3;
}

- (id)_idmsAccount
{
  idmsAccount = self->_idmsAccount;
  if (!idmsAccount)
  {
    id v4 = [MEMORY[0x263F290F0] sharedInstance];
    id v5 = [(AAUIAccountRecoveryViewController *)self _appleAccount];
    uint64_t v6 = objc_msgSend(v5, "aa_altDSID");
    id v7 = [v4 authKitAccountWithAltDSID:v6];
    id v8 = self->_idmsAccount;
    self->_idmsAccount = v7;

    idmsAccount = self->_idmsAccount;
  }
  return idmsAccount;
}

- (BOOL)_canHaveCustodian
{
  id v3 = [MEMORY[0x263F290F0] sharedInstance];
  id v4 = [(AAUIAccountRecoveryViewController *)self _idmsAccount];
  char v5 = [v3 canHaveCustodianForAccount:v4];

  return v5;
}

- (BOOL)_canBeCustodian
{
  id v3 = [MEMORY[0x263F290F0] sharedInstance];
  id v4 = [(AAUIAccountRecoveryViewController *)self _idmsAccount];
  char v5 = [v3 canBeCustodianForAccount:v4];

  return v5;
}

- (BOOL)_isEligibleForRecoveryKey
{
  id v2 = (void *)MEMORY[0x263F34328];
  id v3 = [(AAUIAccountRecoveryViewController *)self _appleAccount];
  id v4 = objc_msgSend(v3, "aa_personID");
  LOBYTE(v2) = [v2 isICDPEnabledForDSID:v4];

  return (char)v2;
}

- (void)_rkFooterLearnMoreTapped
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_209754000, a2, v5, "%@: RK footer Learn More was tapped", v6);
}

- (void)_printableSummaryLearnMoreTapped
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_209754000, a2, v5, "%@: Printable Summary footer Learn More was tapped", v6);
}

- (void)finishingRepair
{
  [(AAUIAccountRecoveryViewController *)self _beginObservingNotifications];
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __52__AAUIAccountRecoveryViewController_finishingRepair__block_invoke;
  v3[3] = &unk_263F92AB8;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x263EF83A0], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __52__AAUIAccountRecoveryViewController_finishingRepair__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _fetchAllCustodianContacts];
    id WeakRetained = v2;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idmsAccount, 0);
  objc_storeStrong((id *)&self->_dtoHelper, 0);
  objc_storeStrong((id *)&self->_authenticationController, 0);
  objc_storeStrong((id *)&self->_custodianController, 0);
  objc_storeStrong((id *)&self->_spinnerManager, 0);
  objc_storeStrong((id *)&self->_remoteUIPresenter, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_custodianSetupFlowController, 0);
  objc_storeStrong((id *)&self->_myCustodianshipOwners, 0);
  objc_storeStrong((id *)&self->_repairHelper, 0);
  objc_storeStrong((id *)&self->_myCustodiansRequestId, 0);
  objc_storeStrong((id *)&self->_contactWorkQueue, 0);
  objc_storeStrong((id *)&self->_contactsProvider, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

- (void)initWithAccountManager:highlightRowIdentifier:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_209754000, v0, v1, "Highlighting row %@", v2);
}

void __70__AAUIAccountRecoveryViewController_showReviewCustodiansModalIfNeeded__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "Custodian Review followup not present.", v2, v3, v4, v5, v6);
}

void __70__AAUIAccountRecoveryViewController_showReviewCustodiansModalIfNeeded__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "Presented Custodian Review sheet", v2, v3, v4, v5, v6);
}

- (void)reviewCustodianSheetDismissed:withUUIDs:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_209754000, v0, OS_LOG_TYPE_ERROR, "View not visible. Not repairing custodians.", v1, 2u);
}

- (void)reviewCustodianSheetDismissed:withUUIDs:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "Starting custodian repair after review sheet is dismissed.", v2, v3, v4, v5, v6);
}

- (void)reviewCustodianSheetDismissed:withUUIDs:.cold.3()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_209754000, v0, v1, "Review sheet dismissed. Should dismiss CFU: %@", v2);
}

void __77__AAUIAccountRecoveryViewController_reviewCustodianSheetDismissed_withUUIDs___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_209754000, v0, v1, "Error occurred while repairing custodians. Error: %@", v2, v3, v4, v5, v6);
}

- (void)_generateSpecifiers
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "AAUIAccountRecoveryViewController: Account is not HSA2. NOT adding Printable to specifiers.", v2, v3, v4, v5, v6);
}

- (void)_isPrintableSummaryEnabled
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "_isPrintableSummaryEnabled: Printable Summary is disabled.", v2, v3, v4, v5, v6);
}

- (void)_printAccountAccessSummary:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "Validating local passcode before showing launching printable summary flow.", v2, v3, v4, v5, v6);
}

void __64__AAUIAccountRecoveryViewController__printAccountAccessSummary___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_209754000, v0, v1, "Validated local passcode. Error: %@", v2);
}

void __63__AAUIAccountRecoveryViewController__fetchAllCustodianContacts__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_209754000, v0, v1, "Error determining recovery key state: %@ (fetch all)", v2, v3, v4, v5, v6);
}

void __60__AAUIAccountRecoveryViewController__fetchRecoveryKeyUpdate__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_209754000, v0, v1, "Error determining recovery key state: %@ (fetch recovery key)", v2, v3, v4, v5, v6);
}

void __79__AAUIAccountRecoveryViewController__syncAccountRecoveryFactorsWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_209754000, v0, v1, "Failed to perform trusted contacts data sync: %@", v2, v3, v4, v5, v6);
}

void __79__AAUIAccountRecoveryViewController__syncAccountRecoveryFactorsWithCompletion___block_invoke_101_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_209754000, v0, v1, "Failed to perform liveness check-in: %@", v2, v3, v4, v5, v6);
}

void __54__AAUIAccountRecoveryViewController__showAddCustodian__block_invoke_166_cold_1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_4();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_209754000, v1, OS_LOG_TYPE_DEBUG, "Ratchet auth returned with success: %d, error: %@,", v2, 0x12u);
}

@end