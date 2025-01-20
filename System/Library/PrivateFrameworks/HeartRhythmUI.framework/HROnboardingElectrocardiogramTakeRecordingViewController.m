@interface HROnboardingElectrocardiogramTakeRecordingViewController
- (BOOL)didStepForward;
- (BOOL)electrocardiogramFirstRecordingCompleted;
- (CGSize)_takeRecordingImageDimension;
- (HKAnchoredObjectQuery)electrocardiogramQuery;
- (HKElectrocardiogram)electrocardiogram;
- (HKHeartRhythmAvailability)availability;
- (HRImageLabel)recordingStep1ImageLabel;
- (HRImageLabel)recordingStep2ImageLabel;
- (UILabel)bodyLabel;
- (UILabel)titleLabel;
- (UILabel)wristSettingsLabel;
- (UIView)assetView;
- (id)_bodyFont;
- (id)_bodyFontTextStyle;
- (id)_recordingStepFont;
- (id)_titleFont;
- (id)_titleFontTextStyle;
- (id)_titleForOnboarding:(BOOL)a3;
- (id)identifierBundle;
- (id)initForOnboarding:(BOOL)a3 upgradingFromAlgorithmVersion:(int64_t)a4;
- (void)_setUpElectrocardiogramQuery;
- (void)_stepForwardWithElectrocardiogramRecorded:(BOOL)a3;
- (void)_stopElectrocardiogramQuery;
- (void)heartRhythmAvailabilityDidUpdate;
- (void)setAssetView:(id)a3;
- (void)setAvailability:(id)a3;
- (void)setBodyLabel:(id)a3;
- (void)setDidStepForward:(BOOL)a3;
- (void)setElectrocardiogram:(id)a3;
- (void)setElectrocardiogramFirstRecordingCompleted:(BOOL)a3;
- (void)setElectrocardiogramQuery:(id)a3;
- (void)setRecordingStep1ImageLabel:(id)a3;
- (void)setRecordingStep2ImageLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUpConstraints;
- (void)setUpUI;
- (void)setWristSettingsLabel:(id)a3;
- (void)skipButtonTapped:(id)a3;
- (void)viewControllerDidLeaveAdaptiveModal;
- (void)viewControllerWillEnterAdaptiveModal;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HROnboardingElectrocardiogramTakeRecordingViewController

- (id)initForOnboarding:(BOOL)a3 upgradingFromAlgorithmVersion:(int64_t)a4
{
  BOOL v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HROnboardingElectrocardiogramTakeRecordingViewController;
  v5 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)&v10 initForOnboarding:a3 upgradingFromAlgorithmVersion:a4];
  v6 = v5;
  if (v5) {
    BOOL v7 = !v4;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    [v5 setRightButtonType:4];
    v8 = [v6 navigationItem];
    [v8 setHidesBackButton:1];

    v6[1072] = 0;
  }
  return v6;
}

- (id)identifierBundle
{
  return (id)[NSString healthAccessibilityIdentifier:1 suffix:@"Onboarding.HowToTake"];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)HROnboardingElectrocardiogramTakeRecordingViewController;
  [(HROnboardingElectrocardiogramTakeRecordingViewController *)&v8 viewDidLoad];
  if ([(HROnboardingElectrocardiogramTakeRecordingViewController *)self isOnboarding])
  {
    id v3 = objc_alloc(MEMORY[0x263F0A448]);
    BOOL v4 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self delegate];
    v5 = [v4 healthStore];
    v6 = (void *)[v3 initWithHealthStore:v5];
    [(HROnboardingElectrocardiogramTakeRecordingViewController *)self setAvailability:v6];

    BOOL v7 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self availability];
    [v7 addHeartRhythmAvailabilityObserver:self];

    [(HROnboardingElectrocardiogramTakeRecordingViewController *)self _setUpElectrocardiogramQuery];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HROnboardingElectrocardiogramTakeRecordingViewController;
  [(HROnboardingElectrocardiogramTakeRecordingViewController *)&v5 viewDidDisappear:a3];
  if ([(HROnboardingElectrocardiogramTakeRecordingViewController *)self isOnboarding])
  {
    BOOL v4 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self availability];
    [v4 removeHeartRhythmAvailabilityObserver:self];

    [(HROnboardingElectrocardiogramTakeRecordingViewController *)self _stopElectrocardiogramQuery];
  }
}

- (void)setUpUI
{
  v98.receiver = self;
  v98.super_class = (Class)HROnboardingElectrocardiogramTakeRecordingViewController;
  [(HROnboardingElectrocardiogramTakeRecordingViewController *)&v98 setUpUI];
  id v3 = [[HROnboardingWristImageView alloc] initWithImageStyle:1];
  [(HROnboardingWristImageView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(HROnboardingWristImageView *)v3 setContentMode:1];
  [(HROnboardingWristImageView *)v3 setTimeRemaining:26.0];
  [(HROnboardingElectrocardiogramTakeRecordingViewController *)self setAssetView:v3];
  BOOL v4 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self contentView];
  objc_super v5 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self assetView];
  [v4 addSubview:v5];

  id v6 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HROnboardingElectrocardiogramTakeRecordingViewController *)self setTitleLabel:v6];

  BOOL v7 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self delegate];
  objc_super v8 = -[HROnboardingElectrocardiogramTakeRecordingViewController _titleForOnboarding:](self, "_titleForOnboarding:", [v7 firstTimeOnboarding]);
  v9 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self titleLabel];
  [v9 setText:v8];

  objc_super v10 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self titleLabel];
  [v10 setTextAlignment:1];

  v11 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self _titleFont];
  v12 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self titleLabel];
  [v12 setFont:v11];

  v13 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self titleLabel];
  [v13 setAdjustsFontForContentSizeCategory:1];

  v14 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self titleLabel];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

  v15 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self titleLabel];
  [v15 setNumberOfLines:0];

  v16 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self identifierBundle];
  v17 = [v16 stringByAppendingString:@".Title"];
  v18 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self titleLabel];
  [v18 setAccessibilityIdentifier:v17];

  v19 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self contentView];
  v20 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self titleLabel];
  [v19 addSubview:v20];

  id v21 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HROnboardingElectrocardiogramTakeRecordingViewController *)self setBodyLabel:v21];

  v22 = HRUIECGLocalizedString(@"ECG_ONBOARDING_5_BODY");
  v23 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self bodyLabel];
  [v23 setText:v22];

  v24 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self bodyLabel];
  [v24 setTextAlignment:1];

  v25 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self _bodyFont];
  v26 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self bodyLabel];
  [v26 setFont:v25];

  v27 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self bodyLabel];
  [v27 setAdjustsFontForContentSizeCategory:1];

  v28 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self bodyLabel];
  [v28 setTranslatesAutoresizingMaskIntoConstraints:0];

  v29 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self bodyLabel];
  [v29 setNumberOfLines:0];

  v30 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self identifierBundle];
  v31 = [v30 stringByAppendingString:@".Description"];
  v32 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self bodyLabel];
  [v32 setAccessibilityIdentifier:v31];

  v33 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self contentView];
  v34 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self bodyLabel];
  [v33 addSubview:v34];

  v35 = [HRImageLabel alloc];
  v36 = objc_msgSend(MEMORY[0x263F1C6B0], "hrui_ECGAppIconImage");
  [(HROnboardingElectrocardiogramTakeRecordingViewController *)self _takeRecordingImageDimension];
  double v38 = v37;
  double v40 = v39;
  v41 = HRUIECGLocalizedString(@"ECG_ONBOARDING_5_LIST_ITEM_STEP-1");
  v42 = -[HRImageLabel initWithImage:size:text:](v35, "initWithImage:size:text:", v36, v41, v38, v40);
  [(HROnboardingElectrocardiogramTakeRecordingViewController *)self setRecordingStep1ImageLabel:v42];

  [(HROnboardingElectrocardiogramTakeRecordingViewController *)self _takeRecordingImageDimension];
  double v44 = v43 * 0.5;
  v45 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self recordingStep1ImageLabel];
  v46 = [v45 imageView];
  objc_msgSend(v46, "hrui_maskAllCornersWithRadius:", v44);

  v47 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self recordingStep1ImageLabel];
  [v47 setBoldText:1];

  v48 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self recordingStep1ImageLabel];
  [v48 setImageAlignment:0];

  id v49 = [MEMORY[0x263F1C550] secondaryLabelColor];
  uint64_t v50 = [v49 CGColor];
  v51 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self recordingStep1ImageLabel];
  v52 = [v51 imageView];
  v53 = [v52 layer];
  [v53 setBorderColor:v50];

  HKUIOnePixel();
  double v55 = v54;
  v56 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self recordingStep1ImageLabel];
  v57 = [v56 imageView];
  v58 = [v57 layer];
  [v58 setBorderWidth:v55];

  v59 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self recordingStep1ImageLabel];
  [v59 setTranslatesAutoresizingMaskIntoConstraints:0];

  v60 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self identifierBundle];
  v61 = [v60 stringByAppendingString:@".StepOne"];
  v62 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self recordingStep1ImageLabel];
  v63 = [v62 textLabel];
  [v63 setAccessibilityIdentifier:v61];

  v64 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self contentView];
  v65 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self recordingStep1ImageLabel];
  [v64 addSubview:v65];

  v66 = [HRImageLabel alloc];
  v67 = objc_msgSend(MEMORY[0x263F1C6B0], "hrui_fingerCrownImage");
  [(HROnboardingElectrocardiogramTakeRecordingViewController *)self _takeRecordingImageDimension];
  double v69 = v68;
  double v71 = v70;
  v72 = HRUIECGLocalizedString(@"ECG_ONBOARDING_5_LIST_ITEM_STEP-2");
  v73 = -[HRImageLabel initWithImage:size:text:](v66, "initWithImage:size:text:", v67, v72, v69, v71);
  [(HROnboardingElectrocardiogramTakeRecordingViewController *)self setRecordingStep2ImageLabel:v73];

  v74 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self recordingStep2ImageLabel];
  [v74 setBoldText:1];

  v75 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self recordingStep2ImageLabel];
  [v75 setImageAlignment:0];

  v76 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self recordingStep2ImageLabel];
  [v76 setTranslatesAutoresizingMaskIntoConstraints:0];

  v77 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self identifierBundle];
  v78 = [v77 stringByAppendingString:@".StepTwo"];
  v79 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self recordingStep2ImageLabel];
  v80 = [v79 textLabel];
  [v80 setAccessibilityIdentifier:v78];

  v81 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self contentView];
  v82 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self recordingStep2ImageLabel];
  [v81 addSubview:v82];

  id v83 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HROnboardingElectrocardiogramTakeRecordingViewController *)self setWristSettingsLabel:v83];

  v84 = (void *)MEMORY[0x263F089B8];
  v85 = HRUIECGLocalizedString(@"ECG_ONBOARDING_5_FOOTER");
  uint64_t v86 = *MEMORY[0x263F1D2C0];
  v87 = [MEMORY[0x263F1C550] secondaryLabelColor];
  v88 = HRUIECGLocalizedString(@"ECG_ONBOARDING_5_BOLD_FOOTER");
  v89 = objc_msgSend(v84, "hrui_attributedStringForText:style:color:boldText:", v85, v86, v87, v88);
  v90 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self wristSettingsLabel];
  [v90 setAttributedText:v89];

  v91 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self wristSettingsLabel];
  [v91 setTranslatesAutoresizingMaskIntoConstraints:0];

  v92 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self wristSettingsLabel];
  [v92 setNumberOfLines:0];

  v93 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self identifierBundle];
  v94 = [v93 stringByAppendingString:@".Footer"];
  v95 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self wristSettingsLabel];
  [v95 setAccessibilityIdentifier:v94];

  v96 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self contentView];
  v97 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self wristSettingsLabel];
  [v96 addSubview:v97];
}

- (void)setUpConstraints
{
  v50.receiver = self;
  v50.super_class = (Class)HROnboardingElectrocardiogramTakeRecordingViewController;
  [(HROnboardingElectrocardiogramTakeRecordingViewController *)&v50 setUpConstraints];
  id v3 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self assetView];
  BOOL v4 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self contentView];
  objc_msgSend(v3, "hk_alignHorizontalConstraintsWithView:margin:", v4, 0.0);

  objc_super v5 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self assetView];
  id v6 = [v5 topAnchor];
  BOOL v7 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self contentView];
  objc_super v8 = [v7 topAnchor];
  v9 = [v6 constraintEqualToAnchor:v8];
  [v9 setActive:1];

  objc_super v10 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self titleLabel];
  v11 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self contentView];
  HKHealthUIBuddyDirectionalEdgeInsets();
  objc_msgSend(v10, "hrui_alignHorizontalConstraintsWithView:insets:", v11);

  v12 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self titleLabel];
  v13 = [v12 topAnchor];
  v14 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self assetView];
  v15 = [v14 bottomAnchor];
  v16 = [v13 constraintEqualToAnchor:v15 constant:29.0];
  [v16 setActive:1];

  v17 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self bodyLabel];
  v18 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self titleLabel];
  objc_msgSend(v17, "hk_alignHorizontalConstraintsWithView:margin:", v18, 0.0);

  v19 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self bodyLabel];
  v20 = [v19 topAnchor];
  id v21 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self titleLabel];
  v22 = [v21 bottomAnchor];
  v23 = [v20 constraintEqualToAnchor:v22 constant:15.0];
  [v23 setActive:1];

  v24 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self recordingStep1ImageLabel];
  v25 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self titleLabel];
  objc_msgSend(v24, "hk_alignHorizontalConstraintsWithView:margin:", v25, 0.0);

  v26 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self recordingStep1ImageLabel];
  v27 = [v26 topAnchor];
  v28 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self bodyLabel];
  v29 = [v28 bottomAnchor];
  v30 = [v27 constraintEqualToAnchor:v29 constant:20.0];
  [v30 setActive:1];

  v31 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self recordingStep2ImageLabel];
  v32 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self titleLabel];
  objc_msgSend(v31, "hk_alignHorizontalConstraintsWithView:margin:", v32, 0.0);

  v33 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self recordingStep2ImageLabel];
  v34 = [v33 topAnchor];
  v35 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self recordingStep1ImageLabel];
  v36 = [v35 bottomAnchor];
  double v37 = [v34 constraintEqualToAnchor:v36 constant:20.0];
  [v37 setActive:1];

  double v38 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self wristSettingsLabel];
  double v39 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self titleLabel];
  objc_msgSend(v38, "hk_alignHorizontalConstraintsWithView:margin:", v39, 0.0);

  double v40 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self wristSettingsLabel];
  v41 = [v40 topAnchor];
  v42 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self recordingStep2ImageLabel];
  double v43 = [v42 bottomAnchor];
  double v44 = [v41 constraintEqualToAnchor:v43 constant:20.0];
  [v44 setActive:1];

  v45 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self contentView];
  v46 = [v45 bottomAnchor];
  v47 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self wristSettingsLabel];
  v48 = [v47 bottomAnchor];
  id v49 = [v46 constraintEqualToAnchor:v48 constant:*MEMORY[0x263F46378]];
  [v49 setActive:1];
}

- (void)skipButtonTapped:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x263F1C3F8];
  objc_super v5 = HRUIECGLocalizedString(@"ECG_ONBOARDING_SKIP_DESCRIPTION");
  id v6 = [v4 alertControllerWithTitle:0 message:v5 preferredStyle:0];

  BOOL v7 = (void *)MEMORY[0x263F1C3F0];
  objc_super v8 = HRUIECGLocalizedString(@"ECG_ONBOARDING_SKIP_RECORDING");
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __77__HROnboardingElectrocardiogramTakeRecordingViewController_skipButtonTapped___block_invoke;
  v14[3] = &unk_2645814A0;
  v14[4] = self;
  v9 = [v7 actionWithTitle:v8 style:0 handler:v14];

  objc_super v10 = (void *)MEMORY[0x263F1C3F0];
  v11 = HRHeartRhythmUIFrameworkBundle();
  v12 = [v11 localizedStringForKey:@"ONBOARDING_CANCEL" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable"];
  v13 = [v10 actionWithTitle:v12 style:1 handler:0];

  [v6 addAction:v9];
  [v6 addAction:v13];
  [(HROnboardingElectrocardiogramTakeRecordingViewController *)self presentViewController:v6 animated:1 completion:0];
}

uint64_t __77__HROnboardingElectrocardiogramTakeRecordingViewController_skipButtonTapped___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stepForwardWithElectrocardiogramRecorded:0];
}

- (void)heartRhythmAvailabilityDidUpdate
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v3 = (void *)*MEMORY[0x263F09920];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_INFO))
  {
    BOOL v4 = v3;
    *(_DWORD *)buf = 138412290;
    id v8 = (id)objc_opt_class();
    id v5 = v8;
    _os_log_impl(&dword_220CA3000, v4, OS_LOG_TYPE_INFO, "[%@]: Cinnamon availability update notification received.", buf, 0xCu);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __92__HROnboardingElectrocardiogramTakeRecordingViewController_heartRhythmAvailabilityDidUpdate__block_invoke;
  block[3] = &unk_264581110;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __92__HROnboardingElectrocardiogramTakeRecordingViewController_heartRhythmAvailabilityDidUpdate__block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x263EFFA40], "hk_heartRhythmDefaults");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  int v2 = [*(id *)(a1 + 32) electrocardiogramFirstRecordingCompleted];
  if (v2 != objc_msgSend(v3, "hk_electrocardiogramFirstRecordingCompleted"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setElectrocardiogramFirstRecordingCompleted:", objc_msgSend(v3, "hk_electrocardiogramFirstRecordingCompleted"));
    if ([*(id *)(a1 + 32) electrocardiogramFirstRecordingCompleted]) {
      [*(id *)(a1 + 32) _stepForwardWithElectrocardiogramRecorded:1];
    }
  }
}

- (id)_titleForOnboarding:(BOOL)a3
{
  if (a3) {
    id v3 = @"ECG_ONBOARDING_5_TITLE";
  }
  else {
    id v3 = @"ECG_EDUCATION_5_TITLE";
  }
  BOOL v4 = HRUIECGLocalizedString(v3);
  return v4;
}

- (CGSize)_takeRecordingImageDimension
{
  double v2 = 58.0;
  double v3 = 58.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_stepForwardWithElectrocardiogramRecorded:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(HROnboardingElectrocardiogramTakeRecordingViewController *)self didStepForward])
  {
    [(HROnboardingElectrocardiogramTakeRecordingViewController *)self setDidStepForward:1];
    id v5 = [NSNumber numberWithBool:v3];
    id v6 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self delegate];
    BOOL v7 = [v6 userInfo];
    [v7 setObject:v5 forKeyedSubscript:@"HROnboardingElectrocardiogramDidCompleteRecordingKey"];

    id v8 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self delegate];
    [v8 stepForward];
  }
}

- (void)_setUpElectrocardiogramQuery
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self delegate];
  BOOL v4 = [v3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"HROnboardingElectrocardiogramStartDateKey"];

  id v6 = [MEMORY[0x263F0A668] predicateForSamplesWithStartDate:v5 endDate:0 options:0];
  objc_initWeak(&location, self);
  _HKInitializeLogging();
  BOOL v7 = (id)*MEMORY[0x263F09920];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_opt_class();
    *(_DWORD *)buf = 138412546;
    v23 = v8;
    __int16 v24 = 2112;
    v25 = v5;
    id v9 = v8;
    _os_log_impl(&dword_220CA3000, v7, OS_LOG_TYPE_DEFAULT, "[%@]: Querying for new electrocardiograms during on-boarding after %@", buf, 0x16u);
  }
  id v10 = objc_alloc(MEMORY[0x263F0A0C8]);
  v11 = [MEMORY[0x263F0A358] electrocardiogramType];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __88__HROnboardingElectrocardiogramTakeRecordingViewController__setUpElectrocardiogramQuery__block_invoke;
  v19[3] = &unk_264581160;
  v19[4] = self;
  objc_copyWeak(&v20, &location);
  v12 = (void *)[v10 initWithType:v11 predicate:v6 anchor:0 limit:0 resultsHandler:v19];
  [(HROnboardingElectrocardiogramTakeRecordingViewController *)self setElectrocardiogramQuery:v12];

  uint64_t v17 = MEMORY[0x263EF8330];
  objc_copyWeak(&v18, &location);
  v13 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self electrocardiogramQuery];
  [v13 setUpdateHandler:&v17];

  v14 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self delegate];
  v15 = [v14 healthStore];
  v16 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self electrocardiogramQuery];
  [v15 executeQuery:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __88__HROnboardingElectrocardiogramTakeRecordingViewController__setUpElectrocardiogramQuery__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v8 = a3;
  id v9 = a6;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __88__HROnboardingElectrocardiogramTakeRecordingViewController__setUpElectrocardiogramQuery__block_invoke_2;
  v13[3] = &unk_264581138;
  uint64_t v10 = *(void *)(a1 + 32);
  id v14 = v9;
  uint64_t v15 = v10;
  id v16 = v8;
  id v11 = v8;
  id v12 = v9;
  objc_copyWeak(&v17, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x263EF83A0], v13);
  objc_destroyWeak(&v17);
}

void __88__HROnboardingElectrocardiogramTakeRecordingViewController__setUpElectrocardiogramQuery__block_invoke_2(uint64_t a1)
{
  v23[1] = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    _HKInitializeLogging();
    double v2 = (void *)*MEMORY[0x263F09920];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR)) {
      __88__HROnboardingElectrocardiogramSetupCompleteViewController__setUpElectrocardiogramQuery__block_invoke_2_cold_1(a1, v2);
    }
  }
  else
  {
    if (*(void *)(a1 + 48))
    {
      BOOL v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F09F88] ascending:0];
      BOOL v4 = *(void **)(a1 + 48);
      v23[0] = v3;
      id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
      id v6 = [v4 sortedArrayUsingDescriptors:v5];

      BOOL v7 = [v6 firstObject];

      if (v7)
      {
        _HKInitializeLogging();
        id v8 = (id)*MEMORY[0x263F09920];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
          id v10 = (id)objc_opt_class();
          id v11 = [MEMORY[0x263F0A980] sharedBehavior];
          char v12 = [v11 showSensitiveLogItems];
          v13 = [v6 firstObject];
          id v14 = v13;
          uint64_t v15 = v13;
          if ((v12 & 1) == 0)
          {
            uint64_t v15 = [v13 UUID];
          }
          int v19 = 138412546;
          id v20 = v10;
          __int16 v21 = 2112;
          v22 = v15;
          _os_log_impl(&dword_220CA3000, v8, OS_LOG_TYPE_DEFAULT, "[%@]: Initial electrocardiogram retrieved during on-boarding: %@", (uint8_t *)&v19, 0x16u);
          if ((v12 & 1) == 0) {
        }
          }
        id v16 = objc_loadWeakRetained((id *)(a1 + 56));
        [v16 _stepForwardWithElectrocardiogramRecorded:1];
      }
    }
    else
    {
      _HKInitializeLogging();
      id v17 = (void *)*MEMORY[0x263F09920];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      BOOL v3 = v17;
      int v19 = 138412290;
      id v20 = (id)objc_opt_class();
      id v18 = v20;
      _os_log_impl(&dword_220CA3000, v3, OS_LOG_TYPE_DEFAULT, "[%@]: No initial electrocardiograms retrieved during on-boarding", (uint8_t *)&v19, 0xCu);
    }
  }
}

void __88__HROnboardingElectrocardiogramTakeRecordingViewController__setUpElectrocardiogramQuery__block_invoke_359(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v8 = a3;
  id v9 = a6;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__HROnboardingElectrocardiogramTakeRecordingViewController__setUpElectrocardiogramQuery__block_invoke_2_360;
  block[3] = &unk_264581188;
  id v13 = v9;
  id v10 = v9;
  objc_copyWeak(&v15, (id *)(a1 + 32));
  id v14 = v8;
  id v11 = v8;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v15);
}

void __88__HROnboardingElectrocardiogramTakeRecordingViewController__setUpElectrocardiogramQuery__block_invoke_2_360(uint64_t a1)
{
  v21[1] = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    _HKInitializeLogging();
    double v2 = (void *)*MEMORY[0x263F09920];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR)) {
      __88__HROnboardingElectrocardiogramSetupCompleteViewController__setUpElectrocardiogramQuery__block_invoke_2_333_cold_1(a1, v2);
    }
  }
  else if (*(void *)(a1 + 40))
  {
    BOOL v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F09F88] ascending:0];
    BOOL v4 = *(void **)(a1 + 40);
    v21[0] = v3;
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
    id v6 = [v4 sortedArrayUsingDescriptors:v5];

    BOOL v7 = [v6 firstObject];

    if (v7)
    {
      _HKInitializeLogging();
      id v8 = (id)*MEMORY[0x263F09920];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
        id v10 = (id)objc_opt_class();
        id v11 = [MEMORY[0x263F0A980] sharedBehavior];
        char v12 = [v11 showSensitiveLogItems];
        id v13 = [v6 firstObject];
        id v14 = v13;
        id v15 = v13;
        if ((v12 & 1) == 0)
        {
          id v15 = [v13 UUID];
        }
        int v17 = 138412546;
        id v18 = v10;
        __int16 v19 = 2112;
        id v20 = v15;
        _os_log_impl(&dword_220CA3000, v8, OS_LOG_TYPE_DEFAULT, "[%@]: New electrocardiogram received during on-boarding: %@", (uint8_t *)&v17, 0x16u);
        if ((v12 & 1) == 0) {
      }
        }
      id v16 = objc_loadWeakRetained((id *)(a1 + 48));
      [v16 _stepForwardWithElectrocardiogramRecorded:1];
    }
  }
}

- (void)_stopElectrocardiogramQuery
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self electrocardiogramQuery];

  if (v3)
  {
    _HKInitializeLogging();
    BOOL v4 = (void *)*MEMORY[0x263F09920];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_DEFAULT))
    {
      id v5 = v4;
      *(_DWORD *)id v10 = 138412290;
      *(void *)&v10[4] = objc_opt_class();
      id v6 = *(id *)&v10[4];
      _os_log_impl(&dword_220CA3000, v5, OS_LOG_TYPE_DEFAULT, "[%@]: Stopping query for new electrocardiograms", v10, 0xCu);
    }
    BOOL v7 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self delegate];
    id v8 = [v7 healthStore];
    id v9 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self electrocardiogramQuery];
    [v8 stopQuery:v9];

    [(HROnboardingElectrocardiogramTakeRecordingViewController *)self setElectrocardiogramQuery:0];
  }
}

- (id)_titleFontTextStyle
{
  return (id)*MEMORY[0x263F1D2B0];
}

- (id)_titleFont
{
  double v2 = (void *)MEMORY[0x263F1C658];
  BOOL v3 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self _titleFontTextStyle];
  BOOL v4 = objc_msgSend(v2, "hk_scalableFontForTextStyle:symbolicTraits:", v3, 32770);

  return v4;
}

- (id)_bodyFontTextStyle
{
  return (id)*MEMORY[0x263F1D260];
}

- (id)_bodyFont
{
  double v2 = (void *)MEMORY[0x263F1C658];
  BOOL v3 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self _bodyFontTextStyle];
  BOOL v4 = [v2 preferredFontForTextStyle:v3];

  return v4;
}

- (id)_recordingStepFont
{
  double v2 = (void *)MEMORY[0x263F1C658];
  BOOL v3 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self _bodyFontTextStyle];
  BOOL v4 = objc_msgSend(v2, "hk_preferredFontForTextStyle:symbolicTraits:", v3, 2);

  return v4;
}

- (void)viewControllerWillEnterAdaptiveModal
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x263F1C468]);
  BOOL v4 = (void *)MEMORY[0x263F1C3C0];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __96__HROnboardingElectrocardiogramTakeRecordingViewController_viewControllerWillEnterAdaptiveModal__block_invoke;
  uint64_t v11 = &unk_264580E18;
  objc_copyWeak(&v12, &location);
  id v5 = [v4 actionWithHandler:&v8];
  id v6 = objc_msgSend(v3, "initWithBarButtonSystemItem:primaryAction:", 0, v5, v8, v9, v10, v11);

  BOOL v7 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self navigationItem];
  [v7 setLeftBarButtonItem:v6];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __96__HROnboardingElectrocardiogramTakeRecordingViewController_viewControllerWillEnterAdaptiveModal__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

- (void)viewControllerDidLeaveAdaptiveModal
{
  id v2 = [(HROnboardingElectrocardiogramTakeRecordingViewController *)self navigationItem];
  [v2 setLeftBarButtonItem:0];
}

- (HKHeartRhythmAvailability)availability
{
  return self->_availability;
}

- (void)setAvailability:(id)a3
{
}

- (HKAnchoredObjectQuery)electrocardiogramQuery
{
  return self->_electrocardiogramQuery;
}

- (void)setElectrocardiogramQuery:(id)a3
{
}

- (HKElectrocardiogram)electrocardiogram
{
  return self->_electrocardiogram;
}

- (void)setElectrocardiogram:(id)a3
{
}

- (BOOL)electrocardiogramFirstRecordingCompleted
{
  return self->_electrocardiogramFirstRecordingCompleted;
}

- (void)setElectrocardiogramFirstRecordingCompleted:(BOOL)a3
{
  self->_electrocardiogramFirstRecordingCompleted = a3;
}

- (BOOL)didStepForward
{
  return self->_didStepForward;
}

- (void)setDidStepForward:(BOOL)a3
{
  self->_didStepForward = a3;
}

- (UIView)assetView
{
  return self->_assetView;
}

- (void)setAssetView:(id)a3
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

- (HRImageLabel)recordingStep1ImageLabel
{
  return self->_recordingStep1ImageLabel;
}

- (void)setRecordingStep1ImageLabel:(id)a3
{
}

- (HRImageLabel)recordingStep2ImageLabel
{
  return self->_recordingStep2ImageLabel;
}

- (void)setRecordingStep2ImageLabel:(id)a3
{
}

- (UILabel)wristSettingsLabel
{
  return self->_wristSettingsLabel;
}

- (void)setWristSettingsLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wristSettingsLabel, 0);
  objc_storeStrong((id *)&self->_recordingStep2ImageLabel, 0);
  objc_storeStrong((id *)&self->_recordingStep1ImageLabel, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_assetView, 0);
  objc_storeStrong((id *)&self->_electrocardiogram, 0);
  objc_storeStrong((id *)&self->_electrocardiogramQuery, 0);
  objc_storeStrong((id *)&self->_availability, 0);
}

@end