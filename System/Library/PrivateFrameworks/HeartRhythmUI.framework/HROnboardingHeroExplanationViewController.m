@interface HROnboardingHeroExplanationViewController
- (HRStackedButtonView)stackedButtonView;
- (NSLayoutConstraint)contentViewBottomConstraint;
- (NSString)bodyString;
- (NSString)buttonTitleString;
- (NSString)titleString;
- (UILabel)bodyLabel;
- (UILabel)titleLabel;
- (UIView)heroView;
- (double)_titleLastBaselineToBodyTop;
- (double)_titleTopToFirstBaseline;
- (double)_titleTopToFirstBaselineLeading;
- (id)_bodyFont;
- (id)_bodyFontTextStyle;
- (id)_titleFont;
- (id)_titleFontTextStyle;
- (id)createHeroView;
- (int64_t)accessibilityGroupID;
- (int64_t)stackedButtonViewLastButtonMode;
- (int64_t)textAlignment;
- (void)_adjustButtonFooterViewLocationForViewContentHeight;
- (void)_setUpButtonFooterView;
- (void)setBodyLabel:(id)a3;
- (void)setContentViewBottomConstraint:(id)a3;
- (void)setHeroView:(id)a3;
- (void)setStackedButtonView:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUpConstraints;
- (void)setUpUI;
- (void)stackedButtonView:(id)a3 didTapButtonAtIndex:(int64_t)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation HROnboardingHeroExplanationViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HROnboardingHeroExplanationViewController;
  [(HROnboardingHeroExplanationViewController *)&v3 viewDidLoad];
  [(HROnboardingHeroExplanationViewController *)self _setUpButtonFooterView];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HROnboardingHeroExplanationViewController;
  [(HROnboardingHeroExplanationViewController *)&v3 viewDidLayoutSubviews];
  [(HROnboardingHeroExplanationViewController *)self _adjustButtonFooterViewLocationForViewContentHeight];
}

- (void)setUpUI
{
  v37[1] = *MEMORY[0x263EF8340];
  v36.receiver = self;
  v36.super_class = (Class)HROnboardingHeroExplanationViewController;
  [(HROnboardingHeroExplanationViewController *)&v36 setUpUI];
  objc_super v3 = [(HROnboardingHeroExplanationViewController *)self createHeroView];
  [(HROnboardingHeroExplanationViewController *)self setHeroView:v3];

  v4 = [(HROnboardingHeroExplanationViewController *)self heroView];

  if (v4)
  {
    v5 = [(HROnboardingHeroExplanationViewController *)self heroView];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

    v6 = [(HROnboardingHeroExplanationViewController *)self contentView];
    v7 = [(HROnboardingHeroExplanationViewController *)self heroView];
    [v6 addSubview:v7];
  }
  id v8 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HROnboardingHeroExplanationViewController *)self setTitleLabel:v8];

  v9 = [(HROnboardingHeroExplanationViewController *)self titleString];
  v10 = [(HROnboardingHeroExplanationViewController *)self titleLabel];
  [v10 setText:v9];

  v11 = [(HROnboardingHeroExplanationViewController *)self _titleFont];
  v12 = [(HROnboardingHeroExplanationViewController *)self titleLabel];
  [v12 setFont:v11];

  v13 = [(HROnboardingHeroExplanationViewController *)self titleLabel];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

  v14 = [(HROnboardingHeroExplanationViewController *)self titleLabel];
  [v14 setNumberOfLines:0];

  v15 = objc_msgSend(NSString, "healthAccessibilityIdentifier:suffix:", -[HROnboardingHeroExplanationViewController accessibilityGroupID](self, "accessibilityGroupID"), @"Onboarding.PageTitle");
  v16 = [(HROnboardingHeroExplanationViewController *)self titleLabel];
  [v16 setAccessibilityIdentifier:v15];

  v17 = [(HROnboardingHeroExplanationViewController *)self contentView];
  v18 = [(HROnboardingHeroExplanationViewController *)self titleLabel];
  [v17 addSubview:v18];

  id v19 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HROnboardingHeroExplanationViewController *)self setBodyLabel:v19];

  v20 = [(HROnboardingHeroExplanationViewController *)self bodyString];
  v21 = [(HROnboardingHeroExplanationViewController *)self bodyLabel];
  [v21 setText:v20];

  v22 = [(HROnboardingHeroExplanationViewController *)self _bodyFont];
  v23 = [(HROnboardingHeroExplanationViewController *)self bodyLabel];
  [v23 setFont:v22];

  v24 = [(HROnboardingHeroExplanationViewController *)self bodyLabel];
  [v24 setTranslatesAutoresizingMaskIntoConstraints:0];

  v25 = [(HROnboardingHeroExplanationViewController *)self bodyLabel];
  [v25 setNumberOfLines:0];

  v26 = objc_msgSend(NSString, "healthAccessibilityIdentifier:suffix:", -[HROnboardingHeroExplanationViewController accessibilityGroupID](self, "accessibilityGroupID"), @"Onboarding.HowItWorksDescription");
  v27 = [(HROnboardingHeroExplanationViewController *)self bodyLabel];
  [v27 setAccessibilityIdentifier:v26];

  v28 = [(HROnboardingHeroExplanationViewController *)self contentView];
  v29 = [(HROnboardingHeroExplanationViewController *)self bodyLabel];
  [v28 addSubview:v29];

  if ([(HROnboardingHeroExplanationViewController *)self isOnboarding])
  {
    v30 = [(HROnboardingHeroExplanationViewController *)self buttonTitleString];
    v37[0] = v30;
    v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:1];
    v32 = +[HRStackedButtonView buddyStackedButtonViewWithTitles:v31 footerText:0 boldFooterText:0 delegate:self];
    [(HROnboardingHeroExplanationViewController *)self setStackedButtonView:v32];

    v33 = [(HROnboardingHeroExplanationViewController *)self stackedButtonView];
    [v33 setBlurHidden:1];

    v34 = [(HROnboardingHeroExplanationViewController *)self stackedButtonView];
    [v34 setFixedBottomButtonSpacing:1];

    v35 = [(HROnboardingHeroExplanationViewController *)self stackedButtonView];
    [v35 setTranslatesAutoresizingMaskIntoConstraints:0];
  }
}

- (void)setUpConstraints
{
  v32.receiver = self;
  v32.super_class = (Class)HROnboardingHeroExplanationViewController;
  [(HROnboardingHeroExplanationViewController *)&v32 setUpConstraints];
  objc_super v3 = [(HROnboardingHeroExplanationViewController *)self heroView];

  if (v3)
  {
    v4 = [(HROnboardingHeroExplanationViewController *)self heroView];
    v5 = [(HROnboardingHeroExplanationViewController *)self titleLabel];
    objc_msgSend(v4, "hk_alignHorizontalConstraintsWithView:margin:", v5, 0.0);

    v6 = [(HROnboardingHeroExplanationViewController *)self heroView];
    v7 = [v6 topAnchor];
    id v8 = [(HROnboardingHeroExplanationViewController *)self contentView];
    v9 = [v8 topAnchor];
    v10 = [v7 constraintEqualToAnchor:v9 constant:29.0];
    [v10 setActive:1];

    v11 = [(HROnboardingHeroExplanationViewController *)self titleLabel];
    v12 = [v11 topAnchor];
    v13 = [(HROnboardingHeroExplanationViewController *)self heroView];
    v14 = [v13 bottomAnchor];
    double v15 = 29.0;
  }
  else
  {
    v11 = [(HROnboardingHeroExplanationViewController *)self titleLabel];
    v12 = [v11 topAnchor];
    v13 = [(HROnboardingHeroExplanationViewController *)self contentView];
    v14 = [v13 topAnchor];
    [(HROnboardingHeroExplanationViewController *)self contentTop];
  }
  v16 = [v12 constraintEqualToAnchor:v14 constant:v15];
  [v16 setActive:1];

  v17 = [(HROnboardingHeroExplanationViewController *)self titleLabel];
  v18 = [(HROnboardingHeroExplanationViewController *)self contentView];
  HKHealthUIBuddyDirectionalEdgeInsets();
  objc_msgSend(v17, "hrui_alignHorizontalConstraintsWithView:insets:", v18);

  id v19 = [(HROnboardingHeroExplanationViewController *)self bodyLabel];
  v20 = [(HROnboardingHeroExplanationViewController *)self titleLabel];
  objc_msgSend(v19, "hk_alignHorizontalConstraintsWithView:margin:", v20, 0.0);

  v21 = [(HROnboardingHeroExplanationViewController *)self bodyLabel];
  v22 = [v21 topAnchor];
  v23 = [(HROnboardingHeroExplanationViewController *)self titleLabel];
  v24 = [v23 lastBaselineAnchor];
  [(HROnboardingHeroExplanationViewController *)self _titleLastBaselineToBodyTop];
  v25 = objc_msgSend(v22, "constraintEqualToAnchor:constant:", v24);
  [v25 setActive:1];

  v26 = [(HROnboardingHeroExplanationViewController *)self contentView];
  v27 = [v26 bottomAnchor];
  v28 = [(HROnboardingHeroExplanationViewController *)self bodyLabel];
  v29 = [v28 bottomAnchor];
  v30 = [v27 constraintEqualToAnchor:v29 constant:*MEMORY[0x263F46378]];
  [(HROnboardingHeroExplanationViewController *)self setContentViewBottomConstraint:v30];

  v31 = [(HROnboardingHeroExplanationViewController *)self contentViewBottomConstraint];
  [v31 setActive:1];
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
  v5 = [(HROnboardingHeroExplanationViewController *)self titleLabel];
  [v5 setTextAlignment:a3];

  id v6 = [(HROnboardingHeroExplanationViewController *)self bodyLabel];
  [v6 setTextAlignment:a3];
}

- (int64_t)stackedButtonViewLastButtonMode
{
  return 0;
}

- (void)stackedButtonView:(id)a3 didTapButtonAtIndex:(int64_t)a4
{
  if (!a4)
  {
    id v5 = [(HROnboardingHeroExplanationViewController *)self delegate];
    [v5 stepForward];
  }
}

- (void)_setUpButtonFooterView
{
  if ([(HROnboardingHeroExplanationViewController *)self isOnboarding])
  {
    objc_super v3 = [(HROnboardingHeroExplanationViewController *)self stackedButtonView];
    HKHealthUIBuddyDirectionalEdgeInsets();
    -[HROnboardingHeroExplanationViewController setFooterView:insets:](self, "setFooterView:insets:", v3);

    uint64_t v4 = [(HROnboardingHeroExplanationViewController *)self stackedButtonView];
    id v5 = [(HROnboardingHeroExplanationViewController *)self view];
    [v4 alignBlurViewHorizontalConstraintsWithView:v5];

    id v6 = [(HROnboardingHeroExplanationViewController *)self stackedButtonView];
    [v6 setBlurHidden:0];

    int64_t v7 = [(HROnboardingHeroExplanationViewController *)self stackedButtonViewLastButtonMode];
    id v8 = [(HROnboardingHeroExplanationViewController *)self stackedButtonView];
    [v8 setLastButtonMode:v7];
  }
}

- (void)_adjustButtonFooterViewLocationForViewContentHeight
{
  v44[1] = *MEMORY[0x263EF8340];
  if ([(HROnboardingHeroExplanationViewController *)self isOnboarding])
  {
    objc_super v3 = [(HROnboardingHeroExplanationViewController *)self view];
    [v3 layoutIfNeeded];

    uint64_t v4 = [(HROnboardingHeroExplanationViewController *)self view];
    id v5 = [(HROnboardingHeroExplanationViewController *)self stackedButtonView];
    id v6 = [v5 buttons];
    int64_t v7 = [v6 firstObject];
    [v7 frame];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    v16 = [(HROnboardingHeroExplanationViewController *)self stackedButtonView];
    objc_msgSend(v4, "convertRect:fromView:", v16, v9, v11, v13, v15);
    double v18 = v17;

    id v19 = [(HROnboardingHeroExplanationViewController *)self contentView];
    [v19 frame];
    double v21 = v20;
    v22 = [(HROnboardingHeroExplanationViewController *)self view];
    [v22 safeAreaInsets];
    double v24 = v18 - v23;

    if (v21 > v24)
    {
      [(HROnboardingHeroExplanationViewController *)self removeFooterView];
      v25 = [(HROnboardingHeroExplanationViewController *)self contentView];
      v26 = [(HROnboardingHeroExplanationViewController *)self stackedButtonView];
      [v25 addSubview:v26];

      v27 = [(HROnboardingHeroExplanationViewController *)self stackedButtonView];
      [v27 setBlurHidden:1];

      v28 = [(HROnboardingHeroExplanationViewController *)self stackedButtonView];
      v29 = [(HROnboardingHeroExplanationViewController *)self titleLabel];
      objc_msgSend(v28, "hk_alignHorizontalConstraintsWithView:margin:", v29, 0.0);

      v30 = [(HROnboardingHeroExplanationViewController *)self stackedButtonView];
      v31 = [v30 topAnchor];
      objc_super v32 = [(HROnboardingHeroExplanationViewController *)self bodyLabel];
      v33 = [v32 bottomAnchor];
      v34 = [v31 constraintEqualToAnchor:v33];
      [v34 setActive:1];

      v35 = (void *)MEMORY[0x263F08938];
      objc_super v36 = [(HROnboardingHeroExplanationViewController *)self contentViewBottomConstraint];
      v44[0] = v36;
      v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:1];
      [v35 deactivateConstraints:v37];

      [(HROnboardingHeroExplanationViewController *)self setContentViewBottomConstraint:0];
      v38 = [(HROnboardingHeroExplanationViewController *)self contentView];
      v39 = [v38 bottomAnchor];
      v40 = [(HROnboardingHeroExplanationViewController *)self stackedButtonView];
      v41 = [v40 bottomAnchor];
      v42 = [v39 constraintEqualToAnchor:v41];
      [(HROnboardingHeroExplanationViewController *)self setContentViewBottomConstraint:v42];

      v43 = [(HROnboardingHeroExplanationViewController *)self contentViewBottomConstraint];
      [v43 setActive:1];
    }
  }
}

- (id)_titleFontTextStyle
{
  return (id)*MEMORY[0x263F1D2B0];
}

- (id)_titleFont
{
  v2 = (void *)MEMORY[0x263F1C658];
  objc_super v3 = [(HROnboardingHeroExplanationViewController *)self _titleFontTextStyle];
  uint64_t v4 = objc_msgSend(v2, "hk_scalableFontForTextStyle:symbolicTraits:", v3, 32770);

  return v4;
}

- (double)_titleTopToFirstBaselineLeading
{
  int v2 = objc_msgSend(MEMORY[0x263F1C920], "hrui_currentDeviceHas5Point8InchScreen");
  double result = 36.0;
  if (v2) {
    return 44.0;
  }
  return result;
}

- (double)_titleTopToFirstBaseline
{
  objc_super v3 = [(HROnboardingHeroExplanationViewController *)self _titleFont];
  [(HROnboardingHeroExplanationViewController *)self _titleTopToFirstBaselineLeading];
  objc_msgSend(v3, "_scaledValueForValue:");
  double v5 = v4;

  return v5;
}

- (double)_titleLastBaselineToBodyTop
{
  int v2 = [(HROnboardingHeroExplanationViewController *)self _titleFont];
  [v2 _scaledValueForValue:24.0];
  double v4 = v3;

  return v4;
}

- (id)_bodyFontTextStyle
{
  return (id)*MEMORY[0x263F1D260];
}

- (id)_bodyFont
{
  int v2 = (void *)MEMORY[0x263F1C658];
  double v3 = [(HROnboardingHeroExplanationViewController *)self _bodyFontTextStyle];
  double v4 = [v2 preferredFontForTextStyle:v3];

  return v4;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
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
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_heroView, 0);
}

- (id)createHeroView
{
  return 0;
}

- (NSString)titleString
{
  return (NSString *)&stru_26D2B53D0;
}

- (NSString)bodyString
{
  return (NSString *)&stru_26D2B53D0;
}

- (NSString)buttonTitleString
{
  return (NSString *)&stru_26D2B53D0;
}

- (int64_t)accessibilityGroupID
{
  return 0;
}

@end