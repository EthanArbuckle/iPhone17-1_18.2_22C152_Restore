@interface HROnboardingAtrialFibrillationLimitationViewController
+ (id)makeSpeedBumpItem;
- (id)initForOnboarding:(BOOL)a3 upgradingFromAlgorithmVersion:(int64_t)a4;
- (void)viewControllerDidLeaveAdaptiveModal;
- (void)viewControllerWillEnterAdaptiveModal;
@end

@implementation HROnboardingAtrialFibrillationLimitationViewController

- (id)initForOnboarding:(BOOL)a3 upgradingFromAlgorithmVersion:(int64_t)a4
{
  BOOL v5 = a3;
  v7 = +[HROnboardingAtrialFibrillationLimitationViewController makeSpeedBumpItem];
  v11.receiver = self;
  v11.super_class = (Class)HROnboardingAtrialFibrillationLimitationViewController;
  v8 = [(HRSpeedBumpViewController *)&v11 initWithSpeedBumpItem:v7 onboarding:v5 upgradingFromAlgorithmVersion:a4];

  if (v8) {
    BOOL v9 = !v5;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9) {
    [(HKOnboardingBaseViewController *)v8 configureNavigationButtonWithTypeCancelWithConfirmForAtrialFibrillation];
  }
  return v8;
}

+ (id)makeSpeedBumpItem
{
  v25[4] = *MEMORY[0x263EF8340];
  v2 = HRHeartRhythmUIFrameworkBundle();
  v22 = [v2 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_SHOULD_KNOW_TITLE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];

  v3 = HRHeartRhythmUIFrameworkBundle();
  v24 = [v3 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_SHOULD_KNOW_BULLET_1_TITLE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];

  v4 = HRHeartRhythmUIFrameworkBundle();
  v23 = [v4 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_SHOULD_KNOW_BULLET_1_BODY" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];

  BOOL v5 = [[HRSpeedBumpBubble alloc] initWithTitle:v24 description:v23];
  v6 = HRHeartRhythmUIFrameworkBundle();
  v21 = [v6 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_SHOULD_KNOW_BULLET_2_TITLE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];

  v7 = HRHeartRhythmUIFrameworkBundle();
  v20 = [v7 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_SHOULD_KNOW_BULLET_2_BODY" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];

  v8 = [[HRSpeedBumpBubble alloc] initWithTitle:v21 description:v20];
  BOOL v9 = HRHeartRhythmUIFrameworkBundle();
  v10 = [v9 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_SHOULD_KNOW_BULLET_3_TITLE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];

  objc_super v11 = HRHeartRhythmUIFrameworkBundle();
  v12 = [v11 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_SHOULD_KNOW_BULLET_3_BODY" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];

  v13 = [[HRSpeedBumpBubble alloc] initWithTitle:v10 description:v12];
  v14 = HRHeartRhythmUIFrameworkBundle();
  v15 = [v14 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_SHOULD_KNOW_BULLET_4_TITLE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];

  v16 = [[HRSpeedBumpBubble alloc] initWithTitle:v15 description:0];
  v25[0] = v5;
  v25[1] = v8;
  v25[2] = v13;
  v25[3] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:4];
  v18 = [[HRSpeedBumpItem alloc] initWithTitle:v22 body:0 bubbles:v17 category:2];

  return v18;
}

- (void)viewControllerWillEnterAdaptiveModal
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x263F1C468]);
  v4 = (void *)MEMORY[0x263F1C3C0];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __94__HROnboardingAtrialFibrillationLimitationViewController_viewControllerWillEnterAdaptiveModal__block_invoke;
  objc_super v11 = &unk_264580E18;
  objc_copyWeak(&v12, &location);
  BOOL v5 = [v4 actionWithHandler:&v8];
  v6 = objc_msgSend(v3, "initWithBarButtonSystemItem:primaryAction:", 0, v5, v8, v9, v10, v11);

  v7 = [(HROnboardingAtrialFibrillationLimitationViewController *)self navigationItem];
  [v7 setLeftBarButtonItem:v6];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __94__HROnboardingAtrialFibrillationLimitationViewController_viewControllerWillEnterAdaptiveModal__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

- (void)viewControllerDidLeaveAdaptiveModal
{
  id v2 = [(HROnboardingAtrialFibrillationLimitationViewController *)self navigationItem];
  [v2 setLeftBarButtonItem:0];
}

@end