@interface HROnboardingECG2PossibleResultsViewController
- (HKElectrocardiogram)electrocardiogram;
- (HROnboardingECG2PossibleResultsViewController)initWithSample:(id)a3;
- (HROnboardingElectrocardiogramResultView)atrialFibrillationResultView;
- (HROnboardingElectrocardiogramResultView)bottomResultView;
- (HROnboardingElectrocardiogramResultView)highOrLowHeartRateResultView;
- (HROnboardingElectrocardiogramResultView)inconclusiveResultView;
- (HROnboardingElectrocardiogramResultView)onlyResultView;
- (HROnboardingElectrocardiogramResultView)poorRecordingResultView;
- (HROnboardingElectrocardiogramResultView)sinusRhythmResultReview;
- (HRStackedButtonView)stackedButtonView;
- (NSLayoutAnchor)viewTopAnchor;
- (NSLayoutConstraint)contentViewBottomConstraint;
- (NSLayoutConstraint)disclaimerLabelTopConstraint;
- (UILabel)disclaimerLabel;
- (UILabel)titleLabel;
- (id)_resultViewForSample:(id)a3 activeAlgorithmVersion:(int64_t)a4;
- (id)initForOnboarding:(BOOL)a3 upgradingFromAlgorithmVersion:(int64_t)a4;
- (void)_adjustDisclaimerLabelConstraints;
- (void)_adjustStackedButtonViewLocationForViewContentHeight;
- (void)_pauseResultViewVideos;
- (void)_playResultViewVideos;
- (void)_setStackedButtonViewAsFooterView;
- (void)_setUpAllResultViewConstraints;
- (void)_setUpAllResultViews;
- (void)_setUpBottomResultViewConstraint;
- (void)_setUpDisclaimerLabel;
- (void)_setUpOnlyResultView;
- (void)_setUpOnlyResultViewConstraints;
- (void)_setUpStackedButtonView;
- (void)_setUpTitle;
- (void)_setUpTitleConstraints;
- (void)_updateForCurrentSizeCategory;
- (void)linkTextView:(id)a3 didTapOnLinkInRange:(_NSRange)a4;
- (void)setAtrialFibrillationResultView:(id)a3;
- (void)setBottomResultView:(id)a3;
- (void)setContentViewBottomConstraint:(id)a3;
- (void)setDisclaimerLabel:(id)a3;
- (void)setDisclaimerLabelTopConstraint:(id)a3;
- (void)setElectrocardiogram:(id)a3;
- (void)setHighOrLowHeartRateResultView:(id)a3;
- (void)setInconclusiveResultView:(id)a3;
- (void)setOnlyResultView:(id)a3;
- (void)setPoorRecordingResultView:(id)a3;
- (void)setSinusRhythmResultReview:(id)a3;
- (void)setStackedButtonView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUpConstraints;
- (void)setUpUI;
- (void)setViewTopAnchor:(id)a3;
- (void)stackedButtonView:(id)a3 didTapButtonAtIndex:(int64_t)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewControllerDidLeaveAdaptiveModal;
- (void)viewControllerWillEnterAdaptiveModal;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HROnboardingECG2PossibleResultsViewController

- (HROnboardingECG2PossibleResultsViewController)initWithSample:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(HROnboardingECG2PossibleResultsViewController *)self initForOnboarding:0];
  v7 = (HROnboardingECG2PossibleResultsViewController *)v6;
  if (v6) {
    objc_storeStrong((id *)(v6 + 1072), a3);
  }

  return v7;
}

- (id)initForOnboarding:(BOOL)a3 upgradingFromAlgorithmVersion:(int64_t)a4
{
  BOOL v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HROnboardingECG2PossibleResultsViewController;
  id v5 = [(HROnboardingECG2PossibleResultsViewController *)&v9 initForOnboarding:a3 upgradingFromAlgorithmVersion:a4];
  uint64_t v6 = v5;
  if (v5) {
    BOOL v7 = !v4;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7) {
    [v5 configureNavigationButtonWithTypeCancelWithConfirmForElectrocardiogram];
  }
  return v6;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HROnboardingECG2PossibleResultsViewController;
  [(HROnboardingECG2PossibleResultsViewController *)&v3 viewDidLoad];
  [(HROnboardingECG2PossibleResultsViewController *)self _setStackedButtonViewAsFooterView];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HROnboardingECG2PossibleResultsViewController;
  [(HROnboardingECG2PossibleResultsViewController *)&v4 viewWillAppear:a3];
  [(HROnboardingECG2PossibleResultsViewController *)self _playResultViewVideos];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HROnboardingECG2PossibleResultsViewController;
  [(HROnboardingECG2PossibleResultsViewController *)&v4 viewDidDisappear:a3];
  [(HROnboardingECG2PossibleResultsViewController *)self _pauseResultViewVideos];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HROnboardingECG2PossibleResultsViewController;
  [(HROnboardingECG2PossibleResultsViewController *)&v3 viewDidLayoutSubviews];
  [(HROnboardingECG2PossibleResultsViewController *)self _adjustStackedButtonViewLocationForViewContentHeight];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HROnboardingECG2PossibleResultsViewController;
  [(HROnboardingECG2PossibleResultsViewController *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    id v5 = [(HROnboardingECG2PossibleResultsViewController *)self traitCollection];
    uint64_t v6 = [v5 preferredContentSizeCategory];
    BOOL v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0) {
      [(HROnboardingECG2PossibleResultsViewController *)self _updateForCurrentSizeCategory];
    }
  }
}

- (void)setUpUI
{
  v11.receiver = self;
  v11.super_class = (Class)HROnboardingECG2PossibleResultsViewController;
  [(HROnboardingECG2PossibleResultsViewController *)&v11 setUpUI];
  if (([(HROnboardingECG2PossibleResultsViewController *)self isOnboarding] & 1) != 0
    || ([(HROnboardingECG2PossibleResultsViewController *)self electrocardiogram],
        objc_super v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    [(HROnboardingECG2PossibleResultsViewController *)self _setUpTitle];
    id v4 = [(HROnboardingECG2PossibleResultsViewController *)self titleLabel];
    uint64_t v5 = [v4 lastBaselineAnchor];
  }
  else
  {
    id v4 = [(HROnboardingECG2PossibleResultsViewController *)self contentView];
    uint64_t v5 = [v4 topAnchor];
  }
  uint64_t v6 = (void *)v5;
  [(HROnboardingECG2PossibleResultsViewController *)self setViewTopAnchor:v5];

  BOOL v7 = [(HROnboardingECG2PossibleResultsViewController *)self electrocardiogram];

  if (v7)
  {
    [(HROnboardingECG2PossibleResultsViewController *)self _setUpOnlyResultView];
    char v8 = [(HROnboardingECG2PossibleResultsViewController *)self onlyResultView];
    objc_super v9 = [v8 title];
    [(HROnboardingECG2PossibleResultsViewController *)self setTitle:v9];
  }
  else
  {
    [(HROnboardingECG2PossibleResultsViewController *)self _setUpAllResultViews];
  }
  if ([(HROnboardingECG2PossibleResultsViewController *)self isOnboarding])
  {
    [(HROnboardingECG2PossibleResultsViewController *)self _setUpStackedButtonView];
  }
  else
  {
    v10 = [(HROnboardingECG2PossibleResultsViewController *)self electrocardiogram];

    if (!v10) {
      [(HROnboardingECG2PossibleResultsViewController *)self _setUpDisclaimerLabel];
    }
  }
}

- (void)setUpConstraints
{
  v5.receiver = self;
  v5.super_class = (Class)HROnboardingECG2PossibleResultsViewController;
  [(HROnboardingECG2PossibleResultsViewController *)&v5 setUpConstraints];
  if (([(HROnboardingECG2PossibleResultsViewController *)self isOnboarding] & 1) != 0
    || ([(HROnboardingECG2PossibleResultsViewController *)self electrocardiogram],
        objc_super v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    [(HROnboardingECG2PossibleResultsViewController *)self _setUpTitleConstraints];
  }
  id v4 = [(HROnboardingECG2PossibleResultsViewController *)self electrocardiogram];

  if (v4) {
    [(HROnboardingECG2PossibleResultsViewController *)self _setUpOnlyResultViewConstraints];
  }
  else {
    [(HROnboardingECG2PossibleResultsViewController *)self _setUpAllResultViewConstraints];
  }
  [(HROnboardingECG2PossibleResultsViewController *)self _setUpBottomResultViewConstraint];
}

- (void)_updateForCurrentSizeCategory
{
  [(HROnboardingECG2PossibleResultsViewController *)self _adjustDisclaimerLabelConstraints];
  id v3 = [(HROnboardingECG2PossibleResultsViewController *)self view];
  [v3 setNeedsLayout];
}

- (void)linkTextView:(id)a3 didTapOnLinkInRange:(_NSRange)a4
{
  id v9 = a3;
  id v4 = objc_msgSend(MEMORY[0x263EFFA40], "hk_heartRhythmDefaults");
  char v5 = objc_msgSend(v4, "hk_hfeModeEnabled");

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = [v9 URLIdentifier];
    if ((unint64_t)(v6 - 1) >= 2)
    {
      if (!v6) {
        goto LABEL_7;
      }
      BOOL v7 = 0;
    }
    else
    {
      BOOL v7 = NSURLFromHRLinkTextViewURLIdentifier([v9 URLIdentifier]);
    }
    char v8 = [MEMORY[0x263F01880] defaultWorkspace];
    [v8 openURL:v7 withOptions:0];
  }
LABEL_7:
}

- (void)stackedButtonView:(id)a3 didTapButtonAtIndex:(int64_t)a4
{
  if (!a4)
  {
    id v5 = [(HROnboardingECG2PossibleResultsViewController *)self delegate];
    [v5 stepForward];
  }
}

- (void)_setUpTitle
{
  id v3 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HROnboardingECG2PossibleResultsViewController *)self setTitleLabel:v3];

  uint64_t v4 = HRUIECGLocalizedString(@"ECG_ONBOARDING_3_TITLE");
  id v5 = [(HROnboardingECG2PossibleResultsViewController *)self titleLabel];
  [v5 setText:v4];

  uint64_t v6 = [NSString healthAccessibilityIdentifier:1 suffix:@"Onboarding.PageTitle"];
  BOOL v7 = [(HROnboardingECG2PossibleResultsViewController *)self titleLabel];
  [v7 setAccessibilityIdentifier:v6];

  char v8 = [(HROnboardingECG2PossibleResultsViewController *)self titleLabel];
  [v8 setTextAlignment:1];

  id v9 = [(HROnboardingECG2PossibleResultsViewController *)self titleFont];
  v10 = [(HROnboardingECG2PossibleResultsViewController *)self titleLabel];
  [v10 setFont:v9];

  objc_super v11 = [(HROnboardingECG2PossibleResultsViewController *)self titleLabel];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  v12 = [(HROnboardingECG2PossibleResultsViewController *)self titleLabel];
  [v12 setNumberOfLines:0];

  id v14 = [(HROnboardingECG2PossibleResultsViewController *)self contentView];
  v13 = [(HROnboardingECG2PossibleResultsViewController *)self titleLabel];
  [v14 addSubview:v13];
}

- (void)_setUpTitleConstraints
{
  id v3 = [(HROnboardingECG2PossibleResultsViewController *)self titleLabel];
  uint64_t v4 = [(HROnboardingECG2PossibleResultsViewController *)self contentView];
  HKHealthUIBuddyDirectionalEdgeInsets();
  objc_msgSend(v3, "hrui_alignHorizontalConstraintsWithView:insets:", v4);

  id v9 = [(HROnboardingECG2PossibleResultsViewController *)self titleLabel];
  id v5 = [v9 topAnchor];
  uint64_t v6 = [(HROnboardingECG2PossibleResultsViewController *)self contentView];
  BOOL v7 = [v6 topAnchor];
  [(HROnboardingECG2PossibleResultsViewController *)self contentTop];
  char v8 = objc_msgSend(v5, "constraintEqualToAnchor:constant:", v7);
  [v8 setActive:1];
}

- (id)_resultViewForSample:(id)a3 activeAlgorithmVersion:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 privateClassification];
  char v8 = [v6 _algorithmVersion];

  id v9 = +[HRElectrocardiogramResultViewItem viewItemWithClassification:v7 sampleAlgorithmVersion:v8 forAlgorithmVersion:a4 upgradingFromAlgorithmVersion:*MEMORY[0x263F0AA58] learnMoreDelegate:self];

  if (v9)
  {
    v10 = +[HROnboardingElectrocardiogramResultView resultViewWithItem:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_setUpOnlyResultView
{
  id v3 = [(HROnboardingECG2PossibleResultsViewController *)self electrocardiogram];
  uint64_t v4 = [(HROnboardingECG2PossibleResultsViewController *)self _resultViewForSample:v3 activeAlgorithmVersion:2];
  [(HROnboardingECG2PossibleResultsViewController *)self setOnlyResultView:v4];

  id v5 = [(HROnboardingECG2PossibleResultsViewController *)self onlyResultView];
  [v5 setHideNumberedTitle:1];

  id v6 = [(HROnboardingECG2PossibleResultsViewController *)self onlyResultView];
  [v6 setShouldHideSeparatorLine:1];

  uint64_t v7 = [(HROnboardingECG2PossibleResultsViewController *)self onlyResultView];
  [v7 setAlwaysExpanded:1];

  char v8 = [(HROnboardingECG2PossibleResultsViewController *)self onlyResultView];

  if (v8)
  {
    id v9 = [(HROnboardingECG2PossibleResultsViewController *)self contentView];
    v10 = [(HROnboardingECG2PossibleResultsViewController *)self onlyResultView];
    [v9 addSubview:v10];
  }
  id v11 = [(HROnboardingECG2PossibleResultsViewController *)self onlyResultView];
  [(HROnboardingECG2PossibleResultsViewController *)self setBottomResultView:v11];
}

- (void)_setUpOnlyResultViewConstraints
{
  id v3 = [(HROnboardingECG2PossibleResultsViewController *)self onlyResultView];
  uint64_t v4 = [(HROnboardingECG2PossibleResultsViewController *)self contentView];
  HKHealthUIBuddyDirectionalEdgeInsets();
  objc_msgSend(v3, "hrui_alignHorizontalConstraintsWithView:insets:", v4);

  id v8 = [(HROnboardingECG2PossibleResultsViewController *)self onlyResultView];
  id v5 = [v8 topAnchor];
  id v6 = [(HROnboardingECG2PossibleResultsViewController *)self viewTopAnchor];
  uint64_t v7 = [v5 constraintEqualToAnchor:v6];
  [v7 setActive:1];
}

- (void)_setUpAllResultViews
{
  id v23 = +[HRElectrocardiogramResultViewItem viewItemWithClassification:3 sampleAlgorithmVersion:0 forAlgorithmVersion:2 upgradingFromAlgorithmVersion:[(HROnboardingECG2PossibleResultsViewController *)self upgradingFromAlgorithmVersion] learnMoreDelegate:0];
  id v3 = +[HROnboardingElectrocardiogramResultView resultViewWithItem:v23];
  [(HROnboardingECG2PossibleResultsViewController *)self setSinusRhythmResultReview:v3];

  uint64_t v4 = [(HROnboardingECG2PossibleResultsViewController *)self contentView];
  id v5 = [(HROnboardingECG2PossibleResultsViewController *)self sinusRhythmResultReview];
  [v4 addSubview:v5];

  id v6 = +[HRElectrocardiogramResultViewItem viewItemWithClassification:8 sampleAlgorithmVersion:0 forAlgorithmVersion:2 upgradingFromAlgorithmVersion:[(HROnboardingECG2PossibleResultsViewController *)self upgradingFromAlgorithmVersion] learnMoreDelegate:0];
  uint64_t v7 = +[HROnboardingElectrocardiogramResultView resultViewWithItem:v6];
  [(HROnboardingECG2PossibleResultsViewController *)self setAtrialFibrillationResultView:v7];

  id v8 = [(HROnboardingECG2PossibleResultsViewController *)self contentView];
  id v9 = [(HROnboardingECG2PossibleResultsViewController *)self atrialFibrillationResultView];
  [v8 addSubview:v9];

  v10 = +[HRElectrocardiogramResultViewItem viewItemWithClassification:6 sampleAlgorithmVersion:0 forAlgorithmVersion:2 upgradingFromAlgorithmVersion:[(HROnboardingECG2PossibleResultsViewController *)self upgradingFromAlgorithmVersion] learnMoreDelegate:0];
  id v11 = +[HROnboardingElectrocardiogramResultView resultViewWithItem:v10];
  [(HROnboardingECG2PossibleResultsViewController *)self setHighOrLowHeartRateResultView:v11];

  v12 = [(HROnboardingECG2PossibleResultsViewController *)self contentView];
  v13 = [(HROnboardingECG2PossibleResultsViewController *)self highOrLowHeartRateResultView];
  [v12 addSubview:v13];

  id v14 = +[HRElectrocardiogramResultViewItem viewItemWithClassification:2 sampleAlgorithmVersion:0 forAlgorithmVersion:2 upgradingFromAlgorithmVersion:[(HROnboardingECG2PossibleResultsViewController *)self upgradingFromAlgorithmVersion] learnMoreDelegate:self];
  v15 = +[HROnboardingElectrocardiogramResultView resultViewWithItem:v14];
  [(HROnboardingECG2PossibleResultsViewController *)self setInconclusiveResultView:v15];

  v16 = [(HROnboardingECG2PossibleResultsViewController *)self contentView];
  v17 = [(HROnboardingECG2PossibleResultsViewController *)self inconclusiveResultView];
  [v16 addSubview:v17];

  v18 = +[HRElectrocardiogramResultViewItem viewItemWithClassification:1 sampleAlgorithmVersion:0 forAlgorithmVersion:2 upgradingFromAlgorithmVersion:[(HROnboardingECG2PossibleResultsViewController *)self upgradingFromAlgorithmVersion] learnMoreDelegate:self];
  v19 = +[HROnboardingElectrocardiogramResultView resultViewWithItem:v18];
  [(HROnboardingECG2PossibleResultsViewController *)self setPoorRecordingResultView:v19];

  v20 = [(HROnboardingECG2PossibleResultsViewController *)self contentView];
  v21 = [(HROnboardingECG2PossibleResultsViewController *)self poorRecordingResultView];
  [v20 addSubview:v21];

  v22 = [(HROnboardingECG2PossibleResultsViewController *)self poorRecordingResultView];
  [(HROnboardingECG2PossibleResultsViewController *)self setBottomResultView:v22];
}

- (void)_setUpAllResultViewConstraints
{
  id v3 = [(HROnboardingECG2PossibleResultsViewController *)self sinusRhythmResultReview];
  uint64_t v4 = [(HROnboardingECG2PossibleResultsViewController *)self contentView];
  HKHealthUIBuddyDirectionalEdgeInsets();
  objc_msgSend(v3, "hrui_alignHorizontalConstraintsWithView:insets:", v4);

  id v5 = [(HROnboardingECG2PossibleResultsViewController *)self sinusRhythmResultReview];
  id v6 = [v5 topAnchor];
  uint64_t v7 = [(HROnboardingECG2PossibleResultsViewController *)self viewTopAnchor];
  id v8 = [v6 constraintEqualToAnchor:v7];
  [v8 setActive:1];

  id v9 = [(HROnboardingECG2PossibleResultsViewController *)self atrialFibrillationResultView];
  v10 = [(HROnboardingECG2PossibleResultsViewController *)self sinusRhythmResultReview];
  objc_msgSend(v9, "hk_alignHorizontalConstraintsWithView:margin:", v10, 0.0);

  id v11 = [(HROnboardingECG2PossibleResultsViewController *)self atrialFibrillationResultView];
  v12 = [v11 topAnchor];
  v13 = [(HROnboardingECG2PossibleResultsViewController *)self sinusRhythmResultReview];
  id v14 = [v13 bottomAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  [v15 setActive:1];

  v16 = [(HROnboardingECG2PossibleResultsViewController *)self highOrLowHeartRateResultView];
  v17 = [(HROnboardingECG2PossibleResultsViewController *)self sinusRhythmResultReview];
  objc_msgSend(v16, "hk_alignHorizontalConstraintsWithView:margin:", v17, 0.0);

  v18 = [(HROnboardingECG2PossibleResultsViewController *)self highOrLowHeartRateResultView];
  v19 = [v18 topAnchor];
  v20 = [(HROnboardingECG2PossibleResultsViewController *)self atrialFibrillationResultView];
  v21 = [v20 bottomAnchor];
  v22 = [v19 constraintEqualToAnchor:v21];
  [v22 setActive:1];

  id v23 = [(HROnboardingECG2PossibleResultsViewController *)self inconclusiveResultView];
  v24 = [(HROnboardingECG2PossibleResultsViewController *)self sinusRhythmResultReview];
  objc_msgSend(v23, "hk_alignHorizontalConstraintsWithView:margin:", v24, 0.0);

  v25 = [(HROnboardingECG2PossibleResultsViewController *)self inconclusiveResultView];
  v26 = [v25 topAnchor];
  v27 = [(HROnboardingECG2PossibleResultsViewController *)self highOrLowHeartRateResultView];
  v28 = [v27 bottomAnchor];
  v29 = [v26 constraintEqualToAnchor:v28];
  [v29 setActive:1];

  v30 = [(HROnboardingECG2PossibleResultsViewController *)self poorRecordingResultView];
  v31 = [(HROnboardingECG2PossibleResultsViewController *)self sinusRhythmResultReview];
  objc_msgSend(v30, "hk_alignHorizontalConstraintsWithView:margin:", v31, 0.0);

  id v36 = [(HROnboardingECG2PossibleResultsViewController *)self poorRecordingResultView];
  v32 = [v36 topAnchor];
  v33 = [(HROnboardingECG2PossibleResultsViewController *)self inconclusiveResultView];
  v34 = [v33 bottomAnchor];
  v35 = [v32 constraintEqualToAnchor:v34];
  [v35 setActive:1];
}

- (void)_setUpBottomResultViewConstraint
{
  uint64_t v3 = [(HROnboardingECG2PossibleResultsViewController *)self bottomResultView];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    id v5 = [(HROnboardingECG2PossibleResultsViewController *)self contentViewBottomConstraint];

    if (!v5)
    {
      id v6 = [(HROnboardingECG2PossibleResultsViewController *)self contentView];
      uint64_t v7 = [v6 bottomAnchor];
      id v8 = [(HROnboardingECG2PossibleResultsViewController *)self bottomResultView];
      id v9 = [v8 bottomAnchor];
      v10 = [v7 constraintEqualToAnchor:v9];
      [(HROnboardingECG2PossibleResultsViewController *)self setContentViewBottomConstraint:v10];

      id v11 = [(HROnboardingECG2PossibleResultsViewController *)self contentViewBottomConstraint];
      [v11 setActive:1];
    }
  }
}

- (void)_setUpDisclaimerLabel
{
  id v15 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HROnboardingECG2PossibleResultsViewController *)self setDisclaimerLabel:v15];
  [v15 setAdjustsFontForContentSizeCategory:1];
  [v15 setNumberOfLines:0];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v3 = [(HROnboardingECG2PossibleResultsViewController *)self contentView];
  [v3 addSubview:v15];

  uint64_t v4 = [(HROnboardingECG2PossibleResultsViewController *)self titleLabel];
  objc_msgSend(v15, "hk_alignHorizontalConstraintsWithView:margin:", v4, 0.0);

  id v5 = [v15 firstBaselineAnchor];
  id v6 = [(HROnboardingECG2PossibleResultsViewController *)self bottomResultView];
  uint64_t v7 = [v6 bottomAnchor];
  id v8 = [v5 constraintEqualToAnchor:v7];
  [(HROnboardingECG2PossibleResultsViewController *)self setDisclaimerLabelTopConstraint:v8];

  id v9 = [(HROnboardingECG2PossibleResultsViewController *)self disclaimerLabelTopConstraint];
  [v9 setActive:1];

  v10 = [(HROnboardingECG2PossibleResultsViewController *)self contentView];
  id v11 = [v10 bottomAnchor];
  v12 = [v15 bottomAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  [(HROnboardingECG2PossibleResultsViewController *)self setContentViewBottomConstraint:v13];

  id v14 = [(HROnboardingECG2PossibleResultsViewController *)self contentViewBottomConstraint];
  [v14 setActive:1];

  [(HROnboardingECG2PossibleResultsViewController *)self _adjustDisclaimerLabelConstraints];
}

- (void)_adjustDisclaimerLabelConstraints
{
  uint64_t v3 = [(HROnboardingECG2PossibleResultsViewController *)self disclaimerLabelTopConstraint];

  if (v3)
  {
    uint64_t v4 = *MEMORY[0x263F1D2C0];
    id v17 = (id)[objc_alloc(MEMORY[0x263F1C668]) initForTextStyle:*MEMORY[0x263F1D2C0]];
    [v17 scaledValueForValue:40.0];
    double v6 = v5;
    uint64_t v7 = [(HROnboardingECG2PossibleResultsViewController *)self disclaimerLabelTopConstraint];
    [v7 setConstant:v6];

    id v8 = [(HROnboardingECG2PossibleResultsViewController *)self contentViewBottomConstraint];
    [v8 setConstant:v6];

    id v9 = (void *)MEMORY[0x263F089B8];
    v10 = HRUIECGLocalizedString(@"ECG_ONBOARDING_3_FOOTER");
    id v11 = [MEMORY[0x263F1C550] secondaryLabelColor];
    v12 = HRUIECGLocalizedString(@"ECG_ONBOARDING_3_BOLD_FOOTER");
    v13 = objc_msgSend(v9, "hrui_attributedStringForText:style:color:boldText:", v10, v4, v11, v12);

    id v14 = [(HROnboardingECG2PossibleResultsViewController *)self disclaimerLabel];
    [v14 setAttributedText:v13];

    id v15 = [NSString healthAccessibilityIdentifier:1 suffix:@"ResultsYouMaySee.Note"];
    v16 = [(HROnboardingECG2PossibleResultsViewController *)self disclaimerLabel];
    [v16 setAccessibilityIdentifier:v15];
  }
}

- (void)_setUpStackedButtonView
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = HRHeartRhythmUIFrameworkBundle();
  uint64_t v4 = [v3 localizedStringForKey:@"ONBOARDING_CONTINUE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable"];
  v12[0] = v4;
  double v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  double v6 = HRUIECGLocalizedString(@"ECG_ONBOARDING_3_FOOTER");
  uint64_t v7 = HRUIECGLocalizedString(@"ECG_ONBOARDING_3_BOLD_FOOTER");
  id v8 = +[HRStackedButtonView buddyStackedButtonViewWithTitles:v5 footerText:v6 boldFooterText:v7 delegate:self];
  [(HROnboardingECG2PossibleResultsViewController *)self setStackedButtonView:v8];

  id v9 = [(HROnboardingECG2PossibleResultsViewController *)self stackedButtonView];
  [v9 setBlurHidden:1];

  v10 = [(HROnboardingECG2PossibleResultsViewController *)self stackedButtonView];
  [v10 setFixedBottomButtonSpacing:1];

  id v11 = [(HROnboardingECG2PossibleResultsViewController *)self stackedButtonView];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (void)_setStackedButtonViewAsFooterView
{
  if ([(HROnboardingECG2PossibleResultsViewController *)self isOnboarding])
  {
    uint64_t v3 = [(HROnboardingECG2PossibleResultsViewController *)self stackedButtonView];

    if (v3)
    {
      uint64_t v4 = [(HROnboardingECG2PossibleResultsViewController *)self stackedButtonView];
      HKHealthUIBuddyDirectionalEdgeInsets();
      -[HROnboardingECG2PossibleResultsViewController setFooterView:insets:](self, "setFooterView:insets:", v4);

      id v6 = [(HROnboardingECG2PossibleResultsViewController *)self stackedButtonView];
      double v5 = [(HROnboardingECG2PossibleResultsViewController *)self view];
      [v6 alignBlurViewHorizontalConstraintsWithView:v5];
    }
  }
}

- (void)_adjustStackedButtonViewLocationForViewContentHeight
{
  v45[1] = *MEMORY[0x263EF8340];
  if ([(HROnboardingECG2PossibleResultsViewController *)self isOnboarding])
  {
    uint64_t v3 = [(HROnboardingECG2PossibleResultsViewController *)self stackedButtonView];

    if (v3)
    {
      uint64_t v4 = [(HROnboardingECG2PossibleResultsViewController *)self view];
      [v4 layoutIfNeeded];

      double v5 = [(HROnboardingECG2PossibleResultsViewController *)self view];
      id v6 = [(HROnboardingECG2PossibleResultsViewController *)self stackedButtonView];
      uint64_t v7 = [v6 buttons];
      id v8 = [v7 firstObject];
      [v8 frame];
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      id v17 = [(HROnboardingECG2PossibleResultsViewController *)self stackedButtonView];
      objc_msgSend(v5, "convertRect:fromView:", v17, v10, v12, v14, v16);
      double v19 = v18;

      v20 = [(HROnboardingECG2PossibleResultsViewController *)self contentView];
      [v20 frame];
      double v22 = v21;
      id v23 = [(HROnboardingECG2PossibleResultsViewController *)self view];
      [v23 safeAreaInsets];
      double v25 = v19 - v24;

      if (v22 > v25)
      {
        [(HROnboardingECG2PossibleResultsViewController *)self removeFooterView];
        v26 = [(HROnboardingECG2PossibleResultsViewController *)self contentView];
        v27 = [(HROnboardingECG2PossibleResultsViewController *)self stackedButtonView];
        [v26 addSubview:v27];

        v28 = [(HROnboardingECG2PossibleResultsViewController *)self stackedButtonView];
        v29 = [(HROnboardingECG2PossibleResultsViewController *)self titleLabel];
        objc_msgSend(v28, "hk_alignHorizontalConstraintsWithView:margin:", v29, 0.0);

        v30 = [(HROnboardingECG2PossibleResultsViewController *)self stackedButtonView];
        v31 = [v30 topAnchor];
        v32 = [(HROnboardingECG2PossibleResultsViewController *)self bottomResultView];
        v33 = [v32 bottomAnchor];
        v34 = [v31 constraintEqualToAnchor:v33];
        [v34 setActive:1];

        v35 = [(HROnboardingECG2PossibleResultsViewController *)self contentViewBottomConstraint];

        if (v35)
        {
          id v36 = (void *)MEMORY[0x263F08938];
          v37 = [(HROnboardingECG2PossibleResultsViewController *)self contentViewBottomConstraint];
          v45[0] = v37;
          v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:1];
          [v36 deactivateConstraints:v38];
        }
        [(HROnboardingECG2PossibleResultsViewController *)self setContentViewBottomConstraint:0];
        v39 = [(HROnboardingECG2PossibleResultsViewController *)self contentView];
        v40 = [v39 bottomAnchor];
        v41 = [(HROnboardingECG2PossibleResultsViewController *)self stackedButtonView];
        v42 = [v41 bottomAnchor];
        v43 = [v40 constraintEqualToAnchor:v42];
        [(HROnboardingECG2PossibleResultsViewController *)self setContentViewBottomConstraint:v43];

        v44 = [(HROnboardingECG2PossibleResultsViewController *)self contentViewBottomConstraint];
        [v44 setActive:1];
      }
    }
  }
}

- (void)_playResultViewVideos
{
  uint64_t v3 = [MEMORY[0x263EF93E0] sharedInstance];
  [v3 setCategory:*MEMORY[0x263EF9048] error:0];

  uint64_t v4 = [(HROnboardingECG2PossibleResultsViewController *)self electrocardiogram];

  if (v4)
  {
    [(HROnboardingECG2PossibleResultsViewController *)self bottomResultView];
  }
  else
  {
    double v5 = [(HROnboardingECG2PossibleResultsViewController *)self sinusRhythmResultReview];
    id v6 = [v5 playerView];
    [v6 play];

    uint64_t v7 = [(HROnboardingECG2PossibleResultsViewController *)self atrialFibrillationResultView];
    id v8 = [v7 playerView];
    [v8 play];

    double v9 = [(HROnboardingECG2PossibleResultsViewController *)self highOrLowHeartRateResultView];
    double v10 = [v9 playerView];
    [v10 play];

    [(HROnboardingECG2PossibleResultsViewController *)self inconclusiveResultView];
  }
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  double v11 = [v12 playerView];
  [v11 play];
}

- (void)_pauseResultViewVideos
{
  uint64_t v3 = [(HROnboardingECG2PossibleResultsViewController *)self electrocardiogram];

  if (v3)
  {
    [(HROnboardingECG2PossibleResultsViewController *)self bottomResultView];
  }
  else
  {
    uint64_t v4 = [(HROnboardingECG2PossibleResultsViewController *)self sinusRhythmResultReview];
    double v5 = [v4 playerView];
    [v5 pause];

    id v6 = [(HROnboardingECG2PossibleResultsViewController *)self atrialFibrillationResultView];
    uint64_t v7 = [v6 playerView];
    [v7 pause];

    id v8 = [(HROnboardingECG2PossibleResultsViewController *)self highOrLowHeartRateResultView];
    double v9 = [v8 playerView];
    [v9 pause];

    [(HROnboardingECG2PossibleResultsViewController *)self inconclusiveResultView];
  }
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  double v10 = [v11 playerView];
  [v10 pause];
}

- (void)viewControllerWillEnterAdaptiveModal
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x263F1C468]);
  uint64_t v4 = (void *)MEMORY[0x263F1C3C0];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  double v10 = __85__HROnboardingECG2PossibleResultsViewController_viewControllerWillEnterAdaptiveModal__block_invoke;
  id v11 = &unk_264580E18;
  objc_copyWeak(&v12, &location);
  double v5 = [v4 actionWithHandler:&v8];
  id v6 = objc_msgSend(v3, "initWithBarButtonSystemItem:primaryAction:", 0, v5, v8, v9, v10, v11);

  uint64_t v7 = [(HROnboardingECG2PossibleResultsViewController *)self navigationItem];
  [v7 setLeftBarButtonItem:v6];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __85__HROnboardingECG2PossibleResultsViewController_viewControllerWillEnterAdaptiveModal__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

- (void)viewControllerDidLeaveAdaptiveModal
{
  id v2 = [(HROnboardingECG2PossibleResultsViewController *)self navigationItem];
  [v2 setLeftBarButtonItem:0];
}

- (HKElectrocardiogram)electrocardiogram
{
  return self->_electrocardiogram;
}

- (void)setElectrocardiogram:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (HROnboardingElectrocardiogramResultView)sinusRhythmResultReview
{
  return self->_sinusRhythmResultReview;
}

- (void)setSinusRhythmResultReview:(id)a3
{
}

- (HROnboardingElectrocardiogramResultView)atrialFibrillationResultView
{
  return self->_atrialFibrillationResultView;
}

- (void)setAtrialFibrillationResultView:(id)a3
{
}

- (HROnboardingElectrocardiogramResultView)highOrLowHeartRateResultView
{
  return self->_highOrLowHeartRateResultView;
}

- (void)setHighOrLowHeartRateResultView:(id)a3
{
}

- (HROnboardingElectrocardiogramResultView)poorRecordingResultView
{
  return self->_poorRecordingResultView;
}

- (void)setPoorRecordingResultView:(id)a3
{
}

- (HROnboardingElectrocardiogramResultView)inconclusiveResultView
{
  return self->_inconclusiveResultView;
}

- (void)setInconclusiveResultView:(id)a3
{
}

- (HROnboardingElectrocardiogramResultView)onlyResultView
{
  return self->_onlyResultView;
}

- (void)setOnlyResultView:(id)a3
{
}

- (HROnboardingElectrocardiogramResultView)bottomResultView
{
  return self->_bottomResultView;
}

- (void)setBottomResultView:(id)a3
{
}

- (UILabel)disclaimerLabel
{
  return self->_disclaimerLabel;
}

- (void)setDisclaimerLabel:(id)a3
{
}

- (HRStackedButtonView)stackedButtonView
{
  return self->_stackedButtonView;
}

- (void)setStackedButtonView:(id)a3
{
}

- (NSLayoutAnchor)viewTopAnchor
{
  return self->_viewTopAnchor;
}

- (void)setViewTopAnchor:(id)a3
{
}

- (NSLayoutConstraint)contentViewBottomConstraint
{
  return self->_contentViewBottomConstraint;
}

- (void)setContentViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)disclaimerLabelTopConstraint
{
  return self->_disclaimerLabelTopConstraint;
}

- (void)setDisclaimerLabelTopConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disclaimerLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_viewTopAnchor, 0);
  objc_storeStrong((id *)&self->_stackedButtonView, 0);
  objc_storeStrong((id *)&self->_disclaimerLabel, 0);
  objc_storeStrong((id *)&self->_bottomResultView, 0);
  objc_storeStrong((id *)&self->_onlyResultView, 0);
  objc_storeStrong((id *)&self->_inconclusiveResultView, 0);
  objc_storeStrong((id *)&self->_poorRecordingResultView, 0);
  objc_storeStrong((id *)&self->_highOrLowHeartRateResultView, 0);
  objc_storeStrong((id *)&self->_atrialFibrillationResultView, 0);
  objc_storeStrong((id *)&self->_sinusRhythmResultReview, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_electrocardiogram, 0);
}

@end