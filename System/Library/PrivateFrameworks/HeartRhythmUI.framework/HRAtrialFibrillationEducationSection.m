@interface HRAtrialFibrillationEducationSection
- (BOOL)forSinglePlayer;
- (id)_cellTitleForEducationRow:(unint64_t)a3;
- (id)_viewControllerForEducationRow:(unint64_t)a3;
- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4;
- (id)initForSinglePlayer:(BOOL)a3;
- (id)sectionTitle;
- (unint64_t)numberOfRowsInSection;
- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5;
@end

@implementation HRAtrialFibrillationEducationSection

- (id)initForSinglePlayer:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HRAtrialFibrillationEducationSection;
  id result = [(HRAtrialFibrillationEducationSection *)&v5 init];
  if (result) {
    *((unsigned char *)result + 8) = a3;
  }
  return result;
}

- (id)sectionTitle
{
  return 0;
}

- (unint64_t)numberOfRowsInSection
{
  if (self->_forSinglePlayer) {
    return 4;
  }
  else {
    return 3;
  }
}

- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4
{
  v6 = [a4 dequeueReusableCellWithIdentifier:@"UITableViewCell"];
  if (!v6)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:1 reuseIdentifier:@"UITableViewCell"];
    v7 = [v6 textLabel];
    [v7 setAdjustsFontForContentSizeCategory:1];

    v8 = [v6 textLabel];
    [v8 setNumberOfLines:0];

    [v6 setAccessoryType:1];
  }
  v9 = [(HRAtrialFibrillationEducationSection *)self _cellTitleForEducationRow:a3];
  v10 = [v6 textLabel];
  [v10 setText:v9];

  v11 = [NSString stringWithFormat:@"Education.%@", v9];
  v12 = [NSString healthAccessibilityIdentifier:2 suffix:v11];
  [v6 setAccessibilityIdentifier:v12];

  return v6;
}

- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5
{
  id v9 = a4;
  v7 = [(HRAtrialFibrillationEducationSection *)self _viewControllerForEducationRow:a3];
  if (v7)
  {
    v8 = [v9 topViewController];
    [v8 showAdaptively:v7 sender:0 animated:1];
  }
}

- (id)_cellTitleForEducationRow:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      v4 = HRHeartRhythmUIFrameworkBundle();
      objc_super v5 = v4;
      v6 = @"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_INTRO_ROW_TITLE";
      goto LABEL_6;
    case 1uLL:
      v4 = HRHeartRhythmUIFrameworkBundle();
      objc_super v5 = v4;
      v6 = @"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_HOW_TITLE";
      goto LABEL_6;
    case 2uLL:
      v4 = HRHeartRhythmUIFrameworkBundle();
      objc_super v5 = v4;
      v6 = @"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_SHOULD_KNOW_TITLE";
      goto LABEL_6;
    case 3uLL:
      v4 = HRHeartRhythmUIFrameworkBundle();
      objc_super v5 = v4;
      v6 = @"ATRIAL_FIBRILLATION_DETECTION_ENABLE_NOTIFICATION_TITLE";
LABEL_6:
      v3 = [v4 localizedStringForKey:v6 value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];

      break;
    default:
      break;
  }
  return v3;
}

- (id)_viewControllerForEducationRow:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      objc_super v5 = objc_alloc_init(HRAtrialFibrillationIntroViewController);
      goto LABEL_10;
    case 1uLL:
      v7 = HROnboardingAtrialFibrillationWhatIsViewController;
      goto LABEL_9;
    case 2uLL:
      v7 = HROnboardingAtrialFibrillationLimitationViewController;
      goto LABEL_9;
    case 3uLL:
      v7 = HROnboardingAtrialFibrillationEnableViewController;
LABEL_9:
      objc_super v5 = (HRAtrialFibrillationIntroViewController *)objc_msgSend([v7 alloc], "initForOnboarding:", 0, v3);
LABEL_10:
      break;
    default:
      objc_super v5 = 0;
      break;
  }
  return v5;
}

- (BOOL)forSinglePlayer
{
  return self->_forSinglePlayer;
}

@end