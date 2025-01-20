@interface WDMedicalRecordDetailTitleCell
+ (double)_subtitleLabelLastBaselineToBottom;
+ (double)_subtitleLabelTopToFirstBaseline;
+ (double)_titleLabelTopToFirstBaseline;
+ (id)_subtitleLabelFont;
+ (id)_titleLabelFont;
- (NSString)dateSubtitle;
- (NSString)title;
- (UILabel)dateSubtitleLabel;
- (UILabel)titleLabel;
- (void)setDateSubtitle:(id)a3;
- (void)setDateSubtitleLabel:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setupSubviews;
@end

@implementation WDMedicalRecordDetailTitleCell

- (void)setupSubviews
{
  v56.receiver = self;
  v56.super_class = (Class)WDMedicalRecordDetailTitleCell;
  [(WDMedicalRecordGroupableCell *)&v56 setupSubviews];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(WDMedicalRecordDetailTitleCell *)self setTitleLabel:v3];

  v4 = [(id)objc_opt_class() _titleLabelFont];
  v5 = [(WDMedicalRecordDetailTitleCell *)self titleLabel];
  [v5 setFont:v4];

  v6 = [MEMORY[0x1E4FB1618] labelColor];
  v7 = [(WDMedicalRecordDetailTitleCell *)self titleLabel];
  [v7 setTextColor:v6];

  v8 = [(WDMedicalRecordDetailTitleCell *)self titleLabel];
  [v8 setNumberOfLines:8];

  v9 = [(WDMedicalRecordDetailTitleCell *)self titleLabel];
  [v9 setLineBreakMode:5];

  v10 = [(WDMedicalRecordDetailTitleCell *)self titleLabel];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  v11 = [(WDMedicalRecordDetailTitleCell *)self contentView];
  v12 = [(WDMedicalRecordDetailTitleCell *)self titleLabel];
  [v11 addSubview:v12];

  id v13 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(WDMedicalRecordDetailTitleCell *)self setDateSubtitleLabel:v13];

  v14 = [(id)objc_opt_class() _subtitleLabelFont];
  v15 = [(WDMedicalRecordDetailTitleCell *)self dateSubtitleLabel];
  [v15 setFont:v14];

  v16 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v17 = [(WDMedicalRecordDetailTitleCell *)self dateSubtitleLabel];
  [v17 setTextColor:v16];

  v18 = [(WDMedicalRecordDetailTitleCell *)self dateSubtitleLabel];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

  v19 = [(WDMedicalRecordDetailTitleCell *)self contentView];
  v20 = [(WDMedicalRecordDetailTitleCell *)self dateSubtitleLabel];
  [v19 addSubview:v20];

  v21 = [(WDMedicalRecordDetailTitleCell *)self titleLabel];
  v22 = [v21 leadingAnchor];
  v23 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v24 = [v23 leadingAnchor];
  v25 = [v22 constraintEqualToAnchor:v24 constant:16.0];
  [v25 setActive:1];

  v26 = [(WDMedicalRecordDetailTitleCell *)self titleLabel];
  v27 = [v26 trailingAnchor];
  v28 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v29 = [v28 trailingAnchor];
  v30 = [v27 constraintEqualToAnchor:v29 constant:-16.0];
  [v30 setActive:1];

  v31 = [(WDMedicalRecordDetailTitleCell *)self titleLabel];
  v32 = [v31 topAnchor];
  v33 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v34 = [v33 topAnchor];
  v35 = [v32 constraintEqualToAnchor:v34 constant:24.0];
  [v35 setActive:1];

  v36 = [(WDMedicalRecordDetailTitleCell *)self dateSubtitleLabel];
  v37 = [v36 leadingAnchor];
  v38 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v39 = [v38 leadingAnchor];
  v40 = [v37 constraintEqualToAnchor:v39 constant:16.0];
  [v40 setActive:1];

  v41 = [(WDMedicalRecordDetailTitleCell *)self dateSubtitleLabel];
  v42 = [v41 trailingAnchor];
  v43 = [(WDMedicalRecordDetailTitleCell *)self titleLabel];
  v44 = [v43 trailingAnchor];
  v45 = [v42 constraintEqualToAnchor:v44];
  [v45 setActive:1];

  v46 = [(WDMedicalRecordDetailTitleCell *)self dateSubtitleLabel];
  v47 = [v46 firstBaselineAnchor];
  v48 = [(WDMedicalRecordDetailTitleCell *)self titleLabel];
  v49 = [v48 lastBaselineAnchor];
  [(id)objc_opt_class() _subtitleLabelTopToFirstBaseline];
  v50 = objc_msgSend(v47, "constraintEqualToAnchor:constant:", v49);
  [v50 setActive:1];

  v51 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v52 = [v51 bottomAnchor];
  v53 = [(WDMedicalRecordDetailTitleCell *)self dateSubtitleLabel];
  v54 = [v53 lastBaselineAnchor];
  [(id)objc_opt_class() _subtitleLabelLastBaselineToBottom];
  v55 = objc_msgSend(v52, "constraintEqualToAnchor:constant:", v54);
  [v55 setActive:1];
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(WDMedicalRecordDetailTitleCell *)self titleLabel];
  [v5 setText:v4];
}

- (NSString)title
{
  v2 = [(WDMedicalRecordDetailTitleCell *)self titleLabel];
  id v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setDateSubtitle:(id)a3
{
  id v4 = a3;
  id v5 = [(WDMedicalRecordDetailTitleCell *)self dateSubtitleLabel];
  [v5 setText:v4];
}

- (NSString)dateSubtitle
{
  v2 = [(WDMedicalRecordDetailTitleCell *)self dateSubtitleLabel];
  id v3 = [v2 text];

  return (NSString *)v3;
}

+ (id)_titleLabelFont
{
  return (id)[MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2988] variant:1024];
}

+ (double)_titleLabelTopToFirstBaseline
{
  v2 = [(id)objc_opt_class() _titleLabelFont];
  [v2 _scaledValueForValue:34.0];
  double v4 = v3;

  return v4;
}

+ (id)_subtitleLabelFont
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
}

+ (double)_subtitleLabelTopToFirstBaseline
{
  v2 = [(id)objc_opt_class() _subtitleLabelFont];
  [v2 _scaledValueForValue:27.0];
  double v4 = v3;

  return v4;
}

+ (double)_subtitleLabelLastBaselineToBottom
{
  v2 = [(id)objc_opt_class() _subtitleLabelFont];
  [v2 _scaledValueForValue:24.0];
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

- (UILabel)dateSubtitleLabel
{
  return self->_dateSubtitleLabel;
}

- (void)setDateSubtitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end