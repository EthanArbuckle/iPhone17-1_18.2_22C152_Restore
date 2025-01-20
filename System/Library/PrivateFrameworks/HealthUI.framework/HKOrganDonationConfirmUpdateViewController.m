@interface HKOrganDonationConfirmUpdateViewController
- (HKOrganDonationConfirmUpdateViewController)initWithRegistrant:(id)a3 medicalIDData:(id)a4 connectionManager:(id)a5;
- (id)bodyString;
- (id)bottomAnchoredButtons;
- (id)titleImage;
- (id)titleString;
- (void)buttonAtIndexTapped:(int64_t)a3;
- (void)updateButtonTapped:(id)a3;
@end

@implementation HKOrganDonationConfirmUpdateViewController

- (HKOrganDonationConfirmUpdateViewController)initWithRegistrant:(id)a3 medicalIDData:(id)a4 connectionManager:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HKOrganDonationConfirmUpdateViewController;
  v11 = [(HKOrganDonationBaseViewController *)&v14 initWithMedicalIDData:a4];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_connectionManager, a5);
    objc_storeStrong((id *)&v12->_registrant, a3);
  }

  return v12;
}

- (id)titleImage
{
  v2 = (void *)MEMORY[0x1E4FB1818];
  v3 = HKHealthUIFrameworkBundle();
  v4 = [v2 imageNamed:@"donate_life_logo" inBundle:v3];

  return v4;
}

- (id)titleString
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v3 = [v2 localizedStringForKey:@"OD_UPDATE_CONFIRMATION_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v3;
}

- (id)bodyString
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v3 = [v2 localizedStringForKey:@"OD_UPDATE_CONFIRMATION_BODY" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v3;
}

- (id)bottomAnchoredButtons
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v3 = [v2 localizedStringForKey:@"OD_UPDATE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v6[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (void)buttonAtIndexTapped:(int64_t)a3
{
  if (!a3) {
    -[HKOrganDonationConfirmUpdateViewController updateButtonTapped:](self, "updateButtonTapped:");
  }
}

- (void)updateButtonTapped:(id)a3
{
  id v4 = a3;
  [v4 setEnabled:0];
  v5 = [(HKOrganDonationConfirmUpdateViewController *)self navigationItem];
  [v5 setHidesBackButton:1 animated:1];

  v6 = [(HKTitledBuddyViewController *)self loadingIndicator];
  [v6 startAnimating];

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__HKOrganDonationConfirmUpdateViewController_updateButtonTapped___block_invoke;
  aBlock[3] = &unk_1E6D51950;
  objc_copyWeak(&v13, &location);
  id v7 = v4;
  id v12 = v7;
  v8 = _Block_copy(aBlock);
  connectionManager = self->_connectionManager;
  id v10 = [(HKOrganDonationRegistrant *)self->_registrant jsonDictionaryRepresentation];
  [(HKOrganDonationConnectionManager *)connectionManager updateRegistrantWithParams:v10 completion:v8];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __65__HKOrganDonationConfirmUpdateViewController_updateButtonTapped___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) setEnabled:1];
    v6 = [WeakRetained navigationItem];
    [v6 setHidesBackButton:0 animated:1];

    id v7 = [WeakRetained loadingIndicator];
    [v7 stopAnimating];

    if (a3)
    {
      v8 = (void *)MEMORY[0x1E4FB1418];
      id v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v10 = [v9 localizedStringForKey:@"OD_GENERIC_FAILURE_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v12 = [v11 localizedStringForKey:@"OD_GENERIC_FAILURE_BODY" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      id v13 = [v8 alertControllerWithTitle:v10 message:v12 preferredStyle:1];

      objc_super v14 = (void *)MEMORY[0x1E4FB1410];
      v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v16 = [v15 localizedStringForKey:@"OD_ALERT_OK" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __65__HKOrganDonationConfirmUpdateViewController_updateButtonTapped___block_invoke_2;
      v23[3] = &unk_1E6D51928;
      v23[4] = WeakRetained;
      v17 = [v14 actionWithTitle:v16 style:0 handler:v23];
      [(HKOrganDonationUpdateSuccessViewController *)v13 addAction:v17];

      [WeakRetained presentViewController:v13 animated:1 completion:0];
    }
    else
    {
      v18 = [HKOrganDonationUpdateSuccessViewController alloc];
      v19 = [WeakRetained medicalIDData];
      id v13 = [(HKOrganDonationBaseViewController *)v18 initWithMedicalIDData:v19];

      v20 = [WeakRetained registrationCompletionHandler];
      [(HKOrganDonationBaseViewController *)v13 setRegistrationCompletionHandler:v20];

      v21 = [WeakRetained completionButtonTitle];
      [(HKOrganDonationBaseViewController *)v13 setCompletionButtonTitle:v21];

      v22 = [WeakRetained navigationController];
      [v22 pushViewController:v13 animated:1];
    }
  }
}

void __65__HKOrganDonationConfirmUpdateViewController_updateButtonTapped___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  id v1 = (id)[v2 popViewControllerAnimated:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrant, 0);
  objc_storeStrong((id *)&self->_connectionManager, 0);
}

@end