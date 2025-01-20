@interface HKOnboardingBaseViewController(HeartRhythmUI)
- (void)configureNavigationButtonWithTypeCancelWithConfirmForAtrialFibrillation;
- (void)configureNavigationButtonWithTypeCancelWithConfirmForElectrocardiogram;
@end

@implementation HKOnboardingBaseViewController(HeartRhythmUI)

- (void)configureNavigationButtonWithTypeCancelWithConfirmForElectrocardiogram
{
  [a1 setRightButtonType:1];
  v2 = HRUIECGLocalizedString(@"ECG_ONBOARDING_CANCEL_DESCRIPTION");
  [a1 setCancelWithConfirmAlertTitle:v2];

  v3 = HRHeartRhythmUIFrameworkBundle();
  v4 = [v3 localizedStringForKey:@"ONBOARDING_CANCEL" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable"];
  [a1 setCancelWithConfirmAlertContinueActionTitle:v4];

  HRHeartRhythmUIFrameworkBundle();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [v6 localizedStringForKey:@"ONBOARDING_SET_UP_LATER" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable"];
  [a1 setCancelWithConfirmAlertAbortActionTitle:v5];
}

- (void)configureNavigationButtonWithTypeCancelWithConfirmForAtrialFibrillation
{
  [a1 setRightButtonType:1];
  v2 = HRHeartRhythmUIFrameworkBundle();
  v3 = [v2 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_CANCEL_DESC" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];
  [a1 setCancelWithConfirmAlertTitle:v3];

  v4 = HRHeartRhythmUIFrameworkBundle();
  v5 = [v4 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_CANCEL_CANCEL_TITLE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];
  [a1 setCancelWithConfirmAlertContinueActionTitle:v5];

  HRHeartRhythmUIFrameworkBundle();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v7 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_CANCEL_LATER_TITLE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];
  [a1 setCancelWithConfirmAlertAbortActionTitle:v6];
}

@end