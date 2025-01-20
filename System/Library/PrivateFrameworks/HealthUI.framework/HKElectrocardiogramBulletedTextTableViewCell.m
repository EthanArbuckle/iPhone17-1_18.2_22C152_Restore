@interface HKElectrocardiogramBulletedTextTableViewCell
- (HKElectrocardiogramBulletedTextTableViewCell)initWithReuseIdentifier:(id)a3;
- (NSLayoutConstraint)detailLabelLastBaselineConstraint;
- (NSMutableArray)bodyFirstBaselineConstraints;
- (NSString)detailText;
- (NSString)titleText;
- (UILabel)detailLabel;
- (UILabel)titleLabel;
- (void)_setUpUI;
- (void)_setupConstraints;
- (void)_updateLeadingDetailAttributedTextSize;
- (void)prepareForReuse;
- (void)setBodyFirstBaselineConstraints:(id)a3;
- (void)setDetailLabel:(id)a3;
- (void)setDetailLabelLastBaselineConstraint:(id)a3;
- (void)setDetailTextWithBullets:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleText:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
@end

@implementation HKElectrocardiogramBulletedTextTableViewCell

- (HKElectrocardiogramBulletedTextTableViewCell)initWithReuseIdentifier:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)HKElectrocardiogramBulletedTextTableViewCell;
  v3 = [(HKElectrocardiogramBulletedTextTableViewCell *)&v11 initWithStyle:0 reuseIdentifier:a3];
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    detailLabel = v3->_detailLabel;
    v3->_detailLabel = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    bodyFirstBaselineConstraints = v3->_bodyFirstBaselineConstraints;
    v3->_bodyFirstBaselineConstraints = v8;

    [(HKElectrocardiogramBulletedTextTableViewCell *)v3 _setUpUI];
  }
  return v3;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)HKElectrocardiogramBulletedTextTableViewCell;
  [(HKElectrocardiogramBulletedTextTableViewCell *)&v4 prepareForReuse];
  [(HKElectrocardiogramBulletedTextTableViewCell *)self setTitleText:0];
  v3 = [(HKElectrocardiogramBulletedTextTableViewCell *)self detailLabel];
  [v3 setText:0];
}

- (NSString)titleText
{
  v2 = [(HKElectrocardiogramBulletedTextTableViewCell *)self titleLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setTitleText:(id)a3
{
  id v4 = a3;
  id v5 = [(HKElectrocardiogramBulletedTextTableViewCell *)self titleLabel];
  [v5 setText:v4];
}

- (NSString)detailText
{
  v2 = [(HKElectrocardiogramBulletedTextTableViewCell *)self detailLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setDetailTextWithBullets:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = [NSString stringWithFormat:@"•\t%@", *(void *)(*((void *)&v14 + 1) + 8 * v10)];
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    v12 = [v5 componentsJoinedByString:@"\n"];
    v13 = [(HKElectrocardiogramBulletedTextTableViewCell *)self detailLabel];
    [v13 setText:v12];
  }
  [(HKElectrocardiogramBulletedTextTableViewCell *)self _updateLeadingDetailAttributedTextSize];
}

- (void)_updateLeadingDetailAttributedTextSize
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FB17A8]);
  uint64_t v4 = *MEMORY[0x1E4FB2950];
  id v5 = (void *)[v3 initForTextStyle:*MEMORY[0x1E4FB2950]];
  [v5 scaledValueForValue:12.0];
  double v7 = v6;
  uint64_t v8 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  uint64_t v9 = (void *)[v8 mutableCopy];

  id v10 = objc_alloc(MEMORY[0x1E4FB08C0]);
  objc_super v11 = (void *)[v10 initWithTextAlignment:4 location:MEMORY[0x1E4F1CC08] options:v7];
  v24[0] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  [v9 setTabStops:v12];

  [v5 scaledValueForValue:4.0];
  objc_msgSend(v9, "setParagraphSpacingBefore:");
  [v9 setDefaultTabInterval:v7];
  [v9 setFirstLineHeadIndent:0.0];
  [v9 setHeadIndent:v7];
  v13 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v4];
  uint64_t v14 = *MEMORY[0x1E4FB06F8];
  v22[0] = *MEMORY[0x1E4FB0738];
  v22[1] = v14;
  v23[0] = v9;
  v23[1] = v13;
  long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  long long v16 = [(HKElectrocardiogramBulletedTextTableViewCell *)self detailLabel];
  [v16 setFont:v13];

  long long v17 = [(HKElectrocardiogramBulletedTextTableViewCell *)self detailText];

  if (v17)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v19 = [(HKElectrocardiogramBulletedTextTableViewCell *)self detailText];
    v20 = (void *)[v18 initWithString:v19 attributes:v15];
    v21 = [(HKElectrocardiogramBulletedTextTableViewCell *)self detailLabel];
    [v21 setAttributedText:v20];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v9 = a3;
  if (!v9) {
    goto LABEL_3;
  }
  uint64_t v4 = [v9 preferredContentSizeCategory];
  id v5 = [(HKElectrocardiogramBulletedTextTableViewCell *)self traitCollection];
  double v6 = [v5 preferredContentSizeCategory];
  char v7 = [v4 isEqualToString:v6];

  uint64_t v8 = v9;
  if ((v7 & 1) == 0)
  {
LABEL_3:
    [(HKElectrocardiogramBulletedTextTableViewCell *)self _updateLeadingDetailAttributedTextSize];
    [(HKElectrocardiogramBulletedTextTableViewCell *)self setNeedsUpdateConstraints];
    uint64_t v8 = v9;
  }
}

- (void)_setUpUI
{
  id v3 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
  [(HKElectrocardiogramBulletedTextTableViewCell *)self setBackgroundColor:v3];

  uint64_t v4 = [(HKElectrocardiogramBulletedTextTableViewCell *)self titleLabel];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v5 = [(HKElectrocardiogramBulletedTextTableViewCell *)self titleLabel];
  [v5 setAdjustsFontForContentSizeCategory:1];

  double v6 = [(HKElectrocardiogramBulletedTextTableViewCell *)self titleLabel];
  [v6 setNumberOfLines:0];

  char v7 = [(HKElectrocardiogramBulletedTextTableViewCell *)self titleLabel];
  [v7 setTextAlignment:4];

  uint64_t v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  id v9 = [(HKElectrocardiogramBulletedTextTableViewCell *)self titleLabel];
  [v9 setFont:v8];

  id v10 = [MEMORY[0x1E4FB1618] labelColor];
  objc_super v11 = [(HKElectrocardiogramBulletedTextTableViewCell *)self titleLabel];
  [v11 setTextColor:v10];

  v12 = [(HKElectrocardiogramBulletedTextTableViewCell *)self contentView];
  v13 = [(HKElectrocardiogramBulletedTextTableViewCell *)self titleLabel];
  [v12 addSubview:v13];

  uint64_t v14 = [(HKElectrocardiogramBulletedTextTableViewCell *)self detailLabel];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

  long long v15 = [(HKElectrocardiogramBulletedTextTableViewCell *)self detailLabel];
  [v15 setAdjustsFontForContentSizeCategory:1];

  long long v16 = [(HKElectrocardiogramBulletedTextTableViewCell *)self detailLabel];
  [v16 setNumberOfLines:0];

  long long v17 = [(HKElectrocardiogramBulletedTextTableViewCell *)self detailLabel];
  [v17 setTextAlignment:4];

  id v18 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  uint64_t v19 = [(HKElectrocardiogramBulletedTextTableViewCell *)self detailLabel];
  [v19 setFont:v18];

  v20 = [MEMORY[0x1E4FB1618] labelColor];
  v21 = [(HKElectrocardiogramBulletedTextTableViewCell *)self detailLabel];
  [v21 setTextColor:v20];

  v22 = [(HKElectrocardiogramBulletedTextTableViewCell *)self contentView];
  v23 = [(HKElectrocardiogramBulletedTextTableViewCell *)self detailLabel];
  [v22 addSubview:v23];

  [(HKElectrocardiogramBulletedTextTableViewCell *)self setSelectionStyle:0];
  [(HKElectrocardiogramBulletedTextTableViewCell *)self _setupConstraints];
}

- (void)_setupConstraints
{
  v50[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(HKElectrocardiogramBulletedTextTableViewCell *)self bodyFirstBaselineConstraints];
  v47 = [(HKElectrocardiogramBulletedTextTableViewCell *)self titleLabel];
  v43 = [v47 firstBaselineAnchor];
  v45 = [(HKElectrocardiogramBulletedTextTableViewCell *)self contentView];
  uint64_t v4 = [v45 topAnchor];
  id v5 = [v43 constraintEqualToAnchor:v4];
  v50[0] = v5;
  double v6 = [(HKElectrocardiogramBulletedTextTableViewCell *)self detailLabel];
  char v7 = [v6 firstBaselineAnchor];
  uint64_t v8 = [(HKElectrocardiogramBulletedTextTableViewCell *)self titleLabel];
  id v9 = [v8 lastBaselineAnchor];
  id v10 = [v7 constraintEqualToAnchor:v9];
  v50[1] = v10;
  objc_super v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
  [v3 addObjectsFromArray:v11];

  v12 = (void *)MEMORY[0x1E4F28DC8];
  v13 = [(HKElectrocardiogramBulletedTextTableViewCell *)self bodyFirstBaselineConstraints];
  [v12 activateConstraints:v13];

  uint64_t v14 = [(HKElectrocardiogramBulletedTextTableViewCell *)self contentView];
  long long v15 = [v14 bottomAnchor];
  long long v16 = [(HKElectrocardiogramBulletedTextTableViewCell *)self detailLabel];
  long long v17 = [v16 lastBaselineAnchor];
  id v18 = [v15 constraintEqualToAnchor:v17];
  [(HKElectrocardiogramBulletedTextTableViewCell *)self setDetailLabelLastBaselineConstraint:v18];

  uint64_t v19 = [(HKElectrocardiogramBulletedTextTableViewCell *)self detailLabelLastBaselineConstraint];
  [v19 setActive:1];

  v34 = (void *)MEMORY[0x1E4F28DC8];
  v48 = [(HKElectrocardiogramBulletedTextTableViewCell *)self contentView];
  v46 = [v48 layoutMarginsGuide];
  v42 = [v46 leadingAnchor];
  v44 = [(HKElectrocardiogramBulletedTextTableViewCell *)self titleLabel];
  v41 = [v44 leadingAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v49[0] = v40;
  v39 = [(HKElectrocardiogramBulletedTextTableViewCell *)self titleLabel];
  v37 = [v39 trailingAnchor];
  v38 = [(HKElectrocardiogramBulletedTextTableViewCell *)self contentView];
  v36 = [v38 layoutMarginsGuide];
  v35 = [v36 trailingAnchor];
  v33 = [v37 constraintGreaterThanOrEqualToAnchor:v35];
  v49[1] = v33;
  v32 = [(HKElectrocardiogramBulletedTextTableViewCell *)self detailLabel];
  v30 = [v32 leadingAnchor];
  v31 = [(HKElectrocardiogramBulletedTextTableViewCell *)self contentView];
  v20 = [v31 layoutMarginsGuide];
  v21 = [v20 leadingAnchor];
  v22 = [v30 constraintEqualToAnchor:v21];
  v49[2] = v22;
  v23 = [(HKElectrocardiogramBulletedTextTableViewCell *)self contentView];
  v24 = [v23 layoutMarginsGuide];
  v25 = [v24 trailingAnchor];
  v26 = [(HKElectrocardiogramBulletedTextTableViewCell *)self detailLabel];
  v27 = [v26 trailingAnchor];
  v28 = [v25 constraintGreaterThanOrEqualToAnchor:v27];
  v49[3] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:4];
  [v34 activateConstraints:v29];
}

- (void)updateConstraints
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FB17A8]);
  uint64_t v4 = (void *)[v3 initForTextStyle:*MEMORY[0x1E4FB28C8]];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [(HKElectrocardiogramBulletedTextTableViewCell *)self bodyFirstBaselineConstraints];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
        [v4 scaledValueForValue:24.0];
        objc_msgSend(v10, "setConstant:");
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  id v11 = objc_alloc(MEMORY[0x1E4FB17A8]);
  v12 = (void *)[v11 initForTextStyle:*MEMORY[0x1E4FB2950]];
  [v12 scaledValueForValue:16.0];
  double v14 = v13;
  long long v15 = [(HKElectrocardiogramBulletedTextTableViewCell *)self detailLabelLastBaselineConstraint];
  [v15 setConstant:v14];

  v16.receiver = self;
  v16.super_class = (Class)HKElectrocardiogramBulletedTextTableViewCell;
  [(HKElectrocardiogramBulletedTextTableViewCell *)&v16 updateConstraints];
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (void)setDetailLabel:(id)a3
{
}

- (NSMutableArray)bodyFirstBaselineConstraints
{
  return self->_bodyFirstBaselineConstraints;
}

- (void)setBodyFirstBaselineConstraints:(id)a3
{
}

- (NSLayoutConstraint)detailLabelLastBaselineConstraint
{
  return self->_detailLabelLastBaselineConstraint;
}

- (void)setDetailLabelLastBaselineConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailLabelLastBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_bodyFirstBaselineConstraints, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end