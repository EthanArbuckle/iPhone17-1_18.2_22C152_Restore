@interface HKElectrocardiogramInfoView
- (HKElectrocardiogramInfoView)initWithFrame:(CGRect)a3;
- (NSLayoutConstraint)heartImageViewHeightConstraint;
- (NSLayoutConstraint)heartRateFirstBaselineConstraint;
- (NSLayoutConstraint)heartRateLabelLeadingConstraint;
- (NSString)bodyText;
- (NSString)heartRateText;
- (UILabel)bodyLabel;
- (UILabel)heartRateLabel;
- (id)_bodyView;
- (id)_heartRateView;
- (id)suffixForElementWithString:(id)a3;
- (void)_addSubviews;
- (void)setBodyLabel:(id)a3;
- (void)setBodyText:(id)a3;
- (void)setHeartImageViewHeightConstraint:(id)a3;
- (void)setHeartRateFirstBaselineConstraint:(id)a3;
- (void)setHeartRateLabel:(id)a3;
- (void)setHeartRateLabelLeadingConstraint:(id)a3;
- (void)setHeartRateText:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
@end

@implementation HKElectrocardiogramInfoView

- (HKElectrocardiogramInfoView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)HKElectrocardiogramInfoView;
  v3 = -[HKElectrocardiogramInfoView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4FB1930], "_hkecg_heartRateLabel");
    heartRateLabel = v3->_heartRateLabel;
    v3->_heartRateLabel = (UILabel *)v4;

    v6 = NSString;
    v7 = [(HKElectrocardiogramInfoView *)v3 suffixForElementWithString:@"AvgHR"];
    v8 = [v6 healthAccessibilityIdentifier:1 suffix:v7];
    [(UILabel *)v3->_heartRateLabel setAccessibilityIdentifier:v8];

    uint64_t v9 = objc_msgSend(MEMORY[0x1E4FB1930], "_hkecg_bodyLabel");
    bodyLabel = v3->_bodyLabel;
    v3->_bodyLabel = (UILabel *)v9;

    v11 = NSString;
    v12 = [(HKElectrocardiogramInfoView *)v3 suffixForElementWithString:@"Classification.Description"];
    v13 = [v11 healthAccessibilityIdentifier:1 suffix:v12];
    [(UILabel *)v3->_bodyLabel setAccessibilityIdentifier:v13];

    [(HKElectrocardiogramInfoView *)v3 _addSubviews];
  }
  return v3;
}

- (id)suffixForElementWithString:(id)a3
{
  return (id)[@"SessionDetails" stringByAppendingFormat:@".%@", a3];
}

- (NSString)heartRateText
{
  v2 = [(HKElectrocardiogramInfoView *)self heartRateLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setHeartRateText:(id)a3
{
  id v4 = a3;
  v5 = [(HKElectrocardiogramInfoView *)self heartRateLabel];
  [v5 setText:v4];

  id v7 = [(HKElectrocardiogramInfoView *)self arrangedSubviews];
  v6 = [v7 objectAtIndexedSubscript:0];
  [v6 setHidden:v4 == 0];
}

- (NSString)bodyText
{
  v2 = [(HKElectrocardiogramInfoView *)self bodyLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setBodyText:(id)a3
{
  id v4 = a3;
  v5 = [(HKElectrocardiogramInfoView *)self bodyLabel];
  [v5 setText:v4];

  id v7 = [(HKElectrocardiogramInfoView *)self arrangedSubviews];
  v6 = [v7 objectAtIndexedSubscript:1];
  [v6 setHidden:v4 == 0];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKElectrocardiogramInfoView;
  [(HKElectrocardiogramInfoView *)&v4 traitCollectionDidChange:a3];
  [(HKElectrocardiogramInfoView *)self setNeedsUpdateConstraints];
}

- (void)updateConstraints
{
  id v3 = objc_alloc(MEMORY[0x1E4FB17A8]);
  uint64_t v4 = *MEMORY[0x1E4FB28C8];
  v5 = (void *)[v3 initForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v5 scaledValueForValue:10.0];
  double v7 = v6;
  v8 = [(HKElectrocardiogramInfoView *)self heartRateLabelLeadingConstraint];
  [v8 setConstant:v7];

  uint64_t v9 = [(HKElectrocardiogramInfoView *)self heartRateFirstBaselineConstraint];

  if (v9)
  {
    [v5 scaledValueForValue:40.0];
    double v11 = v10;
    v12 = [(HKElectrocardiogramInfoView *)self heartRateFirstBaselineConstraint];
    [v12 setConstant:v11];
  }
  v13 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", v4);
  [v13 lineHeight];
  double v15 = v14;
  v16 = [(HKElectrocardiogramInfoView *)self heartImageViewHeightConstraint];
  [v16 setConstant:v15];

  v17.receiver = self;
  v17.super_class = (Class)HKElectrocardiogramInfoView;
  [(HKElectrocardiogramInfoView *)&v17 updateConstraints];
}

- (void)_addSubviews
{
  [(HKElectrocardiogramInfoView *)self setAxis:1];
  [(HKElectrocardiogramInfoView *)self setDistribution:0];
  [(HKElectrocardiogramInfoView *)self setAlignment:0];
  id v3 = [(HKElectrocardiogramInfoView *)self _heartRateView];
  [(HKElectrocardiogramInfoView *)self addArrangedSubview:v3];

  id v4 = [(HKElectrocardiogramInfoView *)self _bodyView];
  [(HKElectrocardiogramInfoView *)self addArrangedSubview:v4];
}

- (id)_heartRateView
{
  v48[8] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", *MEMORY[0x1E4FB28C8]);
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1838]);
  v46 = v4;
  double v6 = [MEMORY[0x1E4FB1830] configurationWithFont:v4];
  [v5 setPreferredSymbolConfiguration:v6];

  double v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"heart.fill"];
  [v5 setImage:v7];

  [v5 setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  v47 = +[HKDisplayCategory categoryWithID:11];
  v8 = [v47 color];
  [v5 setTintColor:v8];

  [v3 addSubview:v5];
  LODWORD(v9) = 1148846080;
  [v5 setContentCompressionResistancePriority:0 forAxis:v9];
  double v10 = [(HKElectrocardiogramInfoView *)self heartRateLabel];
  [v3 addSubview:v10];

  double v11 = [(HKElectrocardiogramInfoView *)self heartRateLabel];
  v12 = [v11 leadingAnchor];
  v13 = [v5 trailingAnchor];
  double v14 = [v12 constraintEqualToAnchor:v13];
  [(HKElectrocardiogramInfoView *)self setHeartRateLabelLeadingConstraint:v14];

  double v15 = [(HKElectrocardiogramInfoView *)self heartRateLabel];
  v16 = [v15 firstBaselineAnchor];
  objc_super v17 = [v3 topAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  [(HKElectrocardiogramInfoView *)self setHeartRateFirstBaselineConstraint:v18];

  v19 = [v5 heightAnchor];
  [v4 lineHeight];
  v20 = objc_msgSend(v19, "constraintEqualToConstant:");
  [(HKElectrocardiogramInfoView *)self setHeartImageViewHeightConstraint:v20];

  v36 = (void *)MEMORY[0x1E4F28DC8];
  v45 = [(HKElectrocardiogramInfoView *)self heartRateFirstBaselineConstraint];
  v48[0] = v45;
  v44 = [(HKElectrocardiogramInfoView *)self heartImageViewHeightConstraint];
  v48[1] = v44;
  v42 = [v5 centerYAnchor];
  v43 = [(HKElectrocardiogramInfoView *)self heartRateLabel];
  v41 = [v43 centerYAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v48[2] = v40;
  v21 = v3;
  v38 = [v3 bottomAnchor];
  v39 = [(HKElectrocardiogramInfoView *)self heartRateLabel];
  v37 = [v39 bottomAnchor];
  v35 = [v38 constraintEqualToAnchor:v37 constant:10.0];
  v48[3] = v35;
  v34 = [v5 leadingAnchor];
  v33 = [v3 leadingAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v48[4] = v32;
  v31 = [v5 widthAnchor];
  v22 = [v5 heightAnchor];
  v23 = [v31 constraintEqualToAnchor:v22];
  v48[5] = v23;
  v24 = [(HKElectrocardiogramInfoView *)self heartRateLabelLeadingConstraint];
  v48[6] = v24;
  v25 = [v21 trailingAnchor];
  v26 = [(HKElectrocardiogramInfoView *)self heartRateLabel];
  v27 = [v26 trailingAnchor];
  v28 = [v25 constraintEqualToAnchor:v27];
  v48[7] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:8];
  [v36 activateConstraints:v29];

  [v21 setHidden:1];
  return v21;
}

- (id)_bodyView
{
  v35[7] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = +[HKSeparatorLineView _hkecg_separatorView];
  objc_msgSend(v3, "addSubview:");
  id v5 = [(HKElectrocardiogramInfoView *)self bodyLabel];
  [v3 addSubview:v5];

  v22 = (void *)MEMORY[0x1E4F28DC8];
  v34 = [v3 topAnchor];
  v33 = [v4 topAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v35[0] = v32;
  v31 = [(HKElectrocardiogramInfoView *)self bodyLabel];
  v30 = [v31 topAnchor];
  v27 = v4;
  v29 = [v4 bottomAnchor];
  v28 = [v30 constraintEqualToAnchor:v29 constant:10.0];
  v35[1] = v28;
  v25 = [v3 bottomAnchor];
  v26 = [(HKElectrocardiogramInfoView *)self bodyLabel];
  v24 = [v26 bottomAnchor];
  v23 = [v25 constraintEqualToAnchor:v24 constant:10.0];
  v35[2] = v23;
  v21 = [v3 leadingAnchor];
  v20 = [v4 leadingAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v35[3] = v19;
  v18 = [v4 trailingAnchor];
  objc_super v17 = [v3 trailingAnchor];
  v16 = [v18 constraintEqualToAnchor:v17];
  v35[4] = v16;
  double v6 = [v3 leadingAnchor];
  double v7 = [(HKElectrocardiogramInfoView *)self bodyLabel];
  v8 = [v7 leadingAnchor];
  double v9 = [v6 constraintEqualToAnchor:v8];
  v35[5] = v9;
  double v10 = [v3 trailingAnchor];
  double v11 = [(HKElectrocardiogramInfoView *)self bodyLabel];
  v12 = [v11 trailingAnchor];
  v13 = [v10 constraintGreaterThanOrEqualToAnchor:v12];
  v35[6] = v13;
  double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:7];
  [v22 activateConstraints:v14];

  [v3 setHidden:1];
  return v3;
}

- (UILabel)heartRateLabel
{
  return self->_heartRateLabel;
}

- (void)setHeartRateLabel:(id)a3
{
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void)setBodyLabel:(id)a3
{
}

- (NSLayoutConstraint)heartRateLabelLeadingConstraint
{
  return self->_heartRateLabelLeadingConstraint;
}

- (void)setHeartRateLabelLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)heartRateFirstBaselineConstraint
{
  return self->_heartRateFirstBaselineConstraint;
}

- (void)setHeartRateFirstBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)heartImageViewHeightConstraint
{
  return self->_heartImageViewHeightConstraint;
}

- (void)setHeartImageViewHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartImageViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_heartRateFirstBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_heartRateLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_heartRateLabel, 0);
}

@end