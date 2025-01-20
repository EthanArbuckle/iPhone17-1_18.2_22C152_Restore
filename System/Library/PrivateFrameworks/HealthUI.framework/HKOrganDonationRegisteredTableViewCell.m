@interface HKOrganDonationRegisteredTableViewCell
+ (NSString)defaultReuseIdentifier;
- (HKOrganDonationRegisteredTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)introLabel;
- (UILabel)registrarLabel;
- (void)setIntroLabel:(id)a3;
- (void)setRegistrarLabel:(id)a3;
- (void)setupConstraints;
- (void)setupSubviews;
@end

@implementation HKOrganDonationRegisteredTableViewCell

+ (NSString)defaultReuseIdentifier
{
  return (NSString *)@"HKOrganDonationRegisteredTableViewCell";
}

- (HKOrganDonationRegisteredTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HKOrganDonationRegisteredTableViewCell;
  v4 = [(HKOrganDonationRegisteredTableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(HKOrganDonationRegisteredTableViewCell *)v4 setupSubviews];
    [(HKOrganDonationRegisteredTableViewCell *)v5 setupConstraints];
  }
  return v5;
}

- (void)setupSubviews
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(HKOrganDonationRegisteredTableViewCell *)self setIntroLabel:v3];

  v4 = [(HKOrganDonationRegisteredTableViewCell *)self introLabel];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = [(HKOrganDonationRegisteredTableViewCell *)self introLabel];
  [v5 setNumberOfLines:0];

  v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  objc_super v7 = [(HKOrganDonationRegisteredTableViewCell *)self introLabel];
  [v7 setFont:v6];

  v8 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v9 = [(HKOrganDonationRegisteredTableViewCell *)self introLabel];
  [v9 setTextColor:v8];

  v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v11 = [v10 localizedStringForKey:@"OD_REGISTERED_WITH" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v12 = [(HKOrganDonationRegisteredTableViewCell *)self introLabel];
  [v12 setText:v11];

  v13 = [(HKOrganDonationRegisteredTableViewCell *)self contentView];
  v14 = [(HKOrganDonationRegisteredTableViewCell *)self introLabel];
  [v13 addSubview:v14];

  id v15 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(HKOrganDonationRegisteredTableViewCell *)self setRegistrarLabel:v15];

  v16 = [(HKOrganDonationRegisteredTableViewCell *)self registrarLabel];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

  v17 = [(HKOrganDonationRegisteredTableViewCell *)self registrarLabel];
  [v17 setNumberOfLines:0];

  v18 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  v19 = [(HKOrganDonationRegisteredTableViewCell *)self registrarLabel];
  [v19 setFont:v18];

  v20 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v21 = [v20 localizedStringForKey:@"OD_REGISTRAR_DONATE_LIFE_AMERICA" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v22 = [(HKOrganDonationRegisteredTableViewCell *)self registrarLabel];
  [v22 setText:v21];

  id v24 = [(HKOrganDonationRegisteredTableViewCell *)self contentView];
  v23 = [(HKOrganDonationRegisteredTableViewCell *)self registrarLabel];
  [v24 addSubview:v23];
}

- (void)setupConstraints
{
  id v3 = [(HKOrganDonationRegisteredTableViewCell *)self introLabel];
  v4 = [v3 firstBaselineAnchor];
  v5 = [(HKOrganDonationRegisteredTableViewCell *)self contentView];
  v6 = [v5 topAnchor];
  objc_super v7 = [(HKOrganDonationRegisteredTableViewCell *)self introLabel];
  v8 = [v7 font];
  [v8 _scaledValueForValue:22.0];
  v9 = objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6);
  [v9 setActive:1];

  v10 = [(HKOrganDonationRegisteredTableViewCell *)self introLabel];
  v11 = [v10 leadingAnchor];
  v12 = [(HKOrganDonationRegisteredTableViewCell *)self contentView];
  v13 = [v12 leadingAnchor];
  v14 = [v11 constraintEqualToAnchor:v13 constant:16.0];
  [v14 setActive:1];

  id v15 = [(HKOrganDonationRegisteredTableViewCell *)self contentView];
  v16 = [v15 trailingAnchor];
  v17 = [(HKOrganDonationRegisteredTableViewCell *)self introLabel];
  v18 = [v17 trailingAnchor];
  v19 = [v16 constraintEqualToAnchor:v18 constant:16.0];
  [v19 setActive:1];

  v20 = [(HKOrganDonationRegisteredTableViewCell *)self registrarLabel];
  v21 = [v20 firstBaselineAnchor];
  v22 = [(HKOrganDonationRegisteredTableViewCell *)self introLabel];
  v23 = [v22 lastBaselineAnchor];
  id v24 = [(HKOrganDonationRegisteredTableViewCell *)self registrarLabel];
  v25 = [v24 font];
  [v25 _scaledValueForValue:27.0];
  v26 = objc_msgSend(v21, "constraintEqualToAnchor:constant:", v23);
  [v26 setActive:1];

  v27 = [(HKOrganDonationRegisteredTableViewCell *)self registrarLabel];
  v28 = [v27 leadingAnchor];
  v29 = [(HKOrganDonationRegisteredTableViewCell *)self contentView];
  v30 = [v29 leadingAnchor];
  v31 = [v28 constraintEqualToAnchor:v30 constant:16.0];
  [v31 setActive:1];

  v32 = [(HKOrganDonationRegisteredTableViewCell *)self contentView];
  v33 = [v32 trailingAnchor];
  v34 = [(HKOrganDonationRegisteredTableViewCell *)self registrarLabel];
  v35 = [v34 trailingAnchor];
  v36 = [v33 constraintEqualToAnchor:v35 constant:16.0];
  [v36 setActive:1];

  id v41 = [(HKOrganDonationRegisteredTableViewCell *)self contentView];
  v37 = [v41 bottomAnchor];
  v38 = [(HKOrganDonationRegisteredTableViewCell *)self registrarLabel];
  v39 = [v38 lastBaselineAnchor];
  v40 = [v37 constraintEqualToAnchor:v39 constant:48.0];
  [v40 setActive:1];
}

- (UILabel)introLabel
{
  return self->_introLabel;
}

- (void)setIntroLabel:(id)a3
{
}

- (UILabel)registrarLabel
{
  return self->_registrarLabel;
}

- (void)setRegistrarLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrarLabel, 0);
  objc_storeStrong((id *)&self->_introLabel, 0);
}

@end