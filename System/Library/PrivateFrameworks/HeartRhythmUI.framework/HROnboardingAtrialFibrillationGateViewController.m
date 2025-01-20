@interface HROnboardingAtrialFibrillationGateViewController
- (BOOL)_meetsAgeRequirement;
- (BOOL)_meetsDiagnosisRequirement;
- (BOOL)didLayoutSubviewsOnce;
- (HKSeparatorLineView)birthdayBottomSeparator;
- (HKSeparatorLineView)birthdayTopSeparator;
- (HKSeparatorLineView)diagnosisBottomSeparator;
- (HKSeparatorLineView)diagnosisMiddleSeparator;
- (HKSeparatorLineView)diagnosisTopSeparator;
- (HRStackedButtonView)stackedButtonView;
- (NSDate)dateOfBirth;
- (NSLayoutConstraint)contentViewBottomConstraint;
- (NSNumber)diagnosis;
- (NSNumber)prefilledDiagnosis;
- (UIImageView)diagnosisNoCheckmark;
- (UIImageView)diagnosisYesCheckmark;
- (UILabel)birthdayFooterLabel;
- (UILabel)bodyLabel;
- (UILabel)diagnosisFooterLabel;
- (UILabel)diagnosisNoLabel;
- (UILabel)diagnosisPromptLabel;
- (UILabel)diagnosisYesLabel;
- (UILabel)titleLabel;
- (UIStackView)birthdayEntryView;
- (UIStackView)diagnosisNoRow;
- (UIStackView)diagnosisYesRow;
- (UIView)diagnosisNoBackground;
- (UIView)diagnosisYesBackground;
- (double)_ageEntryFooterToDiagnosisPromptFirstBaseline;
- (double)_ageEntryLastBaselineToBottomSeparator;
- (double)_ageEntryTopSeparatorToFirstBaseline;
- (double)_diagnosisFooterLabelToContinueButton;
- (double)_diagnosisLastBaselineToBottomSeparator;
- (double)_diagnosisPromptLastBaselineToDiagnosisTop;
- (double)_diagnosisTopSeparatorToFirstBaseline;
- (double)_separatorToFooterFirstBaseline;
- (id)_ageEntryTitleFont;
- (id)_bodyFont;
- (id)_defaultDOB;
- (id)_diagnosisPromptFont;
- (id)_footnoteFont;
- (id)ageIneligiblePromptAckButtonString;
- (id)ageIneligiblePromptBodyString;
- (id)ageIneligiblePromptTitleString;
- (id)ageLimit;
- (id)ageWithDate:(id)a3;
- (id)axidForElementWithString:(id)a3;
- (id)diagnosisIneligiblePromptAckButtonString;
- (id)diagnosisIneligiblePromptBodyString;
- (id)diagnosisIneligiblePromptTitleString;
- (id)initForOnboarding:(BOOL)a3 hasAtrialFibrillationDiagnosis:(id)a4;
- (id)initForOnboarding:(BOOL)a3 upgradingFromAlgorithmVersion:(int64_t)a4;
- (void)_adjustButtonFooterViewLocationForViewContentHeight;
- (void)_diagnosisRowTapped:(id)a3;
- (void)_setUpBirthdayEntryView;
- (void)_setUpButtonFooterView;
- (void)_setUpDiagnosisRowWithTitle:(id)a3 value:(BOOL)a4;
- (void)_updateButtonState;
- (void)compactDatePickerView:(id)a3 didChangeValue:(id)a4;
- (void)setBirthdayBottomSeparator:(id)a3;
- (void)setBirthdayEntryView:(id)a3;
- (void)setBirthdayFooterLabel:(id)a3;
- (void)setBirthdayTopSeparator:(id)a3;
- (void)setBodyLabel:(id)a3;
- (void)setContentViewBottomConstraint:(id)a3;
- (void)setDateOfBirth:(id)a3;
- (void)setDiagnosis:(id)a3;
- (void)setDiagnosisBottomSeparator:(id)a3;
- (void)setDiagnosisFooterLabel:(id)a3;
- (void)setDiagnosisMiddleSeparator:(id)a3;
- (void)setDiagnosisNoBackground:(id)a3;
- (void)setDiagnosisNoCheckmark:(id)a3;
- (void)setDiagnosisNoLabel:(id)a3;
- (void)setDiagnosisNoRow:(id)a3;
- (void)setDiagnosisPromptLabel:(id)a3;
- (void)setDiagnosisTopSeparator:(id)a3;
- (void)setDiagnosisYesBackground:(id)a3;
- (void)setDiagnosisYesCheckmark:(id)a3;
- (void)setDiagnosisYesLabel:(id)a3;
- (void)setDiagnosisYesRow:(id)a3;
- (void)setDidLayoutSubviewsOnce:(BOOL)a3;
- (void)setPrefilledDiagnosis:(id)a3;
- (void)setStackedButtonView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUpConstraints;
- (void)setUpUI;
- (void)stackedButtonView:(id)a3 didTapButtonAtIndex:(int64_t)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation HROnboardingAtrialFibrillationGateViewController

- (id)initForOnboarding:(BOOL)a3 upgradingFromAlgorithmVersion:(int64_t)a4
{
  BOOL v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HROnboardingAtrialFibrillationGateViewController;
  v5 = [(HROnboardingAtrialFibrillationGateViewController *)&v8 initForOnboarding:a3 upgradingFromAlgorithmVersion:a4];
  v6 = v5;
  if (v5)
  {
    v5[1072] = 0;
    if (v4) {
      [v5 configureNavigationButtonWithTypeCancelWithConfirmForAtrialFibrillation];
    }
  }
  return v6;
}

- (id)initForOnboarding:(BOOL)a3 hasAtrialFibrillationDiagnosis:(id)a4
{
  BOOL v5 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HROnboardingAtrialFibrillationGateViewController;
  objc_super v8 = (id *)[(HROnboardingAtrialFibrillationGateViewController *)&v11 initForOnboarding:v5];
  v9 = v8;
  if (v8)
  {
    *((unsigned char *)v8 + 1072) = 0;
    if (v5) {
      [v8 configureNavigationButtonWithTypeCancelWithConfirmForAtrialFibrillation];
    }
    objc_storeStrong(v9 + 144, a4);
  }

  return v9;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HROnboardingAtrialFibrillationGateViewController;
  [(HROnboardingAtrialFibrillationGateViewController *)&v3 viewDidLoad];
  [(HROnboardingAtrialFibrillationGateViewController *)self _setUpButtonFooterView];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HROnboardingAtrialFibrillationGateViewController;
  [(HROnboardingAtrialFibrillationGateViewController *)&v3 viewDidLayoutSubviews];
  if (!self->_didLayoutSubviewsOnce)
  {
    self->_didLayoutSubviewsOnce = 1;
    [(HROnboardingAtrialFibrillationGateViewController *)self _adjustButtonFooterViewLocationForViewContentHeight];
  }
}

- (void)setUpUI
{
  v96[1] = *MEMORY[0x263EF8340];
  v95.receiver = self;
  v95.super_class = (Class)HROnboardingAtrialFibrillationGateViewController;
  [(HROnboardingAtrialFibrillationGateViewController *)&v95 setUpUI];
  id v3 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HROnboardingAtrialFibrillationGateViewController *)self setTitleLabel:v3];

  BOOL v4 = HRHeartRhythmUIFrameworkBundle();
  BOOL v5 = [v4 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_GATE_TITLE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];
  v6 = [(HROnboardingAtrialFibrillationGateViewController *)self titleLabel];
  [v6 setText:v5];

  id v7 = [(HROnboardingAtrialFibrillationGateViewController *)self titleLabel];
  [v7 setTextAlignment:1];

  objc_super v8 = [(HROnboardingAtrialFibrillationGateViewController *)self titleFont];
  v9 = [(HROnboardingAtrialFibrillationGateViewController *)self titleLabel];
  [v9 setFont:v8];

  v10 = [(HROnboardingAtrialFibrillationGateViewController *)self titleLabel];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v11 = [(HROnboardingAtrialFibrillationGateViewController *)self titleLabel];
  [v11 setNumberOfLines:0];

  v12 = [(HROnboardingAtrialFibrillationGateViewController *)self contentView];
  v13 = [(HROnboardingAtrialFibrillationGateViewController *)self titleLabel];
  [v12 addSubview:v13];

  id v14 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HROnboardingAtrialFibrillationGateViewController *)self setBodyLabel:v14];

  v15 = HRHeartRhythmUIFrameworkBundle();
  v16 = [v15 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_GATE_BODY" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];
  v17 = [(HROnboardingAtrialFibrillationGateViewController *)self bodyLabel];
  [v17 setText:v16];

  v18 = [(HROnboardingAtrialFibrillationGateViewController *)self bodyLabel];
  [v18 setTextAlignment:1];

  v19 = [(HROnboardingAtrialFibrillationGateViewController *)self _bodyFont];
  v20 = [(HROnboardingAtrialFibrillationGateViewController *)self bodyLabel];
  [v20 setFont:v19];

  v21 = [(HROnboardingAtrialFibrillationGateViewController *)self bodyLabel];
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];

  v22 = [(HROnboardingAtrialFibrillationGateViewController *)self bodyLabel];
  [v22 setNumberOfLines:0];

  v23 = [(HROnboardingAtrialFibrillationGateViewController *)self axidForElementWithString:@"GetStartedSubtitle"];
  v24 = [(HROnboardingAtrialFibrillationGateViewController *)self bodyLabel];
  [v24 setAccessibilityIdentifier:v23];

  v25 = [(HROnboardingAtrialFibrillationGateViewController *)self contentView];
  v26 = [(HROnboardingAtrialFibrillationGateViewController *)self bodyLabel];
  [v25 addSubview:v26];

  v27 = objc_msgSend(MEMORY[0x263F46968], "_hrafibgate_separatorView");
  [(HROnboardingAtrialFibrillationGateViewController *)self setBirthdayTopSeparator:v27];

  v28 = [(HROnboardingAtrialFibrillationGateViewController *)self birthdayTopSeparator];
  [v28 setTranslatesAutoresizingMaskIntoConstraints:0];

  v29 = [(HROnboardingAtrialFibrillationGateViewController *)self contentView];
  v30 = [(HROnboardingAtrialFibrillationGateViewController *)self birthdayTopSeparator];
  [v29 addSubview:v30];

  [(HROnboardingAtrialFibrillationGateViewController *)self _setUpBirthdayEntryView];
  v31 = objc_msgSend(MEMORY[0x263F46968], "_hrafibgate_separatorView");
  [(HROnboardingAtrialFibrillationGateViewController *)self setBirthdayBottomSeparator:v31];

  v32 = [(HROnboardingAtrialFibrillationGateViewController *)self birthdayBottomSeparator];
  [v32 setTranslatesAutoresizingMaskIntoConstraints:0];

  v33 = [(HROnboardingAtrialFibrillationGateViewController *)self contentView];
  v34 = [(HROnboardingAtrialFibrillationGateViewController *)self birthdayBottomSeparator];
  [v33 addSubview:v34];

  id v35 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HROnboardingAtrialFibrillationGateViewController *)self setBirthdayFooterLabel:v35];

  v36 = HRHeartRhythmUIFrameworkBundle();
  v37 = [v36 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_GATE_BIRTHDAY_FOOTER" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];
  v38 = [(HROnboardingAtrialFibrillationGateViewController *)self birthdayFooterLabel];
  [v38 setText:v37];

  v39 = [MEMORY[0x263F1C550] secondaryLabelColor];
  v40 = [(HROnboardingAtrialFibrillationGateViewController *)self birthdayFooterLabel];
  [v40 setTextColor:v39];

  v41 = [(HROnboardingAtrialFibrillationGateViewController *)self _footnoteFont];
  v42 = [(HROnboardingAtrialFibrillationGateViewController *)self birthdayFooterLabel];
  [v42 setFont:v41];

  v43 = [(HROnboardingAtrialFibrillationGateViewController *)self birthdayFooterLabel];
  [v43 setTranslatesAutoresizingMaskIntoConstraints:0];

  v44 = [(HROnboardingAtrialFibrillationGateViewController *)self birthdayFooterLabel];
  [v44 setNumberOfLines:0];

  v45 = [(HROnboardingAtrialFibrillationGateViewController *)self axidForElementWithString:@"AgeRestriction"];
  v46 = [(HROnboardingAtrialFibrillationGateViewController *)self birthdayFooterLabel];
  [v46 setAccessibilityIdentifier:v45];

  v47 = [(HROnboardingAtrialFibrillationGateViewController *)self contentView];
  v48 = [(HROnboardingAtrialFibrillationGateViewController *)self birthdayFooterLabel];
  [v47 addSubview:v48];

  id v49 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HROnboardingAtrialFibrillationGateViewController *)self setDiagnosisPromptLabel:v49];

  v50 = HRHeartRhythmUIFrameworkBundle();
  v51 = [v50 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_GATE_DIAGNOSIS_PROMPT" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];
  v52 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisPromptLabel];
  [v52 setText:v51];

  v53 = [(HROnboardingAtrialFibrillationGateViewController *)self _diagnosisPromptFont];
  v54 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisPromptLabel];
  [v54 setFont:v53];

  v55 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisPromptLabel];
  [v55 setTranslatesAutoresizingMaskIntoConstraints:0];

  v56 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisPromptLabel];
  [v56 setNumberOfLines:0];

  v57 = [(HROnboardingAtrialFibrillationGateViewController *)self axidForElementWithString:@"PriorAFibDiagnosis"];
  v58 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisPromptLabel];
  [v58 setAccessibilityIdentifier:v57];

  v59 = [(HROnboardingAtrialFibrillationGateViewController *)self contentView];
  v60 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisPromptLabel];
  [v59 addSubview:v60];

  v61 = objc_msgSend(MEMORY[0x263F46968], "_hrafibgate_separatorView");
  [(HROnboardingAtrialFibrillationGateViewController *)self setDiagnosisTopSeparator:v61];

  v62 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisTopSeparator];
  [v62 setTranslatesAutoresizingMaskIntoConstraints:0];

  v63 = [(HROnboardingAtrialFibrillationGateViewController *)self contentView];
  v64 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisTopSeparator];
  [v63 addSubview:v64];

  v65 = HRHeartRhythmUIFrameworkBundle();
  v66 = [v65 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_GATE_DIAGNOSIS_YES" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];
  [(HROnboardingAtrialFibrillationGateViewController *)self _setUpDiagnosisRowWithTitle:v66 value:1];

  v67 = objc_msgSend(MEMORY[0x263F46968], "_hrafibgate_separatorView");
  [(HROnboardingAtrialFibrillationGateViewController *)self setDiagnosisMiddleSeparator:v67];

  v68 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisMiddleSeparator];
  [v68 setTranslatesAutoresizingMaskIntoConstraints:0];

  v69 = [(HROnboardingAtrialFibrillationGateViewController *)self contentView];
  v70 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisMiddleSeparator];
  [v69 addSubview:v70];

  v71 = HRHeartRhythmUIFrameworkBundle();
  v72 = [v71 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_GATE_DIAGNOSIS_NO" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];
  [(HROnboardingAtrialFibrillationGateViewController *)self _setUpDiagnosisRowWithTitle:v72 value:0];

  v73 = objc_msgSend(MEMORY[0x263F46968], "_hrafibgate_separatorView");
  [(HROnboardingAtrialFibrillationGateViewController *)self setDiagnosisBottomSeparator:v73];

  v74 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisBottomSeparator];
  [v74 setTranslatesAutoresizingMaskIntoConstraints:0];

  v75 = [(HROnboardingAtrialFibrillationGateViewController *)self contentView];
  v76 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisBottomSeparator];
  [v75 addSubview:v76];

  id v77 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HROnboardingAtrialFibrillationGateViewController *)self setDiagnosisFooterLabel:v77];

  v78 = HRHeartRhythmUIFrameworkBundle();
  v79 = [v78 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_GATE_DIAGNOSIS_FOOTER" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];
  v80 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisFooterLabel];
  [v80 setText:v79];

  v81 = [MEMORY[0x263F1C550] secondaryLabelColor];
  v82 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisFooterLabel];
  [v82 setTextColor:v81];

  v83 = [(HROnboardingAtrialFibrillationGateViewController *)self _footnoteFont];
  v84 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisFooterLabel];
  [v84 setFont:v83];

  v85 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisFooterLabel];
  [v85 setTranslatesAutoresizingMaskIntoConstraints:0];

  v86 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisFooterLabel];
  [v86 setNumberOfLines:0];

  v87 = [(HROnboardingAtrialFibrillationGateViewController *)self contentView];
  v88 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisFooterLabel];
  [v87 addSubview:v88];

  v89 = HRHeartRhythmUIFrameworkBundle();
  v90 = [v89 localizedStringForKey:@"ONBOARDING_CONTINUE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable"];
  v96[0] = v90;
  v91 = [MEMORY[0x263EFF8C0] arrayWithObjects:v96 count:1];
  v92 = +[HRStackedButtonView buddyStackedButtonViewWithTitles:v91 footerText:0 boldFooterText:0 delegate:self];
  [(HROnboardingAtrialFibrillationGateViewController *)self setStackedButtonView:v92];

  v93 = [(HROnboardingAtrialFibrillationGateViewController *)self stackedButtonView];
  [v93 setFixedBottomButtonSpacing:1];

  v94 = [(HROnboardingAtrialFibrillationGateViewController *)self stackedButtonView];
  [v94 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(HROnboardingAtrialFibrillationGateViewController *)self _updateButtonState];
}

- (void)setUpConstraints
{
  v132.receiver = self;
  v132.super_class = (Class)HROnboardingAtrialFibrillationGateViewController;
  [(HROnboardingAtrialFibrillationGateViewController *)&v132 setUpConstraints];
  id v3 = [(HROnboardingAtrialFibrillationGateViewController *)self titleLabel];
  BOOL v4 = [(HROnboardingAtrialFibrillationGateViewController *)self contentView];
  HKHealthUIBuddyDirectionalEdgeInsets();
  objc_msgSend(v3, "hrui_alignHorizontalConstraintsWithView:insets:", v4);

  BOOL v5 = [(HROnboardingAtrialFibrillationGateViewController *)self titleLabel];
  v6 = [v5 topAnchor];
  id v7 = [(HROnboardingAtrialFibrillationGateViewController *)self contentView];
  objc_super v8 = [v7 topAnchor];
  [(HROnboardingAtrialFibrillationGateViewController *)self contentTop];
  v9 = objc_msgSend(v6, "constraintEqualToAnchor:constant:", v8);
  [v9 setActive:1];

  v10 = [(HROnboardingAtrialFibrillationGateViewController *)self bodyLabel];
  objc_super v11 = [(HROnboardingAtrialFibrillationGateViewController *)self titleLabel];
  objc_msgSend(v10, "hk_alignHorizontalConstraintsWithView:margin:", v11, 0.0);

  v12 = [(HROnboardingAtrialFibrillationGateViewController *)self bodyLabel];
  v13 = [v12 topAnchor];
  id v14 = [(HROnboardingAtrialFibrillationGateViewController *)self titleLabel];
  v15 = [v14 bottomAnchor];
  v16 = [v13 constraintEqualToAnchor:v15 constant:15.0];
  [v16 setActive:1];

  v17 = [(HROnboardingAtrialFibrillationGateViewController *)self birthdayTopSeparator];
  v18 = [(HROnboardingAtrialFibrillationGateViewController *)self contentView];
  objc_msgSend(v17, "hk_alignHorizontalConstraintsWithView:margin:", v18, 0.0);

  v19 = [(HROnboardingAtrialFibrillationGateViewController *)self birthdayTopSeparator];
  v20 = [v19 topAnchor];
  v21 = [(HROnboardingAtrialFibrillationGateViewController *)self bodyLabel];
  v22 = [v21 bottomAnchor];
  v23 = [v20 constraintEqualToAnchor:v22 constant:37.0];
  [v23 setActive:1];

  v24 = [(HROnboardingAtrialFibrillationGateViewController *)self birthdayEntryView];
  v25 = [(HROnboardingAtrialFibrillationGateViewController *)self titleLabel];
  objc_msgSend(v24, "hk_alignHorizontalConstraintsWithView:margin:", v25, 0.0);

  v26 = [(HROnboardingAtrialFibrillationGateViewController *)self birthdayEntryView];
  v27 = [v26 firstBaselineAnchor];
  v28 = [(HROnboardingAtrialFibrillationGateViewController *)self birthdayTopSeparator];
  v29 = [v28 bottomAnchor];
  [(HROnboardingAtrialFibrillationGateViewController *)self _ageEntryTopSeparatorToFirstBaseline];
  v30 = objc_msgSend(v27, "constraintEqualToAnchor:constant:", v29);
  [v30 setActive:1];

  v31 = [(HROnboardingAtrialFibrillationGateViewController *)self birthdayBottomSeparator];
  v32 = [(HROnboardingAtrialFibrillationGateViewController *)self contentView];
  objc_msgSend(v31, "hk_alignHorizontalConstraintsWithView:margin:", v32, 0.0);

  v33 = [(HROnboardingAtrialFibrillationGateViewController *)self birthdayBottomSeparator];
  v34 = [v33 topAnchor];
  id v35 = [(HROnboardingAtrialFibrillationGateViewController *)self birthdayEntryView];
  v36 = [v35 lastBaselineAnchor];
  [(HROnboardingAtrialFibrillationGateViewController *)self _ageEntryLastBaselineToBottomSeparator];
  v37 = objc_msgSend(v34, "constraintEqualToAnchor:constant:", v36);
  [v37 setActive:1];

  v38 = [(HROnboardingAtrialFibrillationGateViewController *)self birthdayFooterLabel];
  v39 = [(HROnboardingAtrialFibrillationGateViewController *)self titleLabel];
  objc_msgSend(v38, "hk_alignHorizontalConstraintsWithView:margin:", v39, 0.0);

  v40 = [(HROnboardingAtrialFibrillationGateViewController *)self birthdayFooterLabel];
  v41 = [v40 firstBaselineAnchor];
  v42 = [(HROnboardingAtrialFibrillationGateViewController *)self birthdayBottomSeparator];
  v43 = [v42 bottomAnchor];
  [(HROnboardingAtrialFibrillationGateViewController *)self _separatorToFooterFirstBaseline];
  v44 = objc_msgSend(v41, "constraintEqualToAnchor:constant:", v43);
  [v44 setActive:1];

  v45 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisPromptLabel];
  v46 = [(HROnboardingAtrialFibrillationGateViewController *)self titleLabel];
  objc_msgSend(v45, "hk_alignHorizontalConstraintsWithView:margin:", v46, 0.0);

  v47 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisPromptLabel];
  v48 = [v47 firstBaselineAnchor];
  id v49 = [(HROnboardingAtrialFibrillationGateViewController *)self birthdayFooterLabel];
  v50 = [v49 bottomAnchor];
  [(HROnboardingAtrialFibrillationGateViewController *)self _ageEntryFooterToDiagnosisPromptFirstBaseline];
  v51 = objc_msgSend(v48, "constraintEqualToAnchor:constant:", v50);
  [v51 setActive:1];

  v52 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisTopSeparator];
  v53 = [(HROnboardingAtrialFibrillationGateViewController *)self contentView];
  objc_msgSend(v52, "hk_alignHorizontalConstraintsWithView:margin:", v53, 0.0);

  v54 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisTopSeparator];
  v55 = [v54 topAnchor];
  v56 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisPromptLabel];
  v57 = [v56 lastBaselineAnchor];
  [(HROnboardingAtrialFibrillationGateViewController *)self _diagnosisPromptLastBaselineToDiagnosisTop];
  v58 = objc_msgSend(v55, "constraintEqualToAnchor:constant:", v57);
  [v58 setActive:1];

  v59 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisYesBackground];
  v60 = [(HROnboardingAtrialFibrillationGateViewController *)self titleLabel];
  objc_msgSend(v59, "hk_alignHorizontalConstraintsWithView:margin:", v60, 0.0);

  v61 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisYesBackground];
  v62 = [v61 topAnchor];
  v63 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisTopSeparator];
  v64 = [v63 bottomAnchor];
  v65 = [v62 constraintEqualToAnchor:v64];
  [v65 setActive:1];

  v66 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisYesRow];
  v67 = [(HROnboardingAtrialFibrillationGateViewController *)self titleLabel];
  objc_msgSend(v66, "hk_alignHorizontalConstraintsWithView:margin:", v67, 0.0);

  v68 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisYesLabel];
  v69 = [v68 firstBaselineAnchor];
  v70 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisTopSeparator];
  v71 = [v70 bottomAnchor];
  [(HROnboardingAtrialFibrillationGateViewController *)self _diagnosisTopSeparatorToFirstBaseline];
  v72 = objc_msgSend(v69, "constraintEqualToAnchor:constant:", v71);
  [v72 setActive:1];

  v73 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisYesBackground];
  v74 = [v73 bottomAnchor];
  v75 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisMiddleSeparator];
  v76 = [v75 topAnchor];
  id v77 = [v74 constraintEqualToAnchor:v76];
  [v77 setActive:1];

  v78 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisMiddleSeparator];
  v79 = [v78 leadingAnchor];
  v80 = [(HROnboardingAtrialFibrillationGateViewController *)self titleLabel];
  v81 = [v80 leadingAnchor];
  v82 = [v79 constraintEqualToAnchor:v81];
  [v82 setActive:1];

  v83 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisMiddleSeparator];
  v84 = [v83 trailingAnchor];
  v85 = [(HROnboardingAtrialFibrillationGateViewController *)self contentView];
  v86 = [v85 trailingAnchor];
  v87 = [v84 constraintEqualToAnchor:v86];
  [v87 setActive:1];

  v88 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisMiddleSeparator];
  v89 = [v88 topAnchor];
  v90 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisYesLabel];
  v91 = [v90 lastBaselineAnchor];
  [(HROnboardingAtrialFibrillationGateViewController *)self _diagnosisLastBaselineToBottomSeparator];
  v92 = objc_msgSend(v89, "constraintEqualToAnchor:constant:", v91);
  [v92 setActive:1];

  v93 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisNoBackground];
  v94 = [(HROnboardingAtrialFibrillationGateViewController *)self titleLabel];
  objc_msgSend(v93, "hk_alignHorizontalConstraintsWithView:margin:", v94, 0.0);

  objc_super v95 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisNoBackground];
  v96 = [v95 topAnchor];
  v97 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisMiddleSeparator];
  v98 = [v97 bottomAnchor];
  v99 = [v96 constraintEqualToAnchor:v98];
  [v99 setActive:1];

  v100 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisNoRow];
  v101 = [(HROnboardingAtrialFibrillationGateViewController *)self titleLabel];
  objc_msgSend(v100, "hk_alignHorizontalConstraintsWithView:margin:", v101, 0.0);

  v102 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisNoLabel];
  v103 = [v102 firstBaselineAnchor];
  v104 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisMiddleSeparator];
  v105 = [v104 bottomAnchor];
  [(HROnboardingAtrialFibrillationGateViewController *)self _diagnosisTopSeparatorToFirstBaseline];
  v106 = objc_msgSend(v103, "constraintEqualToAnchor:constant:", v105);
  [v106 setActive:1];

  v107 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisNoBackground];
  v108 = [v107 bottomAnchor];
  v109 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisBottomSeparator];
  v110 = [v109 topAnchor];
  v111 = [v108 constraintEqualToAnchor:v110];
  [v111 setActive:1];

  v112 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisBottomSeparator];
  v113 = [(HROnboardingAtrialFibrillationGateViewController *)self contentView];
  objc_msgSend(v112, "hk_alignHorizontalConstraintsWithView:margin:", v113, 0.0);

  v114 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisBottomSeparator];
  v115 = [v114 topAnchor];
  v116 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisNoLabel];
  v117 = [v116 lastBaselineAnchor];
  [(HROnboardingAtrialFibrillationGateViewController *)self _diagnosisLastBaselineToBottomSeparator];
  v118 = objc_msgSend(v115, "constraintEqualToAnchor:constant:", v117);
  [v118 setActive:1];

  v119 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisFooterLabel];
  v120 = [(HROnboardingAtrialFibrillationGateViewController *)self titleLabel];
  objc_msgSend(v119, "hk_alignHorizontalConstraintsWithView:margin:", v120, 0.0);

  v121 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisFooterLabel];
  v122 = [v121 firstBaselineAnchor];
  v123 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisBottomSeparator];
  v124 = [v123 bottomAnchor];
  [(HROnboardingAtrialFibrillationGateViewController *)self _separatorToFooterFirstBaseline];
  v125 = objc_msgSend(v122, "constraintEqualToAnchor:constant:", v124);
  [v125 setActive:1];

  v126 = [(HROnboardingAtrialFibrillationGateViewController *)self contentView];
  v127 = [v126 bottomAnchor];
  v128 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisFooterLabel];
  v129 = [v128 bottomAnchor];
  [(HROnboardingAtrialFibrillationGateViewController *)self _diagnosisFooterLabelToContinueButton];
  v130 = objc_msgSend(v127, "constraintEqualToAnchor:constant:", v129);
  [(HROnboardingAtrialFibrillationGateViewController *)self setContentViewBottomConstraint:v130];

  v131 = [(HROnboardingAtrialFibrillationGateViewController *)self contentViewBottomConstraint];
  [v131 setActive:1];
}

- (id)_defaultDOB
{
  v2 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendarWithUTCTimeZone");
  id v3 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendarWithLocalTimeZone");
  BOOL v4 = [MEMORY[0x263EFF910] date];
  BOOL v5 = objc_msgSend(v3, "hk_dateOfBirthDateComponentsWithDate:", v4);

  v6 = [v2 dateFromComponents:v5];
  id v7 = [v2 dateByAddingUnit:4 value:-35 toDate:v6 options:0];

  return v7;
}

- (void)_setUpBirthdayEntryView
{
  v18[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F1C768]);
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  BOOL v4 = [(HROnboardingAtrialFibrillationGateViewController *)self _ageEntryTitleFont];
  [v3 setFont:v4];

  BOOL v5 = HRHeartRhythmUIFrameworkBundle();
  v6 = [v5 localizedStringForKey:@"AGE_GATE_DATE_OF_BIRTH_TITLE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable"];
  [v3 setText:v6];

  [v3 setNumberOfLines:0];
  id v7 = objc_alloc(MEMORY[0x263F46880]);
  objc_super v8 = HRHeartRhythmUIFrameworkBundle();
  v9 = [v8 localizedStringForKey:@"AGE_GATE_FIELD_REQUIRED_PLACEHOLDER" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable"];
  v10 = [(HROnboardingAtrialFibrillationGateViewController *)self _defaultDOB];
  objc_super v11 = objc_msgSend(v7, "initWithFrame:initialText:defaultDate:maxYears:", v9, v10, 130, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));

  [v11 setDelegate:self];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v12 = objc_alloc(MEMORY[0x263F1C9B8]);
  v18[0] = v3;
  v18[1] = v11;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  id v14 = (void *)[v12 initWithArrangedSubviews:v13];

  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v14 setAxis:HKUIApplicationIsUsingAccessibilityContentSizeCategory()];
  [v14 setCustomSpacing:v3 afterView:28.0];
  LODWORD(v15) = 1148846080;
  [v3 setContentHuggingPriority:0 forAxis:v15];
  [(HROnboardingAtrialFibrillationGateViewController *)self setBirthdayEntryView:v14];
  v16 = [(HROnboardingAtrialFibrillationGateViewController *)self contentView];
  v17 = [(HROnboardingAtrialFibrillationGateViewController *)self birthdayEntryView];
  [v16 addSubview:v17];
}

- (void)setDateOfBirth:(id)a3
{
  id v5 = a3;
  if ((-[NSDate isEqual:](self->_dateOfBirth, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_dateOfBirth, a3);
    [(HROnboardingAtrialFibrillationGateViewController *)self _updateButtonState];
  }
}

- (void)setDiagnosis:(id)a3
{
  id v5 = a3;
  if ((-[NSNumber isEqual:](self->_diagnosis, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_diagnosis, a3);
    [(HROnboardingAtrialFibrillationGateViewController *)self _updateButtonState];
  }
}

- (void)compactDatePickerView:(id)a3 didChangeValue:(id)a4
{
}

- (void)_setUpDiagnosisRowWithTitle:(id)a3 value:(BOOL)a4
{
  BOOL v4 = a4;
  v28[2] = *MEMORY[0x263EF8340];
  v6 = (objc_class *)MEMORY[0x263F1CB60];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  v27 = objc_msgSend(MEMORY[0x263F1C658], "hk_preferredFontForTextStyle:", *MEMORY[0x263F1D260]);
  uint64_t v9 = objc_msgSend(MEMORY[0x263F1C6C8], "configurationWithFont:scale:");
  uint64_t v10 = [MEMORY[0x263F1C550] tertiaryLabelColor];
  objc_super v11 = [MEMORY[0x263F1C6B0] systemImageNamed:@"circle"];
  id v12 = objc_alloc_init(MEMORY[0x263F1C6D0]);
  v26 = (void *)v9;
  [v12 setPreferredSymbolConfiguration:v9];
  [v12 setImage:v11];
  v25 = (void *)v10;
  [v12 setTintColor:v10];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v13) = 1148846080;
  [v12 setContentHuggingPriority:0 forAxis:v13];
  LODWORD(v14) = 1148846080;
  [v12 setContentHuggingPriority:1 forAxis:v14];
  LODWORD(v15) = 1148846080;
  [v12 setContentCompressionResistancePriority:0 forAxis:v15];
  LODWORD(v16) = 1148846080;
  [v12 setContentCompressionResistancePriority:1 forAxis:v16];
  id v17 = objc_alloc_init(MEMORY[0x263F1C768]);
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
  v18 = [(HROnboardingAtrialFibrillationGateViewController *)self _ageEntryTitleFont];
  [v17 setFont:v18];

  [v17 setText:v7];
  [v17 setNumberOfLines:0];
  id v19 = objc_alloc(MEMORY[0x263F1C9B8]);
  v28[0] = v12;
  v28[1] = v17;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:2];
  v21 = (void *)[v19 initWithArrangedSubviews:v20];

  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v21 setAxis:0];
  [v21 setCustomSpacing:v12 afterView:12.0];
  v22 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel__diagnosisRowTapped_];
  [v8 addGestureRecognizer:v22];
  if (v4)
  {
    [(HROnboardingAtrialFibrillationGateViewController *)self setDiagnosisYesBackground:v8];
    [(HROnboardingAtrialFibrillationGateViewController *)self setDiagnosisYesRow:v21];
    [(HROnboardingAtrialFibrillationGateViewController *)self setDiagnosisYesCheckmark:v12];
    [(HROnboardingAtrialFibrillationGateViewController *)self setDiagnosisYesLabel:v17];
  }
  else
  {
    [(HROnboardingAtrialFibrillationGateViewController *)self setDiagnosisNoBackground:v8];
    [(HROnboardingAtrialFibrillationGateViewController *)self setDiagnosisNoRow:v21];
    [(HROnboardingAtrialFibrillationGateViewController *)self setDiagnosisNoCheckmark:v12];
    [(HROnboardingAtrialFibrillationGateViewController *)self setDiagnosisNoLabel:v17];
  }
  [v8 addSubview:v21];
  v23 = [(HROnboardingAtrialFibrillationGateViewController *)self contentView];
  [v23 addSubview:v8];

  prefilledDiagnosis = self->_prefilledDiagnosis;
  if (prefilledDiagnosis && [(NSNumber *)prefilledDiagnosis BOOLValue] == v4) {
    [(HROnboardingAtrialFibrillationGateViewController *)self _diagnosisRowTapped:v22];
  }
}

- (void)_diagnosisRowTapped:(id)a3
{
  id v25 = a3;
  BOOL v4 = objc_msgSend(MEMORY[0x263F1C658], "hk_preferredFontForTextStyle:", *MEMORY[0x263F1D260]);
  id v5 = [MEMORY[0x263F1C6C8] configurationWithFont:v4 scale:3];
  v6 = [MEMORY[0x263F1C550] systemBlueColor];
  id v7 = [MEMORY[0x263F1C6B0] systemImageNamed:@"checkmark.circle.fill"];
  id v8 = [MEMORY[0x263F1C6C8] configurationWithFont:v4 scale:3];
  uint64_t v9 = [MEMORY[0x263F1C550] tertiaryLabelColor];
  uint64_t v10 = [MEMORY[0x263F1C6B0] systemImageNamed:@"circle"];
  objc_super v11 = [v25 view];
  id v12 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisYesBackground];

  if (v11 == v12)
  {
    v20 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisYesCheckmark];
    [v20 setPreferredSymbolConfiguration:v5];

    v21 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisYesCheckmark];
    [v21 setImage:v7];

    v22 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisYesCheckmark];
    [v22 setTintColor:v6];

    v23 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisNoCheckmark];
    [v23 setPreferredSymbolConfiguration:v8];

    v24 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisNoCheckmark];
    [v24 setImage:v10];

    v18 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisNoCheckmark];
    uint64_t v19 = MEMORY[0x263EFFA88];
  }
  else
  {
    double v13 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisNoCheckmark];
    [v13 setPreferredSymbolConfiguration:v5];

    double v14 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisNoCheckmark];
    [v14 setImage:v7];

    double v15 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisNoCheckmark];
    [v15 setTintColor:v6];

    double v16 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisYesCheckmark];
    [v16 setPreferredSymbolConfiguration:v8];

    id v17 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisYesCheckmark];
    [v17 setImage:v10];

    v18 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisYesCheckmark];
    uint64_t v19 = MEMORY[0x263EFFA80];
  }
  [v18 setTintColor:v9];

  [(HROnboardingAtrialFibrillationGateViewController *)self setDiagnosis:v19];
}

- (void)stackedButtonView:(id)a3 didTapButtonAtIndex:(int64_t)a4
{
  if (a4) {
    return;
  }
  if (![(HROnboardingAtrialFibrillationGateViewController *)self _meetsAgeRequirement])
  {
    v6 = (void *)MEMORY[0x263F1C3F8];
    id v7 = [(HROnboardingAtrialFibrillationGateViewController *)self ageIneligiblePromptBodyString];
    id v14 = [v6 alertControllerWithTitle:0 message:v7 preferredStyle:1];

    id v8 = (void *)MEMORY[0x263F1C3F0];
    uint64_t v9 = [(HROnboardingAtrialFibrillationGateViewController *)self ageIneligiblePromptAckButtonString];
LABEL_7:
    id v12 = (void *)v9;
    double v13 = [v8 actionWithTitle:v9 style:1 handler:0];
    [v14 addAction:v13];

    [(HROnboardingAtrialFibrillationGateViewController *)self presentViewController:v14 animated:1 completion:0];
    goto LABEL_8;
  }
  if (![(HROnboardingAtrialFibrillationGateViewController *)self _meetsDiagnosisRequirement])
  {
    uint64_t v10 = (void *)MEMORY[0x263F1C3F8];
    objc_super v11 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisIneligiblePromptBodyString];
    id v14 = [v10 alertControllerWithTitle:0 message:v11 preferredStyle:1];

    id v8 = (void *)MEMORY[0x263F1C3F0];
    uint64_t v9 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisIneligiblePromptAckButtonString];
    goto LABEL_7;
  }
  id v14 = [(HROnboardingAtrialFibrillationGateViewController *)self delegate];
  [v14 stepForward];
LABEL_8:
}

- (void)_updateButtonState
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HROnboardingAtrialFibrillationGateViewController *)self dateOfBirth];
  if (v3
    && (uint64_t v4 = (void *)v3,
        [(HROnboardingAtrialFibrillationGateViewController *)self diagnosis],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v6 = [(HROnboardingAtrialFibrillationGateViewController *)self stackedButtonView];
    id v7 = [v6 buttons];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          [v12 setEnabled:1];
          double v13 = HKHealthKeyColor();
          [v12 setBackgroundColor:v13];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v9);
    }
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v14 = [(HROnboardingAtrialFibrillationGateViewController *)self stackedButtonView];
    id v7 = [v14 buttons];

    uint64_t v15 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v7);
          }
          uint64_t v19 = *(void **)(*((void *)&v21 + 1) + 8 * j);
          [v19 setEnabled:0];
          v20 = [MEMORY[0x263F1C550] lightGrayColor];
          [v19 setBackgroundColor:v20];
        }
        uint64_t v16 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v16);
    }
  }
}

- (void)_setUpButtonFooterView
{
  uint64_t v3 = [(HROnboardingAtrialFibrillationGateViewController *)self stackedButtonView];
  HKHealthUIBuddyDirectionalEdgeInsets();
  -[HROnboardingAtrialFibrillationGateViewController setFooterView:insets:](self, "setFooterView:insets:", v3);

  uint64_t v4 = [(HROnboardingAtrialFibrillationGateViewController *)self stackedButtonView];
  id v5 = [(HROnboardingAtrialFibrillationGateViewController *)self view];
  [v4 alignBlurViewHorizontalConstraintsWithView:v5];

  id v6 = [(HROnboardingAtrialFibrillationGateViewController *)self stackedButtonView];
  [v6 setBlurHidden:0];
}

- (void)_adjustButtonFooterViewLocationForViewContentHeight
{
  v43[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HROnboardingAtrialFibrillationGateViewController *)self view];
  uint64_t v4 = [(HROnboardingAtrialFibrillationGateViewController *)self stackedButtonView];
  id v5 = [v4 buttons];
  id v6 = [v5 firstObject];
  [v6 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  uint64_t v15 = [(HROnboardingAtrialFibrillationGateViewController *)self stackedButtonView];
  objc_msgSend(v3, "convertRect:fromView:", v15, v8, v10, v12, v14);
  double v17 = v16;

  v18 = [(HROnboardingAtrialFibrillationGateViewController *)self contentView];
  [v18 frame];
  double v20 = v19;
  long long v21 = [(HROnboardingAtrialFibrillationGateViewController *)self view];
  [v21 safeAreaInsets];
  double v23 = v17 - v22;

  if (v20 > v23)
  {
    [(HROnboardingAtrialFibrillationGateViewController *)self removeFooterView];
    long long v24 = [(HROnboardingAtrialFibrillationGateViewController *)self stackedButtonView];
    [v24 setBlurHidden:1];

    long long v25 = [(HROnboardingAtrialFibrillationGateViewController *)self contentView];
    long long v26 = [(HROnboardingAtrialFibrillationGateViewController *)self stackedButtonView];
    [v25 addSubview:v26];

    long long v27 = [(HROnboardingAtrialFibrillationGateViewController *)self stackedButtonView];
    long long v28 = [(HROnboardingAtrialFibrillationGateViewController *)self titleLabel];
    objc_msgSend(v27, "hk_alignHorizontalConstraintsWithView:margin:", v28, 0.0);

    v29 = [(HROnboardingAtrialFibrillationGateViewController *)self stackedButtonView];
    v30 = [v29 topAnchor];
    uint64_t v31 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosisFooterLabel];
    v32 = [v31 bottomAnchor];
    v33 = [v30 constraintEqualToAnchor:v32 constant:20.0];
    [v33 setActive:1];

    v34 = (void *)MEMORY[0x263F08938];
    id v35 = [(HROnboardingAtrialFibrillationGateViewController *)self contentViewBottomConstraint];
    v43[0] = v35;
    v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:1];
    [v34 deactivateConstraints:v36];

    [(HROnboardingAtrialFibrillationGateViewController *)self setContentViewBottomConstraint:0];
    v37 = [(HROnboardingAtrialFibrillationGateViewController *)self contentView];
    v38 = [v37 bottomAnchor];
    v39 = [(HROnboardingAtrialFibrillationGateViewController *)self stackedButtonView];
    v40 = [v39 bottomAnchor];
    v41 = [v38 constraintEqualToAnchor:v40];
    [(HROnboardingAtrialFibrillationGateViewController *)self setContentViewBottomConstraint:v41];

    v42 = [(HROnboardingAtrialFibrillationGateViewController *)self contentViewBottomConstraint];
    [v42 setActive:1];
  }
}

- (BOOL)_meetsAgeRequirement
{
  uint64_t v3 = [(HROnboardingAtrialFibrillationGateViewController *)self dateOfBirth];
  uint64_t v4 = [(HROnboardingAtrialFibrillationGateViewController *)self ageWithDate:v3];

  if (v4)
  {
    id v5 = [(HROnboardingAtrialFibrillationGateViewController *)self ageLimit];
    BOOL v6 = [v4 compare:v5] != -1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_meetsDiagnosisRequirement
{
  uint64_t v3 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosis];
  if (v3)
  {
    uint64_t v4 = [(HROnboardingAtrialFibrillationGateViewController *)self diagnosis];
    int v5 = [v4 BOOLValue] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)ageWithDate:(id)a3
{
  if (a3)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendarWithUTCTimeZone");
    int v5 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendarWithLocalTimeZone");
    BOOL v6 = [(HROnboardingAtrialFibrillationGateViewController *)self dateOfBirth];
    double v7 = objc_msgSend(v4, "hk_dateOfBirthDateComponentsWithDate:", v6);

    double v8 = [MEMORY[0x263EFF910] date];
    double v9 = objc_msgSend(v5, "hk_dateOfBirthDateComponentsWithDate:", v8);

    double v10 = [v5 components:4 fromDateComponents:v7 toDateComponents:v9 options:0];
    double v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "year"));
  }
  else
  {
    double v11 = 0;
  }
  return v11;
}

- (id)ageLimit
{
  return &unk_26D2BF288;
}

- (id)ageIneligiblePromptTitleString
{
  v2 = HRHeartRhythmUIFrameworkBundle();
  uint64_t v3 = [v2 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_AGE_GATE_INELIGIBLE_TITLE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];

  return v3;
}

- (id)ageIneligiblePromptBodyString
{
  v2 = HRHeartRhythmUIFrameworkBundle();
  uint64_t v3 = [v2 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_AGE_GATE_INELIGIBLE_BODY" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];

  return v3;
}

- (id)ageIneligiblePromptAckButtonString
{
  v2 = HRHeartRhythmUIFrameworkBundle();
  uint64_t v3 = [v2 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_AGE_GATE_INELIGIBLE_ACK_BUTTON" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];

  return v3;
}

- (id)diagnosisIneligiblePromptTitleString
{
  v2 = HRHeartRhythmUIFrameworkBundle();
  uint64_t v3 = [v2 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_DIAGNOSIS_GATE_INELIGIBLE_TITLE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];

  return v3;
}

- (id)diagnosisIneligiblePromptBodyString
{
  v2 = HRHeartRhythmUIFrameworkBundle();
  uint64_t v3 = [v2 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_DIAGNOSIS_GATE_INELIGIBLE_BODY" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];

  return v3;
}

- (id)diagnosisIneligiblePromptAckButtonString
{
  v2 = HRHeartRhythmUIFrameworkBundle();
  uint64_t v3 = [v2 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_DIAGNOSIS_GATE_INELIGIBLE_ACK_BUTTON" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];

  return v3;
}

- (id)axidForElementWithString:(id)a3
{
  uint64_t v3 = [NSString stringWithFormat:@"BirthDate.%@", a3];
  uint64_t v4 = [NSString healthAccessibilityIdentifier:2 suffix:v3];

  return v4;
}

- (double)_ageEntryTopSeparatorToFirstBaseline
{
  v2 = [(HROnboardingAtrialFibrillationGateViewController *)self _bodyFont];
  [v2 _scaledValueForValue:36.0];
  double v4 = v3;

  return v4;
}

- (double)_ageEntryLastBaselineToBottomSeparator
{
  v2 = [(HROnboardingAtrialFibrillationGateViewController *)self _bodyFont];
  [v2 _scaledValueForValue:24.0];
  double v4 = v3;

  return v4;
}

- (double)_ageEntryFooterToDiagnosisPromptFirstBaseline
{
  v2 = [(HROnboardingAtrialFibrillationGateViewController *)self _bodyFont];
  [v2 _scaledValueForValue:48.0];
  double v4 = v3;

  return v4;
}

- (double)_diagnosisPromptLastBaselineToDiagnosisTop
{
  v2 = [(HROnboardingAtrialFibrillationGateViewController *)self _bodyFont];
  [v2 _scaledValueForValue:24.0];
  double v4 = v3;

  return v4;
}

- (double)_diagnosisTopSeparatorToFirstBaseline
{
  v2 = [(HROnboardingAtrialFibrillationGateViewController *)self _bodyFont];
  [v2 _scaledValueForValue:36.0];
  double v4 = v3;

  return v4;
}

- (double)_diagnosisLastBaselineToBottomSeparator
{
  v2 = [(HROnboardingAtrialFibrillationGateViewController *)self _bodyFont];
  [v2 _scaledValueForValue:24.0];
  double v4 = v3;

  return v4;
}

- (double)_separatorToFooterFirstBaseline
{
  v2 = [(HROnboardingAtrialFibrillationGateViewController *)self _bodyFont];
  [v2 _scaledValueForValue:20.0];
  double v4 = v3;

  return v4;
}

- (double)_diagnosisFooterLabelToContinueButton
{
  v2 = [(HROnboardingAtrialFibrillationGateViewController *)self _bodyFont];
  [v2 _scaledValueForValue:44.0];
  double v4 = v3;

  return v4;
}

- (id)_bodyFont
{
  return (id)[MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
}

- (id)_ageEntryTitleFont
{
  return (id)objc_msgSend(MEMORY[0x263F1C658], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x263F1D260], 2);
}

- (id)_diagnosisPromptFont
{
  return (id)objc_msgSend(MEMORY[0x263F1C658], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x263F1D260], 2);
}

- (id)_footnoteFont
{
  return (id)[MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
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

- (HKSeparatorLineView)birthdayTopSeparator
{
  return self->_birthdayTopSeparator;
}

- (void)setBirthdayTopSeparator:(id)a3
{
}

- (UIStackView)birthdayEntryView
{
  return self->_birthdayEntryView;
}

- (void)setBirthdayEntryView:(id)a3
{
}

- (UILabel)birthdayFooterLabel
{
  return self->_birthdayFooterLabel;
}

- (void)setBirthdayFooterLabel:(id)a3
{
}

- (NSDate)dateOfBirth
{
  return self->_dateOfBirth;
}

- (HKSeparatorLineView)birthdayBottomSeparator
{
  return self->_birthdayBottomSeparator;
}

- (void)setBirthdayBottomSeparator:(id)a3
{
}

- (UILabel)diagnosisPromptLabel
{
  return self->_diagnosisPromptLabel;
}

- (void)setDiagnosisPromptLabel:(id)a3
{
}

- (NSNumber)diagnosis
{
  return self->_diagnosis;
}

- (NSNumber)prefilledDiagnosis
{
  return self->_prefilledDiagnosis;
}

- (void)setPrefilledDiagnosis:(id)a3
{
}

- (HKSeparatorLineView)diagnosisTopSeparator
{
  return self->_diagnosisTopSeparator;
}

- (void)setDiagnosisTopSeparator:(id)a3
{
}

- (UIView)diagnosisYesBackground
{
  return self->_diagnosisYesBackground;
}

- (void)setDiagnosisYesBackground:(id)a3
{
}

- (UIStackView)diagnosisYesRow
{
  return self->_diagnosisYesRow;
}

- (void)setDiagnosisYesRow:(id)a3
{
}

- (UIImageView)diagnosisYesCheckmark
{
  return self->_diagnosisYesCheckmark;
}

- (void)setDiagnosisYesCheckmark:(id)a3
{
}

- (UILabel)diagnosisYesLabel
{
  return self->_diagnosisYesLabel;
}

- (void)setDiagnosisYesLabel:(id)a3
{
}

- (HKSeparatorLineView)diagnosisMiddleSeparator
{
  return self->_diagnosisMiddleSeparator;
}

- (void)setDiagnosisMiddleSeparator:(id)a3
{
}

- (UIView)diagnosisNoBackground
{
  return self->_diagnosisNoBackground;
}

- (void)setDiagnosisNoBackground:(id)a3
{
}

- (UIStackView)diagnosisNoRow
{
  return self->_diagnosisNoRow;
}

- (void)setDiagnosisNoRow:(id)a3
{
}

- (UIImageView)diagnosisNoCheckmark
{
  return self->_diagnosisNoCheckmark;
}

- (void)setDiagnosisNoCheckmark:(id)a3
{
}

- (UILabel)diagnosisNoLabel
{
  return self->_diagnosisNoLabel;
}

- (void)setDiagnosisNoLabel:(id)a3
{
}

- (HKSeparatorLineView)diagnosisBottomSeparator
{
  return self->_diagnosisBottomSeparator;
}

- (void)setDiagnosisBottomSeparator:(id)a3
{
}

- (UILabel)diagnosisFooterLabel
{
  return self->_diagnosisFooterLabel;
}

- (void)setDiagnosisFooterLabel:(id)a3
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

- (BOOL)didLayoutSubviewsOnce
{
  return self->_didLayoutSubviewsOnce;
}

- (void)setDidLayoutSubviewsOnce:(BOOL)a3
{
  self->_didLayoutSubviewsOnce = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_stackedButtonView, 0);
  objc_storeStrong((id *)&self->_diagnosisFooterLabel, 0);
  objc_storeStrong((id *)&self->_diagnosisBottomSeparator, 0);
  objc_storeStrong((id *)&self->_diagnosisNoLabel, 0);
  objc_storeStrong((id *)&self->_diagnosisNoCheckmark, 0);
  objc_storeStrong((id *)&self->_diagnosisNoRow, 0);
  objc_storeStrong((id *)&self->_diagnosisNoBackground, 0);
  objc_storeStrong((id *)&self->_diagnosisMiddleSeparator, 0);
  objc_storeStrong((id *)&self->_diagnosisYesLabel, 0);
  objc_storeStrong((id *)&self->_diagnosisYesCheckmark, 0);
  objc_storeStrong((id *)&self->_diagnosisYesRow, 0);
  objc_storeStrong((id *)&self->_diagnosisYesBackground, 0);
  objc_storeStrong((id *)&self->_diagnosisTopSeparator, 0);
  objc_storeStrong((id *)&self->_prefilledDiagnosis, 0);
  objc_storeStrong((id *)&self->_diagnosis, 0);
  objc_storeStrong((id *)&self->_diagnosisPromptLabel, 0);
  objc_storeStrong((id *)&self->_birthdayBottomSeparator, 0);
  objc_storeStrong((id *)&self->_dateOfBirth, 0);
  objc_storeStrong((id *)&self->_birthdayFooterLabel, 0);
  objc_storeStrong((id *)&self->_birthdayEntryView, 0);
  objc_storeStrong((id *)&self->_birthdayTopSeparator, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end