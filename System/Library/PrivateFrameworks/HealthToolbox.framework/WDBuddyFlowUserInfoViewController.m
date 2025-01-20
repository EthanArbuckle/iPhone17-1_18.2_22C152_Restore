@interface WDBuddyFlowUserInfoViewController
- (NSArray)dataEntryItems;
- (WDBuddyControllerUserInfoDelegate)delegate;
- (WDBuddyFlowUserInfo)userInfo;
- (WDBuddyFlowUserInfoViewController)initWithCoder:(id)a3;
- (WDBuddyFlowUserInfoViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (WDBuddyFlowUserInfoViewController)initWithProfile:(id)a3 isLastScreen:(BOOL)a4;
- (WDBuddyFlowUserInfoViewController)initWithStyle:(int64_t)a3;
- (id)_createTableFooterView;
- (id)_createTableHeaderView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)_configureHeaderView:(id)a3;
- (void)_loadData;
- (void)_localeDidChange:(id)a3;
- (void)_saveDataWithCompletion:(id)a3;
- (void)_setupObservers;
- (void)_updateForCurrentSizeCategory;
- (void)continueButtonTapped:(id)a3;
- (void)dataEntryItemDonePressed:(id)a3;
- (void)dataEntryItemNextPressed:(id)a3;
- (void)dataEntryItemPrevPressed:(id)a3;
- (void)dealloc;
- (void)focusItemAtIndex:(int64_t)a3;
- (void)setDataEntryItems:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setUpHeaderAndFooterViewsIfNeeded;
- (void)setUserInfo:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WDBuddyFlowUserInfoViewController

- (WDBuddyFlowUserInfoViewController)initWithProfile:(id)a3 isLastScreen:(BOOL)a4
{
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WDBuddyFlowUserInfoViewController;
  v8 = [(WDBuddyFlowUserInfoViewController *)&v17 initWithStyle:1];
  v9 = v8;
  if (v8)
  {
    p_profile = (id *)&v8->_profile;
    objc_storeStrong((id *)&v8->_profile, a3);
    v9->_isLastScreen = a4;
    uint64_t v11 = [*p_profile healthStore];
    healthStore = v9->_healthStore;
    v9->_healthStore = (HKHealthStore *)v11;

    uint64_t v13 = [*p_profile userDefaults];
    userDefaults = v9->_userDefaults;
    v9->_userDefaults = (WDUserDefaults *)v13;

    v9->_hasSetUpHeaderAndFooterViews = 0;
    baseAutomationIdentifier = v9->_baseAutomationIdentifier;
    v9->_baseAutomationIdentifier = (NSString *)@"UIA.Health.BuddyOnboarding.UserInfoScreen";

    [(WDBuddyFlowUserInfoViewController *)v9 _setupObservers];
  }

  return v9;
}

- (WDBuddyFlowUserInfoViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF4A0];
  id v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (WDBuddyFlowUserInfoViewController)initWithStyle:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WDBuddyFlowUserInfoViewController;
  return [(WDBuddyFlowUserInfoViewController *)&v4 initWithStyle:a3];
}

- (WDBuddyFlowUserInfoViewController)initWithCoder:(id)a3
{
  return [(WDBuddyFlowUserInfoViewController *)self initWithStyle:0];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)WDBuddyFlowUserInfoViewController;
  [(WDBuddyFlowUserInfoViewController *)&v4 dealloc];
}

- (void)_setupObservers
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__localeDidChange_ name:*MEMORY[0x263EFF458] object:0];
}

- (NSArray)dataEntryItems
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  dataEntryItems = self->_dataEntryItems;
  if (!dataEntryItems)
  {
    dataEntryItems = self->_userInfo;
    if (dataEntryItems)
    {
      objc_super v4 = [dataEntryItems defaultDataEntryItems];
      v5 = self->_dataEntryItems;
      self->_dataEntryItems = v4;

      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      uint64_t v6 = self->_dataEntryItems;
      uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v13;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v13 != v9) {
              objc_enumerationMutation(v6);
            }
            objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "setToolbarDelegate:", self, (void)v12);
          }
          uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v8);
      }

      dataEntryItems = self->_dataEntryItems;
    }
  }

  return (NSArray *)dataEntryItems;
}

- (void)continueButtonTapped:(id)a3
{
  id v4 = a3;
  v5 = [(WDBuddyFlowUserInfoViewController *)self view];
  [v5 endEditing:1];

  footerView = self->_footerView;
  id v7 = objc_initWeak(&location, footerView);
  [(WDBuddyFlowContinueFooterView *)footerView setWaitingState];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__WDBuddyFlowUserInfoViewController_continueButtonTapped___block_invoke;
  v8[3] = &unk_26458EF08;
  v8[4] = self;
  objc_copyWeak(&v9, &location);
  [(WDBuddyFlowUserInfoViewController *)self _saveDataWithCompletion:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __58__WDBuddyFlowUserInfoViewController_continueButtonTapped___block_invoke(uint64_t a1)
{
  v1[0] = MEMORY[0x263EF8330];
  v1[1] = 3221225472;
  v1[2] = __58__WDBuddyFlowUserInfoViewController_continueButtonTapped___block_invoke_2;
  v1[3] = &unk_26458EF08;
  v1[4] = *(void *)(a1 + 32);
  objc_copyWeak(&v2, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x263EF83A0], v1);
  objc_destroyWeak(&v2);
}

void __58__WDBuddyFlowUserInfoViewController_continueButtonTapped___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __58__WDBuddyFlowUserInfoViewController_continueButtonTapped___block_invoke_3;
  v3[3] = &unk_26458DC70;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  [v2 didTapContinueButtonWithCompletion:v3];

  objc_destroyWeak(&v4);
}

void __58__WDBuddyFlowUserInfoViewController_continueButtonTapped___block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__WDBuddyFlowUserInfoViewController_continueButtonTapped___block_invoke_4;
  block[3] = &unk_26458DC70;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void __58__WDBuddyFlowUserInfoViewController_continueButtonTapped___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained resetWaitingState];
}

- (void)viewDidLoad
{
  v13[1] = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)WDBuddyFlowUserInfoViewController;
  [(HKTableViewController *)&v12 viewDidLoad];
  id v3 = [MEMORY[0x263F1C550] systemBackgroundColor];
  id v4 = [(WDBuddyFlowUserInfoViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = +[WDBuddyFlowUserInfo buddyFlowUserInfoWithDemographicsInformation:0];
  userInfo = self->_userInfo;
  self->_userInfo = v5;

  id v7 = [(WDBuddyFlowUserInfoViewController *)self tableView];
  [v7 setKeyboardDismissMode:1];

  [(WDBuddyFlowUserInfoViewController *)self _loadData];
  [(WDBuddyFlowUserInfoViewController *)self _updateForCurrentSizeCategory];
  baseAutomationIdentifier = self->_baseAutomationIdentifier;
  id v9 = [(WDBuddyFlowUserInfoViewController *)self view];
  [v9 setAccessibilityIdentifier:baseAutomationIdentifier];

  v13[0] = objc_opt_class();
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  id v11 = (id)[(WDBuddyFlowUserInfoViewController *)self registerForTraitChanges:v10 withTarget:self action:sel__updateForCurrentSizeCategory];
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WDBuddyFlowUserInfoViewController;
  [(WDBuddyFlowUserInfoViewController *)&v10 viewWillAppear:a3];
  [(WDBuddyFlowUserInfoViewController *)self setUpHeaderAndFooterViewsIfNeeded];
  id v4 = [(WDBuddyFlowUserInfoViewController *)self navigationController];
  [v4 setNavigationBarHidden:0 animated:0];

  v5 = [(WDBuddyFlowUserInfoViewController *)self navigationController];
  uint64_t v6 = [v5 navigationBar];
  [v6 _setHidesShadow:1];

  id v7 = [(WDBuddyFlowUserInfoViewController *)self navigationController];
  uint64_t v8 = [v7 navigationBar];
  id v9 = [MEMORY[0x263F1C550] systemBackgroundColor];
  [v8 setBarTintColor:v9];
}

- (void)setUpHeaderAndFooterViewsIfNeeded
{
  if (!self->_hasSetUpHeaderAndFooterViews)
  {
    id v3 = [(WDBuddyFlowUserInfoViewController *)self _createTableHeaderView];
    headerView = self->_headerView;
    self->_headerView = v3;

    v5 = [(WDBuddyFlowUserInfoViewController *)self _createTableFooterView];
    footerView = self->_footerView;
    self->_footerView = v5;

    id v7 = self->_headerView;
    uint64_t v8 = [(WDBuddyFlowUserInfoViewController *)self tableView];
    [v8 setTableHeaderView:v7];

    id v9 = self->_footerView;
    objc_super v10 = [(WDBuddyFlowUserInfoViewController *)self tableView];
    [v10 setTableFooterView:v9];

    self->_hasSetUpHeaderAndFooterViews = 1;
  }
}

- (void)_updateForCurrentSizeCategory
{
  objc_msgSend(MEMORY[0x263F1C658], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x263F1D260], 2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v9 _scaledValueForValue:60.0];
  double v4 = v3;
  if (HKUIApplicationIsUsingAccessibilityContentSizeCategory())
  {
    double v5 = *MEMORY[0x263F1D600];
    uint64_t v6 = [(WDBuddyFlowUserInfoViewController *)self tableView];
    [v6 setRowHeight:v5];

    id v7 = [(WDBuddyFlowUserInfoViewController *)self tableView];
    [v7 setEstimatedRowHeight:v4];
  }
  else
  {
    id v7 = [(WDBuddyFlowUserInfoViewController *)self tableView];
    [v7 setRowHeight:v4];
  }

  [(WDBuddyFlowUserInfoViewController *)self _configureHeaderView:self->_headerView];
  uint64_t v8 = [(WDBuddyFlowUserInfoViewController *)self tableView];
  [v8 reloadData];
}

- (void)_loadData
{
  healthStore = self->_healthStore;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __46__WDBuddyFlowUserInfoViewController__loadData__block_invoke;
  v3[3] = &unk_26458EF30;
  void v3[4] = self;
  [(HKHealthStore *)healthStore hk_fetchExistingDemographicInformationWithCompletion:v3];
}

void __46__WDBuddyFlowUserInfoViewController__loadData__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__WDBuddyFlowUserInfoViewController__loadData__block_invoke_2;
  v5[3] = &unk_26458DB58;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

void __46__WDBuddyFlowUserInfoViewController__loadData__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = +[WDBuddyFlowUserInfo buddyFlowUserInfoWithDemographicsInformation:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 1112);
  *(void *)(v3 + 1112) = v2;

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 1104);
  *(void *)(v5 + 1104) = 0;

  id v7 = [*(id *)(a1 + 32) tableView];
  [v7 reloadData];
}

- (void)_saveDataWithCompletion:(id)a3
{
  id v4 = a3;
  userInfo = self->_userInfo;
  healthStore = self->_healthStore;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__WDBuddyFlowUserInfoViewController__saveDataWithCompletion___block_invoke;
  v10[3] = &unk_26458DC98;
  v10[4] = self;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__WDBuddyFlowUserInfoViewController__saveDataWithCompletion___block_invoke_2;
  v8[3] = &unk_26458E0B8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(WDBuddyFlowUserInfo *)userInfo saveChangesToHealthStore:healthStore andSaveNameCompletion:v10 andOverallCompletion:v8];
}

void __61__WDBuddyFlowUserInfoViewController__saveDataWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 didSaveFirstLastNameFor:*(void *)(*(void *)(a1 + 32) + 1048)];
}

uint64_t __61__WDBuddyFlowUserInfoViewController__saveDataWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v2 = *MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2210D2000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completed saving changes to health store.", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_createTableHeaderView
{
  uint64_t v3 = [(WDBuddyFlowUserInfoViewController *)self view];
  [v3 frame];
  double Height = CGRectGetHeight(v17);
  int v5 = [(WDBuddyFlowUserInfoViewController *)self view];
  [v5 frame];
  double v7 = (Height + v6) * 0.33 + -64.0;

  if (v7 < 150.0) {
    double v7 = 150.0;
  }
  uint64_t v8 = [(WDBuddyFlowUserInfoViewController *)self tableView];
  [v8 frame];
  double Width = CGRectGetWidth(v18);

  objc_super v10 = (void *)[objc_alloc(MEMORY[0x263F46A08]) initWithTopInset:self parentViewController:v7];
  id v11 = WDBundle();
  objc_super v12 = [v11 localizedStringForKey:@"HEALTH_DETAILS" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  [v10 setTitleText:v12];

  long long v13 = [v10 widthAnchor];
  long long v14 = [v13 constraintEqualToConstant:Width];
  [v14 setActive:1];

  [(WDBuddyFlowUserInfoViewController *)self _configureHeaderView:v10];

  return v10;
}

- (void)_configureHeaderView:(id)a3
{
  id v12 = a3;
  id v4 = WDBundle();
  int v5 = [v4 localizedStringForKey:@"HEALTH_DETAILS_DESCRIPTION" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  [v12 setBodyText:v5];

  [v12 setBodyTextAlignment:0];
  double v6 = [(WDBuddyFlowUserInfoViewController *)self tableView];
  [v6 frame];
  objc_msgSend(v12, "systemLayoutSizeFittingSize:", v7, *(double *)(MEMORY[0x263F1D490] + 8));
  double v9 = v8;
  double v11 = v10;

  objc_msgSend(v12, "setFrame:", 0.0, 0.0, v9, v11);
  [v12 setBodyTextAlignment:1];
}

- (id)_createTableFooterView
{
  v11[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(WDBuddyFlowUserInfoViewController *)self tableView];
  [v3 frame];
  double Width = CGRectGetWidth(v13);

  int v5 = [[WDBuddyFlowContinueFooterView alloc] initWithTarget:self action:sel_continueButtonTapped_ bottomInset:self->_isLastScreen width:40.0 isLastScreen:Width];
  double v6 = [(WDBuddyFlowContinueFooterView *)v5 continueButton];
  [v6 addTarget:self action:sel_continueButtonTapped_ forControlEvents:64];

  double v7 = [(WDBuddyFlowContinueFooterView *)v5 continueButton];
  v11[0] = self->_baseAutomationIdentifier;
  v11[1] = @"ContinueButton";
  double v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  double v9 = HKUIJoinStringsForAutomationIdentifier();
  [v7 setAccessibilityIdentifier:v9];

  return v5;
}

- (void)_localeDidChange:(id)a3
{
}

- (void)dataEntryItemDonePressed:(id)a3
{
  id v3 = [(WDBuddyFlowUserInfoViewController *)self view];
  [v3 endEditing:0];
}

- (void)dataEntryItemPrevPressed:(id)a3
{
  uint64_t v4 = [(NSArray *)self->_dataEntryItems indexOfObject:a3];
  if (v4 <= 0) {
    uint64_t v4 = [(NSArray *)self->_dataEntryItems count];
  }

  [(WDBuddyFlowUserInfoViewController *)self focusItemAtIndex:v4 - 1];
}

- (void)dataEntryItemNextPressed:(id)a3
{
  NSUInteger v4 = [(NSArray *)self->_dataEntryItems indexOfObject:a3];
  if (v4 + 1 < [(NSArray *)self->_dataEntryItems count]) {
    NSUInteger v5 = v4 + 1;
  }
  else {
    NSUInteger v5 = 0;
  }

  [(WDBuddyFlowUserInfoViewController *)self focusItemAtIndex:v5];
}

- (void)focusItemAtIndex:(int64_t)a3
{
  -[NSArray objectAtIndexedSubscript:](self->_dataEntryItems, "objectAtIndexedSubscript:");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 beginEditing];
  NSUInteger v5 = [MEMORY[0x263F088C8] indexPathForRow:a3 inSection:0];
  double v6 = [(WDBuddyFlowUserInfoViewController *)self tableView];
  [v6 scrollToRowAtIndexPath:v5 atScrollPosition:3 animated:1];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  NSUInteger v4 = [(WDBuddyFlowUserInfoViewController *)self dataEntryItems];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v15[2] = *MEMORY[0x263EF8340];
  id v5 = a4;
  double v6 = [(WDBuddyFlowUserInfoViewController *)self dataEntryItems];
  uint64_t v7 = [v5 row];

  double v8 = [v6 objectAtIndex:v7];

  double v9 = [v8 cell];
  v15[0] = self->_baseAutomationIdentifier;
  double v10 = [v8 accessibilityIdentifier];
  v15[1] = v10;
  double v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  id v12 = HKUIJoinStringsForAutomationIdentifier();
  [v9 setAccessibilityIdentifier:v12];

  CGRect v13 = [v8 cell];

  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  uint64_t v7 = [(WDBuddyFlowUserInfoViewController *)self dataEntryItems];
  uint64_t v8 = [v6 row];

  id v9 = [v7 objectAtIndex:v8];

  [v9 beginEditing];
}

- (WDBuddyControllerUserInfoDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WDBuddyControllerUserInfoDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setDataEntryItems:(id)a3
{
}

- (WDBuddyFlowUserInfo)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_dataEntryItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_baseAutomationIdentifier, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);

  objc_storeStrong((id *)&self->_profile, 0);
}

@end