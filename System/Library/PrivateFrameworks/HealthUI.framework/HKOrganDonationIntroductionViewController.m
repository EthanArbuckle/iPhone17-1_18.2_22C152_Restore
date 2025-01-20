@interface HKOrganDonationIntroductionViewController
- (id)bodyString;
- (id)bottomAnchoredButtons;
- (id)linkButtonTitle;
- (id)titleImage;
- (id)titleString;
- (void)alreadyButtonTapped:(id)a3;
- (void)buttonAtIndexTapped:(int64_t)a3;
- (void)learnMoreButtonTapped:(id)a3;
- (void)linkButtonTapped:(id)a3;
- (void)notNowButtonTapped:(id)a3;
- (void)setUpRegistrationViewController;
- (void)signupButtonTapped:(id)a3;
- (void)viewDidLoad;
@end

@implementation HKOrganDonationIntroductionViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HKOrganDonationIntroductionViewController;
  [(HKTitledBuddyViewController *)&v3 viewDidLoad];
  [(HKOrganDonationIntroductionViewController *)self setUpRegistrationViewController];
  [(HKOrganDonationRegisterViewController *)self->_registrationViewController submitOrganDonationFlowImpressionEvent:1];
}

- (id)titleImage
{
  v2 = (void *)MEMORY[0x1E4FB1818];
  objc_super v3 = HKHealthUIFrameworkBundle();
  v4 = [v2 imageNamed:@"donate_life_logo" inBundle:v3];

  return v4;
}

- (id)titleString
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  objc_super v3 = [v2 localizedStringForKey:@"OD_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v3;
}

- (id)bodyString
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  objc_super v3 = [v2 localizedStringForKey:@"OD_BODY" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v3;
}

- (id)linkButtonTitle
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  objc_super v3 = [v2 localizedStringForKey:@"OD_LEARN_MORE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v3;
}

- (void)linkButtonTapped:(id)a3
{
}

- (id)bottomAnchoredButtons
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  objc_super v3 = [v2 localizedStringForKey:@"OD_SIGN_UP" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v4 = objc_msgSend(MEMORY[0x1E4F28B50], "bundleWithIdentifier:", @"com.apple.HealthUI", v3);
  v5 = [v4 localizedStringForKey:@"OD_ALREADY_DONOR" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v10[1] = v5;
  v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v7 = [v6 localizedStringForKey:@"OD_NOT_NOW" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v10[2] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];

  return v8;
}

- (void)buttonAtIndexTapped:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      [(HKOrganDonationIntroductionViewController *)self notNowButtonTapped:0];
      break;
    case 1:
      [(HKOrganDonationIntroductionViewController *)self alreadyButtonTapped:0];
      break;
    case 0:
      -[HKOrganDonationIntroductionViewController signupButtonTapped:](self, "signupButtonTapped:");
      break;
  }
}

- (void)setUpRegistrationViewController
{
  if (!self->_registrationViewController)
  {
    objc_super v3 = objc_alloc_init(HKOrganDonationRegisterViewController);
    v4 = [(HKOrganDonationBaseViewController *)self medicalIDData];
    [(HKOrganDonationRegisterViewController *)v3 setMedicalIDData:v4];

    v5 = [(HKOrganDonationBaseViewController *)self completionButtonTitle];
    [(HKOrganDonationRegisterViewController *)v3 setCompletionButtonTitle:v5];

    v6 = [(HKOrganDonationBaseViewController *)self registrationCompletionHandler];
    [(HKOrganDonationRegisterViewController *)v3 setRegistrationCompletionHandler:v6];

    registrationViewController = self->_registrationViewController;
    self->_registrationViewController = v3;
  }
}

- (void)signupButtonTapped:(id)a3
{
  id v4 = [(HKOrganDonationIntroductionViewController *)self navigationController];
  [v4 pushViewController:self->_registrationViewController animated:1];
}

- (void)alreadyButtonTapped:(id)a3
{
  v8 = [(HKOrganDonationBaseViewController *)[HKOrganDonationAlreadyDonorViewController alloc] initWithMedicalIDData:0];
  id v4 = [(HKOrganDonationBaseViewController *)self medicalIDData];
  [(HKOrganDonationBaseViewController *)v8 setMedicalIDData:v4];

  v5 = [(HKOrganDonationBaseViewController *)self completionButtonTitle];
  [(HKOrganDonationBaseViewController *)v8 setCompletionButtonTitle:v5];

  v6 = [(HKOrganDonationBaseViewController *)self registrationCompletionHandler];
  [(HKOrganDonationBaseViewController *)v8 setRegistrationCompletionHandler:v6];

  v7 = [(HKOrganDonationIntroductionViewController *)self navigationController];
  [v7 pushViewController:v8 animated:1];
}

- (void)notNowButtonTapped:(id)a3
{
  id v4 = [(HKOrganDonationBaseViewController *)self registrationCompletionHandler];

  if (v4)
  {
    v5 = [(HKOrganDonationBaseViewController *)self registrationCompletionHandler];
    v5[2](v5, 0);
  }
  [(HKOrganDonationIntroductionViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)learnMoreButtonTapped:(id)a3
{
}

- (void).cxx_destruct
{
}

@end