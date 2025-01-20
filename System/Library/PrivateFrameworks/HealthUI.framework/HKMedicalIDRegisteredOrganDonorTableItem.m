@interface HKMedicalIDRegisteredOrganDonorTableItem
- (BOOL)canEditRowAtIndex:(int64_t)a3;
- (BOOL)hasPresentableData;
- (BOOL)shouldHighlightRowAtIndex:(int64_t)a3;
- (HKMedicalIDRegisteredOrganDonorTableItemDelegate)delegate;
- (HKOrganDonationCallToActionTableViewCell)notRegisteredCell;
- (UIEdgeInsets)separatorInset;
- (id)initInEditMode:(BOOL)a3 organDonationOrganization:(int64_t)a4;
- (id)organizationLogo;
- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4;
- (id)title;
- (id)titleForFooter;
- (void)presentDonateLifeRegistrationSequence;
- (void)setDelegate:(id)a3;
- (void)setNotRegisteredCell:(id)a3;
@end

@implementation HKMedicalIDRegisteredOrganDonorTableItem

- (id)initInEditMode:(BOOL)a3 organDonationOrganization:(int64_t)a4
{
  BOOL v5 = a3;
  if (a3)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"HKMedicalIDRegisteredOrganDonorTableItem.m" lineNumber:33 description:@"HKMedicalIDRegisteredOrganDonorTableItem doesn't support edit mode"];
  }
  v10.receiver = self;
  v10.super_class = (Class)HKMedicalIDRegisteredOrganDonorTableItem;
  id result = [(HKEmergencyCardTableItem *)&v10 initInEditMode:v5];
  if (result) {
    *((void *)result + 5) = a4;
  }
  return result;
}

- (id)title
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v3 = [v2 localizedStringForKey:@"OD_REGISTRY" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v3;
}

- (id)organizationLogo
{
  v2 = (void *)MEMORY[0x1E4FB1818];
  v3 = HKHealthUIFrameworkBundle();
  v4 = [v2 imageNamed:@"donate_life_logo" inBundle:v3];

  return v4;
}

- (BOOL)hasPresentableData
{
  return 1;
}

- (BOOL)canEditRowAtIndex:(int64_t)a3
{
  return 0;
}

- (BOOL)shouldHighlightRowAtIndex:(int64_t)a3
{
  return 0;
}

- (UIEdgeInsets)separatorInset
{
  if (+[HKOrganDonationConnectionManager hasStoredRegistrant](HKOrganDonationConnectionManager, "hasStoredRegistrant")|| +[HKOrganDonationConnectionManager shouldShowStoreDemoOrganDonation])
  {
    v7.receiver = self;
    v7.super_class = (Class)HKMedicalIDRegisteredOrganDonorTableItem;
    [(HKEmergencyCardTableItem *)&v7 separatorInset];
  }
  else
  {
    double v3 = 0.0;
    double v4 = 999.0;
    double v5 = 0.0;
    double v6 = 0.0;
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4
{
  id v5 = a3;
  if (+[HKOrganDonationConnectionManager hasStoredRegistrant](HKOrganDonationConnectionManager, "hasStoredRegistrant")|| +[HKOrganDonationConnectionManager shouldShowStoreDemoOrganDonation])
  {
    double v6 = +[HKIDRegisteredReviewCell defaultReuseIdentifier];
    objc_super v7 = [v5 dequeueReusableCellWithIdentifier:v6];
  }
  else
  {
    v8 = +[HKOrganDonationCallToActionTableViewCell defaultReuseIdentifier];
    objc_super v7 = [v5 dequeueReusableCellWithIdentifier:v8];

    double v6 = [v7 actionButton];
    [v6 addTarget:self action:sel_presentDonateLifeRegistrationSequence forControlEvents:64];
  }

  return v7;
}

- (void)presentDonateLifeRegistrationSequence
{
  double v6 = objc_alloc_init(HKOrganDonationRegisterViewController);
  double v3 = [(HKEmergencyCardTableItem *)self data];
  [(HKOrganDonationRegisterViewController *)v6 setMedicalIDData:v3];

  double v4 = [[HKNavigationController alloc] initWithRootViewController:v6];
  id v5 = [(HKEmergencyCardTableItem *)self owningViewController];
  [v5 presentViewController:v4 animated:1 completion:0];

  [(HKOrganDonationRegisterViewController *)v6 submitOrganDonationFlowImpressionEvent:1];
}

- (id)titleForFooter
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  double v3 = [v2 localizedStringForKey:@"OD_PERSONAL_INFO_DISCLAIMER" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v3;
}

- (HKMedicalIDRegisteredOrganDonorTableItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKMedicalIDRegisteredOrganDonorTableItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HKOrganDonationCallToActionTableViewCell)notRegisteredCell
{
  return self->_notRegisteredCell;
}

- (void)setNotRegisteredCell:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notRegisteredCell, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end