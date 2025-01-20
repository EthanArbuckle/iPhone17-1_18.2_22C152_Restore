@interface HKOrganDonationConfirmDeleteViewController
- (HKOrganDonationConfirmDeleteViewController)initWithConnectionManager:(id)a3 medicalIDData:(id)a4;
- (id)bodyString;
- (id)bottomAnchoredButtons;
- (id)titleImage;
- (id)titleString;
- (void)buttonAtIndexTapped:(int64_t)a3;
- (void)deleteButtonTapped:(id)a3;
@end

@implementation HKOrganDonationConfirmDeleteViewController

- (HKOrganDonationConfirmDeleteViewController)initWithConnectionManager:(id)a3 medicalIDData:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKOrganDonationConfirmDeleteViewController;
  v8 = [(HKOrganDonationBaseViewController *)&v11 initWithMedicalIDData:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_connectionManager, a3);
  }

  return v9;
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
  v3 = [v2 localizedStringForKey:@"OD_DELETE_CONFIRMATION_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v3;
}

- (id)bodyString
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v3 = [v2 localizedStringForKey:@"OD_DELETE_CONFIRMATION_BODY" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v3;
}

- (id)bottomAnchoredButtons
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v3 = [v2 localizedStringForKey:@"OD_REMOVE_FROM_REGISTRY" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v6[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (void)buttonAtIndexTapped:(int64_t)a3
{
  if (!a3) {
    -[HKOrganDonationConfirmDeleteViewController deleteButtonTapped:](self, "deleteButtonTapped:");
  }
}

- (void)deleteButtonTapped:(id)a3
{
  id v4 = a3;
  [v4 setEnabled:0];
  v5 = [(HKOrganDonationConfirmDeleteViewController *)self navigationItem];
  [v5 setHidesBackButton:1 animated:1];

  v6 = [(HKTitledBuddyViewController *)self loadingIndicator];
  [v6 startAnimating];

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__HKOrganDonationConfirmDeleteViewController_deleteButtonTapped___block_invoke;
  aBlock[3] = &unk_1E6D51950;
  objc_copyWeak(&v11, &location);
  id v7 = v4;
  id v10 = v7;
  v8 = _Block_copy(aBlock);
  [(HKOrganDonationConnectionManager *)self->_connectionManager deleteRegistrantWithCompletion:v8];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __65__HKOrganDonationConfirmDeleteViewController_deleteButtonTapped___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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
      v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v10 = [v9 localizedStringForKey:@"OD_GENERIC_FAILURE_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      id v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v12 = [v11 localizedStringForKey:@"OD_GENERIC_FAILURE_BODY" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v13 = [v8 alertControllerWithTitle:v10 message:v12 preferredStyle:1];

      v14 = (void *)MEMORY[0x1E4FB1410];
      v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v16 = [v15 localizedStringForKey:@"OD_ALERT_OK" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __65__HKOrganDonationConfirmDeleteViewController_deleteButtonTapped___block_invoke_2;
      v23[3] = &unk_1E6D51928;
      v23[4] = WeakRetained;
      v17 = [v14 actionWithTitle:v16 style:0 handler:v23];
      [(HKOrganDonationDeleteSuccessViewController *)v13 addAction:v17];

      [WeakRetained presentViewController:v13 animated:1 completion:0];
    }
    else
    {
      v18 = [HKOrganDonationDeleteSuccessViewController alloc];
      v19 = [WeakRetained medicalIDData];
      v13 = [(HKOrganDonationBaseViewController *)v18 initWithMedicalIDData:v19];

      v20 = [WeakRetained registrationCompletionHandler];
      [(HKOrganDonationBaseViewController *)v13 setRegistrationCompletionHandler:v20];

      v21 = [WeakRetained completionButtonTitle];
      [(HKOrganDonationBaseViewController *)v13 setCompletionButtonTitle:v21];

      v22 = [WeakRetained navigationController];
      [v22 pushViewController:v13 animated:1];
    }
  }
}

void __65__HKOrganDonationConfirmDeleteViewController_deleteButtonTapped___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  id v1 = (id)[v2 popViewControllerAnimated:1];
}

- (void).cxx_destruct
{
}

@end