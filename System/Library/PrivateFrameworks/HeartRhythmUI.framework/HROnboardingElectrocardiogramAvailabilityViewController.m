@interface HROnboardingElectrocardiogramAvailabilityViewController
- (BOOL)_meetsAgeRequirement;
- (HKSeparatorLineView)birthdayBottomSeparator;
- (HKSeparatorLineView)birthdayTopSeparator;
- (HRElectrocardiogramCurrentLocationOnboardingDeterminer)onboardingAvailabilityDeterminer;
- (HRElectrocardiogramWatchAppInstallability)ecgAppInstallability;
- (HRStackedButtonView)stackedButtonView;
- (NSDate)dateOfBirth;
- (NSLayoutConstraint)contentViewBottomConstraint;
- (UILabel)birthdayFooterLabel;
- (UILabel)birthdayPromptLabel;
- (UILabel)bodyLabel;
- (UILabel)locationFooterLabel;
- (UILabel)titleLabel;
- (UIStackView)birthdayEntryView;
- (UIView)heroView;
- (double)_ageEntryLastBaselineToBottomSeparator;
- (double)_ageEntryTopSeparatorToFirstBaseline;
- (double)_agePromptLastBaselineToAgeEntryTop;
- (double)_birthdayFooterLastBaselineToContinueButton;
- (double)_bodyBottomToAgePromptTop;
- (double)_bottomSeparatorToBirthdayFooterFirstBaseline;
- (double)_titleBottomToBodyTop;
- (id)_ageEntryTitleFont;
- (id)_birthdayPromptFont;
- (id)_bodyFont;
- (id)_bodyFontTextStyle;
- (id)_defaultDOB;
- (id)_footnoteFont;
- (id)_footnoteTextStyle;
- (id)_titleFont;
- (id)_titleFontTextStyle;
- (id)ageIneligiblePromptAckButtonString;
- (id)ageIneligiblePromptBodyString;
- (id)ageIneligiblePromptTitleString;
- (id)ageLimit;
- (id)ageWithDate:(id)a3;
- (id)birthdayFooterString;
- (id)bodyString;
- (id)buttonTitleString;
- (id)createHeroView;
- (id)createLearnMoreExpandedView;
- (id)deviceNotSupportedBodyString;
- (id)disclaimerString;
- (id)featureDisabledBodyString;
- (id)initForOnboarding:(BOOL)a3 provenance:(int64_t)a4;
- (id)learnMoreString;
- (id)locationFeatureIneligiblePromptBodyString;
- (id)locationFooterString;
- (id)locationNotFoundPromptBodyString;
- (id)locationNotFoundPromptTitleString;
- (id)titleString;
- (id)watchOSVersionTooLowBodyString;
- (int64_t)provenance;
- (void)_setupBirthdayEntryView;
- (void)_trackElectrocardiogramOnboardingStepIfNeeded:(int64_t)a3 countryCode:(id)a4 algorithmVersion:(id)a5;
- (void)_updateDateOfBirthDisplay;
- (void)compactDatePickerView:(id)a3 didChangeValue:(id)a4;
- (void)setBirthdayBottomSeparator:(id)a3;
- (void)setBirthdayEntryView:(id)a3;
- (void)setBirthdayFooterLabel:(id)a3;
- (void)setBirthdayPromptLabel:(id)a3;
- (void)setBirthdayTopSeparator:(id)a3;
- (void)setBodyLabel:(id)a3;
- (void)setContentViewBottomConstraint:(id)a3;
- (void)setDateOfBirth:(id)a3;
- (void)setEcgAppInstallability:(id)a3;
- (void)setHeroView:(id)a3;
- (void)setLocationFooterLabel:(id)a3;
- (void)setOnboardingAvailabilityDeterminer:(id)a3;
- (void)setProvenance:(int64_t)a3;
- (void)setStackedButtonView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUpConstraints;
- (void)setUpUI;
- (void)stackedButtonView:(id)a3 didTapButtonAtIndex:(int64_t)a4;
@end

@implementation HROnboardingElectrocardiogramAvailabilityViewController

- (id)initForOnboarding:(BOOL)a3 provenance:(int64_t)a4
{
  BOOL v5 = a3;
  uint64_t v6 = *MEMORY[0x263F0AA58];
  v12.receiver = self;
  v12.super_class = (Class)HROnboardingElectrocardiogramAvailabilityViewController;
  v7 = [(HROnboardingElectrocardiogramAvailabilityViewController *)&v12 initForOnboarding:a3 upgradingFromAlgorithmVersion:v6];
  v8 = v7;
  if (v7)
  {
    if (v5) {
      [v7 setRightButtonType:2];
    }
    v8[148] = a4;
    v9 = objc_alloc_init(HRElectrocardiogramWatchAppInstallability);
    v10 = (void *)v8[135];
    v8[135] = v9;
  }
  return v8;
}

- (void)setDateOfBirth:(id)a3
{
  id v5 = a3;
  if ((-[NSDate isEqual:](self->_dateOfBirth, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_dateOfBirth, a3);
    [(HROnboardingElectrocardiogramAvailabilityViewController *)self _updateDateOfBirthDisplay];
  }
}

- (id)_defaultDOB
{
  v2 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendarWithUTCTimeZone");
  v3 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendarWithLocalTimeZone");
  v4 = [MEMORY[0x263EFF910] date];
  id v5 = objc_msgSend(v3, "hk_dateOfBirthDateComponentsWithDate:", v4);

  uint64_t v6 = [v2 dateFromComponents:v5];
  v7 = [v2 dateByAddingUnit:4 value:-35 toDate:v6 options:0];

  return v7;
}

- (void)setUpUI
{
  v95[1] = *MEMORY[0x263EF8340];
  v94.receiver = self;
  v94.super_class = (Class)HROnboardingElectrocardiogramAvailabilityViewController;
  [(HROnboardingElectrocardiogramAvailabilityViewController *)&v94 setUpUI];
  v3 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self createHeroView];
  [(HROnboardingElectrocardiogramAvailabilityViewController *)self setHeroView:v3];

  v4 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self heroView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v5 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self contentView];
  uint64_t v6 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self heroView];
  [v5 addSubview:v6];

  id v7 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HROnboardingElectrocardiogramAvailabilityViewController *)self setTitleLabel:v7];

  v8 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self titleString];
  v9 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self titleLabel];
  [v9 setText:v8];

  v10 = [NSString healthAccessibilityIdentifier:1 suffix:@"Onboarding.PageTitle"];
  v11 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self titleLabel];
  [v11 setAccessibilityIdentifier:v10];

  objc_super v12 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self titleLabel];
  [v12 setTextAlignment:1];

  v13 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self _titleFont];
  v14 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self titleLabel];
  [v14 setFont:v13];

  v15 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self titleLabel];
  [v15 setAdjustsFontForContentSizeCategory:1];

  v16 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self titleLabel];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

  v17 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self titleLabel];
  [v17 setNumberOfLines:0];

  v18 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self contentView];
  v19 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self titleLabel];
  [v18 addSubview:v19];

  id v20 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HROnboardingElectrocardiogramAvailabilityViewController *)self setBodyLabel:v20];

  v21 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self bodyString];
  v22 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self bodyLabel];
  [v22 setText:v21];

  v23 = [NSString healthAccessibilityIdentifier:1 suffix:@"Onboarding.EcgDescription"];
  v24 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self bodyLabel];
  [v24 setAccessibilityIdentifier:v23];

  v25 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self bodyLabel];
  [v25 setTextAlignment:1];

  v26 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self _bodyFont];
  v27 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self bodyLabel];
  [v27 setFont:v26];

  v28 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self bodyLabel];
  [v28 setAdjustsFontForContentSizeCategory:1];

  v29 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self bodyLabel];
  [v29 setTranslatesAutoresizingMaskIntoConstraints:0];

  v30 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self bodyLabel];
  [v30 setNumberOfLines:0];

  v31 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self contentView];
  v32 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self bodyLabel];
  [v31 addSubview:v32];

  id v33 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HROnboardingElectrocardiogramAvailabilityViewController *)self setBirthdayPromptLabel:v33];

  v34 = HRHeartRhythmUIFrameworkBundle();
  v35 = [v34 localizedStringForKey:@"AGE_GATE_ENTER_DOB_TO_CONTINUE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable"];
  v36 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayPromptLabel];
  [v36 setText:v35];

  v37 = [NSString healthAccessibilityIdentifier:1 suffix:@"BirthDate.Prompt"];
  v38 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayPromptLabel];
  [v38 setAccessibilityIdentifier:v37];

  v39 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self _birthdayPromptFont];
  v40 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayPromptLabel];
  [v40 setFont:v39];

  v41 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayPromptLabel];
  [v41 setAdjustsFontForContentSizeCategory:1];

  v42 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayPromptLabel];
  [v42 setTranslatesAutoresizingMaskIntoConstraints:0];

  v43 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayPromptLabel];
  [v43 setNumberOfLines:0];

  v44 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self contentView];
  v45 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayPromptLabel];
  [v44 addSubview:v45];

  v46 = objc_msgSend(MEMORY[0x263F46968], "_hragegate_separatorView");
  [(HROnboardingElectrocardiogramAvailabilityViewController *)self setBirthdayTopSeparator:v46];

  v47 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayTopSeparator];
  [v47 setTranslatesAutoresizingMaskIntoConstraints:0];

  v48 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self contentView];
  v49 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayTopSeparator];
  [v48 addSubview:v49];

  [(HROnboardingElectrocardiogramAvailabilityViewController *)self _setupBirthdayEntryView];
  v50 = objc_msgSend(MEMORY[0x263F46968], "_hragegate_separatorView");
  [(HROnboardingElectrocardiogramAvailabilityViewController *)self setBirthdayBottomSeparator:v50];

  v51 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayBottomSeparator];
  [v51 setTranslatesAutoresizingMaskIntoConstraints:0];

  v52 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self contentView];
  v53 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayBottomSeparator];
  [v52 addSubview:v53];

  id v54 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HROnboardingElectrocardiogramAvailabilityViewController *)self setBirthdayFooterLabel:v54];

  v55 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayFooterString];
  v56 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayFooterLabel];
  [v56 setText:v55];

  v57 = [NSString healthAccessibilityIdentifier:1 suffix:@"BirthDate.AgeRestriction"];
  v58 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayFooterLabel];
  [v58 setAccessibilityIdentifier:v57];

  v59 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayFooterLabel];
  [v59 setTextAlignment:1];

  v60 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self _footnoteFont];
  v61 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayFooterLabel];
  [v61 setFont:v60];

  v62 = [MEMORY[0x263F1C550] secondaryLabelColor];
  v63 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayFooterLabel];
  [v63 setTextColor:v62];

  v64 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayFooterLabel];
  [v64 setAdjustsFontForContentSizeCategory:1];

  v65 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayFooterLabel];
  [v65 setTranslatesAutoresizingMaskIntoConstraints:0];

  v66 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayFooterLabel];
  [v66 setNumberOfLines:0];

  v67 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self contentView];
  v68 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayFooterLabel];
  [v67 addSubview:v68];

  v69 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self locationFooterString];

  if (v69)
  {
    id v70 = objc_alloc_init(MEMORY[0x263F1C768]);
    [(HROnboardingElectrocardiogramAvailabilityViewController *)self setLocationFooterLabel:v70];

    v71 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self locationFooterString];
    v72 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self locationFooterLabel];
    [v72 setText:v71];

    v73 = [NSString healthAccessibilityIdentifier:1 suffix:@"SetupLocation"];
    v74 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self locationFooterLabel];
    [v74 setAccessibilityIdentifier:v73];

    v75 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self locationFooterLabel];
    [v75 setTextAlignment:1];

    v76 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self _footnoteFont];
    v77 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self locationFooterLabel];
    [v77 setFont:v76];

    v78 = [MEMORY[0x263F1C550] secondaryLabelColor];
    v79 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self locationFooterLabel];
    [v79 setTextColor:v78];

    v80 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self locationFooterLabel];
    [v80 setAdjustsFontForContentSizeCategory:1];

    v81 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self locationFooterLabel];
    [v81 setTranslatesAutoresizingMaskIntoConstraints:0];

    v82 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self locationFooterLabel];
    [v82 setNumberOfLines:0];

    v83 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self contentView];
    v84 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self locationFooterLabel];
    [v83 addSubview:v84];
  }
  v85 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self buttonTitleString];
  v95[0] = v85;
  v86 = [MEMORY[0x263EFF8C0] arrayWithObjects:v95 count:1];
  v87 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self disclaimerString];
  v88 = +[HRStackedButtonView buddyStackedButtonViewWithTitles:v86 footerText:v87 boldFooterText:0 delegate:self];
  [(HROnboardingElectrocardiogramAvailabilityViewController *)self setStackedButtonView:v88];

  v89 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self stackedButtonView];
  [v89 setFixedBottomButtonSpacing:1];

  v90 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self stackedButtonView];
  [v90 setTranslatesAutoresizingMaskIntoConstraints:0];

  v91 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self stackedButtonView];
  [v91 setBlurHidden:1];

  v92 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self contentView];
  v93 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self stackedButtonView];
  [v92 addSubview:v93];

  [(HROnboardingElectrocardiogramAvailabilityViewController *)self _updateDateOfBirthDisplay];
}

- (void)setUpConstraints
{
  v85.receiver = self;
  v85.super_class = (Class)HROnboardingElectrocardiogramAvailabilityViewController;
  [(HROnboardingElectrocardiogramAvailabilityViewController *)&v85 setUpConstraints];
  v3 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self heroView];
  v4 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self contentView];
  objc_msgSend(v3, "hk_alignHorizontalConstraintsWithView:margin:", v4, 0.0);

  id v5 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self heroView];
  uint64_t v6 = [v5 topAnchor];
  id v7 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self contentView];
  v8 = [v7 topAnchor];
  v9 = [v6 constraintEqualToAnchor:v8];
  [v9 setActive:1];

  v10 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self titleLabel];
  v11 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self contentView];
  HKHealthUIBuddyDirectionalEdgeInsets();
  objc_msgSend(v10, "hrui_alignHorizontalConstraintsWithView:insets:", v11);

  objc_super v12 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self titleLabel];
  v13 = [v12 topAnchor];
  v14 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self heroView];
  v15 = [v14 bottomAnchor];
  v16 = [v13 constraintEqualToAnchor:v15 constant:29.0];
  [v16 setActive:1];

  v17 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self bodyLabel];
  v18 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self titleLabel];
  objc_msgSend(v17, "hk_alignHorizontalConstraintsWithView:margin:", v18, 0.0);

  v19 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self bodyLabel];
  id v20 = [v19 topAnchor];
  v21 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self titleLabel];
  v22 = [v21 bottomAnchor];
  [(HROnboardingElectrocardiogramAvailabilityViewController *)self _titleBottomToBodyTop];
  v23 = objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22);
  [v23 setActive:1];

  v24 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayPromptLabel];
  v25 = [v24 topAnchor];
  v26 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self bodyLabel];
  v27 = [v26 bottomAnchor];
  [(HROnboardingElectrocardiogramAvailabilityViewController *)self _bodyBottomToAgePromptTop];
  v28 = objc_msgSend(v25, "constraintEqualToAnchor:constant:", v27);
  [v28 setActive:1];

  v29 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayPromptLabel];
  v30 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self titleLabel];
  objc_msgSend(v29, "hk_alignHorizontalConstraintsWithView:margin:", v30, 0.0);

  v31 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayTopSeparator];
  v32 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self contentView];
  objc_msgSend(v31, "hk_alignHorizontalConstraintsWithView:margin:", v32, 0.0);

  id v33 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayTopSeparator];
  v34 = [v33 topAnchor];
  v35 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayPromptLabel];
  v36 = [v35 lastBaselineAnchor];
  [(HROnboardingElectrocardiogramAvailabilityViewController *)self _agePromptLastBaselineToAgeEntryTop];
  v37 = objc_msgSend(v34, "constraintEqualToAnchor:constant:", v36);
  [v37 setActive:1];

  v38 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayEntryView];
  v39 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self titleLabel];
  objc_msgSend(v38, "hk_alignHorizontalConstraintsWithView:margin:", v39, 0.0);

  v40 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayEntryView];
  v41 = [v40 firstBaselineAnchor];
  v42 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayTopSeparator];
  v43 = [v42 bottomAnchor];
  [(HROnboardingElectrocardiogramAvailabilityViewController *)self _ageEntryTopSeparatorToFirstBaseline];
  v44 = objc_msgSend(v41, "constraintEqualToAnchor:constant:", v43);
  [v44 setActive:1];

  v45 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayBottomSeparator];
  v46 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self contentView];
  objc_msgSend(v45, "hk_alignHorizontalConstraintsWithView:margin:", v46, 0.0);

  v47 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayBottomSeparator];
  v48 = [v47 topAnchor];
  v49 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayEntryView];
  v50 = [v49 lastBaselineAnchor];
  [(HROnboardingElectrocardiogramAvailabilityViewController *)self _ageEntryLastBaselineToBottomSeparator];
  v51 = objc_msgSend(v48, "constraintEqualToAnchor:constant:", v50);
  [v51 setActive:1];

  v52 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayFooterLabel];
  v53 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self titleLabel];
  double v54 = *MEMORY[0x263F1C228];
  double v55 = *(double *)(MEMORY[0x263F1C228] + 8);
  double v56 = *(double *)(MEMORY[0x263F1C228] + 16);
  double v57 = *(double *)(MEMORY[0x263F1C228] + 24);
  objc_msgSend(v52, "hk_alignHorizontalConstraintsWithView:insets:", v53, *MEMORY[0x263F1C228], v55, v56, v57);

  v58 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayFooterLabel];
  v59 = [v58 firstBaselineAnchor];
  v60 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayBottomSeparator];
  v61 = [v60 bottomAnchor];
  [(HROnboardingElectrocardiogramAvailabilityViewController *)self _bottomSeparatorToBirthdayFooterFirstBaseline];
  v62 = objc_msgSend(v59, "constraintEqualToAnchor:constant:", v61);
  [v62 setActive:1];

  v63 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self locationFooterString];

  if (v63)
  {
    v64 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self locationFooterLabel];
    v65 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self titleLabel];
    objc_msgSend(v64, "hk_alignHorizontalConstraintsWithView:insets:", v65, v54, v55, v56, v57);

    v66 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self locationFooterLabel];
    v67 = [v66 topAnchor];
    v68 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayFooterLabel];
    v69 = [v68 bottomAnchor];
    [(HROnboardingElectrocardiogramAvailabilityViewController *)self _birthdayFooterLastBaselineToContinueButton];
    id v70 = objc_msgSend(v67, "constraintEqualToAnchor:constant:", v69);
    [v70 setActive:1];

    v71 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self locationFooterLabel];
    [v71 lastBaselineAnchor];
  }
  else
  {
    v71 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayFooterLabel];
    [v71 bottomAnchor];
  v72 = };

  v73 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self stackedButtonView];
  v74 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self titleLabel];
  objc_msgSend(v73, "hk_alignHorizontalConstraintsWithView:margin:", v74, 0.0);

  v75 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self stackedButtonView];
  v76 = [v75 topAnchor];
  [(HROnboardingElectrocardiogramAvailabilityViewController *)self _birthdayFooterLastBaselineToContinueButton];
  v77 = objc_msgSend(v76, "constraintEqualToAnchor:constant:", v72);
  [v77 setActive:1];

  v78 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self stackedButtonView];
  v79 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self contentView];
  [v78 alignBlurViewHorizontalConstraintsWithView:v79];

  v80 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self contentView];
  v81 = [v80 bottomAnchor];
  v82 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self stackedButtonView];
  v83 = [v82 bottomAnchor];
  v84 = [v81 constraintEqualToAnchor:v83];
  [v84 setActive:1];
}

- (id)createHeroView
{
  v2 = [[HROnboardingWristImageView alloc] initWithImageStyle:1];
  [(HROnboardingWristImageView *)v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(HROnboardingWristImageView *)v2 setContentMode:1];
  [(HROnboardingWristImageView *)v2 setTimeRemaining:26.0];
  return v2;
}

- (void)_setupBirthdayEntryView
{
  v20[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F1C768]);
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  v4 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self _ageEntryTitleFont];
  [v3 setFont:v4];

  id v5 = HRHeartRhythmUIFrameworkBundle();
  uint64_t v6 = [v5 localizedStringForKey:@"AGE_GATE_DATE_OF_BIRTH_TITLE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable"];
  [v3 setText:v6];

  id v7 = [NSString healthAccessibilityIdentifier:1 suffix:@"BirthDate.Title"];
  [v3 setAccessibilityIdentifier:v7];

  [v3 setAdjustsFontForContentSizeCategory:1];
  [v3 setNumberOfLines:0];
  id v8 = objc_alloc(MEMORY[0x263F46880]);
  v9 = HRHeartRhythmUIFrameworkBundle();
  v10 = [v9 localizedStringForKey:@"AGE_GATE_FIELD_REQUIRED_PLACEHOLDER" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable"];
  v11 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self _defaultDOB];
  objc_super v12 = objc_msgSend(v8, "initWithFrame:initialText:defaultDate:maxYears:", v10, v11, 130, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));

  [v12 setDelegate:self];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  v13 = [NSString healthAccessibilityIdentifier:1 suffix:@"BirthDate.Picker"];
  [v12 setAccessibilityIdentifier:v13];

  id v14 = objc_alloc(MEMORY[0x263F1C9B8]);
  v20[0] = v3;
  v20[1] = v12;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  v16 = (void *)[v14 initWithArrangedSubviews:v15];

  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v16 setAxis:HKUIApplicationIsUsingAccessibilityContentSizeCategory()];
  [v16 setCustomSpacing:v3 afterView:28.0];
  LODWORD(v17) = 1148846080;
  [v3 setContentHuggingPriority:0 forAxis:v17];
  [(HROnboardingElectrocardiogramAvailabilityViewController *)self setBirthdayEntryView:v16];
  v18 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self contentView];
  v19 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self birthdayEntryView];
  [v18 addSubview:v19];
}

- (BOOL)_meetsAgeRequirement
{
  id v3 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self dateOfBirth];
  v4 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self ageWithDate:v3];

  if (v4)
  {
    id v5 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self ageLimit];
    BOOL v6 = [v4 compare:v5] != -1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)ageWithDate:(id)a3
{
  if (a3)
  {
    v4 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendarWithUTCTimeZone");
    id v5 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendarWithLocalTimeZone");
    BOOL v6 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self dateOfBirth];
    id v7 = objc_msgSend(v4, "hk_dateOfBirthDateComponentsWithDate:", v6);

    id v8 = [MEMORY[0x263EFF910] date];
    v9 = objc_msgSend(v5, "hk_dateOfBirthDateComponentsWithDate:", v8);

    v10 = [v5 components:4 fromDateComponents:v7 toDateComponents:v9 options:0];
    v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "year"));
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (void)compactDatePickerView:(id)a3 didChangeValue:(id)a4
{
}

- (void)stackedButtonView:(id)a3 didTapButtonAtIndex:(int64_t)a4
{
  id v7 = a3;
  if (!a4)
  {
    if ([(HROnboardingElectrocardiogramAvailabilityViewController *)self _meetsAgeRequirement])
    {
      [(HROnboardingElectrocardiogramAvailabilityViewController *)self _trackElectrocardiogramOnboardingStepIfNeeded:3 countryCode:0 algorithmVersion:0];
      id v8 = [v7 buttons];
      v9 = [v8 objectAtIndexedSubscript:0];

      [v9 setEnabled:0];
      v10 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self onboardingAvailabilityDeterminer];

      if (!v10)
      {
        v11 = [HRElectrocardiogramCurrentLocationOnboardingDeterminer alloc];
        objc_super v12 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self delegate];
        v13 = [v12 healthStore];
        id v14 = [(HRElectrocardiogramCurrentLocationOnboardingDeterminer *)v11 initWithHealthStore:v13];
        [(HROnboardingElectrocardiogramAvailabilityViewController *)self setOnboardingAvailabilityDeterminer:v14];
      }
      v15 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self onboardingAvailabilityDeterminer];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __97__HROnboardingElectrocardiogramAvailabilityViewController_stackedButtonView_didTapButtonAtIndex___block_invoke;
      v18[3] = &unk_2645810E8;
      id v19 = v9;
      id v20 = self;
      SEL v21 = a2;
      id v16 = v9;
      [v15 isElectrocardiogramOnboardingAvailableInCurrentLocationForActiveWatch:v18];
    }
    else
    {
      double v17 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self ageIneligiblePromptBodyString];
      [(HROnboardingElectrocardiogramAvailabilityViewController *)self presentAlertWithMessage:v17];
    }
  }
}

void __97__HROnboardingElectrocardiogramAvailabilityViewController_stackedButtonView_didTapButtonAtIndex___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __97__HROnboardingElectrocardiogramAvailabilityViewController_stackedButtonView_didTapButtonAtIndex___block_invoke_2;
  v15[3] = &unk_2645810C0;
  id v16 = *(id *)(a1 + 32);
  id v17 = v9;
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  id v18 = v8;
  uint64_t v19 = v10;
  id v20 = v7;
  uint64_t v21 = v11;
  id v12 = v7;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(MEMORY[0x263EF83A0], v15);
}

void __97__HROnboardingElectrocardiogramAvailabilityViewController_stackedButtonView_didTapButtonAtIndex___block_invoke_2(id *a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  [a1[4] setEnabled:1];
  id v3 = a1 + 5;
  id v2 = a1[5];
  if (v2 || !a1[6])
  {
    if ([v2 code] == 111)
    {
      id v4 = a1[7];
      id v5 = [v4 featureDisabledBodyString];
      [v4 presentLearnMoreAlertWithMessage:v5 learnMoreTapped:&__block_literal_global_0];
    }
    else if ([*v3 code] == 109)
    {
      id v6 = a1[7];
      id v5 = [v6 locationNotFoundPromptBodyString];
      id v7 = [a1[7] locationNotFoundPromptTitleString];
      [v6 presentAlertWithMessage:v5 title:v7];
    }
    else
    {
      if ([*v3 code] == 113)
      {
        id v13 = a1[7];
        uint64_t v14 = [v13 watchOSVersionTooLowBodyString];
      }
      else
      {
        uint64_t v15 = [a1[5] code];
        id v13 = a1[7];
        if (v15 == 112) {
          [a1[7] deviceNotSupportedBodyString];
        }
        else {
        uint64_t v14 = [a1[7] locationFeatureIneligiblePromptBodyString];
        }
      }
      id v5 = (void *)v14;
      [v13 presentAlertWithMessage:v14];
    }

    _HKInitializeLogging();
    id v16 = (void *)*MEMORY[0x263F09920];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR)) {
      __97__HROnboardingElectrocardiogramAvailabilityViewController_stackedButtonView_didTapButtonAtIndex___block_invoke_2_cold_1((uint64_t)a1, v16, (uint64_t *)a1 + 5);
    }
  }
  else
  {
    _HKInitializeLogging();
    id v8 = *MEMORY[0x263F09920];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_DEFAULT))
    {
      id v9 = a1[8];
      id v10 = a1[6];
      *(_DWORD *)buf = 136446722;
      uint64_t v21 = "-[HROnboardingElectrocardiogramAvailabilityViewController stackedButtonView:didTapButtonAtIndex:]_block_invoke";
      __int16 v22 = 2114;
      id v23 = v9;
      __int16 v24 = 2114;
      id v25 = v10;
      _os_log_impl(&dword_220CA3000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}s] Location check: countryCode: %{public}@ algorithmVersion: %{public}@", buf, 0x20u);
    }
    uint64_t v11 = [a1[7] ecgAppInstallability];
    id v12 = a1[7];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __97__HROnboardingElectrocardiogramAvailabilityViewController_stackedButtonView_didTapButtonAtIndex___block_invoke_335;
    v17[3] = &unk_264581098;
    v17[4] = v12;
    id v18 = a1[8];
    id v19 = a1[6];
    [v11 checkElectrocardiogramAppInstallStateWithContext:v12 completion:v17];
  }
}

void __97__HROnboardingElectrocardiogramAvailabilityViewController_stackedButtonView_didTapButtonAtIndex___block_invoke_3()
{
  id v1 = [NSURL URLWithString:*MEMORY[0x263F09538]];
  v0 = [MEMORY[0x263F01880] defaultWorkspace];
  [v0 openURL:v1 withOptions:0];
}

void __97__HROnboardingElectrocardiogramAvailabilityViewController_stackedButtonView_didTapButtonAtIndex___block_invoke_335(uint64_t a1, int a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!a2)
  {
    _HKInitializeLogging();
    uint64_t v14 = *MEMORY[0x263F09920];
    BOOL v15 = os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (!v15) {
        goto LABEL_9;
      }
      int v19 = 136446466;
      id v20 = "-[HROnboardingElectrocardiogramAvailabilityViewController stackedButtonView:didTapButtonAtIndex:]_block_invoke";
      __int16 v21 = 2114;
      id v22 = v5;
      id v16 = "[%{public}s]: Failed to install ECG App with error: %{public}@";
      id v17 = v14;
      uint32_t v18 = 22;
    }
    else
    {
      if (!v15) {
        goto LABEL_9;
      }
      int v19 = 136446210;
      id v20 = "-[HROnboardingElectrocardiogramAvailabilityViewController stackedButtonView:didTapButtonAtIndex:]_block_invoke";
      id v16 = "[%{public}s]: ECG App install was cancelled";
      id v17 = v14;
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
  id v10 = [*(id *)(a1 + 32) delegate];
  uint64_t v11 = [v10 userInfo];
  [v11 setObject:v9 forKeyedSubscript:@"HROnboardingElectrocardiogramAlgorithmVersionKey"];

  [*(id *)(a1 + 32) _trackElectrocardiogramOnboardingStepIfNeeded:4 countryCode:*(void *)(a1 + 40) algorithmVersion:*(void *)(a1 + 48)];
  id v12 = [*(id *)(a1 + 32) delegate];
  [v12 stepForward];

  id v13 = [*(id *)(a1 + 32) ecgAppInstallability];
  [v13 setAllowInstallingElectrocardiogramWatchApp:1];

LABEL_9:
}

- (void)_trackElectrocardiogramOnboardingStepIfNeeded:(int64_t)a3 countryCode:(id)a4 algorithmVersion:(id)a5
{
  id v11 = a4;
  id v8 = a5;
  if ([(HROnboardingElectrocardiogramAvailabilityViewController *)self isOnboarding]
    && !+[HRElectrocardiogramOnboardingManager hasOverriddenOnboardingSettings])
  {
    if (v8)
    {
      uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x263F0A348], "onboardingVersionForKnownAlgorithmVersion:", objc_msgSend(v8, "integerValue")));
    }
    else
    {
      uint64_t v9 = 0;
    }
    id v10 = +[HRUIAnalyticsManager sharedManager];
    objc_msgSend(v10, "trackElectrocardiogramOnboardingStep:forOnboardingType:onboardingVersion:countryCode:provenance:", a3, 0, v9, v11, -[HROnboardingElectrocardiogramAvailabilityViewController provenance](self, "provenance"));
  }
}

- (void)_updateDateOfBirthDisplay
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self dateOfBirth];

  if (v3)
  {
    long long v25 = 0uLL;
    long long v26 = 0uLL;
    long long v23 = 0uLL;
    long long v24 = 0uLL;
    id v4 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self stackedButtonView];
    id v5 = [v4 buttons];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          [v10 setEnabled:1];
          id v11 = HKHealthKeyColor();
          [v10 setBackgroundColor:v11];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v7);
    }
  }
  else
  {
    long long v21 = 0uLL;
    long long v22 = 0uLL;
    *((void *)&v19 + 1) = 0;
    long long v20 = 0uLL;
    id v12 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self stackedButtonView];
    id v5 = [v12 buttons];

    uint64_t v13 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v5);
          }
          id v17 = *(void **)(*((void *)&v19 + 1) + 8 * j);
          [v17 setEnabled:0];
          uint32_t v18 = [MEMORY[0x263F1C550] lightGrayColor];
          [v17 setBackgroundColor:v18];
        }
        uint64_t v14 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v14);
    }
  }
}

- (id)_titleFontTextStyle
{
  return (id)*MEMORY[0x263F1D2B0];
}

- (id)_titleFont
{
  id v2 = (void *)MEMORY[0x263F1C658];
  id v3 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self _titleFontTextStyle];
  id v4 = objc_msgSend(v2, "hk_scalableFontForTextStyle:symbolicTraits:", v3, 32770);

  return v4;
}

- (id)_bodyFontTextStyle
{
  return (id)*MEMORY[0x263F1D260];
}

- (id)_bodyFont
{
  id v2 = (void *)MEMORY[0x263F1C658];
  id v3 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self _bodyFontTextStyle];
  id v4 = [v2 preferredFontForTextStyle:v3];

  return v4;
}

- (id)_birthdayPromptFont
{
  id v2 = (void *)MEMORY[0x263F1C658];
  id v3 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self _bodyFontTextStyle];
  id v4 = objc_msgSend(v2, "hk_preferredFontForTextStyle:symbolicTraits:", v3, 2);

  return v4;
}

- (id)_footnoteTextStyle
{
  return (id)*MEMORY[0x263F1D280];
}

- (id)_footnoteFont
{
  id v2 = (void *)MEMORY[0x263F1C658];
  id v3 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self _footnoteTextStyle];
  id v4 = [v2 preferredFontForTextStyle:v3];

  return v4;
}

- (double)_titleBottomToBodyTop
{
  id v2 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self _bodyFont];
  [v2 _scaledValueForValue:15.0];
  double v4 = v3;

  return v4;
}

- (double)_bodyBottomToAgePromptTop
{
  id v2 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self _bodyFont];
  [v2 _scaledValueForValue:37.0];
  double v4 = v3;

  return v4;
}

- (id)_ageEntryTitleFont
{
  return (id)objc_msgSend(MEMORY[0x263F1C658], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x263F1D260], 2);
}

- (double)_agePromptLastBaselineToAgeEntryTop
{
  id v2 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self _bodyFont];
  [v2 _scaledValueForValue:20.0];
  double v4 = v3;

  return v4;
}

- (double)_ageEntryTopSeparatorToFirstBaseline
{
  id v2 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self _bodyFont];
  [v2 _scaledValueForValue:36.0];
  double v4 = v3;

  return v4;
}

- (double)_ageEntryLastBaselineToBottomSeparator
{
  id v2 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self _bodyFont];
  [v2 _scaledValueForValue:24.0];
  double v4 = v3;

  return v4;
}

- (double)_bottomSeparatorToBirthdayFooterFirstBaseline
{
  id v2 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self _bodyFont];
  [v2 _scaledValueForValue:20.0];
  double v4 = v3;

  return v4;
}

- (double)_birthdayFooterLastBaselineToContinueButton
{
  id v2 = [(HROnboardingElectrocardiogramAvailabilityViewController *)self _bodyFont];
  [v2 _scaledValueForValue:6.0];
  double v4 = v3;

  return v4;
}

- (id)titleString
{
  return HRUIECGLocalizedString(@"ECG_ONBOARDING_1_TITLE");
}

- (id)bodyString
{
  return HRUIECGLocalizedString(@"ECG_ONBOARDING_1_BODY");
}

- (id)birthdayFooterString
{
  return HRUIECGLocalizedString(@"ECG_ONBOARDING_1_BIRTHDAY_FOOTNOTE");
}

- (id)locationFooterString
{
  id v2 = HRHeartRhythmUIFrameworkBundle();
  double v3 = [v2 localizedStringForKey:@"ECG_ONBOARDING_1_LOCATION_FOOTNOTE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Shared"];

  return v3;
}

- (id)learnMoreString
{
  return 0;
}

- (id)disclaimerString
{
  return 0;
}

- (id)buttonTitleString
{
  id v2 = HRHeartRhythmUIFrameworkBundle();
  double v3 = [v2 localizedStringForKey:@"ONBOARDING_CONTINUE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable"];

  return v3;
}

- (id)ageLimit
{
  return &unk_26D2BF270;
}

- (id)ageIneligiblePromptTitleString
{
  return HRUIECGLocalizedString(@"ECG_AGE_GATE_INELIGIBLE_TITLE");
}

- (id)ageIneligiblePromptBodyString
{
  return HRUIECGLocalizedString(@"ECG_AGE_GATE_INELIGIBLE_BODY");
}

- (id)ageIneligiblePromptAckButtonString
{
  return HRUIECGLocalizedString(@"ECG_AGE_GATE_INELIGIBLE_ACK_BUTTON");
}

- (id)locationFeatureIneligiblePromptBodyString
{
  id v2 = HRHeartRhythmUIFrameworkBundle();
  double v3 = [v2 localizedStringForKey:@"ECG_ONBOARDING_1_LOCATION_INELIGIBLE_BODY" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Shared"];

  return v3;
}

- (id)locationNotFoundPromptTitleString
{
  id v2 = HRHeartRhythmUIFrameworkBundle();
  double v3 = [v2 localizedStringForKey:@"ECG_ONBOARDING_1_LOCATION_NOT_FOUND_TITLE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Shared"];

  return v3;
}

- (id)locationNotFoundPromptBodyString
{
  id v2 = HRHeartRhythmUIFrameworkBundle();
  double v3 = [v2 localizedStringForKey:@"ECG_ONBOARDING_1_LOCATION_NOT_FOUND_BODY" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Shared"];

  return v3;
}

- (id)featureDisabledBodyString
{
  id v2 = HRHeartRhythmUIFrameworkBundle();
  double v3 = [v2 localizedStringForKey:@"ECG_ONBOARDING_1_FEATURE_DISABLED_BODY" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Shared"];

  return v3;
}

- (id)deviceNotSupportedBodyString
{
  id v2 = HRHeartRhythmUIFrameworkBundle();
  double v3 = [v2 localizedStringForKey:@"ECG_ONBOARDING_1_DEVICE_NOT_SUPPORTED_BODY" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Shared"];

  return v3;
}

- (id)watchOSVersionTooLowBodyString
{
  id v2 = HRHeartRhythmUIFrameworkBundle();
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

- (UILabel)birthdayPromptLabel
{
  return self->_birthdayPromptLabel;
}

- (void)setBirthdayPromptLabel:(id)a3
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

- (UILabel)birthdayFooterLabel
{
  return self->_birthdayFooterLabel;
}

- (void)setBirthdayFooterLabel:(id)a3
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

- (NSLayoutConstraint)contentViewBottomConstraint
{
  return self->_contentViewBottomConstraint;
}

- (void)setContentViewBottomConstraint:(id)a3
{
}

- (int64_t)provenance
{
  return self->_provenance;
}

- (void)setProvenance:(int64_t)a3
{
  self->_provenance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_stackedButtonView, 0);
  objc_storeStrong((id *)&self->_locationFooterLabel, 0);
  objc_storeStrong((id *)&self->_birthdayFooterLabel, 0);
  objc_storeStrong((id *)&self->_birthdayBottomSeparator, 0);
  objc_storeStrong((id *)&self->_dateOfBirth, 0);
  objc_storeStrong((id *)&self->_birthdayEntryView, 0);
  objc_storeStrong((id *)&self->_birthdayTopSeparator, 0);
  objc_storeStrong((id *)&self->_birthdayPromptLabel, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_heroView, 0);
  objc_storeStrong((id *)&self->_ecgAppInstallability, 0);
  objc_storeStrong((id *)&self->_onboardingAvailabilityDeterminer, 0);
}

- (id)createLearnMoreExpandedView
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  id v2 = objc_alloc_init(MEMORY[0x263F1CB60]);
  return v2;
}

void __97__HROnboardingElectrocardiogramAvailabilityViewController_stackedButtonView_didTapButtonAtIndex___block_invoke_2_cold_1(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 56);
  id v5 = *(const char **)(a1 + 72);
  uint64_t v6 = a2;
  uint64_t v7 = NSStringFromSelector(v5);
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