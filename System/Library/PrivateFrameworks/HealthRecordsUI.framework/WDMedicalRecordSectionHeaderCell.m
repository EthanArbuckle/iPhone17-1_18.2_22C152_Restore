@interface WDMedicalRecordSectionHeaderCell
+ (double)_titleLabelLastBaselineToBottom;
+ (double)_titleLabelTopToFirstBaseline;
+ (id)_titleLabelFont;
- (NSString)title;
- (UILabel)titleLabel;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setupSubviews;
@end

@implementation WDMedicalRecordSectionHeaderCell

- (void)setupSubviews
{
  v33.receiver = self;
  v33.super_class = (Class)WDMedicalRecordSectionHeaderCell;
  [(WDMedicalRecordGroupableCell *)&v33 setupSubviews];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(WDMedicalRecordSectionHeaderCell *)self setTitleLabel:v3];

  v4 = [(id)objc_opt_class() _titleLabelFont];
  v5 = [(WDMedicalRecordSectionHeaderCell *)self titleLabel];
  [v5 setFont:v4];

  v6 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v7 = [(WDMedicalRecordSectionHeaderCell *)self titleLabel];
  [v7 setTextColor:v6];

  v8 = [(WDMedicalRecordSectionHeaderCell *)self titleLabel];
  [v8 setNumberOfLines:1];

  v9 = [(WDMedicalRecordSectionHeaderCell *)self titleLabel];
  [v9 setLineBreakMode:5];

  v10 = [(WDMedicalRecordSectionHeaderCell *)self titleLabel];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  v11 = [(WDMedicalRecordSectionHeaderCell *)self contentView];
  v12 = [(WDMedicalRecordSectionHeaderCell *)self titleLabel];
  [v11 addSubview:v12];

  -[WDMedicalRecordSectionHeaderCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, 0.0, 0.0, 0.0);
  v13 = [(WDMedicalRecordSectionHeaderCell *)self titleLabel];
  v14 = [v13 leadingAnchor];
  v15 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v16 = [v15 leadingAnchor];
  v17 = [v14 constraintEqualToAnchor:v16 constant:16.0];
  [v17 setActive:1];

  v18 = [(WDMedicalRecordSectionHeaderCell *)self titleLabel];
  v19 = [v18 trailingAnchor];
  v20 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v21 = [v20 trailingAnchor];
  v22 = [v19 constraintEqualToAnchor:v21 constant:-16.0];
  [v22 setActive:1];

  v23 = [(WDMedicalRecordSectionHeaderCell *)self titleLabel];
  v24 = [v23 firstBaselineAnchor];
  v25 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v26 = [v25 topAnchor];
  [(id)objc_opt_class() _titleLabelTopToFirstBaseline];
  v27 = objc_msgSend(v24, "constraintEqualToAnchor:constant:", v26);
  [v27 setActive:1];

  v28 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v29 = [v28 bottomAnchor];
  v30 = [(WDMedicalRecordSectionHeaderCell *)self titleLabel];
  v31 = [v30 lastBaselineAnchor];
  [(id)objc_opt_class() _titleLabelLastBaselineToBottom];
  v32 = objc_msgSend(v29, "constraintEqualToAnchor:constant:", v31);
  [v32 setActive:1];

  [(WDMedicalRecordGroupableCell *)self setSeparatorDashStyle:0 hidden:0];
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(WDMedicalRecordSectionHeaderCell *)self titleLabel];
  [v5 setText:v4];
}

- (NSString)title
{
  v2 = [(WDMedicalRecordSectionHeaderCell *)self titleLabel];
  id v3 = [v2 text];

  return (NSString *)v3;
}

+ (id)_titleLabelFont
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
}

+ (double)_titleLabelTopToFirstBaseline
{
  v2 = [(id)objc_opt_class() _titleLabelFont];
  [v2 _scaledValueForValue:24.0];
  double v4 = v3;

  return v4;
}

+ (double)_titleLabelLastBaselineToBottom
{
  v2 = [(id)objc_opt_class() _titleLabelFont];
  [v2 _scaledValueForValue:10.0];
  double v4 = v3;

  return v4;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end