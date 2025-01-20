@interface HROnboardingAtrialFibrillationEnableViewController
- (HRStackedButtonView)stackedButtonView;
- (NSLayoutConstraint)contentViewBottomConstraint;
- (UILabel)bodyLabel;
- (UILabel)footnoteLabel;
- (UILabel)titleLabel;
- (UIView)heroView;
- (double)_footnoteToButton;
- (double)_titleLastBaselineToBodyFirstBaseline;
- (id)_bodyFont;
- (id)_bodyFontTextStyle;
- (id)_footnoteFont;
- (id)_footnoteFontTextStyle;
- (id)_titleFont;
- (id)_titleFontTextStyle;
- (id)axidForElementWithString:(id)a3;
- (id)createHeroView;
- (id)initForOnboarding:(BOOL)a3 upgradingFromAlgorithmVersion:(int64_t)a4;
- (void)setBodyLabel:(id)a3;
- (void)setContentViewBottomConstraint:(id)a3;
- (void)setFootnoteLabel:(id)a3;
- (void)setHeroView:(id)a3;
- (void)setStackedButtonView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUpConstraints;
- (void)setUpUI;
- (void)stackedButtonView:(id)a3 didTapButtonAtIndex:(int64_t)a4;
- (void)viewControllerDidLeaveAdaptiveModal;
- (void)viewControllerWillEnterAdaptiveModal;
@end

@implementation HROnboardingAtrialFibrillationEnableViewController

- (id)initForOnboarding:(BOOL)a3 upgradingFromAlgorithmVersion:(int64_t)a4
{
  BOOL v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HROnboardingAtrialFibrillationEnableViewController;
  id v5 = [(HROnboardingAtrialFibrillationEnableViewController *)&v9 initForOnboarding:a3 upgradingFromAlgorithmVersion:a4];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 navigationItem];
    [v7 setHidesBackButton:v4];
  }
  return v6;
}

- (void)setUpUI
{
  v59[2] = *MEMORY[0x263EF8340];
  v58.receiver = self;
  v58.super_class = (Class)HROnboardingAtrialFibrillationEnableViewController;
  [(HROnboardingAtrialFibrillationEnableViewController *)&v58 setUpUI];
  v3 = [(HROnboardingAtrialFibrillationEnableViewController *)self createHeroView];
  [(HROnboardingAtrialFibrillationEnableViewController *)self setHeroView:v3];

  BOOL v4 = [(HROnboardingAtrialFibrillationEnableViewController *)self heroView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v5 = [(HROnboardingAtrialFibrillationEnableViewController *)self contentView];
  v6 = [(HROnboardingAtrialFibrillationEnableViewController *)self heroView];
  [v5 addSubview:v6];

  id v7 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HROnboardingAtrialFibrillationEnableViewController *)self setTitleLabel:v7];

  v8 = HRHeartRhythmUIFrameworkBundle();
  objc_super v9 = [v8 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ENABLE_NOTIFICATION_TITLE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];
  v10 = [(HROnboardingAtrialFibrillationEnableViewController *)self titleLabel];
  [v10 setText:v9];

  v11 = [(HROnboardingAtrialFibrillationEnableViewController *)self titleLabel];
  [v11 setTextAlignment:1];

  v12 = [(HROnboardingAtrialFibrillationEnableViewController *)self _titleFont];
  v13 = [(HROnboardingAtrialFibrillationEnableViewController *)self titleLabel];
  [v13 setFont:v12];

  v14 = [(HROnboardingAtrialFibrillationEnableViewController *)self titleLabel];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

  v15 = [(HROnboardingAtrialFibrillationEnableViewController *)self titleLabel];
  [v15 setNumberOfLines:0];

  v16 = [(HROnboardingAtrialFibrillationEnableViewController *)self axidForElementWithString:@"PageTitle"];
  v17 = [(HROnboardingAtrialFibrillationEnableViewController *)self titleLabel];
  [v17 setAccessibilityIdentifier:v16];

  v18 = [(HROnboardingAtrialFibrillationEnableViewController *)self contentView];
  v19 = [(HROnboardingAtrialFibrillationEnableViewController *)self titleLabel];
  [v18 addSubview:v19];

  id v20 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HROnboardingAtrialFibrillationEnableViewController *)self setBodyLabel:v20];

  v21 = HRHeartRhythmUIFrameworkBundle();
  v22 = [v21 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ENABLE_NOTIFICATION_BODY" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];
  v23 = [(HROnboardingAtrialFibrillationEnableViewController *)self bodyLabel];
  [v23 setText:v22];

  v24 = [(HROnboardingAtrialFibrillationEnableViewController *)self bodyLabel];
  [v24 setTextAlignment:1];

  v25 = [(HROnboardingAtrialFibrillationEnableViewController *)self _bodyFont];
  v26 = [(HROnboardingAtrialFibrillationEnableViewController *)self bodyLabel];
  [v26 setFont:v25];

  v27 = [(HROnboardingAtrialFibrillationEnableViewController *)self bodyLabel];
  [v27 setTranslatesAutoresizingMaskIntoConstraints:0];

  v28 = [(HROnboardingAtrialFibrillationEnableViewController *)self bodyLabel];
  [v28 setNumberOfLines:0];

  v29 = [(HROnboardingAtrialFibrillationEnableViewController *)self axidForElementWithString:@"IfYouReceiveANotificationDescription"];
  v30 = [(HROnboardingAtrialFibrillationEnableViewController *)self bodyLabel];
  [v30 setAccessibilityIdentifier:v29];

  v31 = [(HROnboardingAtrialFibrillationEnableViewController *)self contentView];
  v32 = [(HROnboardingAtrialFibrillationEnableViewController *)self bodyLabel];
  [v31 addSubview:v32];

  id v33 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HROnboardingAtrialFibrillationEnableViewController *)self setFootnoteLabel:v33];

  v34 = HRHeartRhythmUIFrameworkBundle();
  v35 = [v34 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ENABLE_NOTIFICATION_FOOTNOTE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];
  v36 = [(HROnboardingAtrialFibrillationEnableViewController *)self footnoteLabel];
  [v36 setText:v35];

  v37 = [(HROnboardingAtrialFibrillationEnableViewController *)self footnoteLabel];
  [v37 setTextAlignment:1];

  v38 = [(HROnboardingAtrialFibrillationEnableViewController *)self _footnoteFont];
  v39 = [(HROnboardingAtrialFibrillationEnableViewController *)self footnoteLabel];
  [v39 setFont:v38];

  v40 = [MEMORY[0x263F1C550] secondaryLabelColor];
  v41 = [(HROnboardingAtrialFibrillationEnableViewController *)self footnoteLabel];
  [v41 setTextColor:v40];

  v42 = [(HROnboardingAtrialFibrillationEnableViewController *)self footnoteLabel];
  [v42 setTranslatesAutoresizingMaskIntoConstraints:0];

  v43 = [(HROnboardingAtrialFibrillationEnableViewController *)self footnoteLabel];
  [v43 setNumberOfLines:0];

  v44 = [(HROnboardingAtrialFibrillationEnableViewController *)self axidForElementWithString:@"ManageNotificationsInHeartSettings"];
  v45 = [(HROnboardingAtrialFibrillationEnableViewController *)self footnoteLabel];
  [v45 setAccessibilityIdentifier:v44];

  v46 = [(HROnboardingAtrialFibrillationEnableViewController *)self contentView];
  v47 = [(HROnboardingAtrialFibrillationEnableViewController *)self footnoteLabel];
  [v46 addSubview:v47];

  if ([(HROnboardingAtrialFibrillationEnableViewController *)self isOnboarding])
  {
    v48 = HRHeartRhythmUIFrameworkBundle();
    v49 = [v48 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ENABLE_NOTIFICATION_ENABLE_BUTTON" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];
    v59[0] = v49;
    v50 = HRHeartRhythmUIFrameworkBundle();
    v51 = [v50 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETECTION_ENABLE_NOTIFICATION_NOT_NOW_BUTTON" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];
    v59[1] = v51;
    v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:2];

    v53 = +[HRStackedButtonView buddyStackedButtonViewWithTitles:v52 footerText:0 boldFooterText:0 delegate:self];
    [(HROnboardingAtrialFibrillationEnableViewController *)self setStackedButtonView:v53];

    v54 = [(HROnboardingAtrialFibrillationEnableViewController *)self stackedButtonView];
    [v54 setBlurHidden:1];

    v55 = [(HROnboardingAtrialFibrillationEnableViewController *)self stackedButtonView];
    [v55 setTranslatesAutoresizingMaskIntoConstraints:0];

    v56 = [(HROnboardingAtrialFibrillationEnableViewController *)self contentView];
    v57 = [(HROnboardingAtrialFibrillationEnableViewController *)self stackedButtonView];
    [v56 addSubview:v57];
  }
}

- (void)setUpConstraints
{
  v51.receiver = self;
  v51.super_class = (Class)HROnboardingAtrialFibrillationEnableViewController;
  [(HROnboardingAtrialFibrillationEnableViewController *)&v51 setUpConstraints];
  v3 = [(HROnboardingAtrialFibrillationEnableViewController *)self heroView];
  BOOL v4 = [v3 centerXAnchor];
  id v5 = [(HROnboardingAtrialFibrillationEnableViewController *)self contentView];
  v6 = [v5 centerXAnchor];
  id v7 = [v4 constraintEqualToAnchor:v6];
  [v7 setActive:1];

  v8 = [(HROnboardingAtrialFibrillationEnableViewController *)self heroView];
  objc_super v9 = [v8 topAnchor];
  v10 = [(HROnboardingAtrialFibrillationEnableViewController *)self contentView];
  v11 = [v10 topAnchor];
  [(HROnboardingAtrialFibrillationEnableViewController *)self contentTop];
  v12 = objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11);
  [v12 setActive:1];

  v13 = [(HROnboardingAtrialFibrillationEnableViewController *)self titleLabel];
  v14 = [(HROnboardingAtrialFibrillationEnableViewController *)self contentView];
  HKHealthUIBuddyDirectionalEdgeInsets();
  objc_msgSend(v13, "hrui_alignHorizontalConstraintsWithView:insets:", v14);

  v15 = [(HROnboardingAtrialFibrillationEnableViewController *)self titleLabel];
  v16 = [v15 topAnchor];
  v17 = [(HROnboardingAtrialFibrillationEnableViewController *)self heroView];
  v18 = [v17 bottomAnchor];
  v19 = [v16 constraintEqualToAnchor:v18 constant:30.0];
  [v19 setActive:1];

  id v20 = [(HROnboardingAtrialFibrillationEnableViewController *)self bodyLabel];
  v21 = [(HROnboardingAtrialFibrillationEnableViewController *)self titleLabel];
  objc_msgSend(v20, "hk_alignHorizontalConstraintsWithView:margin:", v21, 0.0);

  v22 = [(HROnboardingAtrialFibrillationEnableViewController *)self bodyLabel];
  v23 = [v22 firstBaselineAnchor];
  v24 = [(HROnboardingAtrialFibrillationEnableViewController *)self titleLabel];
  v25 = [v24 lastBaselineAnchor];
  [(HROnboardingAtrialFibrillationEnableViewController *)self _titleLastBaselineToBodyFirstBaseline];
  v26 = objc_msgSend(v23, "constraintEqualToAnchor:constant:", v25);
  [v26 setActive:1];

  v27 = [(HROnboardingAtrialFibrillationEnableViewController *)self footnoteLabel];
  v28 = [(HROnboardingAtrialFibrillationEnableViewController *)self titleLabel];
  objc_msgSend(v27, "hk_alignHorizontalConstraintsWithView:margin:", v28, 0.0);

  v29 = [(HROnboardingAtrialFibrillationEnableViewController *)self footnoteLabel];
  v30 = [v29 firstBaselineAnchor];
  v31 = [(HROnboardingAtrialFibrillationEnableViewController *)self bodyLabel];
  v32 = [v31 lastBaselineAnchor];
  [(HROnboardingAtrialFibrillationEnableViewController *)self _titleLastBaselineToBodyFirstBaseline];
  id v33 = objc_msgSend(v30, "constraintEqualToAnchor:constant:", v32);
  [v33 setActive:1];

  if ([(HROnboardingAtrialFibrillationEnableViewController *)self isOnboarding])
  {
    +[HRStackedButtonView topPadding];
    double v35 = 44.0 - v34;
    v36 = [(HROnboardingAtrialFibrillationEnableViewController *)self stackedButtonView];
    v37 = [(HROnboardingAtrialFibrillationEnableViewController *)self titleLabel];
    objc_msgSend(v36, "hk_alignHorizontalConstraintsWithView:margin:", v37, 0.0);

    v38 = [(HROnboardingAtrialFibrillationEnableViewController *)self stackedButtonView];
    v39 = [v38 topAnchor];
    v40 = [(HROnboardingAtrialFibrillationEnableViewController *)self footnoteLabel];
    v41 = [v40 bottomAnchor];
    v42 = [v39 constraintEqualToAnchor:v41 constant:v35];
    [v42 setActive:1];

    v43 = [(HROnboardingAtrialFibrillationEnableViewController *)self stackedButtonView];
    v44 = [(HROnboardingAtrialFibrillationEnableViewController *)self contentView];
    [v43 alignBlurViewHorizontalConstraintsWithView:v44];

    v45 = [(HROnboardingAtrialFibrillationEnableViewController *)self stackedButtonView];
    [v45 setBlurHidden:1];

    v46 = [(HROnboardingAtrialFibrillationEnableViewController *)self contentView];
    v47 = [v46 bottomAnchor];
    v48 = [(HROnboardingAtrialFibrillationEnableViewController *)self stackedButtonView];
    v49 = [v48 bottomAnchor];
    [v47 constraintEqualToAnchor:v49];
  }
  else
  {
    v46 = [(HROnboardingAtrialFibrillationEnableViewController *)self contentView];
    v47 = [v46 bottomAnchor];
    v48 = [(HROnboardingAtrialFibrillationEnableViewController *)self footnoteLabel];
    v49 = [v48 bottomAnchor];
    [(HROnboardingAtrialFibrillationEnableViewController *)self _footnoteToButton];
    objc_msgSend(v47, "constraintEqualToAnchor:constant:", v49);
  v50 = };
  [v50 setActive:1];
}

- (id)createHeroView
{
  v2 = objc_alloc_init(HRSimulatedAtrialFibrillationNotificationView);
  v3 = [(HRSimulatedAtrialFibrillationNotificationView *)v2 widthAnchor];
  BOOL v4 = [v3 constraintEqualToConstant:160.0];
  [v4 setActive:1];

  return v2;
}

- (void)stackedButtonView:(id)a3 didTapButtonAtIndex:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    id v12 = v6;
    id v7 = [(HROnboardingAtrialFibrillationEnableViewController *)self delegate];
    v8 = [v7 userInfo];
    objc_super v9 = v8;
    uint64_t v10 = MEMORY[0x263EFFA80];
  }
  else
  {
    if (a4) {
      goto LABEL_6;
    }
    id v12 = v6;
    id v7 = [(HROnboardingAtrialFibrillationEnableViewController *)self delegate];
    v8 = [v7 userInfo];
    objc_super v9 = v8;
    uint64_t v10 = MEMORY[0x263EFFA88];
  }
  [v8 setObject:v10 forKeyedSubscript:@"HROnboardingAtrialFibrillationEnableNotificationsKey"];

  v11 = [(HROnboardingAtrialFibrillationEnableViewController *)self delegate];
  [v11 stepForward];

  id v6 = v12;
LABEL_6:
}

- (id)_titleFontTextStyle
{
  return (id)*MEMORY[0x263F1D2B0];
}

- (id)_titleFont
{
  v2 = (void *)MEMORY[0x263F1C658];
  v3 = [(HROnboardingAtrialFibrillationEnableViewController *)self _titleFontTextStyle];
  BOOL v4 = objc_msgSend(v2, "hk_scalableFontForTextStyle:symbolicTraits:", v3, 32770);

  return v4;
}

- (id)_bodyFontTextStyle
{
  return (id)*MEMORY[0x263F1D260];
}

- (id)_bodyFont
{
  v2 = (void *)MEMORY[0x263F1C658];
  v3 = [(HROnboardingAtrialFibrillationEnableViewController *)self _bodyFontTextStyle];
  BOOL v4 = [v2 preferredFontForTextStyle:v3];

  return v4;
}

- (double)_titleLastBaselineToBodyFirstBaseline
{
  v2 = [(HROnboardingAtrialFibrillationEnableViewController *)self _bodyFont];
  [v2 _scaledValueForValue:32.0];
  double v4 = v3;

  return v4;
}

- (id)_footnoteFontTextStyle
{
  return (id)*MEMORY[0x263F1D280];
}

- (id)_footnoteFont
{
  v2 = (void *)MEMORY[0x263F1C658];
  double v3 = [(HROnboardingAtrialFibrillationEnableViewController *)self _footnoteFontTextStyle];
  double v4 = [v2 preferredFontForTextStyle:v3];

  return v4;
}

- (double)_footnoteToButton
{
  v2 = [(HROnboardingAtrialFibrillationEnableViewController *)self _bodyFont];
  [v2 _scaledValueForValue:44.0];
  double v4 = v3;

  return v4;
}

- (id)axidForElementWithString:(id)a3
{
  double v3 = NSString;
  id v4 = a3;
  id v5 = [v3 healthAccessibilityIdentifier:2 suffix:@"Onboarding"];
  id v6 = [v5 stringByAppendingFormat:@".%@", v4];

  return v6;
}

- (void)viewControllerWillEnterAdaptiveModal
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x263F1C468]);
  id v4 = (void *)MEMORY[0x263F1C3C0];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __90__HROnboardingAtrialFibrillationEnableViewController_viewControllerWillEnterAdaptiveModal__block_invoke;
  v11 = &unk_264580E18;
  objc_copyWeak(&v12, &location);
  id v5 = [v4 actionWithHandler:&v8];
  id v6 = objc_msgSend(v3, "initWithBarButtonSystemItem:primaryAction:", 0, v5, v8, v9, v10, v11);

  id v7 = [(HROnboardingAtrialFibrillationEnableViewController *)self navigationItem];
  [v7 setLeftBarButtonItem:v6];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __90__HROnboardingAtrialFibrillationEnableViewController_viewControllerWillEnterAdaptiveModal__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

- (void)viewControllerDidLeaveAdaptiveModal
{
  id v2 = [(HROnboardingAtrialFibrillationEnableViewController *)self navigationItem];
  [v2 setLeftBarButtonItem:0];
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_stackedButtonView, 0);
  objc_storeStrong((id *)&self->_footnoteLabel, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_heroView, 0);
}

@end