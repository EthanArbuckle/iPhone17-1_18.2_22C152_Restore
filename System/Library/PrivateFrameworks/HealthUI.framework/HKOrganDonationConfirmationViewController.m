@interface HKOrganDonationConfirmationViewController
- (HKOrganDonationConfirmationViewController)initWithRegistrant:(id)a3 medicalIDData:(id)a4 connectionManager:(id)a5;
- (NSArray)dataEntryItems;
- (NSString)completionButtonTitle;
- (UIActivityIndicatorView)loadingIndicator;
- (UIButton)submitButton;
- (UITableView)tableView;
- (_HKMedicalIDData)medicalIDData;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_createTableFooterView;
- (id)_createTableHeaderView;
- (id)registrationCompletionHandler;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)confirmSubmissionIfNecessaryWithConfirmHandler:(id)a3 andCancelHandler:(id)a4;
- (void)setCompletionButtonTitle:(id)a3;
- (void)setDataEntryItems:(id)a3;
- (void)setLoadingIndicator:(id)a3;
- (void)setMedicalIDData:(id)a3;
- (void)setRegistrationCompletionHandler:(id)a3;
- (void)setSubmitButton:(id)a3;
- (void)setTableView:(id)a3;
- (void)submitButtonTapped:(id)a3;
- (void)titledBuddyHeaderViewDidTapLinkButton:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation HKOrganDonationConfirmationViewController

- (HKOrganDonationConfirmationViewController)initWithRegistrant:(id)a3 medicalIDData:(id)a4 connectionManager:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HKOrganDonationConfirmationViewController;
  v9 = [(HKOrganDonationConfirmationViewController *)&v14 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connectionManager, a5);
    uint64_t v11 = [v7 copy];
    registrant = v10->_registrant;
    v10->_registrant = (HKOrganDonationRegistrant *)v11;
  }
  return v10;
}

- (void)viewDidLoad
{
  v34.receiver = self;
  v34.super_class = (Class)HKOrganDonationConfirmationViewController;
  [(HKOrganDonationConfirmationViewController *)&v34 viewDidLoad];
  objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", *MEMORY[0x1E4FB28C8]);
  v3 = (UIFont *)objc_claimAutoreleasedReturnValue();
  bodyFont = self->_bodyFont;
  self->_bodyFont = v3;

  v5 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
  loadingIndicator = self->_loadingIndicator;
  self->_loadingIndicator = v5;

  [(UIActivityIndicatorView *)self->_loadingIndicator setHidesWhenStopped:1];
  id v7 = [(HKOrganDonationConfirmationViewController *)self navigationItem];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:self->_loadingIndicator];
  [v7 setRightBarButtonItem:v8];

  id v9 = objc_alloc(MEMORY[0x1E4FB1D00]);
  v10 = [(HKOrganDonationConfirmationViewController *)self view];
  [v10 bounds];
  uint64_t v11 = objc_msgSend(v9, "initWithFrame:style:", 0);

  [v11 setAutoresizingMask:18];
  [v11 setDataSource:self];
  [v11 setDelegate:self];
  [(HKOrganDonationConfirmationViewController *)self setTableView:v11];
  v12 = [(HKOrganDonationConfirmationViewController *)self view];
  [v12 addSubview:v11];

  v13 = [(HKOrganDonationConfirmationViewController *)self tableView];
  objc_super v14 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v13 setBackgroundColor:v14];

  v15 = [(HKOrganDonationConfirmationViewController *)self tableView];
  v16 = [(HKOrganDonationConfirmationViewController *)self _createTableHeaderView];
  [v15 setTableHeaderView:v16];

  v17 = [(HKOrganDonationConfirmationViewController *)self _createTableFooterView];
  footerView = self->_footerView;
  self->_footerView = v17;

  v19 = [(HKOrganDonationConfirmationViewController *)self view];
  [v19 addSubview:self->_footerView];

  v20 = [(UIVisualEffectView *)self->_footerView leadingAnchor];
  v21 = [(HKOrganDonationConfirmationViewController *)self view];
  v22 = [v21 leadingAnchor];
  v23 = [v20 constraintEqualToAnchor:v22];
  [v23 setActive:1];

  v24 = [(UIVisualEffectView *)self->_footerView trailingAnchor];
  v25 = [(HKOrganDonationConfirmationViewController *)self view];
  v26 = [v25 trailingAnchor];
  v27 = [v24 constraintEqualToAnchor:v26];
  [v27 setActive:1];

  v28 = [(UIVisualEffectView *)self->_footerView bottomAnchor];
  v29 = [(HKOrganDonationConfirmationViewController *)self view];
  v30 = [v29 bottomAnchor];
  v31 = [v28 constraintEqualToAnchor:v30];
  [v31 setActive:1];

  v32 = [(HKOrganDonationRegistrant *)self->_registrant dataEntryItemsValidOnly:1];
  dataEntryItems = self->_dataEntryItems;
  self->_dataEntryItems = v32;
}

- (void)viewDidLayoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)HKOrganDonationConfirmationViewController;
  [(HKOrganDonationConfirmationViewController *)&v16 viewDidLayoutSubviews];
  v3 = [(HKOrganDonationConfirmationViewController *)self tableView];
  [v3 contentInset];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  [(UIVisualEffectView *)self->_footerView frame];
  double Height = CGRectGetHeight(v17);
  uint64_t v11 = [(HKOrganDonationConfirmationViewController *)self tableView];
  [v11 safeAreaInsets];
  double v13 = Height - v12;

  objc_super v14 = [(HKOrganDonationConfirmationViewController *)self tableView];
  objc_msgSend(v14, "setContentInset:", v5, v7, v13, v9);

  v15 = [(HKOrganDonationConfirmationViewController *)self tableView];
  objc_msgSend(v15, "setScrollIndicatorInsets:", v5, v7, v13, v9);
}

- (id)_createTableHeaderView
{
  v3 = [(HKOrganDonationConfirmationViewController *)self view];
  [v3 frame];
  CGRectGetHeight(v22);
  double v4 = [(HKOrganDonationConfirmationViewController *)self view];
  UIRoundToViewScale();
  double v6 = v5;

  double v7 = [(HKOrganDonationConfirmationViewController *)self tableView];
  [v7 frame];
  double Width = CGRectGetWidth(v23);

  double v9 = [HKTitledBuddyHeaderView alloc];
  v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v11 = [v10 localizedStringForKey:@"OD_MORE_ABOUT_PRIVACY_BUTTON" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  double v12 = [(HKTitledBuddyHeaderView *)v9 initWithTopInset:v11 linkButtonTitle:v6];

  [(HKTitledBuddyHeaderView *)v12 setDelegate:self];
  double v13 = [(HKTitledBuddyHeaderView *)v12 widthAnchor];
  objc_super v14 = [v13 constraintEqualToConstant:Width];
  [v14 setActive:1];

  v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  objc_super v16 = [v15 localizedStringForKey:@"OD_YOUR_GIFT_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [(HKTitledBuddyHeaderView *)v12 setTitleText:v16];

  CGRect v17 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v18 = [v17 localizedStringForKey:@"OD_YOUR_GIFT_BODY" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [(HKTitledBuddyHeaderView *)v12 setBodyText:v18];

  [(HKTitledBuddyHeaderView *)v12 layoutIfNeeded];
  v19 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  [(HKTitledBuddyHeaderView *)v12 setBackgroundColor:v19];

  return v12;
}

- (id)_createTableFooterView
{
  v3 = (void *)MEMORY[0x1E4FB14D0];
  double v4 = HKHealthKeyColor();
  double v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  double v6 = [v5 localizedStringForKey:@"OD_COMPLETE_REGISTRATION" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  double v7 = objc_msgSend(v3, "hk_multiLineRoundRectButtonTintedWithColor:title:target:action:", v4, v6, self, sel_submitButtonTapped_);

  double v8 = [MEMORY[0x1E4FB14C8] effectWithStyle:1];
  double v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v8];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  v10 = [v9 contentView];
  [v10 addSubview:v7];

  uint64_t v11 = [v7 topAnchor];
  double v12 = [v9 topAnchor];
  double v13 = [v11 constraintEqualToAnchor:v12 constant:32.0];
  [v13 setActive:1];

  objc_super v14 = [v7 bottomAnchor];
  v15 = [v9 bottomAnchor];
  objc_super v16 = [v14 constraintEqualToAnchor:v15 constant:-24.0];
  [v16 setActive:1];

  CGRect v17 = [v7 centerXAnchor];
  v18 = [v9 centerXAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  [v19 setActive:1];

  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_dataEntryItems count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = [(HKOrganDonationConfirmationViewController *)self dataEntryItems];
  uint64_t v7 = [v5 row];

  double v8 = [v6 objectAtIndex:v7];

  double v9 = [v8 cell];
  [v9 setEditDisabled:1];

  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  bodyFont = self->_bodyFont;
  BOOL IsUsingAccessibilityContentSizeCategory = HKUIApplicationIsUsingAccessibilityContentSizeCategory();
  double v6 = 44.0;
  if (IsUsingAccessibilityContentSizeCategory) {
    double v6 = 60.0;
  }
  [(UIFont *)bodyFont _scaledValueForValue:v6];
  return result;
}

- (void)submitButtonTapped:(id)a3
{
  id v4 = a3;
  [v4 setEnabled:0];
  id v5 = [(HKOrganDonationConfirmationViewController *)self navigationItem];
  [v5 setHidesBackButton:1 animated:1];

  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__HKOrganDonationConfirmationViewController_submitButtonTapped___block_invoke;
  v11[3] = &unk_1E6D53650;
  v11[4] = self;
  objc_copyWeak(&v13, &location);
  id v6 = v4;
  id v12 = v6;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__HKOrganDonationConfirmationViewController_submitButtonTapped___block_invoke_4;
  v8[3] = &unk_1E6D527B8;
  objc_copyWeak(&v10, &location);
  id v7 = v6;
  id v9 = v7;
  [(HKOrganDonationConfirmationViewController *)self confirmSubmissionIfNecessaryWithConfirmHandler:v11 andCancelHandler:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __64__HKOrganDonationConfirmationViewController_submitButtonTapped___block_invoke(id *a1)
{
  v2 = [a1[4] loadingIndicator];
  [v2 startAnimating];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__HKOrganDonationConfirmationViewController_submitButtonTapped___block_invoke_2;
  aBlock[3] = &unk_1E6D55A50;
  objc_copyWeak(&v9, a1 + 6);
  id v3 = a1[5];
  id v4 = a1[4];
  id v7 = v3;
  id v8 = v4;
  id v5 = _Block_copy(aBlock);
  [*((id *)a1[4] + 122) submitRegistrant:*((void *)a1[4] + 123) completion:v5];

  objc_destroyWeak(&v9);
}

void __64__HKOrganDonationConfirmationViewController_submitButtonTapped___block_invoke_2(id *a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    [a1[4] setEnabled:1];
    id v6 = [WeakRetained navigationItem];
    [v6 setHidesBackButton:0 animated:1];

    id v7 = [WeakRetained loadingIndicator];
    [v7 stopAnimating];

    if (a3)
    {
      id v8 = (void *)MEMORY[0x1E4FB1418];
      id v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v10 = [v9 localizedStringForKey:@"OD_SIGNUP_FAILURE_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      uint64_t v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v12 = [v11 localizedStringForKey:@"OD_SIGNUP_FAILURE_BODY" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      id v13 = [v8 alertControllerWithTitle:v10 message:v12 preferredStyle:1];

      objc_super v14 = (void *)MEMORY[0x1E4FB1410];
      v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      objc_super v16 = [v15 localizedStringForKey:@"OD_ALERT_OK" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __64__HKOrganDonationConfirmationViewController_submitButtonTapped___block_invoke_3;
      v24[3] = &unk_1E6D51928;
      v24[4] = WeakRetained;
      CGRect v17 = [v14 actionWithTitle:v16 style:0 handler:v24];
      [v13 addAction:v17];

      [WeakRetained presentViewController:v13 animated:1 completion:0];
    }
    else
    {
      v18 = [HKOrganDonationThankYouViewController alloc];
      v19 = [a1[5] medicalIDData];
      v20 = [(HKOrganDonationBaseViewController *)v18 initWithMedicalIDData:v19];

      v21 = [a1[5] registrationCompletionHandler];
      [(HKOrganDonationBaseViewController *)v20 setRegistrationCompletionHandler:v21];

      CGRect v22 = [a1[5] completionButtonTitle];
      [(HKOrganDonationBaseViewController *)v20 setCompletionButtonTitle:v22];

      CGRect v23 = [WeakRetained navigationController];
      [v23 pushViewController:v20 animated:1];
    }
  }
}

void __64__HKOrganDonationConfirmationViewController_submitButtonTapped___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  id v1 = (id)[v2 popViewControllerAnimated:1];
}

void __64__HKOrganDonationConfirmationViewController_submitButtonTapped___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = [WeakRetained navigationItem];
    [v3 setHidesBackButton:0 animated:1];

    [*(id *)(a1 + 32) setEnabled:1];
    id WeakRetained = v4;
  }
}

- (void)confirmSubmissionIfNecessaryWithConfirmHandler:(id)a3 andCancelHandler:(id)a4
{
  id v6 = (void (**)(void))a3;
  id v7 = a4;
  if (+[HKOrganDonationConnectionManager registrationSubmissionHostConfiguration] == 2)
  {
    if (v6) {
      v6[2](v6);
    }
  }
  else
  {
    id v8 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Attention", @"This is a test. Proceeding with this registration will send your information to a staging environment, which will NOT sign you up as an organ donor. To use the production environment instead, please choose the production server from the Health internal setting and relaunch Health.", 1 message preferredStyle];
    id v9 = (void *)MEMORY[0x1E4FB1410];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __109__HKOrganDonationConfirmationViewController_confirmSubmissionIfNecessaryWithConfirmHandler_andCancelHandler___block_invoke;
    v18[3] = &unk_1E6D53958;
    id v19 = v7;
    id v10 = [v9 actionWithTitle:@"Cancel" style:1 handler:v18];
    [v8 addAction:v10];

    uint64_t v11 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __109__HKOrganDonationConfirmationViewController_confirmSubmissionIfNecessaryWithConfirmHandler_andCancelHandler___block_invoke_2;
    objc_super v16 = &unk_1E6D53958;
    CGRect v17 = v6;
    id v12 = [v11 actionWithTitle:@"Submit" style:0 handler:&v13];
    objc_msgSend(v8, "addAction:", v12, v13, v14, v15, v16);

    [(HKOrganDonationConfirmationViewController *)self presentViewController:v8 animated:1 completion:0];
  }
}

uint64_t __109__HKOrganDonationConfirmationViewController_confirmSubmissionIfNecessaryWithConfirmHandler_andCancelHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __109__HKOrganDonationConfirmationViewController_confirmSubmissionIfNecessaryWithConfirmHandler_andCancelHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)titledBuddyHeaderViewDidTapLinkButton:(id)a3
{
  id v6 = objc_alloc_init(HKOrganDonationMoreAboutPrivacyViewController);
  id v4 = [[HKNavigationController alloc] initWithRootViewController:v6];
  id v5 = [(HKOrganDonationConfirmationViewController *)self navigationController];
  [v5 presentViewController:v4 animated:1 completion:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKOrganDonationConfirmationViewController;
  [(HKOrganDonationConfirmationViewController *)&v12 traitCollectionDidChange:v4];
  if (v4)
  {
    id v5 = [(HKOrganDonationConfirmationViewController *)self traitCollection];
    id v6 = [v5 preferredContentSizeCategory];
    id v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", *MEMORY[0x1E4FB28C8]);
      id v9 = (UIFont *)objc_claimAutoreleasedReturnValue();
      bodyFont = self->_bodyFont;
      self->_bodyFont = v9;

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __70__HKOrganDonationConfirmationViewController_traitCollectionDidChange___block_invoke;
      block[3] = &unk_1E6D50ED8;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

void __70__HKOrganDonationConfirmationViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tableView];
  [v1 reloadData];
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

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (UIActivityIndicatorView)loadingIndicator
{
  return self->_loadingIndicator;
}

- (void)setLoadingIndicator:(id)a3
{
}

- (_HKMedicalIDData)medicalIDData
{
  return self->_medicalIDData;
}

- (void)setMedicalIDData:(id)a3
{
}

- (NSArray)dataEntryItems
{
  return self->_dataEntryItems;
}

- (void)setDataEntryItems:(id)a3
{
}

- (UIButton)submitButton
{
  return self->_submitButton;
}

- (void)setSubmitButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submitButton, 0);
  objc_storeStrong((id *)&self->_dataEntryItems, 0);
  objc_storeStrong((id *)&self->_medicalIDData, 0);
  objc_storeStrong((id *)&self->_loadingIndicator, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong(&self->_registrationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_completionButtonTitle, 0);
  objc_storeStrong((id *)&self->_bodyFont, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_registrant, 0);
  objc_storeStrong((id *)&self->_connectionManager, 0);
}

@end