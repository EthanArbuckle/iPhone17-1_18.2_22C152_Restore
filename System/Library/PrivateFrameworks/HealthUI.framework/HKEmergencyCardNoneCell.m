@interface HKEmergencyCardNoneCell
- (HKEmergencyCardNoneCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setUpConstraints;
- (void)setUpViews;
@end

@implementation HKEmergencyCardNoneCell

- (HKEmergencyCardNoneCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HKEmergencyCardNoneCell;
  v4 = [(HKEmergencyCardNoneCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(HKEmergencyCardNoneCell *)v4 setUpViews];
    [(HKEmergencyCardNoneCell *)v5 setUpConstraints];
  }
  return v5;
}

- (void)setUpViews
{
  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  noneLabel = self->_noneLabel;
  self->_noneLabel = v3;

  [(UILabel *)self->_noneLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_noneLabel setAdjustsFontForContentSizeCategory:1];
  [(UILabel *)self->_noneLabel setNumberOfLines:2];
  v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(UILabel *)self->_noneLabel setFont:v5];

  v6 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)self->_noneLabel setTextColor:v6];

  objc_super v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v8 = [v7 localizedStringForKey:@"EMERGENCY_CONTACT_NONE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [(UILabel *)self->_noneLabel setText:v8];

  id v9 = [(HKEmergencyCardNoneCell *)self contentView];
  [v9 addSubview:self->_noneLabel];
}

- (void)setUpConstraints
{
  v23[4] = *MEMORY[0x1E4F143B8];
  v15 = (void *)MEMORY[0x1E4F28DC8];
  v21 = [(UILabel *)self->_noneLabel topAnchor];
  v22 = [(HKEmergencyCardNoneCell *)self contentView];
  v20 = [v22 layoutMarginsGuide];
  v19 = [v20 topAnchor];
  v18 = [v21 constraintEqualToAnchor:v19];
  v23[0] = v18;
  v16 = [(UILabel *)self->_noneLabel leadingAnchor];
  v17 = [(HKEmergencyCardNoneCell *)self contentView];
  v14 = [v17 leadingAnchor];
  v13 = [v16 constraintEqualToAnchor:v14 constant:16.0];
  v23[1] = v13;
  v3 = [(HKEmergencyCardNoneCell *)self contentView];
  v4 = [v3 trailingAnchor];
  v5 = [(UILabel *)self->_noneLabel trailingAnchor];
  v6 = [v4 constraintEqualToAnchor:v5 constant:16.0];
  v23[2] = v6;
  objc_super v7 = [(HKEmergencyCardNoneCell *)self contentView];
  v8 = [v7 layoutMarginsGuide];
  id v9 = [v8 bottomAnchor];
  v10 = [(UILabel *)self->_noneLabel bottomAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v23[3] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
  [v15 activateConstraints:v12];
}

- (void).cxx_destruct
{
}

@end