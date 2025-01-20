@interface WDMedicalRecordDetailSubtitleCell
+ (double)_subtitleLabelLastBaselineToBottom;
+ (double)_subtitleLabelTopToFirstBaseline;
+ (double)_titleLabelTopToFirstBaseline;
+ (id)_subtitleLabelFont;
+ (id)_titleLabelFont;
- (NSString)subtitle;
- (NSString)title;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setupSubviews;
@end

@implementation WDMedicalRecordDetailSubtitleCell

- (void)setupSubviews
{
  v56.receiver = self;
  v56.super_class = (Class)WDMedicalRecordDetailSubtitleCell;
  [(WDMedicalRecordGroupableCell *)&v56 setupSubviews];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(WDMedicalRecordDetailSubtitleCell *)self setTitleLabel:v3];

  v4 = [(id)objc_opt_class() _titleLabelFont];
  v5 = [(WDMedicalRecordDetailSubtitleCell *)self titleLabel];
  [v5 setFont:v4];

  v6 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v7 = [(WDMedicalRecordDetailSubtitleCell *)self titleLabel];
  [v7 setTextColor:v6];

  v8 = [(WDMedicalRecordDetailSubtitleCell *)self titleLabel];
  [v8 setNumberOfLines:0];

  v9 = [(WDMedicalRecordDetailSubtitleCell *)self titleLabel];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  v10 = [(WDMedicalRecordDetailSubtitleCell *)self contentView];
  v11 = [(WDMedicalRecordDetailSubtitleCell *)self titleLabel];
  [v10 addSubview:v11];

  id v12 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(WDMedicalRecordDetailSubtitleCell *)self setSubtitleLabel:v12];

  v13 = [(id)objc_opt_class() _subtitleLabelFont];
  v14 = [(WDMedicalRecordDetailSubtitleCell *)self subtitleLabel];
  [v14 setFont:v13];

  v15 = [MEMORY[0x1E4FB1618] labelColor];
  v16 = [(WDMedicalRecordDetailSubtitleCell *)self subtitleLabel];
  [v16 setTextColor:v15];

  v17 = [(WDMedicalRecordDetailSubtitleCell *)self subtitleLabel];
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

  v18 = [(WDMedicalRecordDetailSubtitleCell *)self subtitleLabel];
  [v18 setNumberOfLines:0];

  v19 = [(WDMedicalRecordDetailSubtitleCell *)self contentView];
  v20 = [(WDMedicalRecordDetailSubtitleCell *)self subtitleLabel];
  [v19 addSubview:v20];

  v21 = [(WDMedicalRecordDetailSubtitleCell *)self titleLabel];
  v22 = [v21 leadingAnchor];
  v23 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v24 = [v23 leadingAnchor];
  v25 = [v22 constraintEqualToAnchor:v24 constant:16.0];
  [v25 setActive:1];

  v26 = [(WDMedicalRecordDetailSubtitleCell *)self titleLabel];
  v27 = [v26 trailingAnchor];
  v28 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v29 = [v28 trailingAnchor];
  v30 = [v27 constraintEqualToAnchor:v29 constant:-16.0];
  [v30 setActive:1];

  v31 = [(WDMedicalRecordDetailSubtitleCell *)self titleLabel];
  v32 = [v31 firstBaselineAnchor];
  v33 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v34 = [v33 topAnchor];
  [(id)objc_opt_class() _titleLabelTopToFirstBaseline];
  v35 = objc_msgSend(v32, "constraintEqualToAnchor:constant:", v34);
  [v35 setActive:1];

  v36 = [(WDMedicalRecordDetailSubtitleCell *)self subtitleLabel];
  v37 = [v36 leadingAnchor];
  v38 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v39 = [v38 leadingAnchor];
  v40 = [v37 constraintEqualToAnchor:v39 constant:16.0];
  [v40 setActive:1];

  v41 = [(WDMedicalRecordDetailSubtitleCell *)self subtitleLabel];
  v42 = [v41 trailingAnchor];
  v43 = [(WDMedicalRecordDetailSubtitleCell *)self titleLabel];
  v44 = [v43 trailingAnchor];
  v45 = [v42 constraintEqualToAnchor:v44];
  [v45 setActive:1];

  v46 = [(WDMedicalRecordDetailSubtitleCell *)self subtitleLabel];
  v47 = [v46 firstBaselineAnchor];
  v48 = [(WDMedicalRecordDetailSubtitleCell *)self titleLabel];
  v49 = [v48 lastBaselineAnchor];
  [(id)objc_opt_class() _subtitleLabelTopToFirstBaseline];
  v50 = objc_msgSend(v47, "constraintEqualToAnchor:constant:", v49);
  [v50 setActive:1];

  v51 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v52 = [v51 bottomAnchor];
  v53 = [(WDMedicalRecordDetailSubtitleCell *)self subtitleLabel];
  v54 = [v53 lastBaselineAnchor];
  [(id)objc_opt_class() _subtitleLabelLastBaselineToBottom];
  v55 = objc_msgSend(v52, "constraintEqualToAnchor:constant:", v54);
  [v55 setActive:1];
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(WDMedicalRecordDetailSubtitleCell *)self titleLabel];
  [v5 setText:v4];
}

- (NSString)title
{
  v2 = [(WDMedicalRecordDetailSubtitleCell *)self titleLabel];
  id v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setSubtitle:(id)a3
{
  id v4 = a3;
  id v5 = [(WDMedicalRecordDetailSubtitleCell *)self subtitleLabel];
  [v5 setText:v4];
}

- (NSString)subtitle
{
  v2 = [(WDMedicalRecordDetailSubtitleCell *)self subtitleLabel];
  id v3 = [v2 text];

  return (NSString *)v3;
}

+ (id)_titleLabelFont
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
}

+ (double)_titleLabelTopToFirstBaseline
{
  v2 = [(id)objc_opt_class() _titleLabelFont];
  [v2 _scaledValueForValue:24.0];
  double v4 = v3;

  return v4;
}

+ (id)_subtitleLabelFont
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
}

+ (double)_subtitleLabelTopToFirstBaseline
{
  v2 = [(id)objc_opt_class() _subtitleLabelFont];
  [v2 _scaledValueForValue:22.0];
  double v4 = v3;

  return v4;
}

+ (double)_subtitleLabelLastBaselineToBottom
{
  v2 = [(id)objc_opt_class() _subtitleLabelFont];
  [v2 _scaledValueForValue:13.0];
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

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end