@interface WDMedicalRecordTimelinePanelTitleCell
- (NSString)subtitle;
- (NSString)title;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (WDMedicalRecordTimelinePanelTitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)subtitleFont;
- (id)titleFont;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setupSubviews;
@end

@implementation WDMedicalRecordTimelinePanelTitleCell

- (WDMedicalRecordTimelinePanelTitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)WDMedicalRecordTimelinePanelTitleCell;
  v4 = [(WDMedicalRecordGroupableCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [MEMORY[0x1E4FB1618] clearColor];
    [(WDMedicalRecordGroupableCell *)v4 setPillBackgroundColor:v5];

    v6 = [MEMORY[0x1E4FB1618] clearColor];
    [(WDMedicalRecordTimelinePanelTitleCell *)v4 setBackgroundColor:v6];
  }
  return v4;
}

- (void)setupSubviews
{
  v56.receiver = self;
  v56.super_class = (Class)WDMedicalRecordTimelinePanelTitleCell;
  [(WDMedicalRecordGroupableCell *)&v56 setupSubviews];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(WDMedicalRecordTimelinePanelTitleCell *)self setTitleLabel:v3];

  v4 = [(WDMedicalRecordTimelinePanelTitleCell *)self titleLabel];
  [v4 setNumberOfLines:1];

  v5 = [(WDMedicalRecordTimelinePanelTitleCell *)self titleLabel];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [MEMORY[0x1E4FB1618] labelColor];
  v7 = [(WDMedicalRecordTimelinePanelTitleCell *)self titleLabel];
  [v7 setTextColor:v6];

  objc_super v8 = [(WDMedicalRecordTimelinePanelTitleCell *)self titleFont];
  v9 = [(WDMedicalRecordTimelinePanelTitleCell *)self titleLabel];
  [v9 setFont:v8];

  v10 = [(WDMedicalRecordTimelinePanelTitleCell *)self contentView];
  v11 = [(WDMedicalRecordTimelinePanelTitleCell *)self titleLabel];
  [v10 addSubview:v11];

  id v12 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(WDMedicalRecordTimelinePanelTitleCell *)self setSubtitleLabel:v12];

  v13 = [(WDMedicalRecordTimelinePanelTitleCell *)self subtitleLabel];
  [v13 setNumberOfLines:0];

  v14 = [(WDMedicalRecordTimelinePanelTitleCell *)self subtitleLabel];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

  v15 = [MEMORY[0x1E4FB1618] labelColor];
  v16 = [(WDMedicalRecordTimelinePanelTitleCell *)self subtitleLabel];
  [v16 setTextColor:v15];

  v17 = [(WDMedicalRecordTimelinePanelTitleCell *)self subtitleFont];
  v18 = [(WDMedicalRecordTimelinePanelTitleCell *)self subtitleLabel];
  [v18 setFont:v17];

  v19 = [(WDMedicalRecordTimelinePanelTitleCell *)self contentView];
  v20 = [(WDMedicalRecordTimelinePanelTitleCell *)self subtitleLabel];
  [v19 addSubview:v20];

  v21 = [(WDMedicalRecordTimelinePanelTitleCell *)self titleLabel];
  v22 = [v21 leadingAnchor];
  v23 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v24 = [v23 leadingAnchor];
  v25 = [v22 constraintEqualToAnchor:v24];
  [v25 setActive:1];

  v26 = [(WDMedicalRecordTimelinePanelTitleCell *)self titleLabel];
  v27 = [v26 trailingAnchor];
  v28 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v29 = [v28 trailingAnchor];
  v30 = [v27 constraintEqualToAnchor:v29];
  [v30 setActive:1];

  v31 = [(WDMedicalRecordTimelinePanelTitleCell *)self titleLabel];
  v32 = [v31 topAnchor];
  v33 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v34 = [v33 topAnchor];
  v35 = [v32 constraintEqualToAnchor:v34 constant:8.0];
  [v35 setActive:1];

  v36 = [(WDMedicalRecordTimelinePanelTitleCell *)self subtitleLabel];
  v37 = [v36 leadingAnchor];
  v38 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v39 = [v38 leadingAnchor];
  v40 = [v37 constraintEqualToAnchor:v39];
  [v40 setActive:1];

  v41 = [(WDMedicalRecordTimelinePanelTitleCell *)self subtitleLabel];
  v42 = [v41 trailingAnchor];
  v43 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v44 = [v43 trailingAnchor];
  v45 = [v42 constraintEqualToAnchor:v44];
  [v45 setActive:1];

  v46 = [(WDMedicalRecordTimelinePanelTitleCell *)self subtitleLabel];
  v47 = [v46 topAnchor];
  v48 = [(WDMedicalRecordTimelinePanelTitleCell *)self titleLabel];
  v49 = [v48 bottomAnchor];
  v50 = [v47 constraintEqualToAnchor:v49];
  [v50 setActive:1];

  v51 = [(WDMedicalRecordTimelinePanelTitleCell *)self subtitleLabel];
  v52 = [v51 bottomAnchor];
  v53 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v54 = [v53 bottomAnchor];
  v55 = [v52 constraintEqualToAnchor:v54];
  [v55 setActive:1];

  [(WDMedicalRecordGroupableCell *)self _updateForCurrentSizeCategory];
}

- (id)titleFont
{
  return (id)[MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28F0] variant:1280];
}

- (id)subtitleFont
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
}

- (void)setTitle:(id)a3
{
  id v8 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    v4 = (NSString *)[v8 copy];
    title = self->_title;
    self->_title = v4;

    v6 = [(NSString *)self->_title localizedUppercaseString];
    v7 = [(WDMedicalRecordTimelinePanelTitleCell *)self titleLabel];
    [v7 setText:v6];
  }
}

- (void)setSubtitle:(id)a3
{
  id v8 = a3;
  if (!-[NSString isEqualToString:](self->_subtitle, "isEqualToString:"))
  {
    v4 = (NSString *)[v8 copy];
    subtitle = self->_subtitle;
    self->_subtitle = v4;

    v6 = self->_subtitle;
    v7 = [(WDMedicalRecordTimelinePanelTitleCell *)self subtitleLabel];
    [v7 setText:v6];
  }
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
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
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end