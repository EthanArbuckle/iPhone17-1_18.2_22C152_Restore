@interface HKEmergencyCardSOSHeaderCell
- (HKEmergencyCardSOSHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)headerLabel;
- (void)_updateTextColor;
- (void)setHeaderLabel:(id)a3;
- (void)setupConstraints;
- (void)setupSubviews;
- (void)tintColorDidChange;
@end

@implementation HKEmergencyCardSOSHeaderCell

- (HKEmergencyCardSOSHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HKEmergencyCardSOSHeaderCell;
  v4 = [(HKEmergencyCardSOSHeaderCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(HKEmergencyCardSOSHeaderCell *)v4 setupSubviews];
    [(HKEmergencyCardSOSHeaderCell *)v5 setupConstraints];
  }
  return v5;
}

- (void)setupSubviews
{
  v3 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  [(HKEmergencyCardSOSHeaderCell *)self setBackgroundColor:v3];

  v4 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  v5 = [(HKEmergencyCardSOSHeaderCell *)self contentView];
  [v5 setBackgroundColor:v4];

  id v6 = objc_alloc(MEMORY[0x1E4FB1930]);
  objc_super v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(HKEmergencyCardSOSHeaderCell *)self setHeaderLabel:v7];

  v8 = [(HKEmergencyCardSOSHeaderCell *)self headerLabel];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v10 = [v9 localizedStringForKey:@"EMERGENCY_CONTACT_HEADER" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v11 = [(HKEmergencyCardSOSHeaderCell *)self headerLabel];
  [v11 setText:v10];

  v12 = (void *)MEMORY[0x1E4FB08E0];
  v13 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28F0] addingSymbolicTraits:0x8000 options:0];
  v14 = [v12 fontWithDescriptor:v13 size:0.0];
  v15 = [(HKEmergencyCardSOSHeaderCell *)self headerLabel];
  [v15 setFont:v14];

  [(HKEmergencyCardSOSHeaderCell *)self _updateTextColor];
  id v17 = [(HKEmergencyCardSOSHeaderCell *)self contentView];
  v16 = [(HKEmergencyCardSOSHeaderCell *)self headerLabel];
  [v17 addSubview:v16];
}

- (void)setupConstraints
{
  v3 = [(HKEmergencyCardSOSHeaderCell *)self headerLabel];
  v4 = [v3 topAnchor];
  v5 = [(HKEmergencyCardSOSHeaderCell *)self contentView];
  id v6 = [v5 topAnchor];
  objc_super v7 = [v4 constraintEqualToAnchor:v6 constant:30.0];
  [v7 setActive:1];

  v8 = [(HKEmergencyCardSOSHeaderCell *)self contentView];
  v9 = [v8 bottomAnchor];
  v10 = [(HKEmergencyCardSOSHeaderCell *)self headerLabel];
  v11 = [v10 bottomAnchor];
  v12 = [v9 constraintEqualToSystemSpacingBelowAnchor:v11 multiplier:1.0];
  [v12 setActive:1];

  v13 = [(HKEmergencyCardSOSHeaderCell *)self headerLabel];
  v14 = [v13 leftAnchor];
  v15 = [(HKEmergencyCardSOSHeaderCell *)self contentView];
  v16 = [v15 leftAnchor];
  id v17 = [v14 constraintEqualToSystemSpacingAfterAnchor:v16 multiplier:2.0];
  [v17 setActive:1];

  id v22 = [(HKEmergencyCardSOSHeaderCell *)self contentView];
  v18 = [v22 rightAnchor];
  v19 = [(HKEmergencyCardSOSHeaderCell *)self headerLabel];
  v20 = [v19 rightAnchor];
  v21 = [v18 constraintEqualToSystemSpacingAfterAnchor:v20 multiplier:1.0];
  [v21 setActive:1];
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)HKEmergencyCardSOSHeaderCell;
  [(HKEmergencyCardSOSHeaderCell *)&v3 tintColorDidChange];
  [(HKEmergencyCardSOSHeaderCell *)self _updateTextColor];
}

- (void)_updateTextColor
{
  id v4 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  objc_super v3 = [(HKEmergencyCardSOSHeaderCell *)self headerLabel];
  [v3 setTextColor:v4];
}

- (UILabel)headerLabel
{
  return self->_headerLabel;
}

- (void)setHeaderLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end