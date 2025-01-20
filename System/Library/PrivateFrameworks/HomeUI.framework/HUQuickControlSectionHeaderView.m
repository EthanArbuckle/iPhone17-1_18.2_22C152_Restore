@interface HUQuickControlSectionHeaderView
+ (BOOL)requiresConstraintBasedLayout;
+ (double)estimatedHeight;
+ (id)_titleFont;
- (BOOL)hideAccessoryButton;
- (BOOL)hideHeaderText;
- (BOOL)hideSeparator;
- (HFItemSection)itemSection;
- (HFItemSectionAccessoryButtonHeaderDelegate)accessoryButtonTarget;
- (HUQuickControlSectionHeaderView)initWithFrame:(CGRect)a3;
- (NSArray)accessoryButtonConstraints;
- (NSArray)labelConstraints;
- (NSAttributedString)attributedTitleText;
- (NSString)accessoryButtonTitleText;
- (NSString)titleText;
- (UIButton)accessoryButton;
- (UILabel)titleLabel;
- (void)accessoryButtonTapped;
- (void)drawRect:(CGRect)a3;
- (void)prepareForReuse;
- (void)setAccessoryButton:(id)a3;
- (void)setAccessoryButtonConstraints:(id)a3;
- (void)setAccessoryButtonTarget:(id)a3;
- (void)setAccessoryButtonTitleText:(id)a3;
- (void)setAttributedTitleText:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHideAccessoryButton:(BOOL)a3;
- (void)setHideHeaderText:(BOOL)a3;
- (void)setHideSeparator:(BOOL)a3;
- (void)setItemSection:(id)a3;
- (void)setLabelConstraints:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleText:(id)a3;
- (void)updateConstraints;
- (void)updateUIForReachabilityState:(unint64_t)a3;
@end

@implementation HUQuickControlSectionHeaderView

+ (id)_titleFont
{
  return (id)[MEMORY[0x1E4F6A420] preferredFontForTextStyle:*MEMORY[0x1E4F438A0] traits:32770];
}

+ (double)estimatedHeight
{
  v2 = [a1 _titleFont];
  [v2 lineHeight];
  double v4 = v3 + 16.0;

  return v4;
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUQuickControlSectionHeaderView)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)HUQuickControlSectionHeaderView;
  double v3 = -[HUQuickControlSectionHeaderView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    titleText = v3->_titleText;
    v3->_titleText = (NSString *)&stru_1F18F92B8;

    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v6;

    v8 = [(id)objc_opt_class() _titleFont];
    [(UILabel *)v4->_titleLabel setFont:v8];

    v9 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    [(UILabel *)v4->_titleLabel setTextColor:v9];

    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HUQuickControlSectionHeaderView *)v4 addSubview:v4->_titleLabel];
    uint64_t v10 = [MEMORY[0x1E4F427E0] buttonWithType:1];
    accessoryButton = v4->_accessoryButton;
    v4->_accessoryButton = (UIButton *)v10;

    [(UIButton *)v4->_accessoryButton addTarget:v4 action:sel_accessoryButtonTapped forEvents:64];
    if (([MEMORY[0x1E4F69758] shouldUseProxHandOffMaterials] & 1) == 0)
    {
      v12 = v4->_accessoryButton;
      v13 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
      [(UIButton *)v12 setTitleColor:v13 forState:0];
    }
    v14 = [MEMORY[0x1E4F42A30] _preferredFontForTextStyle:*MEMORY[0x1E4F438A0] variant:1024];
    v15 = [(UIButton *)v4->_accessoryButton titleLabel];
    [v15 setFont:v14];

    [(UIButton *)v4->_accessoryButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v16 = [(UIButton *)v4->_accessoryButton titleLabel];
    [v16 setTextAlignment:1];

    [(HUQuickControlSectionHeaderView *)v4 addSubview:v4->_accessoryButton];
    v4->_hideSeparator = 0;
    v17 = [MEMORY[0x1E4F428B8] clearColor];
    [(HUQuickControlSectionHeaderView *)v4 setBackgroundColor:v17];
  }
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  double width = a3.size.width;
  double y = a3.origin.y;
  if (![(HUQuickControlSectionHeaderView *)self hideSeparator])
  {
    objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRect:", 40.0, y, width + -80.0, 2.0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = [MEMORY[0x1E4F428B8] separatorColor];
    [v5 setFill];

    [v6 fill];
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)HUQuickControlSectionHeaderView;
  [(HUQuickControlSectionHeaderView *)&v3 prepareForReuse];
  [(HUQuickControlSectionHeaderView *)self setTitleText:&stru_1F18F92B8];
  self->_hideSeparator = 0;
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HUQuickControlSectionHeaderView *)self isHidden]
    && !v3
    && [(HUQuickControlSectionHeaderView *)self hideAccessoryButton])
  {
    v5 = [(HUQuickControlSectionHeaderView *)self accessoryButton];
    [v5 setHidden:1];
  }
  v6.receiver = self;
  v6.super_class = (Class)HUQuickControlSectionHeaderView;
  [(HUQuickControlSectionHeaderView *)&v6 setHidden:v3];
}

- (void)setHideSeparator:(BOOL)a3
{
  if (self->_hideSeparator != a3)
  {
    self->_hideSeparator = a3;
    [(HUQuickControlSectionHeaderView *)self setNeedsDisplay];
  }
}

- (void)updateConstraints
{
  BOOL v3 = [(HUQuickControlSectionHeaderView *)self labelConstraints];

  if (!v3)
  {
    double v4 = [MEMORY[0x1E4F1CA48] array];
    v5 = [(HUQuickControlSectionHeaderView *)self titleLabel];
    objc_super v6 = [v5 leadingAnchor];
    v7 = [(HUQuickControlSectionHeaderView *)self leadingAnchor];
    v8 = [v6 constraintEqualToAnchor:v7 constant:40.0];
    [v4 addObject:v8];

    v9 = [(HUQuickControlSectionHeaderView *)self titleLabel];
    uint64_t v10 = [v9 topAnchor];
    v11 = [(HUQuickControlSectionHeaderView *)self layoutMarginsGuide];
    v12 = [v11 topAnchor];
    v13 = [v10 constraintEqualToAnchor:v12];
    [v4 addObject:v13];

    v14 = [(HUQuickControlSectionHeaderView *)self titleLabel];
    v15 = [v14 bottomAnchor];
    v16 = [(HUQuickControlSectionHeaderView *)self layoutMarginsGuide];
    v17 = [v16 bottomAnchor];
    v18 = [v15 constraintEqualToAnchor:v17];
    [v4 addObject:v18];

    [(HUQuickControlSectionHeaderView *)self setLabelConstraints:v4];
  }
  objc_super v19 = (void *)MEMORY[0x1E4F28DC8];
  v20 = [(HUQuickControlSectionHeaderView *)self labelConstraints];
  [v19 activateConstraints:v20];

  v21 = [(HUQuickControlSectionHeaderView *)self accessoryButtonConstraints];

  if (!v21)
  {
    v22 = [MEMORY[0x1E4F1CA48] array];
    v23 = [(HUQuickControlSectionHeaderView *)self accessoryButton];
    v24 = [v23 topAnchor];
    v25 = [(HUQuickControlSectionHeaderView *)self layoutMarginsGuide];
    v26 = [v25 topAnchor];
    v27 = [v24 constraintEqualToAnchor:v26];
    [v22 addObject:v27];

    v28 = [(HUQuickControlSectionHeaderView *)self accessoryButton];
    v29 = [v28 bottomAnchor];
    v30 = [(HUQuickControlSectionHeaderView *)self layoutMarginsGuide];
    v31 = [v30 bottomAnchor];
    v32 = [v29 constraintEqualToAnchor:v31];
    [v22 addObject:v32];

    v33 = [(HUQuickControlSectionHeaderView *)self accessoryButton];
    v34 = [v33 trailingAnchor];
    v35 = [(HUQuickControlSectionHeaderView *)self trailingAnchor];
    v36 = [v34 constraintEqualToAnchor:v35 constant:-40.0];
    [v22 addObject:v36];

    [(HUQuickControlSectionHeaderView *)self setAccessoryButtonConstraints:v22];
  }
  v37 = (void *)MEMORY[0x1E4F28DC8];
  v38 = [(HUQuickControlSectionHeaderView *)self accessoryButtonConstraints];
  [v37 activateConstraints:v38];

  v39.receiver = self;
  v39.super_class = (Class)HUQuickControlSectionHeaderView;
  [(HUQuickControlSectionHeaderView *)&v39 updateConstraints];
}

- (void)setTitleText:(id)a3
{
  objc_storeStrong((id *)&self->_titleText, a3);
  id v5 = a3;
  objc_super v6 = [(HUQuickControlSectionHeaderView *)self titleLabel];
  [v6 setText:v5];

  id v7 = [(HUQuickControlSectionHeaderView *)self titleLabel];
  [v7 sizeToFit];
}

- (void)setAttributedTitleText:(id)a3
{
  objc_storeStrong((id *)&self->_attributedTitleText, a3);
  id v5 = a3;
  objc_super v6 = [(HUQuickControlSectionHeaderView *)self titleLabel];
  [v6 setAttributedText:v5];

  id v7 = [(HUQuickControlSectionHeaderView *)self titleLabel];
  [v7 sizeToFit];

  [(HUQuickControlSectionHeaderView *)self layoutIfNeeded];
}

- (void)setAccessoryButtonTitleText:(id)a3
{
  id v9 = a3;
  objc_storeStrong((id *)&self->_accessoryButtonTitleText, a3);
  id v5 = [(HUQuickControlSectionHeaderView *)self accessoryButton];
  [v5 setTitle:v9 forState:0];

  BOOL v6 = !v9
    || ![v9 length]
    || [(HUQuickControlSectionHeaderView *)self hideAccessoryButton];
  id v7 = [(HUQuickControlSectionHeaderView *)self accessoryButton];
  [v7 setHidden:v6];

  v8 = [(HUQuickControlSectionHeaderView *)self accessoryButton];
  [v8 sizeToFit];
}

- (void)setHideAccessoryButton:(BOOL)a3
{
  if (self->_hideAccessoryButton != a3)
  {
    BOOL v3 = a3;
    self->_hideAccessoryButton = a3;
    id v4 = [(HUQuickControlSectionHeaderView *)self accessoryButton];
    [v4 setHidden:v3];
  }
}

- (void)setHideHeaderText:(BOOL)a3
{
  if (self->_hideHeaderText != a3)
  {
    BOOL v3 = a3;
    self->_hideHeaderText = a3;
    id v4 = [(HUQuickControlSectionHeaderView *)self titleLabel];
    [v4 setHidden:v3];
  }
}

- (void)accessoryButtonTapped
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    BOOL v6 = [(HUQuickControlSectionHeaderView *)self accessoryButtonTarget];
    int v7 = 136315650;
    v8 = "-[HUQuickControlSectionHeaderView accessoryButtonTapped]";
    __int16 v9 = 2112;
    uint64_t v10 = self;
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_debug_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEBUG, "%s(%@) button target: %@", (uint8_t *)&v7, 0x20u);
  }
  id v4 = [(HUQuickControlSectionHeaderView *)self accessoryButtonTarget];
  id v5 = [(HUQuickControlSectionHeaderView *)self itemSection];
  [v4 itemSection:v5 accessoryButtonPressedInHeader:self];
}

- (void)updateUIForReachabilityState:(unint64_t)a3
{
  if (a3 >= 2)
  {
    if (a3 != 2) {
      return;
    }
    __int16 v9 = [(HUQuickControlSectionHeaderView *)self titleLabel];
    [v9 setAlpha:1.0];

    uint64_t v10 = [(HUQuickControlSectionHeaderView *)self accessoryButton];
    [v10 setAlpha:1.0];

    __int16 v11 = [(HUQuickControlSectionHeaderView *)self accessoryButton];
    [v11 setUserInteractionEnabled:1];

    if ([MEMORY[0x1E4F69758] shouldUseProxHandOffMaterials]) {
      return;
    }
    accessoryButton = self->_accessoryButton;
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
  }
  else
  {
    id v4 = [(HUQuickControlSectionHeaderView *)self titleLabel];
    [v4 setAlpha:0.5];

    id v5 = [(HUQuickControlSectionHeaderView *)self accessoryButton];
    [v5 setAlpha:0.5];

    BOOL v6 = [(HUQuickControlSectionHeaderView *)self accessoryButton];
    [v6 setUserInteractionEnabled:0];

    accessoryButton = self->_accessoryButton;
    uint64_t v8 = [MEMORY[0x1E4F428B8] systemGrayColor];
  }
  id v12 = (id)v8;
  -[UIButton setTitleColor:forState:](accessoryButton, "setTitleColor:forState:");
}

- (HFItemSection)itemSection
{
  return self->itemSection;
}

- (void)setItemSection:(id)a3
{
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSAttributedString)attributedTitleText
{
  return self->_attributedTitleText;
}

- (NSString)accessoryButtonTitleText
{
  return self->_accessoryButtonTitleText;
}

- (BOOL)hideSeparator
{
  return self->_hideSeparator;
}

- (BOOL)hideAccessoryButton
{
  return self->_hideAccessoryButton;
}

- (BOOL)hideHeaderText
{
  return self->_hideHeaderText;
}

- (HFItemSectionAccessoryButtonHeaderDelegate)accessoryButtonTarget
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryButtonTarget);

  return (HFItemSectionAccessoryButtonHeaderDelegate *)WeakRetained;
}

- (void)setAccessoryButtonTarget:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (NSArray)labelConstraints
{
  return self->_labelConstraints;
}

- (void)setLabelConstraints:(id)a3
{
}

- (UIButton)accessoryButton
{
  return self->_accessoryButton;
}

- (void)setAccessoryButton:(id)a3
{
}

- (NSArray)accessoryButtonConstraints
{
  return self->_accessoryButtonConstraints;
}

- (void)setAccessoryButtonConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryButtonConstraints, 0);
  objc_storeStrong((id *)&self->_accessoryButton, 0);
  objc_storeStrong((id *)&self->_labelConstraints, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_accessoryButtonTarget);
  objc_storeStrong((id *)&self->_accessoryButtonTitleText, 0);
  objc_storeStrong((id *)&self->_attributedTitleText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);

  objc_storeStrong((id *)&self->itemSection, 0);
}

@end