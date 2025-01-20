@interface HKMedicalIDCallToActionTableViewCell
+ (NSString)defaultReuseIdentifier;
- (HKMedicalIDCallToActionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIButton)actionButton;
- (UILabel)callToActionLabel;
- (void)setActionButton:(id)a3;
- (void)setCallToActionLabel:(id)a3;
- (void)setupConstraints;
- (void)setupSubviews;
@end

@implementation HKMedicalIDCallToActionTableViewCell

+ (NSString)defaultReuseIdentifier
{
  return (NSString *)@"HKMedicalIDCallToActionTableViewCellIdentifier";
}

- (HKMedicalIDCallToActionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HKMedicalIDCallToActionTableViewCell;
  v4 = [(HKMedicalIDCallToActionTableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(HKMedicalIDCallToActionTableViewCell *)v4 setupSubviews];
    [(HKMedicalIDCallToActionTableViewCell *)v5 setupConstraints];
  }
  return v5;
}

- (void)setupSubviews
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(HKMedicalIDCallToActionTableViewCell *)self setCallToActionLabel:v3];

  v4 = [(HKMedicalIDCallToActionTableViewCell *)self callToActionLabel];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = [(HKMedicalIDCallToActionTableViewCell *)self callToActionLabel];
  [v5 setNumberOfLines:0];

  v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  objc_super v7 = [(HKMedicalIDCallToActionTableViewCell *)self callToActionLabel];
  [v7 setFont:v6];

  v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v9 = [v8 localizedStringForKey:@"MEDICAL_ID_DESCRIPTION" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v10 = [(HKMedicalIDCallToActionTableViewCell *)self callToActionLabel];
  [v10 setText:v9];

  v11 = [(HKMedicalIDCallToActionTableViewCell *)self contentView];
  v12 = [(HKMedicalIDCallToActionTableViewCell *)self callToActionLabel];
  [v11 addSubview:v12];

  v13 = (void *)MEMORY[0x1E4FB14D0];
  v14 = HKHealthKeyColor();
  v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v16 = [v15 localizedStringForKey:@"CREATE_MEDICAL_ID" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v17 = objc_msgSend(v13, "hk_multiLineRoundRectButtonTintedWithColor:title:target:action:", v14, v16, 0, 0);
  [(HKMedicalIDCallToActionTableViewCell *)self setActionButton:v17];

  v18 = [(HKMedicalIDCallToActionTableViewCell *)self actionButton];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

  v19 = [(HKMedicalIDCallToActionTableViewCell *)self actionButton];
  v20 = [v19 titleLabel];
  [v20 setNumberOfLines:0];

  v21 = [(HKMedicalIDCallToActionTableViewCell *)self contentView];
  v22 = [(HKMedicalIDCallToActionTableViewCell *)self actionButton];
  [v21 addSubview:v22];

  [(HKMedicalIDCallToActionTableViewCell *)self setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (void)setupConstraints
{
  v46[7] = *MEMORY[0x1E4F143B8];
  v27 = (void *)MEMORY[0x1E4F28DC8];
  v45 = [(HKMedicalIDCallToActionTableViewCell *)self callToActionLabel];
  v43 = [v45 topAnchor];
  v44 = [(HKMedicalIDCallToActionTableViewCell *)self contentView];
  v42 = [v44 layoutMarginsGuide];
  v41 = [v42 topAnchor];
  v40 = [v43 constraintEqualToAnchor:v41];
  v46[0] = v40;
  v39 = [(HKMedicalIDCallToActionTableViewCell *)self callToActionLabel];
  v37 = [v39 leadingAnchor];
  v38 = [(HKMedicalIDCallToActionTableViewCell *)self contentView];
  v36 = [v38 layoutMarginsGuide];
  v35 = [v36 leadingAnchor];
  v34 = [v37 constraintEqualToAnchor:v35];
  v46[1] = v34;
  v33 = [(HKMedicalIDCallToActionTableViewCell *)self callToActionLabel];
  v31 = [v33 trailingAnchor];
  v32 = [(HKMedicalIDCallToActionTableViewCell *)self contentView];
  v30 = [v32 layoutMarginsGuide];
  v29 = [v30 trailingAnchor];
  v28 = [v31 constraintEqualToAnchor:v29];
  v46[2] = v28;
  v26 = [(HKMedicalIDCallToActionTableViewCell *)self callToActionLabel];
  v24 = [v26 bottomAnchor];
  v25 = [(HKMedicalIDCallToActionTableViewCell *)self actionButton];
  v23 = [v25 topAnchor];
  v22 = [v24 constraintEqualToAnchor:v23 constant:-22.0];
  v46[3] = v22;
  v21 = [(HKMedicalIDCallToActionTableViewCell *)self actionButton];
  v19 = [v21 leadingAnchor];
  v20 = [(HKMedicalIDCallToActionTableViewCell *)self contentView];
  v18 = [v20 layoutMarginsGuide];
  v17 = [v18 leadingAnchor];
  v16 = [v19 constraintEqualToAnchor:v17];
  v46[4] = v16;
  v15 = [(HKMedicalIDCallToActionTableViewCell *)self actionButton];
  v13 = [v15 trailingAnchor];
  v14 = [(HKMedicalIDCallToActionTableViewCell *)self contentView];
  id v3 = [v14 layoutMarginsGuide];
  v4 = [v3 trailingAnchor];
  v5 = [v13 constraintEqualToAnchor:v4];
  v46[5] = v5;
  v6 = [(HKMedicalIDCallToActionTableViewCell *)self actionButton];
  objc_super v7 = [v6 bottomAnchor];
  v8 = [(HKMedicalIDCallToActionTableViewCell *)self contentView];
  v9 = [v8 layoutMarginsGuide];
  v10 = [v9 bottomAnchor];
  v11 = [v7 constraintEqualToAnchor:v10];
  v46[6] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:7];
  [v27 activateConstraints:v12];
}

- (UILabel)callToActionLabel
{
  return self->_callToActionLabel;
}

- (void)setCallToActionLabel:(id)a3
{
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_callToActionLabel, 0);
}

@end