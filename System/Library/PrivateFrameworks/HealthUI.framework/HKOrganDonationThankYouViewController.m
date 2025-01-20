@interface HKOrganDonationThankYouViewController
- (id)bodyString;
- (id)bottomAnchoredButtons;
- (id)titleImage;
- (id)titleString;
- (void)buttonAtIndexTapped:(int64_t)a3;
- (void)doneButtonTapped:(id)a3;
- (void)shareButtonTapped:(id)a3;
- (void)viewDidLoad;
@end

@implementation HKOrganDonationThankYouViewController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)HKOrganDonationThankYouViewController;
  [(HKTitledBuddyViewController *)&v4 viewDidLoad];
  v3 = [(HKOrganDonationThankYouViewController *)self navigationItem];
  [v3 setHidesBackButton:1 animated:0];
}

- (id)titleImage
{
  v2 = (void *)MEMORY[0x1E4FB1818];
  v3 = HKHealthUIFrameworkBundle();
  objc_super v4 = [v2 imageNamed:@"donate_life_logo" inBundle:v3];

  return v4;
}

- (id)titleString
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v3 = [v2 localizedStringForKey:@"OD_THANK_YOU_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v3;
}

- (id)bodyString
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v3 = [v2 localizedStringForKey:@"OD_THANK_YOU_BODY" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v3;
}

- (id)bottomAnchoredButtons
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v3 = [(HKOrganDonationBaseViewController *)self completionButtonTitle];
  objc_super v4 = v3;
  if (!v3)
  {
    v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    objc_super v4 = [v2 localizedStringForKey:@"OD_DONE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  }
  v9[0] = v4;
  v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v6 = [v5 localizedStringForKey:@"OD_SHARE_YOUR_DECISION" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v9[1] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];

  if (!v3)
  {
  }
  return v7;
}

- (void)buttonAtIndexTapped:(int64_t)a3
{
  if (a3 == 1)
  {
    [(HKOrganDonationThankYouViewController *)self shareButtonTapped:0];
  }
  else if (!a3)
  {
    -[HKOrganDonationThankYouViewController doneButtonTapped:](self, "doneButtonTapped:");
  }
}

- (void)shareButtonTapped:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  objc_super v4 = [_HKActivityItemProvider alloc];
  v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v6 = [v5 localizedStringForKey:@"OD_SHARE_TEMPLATE_MAIL" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v7 = [(UIActivityItemProvider *)v4 initWithPlaceholderItem:v6];

  id v8 = objc_alloc(MEMORY[0x1E4F9F2E8]);
  v20[0] = v7;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  v10 = (void *)[v8 initWithActivityItems:v9 applicationActivities:MEMORY[0x1E4F1CBF0]];

  v11 = [v10 popoverPresentationController];
  v12 = [(HKTitledBuddyViewController *)self buttons];
  v13 = [v12 objectAtIndexedSubscript:1];
  [v11 setSourceView:v13];

  uint64_t v14 = *MEMORY[0x1E4F9F3A8];
  v19[0] = *MEMORY[0x1E4F9F390];
  v19[1] = v14;
  uint64_t v15 = *MEMORY[0x1E4F9F370];
  v19[2] = *MEMORY[0x1E4F9F380];
  v19[3] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
  [v10 setIncludedActivityTypes:v16];

  uint64_t v18 = *MEMORY[0x1E4F9F348];
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  [v10 setExcludedActivityTypes:v17];

  [v10 setExcludedActivityCategories:1];
  [(HKOrganDonationThankYouViewController *)self presentViewController:v10 animated:1 completion:0];
}

- (void)doneButtonTapped:(id)a3
{
  objc_super v4 = [(HKOrganDonationBaseViewController *)self registrationCompletionHandler];

  if (v4)
  {
    v5 = [(HKOrganDonationBaseViewController *)self registrationCompletionHandler];
    v5[2](v5, 1);
  }
  id v6 = [(HKOrganDonationThankYouViewController *)self navigationController];
  [v6 dismissViewControllerAnimated:1 completion:0];
}

@end