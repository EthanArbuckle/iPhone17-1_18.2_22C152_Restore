@interface WDMedicalRecordTimelineAppendixCell
- (NSString)title;
- (UILabel)titleLabel;
- (UIView)chevronView;
- (id)_titleLabelFont;
- (void)setChevronView:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setupSubviews;
- (void)tintColorDidChange;
@end

@implementation WDMedicalRecordTimelineAppendixCell

- (void)setupSubviews
{
  v46.receiver = self;
  v46.super_class = (Class)WDMedicalRecordTimelineAppendixCell;
  [(WDMedicalRecordGroupableCell *)&v46 setupSubviews];
  v3 = [MEMORY[0x1E4FB1EB0] makeChevron];
  [(WDMedicalRecordTimelineAppendixCell *)self setChevronView:v3];

  v4 = [(WDMedicalRecordTimelineAppendixCell *)self contentView];
  v5 = [(WDMedicalRecordTimelineAppendixCell *)self chevronView];
  [v4 addSubview:v5];

  id v6 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(WDMedicalRecordTimelineAppendixCell *)self setTitleLabel:v6];

  v7 = [(WDMedicalRecordTimelineAppendixCell *)self titleLabel];
  [v7 setNumberOfLines:2];

  v8 = [(WDMedicalRecordTimelineAppendixCell *)self _titleLabelFont];
  v9 = [(WDMedicalRecordTimelineAppendixCell *)self titleLabel];
  [v9 setFont:v8];

  v10 = [(WDMedicalRecordTimelineAppendixCell *)self tintColor];
  v11 = [(WDMedicalRecordTimelineAppendixCell *)self titleLabel];
  [v11 setTextColor:v10];

  v12 = [(WDMedicalRecordTimelineAppendixCell *)self titleLabel];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

  v13 = [(WDMedicalRecordTimelineAppendixCell *)self titleLabel];
  [v13 setTextAlignment:4];

  v14 = [(WDMedicalRecordTimelineAppendixCell *)self contentView];
  v15 = [(WDMedicalRecordTimelineAppendixCell *)self titleLabel];
  [v14 addSubview:v15];

  v16 = [(WDMedicalRecordTimelineAppendixCell *)self chevronView];
  v17 = [v16 trailingAnchor];
  v18 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v19 = [v18 trailingAnchor];
  v20 = [v17 constraintEqualToAnchor:v19 constant:-16.0];
  [v20 setActive:1];

  v21 = [(WDMedicalRecordTimelineAppendixCell *)self chevronView];
  v22 = [v21 centerYAnchor];
  v23 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v24 = [v23 centerYAnchor];
  v25 = [v22 constraintEqualToAnchor:v24];
  [v25 setActive:1];

  v26 = [(WDMedicalRecordTimelineAppendixCell *)self titleLabel];
  v27 = [v26 leadingAnchor];
  v28 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v29 = [v28 leadingAnchor];
  v30 = [v27 constraintEqualToAnchor:v29 constant:16.0];
  [v30 setActive:1];

  v31 = [(WDMedicalRecordTimelineAppendixCell *)self titleLabel];
  v32 = [v31 trailingAnchor];
  v33 = [(WDMedicalRecordTimelineAppendixCell *)self chevronView];
  v34 = [v33 leadingAnchor];
  v35 = [v32 constraintEqualToAnchor:v34 constant:-16.0];
  [v35 setActive:1];

  v36 = [(WDMedicalRecordTimelineAppendixCell *)self titleLabel];
  v37 = [v36 topAnchor];
  v38 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v39 = [v38 topAnchor];
  v40 = [v37 constraintEqualToAnchor:v39 constant:16.0];
  [v40 setActive:1];

  v41 = [(WDMedicalRecordTimelineAppendixCell *)self titleLabel];
  v42 = [v41 bottomAnchor];
  v43 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v44 = [v43 bottomAnchor];
  v45 = [v42 constraintEqualToAnchor:v44 constant:-16.0];
  [v45 setActive:1];
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  id v5 = a3;
  id v6 = [(WDMedicalRecordTimelineAppendixCell *)self titleLabel];
  [v6 setText:v5];
}

- (id)_titleLabelFont
{
  return (id)[MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28C8] variant:256];
}

- (void)tintColorDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)WDMedicalRecordTimelineAppendixCell;
  [(WDMedicalRecordTimelineAppendixCell *)&v5 tintColorDidChange];
  v3 = [(WDMedicalRecordTimelineAppendixCell *)self tintColor];
  v4 = [(WDMedicalRecordTimelineAppendixCell *)self titleLabel];
  [v4 setTextColor:v3];
}

- (NSString)title
{
  return self->_title;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIView)chevronView
{
  return self->_chevronView;
}

- (void)setChevronView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chevronView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end