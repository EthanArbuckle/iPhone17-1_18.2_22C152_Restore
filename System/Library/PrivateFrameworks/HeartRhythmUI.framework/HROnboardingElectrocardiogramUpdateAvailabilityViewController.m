@interface HROnboardingElectrocardiogramUpdateAvailabilityViewController
+ (void)markElectrocardiogramUpdateAsViewed:(id)a3;
- (HRElectrocardiogramCurrentLocationOnboardingDeterminer)onboardingAvailabilityDeterminer;
- (HRElectrocardiogramWatchAppInstallability)ecgAppInstallability;
- (HRStackedButtonView)stackedButtonView;
- (UILabel)bodyLabel;
- (UILabel)locationFooterLabel;
- (UILabel)titleLabel;
- (UIView)heroView;
- (double)_bodyBottomToLocationTop;
- (double)_locationFooterLastBaselineToContinueButton;
- (double)_titleBottomToBodyTop;
- (id)_bodyFont;
- (id)_bodyFontTextStyle;
- (id)_footnoteFont;
- (id)_footnoteTextStyle;
- (id)_titleFont;
- (id)_titleFontTextStyle;
- (id)bodyString;
- (id)buttonTitleString;
- (id)deviceNotSupportedBodyString;
- (id)featureDisabledBodyString;
- (id)initForOnboarding:(BOOL)a3 upgradingFromAlgorithmVersion:(int64_t)a4;
- (id)locationFeatureIneligiblePromptBodyString;
- (id)locationFooterString;
- (id)locationNotFoundPromptBodyString;
- (id)locationNotFoundPromptTitleString;
- (id)titleString;
- (id)updateFeatureIneligiblePromptBodyString;
- (id)watchOSVersionTooLowBodyString;
- (void)continueAndCheckForUpdateAvailability:(id)a3;
- (void)setBodyLabel:(id)a3;
- (void)setEcgAppInstallability:(id)a3;
- (void)setHeroView:(id)a3;
- (void)setLocationFooterLabel:(id)a3;
- (void)setOnboardingAvailabilityDeterminer:(id)a3;
- (void)setStackedButtonView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUpConstraints;
- (void)setUpUI;
- (void)stackedButtonView:(id)a3 didTapButtonAtIndex:(int64_t)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation HROnboardingElectrocardiogramUpdateAvailabilityViewController

- (id)initForOnboarding:(BOOL)a3 upgradingFromAlgorithmVersion:(int64_t)a4
{
  BOOL v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HROnboardingElectrocardiogramUpdateAvailabilityViewController;
  v5 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)&v10 initForOnboarding:a3 upgradingFromAlgorithmVersion:a4];
  v6 = v5;
  if (v5)
  {
    if (v4) {
      [v5 setRightButtonType:2];
    }
    v7 = objc_alloc_init(HRElectrocardiogramWatchAppInstallability);
    v8 = (void *)v6[135];
    v6[135] = v7;
  }
  return v6;
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HROnboardingElectrocardiogramUpdateAvailabilityViewController;
  [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)&v6 viewDidAppear:a3];
  BOOL v4 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self delegate];
  v5 = [v4 healthStore];
  +[HROnboardingElectrocardiogramUpdateAvailabilityViewController markElectrocardiogramUpdateAsViewed:v5];
}

- (void)setUpUI
{
  v33[1] = *MEMORY[0x263EF8340];
  v32.receiver = self;
  v32.super_class = (Class)HROnboardingElectrocardiogramUpdateAvailabilityViewController;
  [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)&v32 setUpUI];
  v3 = [[HROnboardingWristImageView alloc] initWithImageStyle:1];
  [(HROnboardingWristImageView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(HROnboardingWristImageView *)v3 setContentMode:1];
  [(HROnboardingWristImageView *)v3 setTimeRemaining:26.0];
  [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self setHeroView:v3];

  BOOL v4 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self contentView];
  v5 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self heroView];
  [v4 addSubview:v5];

  id v6 = objc_alloc(MEMORY[0x263F1C768]);
  double v7 = *MEMORY[0x263F001A8];
  double v8 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v9 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v10 = *(double *)(MEMORY[0x263F001A8] + 24);
  v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], v8, v9, v10);
  v12 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self titleString];
  [v11 setText:v12];

  [v11 setTextAlignment:1];
  v13 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self _titleFont];
  [v11 setFont:v13];

  [v11 setAdjustsFontForContentSizeCategory:1];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v11 setNumberOfLines:0];
  [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self setTitleLabel:v11];

  v14 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self contentView];
  v15 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self titleLabel];
  [v14 addSubview:v15];

  v16 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v7, v8, v9, v10);
  v17 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self bodyString];
  [v16 setText:v17];

  [v16 setTextAlignment:1];
  v18 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self _bodyFont];
  [v16 setFont:v18];

  [v16 setAdjustsFontForContentSizeCategory:1];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v16 setNumberOfLines:0];
  [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self setBodyLabel:v16];

  v19 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self contentView];
  v20 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self bodyLabel];
  [v19 addSubview:v20];

  v21 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v7, v8, v9, v10);
  v22 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self locationFooterString];
  [v21 setText:v22];

  [v21 setTextAlignment:1];
  v23 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self _footnoteFont];
  [v21 setFont:v23];

  v24 = [MEMORY[0x263F1C550] secondaryLabelColor];
  [v21 setTextColor:v24];

  [v21 setAdjustsFontForContentSizeCategory:1];
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v21 setNumberOfLines:0];
  [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self setLocationFooterLabel:v21];

  v25 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self contentView];
  v26 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self locationFooterLabel];
  [v25 addSubview:v26];

  v27 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self buttonTitleString];
  v33[0] = v27;
  v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:1];
  v29 = +[HRStackedButtonView buddyStackedButtonViewWithTitles:v28 footerText:0 boldFooterText:0 delegate:self];

  [v29 setFixedBottomButtonSpacing:1];
  [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v29 setBlurHidden:1];
  [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self setStackedButtonView:v29];

  v30 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self contentView];
  v31 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self stackedButtonView];
  [v30 addSubview:v31];
}

- (void)setUpConstraints
{
  v45.receiver = self;
  v45.super_class = (Class)HROnboardingElectrocardiogramUpdateAvailabilityViewController;
  [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)&v45 setUpConstraints];
  v3 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self heroView];
  BOOL v4 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self contentView];
  objc_msgSend(v3, "hk_alignHorizontalConstraintsWithView:margin:", v4, 0.0);

  v5 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self heroView];
  id v6 = [v5 topAnchor];
  double v7 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self contentView];
  double v8 = [v7 topAnchor];
  double v9 = [v6 constraintEqualToAnchor:v8];
  [v9 setActive:1];

  double v10 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self titleLabel];
  v11 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self contentView];
  HKHealthUIBuddyDirectionalEdgeInsets();
  objc_msgSend(v10, "hrui_alignHorizontalConstraintsWithView:insets:", v11);

  v12 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self titleLabel];
  v13 = [v12 topAnchor];
  v14 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self heroView];
  v15 = [v14 bottomAnchor];
  v16 = [v13 constraintEqualToAnchor:v15 constant:29.0];
  [v16 setActive:1];

  v17 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self bodyLabel];
  v18 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self titleLabel];
  objc_msgSend(v17, "hk_alignHorizontalConstraintsWithView:margin:", v18, 0.0);

  v19 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self bodyLabel];
  v20 = [v19 topAnchor];
  v21 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self titleLabel];
  v22 = [v21 bottomAnchor];
  [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self _titleBottomToBodyTop];
  v23 = objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22);
  [v23 setActive:1];

  v24 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self locationFooterLabel];
  v25 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self titleLabel];
  objc_msgSend(v24, "hk_alignHorizontalConstraintsWithView:insets:", v25, *MEMORY[0x263F1C228], *(double *)(MEMORY[0x263F1C228] + 8), *(double *)(MEMORY[0x263F1C228] + 16), *(double *)(MEMORY[0x263F1C228] + 24));

  v26 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self locationFooterLabel];
  v27 = [v26 topAnchor];
  v28 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self bodyLabel];
  v29 = [v28 bottomAnchor];
  [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self _bodyBottomToLocationTop];
  v30 = objc_msgSend(v27, "constraintEqualToAnchor:constant:", v29);
  [v30 setActive:1];

  v31 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self stackedButtonView];
  objc_super v32 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self titleLabel];
  objc_msgSend(v31, "hk_alignHorizontalConstraintsWithView:margin:", v32, 0.0);

  v33 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self stackedButtonView];
  v34 = [v33 topAnchor];
  v35 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self locationFooterLabel];
  v36 = [v35 lastBaselineAnchor];
  [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self _locationFooterLastBaselineToContinueButton];
  v37 = objc_msgSend(v34, "constraintEqualToAnchor:constant:", v36);
  [v37 setActive:1];

  v38 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self stackedButtonView];
  v39 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self contentView];
  [v38 alignBlurViewHorizontalConstraintsWithView:v39];

  v40 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self contentView];
  v41 = [v40 bottomAnchor];
  v42 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self stackedButtonView];
  v43 = [v42 bottomAnchor];
  v44 = [v41 constraintEqualToAnchor:v43];
  [v44 setActive:1];
}

+ (void)markElectrocardiogramUpdateAsViewed:(id)a3
{
  v5 = (void *)MEMORY[0x263EFF910];
  id v6 = a3;
  double v7 = [v5 date];
  double v8 = [MEMORY[0x263F0A470] safetyDefaultsDomainWithHealthStore:v6];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __101__HROnboardingElectrocardiogramUpdateAvailabilityViewController_markElectrocardiogramUpdateAsViewed___block_invoke;
  v10[3] = &unk_264581388;
  id v12 = a1;
  SEL v13 = a2;
  id v11 = v7;
  id v9 = v7;
  [v8 setDate:v9 forKey:@"ElectrocardiogramUpdateDateViewed" completion:v10];
}

void __101__HROnboardingElectrocardiogramUpdateAvailabilityViewController_markElectrocardiogramUpdateAsViewed___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x263F09920];
  BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      uint64_t v8 = a1[5];
      double v7 = (const char *)a1[6];
      id v9 = v5;
      double v10 = NSStringFromSelector(v7);
      int v15 = 138543874;
      uint64_t v16 = v8;
      __int16 v17 = 2114;
      v18 = v10;
      __int16 v19 = 2114;
      id v20 = v4;
      _os_log_impl(&dword_220CA3000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] Could not set viewed date: %{public}@", (uint8_t *)&v15, 0x20u);

LABEL_6:
    }
  }
  else if (v6)
  {
    uint64_t v12 = a1[5];
    id v11 = (const char *)a1[6];
    id v9 = v5;
    SEL v13 = NSStringFromSelector(v11);
    v14 = (void *)a1[4];
    int v15 = 138543874;
    uint64_t v16 = v12;
    __int16 v17 = 2114;
    v18 = v13;
    __int16 v19 = 2114;
    id v20 = v14;
    _os_log_impl(&dword_220CA3000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] Successfully set viewed date to %{public}@", (uint8_t *)&v15, 0x20u);

    goto LABEL_6;
  }
}

- (void)stackedButtonView:(id)a3 didTapButtonAtIndex:(int64_t)a4
{
  if (!a4)
  {
    BOOL v6 = [a3 buttons];
    id v7 = [v6 objectAtIndexedSubscript:0];

    [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self continueAndCheckForUpdateAvailability:v7];
  }
}

- (void)continueAndCheckForUpdateAvailability:(id)a3
{
  id v5 = a3;
  [v5 setEnabled:0];
  BOOL v6 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self onboardingAvailabilityDeterminer];

  if (!v6)
  {
    id v7 = [HRElectrocardiogramCurrentLocationOnboardingDeterminer alloc];
    uint64_t v8 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self delegate];
    id v9 = [v8 healthStore];
    double v10 = [(HRElectrocardiogramCurrentLocationOnboardingDeterminer *)v7 initWithHealthStore:v9];
    [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self setOnboardingAvailabilityDeterminer:v10];
  }
  id v11 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self onboardingAvailabilityDeterminer];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __103__HROnboardingElectrocardiogramUpdateAvailabilityViewController_continueAndCheckForUpdateAvailability___block_invoke;
  v13[3] = &unk_2645810E8;
  id v14 = v5;
  int v15 = self;
  SEL v16 = a2;
  id v12 = v5;
  [v11 isElectrocardiogramOnboardingAvailableInCurrentLocationForActiveWatch:v13];
}

void __103__HROnboardingElectrocardiogramUpdateAvailabilityViewController_continueAndCheckForUpdateAvailability___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __103__HROnboardingElectrocardiogramUpdateAvailabilityViewController_continueAndCheckForUpdateAvailability___block_invoke_2;
  v14[3] = &unk_2645810C0;
  id v15 = *(id *)(a1 + 32);
  id v16 = v9;
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v17 = *(void *)(a1 + 40);
  id v18 = v8;
  id v19 = v7;
  uint64_t v20 = v10;
  id v11 = v7;
  id v12 = v8;
  id v13 = v9;
  dispatch_async(MEMORY[0x263EF83A0], v14);
}

void __103__HROnboardingElectrocardiogramUpdateAvailabilityViewController_continueAndCheckForUpdateAvailability___block_invoke_2(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setEnabled:1];
  v3 = (id *)(a1 + 40);
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    if ([v2 code] == 111)
    {
      uint64_t v4 = *(void **)(a1 + 48);
      id v5 = [v4 featureDisabledBodyString];
      [v4 presentLearnMoreAlertWithMessage:v5 learnMoreTapped:&__block_literal_global_3];
    }
    else if ([*v3 code] == 109)
    {
      id v16 = *(void **)(a1 + 48);
      id v5 = [v16 locationNotFoundPromptBodyString];
      uint64_t v17 = [*(id *)(a1 + 48) locationNotFoundPromptTitleString];
      [v16 presentAlertWithMessage:v5 title:v17];
    }
    else
    {
      if ([*v3 code] == 113)
      {
        uint64_t v20 = *(void **)(a1 + 48);
        uint64_t v21 = [v20 watchOSVersionTooLowBodyString];
      }
      else
      {
        uint64_t v22 = [*(id *)(a1 + 40) code];
        uint64_t v20 = *(void **)(a1 + 48);
        if (v22 == 112) {
          [*(id *)(a1 + 48) deviceNotSupportedBodyString];
        }
        else {
        uint64_t v21 = [*(id *)(a1 + 48) locationFeatureIneligiblePromptBodyString];
        }
      }
      id v5 = (void *)v21;
      [v20 presentAlertWithMessage:v21];
    }

    _HKInitializeLogging();
    v23 = (void *)*MEMORY[0x263F09920];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR)) {
      __103__HROnboardingElectrocardiogramUpdateAvailabilityViewController_continueAndCheckForUpdateAvailability___block_invoke_2_cold_1(a1, v23, (uint64_t *)(a1 + 40));
    }
  }
  else
  {
    BOOL v6 = *(void **)(a1 + 56);
    id v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "upgradingFromAlgorithmVersion"));
    LODWORD(v6) = [v6 isEqualToNumber:v7];

    id v8 = *(void **)(a1 + 48);
    if (v6)
    {
      id v9 = [*(id *)(a1 + 48) updateFeatureIneligiblePromptBodyString];
      [v8 presentAlertWithMessage:v9];

      _HKInitializeLogging();
      uint64_t v10 = (void *)*MEMORY[0x263F09920];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = *(void *)(a1 + 48);
        id v12 = *(const char **)(a1 + 72);
        id v13 = v10;
        id v14 = NSStringFromSelector(v12);
        uint64_t v15 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        uint64_t v28 = v11;
        __int16 v29 = 2114;
        v30 = v14;
        __int16 v31 = 2114;
        uint64_t v32 = v15;
        _os_log_error_impl(&dword_220CA3000, v13, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] No update available, Error: %{public}@", buf, 0x20u);
      }
    }
    else
    {
      id v18 = [*(id *)(a1 + 48) ecgAppInstallability];
      uint64_t v19 = *(void *)(a1 + 48);
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __103__HROnboardingElectrocardiogramUpdateAvailabilityViewController_continueAndCheckForUpdateAvailability___block_invoke_297;
      v24[3] = &unk_264581098;
      v24[4] = v19;
      id v25 = *(id *)(a1 + 64);
      id v26 = *(id *)(a1 + 56);
      [v18 checkElectrocardiogramAppInstallStateWithContext:v19 completion:v24];
    }
  }
}

void __103__HROnboardingElectrocardiogramUpdateAvailabilityViewController_continueAndCheckForUpdateAvailability___block_invoke_3()
{
  id v1 = [NSURL URLWithString:*MEMORY[0x263F09538]];
  v0 = [MEMORY[0x263F01880] defaultWorkspace];
  [v0 openURL:v1 withOptions:0];
}

void __103__HROnboardingElectrocardiogramUpdateAvailabilityViewController_continueAndCheckForUpdateAvailability___block_invoke_297(uint64_t a1, int a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!a2)
  {
    _HKInitializeLogging();
    id v14 = *MEMORY[0x263F09920];
    BOOL v15 = os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (!v15) {
        goto LABEL_9;
      }
      int v19 = 136446466;
      uint64_t v20 = "-[HROnboardingElectrocardiogramUpdateAvailabilityViewController continueAndCheckForUpdateAvailability:]_block_invoke";
      __int16 v21 = 2114;
      id v22 = v5;
      id v16 = "[%{public}s]: Failed to install ECG App with error: %{public}@";
      uint64_t v17 = v14;
      uint32_t v18 = 22;
    }
    else
    {
      if (!v15) {
        goto LABEL_9;
      }
      int v19 = 136446210;
      uint64_t v20 = "-[HROnboardingElectrocardiogramUpdateAvailabilityViewController continueAndCheckForUpdateAvailability:]_block_invoke";
      id v16 = "[%{public}s]: ECG App install was cancelled";
      uint64_t v17 = v14;
      uint32_t v18 = 12;
    }
    _os_log_impl(&dword_220CA3000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v19, v18);
    goto LABEL_9;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) delegate];
  id v8 = [v7 userInfo];
  [v8 setObject:v6 forKeyedSubscript:@"HROnboardingElectrocardiogramCountryCodeKey"];

  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = [*(id *)(a1 + 32) delegate];
  uint64_t v11 = [v10 userInfo];
  [v11 setObject:v9 forKeyedSubscript:@"HROnboardingElectrocardiogramAlgorithmVersionKey"];

  id v12 = [*(id *)(a1 + 32) delegate];
  [v12 stepForward];

  id v13 = [*(id *)(a1 + 32) ecgAppInstallability];
  [v13 setAllowInstallingElectrocardiogramWatchApp:1];

LABEL_9:
}

- (id)_titleFontTextStyle
{
  return (id)*MEMORY[0x263F1D2B0];
}

- (id)_titleFont
{
  v2 = (void *)MEMORY[0x263F1C658];
  v3 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self _titleFontTextStyle];
  uint64_t v4 = objc_msgSend(v2, "hk_scalableFontForTextStyle:symbolicTraits:", v3, 32770);

  return v4;
}

- (id)_bodyFontTextStyle
{
  return (id)*MEMORY[0x263F1D260];
}

- (id)_bodyFont
{
  v2 = (void *)MEMORY[0x263F1C658];
  v3 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self _bodyFontTextStyle];
  uint64_t v4 = [v2 preferredFontForTextStyle:v3];

  return v4;
}

- (id)_footnoteTextStyle
{
  return (id)*MEMORY[0x263F1D280];
}

- (id)_footnoteFont
{
  v2 = (void *)MEMORY[0x263F1C658];
  v3 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self _footnoteTextStyle];
  uint64_t v4 = [v2 preferredFontForTextStyle:v3];

  return v4;
}

- (double)_titleBottomToBodyTop
{
  v2 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self _bodyFont];
  [v2 _scaledValueForValue:15.0];
  double v4 = v3;

  return v4;
}

- (double)_bodyBottomToLocationTop
{
  v2 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self _bodyFont];
  [v2 _scaledValueForValue:37.0];
  double v4 = v3;

  return v4;
}

- (double)_locationFooterLastBaselineToContinueButton
{
  v2 = [(HROnboardingElectrocardiogramUpdateAvailabilityViewController *)self _bodyFont];
  [v2 _scaledValueForValue:6.0];
  double v4 = v3;

  return v4;
}

- (id)titleString
{
  return HRUIECGLocalizedString(@"ECG_V2_ONBOARDING_3_UPDATE_SECTION_1_TITLE");
}

- (id)bodyString
{
  return HRUIECGLocalizedString(@"ECG_V2_ONBOARDING_3_UPDATE_SECTION_1_BODY");
}

- (id)locationFooterString
{
  return HRUIECGLocalizedString(@"ECG_V2_ONBOARDING_3_UPDATE_LOCATION_FOOTNOTE");
}

- (id)buttonTitleString
{
  v2 = HRHeartRhythmUIFrameworkBundle();
  double v3 = [v2 localizedStringForKey:@"ONBOARDING_CONTINUE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable"];

  return v3;
}

- (id)locationFeatureIneligiblePromptBodyString
{
  v2 = HRHeartRhythmUIFrameworkBundle();
  double v3 = [v2 localizedStringForKey:@"ECG_ONBOARDING_1_LOCATION_INELIGIBLE_BODY" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Shared"];

  return v3;
}

- (id)locationNotFoundPromptTitleString
{
  v2 = HRHeartRhythmUIFrameworkBundle();
  double v3 = [v2 localizedStringForKey:@"ECG_ONBOARDING_1_LOCATION_NOT_FOUND_TITLE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Shared"];

  return v3;
}

- (id)locationNotFoundPromptBodyString
{
  v2 = HRHeartRhythmUIFrameworkBundle();
  double v3 = [v2 localizedStringForKey:@"ECG_ONBOARDING_1_LOCATION_NOT_FOUND_BODY" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Shared"];

  return v3;
}

- (id)updateFeatureIneligiblePromptBodyString
{
  return HRUIECGLocalizedString(@"ECG_ONBOARDING_1_UPDATE_INELIGIBLE_BODY");
}

- (id)featureDisabledBodyString
{
  v2 = HRHeartRhythmUIFrameworkBundle();
  double v3 = [v2 localizedStringForKey:@"ECG_ONBOARDING_1_FEATURE_DISABLED_BODY" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Shared"];

  return v3;
}

- (id)deviceNotSupportedBodyString
{
  v2 = HRHeartRhythmUIFrameworkBundle();
  double v3 = [v2 localizedStringForKey:@"ECG_ONBOARDING_1_DEVICE_NOT_SUPPORTED_BODY" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Shared"];

  return v3;
}

- (id)watchOSVersionTooLowBodyString
{
  v2 = HRHeartRhythmUIFrameworkBundle();
  double v3 = [v2 localizedStringForKey:@"ECG_ONBOARDING_1_OS_VERSION_TOO_LOW" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Shared"];

  return v3;
}

- (HRElectrocardiogramCurrentLocationOnboardingDeterminer)onboardingAvailabilityDeterminer
{
  return self->_onboardingAvailabilityDeterminer;
}

- (void)setOnboardingAvailabilityDeterminer:(id)a3
{
}

- (HRElectrocardiogramWatchAppInstallability)ecgAppInstallability
{
  return self->_ecgAppInstallability;
}

- (void)setEcgAppInstallability:(id)a3
{
}

- (UIView)heroView
{
  return self->_heroView;
}

- (void)setHeroView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void)setBodyLabel:(id)a3
{
}

- (UILabel)locationFooterLabel
{
  return self->_locationFooterLabel;
}

- (void)setLocationFooterLabel:(id)a3
{
}

- (HRStackedButtonView)stackedButtonView
{
  return self->_stackedButtonView;
}

- (void)setStackedButtonView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackedButtonView, 0);
  objc_storeStrong((id *)&self->_locationFooterLabel, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_heroView, 0);
  objc_storeStrong((id *)&self->_ecgAppInstallability, 0);
  objc_storeStrong((id *)&self->_onboardingAvailabilityDeterminer, 0);
}

void __103__HROnboardingElectrocardiogramUpdateAvailabilityViewController_continueAndCheckForUpdateAvailability___block_invoke_2_cold_1(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = *(const char **)(a1 + 72);
  uint64_t v6 = a2;
  id v7 = NSStringFromSelector(v5);
  uint64_t v8 = *a3;
  int v9 = 138543874;
  uint64_t v10 = v4;
  __int16 v11 = 2114;
  id v12 = v7;
  __int16 v13 = 2114;
  uint64_t v14 = v8;
  _os_log_error_impl(&dword_220CA3000, v6, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] Could not pass location check, Error: %{public}@", (uint8_t *)&v9, 0x20u);
}

@end