@interface HKOrganDonationRegisterViewController
- (BOOL)_registrantIsUnderAge;
- (HKOrganDonationRegisterViewController)init;
- (HKOrganDonationRegistrant)registrant;
- (NSArray)dataEntryItems;
- (NSString)completionButtonTitle;
- (UIBarButtonItem)nextButton;
- (_HKMedicalIDData)medicalIDData;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_createTableFooterView;
- (id)_createTableHeaderView;
- (id)registrationCompletionHandler;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)_handleAppWillEnterForegroundNotification:(id)a3;
- (void)_handleResponse:(id)a3 status:(int64_t)a4;
- (void)_headerTapped:(id)a3;
- (void)_loadRegistrantInformationIfAvailableAndSetupRegisterView;
- (void)_reloadRegistrantInformationFromServer;
- (void)_setupRegisterViewWithDefaultDemographicsInformation;
- (void)_setupRegisterViewWithRegistrant:(id)a3;
- (void)_setupRegisterViewWithRegistrant:(id)a3 demographicsInformation:(id)a4;
- (void)_toggleLoadingStatusIsLoading:(BOOL)a3;
- (void)_toggleNextButtonEnabledState;
- (void)cancelButtonTapped:(id)a3;
- (void)dataEntryItemDonePressed:(id)a3;
- (void)dataEntryItemNextPressed:(id)a3;
- (void)dataEntryItemPrevPressed:(id)a3;
- (void)dealloc;
- (void)focusItemAtIndex:(int64_t)a3;
- (void)nextButtonTapped:(id)a3;
- (void)organDonationConnectionManagerDidRemoveCredential:(id)a3;
- (void)organDonationConnectionManagerDidStoreCredential:(id)a3;
- (void)setCompletionButtonTitle:(id)a3;
- (void)setDataEntryItems:(id)a3;
- (void)setMedicalIDData:(id)a3;
- (void)setNextButton:(id)a3;
- (void)setRegistrant:(id)a3;
- (void)setRegistrationCompletionHandler:(id)a3;
- (void)submitOrganDonationFlowImpressionEvent:(int)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateButtonTapped:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HKOrganDonationRegisterViewController

- (HKOrganDonationRegisterViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)HKOrganDonationRegisterViewController;
  v2 = [(HKOrganDonationRegisterViewController *)&v8 initWithStyle:1];
  if (v2)
  {
    v3 = (HKHealthStore *)objc_alloc_init(MEMORY[0x1E4F2B0B8]);
    healthStore = v2->_healthStore;
    v2->_healthStore = v3;

    v5 = [[HKOrganDonationConnectionManager alloc] initWithHealthStore:v2->_healthStore];
    connectionManager = v2->_connectionManager;
    v2->_connectionManager = v5;

    [(HKOrganDonationConnectionManager *)v2->_connectionManager setDelegate:v2];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(HKOrganDonationConnectionManager *)self->_connectionManager cleanUp];
  v4.receiver = self;
  v4.super_class = (Class)HKOrganDonationRegisterViewController;
  [(HKOrganDonationRegisterViewController *)&v4 dealloc];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)viewDidLoad
{
  v24.receiver = self;
  v24.super_class = (Class)HKOrganDonationRegisterViewController;
  [(HKOrganDonationRegisterViewController *)&v24 viewDidLoad];
  objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", *MEMORY[0x1E4FB28C8]);
  v3 = (UIFont *)objc_claimAutoreleasedReturnValue();
  bodyFont = self->_bodyFont;
  self->_bodyFont = v3;

  v5 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
  loadingIndicator = self->_loadingIndicator;
  self->_loadingIndicator = v5;

  [(UIActivityIndicatorView *)self->_loadingIndicator setHidesWhenStopped:1];
  v7 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:self->_loadingIndicator];
  loadingIndicatorBarButtonItem = self->_loadingIndicatorBarButtonItem;
  self->_loadingIndicatorBarButtonItem = v7;

  id v9 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v11 = [v10 localizedStringForKey:@"OD_UPDATE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v12 = (UIBarButtonItem *)[v9 initWithTitle:v11 style:0 target:self action:sel_updateButtonTapped_];
  updateBarButtonItem = self->_updateBarButtonItem;
  self->_updateBarButtonItem = v12;

  [(UIBarButtonItem *)self->_updateBarButtonItem setEnabled:0];
  v14 = [(HKOrganDonationRegisterViewController *)self navigationController];
  v15 = [v14 viewControllers];
  v16 = [v15 firstObject];

  if (v16 == self)
  {
    v17 = [(HKOrganDonationRegisterViewController *)self navigationItem];
    v18 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelButtonTapped_];
    [v17 setLeftBarButtonItem:v18];
  }
  v19 = [(HKOrganDonationRegisterViewController *)self tableView];
  [v19 setKeyboardDismissMode:2];

  v20 = [(HKOrganDonationRegisterViewController *)self tableView];
  [v20 registerClass:objc_opt_class() forCellReuseIdentifier:@"Cell"];

  v21 = [(HKOrganDonationRegisterViewController *)self tableView];
  v22 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v21 setBackgroundColor:v22];

  [(HKOrganDonationRegisterViewController *)self setModalInPresentation:1];
  [(HKOrganDonationRegisterViewController *)self _loadRegistrantInformationIfAvailableAndSetupRegisterView];
  v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v23 addObserver:self selector:sel__handleAppWillEnterForegroundNotification_ name:*MEMORY[0x1E4FB2730] object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HKOrganDonationRegisterViewController;
  [(HKOrganDonationRegisterViewController *)&v9 viewWillAppear:a3];
  objc_super v4 = [(HKOrganDonationRegisterViewController *)self navigationController];
  v5 = [v4 navigationBar];
  [v5 _setHidesShadow:1];

  v6 = [(HKOrganDonationRegisterViewController *)self navigationController];
  v7 = [v6 navigationBar];
  objc_super v8 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v7 setBarTintColor:v8];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKOrganDonationRegisterViewController;
  [(HKOrganDonationRegisterViewController *)&v5 viewWillDisappear:a3];
  objc_super v4 = [(HKOrganDonationRegisterViewController *)self view];
  [v4 endEditing:0];
}

- (id)_createTableHeaderView
{
  v3 = [(HKOrganDonationRegisterViewController *)self view];
  UIRoundToViewScale();
  double v5 = v4;

  v6 = [(HKOrganDonationRegisterViewController *)self tableView];
  [v6 frame];
  double Width = CGRectGetWidth(v23);

  objc_super v8 = [[HKTitledLogoBuddyHeaderView alloc] initWithTopInset:0 linkButtonTitle:v5];
  objc_super v9 = [(HKTitledLogoBuddyHeaderView *)v8 widthAnchor];
  v10 = [v9 constraintEqualToConstant:Width];
  [v10 setActive:1];

  v11 = (void *)MEMORY[0x1E4FB1818];
  v12 = HKHealthUIFrameworkBundle();
  v13 = [v11 imageNamed:@"donate_life_logo" inBundle:v12];
  [(HKTitledLogoBuddyHeaderView *)v8 setLogoImage:v13];

  LODWORD(v13) = +[HKOrganDonationConnectionManager hasStoredRegistrant];
  v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v15 = v14;
  if (v13) {
    v16 = @"OD_CHANGE_DELETE";
  }
  else {
    v16 = @"OD_REGISTER_MY_INFO";
  }
  v17 = [v14 localizedStringForKey:v16 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [(HKTitledBuddyHeaderView *)v8 setTitleText:v17];

  if (!self->_isUpdate)
  {
    v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v19 = [v18 localizedStringForKey:@"OD_PERSONAL_INFO_BODY" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    [(HKTitledBuddyHeaderView *)v8 setBodyText:v19];
  }
  [(HKTitledLogoBuddyHeaderView *)v8 layoutIfNeeded];
  v20 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  [(HKTitledLogoBuddyHeaderView *)v8 setBackgroundColor:v20];

  return v8;
}

- (id)_createTableFooterView
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  double v4 = [(HKOrganDonationRegisterViewController *)self view];
  [v4 frame];
  double Width = CGRectGetWidth(v20);

  v6 = (void *)MEMORY[0x1E4FB14D0];
  v7 = HKHealthKeyColor();
  objc_super v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  objc_super v9 = [v8 localizedStringForKey:@"OD_REGISTER_CONTINUE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  objc_msgSend(v6, "hk_multiLineRoundRectButtonTintedWithColor:title:target:action:", v7, v9, self, sel_nextButtonTapped_);
  v10 = (UIButton *)objc_claimAutoreleasedReturnValue();
  continueButton = self->_continueButton;
  self->_continueButton = v10;

  [v3 addSubview:self->_continueButton];
  id v12 = (id)objc_msgSend(v3, "hk_addEqualsConstraintWithItem:attribute:relatedTo:constant:", self->_continueButton, 9, v3, 0.0);
  id v13 = (id)objc_msgSend(v3, "hk_addEqualsConstraintWithItem:attribute:relatedTo:attribute:constant:", self->_continueButton, 3, v3, 3, 32.0);
  id v14 = (id)objc_msgSend(v3, "hk_addEqualsConstraintWithItem:attribute:relatedTo:attribute:constant:", self->_continueButton, 4, v3, 4, -24.0);
  objc_msgSend(v3, "systemLayoutSizeFittingSize:", Width, 1.79769313e308);
  objc_msgSend(v3, "setFrame:", 0.0, 0.0, v15, v16);
  v17 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  [v3 setBackgroundColor:v17];

  return v3;
}

- (void)_setupRegisterViewWithRegistrant:(id)a3
{
}

- (void)_setupRegisterViewWithRegistrant:(id)a3 demographicsInformation:(id)a4
{
  v6 = (HKOrganDonationRegistrant *)a3;
  self->_isUpdate = 1;
  if (v6)
  {
    v7 = v6;
    objc_super v8 = [(HKOrganDonationRegisterViewController *)self tableView];
    [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  }
  else
  {
    self->_isUpdate = 0;
    v7 = +[HKOrganDonationRegistrant organDonationRegistrantWithDemographicsInformation:a4];
    objc_super v8 = [(HKOrganDonationRegisterViewController *)self tableView];
    [MEMORY[0x1E4FB1618] systemBackgroundColor];
  objc_super v9 = };
  [v8 setBackgroundColor:v9];

  dataEntryItems = self->_dataEntryItems;
  self->_dataEntryItems = 0;

  registrant = self->_registrant;
  self->_registrant = v7;
  id v12 = v7;

  [(HKOrganDonationRegistrant *)self->_registrant setDelegate:self];
  [(HKOrganDonationRegisterViewController *)self _toggleLoadingStatusIsLoading:0];
  id v13 = [(HKOrganDonationRegisterViewController *)self _createTableHeaderView];
  headerView = self->_headerView;
  self->_headerView = v13;

  double v15 = [(HKOrganDonationRegisterViewController *)self _createTableFooterView];
  footerView = self->_footerView;
  self->_footerView = v15;

  [(HKOrganDonationRegisterViewController *)self _toggleNextButtonEnabledState];
  id v17 = [(HKOrganDonationRegisterViewController *)self tableView];
  [v17 reloadData];
}

- (void)_toggleLoadingStatusIsLoading:(BOOL)a3
{
  self->_isLoading = a3;
  if (a3)
  {
    double v4 = [(HKOrganDonationRegisterViewController *)self navigationItem];
    [v4 setRightBarButtonItem:self->_loadingIndicatorBarButtonItem];

    [(UIActivityIndicatorView *)self->_loadingIndicator startAnimating];
  }
  else
  {
    if (+[HKOrganDonationConnectionManager hasStoredRegistrant])
    {
      double v5 = [(HKOrganDonationRegisterViewController *)self navigationItem];
      [v5 setRightBarButtonItem:self->_updateBarButtonItem];
    }
    [(UIActivityIndicatorView *)self->_loadingIndicator stopAnimating];
  }
  [(HKOrganDonationRegisterViewController *)self _toggleNextButtonEnabledState];
}

- (void)_loadRegistrantInformationIfAvailableAndSetupRegisterView
{
  [(HKOrganDonationRegisterViewController *)self _toggleLoadingStatusIsLoading:1];
  if (+[HKOrganDonationConnectionManager hasStoredRegistrant])
  {
    [(HKOrganDonationRegisterViewController *)self _reloadRegistrantInformationFromServer];
  }
  else
  {
    [(HKOrganDonationRegisterViewController *)self _setupRegisterViewWithDefaultDemographicsInformation];
  }
}

- (void)_handleResponse:(id)a3 status:(int64_t)a4
{
  id v6 = a3;
  [(HKOrganDonationRegisterViewController *)self _toggleLoadingStatusIsLoading:0];
  switch(a4)
  {
    case 0:
      id v12 = +[HKOrganDonationRegistrant organDonationRegistrantWithJSONDictionary:v6];
      [(HKOrganDonationRegisterViewController *)self _setupRegisterViewWithRegistrant:v12];
      goto LABEL_9;
    case 1:
    case 2:
      v7 = (void *)MEMORY[0x1E4FB1418];
      objc_super v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      objc_super v9 = [v8 localizedStringForKey:@"OD_INVALID_TOKEN_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v11 = [v10 localizedStringForKey:@"OD_INVALID_TOKEN_BODY" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      id v12 = [v7 alertControllerWithTitle:v9 message:v11 preferredStyle:1];

      id v13 = (void *)MEMORY[0x1E4FB1410];
      id v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      double v15 = [v14 localizedStringForKey:@"OD_ALERT_OK" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      double v16 = [v13 actionWithTitle:v15 style:0 handler:0];
      [v12 addAction:v16];

      [(HKOrganDonationRegisterViewController *)self _setupRegisterViewWithDefaultDemographicsInformation];
      if (!v12) {
        break;
      }
      goto LABEL_8;
    case 3:
      id v17 = (void *)MEMORY[0x1E4FB1418];
      v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v19 = [v18 localizedStringForKey:@"OD_NO_NETWORK_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      CGRect v20 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v21 = [v20 localizedStringForKey:@"OD_NO_NETWORK_BODY" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      id v12 = [v17 alertControllerWithTitle:v19 message:v21 preferredStyle:1];

      objc_initWeak(&location, self);
      v22 = (void *)MEMORY[0x1E4FB1410];
      CGRect v23 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      objc_super v24 = [v23 localizedStringForKey:@"OD_ALERT_OK" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __64__HKOrganDonationRegisterViewController__handleResponse_status___block_invoke;
      v35[3] = &unk_1E6D54980;
      v25 = &v36;
      objc_copyWeak(&v36, &location);
      v26 = [v22 actionWithTitle:v24 style:0 handler:v35];
      [v12 addAction:v26];
      goto LABEL_7;
    case 4:
      v27 = (void *)MEMORY[0x1E4FB1418];
      v28 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v29 = [v28 localizedStringForKey:@"OD_GENERIC_FAILURE_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v30 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v31 = [v30 localizedStringForKey:@"OD_GENERIC_FAILURE_BODY" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      id v12 = [v27 alertControllerWithTitle:v29 message:v31 preferredStyle:1];

      objc_initWeak(&location, self);
      v32 = (void *)MEMORY[0x1E4FB1410];
      CGRect v23 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      objc_super v24 = [v23 localizedStringForKey:@"OD_ALERT_OK" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __64__HKOrganDonationRegisterViewController__handleResponse_status___block_invoke_2;
      v33[3] = &unk_1E6D54980;
      v25 = &v34;
      objc_copyWeak(&v34, &location);
      v26 = [v32 actionWithTitle:v24 style:0 handler:v33];
      [v12 addAction:v26];
LABEL_7:

      objc_destroyWeak(v25);
      objc_destroyWeak(&location);
      if (v12)
      {
LABEL_8:
        [(HKOrganDonationRegisterViewController *)self presentViewController:v12 animated:1 completion:0];
LABEL_9:
      }
      break;
    default:
      break;
  }
}

void __64__HKOrganDonationRegisterViewController__handleResponse_status___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained dismissViewControllerAnimated:1 completion:0];
    id WeakRetained = v2;
  }
}

void __64__HKOrganDonationRegisterViewController__handleResponse_status___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained dismissViewControllerAnimated:1 completion:0];
    id WeakRetained = v2;
  }
}

- (void)_setupRegisterViewWithDefaultDemographicsInformation
{
  healthStore = self->_healthStore;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __93__HKOrganDonationRegisterViewController__setupRegisterViewWithDefaultDemographicsInformation__block_invoke;
  v3[3] = &unk_1E6D549A8;
  v3[4] = self;
  [(HKHealthStore *)healthStore hk_fetchExistingDemographicInformationWithCompletion:v3];
}

uint64_t __93__HKOrganDonationRegisterViewController__setupRegisterViewWithDefaultDemographicsInformation__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _setupRegisterViewWithRegistrant:0 demographicsInformation:a2];
}

- (NSArray)dataEntryItems
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dataEntryItems = self->_dataEntryItems;
  if (!dataEntryItems)
  {
    dataEntryItems = self->_registrant;
    if (dataEntryItems)
    {
      double v4 = [dataEntryItems dataEntryItemsValidOnly:0];
      double v5 = self->_dataEntryItems;
      self->_dataEntryItems = v4;

      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v6 = self->_dataEntryItems;
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

- (void)_toggleNextButtonEnabledState
{
  if (self->_isUpdate)
  {
    updateBarButtonItem = self->_updateBarButtonItem;
    BOOL v4 = [(HKOrganDonationRegistrant *)self->_registrant hasEdits]
      && [(HKOrganDonationRegistrant *)self->_registrant isRegistrantValid]
      && !self->_isLoading;
    [(UIBarButtonItem *)updateBarButtonItem setEnabled:v4];
  }
  else
  {
    BOOL v5 = ([(HKOrganDonationRegisterViewController *)self _registrantIsUnderAge]
       || [(HKOrganDonationRegistrant *)self->_registrant isRegistrantValid])
      && !self->_isLoading;
    [(UIButton *)self->_continueButton setEnabled:v5];
    continueButton = self->_continueButton;
    if (v5) {
      HKHealthKeyColor();
    }
    else {
      objc_msgSend(MEMORY[0x1E4FB1618], "hk_appInteractionDisabledColor");
    }
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [(UIButton *)continueButton setBackgroundColor:v7];
  }
}

- (BOOL)_registrantIsUnderAge
{
  id v2 = [(HKOrganDonationRegistrant *)self->_registrant age];
  BOOL v3 = [v2 compare:&unk_1F3C21FA0] == -1;

  return v3;
}

- (void)_headerTapped:(id)a3
{
}

- (void)_reloadRegistrantInformationFromServer
{
  objc_initWeak(&location, self);
  connectionManager = self->_connectionManager;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __79__HKOrganDonationRegisterViewController__reloadRegistrantInformationFromServer__block_invoke;
  v4[3] = &unk_1E6D549D0;
  objc_copyWeak(&v5, &location);
  [(HKOrganDonationConnectionManager *)connectionManager reloadRegistrantWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __79__HKOrganDonationRegisterViewController__reloadRegistrantInformationFromServer__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _handleResponse:v7 status:a3];
  }
}

- (void)_handleAppWillEnterForegroundNotification:(id)a3
{
  if (+[HKOrganDonationConnectionManager hasStoredRegistrant])
  {
    [(HKOrganDonationRegisterViewController *)self _toggleLoadingStatusIsLoading:1];
    [(HKOrganDonationRegisterViewController *)self _reloadRegistrantInformationFromServer];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKOrganDonationRegisterViewController;
  [(HKOrganDonationRegisterViewController *)&v12 traitCollectionDidChange:v4];
  if (v4)
  {
    id v5 = [(HKOrganDonationRegisterViewController *)self traitCollection];
    id v6 = [v5 preferredContentSizeCategory];
    id v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", *MEMORY[0x1E4FB28C8]);
      uint64_t v9 = (UIFont *)objc_claimAutoreleasedReturnValue();
      bodyFont = self->_bodyFont;
      self->_bodyFont = v9;

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __66__HKOrganDonationRegisterViewController_traitCollectionDidChange___block_invoke;
      block[3] = &unk_1E6D50ED8;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

void __66__HKOrganDonationRegisterViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tableView];
  [v1 reloadData];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  int64_t v3 = 3;
  if (self->_isLoading) {
    int64_t v3 = 0;
  }
  if (self->_isUpdate) {
    return v3;
  }
  else {
    return !self->_isLoading;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    return 1;
  }
  id v5 = [(HKOrganDonationRegisterViewController *)self dataEntryItems];
  int64_t v6 = [v5 count];

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 section];
  if (v8 == 2)
  {
    v11 = [v6 dequeueReusableCellWithIdentifier:@"Cell"];
    [v11 setAccessoryType:1];
    v10 = [v11 textLabel];
    objc_super v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    long long v13 = v12;
    long long v14 = @"OD_REMOVE_FROM_REGISTRY";
  }
  else
  {
    if (v8 != 1)
    {
      if (v8)
      {
        double v16 = (objc_class *)objc_opt_class();
        v10 = NSStringFromClass(v16);
        HKErrorTableViewCell(v10);
      }
      else
      {
        uint64_t v9 = [(HKOrganDonationRegisterViewController *)self dataEntryItems];
        v10 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v7, "row"));

        [v10 cell];
      v11 = };
      goto LABEL_10;
    }
    v11 = [v6 dequeueReusableCellWithIdentifier:@"Cell"];
    [v11 setAccessoryType:0];
    v10 = [v11 textLabel];
    objc_super v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    long long v13 = v12;
    long long v14 = @"OD_EDIT_PREFERENCE";
  }
  long long v15 = [v12 localizedStringForKey:v14 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [v10 setText:v15];

LABEL_10:
  return v11;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  BOOL isUpdate = self->_isUpdate;
  bodyFont = self->_bodyFont;
  double v6 = 44.0;
  if (!isUpdate) {
    double v6 = 60.0;
  }
  -[UIFont _scaledValueForValue:](bodyFont, "_scaledValueForValue:", a3, a4, v6);
  return result;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  [v16 deselectRowAtIndexPath:v6 animated:1];
  uint64_t v7 = [v6 section];
  if (v7 == 2)
  {
    v10 = [HKOrganDonationConfirmDeleteViewController alloc];
    connectionManager = self->_connectionManager;
    objc_super v12 = [(HKOrganDonationRegisterViewController *)self medicalIDData];
    uint64_t v9 = [(HKOrganDonationConfirmDeleteViewController *)v10 initWithConnectionManager:connectionManager medicalIDData:v12];

    long long v13 = [(HKOrganDonationRegisterViewController *)self registrationCompletionHandler];
    [(HKOrganDonationBaseViewController *)v9 setRegistrationCompletionHandler:v13];

    long long v14 = [(HKOrganDonationRegisterViewController *)self completionButtonTitle];
    [(HKOrganDonationBaseViewController *)v9 setCompletionButtonTitle:v14];

    long long v15 = [(HKOrganDonationRegisterViewController *)self navigationController];
    [v15 pushViewController:v9 animated:1];

LABEL_6:
    goto LABEL_8;
  }
  if (v7 != 1)
  {
    if (v7) {
      goto LABEL_8;
    }
    [v16 deselectRowAtIndexPath:v6 animated:1];
    uint64_t v8 = [(HKOrganDonationRegisterViewController *)self dataEntryItems];
    objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "row"));
    uint64_t v9 = (HKOrganDonationConfirmDeleteViewController *)objc_claimAutoreleasedReturnValue();

    [(HKOrganDonationConfirmDeleteViewController *)v9 beginEditing];
    goto LABEL_6;
  }
  [(HKOrganDonationConnectionManager *)self->_connectionManager openRegisterMeSiteInSafariIfAuthenticated];
LABEL_8:
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  if (a4) {
    return 0.0;
  }
  [(UIView *)self->_headerView frame];
  return CGRectGetHeight(*(CGRect *)&v7);
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if (a4)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = self->_headerView;
  }
  return v5;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  if (self->_isUpdate) {
    return 0.0;
  }
  [(UIView *)self->_footerView frame];
  return CGRectGetHeight(*(CGRect *)&v5);
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  if (self->_isUpdate) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = self->_footerView;
  }
  return v4;
}

- (void)dataEntryItemDonePressed:(id)a3
{
  id v3 = [(HKOrganDonationRegisterViewController *)self view];
  [v3 endEditing:0];
}

- (void)dataEntryItemPrevPressed:(id)a3
{
  uint64_t v4 = [(NSArray *)self->_dataEntryItems indexOfObject:a3];
  if (v4 <= 0) {
    uint64_t v4 = [(NSArray *)self->_dataEntryItems count];
  }
  [(HKOrganDonationRegisterViewController *)self focusItemAtIndex:v4 - 1];
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
  [(HKOrganDonationRegisterViewController *)self focusItemAtIndex:v5];
}

- (void)focusItemAtIndex:(int64_t)a3
{
  -[NSArray objectAtIndexedSubscript:](self->_dataEntryItems, "objectAtIndexedSubscript:");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 beginEditing];
  NSUInteger v5 = [MEMORY[0x1E4F28D58] indexPathForRow:a3 inSection:0];
  id v6 = [(HKOrganDonationRegisterViewController *)self tableView];
  [v6 scrollToRowAtIndexPath:v5 atScrollPosition:3 animated:1];
}

- (void)nextButtonTapped:(id)a3
{
  NSUInteger v4 = [(HKOrganDonationRegisterViewController *)self view];
  [v4 endEditing:0];

  if ([(HKOrganDonationRegisterViewController *)self _registrantIsUnderAge])
  {
    NSUInteger v5 = [HKOrganDonationUnderageViewController alloc];
    id v6 = [(HKOrganDonationRegisterViewController *)self medicalIDData];
    objc_super v12 = [(HKOrganDonationBaseViewController *)v5 initWithMedicalIDData:v6];
  }
  else
  {
    id v7 = [HKOrganDonationConfirmationViewController alloc];
    registrant = self->_registrant;
    uint64_t v9 = [(HKOrganDonationRegisterViewController *)self medicalIDData];
    objc_super v12 = [(HKOrganDonationConfirmationViewController *)v7 initWithRegistrant:registrant medicalIDData:v9 connectionManager:self->_connectionManager];
  }
  v10 = [(HKOrganDonationRegisterViewController *)self completionButtonTitle];
  [(HKOrganDonationBaseViewController *)v12 setCompletionButtonTitle:v10];

  [(HKOrganDonationBaseViewController *)v12 setRegistrationCompletionHandler:self->_registrationCompletionHandler];
  v11 = [(HKOrganDonationRegisterViewController *)self navigationController];
  [v11 pushViewController:v12 animated:1];
}

- (void)cancelButtonTapped:(id)a3
{
  registrationCompletionHandler = (void (**)(id, void, id))self->_registrationCompletionHandler;
  if (registrationCompletionHandler) {
    registrationCompletionHandler[2](registrationCompletionHandler, 0, a3);
  }
  [(HKOrganDonationRegisterViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)updateButtonTapped:(id)a3
{
  NSUInteger v4 = [HKOrganDonationConfirmUpdateViewController alloc];
  registrant = self->_registrant;
  id v6 = [(HKOrganDonationRegisterViewController *)self medicalIDData];
  uint64_t v8 = [(HKOrganDonationConfirmUpdateViewController *)v4 initWithRegistrant:registrant medicalIDData:v6 connectionManager:self->_connectionManager];

  id v7 = [(HKOrganDonationRegisterViewController *)self navigationController];
  [v7 pushViewController:v8 animated:1];
}

- (void)organDonationConnectionManagerDidStoreCredential:(id)a3
{
  [(_HKMedicalIDData *)self->_medicalIDData setIsOrganDonor:&unk_1F3C21FB8];
  healthStore = self->_healthStore;
  medicalIDData = self->_medicalIDData;
  [(HKHealthStore *)healthStore updateMedicalIDData:medicalIDData];
}

- (void)organDonationConnectionManagerDidRemoveCredential:(id)a3
{
  [(_HKMedicalIDData *)self->_medicalIDData setIsOrganDonor:0];
  healthStore = self->_healthStore;
  medicalIDData = self->_medicalIDData;
  [(HKHealthStore *)healthStore updateMedicalIDData:medicalIDData];
}

- (void)submitOrganDonationFlowImpressionEvent:(int)a3
{
  NSUInteger v4 = [[HKOrganDonationFlowImpressionAnalyticEvent alloc] initWithImpressionEvent:*(void *)&a3];
  NSUInteger v5 = [(HKOrganDonationConnectionManager *)self->_connectionManager analyticsEventSubmissionManager];
  uint64_t v6 = 0;
  [v5 submitEvent:v4 error:&v6];
}

- (_HKMedicalIDData)medicalIDData
{
  return self->_medicalIDData;
}

- (void)setMedicalIDData:(id)a3
{
}

- (HKOrganDonationRegistrant)registrant
{
  return self->_registrant;
}

- (void)setRegistrant:(id)a3
{
}

- (NSString)completionButtonTitle
{
  return self->_completionButtonTitle;
}

- (void)setCompletionButtonTitle:(id)a3
{
}

- (id)registrationCompletionHandler
{
  return self->_registrationCompletionHandler;
}

- (void)setRegistrationCompletionHandler:(id)a3
{
}

- (void)setDataEntryItems:(id)a3
{
}

- (UIBarButtonItem)nextButton
{
  return self->_nextButton;
}

- (void)setNextButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_dataEntryItems, 0);
  objc_storeStrong(&self->_registrationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_completionButtonTitle, 0);
  objc_storeStrong((id *)&self->_registrant, 0);
  objc_storeStrong((id *)&self->_medicalIDData, 0);
  objc_storeStrong((id *)&self->_bodyFont, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_updateBarButtonItem, 0);
  objc_storeStrong((id *)&self->_loadingIndicatorBarButtonItem, 0);
  objc_storeStrong((id *)&self->_loadingIndicator, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_connectionManager, 0);
}

@end