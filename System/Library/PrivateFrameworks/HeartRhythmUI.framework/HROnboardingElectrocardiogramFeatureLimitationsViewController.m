@interface HROnboardingElectrocardiogramFeatureLimitationsViewController
- (BOOL)_hasOnboardedBeforeWithStore:(id)a3;
- (id)_makeSpeedBumpItemForUpdateOnboarding:(BOOL)a3;
- (id)initForOnboarding:(BOOL)a3 upgradingFromAlgorithmVersion:(int64_t)a4;
- (void)setDelegate:(id)a3;
- (void)viewControllerDidLeaveAdaptiveModal;
- (void)viewControllerWillEnterAdaptiveModal;
@end

@implementation HROnboardingElectrocardiogramFeatureLimitationsViewController

- (id)initForOnboarding:(BOOL)a3 upgradingFromAlgorithmVersion:(int64_t)a4
{
  BOOL v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HROnboardingElectrocardiogramFeatureLimitationsViewController;
  v5 = [(HRSpeedBumpViewController *)&v9 initWithSpeedBumpItem:0 onboarding:a3 upgradingFromAlgorithmVersion:a4];
  v6 = v5;
  if (v5) {
    BOOL v7 = !v4;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7) {
    [(HKOnboardingBaseViewController *)v5 configureNavigationButtonWithTypeCancelWithConfirmForElectrocardiogram];
  }
  return v6;
}

- (void)setDelegate:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HROnboardingElectrocardiogramFeatureLimitationsViewController;
  id v4 = a3;
  [(HROnboardingElectrocardiogramFeatureLimitationsViewController *)&v8 setDelegate:v4];
  v5 = objc_msgSend(v4, "healthStore", v8.receiver, v8.super_class);

  BOOL v6 = [(HROnboardingElectrocardiogramFeatureLimitationsViewController *)self _hasOnboardedBeforeWithStore:v5];
  BOOL v7 = [(HROnboardingElectrocardiogramFeatureLimitationsViewController *)self _makeSpeedBumpItemForUpdateOnboarding:v6];
  [(HRSpeedBumpViewController *)self setItem:v7];
}

- (BOOL)_hasOnboardedBeforeWithStore:(id)a3
{
  id v4 = a3;
  if ([(HROnboardingElectrocardiogramFeatureLimitationsViewController *)self isOnboarding])
  {
    v5 = [MEMORY[0x263F0A348] versionWithHealthStore:v4 error:0];
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x263F0A3B8]);
    BOOL v7 = (void *)[v6 initWithFeatureIdentifier:*MEMORY[0x263F09740] healthStore:v4];
    id v12 = 0;
    objc_super v8 = [v7 featureOnboardingRecordWithError:&v12];
    id v9 = v12;
    if (!v8)
    {
      _HKInitializeLogging();
      v10 = *MEMORY[0x263F09920];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR)) {
        [(HROnboardingElectrocardiogramFeatureLimitationsViewController *)(uint64_t)self _hasOnboardedBeforeWithStore:v10];
      }
    }
    v5 = [v8 onboardingCompletion];
  }
  return v5 != 0;
}

- (id)_makeSpeedBumpItemForUpdateOnboarding:(BOOL)a3
{
  v19[4] = *MEMORY[0x263EF8340];
  if (a3) {
    v3 = @"ECG_V2_ONBOARDING_4_TITLE";
  }
  else {
    v3 = @"ECG_ONBOARDING_4_TITLE";
  }
  id v4 = HRUIECGLocalizedString(v3);
  v16 = HRUIECGLocalizedString(@"ECG_ONBOARDING_4_BODY");
  v18 = HRUIECGLocalizedString(@"ECG_ONBOARDING_4_LIST_CANNOT_DO_HEADING-1");
  v15 = HRUIECGLocalizedString(@"ECG_ONBOARDING_4_LIST_CANNOT_DO_HEADING-2");
  v14 = HRUIECGLocalizedString(@"ECG_ONBOARDING_4_LIST_CANNOT_DO_HEADING-3");
  v17 = HRUIECGLocalizedString(@"ECG_ONBOARDING_4_LIST_CANNOT_DO_BODY-1");
  v5 = [[HRSpeedBumpBubble alloc] initWithTitle:v18 description:v17];
  id v6 = [[HRSpeedBumpBubble alloc] initWithTitle:v15 description:0];
  BOOL v7 = HRUIECGLocalizedString(@"ECG_ONBOARDING_4_LIST_CANNOT_DO_BODY-3");
  objc_super v8 = [[HRSpeedBumpBubble alloc] initWithTitle:v14 description:v7];
  id v9 = HRUIECGLocalizedString(@"ECG_ONBOARDING_4_LIST_WARNING");
  v10 = [[HRSpeedBumpBubble alloc] initWithTitle:v9 description:0];
  v19[0] = v5;
  v19[1] = v6;
  v19[2] = v8;
  v19[3] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:4];
  id v12 = [[HRSpeedBumpItem alloc] initWithTitle:v4 body:v16 bubbles:v11 category:1];

  return v12;
}

- (void)viewControllerWillEnterAdaptiveModal
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x263F1C468]);
  id v4 = (void *)MEMORY[0x263F1C3C0];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __101__HROnboardingElectrocardiogramFeatureLimitationsViewController_viewControllerWillEnterAdaptiveModal__block_invoke;
  v11 = &unk_264580E18;
  objc_copyWeak(&v12, &location);
  v5 = [v4 actionWithHandler:&v8];
  id v6 = objc_msgSend(v3, "initWithBarButtonSystemItem:primaryAction:", 0, v5, v8, v9, v10, v11);

  BOOL v7 = [(HROnboardingElectrocardiogramFeatureLimitationsViewController *)self navigationItem];
  [v7 setLeftBarButtonItem:v6];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __101__HROnboardingElectrocardiogramFeatureLimitationsViewController_viewControllerWillEnterAdaptiveModal__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

- (void)viewControllerDidLeaveAdaptiveModal
{
  id v2 = [(HROnboardingElectrocardiogramFeatureLimitationsViewController *)self navigationItem];
  [v2 setLeftBarButtonItem:0];
}

- (void)_hasOnboardedBeforeWithStore:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_220CA3000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to get onboarding version completed with error: %@", (uint8_t *)&v3, 0x16u);
}

@end