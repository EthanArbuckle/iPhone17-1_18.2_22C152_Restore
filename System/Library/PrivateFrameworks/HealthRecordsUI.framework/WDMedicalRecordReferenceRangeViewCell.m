@interface WDMedicalRecordReferenceRangeViewCell
- (HKInspectableValueInRange)valueInRange;
- (HRExpandedRangeValueView)expandedRangeValueView;
- (NSString)subtitle;
- (UILabel)subtitleLabel;
- (void)setAttributedSubtitleText:(id)a3;
- (void)setExpandedRangeValueView:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setValueInRange:(id)a3;
- (void)setupSubviews;
@end

@implementation WDMedicalRecordReferenceRangeViewCell

- (void)setupSubviews
{
  v51.receiver = self;
  v51.super_class = (Class)WDMedicalRecordReferenceRangeViewCell;
  [(WDMedicalRecordGroupableCell *)&v51 setupSubviews];
  v3 = [HRExpandedRangeValueView alloc];
  v4 = -[HRExpandedRangeValueView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(WDMedicalRecordReferenceRangeViewCell *)self setExpandedRangeValueView:v4];

  v5 = [(WDMedicalRecordReferenceRangeViewCell *)self expandedRangeValueView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v7 = [(WDMedicalRecordReferenceRangeViewCell *)self expandedRangeValueView];
  [v6 addSubview:v7];

  id v8 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(WDMedicalRecordReferenceRangeViewCell *)self setSubtitleLabel:v8];

  v9 = [(WDMedicalRecordReferenceRangeViewCell *)self subtitleLabel];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  v10 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2950] variant:1280];
  v11 = [(WDMedicalRecordReferenceRangeViewCell *)self subtitleLabel];
  [v11 setFont:v10];

  v12 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v13 = [(WDMedicalRecordReferenceRangeViewCell *)self subtitleLabel];
  [v13 setTextColor:v12];

  v14 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v15 = [(WDMedicalRecordReferenceRangeViewCell *)self subtitleLabel];
  [v14 addSubview:v15];

  v16 = [(WDMedicalRecordReferenceRangeViewCell *)self expandedRangeValueView];
  v17 = [v16 leadingAnchor];
  v18 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v19 = [v18 leadingAnchor];
  v20 = [v17 constraintEqualToAnchor:v19 constant:16.0];
  [v20 setActive:1];

  v21 = [(WDMedicalRecordReferenceRangeViewCell *)self expandedRangeValueView];
  v22 = [v21 trailingAnchor];
  v23 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v24 = [v23 trailingAnchor];
  v25 = [v22 constraintEqualToAnchor:v24 constant:-16.0];
  [v25 setActive:1];

  v26 = [(WDMedicalRecordReferenceRangeViewCell *)self expandedRangeValueView];
  v27 = [v26 topAnchor];
  v28 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v29 = [v28 topAnchor];
  v30 = [v27 constraintEqualToAnchor:v29 constant:8.0];
  [v30 setActive:1];

  v31 = [(WDMedicalRecordReferenceRangeViewCell *)self expandedRangeValueView];
  v32 = [v31 bottomAnchor];
  v33 = [(WDMedicalRecordReferenceRangeViewCell *)self subtitleLabel];
  v34 = [v33 topAnchor];
  v35 = [v32 constraintEqualToAnchor:v34 constant:-3.0];
  [v35 setActive:1];

  v36 = [(WDMedicalRecordReferenceRangeViewCell *)self subtitleLabel];
  v37 = [v36 leadingAnchor];
  v38 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v39 = [v38 leadingAnchor];
  v40 = [v37 constraintEqualToAnchor:v39 constant:16.0];
  [v40 setActive:1];

  v41 = [(WDMedicalRecordReferenceRangeViewCell *)self subtitleLabel];
  v42 = [v41 trailingAnchor];
  v43 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v44 = [v43 trailingAnchor];
  v45 = [v42 constraintEqualToAnchor:v44 constant:-16.0];
  [v45 setActive:1];

  v46 = [(WDMedicalRecordReferenceRangeViewCell *)self subtitleLabel];
  v47 = [v46 bottomAnchor];
  v48 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v49 = [v48 bottomAnchor];
  v50 = [v47 constraintEqualToAnchor:v49 constant:-12.0];
  [v50 setActive:1];
}

- (void)setValueInRange:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F67BE8] referenceRangeViewDataFromInspectableValueInRange:v4];
  if (v5)
  {
    v6 = [(WDMedicalRecordReferenceRangeViewCell *)self expandedRangeValueView];
    [v6 updateWithData:v5];
LABEL_5:

    goto LABEL_6;
  }
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x1E4F29F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_INFO))
  {
    v6 = v7;
    id v8 = HKSensitiveLogItem();
    int v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1C21A1000, v6, OS_LOG_TYPE_INFO, "Unable to use %{public}@ as data source for our reference range view", (uint8_t *)&v9, 0xCu);

    goto LABEL_5;
  }
LABEL_6:
}

- (void)setSubtitle:(id)a3
{
  id v10 = a3;
  v5 = [(WDMedicalRecordReferenceRangeViewCell *)self subtitleLabel];
  v6 = [v5 text];
  char v7 = [v6 isEqualToString:v10];

  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_subtitle, a3);
    subtitle = self->_subtitle;
    int v9 = [(WDMedicalRecordReferenceRangeViewCell *)self subtitleLabel];
    [v9 setText:subtitle];
  }
}

- (void)setAttributedSubtitleText:(id)a3
{
  id v4 = a3;
  id v5 = [(WDMedicalRecordReferenceRangeViewCell *)self subtitleLabel];
  [v5 setAttributedText:v4];
}

- (HKInspectableValueInRange)valueInRange
{
  return self->_valueInRange;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (HRExpandedRangeValueView)expandedRangeValueView
{
  return self->_expandedRangeValueView;
}

- (void)setExpandedRangeValueView:(id)a3
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
  objc_storeStrong((id *)&self->_expandedRangeValueView, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_valueInRange, 0);
}

@end