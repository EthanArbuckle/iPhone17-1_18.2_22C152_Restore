@interface HUAccessoryButtonTableViewHeaderView
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (HFItemSection)itemSection;
- (HUAccessoryButtonTableViewHeaderView)initWithReuseIdentifier:(id)a3;
- (NSString)overrideAccessoryButtonTitle;
- (UIButton)accessoryButton;
- (UIFont)accessoryButtonFont;
- (id)defaultAccessoryButtonFont;
- (void)accessoryButtonPressed;
- (void)prepareForReuse;
- (void)setAccessoryButton:(id)a3;
- (void)setAccessoryButtonFont:(id)a3;
- (void)setItemSection:(id)a3;
- (void)setOverrideAccessoryButtonTitle:(id)a3;
- (void)updateConstraints;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUAccessoryButtonTableViewHeaderView

- (HUAccessoryButtonTableViewHeaderView)initWithReuseIdentifier:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)HUAccessoryButtonTableViewHeaderView;
  v3 = [(HUAccessoryButtonTableViewHeaderView *)&v13 initWithReuseIdentifier:a3];
  v4 = v3;
  if (v3)
  {
    [(HUAccessoryButtonTableViewHeaderView *)v3 setItemSection:0];
    [(HUAccessoryButtonTableViewHeaderView *)v4 setOverrideAccessoryButtonTitle:0];
    v5 = [(HUAccessoryButtonTableViewHeaderView *)v4 defaultAccessoryButtonFont];
    [(HUAccessoryButtonTableViewHeaderView *)v4 setAccessoryButtonFont:v5];

    v6 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
    [(HUAccessoryButtonTableViewHeaderView *)v4 setTintColor:v6];

    [(HUAccessoryButtonTableViewHeaderView *)v4 setNeedsUpdateConstraints];
    v7 = [MEMORY[0x1E4F427E0] buttonWithType:1];
    [(HUAccessoryButtonTableViewHeaderView *)v4 setAccessoryButton:v7];

    v8 = [(HUAccessoryButtonTableViewHeaderView *)v4 accessoryButton];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

    v9 = [(HUAccessoryButtonTableViewHeaderView *)v4 accessoryButton];
    [v9 addTarget:v4 action:sel_accessoryButtonPressed forControlEvents:64];

    v10 = [(HUAccessoryButtonTableViewHeaderView *)v4 contentView];
    v11 = [(HUAccessoryButtonTableViewHeaderView *)v4 accessoryButton];
    [v10 addSubview:v11];

    [(HUAccessoryButtonTableViewHeaderView *)v4 updateUIWithAnimation:0];
  }
  return v4;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)HUAccessoryButtonTableViewHeaderView;
  [(HUAccessoryButtonTableViewHeaderView *)&v3 prepareForReuse];
  [(HUAccessoryButtonTableViewHeaderView *)self setItemSection:0];
}

- (void)updateConstraints
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)HUAccessoryButtonTableViewHeaderView;
  [(HUAccessoryButtonTableViewHeaderView *)&v16 updateConstraints];
  objc_super v13 = (void *)MEMORY[0x1E4F28DC8];
  v15 = [(HUAccessoryButtonTableViewHeaderView *)self contentView];
  v14 = [v15 bottomAnchor];
  objc_super v3 = [(HUAccessoryButtonTableViewHeaderView *)self accessoryButton];
  v4 = [v3 bottomAnchor];
  v5 = [v14 constraintEqualToAnchor:v4];
  v17[0] = v5;
  v6 = [(HUAccessoryButtonTableViewHeaderView *)self contentView];
  v7 = [v6 layoutMarginsGuide];
  v8 = [v7 trailingAnchor];
  v9 = [(HUAccessoryButtonTableViewHeaderView *)self accessoryButton];
  v10 = [v9 trailingAnchor];
  v11 = [v8 constraintEqualToSystemSpacingAfterAnchor:v10 multiplier:1.0];
  v17[1] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  [v13 activateConstraints:v12];
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  v15.receiver = self;
  v15.super_class = (Class)HUAccessoryButtonTableViewHeaderView;
  -[HUAccessoryButtonTableViewHeaderView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v15, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, a3.width, a3.height);
  double v7 = v6;
  double v9 = v8;
  v10 = objc_msgSend((id)objc_opt_class(), "_defaultFontForTableViewStyle:isSectionHeader:", -[HUAccessoryButtonTableViewHeaderView tableViewStyle](self, "tableViewStyle"), 1);
  [v10 _scaledValueForValue:40.0];
  double v12 = v9 + v11;

  double v13 = v7;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (id)defaultAccessoryButtonFont
{
  objc_super v3 = objc_opt_class();
  uint64_t v4 = [(HUAccessoryButtonTableViewHeaderView *)self tableViewStyle];

  return (id)[v3 _defaultFontForTableViewStyle:v4 isSectionHeader:1];
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  uint64_t v4 = [(HUAccessoryButtonTableViewHeaderView *)self itemSection];
  v5 = [v4 headerAccessoryButtonTitle];

  uint64_t v6 = [(HUAccessoryButtonTableViewHeaderView *)self overrideAccessoryButtonTitle];
  double v7 = (void *)v6;
  if (v6) {
    double v8 = (void *)v6;
  }
  else {
    double v8 = v5;
  }
  id v9 = v8;

  id v17 = [v9 localizedUppercaseString];

  v10 = [(HUAccessoryButtonTableViewHeaderView *)self accessoryButton];
  [v10 setTitle:v17 forState:0];

  double v11 = [(HUAccessoryButtonTableViewHeaderView *)self accessoryButton];
  double v12 = [v11 titleLabel];
  double v13 = [(HUAccessoryButtonTableViewHeaderView *)self accessoryButtonFont];
  [v12 setFont:v13];

  double v14 = [(HUAccessoryButtonTableViewHeaderView *)self accessoryButton];
  objc_super v15 = [(HUAccessoryButtonTableViewHeaderView *)self tintColor];
  [v14 setTitleColor:v15 forState:0];

  objc_super v16 = [(HUAccessoryButtonTableViewHeaderView *)self accessoryButton];
  [v16 setNeedsLayout];
}

- (void)accessoryButtonPressed
{
  objc_super v3 = [(HUAccessoryButtonTableViewHeaderView *)self itemSection];
  uint64_t v4 = [v3 headerAccessoryButtonDelegate];

  if (v4)
  {
    id v7 = [(HUAccessoryButtonTableViewHeaderView *)self itemSection];
    v5 = [v7 headerAccessoryButtonDelegate];
    uint64_t v6 = [(HUAccessoryButtonTableViewHeaderView *)self itemSection];
    [v5 itemSection:v6 accessoryButtonPressedInHeader:self];
  }
}

- (HFItemSection)itemSection
{
  return self->itemSection;
}

- (void)setItemSection:(id)a3
{
}

- (NSString)overrideAccessoryButtonTitle
{
  return self->_overrideAccessoryButtonTitle;
}

- (void)setOverrideAccessoryButtonTitle:(id)a3
{
}

- (UIFont)accessoryButtonFont
{
  return self->_accessoryButtonFont;
}

- (void)setAccessoryButtonFont:(id)a3
{
}

- (UIButton)accessoryButton
{
  return self->_accessoryButton;
}

- (void)setAccessoryButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryButton, 0);
  objc_storeStrong((id *)&self->_accessoryButtonFont, 0);
  objc_storeStrong((id *)&self->_overrideAccessoryButtonTitle, 0);

  objc_storeStrong((id *)&self->itemSection, 0);
}

@end