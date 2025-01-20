@interface HROnboardingAtrialFibrillationIntroViewController
- (BOOL)learnMoreContentExpanded;
- (HKAnalyticsEventSubmissionManager)analyticsEventSubmissionManager;
- (HRStackedButtonView)stackedButtonView;
- (NSArray)learnMoreCollapsedConstraints;
- (NSArray)learnMoreExpandedConstraints;
- (NSLayoutConstraint)contentViewBottomConstraint;
- (NSNumber)activeWatchNeedsLocationCheck;
- (UIButton)learnMoreButton;
- (UILabel)bodyLabel;
- (UILabel)footnoteLabel;
- (UILabel)titleLabel;
- (UIView)heroView;
- (UIView)learnMoreContentView;
- (double)_assetImageBottomToTitleFirstBaseline;
- (double)_footnoteLeading;
- (double)_learnMoreContentViewLastBaselineToContinueButton;
- (double)_titleLastBaselineToBodyFirstBaseline;
- (double)_viewLastBaselineToContinueButton;
- (id)_bodyFont;
- (id)_bodyFontTextStyle;
- (id)_createHeroView;
- (id)_createLearnMoreExpandedView;
- (id)_footnoteFont;
- (id)_footnoteTextStyle;
- (id)_titleFont;
- (id)_titleFontTextStyle;
- (id)axidForElementWithString:(id)a3;
- (id)bodyString;
- (id)buttonTitleString;
- (id)featureDisabledBodyString;
- (id)footnoteString;
- (id)initForOnboarding:(BOOL)a3 upgradingFromAlgorithmVersion:(int64_t)a4;
- (id)learnMoreString;
- (id)locationFeatureAlertAckButtonString;
- (id)locationFeatureIneligiblePromptBodyString;
- (id)locationNotFoundPromptMessageString;
- (id)locationNotFoundPromptTitleString;
- (id)seedExpiredBodyString;
- (id)titleString;
- (id)watchOSVersionTooLowBodyString;
- (void)_isAtrialFibrillationDetectionOnboardingAvailableInCurrentLocationForActiveWatch:(id)a3;
- (void)_presentFeatureAlertWithMessage:(id)a3;
- (void)_presentLocationNotFoundAlert;
- (void)_setStackedButtonViewAsFooterView;
- (void)_setUpLearnMoreConstraints;
- (void)_setUpLearnMoreViews;
- (void)_setUpStackedButtonView;
- (void)_submitOnboardingUIErrorEventWithCountryCode:(id)a3 onboardingEligibility:(id)a4;
- (void)_updateViewsForContentExpansionState:(BOOL)a3;
- (void)learnMoreButtonTapped:(id)a3;
- (void)presentLearnMoreAlertWithFeatureDisabledMessage;
- (void)setActiveWatchNeedsLocationCheck:(id)a3;
- (void)setAnalyticsEventSubmissionManager:(id)a3;
- (void)setBodyLabel:(id)a3;
- (void)setContentViewBottomConstraint:(id)a3;
- (void)setFootnoteLabel:(id)a3;
- (void)setHeroView:(id)a3;
- (void)setLearnMoreButton:(id)a3;
- (void)setLearnMoreCollapsedConstraints:(id)a3;
- (void)setLearnMoreContentExpanded:(BOOL)a3;
- (void)setLearnMoreContentView:(id)a3;
- (void)setLearnMoreExpandedConstraints:(id)a3;
- (void)setStackedButtonView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUpConstraints;
- (void)setUpUI;
- (void)stackedButtonView:(id)a3 didTapButtonAtIndex:(int64_t)a4;
@end

@implementation HROnboardingAtrialFibrillationIntroViewController

- (id)initForOnboarding:(BOOL)a3 upgradingFromAlgorithmVersion:(int64_t)a4
{
  BOOL v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HROnboardingAtrialFibrillationIntroViewController;
  id v5 = [(HROnboardingAtrialFibrillationIntroViewController *)&v9 initForOnboarding:a3 upgradingFromAlgorithmVersion:a4];
  v6 = v5;
  if (v5) {
    BOOL v7 = !v4;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7) {
    [v5 setRightButtonType:2];
  }
  return v6;
}

- (void)setUpUI
{
  v44.receiver = self;
  v44.super_class = (Class)HROnboardingAtrialFibrillationIntroViewController;
  [(HROnboardingAtrialFibrillationIntroViewController *)&v44 setUpUI];
  v3 = [(HROnboardingAtrialFibrillationIntroViewController *)self _createHeroView];
  [(HROnboardingAtrialFibrillationIntroViewController *)self setHeroView:v3];

  BOOL v4 = [(HROnboardingAtrialFibrillationIntroViewController *)self heroView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v5 = [(HROnboardingAtrialFibrillationIntroViewController *)self contentView];
  v6 = [(HROnboardingAtrialFibrillationIntroViewController *)self heroView];
  [v5 addSubview:v6];

  id v7 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HROnboardingAtrialFibrillationIntroViewController *)self setTitleLabel:v7];

  v8 = [(HROnboardingAtrialFibrillationIntroViewController *)self titleString];
  objc_super v9 = [(HROnboardingAtrialFibrillationIntroViewController *)self titleLabel];
  [v9 setText:v8];

  v10 = [(HROnboardingAtrialFibrillationIntroViewController *)self titleLabel];
  [v10 setTextAlignment:1];

  v11 = [(HROnboardingAtrialFibrillationIntroViewController *)self _titleFont];
  v12 = [(HROnboardingAtrialFibrillationIntroViewController *)self titleLabel];
  [v12 setFont:v11];

  v13 = [(HROnboardingAtrialFibrillationIntroViewController *)self titleLabel];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

  v14 = [(HROnboardingAtrialFibrillationIntroViewController *)self titleLabel];
  [v14 setNumberOfLines:0];

  v15 = [(HROnboardingAtrialFibrillationIntroViewController *)self axidForElementWithString:@"PageTitle"];
  v16 = [(HROnboardingAtrialFibrillationIntroViewController *)self titleLabel];
  [v16 setAccessibilityIdentifier:v15];

  v17 = [(HROnboardingAtrialFibrillationIntroViewController *)self contentView];
  v18 = [(HROnboardingAtrialFibrillationIntroViewController *)self titleLabel];
  [v17 addSubview:v18];

  id v19 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HROnboardingAtrialFibrillationIntroViewController *)self setBodyLabel:v19];

  v20 = [(HROnboardingAtrialFibrillationIntroViewController *)self bodyString];
  v21 = [(HROnboardingAtrialFibrillationIntroViewController *)self bodyLabel];
  [v21 setText:v20];

  v22 = [(HROnboardingAtrialFibrillationIntroViewController *)self _bodyFont];
  v23 = [(HROnboardingAtrialFibrillationIntroViewController *)self bodyLabel];
  [v23 setFont:v22];

  v24 = [(HROnboardingAtrialFibrillationIntroViewController *)self bodyLabel];
  [v24 setTranslatesAutoresizingMaskIntoConstraints:0];

  v25 = [(HROnboardingAtrialFibrillationIntroViewController *)self bodyLabel];
  [v25 setNumberOfLines:0];

  v26 = [(HROnboardingAtrialFibrillationIntroViewController *)self axidForElementWithString:@"Description"];
  v27 = [(HROnboardingAtrialFibrillationIntroViewController *)self bodyLabel];
  [v27 setAccessibilityIdentifier:v26];

  v28 = [(HROnboardingAtrialFibrillationIntroViewController *)self contentView];
  v29 = [(HROnboardingAtrialFibrillationIntroViewController *)self bodyLabel];
  [v28 addSubview:v29];

  id v30 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HROnboardingAtrialFibrillationIntroViewController *)self setFootnoteLabel:v30];

  v31 = [(HROnboardingAtrialFibrillationIntroViewController *)self footnoteString];
  v32 = [(HROnboardingAtrialFibrillationIntroViewController *)self footnoteLabel];
  [v32 setText:v31];

  v33 = [(HROnboardingAtrialFibrillationIntroViewController *)self footnoteLabel];
  [v33 setTextAlignment:1];

  v34 = [MEMORY[0x263F1C550] secondaryLabelColor];
  v35 = [(HROnboardingAtrialFibrillationIntroViewController *)self footnoteLabel];
  [v35 setTextColor:v34];

  v36 = [(HROnboardingAtrialFibrillationIntroViewController *)self _footnoteFont];
  v37 = [(HROnboardingAtrialFibrillationIntroViewController *)self footnoteLabel];
  [v37 setFont:v36];

  v38 = [(HROnboardingAtrialFibrillationIntroViewController *)self footnoteLabel];
  [v38 setTranslatesAutoresizingMaskIntoConstraints:0];

  v39 = [(HROnboardingAtrialFibrillationIntroViewController *)self footnoteLabel];
  [v39 setNumberOfLines:0];

  v40 = [(HROnboardingAtrialFibrillationIntroViewController *)self axidForElementWithString:@"SetupLocation"];
  v41 = [(HROnboardingAtrialFibrillationIntroViewController *)self footnoteLabel];
  [v41 setAccessibilityIdentifier:v40];

  v42 = [(HROnboardingAtrialFibrillationIntroViewController *)self contentView];
  v43 = [(HROnboardingAtrialFibrillationIntroViewController *)self footnoteLabel];
  [v42 addSubview:v43];

  [(HROnboardingAtrialFibrillationIntroViewController *)self _setUpLearnMoreViews];
  [(HROnboardingAtrialFibrillationIntroViewController *)self _setUpStackedButtonView];
}

- (void)setUpConstraints
{
  v35.receiver = self;
  v35.super_class = (Class)HROnboardingAtrialFibrillationIntroViewController;
  [(HROnboardingAtrialFibrillationIntroViewController *)&v35 setUpConstraints];
  v3 = [(HROnboardingAtrialFibrillationIntroViewController *)self heroView];
  BOOL v4 = [(HROnboardingAtrialFibrillationIntroViewController *)self contentView];
  objc_msgSend(v3, "hk_alignHorizontalConstraintsWithView:margin:", v4, 0.0);

  id v5 = [(HROnboardingAtrialFibrillationIntroViewController *)self heroView];
  v6 = [v5 topAnchor];
  id v7 = [(HROnboardingAtrialFibrillationIntroViewController *)self contentView];
  v8 = [v7 topAnchor];
  objc_super v9 = [v6 constraintEqualToAnchor:v8 constant:16.0];
  [v9 setActive:1];

  v10 = [(HROnboardingAtrialFibrillationIntroViewController *)self titleLabel];
  v11 = [(HROnboardingAtrialFibrillationIntroViewController *)self contentView];
  HKHealthUIBuddyDirectionalEdgeInsets();
  objc_msgSend(v10, "hrui_alignHorizontalConstraintsWithView:insets:", v11);

  v12 = [(HROnboardingAtrialFibrillationIntroViewController *)self titleLabel];
  v13 = [v12 firstBaselineAnchor];
  v14 = [(HROnboardingAtrialFibrillationIntroViewController *)self heroView];
  v15 = [v14 bottomAnchor];
  [(HROnboardingAtrialFibrillationIntroViewController *)self _assetImageBottomToTitleFirstBaseline];
  v16 = objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15);
  [v16 setActive:1];

  v17 = [(HROnboardingAtrialFibrillationIntroViewController *)self bodyLabel];
  v18 = [(HROnboardingAtrialFibrillationIntroViewController *)self titleLabel];
  objc_msgSend(v17, "hk_alignHorizontalConstraintsWithView:margin:", v18, 0.0);

  id v19 = [(HROnboardingAtrialFibrillationIntroViewController *)self bodyLabel];
  v20 = [v19 firstBaselineAnchor];
  v21 = [(HROnboardingAtrialFibrillationIntroViewController *)self titleLabel];
  v22 = [v21 lastBaselineAnchor];
  [(HROnboardingAtrialFibrillationIntroViewController *)self _titleLastBaselineToBodyFirstBaseline];
  v23 = objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22);
  [v23 setActive:1];

  v24 = [(HROnboardingAtrialFibrillationIntroViewController *)self footnoteLabel];
  v25 = [(HROnboardingAtrialFibrillationIntroViewController *)self titleLabel];
  objc_msgSend(v24, "hk_alignHorizontalConstraintsWithView:margin:", v25, 0.0);

  v26 = [(HROnboardingAtrialFibrillationIntroViewController *)self stackedButtonView];
  v27 = [(HROnboardingAtrialFibrillationIntroViewController *)self titleLabel];
  objc_msgSend(v26, "hk_alignHorizontalConstraintsWithView:margin:", v27, 0.0);

  v28 = [(HROnboardingAtrialFibrillationIntroViewController *)self stackedButtonView];
  v29 = [(HROnboardingAtrialFibrillationIntroViewController *)self contentView];
  [v28 alignBlurViewHorizontalConstraintsWithView:v29];

  [(HROnboardingAtrialFibrillationIntroViewController *)self _setUpLearnMoreConstraints];
  id v30 = [(HROnboardingAtrialFibrillationIntroViewController *)self contentView];
  v31 = [v30 bottomAnchor];
  v32 = [(HROnboardingAtrialFibrillationIntroViewController *)self stackedButtonView];
  v33 = [v32 bottomAnchor];
  v34 = [v31 constraintEqualToAnchor:v33];
  [v34 setActive:1];
}

- (HKAnalyticsEventSubmissionManager)analyticsEventSubmissionManager
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v3 = [(HROnboardingAtrialFibrillationIntroViewController *)self delegate];
  BOOL v4 = [v3 healthStore];

  analyticsEventSubmissionManager = self->_analyticsEventSubmissionManager;
  if (analyticsEventSubmissionManager) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  if (!v6)
  {
    id v7 = objc_alloc(MEMORY[0x263F0A0C0]);
    v8 = (HKAnalyticsEventSubmissionManager *)[v7 initWithLoggingCategory:*MEMORY[0x263F09920] healthDataSource:v4];
    objc_super v9 = self->_analyticsEventSubmissionManager;
    self->_analyticsEventSubmissionManager = v8;

    analyticsEventSubmissionManager = self->_analyticsEventSubmissionManager;
  }
  v10 = analyticsEventSubmissionManager;

  return v10;
}

- (void)_submitOnboardingUIErrorEventWithCountryCode:(id)a3 onboardingEligibility:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __120__HROnboardingAtrialFibrillationIntroViewController__submitOnboardingUIErrorEventWithCountryCode_onboardingEligibility___block_invoke;
  block[3] = &unk_264581210;
  id v11 = v6;
  id v12 = v7;
  v13 = self;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __120__HROnboardingAtrialFibrillationIntroViewController__submitOnboardingUIErrorEventWithCountryCode_onboardingEligibility___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F468A0]);
  uint64_t v3 = *MEMORY[0x263F09778];
  BOOL v4 = [*(id *)(a1 + 32) ISOCode];
  id v5 = (void *)[v2 initWithFeatureIdentifier:v3 featureVersion:@"1" countryCode:v4 step:@"Intro" onboardingEligibility:*(void *)(a1 + 40)];

  id v7 = *(void **)(a1 + 48);
  uint64_t v6 = a1 + 48;
  id v8 = [v7 analyticsEventSubmissionManager];
  id v12 = 0;
  char v9 = [v8 submitEvent:v5 error:&v12];
  id v10 = v12;

  if ((v9 & 1) == 0)
  {
    _HKInitializeLogging();
    id v11 = (void *)*MEMORY[0x263F09920];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR)) {
      __120__HROnboardingAtrialFibrillationIntroViewController__submitOnboardingUIErrorEventWithCountryCode_onboardingEligibility___block_invoke_cold_1(v6, v11, (uint64_t)v10);
    }
  }
}

- (id)_createHeroView
{
  v13[2] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F1CB60]);
  uint64_t v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  BOOL v4 = objc_alloc_init(HRSimulatedAtrialFibrillationNotificationView);
  [v3 addSubview:v4];
  [(HRSimulatedAtrialFibrillationNotificationView *)v4 hk_alignVerticalConstraintsWithView:v3 margin:0.0];
  id v5 = (void *)MEMORY[0x263F08938];
  uint64_t v6 = [(HRSimulatedAtrialFibrillationNotificationView *)v4 widthAnchor];
  id v7 = [v6 constraintEqualToConstant:160.0];
  v13[0] = v7;
  id v8 = [(HRSimulatedAtrialFibrillationNotificationView *)v4 centerXAnchor];
  char v9 = [v3 centerXAnchor];
  id v10 = [v8 constraintEqualToAnchor:v9];
  v13[1] = v10;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  [v5 activateConstraints:v11];

  return v3;
}

- (id)_createLearnMoreExpandedView
{
  return +[HROnboardingInlineExpandedContentView learnMoreAboutAtrialFibrillationExpandedView];
}

- (void)_setUpLearnMoreViews
{
  uint64_t v3 = [(HROnboardingAtrialFibrillationIntroViewController *)self learnMoreString];

  if (v3)
  {
    BOOL v4 = [MEMORY[0x263F1C488] buttonWithType:1];
    [(HROnboardingAtrialFibrillationIntroViewController *)self setLearnMoreButton:v4];

    id v5 = [(HROnboardingAtrialFibrillationIntroViewController *)self learnMoreButton];
    uint64_t v6 = [(HROnboardingAtrialFibrillationIntroViewController *)self learnMoreString];
    [v5 setTitle:v6 forState:0];

    id v7 = [(HROnboardingAtrialFibrillationIntroViewController *)self _bodyFont];
    id v8 = [(HROnboardingAtrialFibrillationIntroViewController *)self learnMoreButton];
    char v9 = [v8 titleLabel];
    [v9 setFont:v7];

    id v10 = [(HROnboardingAtrialFibrillationIntroViewController *)self learnMoreButton];
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v11 = [(HROnboardingAtrialFibrillationIntroViewController *)self learnMoreButton];
    id v12 = [v11 titleLabel];
    [v12 setNumberOfLines:0];

    v13 = [(HROnboardingAtrialFibrillationIntroViewController *)self learnMoreButton];
    [v13 addTarget:self action:sel_learnMoreButtonTapped_ forControlEvents:64];

    v14 = [(HROnboardingAtrialFibrillationIntroViewController *)self axidForElementWithString:@"AFibLearnMoreLink"];
    v15 = [(HROnboardingAtrialFibrillationIntroViewController *)self learnMoreButton];
    [v15 setAccessibilityIdentifier:v14];

    v16 = [(HROnboardingAtrialFibrillationIntroViewController *)self contentView];
    v17 = [(HROnboardingAtrialFibrillationIntroViewController *)self learnMoreButton];
    [v16 addSubview:v17];

    v18 = [(HROnboardingAtrialFibrillationIntroViewController *)self learnMoreButton];
    LODWORD(v19) = 1148846080;
    [v18 setContentHuggingPriority:0 forAxis:v19];

    v20 = [(HROnboardingAtrialFibrillationIntroViewController *)self _createLearnMoreExpandedView];
    [(HROnboardingAtrialFibrillationIntroViewController *)self setLearnMoreContentView:v20];

    id v22 = [(HROnboardingAtrialFibrillationIntroViewController *)self contentView];
    v21 = [(HROnboardingAtrialFibrillationIntroViewController *)self learnMoreContentView];
    [v22 addSubview:v21];
  }
}

- (void)_setUpLearnMoreConstraints
{
  v56[5] = *MEMORY[0x263EF8340];
  v53 = [(HROnboardingAtrialFibrillationIntroViewController *)self learnMoreButton];
  v49 = [v53 leadingAnchor];
  v51 = [(HROnboardingAtrialFibrillationIntroViewController *)self titleLabel];
  v47 = [v51 leadingAnchor];
  v45 = [v49 constraintEqualToAnchor:v47];
  v56[0] = v45;
  v43 = [(HROnboardingAtrialFibrillationIntroViewController *)self learnMoreButton];
  v39 = [v43 trailingAnchor];
  v41 = [(HROnboardingAtrialFibrillationIntroViewController *)self titleLabel];
  v37 = [v41 trailingAnchor];
  objc_super v35 = [v39 constraintLessThanOrEqualToAnchor:v37];
  v56[1] = v35;
  v33 = [(HROnboardingAtrialFibrillationIntroViewController *)self learnMoreButton];
  v29 = [v33 firstBaselineAnchor];
  v31 = [(HROnboardingAtrialFibrillationIntroViewController *)self bodyLabel];
  v27 = [v31 bottomAnchor];
  [(HROnboardingAtrialFibrillationIntroViewController *)self _titleLastBaselineToBodyFirstBaseline];
  v25 = objc_msgSend(v29, "constraintEqualToAnchor:constant:", v27);
  v56[2] = v25;
  v23 = [(HROnboardingAtrialFibrillationIntroViewController *)self footnoteLabel];
  v21 = [v23 firstBaselineAnchor];
  uint64_t v3 = [(HROnboardingAtrialFibrillationIntroViewController *)self learnMoreButton];
  BOOL v4 = [v3 lastBaselineAnchor];
  [(HROnboardingAtrialFibrillationIntroViewController *)self _footnoteLeading];
  id v5 = objc_msgSend(v21, "constraintEqualToAnchor:constant:", v4);
  v56[3] = v5;
  uint64_t v6 = [(HROnboardingAtrialFibrillationIntroViewController *)self stackedButtonView];
  id v7 = [v6 topAnchor];
  id v8 = [(HROnboardingAtrialFibrillationIntroViewController *)self footnoteLabel];
  char v9 = [v8 lastBaselineAnchor];
  [(HROnboardingAtrialFibrillationIntroViewController *)self _viewLastBaselineToContinueButton];
  id v10 = objc_msgSend(v7, "constraintEqualToAnchor:constant:", v9);
  v56[4] = v10;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:5];
  [(HROnboardingAtrialFibrillationIntroViewController *)self setLearnMoreCollapsedConstraints:v11];

  v54 = [(HROnboardingAtrialFibrillationIntroViewController *)self learnMoreContentView];
  v50 = [v54 leadingAnchor];
  v52 = [(HROnboardingAtrialFibrillationIntroViewController *)self titleLabel];
  v48 = [v52 leadingAnchor];
  v46 = [v50 constraintEqualToAnchor:v48];
  v55[0] = v46;
  objc_super v44 = [(HROnboardingAtrialFibrillationIntroViewController *)self learnMoreContentView];
  v40 = [v44 trailingAnchor];
  v42 = [(HROnboardingAtrialFibrillationIntroViewController *)self titleLabel];
  v38 = [v42 trailingAnchor];
  v36 = [v40 constraintEqualToAnchor:v38];
  v55[1] = v36;
  v34 = [(HROnboardingAtrialFibrillationIntroViewController *)self learnMoreContentView];
  id v30 = [v34 topAnchor];
  v32 = [(HROnboardingAtrialFibrillationIntroViewController *)self bodyLabel];
  v28 = [v32 bottomAnchor];
  v26 = [v30 constraintEqualToAnchor:v28];
  v55[2] = v26;
  v24 = [(HROnboardingAtrialFibrillationIntroViewController *)self footnoteLabel];
  id v22 = [v24 firstBaselineAnchor];
  id v12 = [(HROnboardingAtrialFibrillationIntroViewController *)self learnMoreContentView];
  v13 = [v12 bottomAnchor];
  [(HROnboardingAtrialFibrillationIntroViewController *)self _footnoteLeading];
  v14 = objc_msgSend(v22, "constraintEqualToAnchor:constant:", v13);
  v55[3] = v14;
  v15 = [(HROnboardingAtrialFibrillationIntroViewController *)self stackedButtonView];
  v16 = [v15 topAnchor];
  v17 = [(HROnboardingAtrialFibrillationIntroViewController *)self footnoteLabel];
  v18 = [v17 lastBaselineAnchor];
  [(HROnboardingAtrialFibrillationIntroViewController *)self _viewLastBaselineToContinueButton];
  double v19 = objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18);
  v55[4] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:5];
  [(HROnboardingAtrialFibrillationIntroViewController *)self setLearnMoreExpandedConstraints:v20];

  [(HROnboardingAtrialFibrillationIntroViewController *)self _updateViewsForContentExpansionState:0];
}

- (void)_setUpStackedButtonView
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HROnboardingAtrialFibrillationIntroViewController *)self buttonTitleString];
  v11[0] = v3;
  BOOL v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  id v5 = +[HRStackedButtonView buddyStackedButtonViewWithTitles:v4 footerText:0 boldFooterText:0 footerTextAlignment:4 delegate:self];
  [(HROnboardingAtrialFibrillationIntroViewController *)self setStackedButtonView:v5];

  uint64_t v6 = [(HROnboardingAtrialFibrillationIntroViewController *)self stackedButtonView];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v7 = [(HROnboardingAtrialFibrillationIntroViewController *)self stackedButtonView];
  [v7 setBlurHidden:1];

  id v8 = [(HROnboardingAtrialFibrillationIntroViewController *)self stackedButtonView];
  [v8 setFixedBottomButtonSpacing:1];

  char v9 = [(HROnboardingAtrialFibrillationIntroViewController *)self contentView];
  id v10 = [(HROnboardingAtrialFibrillationIntroViewController *)self stackedButtonView];
  [v9 addSubview:v10];
}

- (void)_setStackedButtonViewAsFooterView
{
  uint64_t v3 = [(HROnboardingAtrialFibrillationIntroViewController *)self stackedButtonView];
  HKHealthUIBuddyDirectionalEdgeInsets();
  -[HROnboardingAtrialFibrillationIntroViewController setFooterView:insets:](self, "setFooterView:insets:", v3);

  BOOL v4 = [(HROnboardingAtrialFibrillationIntroViewController *)self stackedButtonView];
  [v4 setClipsToBounds:0];

  id v6 = [(HROnboardingAtrialFibrillationIntroViewController *)self stackedButtonView];
  id v5 = [(HROnboardingAtrialFibrillationIntroViewController *)self view];
  [v6 alignBlurViewHorizontalConstraintsWithView:v5];
}

- (void)_updateViewsForContentExpansionState:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(HROnboardingAtrialFibrillationIntroViewController *)self learnMoreButton];
  id v6 = v5;
  if (v3)
  {
    [v5 setHidden:1];

    id v7 = [(HROnboardingAtrialFibrillationIntroViewController *)self learnMoreContentView];
    [v7 setHidden:0];

    id v8 = (void *)MEMORY[0x263F08938];
    char v9 = [(HROnboardingAtrialFibrillationIntroViewController *)self learnMoreCollapsedConstraints];
    [v8 deactivateConstraints:v9];

    id v10 = (void *)MEMORY[0x263F08938];
    [(HROnboardingAtrialFibrillationIntroViewController *)self learnMoreExpandedConstraints];
  }
  else
  {
    [v5 setHidden:0];

    id v11 = [(HROnboardingAtrialFibrillationIntroViewController *)self learnMoreContentView];
    [v11 setHidden:1];

    id v12 = (void *)MEMORY[0x263F08938];
    v13 = [(HROnboardingAtrialFibrillationIntroViewController *)self learnMoreExpandedConstraints];
    [v12 deactivateConstraints:v13];

    id v10 = (void *)MEMORY[0x263F08938];
    [(HROnboardingAtrialFibrillationIntroViewController *)self learnMoreCollapsedConstraints];
  }
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activateConstraints:");
}

- (void)learnMoreButtonTapped:(id)a3
{
}

- (void)_presentFeatureAlertWithMessage:(id)a3
{
  id v7 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:0 message:a3 preferredStyle:1];
  BOOL v4 = (void *)MEMORY[0x263F1C3F0];
  id v5 = [(HROnboardingAtrialFibrillationIntroViewController *)self locationFeatureAlertAckButtonString];
  id v6 = [v4 actionWithTitle:v5 style:1 handler:0];
  [v7 addAction:v6];

  [(HROnboardingAtrialFibrillationIntroViewController *)self presentViewController:v7 animated:1 completion:0];
}

- (void)stackedButtonView:(id)a3 didTapButtonAtIndex:(int64_t)a4
{
  if (!a4)
  {
    uint64_t v15 = v4;
    uint64_t v16 = v5;
    id v8 = [a3 buttons];
    char v9 = [v8 objectAtIndexedSubscript:0];

    [v9 setEnabled:0];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    void v11[2] = __91__HROnboardingAtrialFibrillationIntroViewController_stackedButtonView_didTapButtonAtIndex___block_invoke;
    v11[3] = &unk_264581260;
    id v12 = v9;
    v13 = self;
    SEL v14 = a2;
    id v10 = v9;
    [(HROnboardingAtrialFibrillationIntroViewController *)self _isAtrialFibrillationDetectionOnboardingAvailableInCurrentLocationForActiveWatch:v11];
  }
}

void __91__HROnboardingAtrialFibrillationIntroViewController_stackedButtonView_didTapButtonAtIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __91__HROnboardingAtrialFibrillationIntroViewController_stackedButtonView_didTapButtonAtIndex___block_invoke_2;
  v12[3] = &unk_264581238;
  id v13 = *(id *)(a1 + 32);
  id v14 = v7;
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v15 = *(void *)(a1 + 40);
  id v16 = v8;
  uint64_t v17 = a3;
  uint64_t v18 = v9;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(MEMORY[0x263EF83A0], v12);
}

void __91__HROnboardingAtrialFibrillationIntroViewController_stackedButtonView_didTapButtonAtIndex___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setEnabled:1];
  uint64_t v2 = *(void *)(a1 + 64);
  if (!v2)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      id v6 = [*(id *)(a1 + 48) delegate];
      id v7 = [v6 userInfo];
      [v7 setObject:v5 forKeyedSubscript:@"HROnboardingAtrialFibrillationCountryCodeKey"];

      id v15 = [*(id *)(a1 + 48) delegate];
      [v15 stepForward];
LABEL_18:

      return;
    }
    goto LABEL_21;
  }
  if (v2)
  {
    id v8 = *(void **)(a1 + 48);
    [v8 _presentLocationNotFoundAlert];
  }
  else
  {
    if ((v2 & 2) != 0 || (v2 & 4) != 0 || (v2 & 8) != 0 || (v2 & 0x20) != 0 || (v2 & 0x10) != 0)
    {
      BOOL v3 = *(void **)(a1 + 48);
      uint64_t v4 = [v3 locationFeatureIneligiblePromptBodyString];
      goto LABEL_17;
    }
    if ((v2 & 0x40) == 0)
    {
      if ((v2 & 0x80) != 0)
      {
        BOOL v3 = *(void **)(a1 + 48);
        uint64_t v4 = [v3 seedExpiredBodyString];
LABEL_17:
        id v15 = (id)v4;
        [v3 presentAlertWithMessage:v4];
        goto LABEL_18;
      }
LABEL_21:
      if (objc_msgSend(*(id *)(a1 + 56), "hk_isHealthKitErrorWithCode:", 111))
      {
        [*(id *)(a1 + 48) presentLearnMoreAlertWithFeatureDisabledMessage];
        goto LABEL_29;
      }
      if (objc_msgSend(*(id *)(a1 + 56), "hk_isHealthKitErrorWithCode:", 109))
      {
        uint64_t v9 = *(void **)(a1 + 48);
      }
      else
      {
        int v10 = objc_msgSend(*(id *)(a1 + 56), "hk_isHealthKitErrorWithCode:", 113);
        id v11 = *(void **)(a1 + 48);
        if (v10)
        {
          id v12 = [*(id *)(a1 + 48) watchOSVersionTooLowBodyString];
          [v11 presentAlertWithMessage:v12];

          goto LABEL_29;
        }
        uint64_t v9 = *(void **)(a1 + 48);
      }
      [v9 _presentLocationNotFoundAlert];
LABEL_29:
      _HKInitializeLogging();
      id v13 = (void *)*MEMORY[0x263F09920];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR)) {
        __91__HROnboardingAtrialFibrillationIntroViewController_stackedButtonView_didTapButtonAtIndex___block_invoke_2_cold_1(a1, v13, (uint64_t *)(a1 + 56));
      }
      return;
    }
    id v14 = *(void **)(a1 + 48);
    [v14 presentLearnMoreAlertWithFeatureDisabledMessage];
  }
}

- (void)_isAtrialFibrillationDetectionOnboardingAvailableInCurrentLocationForActiveWatch:(id)a3
{
  id v5 = a3;
  id v6 = HKPreferredRegulatoryDomainProvider();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __134__HROnboardingAtrialFibrillationIntroViewController__isAtrialFibrillationDetectionOnboardingAvailableInCurrentLocationForActiveWatch___block_invoke;
  v8[3] = &unk_264581288;
  v8[4] = self;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  [v6 fetchMobileCountryCodeFromCellularWithCompletion:v8];
}

void __134__HROnboardingAtrialFibrillationIntroViewController__isAtrialFibrillationDetectionOnboardingAvailableInCurrentLocationForActiveWatch___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id v8 = objc_alloc(MEMORY[0x263F0A3B8]);
    uint64_t v9 = *MEMORY[0x263F09778];
    SEL v10 = [*(id *)(a1 + 32) delegate];
    id v11 = [v10 healthStore];
    id v12 = (void *)[v8 initWithFeatureIdentifier:v9 healthStore:v11];

    id v13 = [v5 ISOCode];
    id v29 = 0;
    id v14 = [v12 onboardingEligibilityForCountryCode:v13 error:&v29];
    id v15 = v29;

    [*(id *)(a1 + 32) _submitOnboardingUIErrorEventWithCountryCode:v5 onboardingEligibility:v14];
    if (v14)
    {
      if ([v14 isEligible])
      {
        (*(void (**)(void, id, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v5, [v14 ineligibilityReasons], 0);
      }
      else
      {
        _HKInitializeLogging();
        uint64_t v18 = (void *)*MEMORY[0x263F09920];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR))
        {
          uint64_t v24 = *(void *)(a1 + 32);
          v25 = *(const char **)(a1 + 48);
          v26 = v18;
          v27 = NSStringFromSelector(v25);
          v28 = [v14 ineligibilityReasonsDescription];
          *(_DWORD *)buf = 138543874;
          uint64_t v31 = v24;
          __int16 v32 = 2114;
          v33 = v27;
          __int16 v34 = 2114;
          id v35 = v28;
          _os_log_error_impl(&dword_220CA3000, v26, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] Not eligible for onboarding: %{public}@", buf, 0x20u);
        }
        (*(void (**)(void, void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, [v14 ineligibilityReasons], 0);
      }
    }
    else
    {
      _HKInitializeLogging();
      id v16 = (void *)*MEMORY[0x263F09920];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = *(void *)(a1 + 32);
        v21 = *(const char **)(a1 + 48);
        id v22 = v16;
        v23 = NSStringFromSelector(v21);
        *(_DWORD *)buf = 138543874;
        uint64_t v31 = v20;
        __int16 v32 = 2114;
        v33 = v23;
        __int16 v34 = 2114;
        id v35 = v15;
        _os_log_error_impl(&dword_220CA3000, v22, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] Could not determine onboarding eligibility: %{public}@", buf, 0x20u);
      }
      uint64_t v17 = *(void *)(a1 + 40);
      if (v15)
      {
        (*(void (**)(uint64_t, void, void, id))(v17 + 16))(v17, 0, 0, v15);
      }
      else
      {
        double v19 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 110, @"Feature eligibility could not be determined");
        (*(void (**)(uint64_t, void, void, void *))(v17 + 16))(v17, 0, 0, v19);
      }
    }
  }
  else
  {
    if (!v6)
    {
      id v7 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 109, @"Unable to determine location");
    }
    [*(id *)(a1 + 32) _submitOnboardingUIErrorEventWithCountryCode:0 onboardingEligibility:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)presentLearnMoreAlertWithFeatureDisabledMessage
{
  id v3 = [(HROnboardingAtrialFibrillationIntroViewController *)self featureDisabledBodyString];
  [(HROnboardingAtrialFibrillationIntroViewController *)self presentLearnMoreAlertWithMessage:v3 learnMoreTapped:&__block_literal_global_1];
}

void __100__HROnboardingAtrialFibrillationIntroViewController_presentLearnMoreAlertWithFeatureDisabledMessage__block_invoke()
{
  id v1 = [NSURL URLWithString:*MEMORY[0x263F09210]];
  v0 = [MEMORY[0x263F01880] defaultWorkspace];
  [v0 openURL:v1 withOptions:0];
}

- (void)_presentLocationNotFoundAlert
{
  id v4 = [(HROnboardingAtrialFibrillationIntroViewController *)self locationNotFoundPromptMessageString];
  id v3 = [(HROnboardingAtrialFibrillationIntroViewController *)self locationNotFoundPromptTitleString];
  [(HROnboardingAtrialFibrillationIntroViewController *)self presentAlertWithMessage:v4 title:v3];
}

- (id)_titleFontTextStyle
{
  return (id)*MEMORY[0x263F1D2B0];
}

- (id)_titleFont
{
  uint64_t v2 = (void *)MEMORY[0x263F1C658];
  id v3 = [(HROnboardingAtrialFibrillationIntroViewController *)self _titleFontTextStyle];
  id v4 = objc_msgSend(v2, "hk_scalableFontForTextStyle:symbolicTraits:", v3, 32770);

  return v4;
}

- (double)_assetImageBottomToTitleFirstBaseline
{
  uint64_t v2 = [(HROnboardingAtrialFibrillationIntroViewController *)self _titleFont];
  [v2 _scaledValueForValue:54.0];
  double v4 = v3;

  return v4;
}

- (id)_bodyFontTextStyle
{
  return (id)*MEMORY[0x263F1D260];
}

- (id)_bodyFont
{
  uint64_t v2 = (void *)MEMORY[0x263F1C658];
  double v3 = [(HROnboardingAtrialFibrillationIntroViewController *)self _bodyFontTextStyle];
  double v4 = [v2 preferredFontForTextStyle:v3];

  return v4;
}

- (double)_titleLastBaselineToBodyFirstBaseline
{
  uint64_t v2 = [(HROnboardingAtrialFibrillationIntroViewController *)self _bodyFont];
  [v2 _scaledValueForValue:32.0];
  double v4 = v3;

  return v4;
}

- (double)_learnMoreContentViewLastBaselineToContinueButton
{
  uint64_t v2 = [(HROnboardingAtrialFibrillationIntroViewController *)self _bodyFont];
  [v2 _scaledValueForValue:16.0];
  double v4 = v3;

  return v4;
}

- (double)_viewLastBaselineToContinueButton
{
  uint64_t v2 = [(HROnboardingAtrialFibrillationIntroViewController *)self _bodyFont];
  [v2 _scaledValueForValue:6.0];
  double v4 = v3;

  return v4;
}

- (id)_footnoteTextStyle
{
  return (id)*MEMORY[0x263F1D280];
}

- (id)_footnoteFont
{
  uint64_t v2 = (void *)MEMORY[0x263F1C658];
  double v3 = [(HROnboardingAtrialFibrillationIntroViewController *)self _footnoteTextStyle];
  double v4 = [v2 preferredFontForTextStyle:v3];

  return v4;
}

- (double)_footnoteLeading
{
  uint64_t v2 = [(HROnboardingAtrialFibrillationIntroViewController *)self _footnoteFont];
  [v2 _scaledValueForValue:40.0];
  double v4 = v3;

  return v4;
}

- (id)titleString
{
  uint64_t v2 = HRHeartRhythmUIFrameworkBundle();
  double v3 = [v2 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_INTRO_TITLE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];

  return v3;
}

- (id)bodyString
{
  uint64_t v2 = HRHeartRhythmUIFrameworkBundle();
  double v3 = [v2 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_INTRO_BODY" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];

  return v3;
}

- (id)learnMoreString
{
  uint64_t v2 = HRHeartRhythmUIFrameworkBundle();
  double v3 = [v2 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_INTRO_LEARN_MORE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];

  return v3;
}

- (id)footnoteString
{
  uint64_t v2 = HRHeartRhythmUIFrameworkBundle();
  double v3 = [v2 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_INTRO_LOCATION_FOOTNOTE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];

  return v3;
}

- (id)buttonTitleString
{
  uint64_t v2 = HRHeartRhythmUIFrameworkBundle();
  double v3 = [v2 localizedStringForKey:@"ONBOARDING_CONTINUE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable"];

  return v3;
}

- (id)locationNotFoundPromptTitleString
{
  uint64_t v2 = HRHeartRhythmUIFrameworkBundle();
  double v3 = [v2 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_ALERT_LOCATION_UNAVAILABLE_TITLE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];

  return v3;
}

- (id)locationNotFoundPromptMessageString
{
  uint64_t v2 = HRHeartRhythmUIFrameworkBundle();
  double v3 = [v2 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_ALERT_LOCATION_UNAVAILABLE_BODY" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];

  return v3;
}

- (id)locationFeatureAlertAckButtonString
{
  uint64_t v2 = HRHeartRhythmUIFrameworkBundle();
  double v3 = [v2 localizedStringForKey:@"ONBOARDING_OK" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable"];

  return v3;
}

- (id)locationFeatureIneligiblePromptBodyString
{
  uint64_t v2 = HRHeartRhythmUIFrameworkBundle();
  double v3 = [v2 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_INTRO_LOCATION_INELIGIBLE_BODY" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];

  return v3;
}

- (id)featureDisabledBodyString
{
  uint64_t v2 = HRHeartRhythmUIFrameworkBundle();
  double v3 = [v2 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_FEATURE_DISABLED_BODY" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Shared"];

  return v3;
}

- (id)watchOSVersionTooLowBodyString
{
  uint64_t v2 = HRHeartRhythmUIFrameworkBundle();
  double v3 = [v2 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_OS_VERSION_TOO_LOW" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Shared"];

  return v3;
}

- (id)seedExpiredBodyString
{
  uint64_t v2 = HRHeartRhythmUIFrameworkBundle();
  double v3 = [v2 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_SEED_EXPIRED" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Shared"];

  return v3;
}

- (id)axidForElementWithString:(id)a3
{
  double v3 = [NSString stringWithFormat:@"Onboarding.%@", a3];
  double v4 = [NSString healthAccessibilityIdentifier:2 suffix:v3];

  return v4;
}

- (NSNumber)activeWatchNeedsLocationCheck
{
  return self->_activeWatchNeedsLocationCheck;
}

- (void)setActiveWatchNeedsLocationCheck:(id)a3
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

- (UILabel)footnoteLabel
{
  return self->_footnoteLabel;
}

- (void)setFootnoteLabel:(id)a3
{
}

- (HRStackedButtonView)stackedButtonView
{
  return self->_stackedButtonView;
}

- (void)setStackedButtonView:(id)a3
{
}

- (NSLayoutConstraint)contentViewBottomConstraint
{
  return self->_contentViewBottomConstraint;
}

- (void)setContentViewBottomConstraint:(id)a3
{
}

- (UIButton)learnMoreButton
{
  return self->_learnMoreButton;
}

- (void)setLearnMoreButton:(id)a3
{
}

- (BOOL)learnMoreContentExpanded
{
  return self->_learnMoreContentExpanded;
}

- (void)setLearnMoreContentExpanded:(BOOL)a3
{
  self->_learnMoreContentExpanded = a3;
}

- (UIView)learnMoreContentView
{
  return self->_learnMoreContentView;
}

- (void)setLearnMoreContentView:(id)a3
{
}

- (NSArray)learnMoreCollapsedConstraints
{
  return self->_learnMoreCollapsedConstraints;
}

- (void)setLearnMoreCollapsedConstraints:(id)a3
{
}

- (NSArray)learnMoreExpandedConstraints
{
  return self->_learnMoreExpandedConstraints;
}

- (void)setLearnMoreExpandedConstraints:(id)a3
{
}

- (void)setAnalyticsEventSubmissionManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsEventSubmissionManager, 0);
  objc_storeStrong((id *)&self->_learnMoreExpandedConstraints, 0);
  objc_storeStrong((id *)&self->_learnMoreCollapsedConstraints, 0);
  objc_storeStrong((id *)&self->_learnMoreContentView, 0);
  objc_storeStrong((id *)&self->_learnMoreButton, 0);
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_stackedButtonView, 0);
  objc_storeStrong((id *)&self->_footnoteLabel, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_heroView, 0);
  objc_storeStrong((id *)&self->_activeWatchNeedsLocationCheck, 0);
}

void __120__HROnboardingAtrialFibrillationIntroViewController__submitOnboardingUIErrorEventWithCountryCode_onboardingEligibility___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  double v4 = a2;
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_error_impl(&dword_220CA3000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error submitting onboarding errors analytics event: %{public}@", (uint8_t *)&v6, 0x16u);
}

void __91__HROnboardingAtrialFibrillationIntroViewController_stackedButtonView_didTapButtonAtIndex___block_invoke_2_cold_1(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = *(const char **)(a1 + 72);
  int v6 = a2;
  id v7 = NSStringFromSelector(v5);
  uint64_t v8 = *a3;
  int v9 = 138543874;
  uint64_t v10 = v4;
  __int16 v11 = 2114;
  id v12 = v7;
  __int16 v13 = 2114;
  uint64_t v14 = v8;
  _os_log_error_impl(&dword_220CA3000, v6, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] Unexpectedly received an location check error: %{public}@", (uint8_t *)&v9, 0x20u);
}

@end