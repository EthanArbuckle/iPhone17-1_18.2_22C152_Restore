@interface HKOnboardingSetupView
- (HKOnboardingSetupView)initWithFrame:(CGRect)a3;
- (HKOnboardingSetupViewDelegate)delegate;
- (NSString)bodyString;
- (NSString)buttonTitleString;
- (NSString)titleString;
- (UIButton)onboardingButton;
- (UILabel)bodyLabel;
- (UILabel)titleLabel;
- (UIView)heroView;
- (id)createHeroView;
- (int64_t)accessibilityGroupID;
- (void)_didTapOnboardingButton;
- (void)_setUpConstraints;
- (void)setBodyLabel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHeroView:(id)a3;
- (void)setOnboardingButton:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation HKOnboardingSetupView

- (HKOnboardingSetupView)initWithFrame:(CGRect)a3
{
  v26.receiver = self;
  v26.super_class = (Class)HKOnboardingSetupView;
  v3 = -[HKOnboardingSetupView initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
    [(HKOnboardingSetupView *)v3 setBackgroundColor:v4];

    uint64_t v5 = [(HKOnboardingSetupView *)v3 createHeroView];
    heroView = v3->_heroView;
    v3->_heroView = (UIView *)v5;

    [(UIView *)v3->_heroView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HKOnboardingSetupView *)v3 addSubview:v3->_heroView];
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v7;

    [(UILabel *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_titleLabel setNumberOfLines:0];
    [(UILabel *)v3->_titleLabel setTextAlignment:4];
    v9 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v3->_titleLabel setTextColor:v9];

    v10 = [(HKOnboardingSetupView *)v3 titleString];
    [(UILabel *)v3->_titleLabel setText:v10];

    v11 = objc_msgSend(NSString, "healthAccessibilityIdentifier:suffix:", -[HKOnboardingSetupView accessibilityGroupID](v3, "accessibilityGroupID"), @"Welcome.SetupTitle");
    [(UILabel *)v3->_titleLabel setAccessibilityIdentifier:v11];

    v12 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E4FB2990], 2);
    [(UILabel *)v3->_titleLabel setFont:v12];

    [(UILabel *)v3->_titleLabel setAdjustsFontForContentSizeCategory:1];
    [(HKOnboardingSetupView *)v3 addSubview:v3->_titleLabel];
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    bodyLabel = v3->_bodyLabel;
    v3->_bodyLabel = v13;

    [(UILabel *)v3->_bodyLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_bodyLabel setNumberOfLines:0];
    [(UILabel *)v3->_bodyLabel setTextAlignment:4];
    v15 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v3->_bodyLabel setTextColor:v15];

    v16 = [(HKOnboardingSetupView *)v3 bodyString];
    [(UILabel *)v3->_bodyLabel setText:v16];

    v17 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", *MEMORY[0x1E4FB28C8]);
    [(UILabel *)v3->_bodyLabel setFont:v17];

    [(UILabel *)v3->_bodyLabel setAdjustsFontForContentSizeCategory:1];
    [(HKOnboardingSetupView *)v3 addSubview:v3->_bodyLabel];
    v18 = (void *)MEMORY[0x1E4FB14D0];
    v19 = HKHealthKeyColor();
    v20 = [(HKOnboardingSetupView *)v3 buttonTitleString];
    uint64_t v21 = objc_msgSend(v18, "hk_multiLineRoundRectButtonTintedWithColor:title:target:action:", v19, v20, v3, sel__didTapOnboardingButton);
    onboardingButton = v3->_onboardingButton;
    v3->_onboardingButton = (UIButton *)v21;

    v23 = objc_msgSend(NSString, "healthAccessibilityIdentifier:suffix:", -[HKOnboardingSetupView accessibilityGroupID](v3, "accessibilityGroupID"), @"Welcome.SetupButton");
    [(UIButton *)v3->_onboardingButton setAccessibilityIdentifier:v23];

    v24 = [(UIButton *)v3->_onboardingButton layer];
    [v24 setCornerRadius:8.0];

    [(UIButton *)v3->_onboardingButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HKOnboardingSetupView *)v3 addSubview:v3->_onboardingButton];
    [(HKOnboardingSetupView *)v3 _setUpConstraints];
  }
  return v3;
}

- (void)_setUpConstraints
{
  v3 = [(HKOnboardingSetupView *)self heroView];
  v4 = [v3 centerXAnchor];
  uint64_t v5 = [(HKOnboardingSetupView *)self centerXAnchor];
  v6 = [v4 constraintEqualToAnchor:v5];
  [v6 setActive:1];

  v7 = [(HKOnboardingSetupView *)self heroView];
  v8 = [v7 topAnchor];
  v9 = [(HKOnboardingSetupView *)self topAnchor];
  v10 = [v8 constraintEqualToAnchor:v9 constant:16.0];
  [v10 setActive:1];

  v11 = [(HKOnboardingSetupView *)self titleLabel];
  v12 = [v11 topAnchor];
  v13 = [(HKOnboardingSetupView *)self heroView];
  v14 = [v13 bottomAnchor];
  v15 = [v12 constraintEqualToAnchor:v14 constant:17.0];
  [v15 setActive:1];

  v16 = [(HKOnboardingSetupView *)self titleLabel];
  v17 = [v16 leadingAnchor];
  v18 = [(HKOnboardingSetupView *)self leadingAnchor];
  v19 = [v17 constraintEqualToAnchor:v18 constant:16.0];
  [v19 setActive:1];

  v20 = [(HKOnboardingSetupView *)self titleLabel];
  uint64_t v21 = [v20 trailingAnchor];
  v22 = [(HKOnboardingSetupView *)self trailingAnchor];
  v23 = [v21 constraintEqualToAnchor:v22 constant:-16.0];
  [v23 setActive:1];

  v24 = [(HKOnboardingSetupView *)self bodyLabel];
  v25 = [v24 topAnchor];
  objc_super v26 = [(HKOnboardingSetupView *)self titleLabel];
  v27 = [v26 bottomAnchor];
  v28 = [v25 constraintEqualToAnchor:v27 constant:2.0];
  [v28 setActive:1];

  v29 = [(HKOnboardingSetupView *)self bodyLabel];
  v30 = [v29 leadingAnchor];
  v31 = [(HKOnboardingSetupView *)self leadingAnchor];
  v32 = [v30 constraintEqualToAnchor:v31 constant:16.0];
  [v32 setActive:1];

  v33 = [(HKOnboardingSetupView *)self bodyLabel];
  v34 = [v33 trailingAnchor];
  v35 = [(HKOnboardingSetupView *)self trailingAnchor];
  v36 = [v34 constraintEqualToAnchor:v35 constant:-16.0];
  [v36 setActive:1];

  v37 = [(HKOnboardingSetupView *)self onboardingButton];
  v38 = [v37 topAnchor];
  v39 = [(HKOnboardingSetupView *)self bodyLabel];
  v40 = [v39 bottomAnchor];
  v41 = [v38 constraintEqualToAnchor:v40 constant:17.0];
  [v41 setActive:1];

  v42 = [(HKOnboardingSetupView *)self onboardingButton];
  v43 = [v42 leadingAnchor];
  v44 = [(HKOnboardingSetupView *)self leadingAnchor];
  v45 = [v43 constraintEqualToAnchor:v44 constant:16.0];
  [v45 setActive:1];

  v46 = [(HKOnboardingSetupView *)self onboardingButton];
  v47 = [v46 trailingAnchor];
  v48 = [(HKOnboardingSetupView *)self trailingAnchor];
  v49 = [v47 constraintEqualToAnchor:v48 constant:-16.0];
  [v49 setActive:1];

  id v53 = [(HKOnboardingSetupView *)self onboardingButton];
  v50 = [v53 bottomAnchor];
  v51 = [(HKOnboardingSetupView *)self bottomAnchor];
  v52 = [v50 constraintEqualToAnchor:v51 constant:-16.0];
  [v52 setActive:1];
}

- (void)_didTapOnboardingButton
{
  id v3 = [(HKOnboardingSetupView *)self delegate];
  [v3 beginOnboardingForOnboardingSetupView:self];
}

- (HKOnboardingSetupViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKOnboardingSetupViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
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

- (UIButton)onboardingButton
{
  return self->_onboardingButton;
}

- (void)setOnboardingButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onboardingButton, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_heroView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id)createHeroView
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_9();
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  return v2;
}

- (NSString)titleString
{
  return (NSString *)&stru_1F3B9CF20;
}

- (NSString)bodyString
{
  return (NSString *)&stru_1F3B9CF20;
}

- (NSString)buttonTitleString
{
  return (NSString *)&stru_1F3B9CF20;
}

- (int64_t)accessibilityGroupID
{
  return 0;
}

@end