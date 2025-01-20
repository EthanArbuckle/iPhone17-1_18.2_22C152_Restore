@interface WDMedicalRecordTimelineProviderTitleCell
- (NSString)title;
- (UILabel)titleLabel;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setupSubviews;
@end

@implementation WDMedicalRecordTimelineProviderTitleCell

- (void)setupSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)WDMedicalRecordTimelineProviderTitleCell;
  [(WDMedicalRecordGroupableCell *)&v29 setupSubviews];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(WDMedicalRecordTimelineProviderTitleCell *)self setTitleLabel:v3];

  v4 = [(WDMedicalRecordTimelineProviderTitleCell *)self titleLabel];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2990] variant:1024];
  v6 = [(WDMedicalRecordTimelineProviderTitleCell *)self titleLabel];
  [v6 setFont:v5];

  v7 = [(WDMedicalRecordTimelineProviderTitleCell *)self contentView];
  v8 = [(WDMedicalRecordTimelineProviderTitleCell *)self titleLabel];
  [v7 addSubview:v8];

  v9 = [(WDMedicalRecordTimelineProviderTitleCell *)self titleLabel];
  v10 = [v9 leadingAnchor];
  v11 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v12 = [v11 leadingAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  [v13 setActive:1];

  v14 = [(WDMedicalRecordTimelineProviderTitleCell *)self titleLabel];
  v15 = [v14 trailingAnchor];
  v16 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v17 = [v16 trailingAnchor];
  v18 = [v15 constraintEqualToAnchor:v17];
  [v18 setActive:1];

  v19 = [(WDMedicalRecordTimelineProviderTitleCell *)self titleLabel];
  v20 = [v19 topAnchor];
  v21 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v22 = [v21 topAnchor];
  v23 = [v20 constraintEqualToAnchor:v22];
  [v23 setActive:1];

  v24 = [(WDMedicalRecordTimelineProviderTitleCell *)self titleLabel];
  v25 = [v24 bottomAnchor];
  v26 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v27 = [v26 bottomAnchor];
  v28 = [v25 constraintEqualToAnchor:v27];
  [v28 setActive:1];
}

- (NSString)title
{
  v2 = [(WDMedicalRecordTimelineProviderTitleCell *)self titleLabel];
  id v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(WDMedicalRecordTimelineProviderTitleCell *)self titleLabel];
  [v5 setText:v4];
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