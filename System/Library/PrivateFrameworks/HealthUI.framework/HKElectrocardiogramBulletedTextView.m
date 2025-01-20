@interface HKElectrocardiogramBulletedTextView
- (HKElectrocardiogramBulletedTextView)init;
- (NSMutableArray)bodyFirstBaselineConstraints;
- (NSString)detailText;
- (NSString)titleText;
- (UILabel)detailLabel;
- (UILabel)titleLabel;
- (void)_setUpUI;
- (void)_setupConstraints;
- (void)_updateLeadingDetailAttributedTextSize;
- (void)setBodyFirstBaselineConstraints:(id)a3;
- (void)setDetailLabel:(id)a3;
- (void)setDetailTextWithBullets:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleText:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
@end

@implementation HKElectrocardiogramBulletedTextView

- (HKElectrocardiogramBulletedTextView)init
{
  v10.receiver = self;
  v10.super_class = (Class)HKElectrocardiogramBulletedTextView;
  v2 = -[HKElectrocardiogramBulletedTextView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v2)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v2->_titleLabel;
    v2->_titleLabel = v3;

    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    detailLabel = v2->_detailLabel;
    v2->_detailLabel = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    bodyFirstBaselineConstraints = v2->_bodyFirstBaselineConstraints;
    v2->_bodyFirstBaselineConstraints = v7;

    [(HKElectrocardiogramBulletedTextView *)v2 _setUpUI];
  }
  return v2;
}

- (NSString)titleText
{
  v2 = [(HKElectrocardiogramBulletedTextView *)self titleLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setTitleText:(id)a3
{
  id v4 = a3;
  id v5 = [(HKElectrocardiogramBulletedTextView *)self titleLabel];
  [v5 setText:v4];
}

- (NSString)detailText
{
  v2 = [(HKElectrocardiogramBulletedTextView *)self detailLabel];
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
        v11 = [NSString stringWithFormat:@"•\t%@", *(void *)(*((void *)&v14 + 1) + 8 * v10)];
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
    v13 = [(HKElectrocardiogramBulletedTextView *)self detailLabel];
    [v13 setText:v12];
  }
  [(HKElectrocardiogramBulletedTextView *)self _updateLeadingDetailAttributedTextSize];
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
  v11 = (void *)[v10 initWithTextAlignment:4 location:MEMORY[0x1E4F1CC08] options:v7];
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
  long long v16 = [(HKElectrocardiogramBulletedTextView *)self detailLabel];
  [v16 setFont:v13];

  long long v17 = [(HKElectrocardiogramBulletedTextView *)self detailText];

  if (v17)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v19 = [(HKElectrocardiogramBulletedTextView *)self detailText];
    v20 = (void *)[v18 initWithString:v19 attributes:v15];
    v21 = [(HKElectrocardiogramBulletedTextView *)self detailLabel];
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
  id v5 = [(HKElectrocardiogramBulletedTextView *)self traitCollection];
  double v6 = [v5 preferredContentSizeCategory];
  char v7 = [v4 isEqualToString:v6];

  uint64_t v8 = v9;
  if ((v7 & 1) == 0)
  {
LABEL_3:
    [(HKElectrocardiogramBulletedTextView *)self _updateLeadingDetailAttributedTextSize];
    [(HKElectrocardiogramBulletedTextView *)self setNeedsUpdateConstraints];
    uint64_t v8 = v9;
  }
}

- (void)_setUpUI
{
  id v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(HKElectrocardiogramBulletedTextView *)self setBackgroundColor:v3];

  uint64_t v4 = [(HKElectrocardiogramBulletedTextView *)self titleLabel];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v5 = [(HKElectrocardiogramBulletedTextView *)self titleLabel];
  [v5 setAdjustsFontForContentSizeCategory:1];

  double v6 = [(HKElectrocardiogramBulletedTextView *)self titleLabel];
  [v6 setNumberOfLines:0];

  char v7 = [(HKElectrocardiogramBulletedTextView *)self titleLabel];
  [v7 setTextAlignment:4];

  uint64_t v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  id v9 = [(HKElectrocardiogramBulletedTextView *)self titleLabel];
  [v9 setFont:v8];

  id v10 = [MEMORY[0x1E4FB1618] labelColor];
  v11 = [(HKElectrocardiogramBulletedTextView *)self titleLabel];
  [v11 setTextColor:v10];

  v12 = [(HKElectrocardiogramBulletedTextView *)self titleLabel];
  [(HKElectrocardiogramBulletedTextView *)self addSubview:v12];

  v13 = [(HKElectrocardiogramBulletedTextView *)self detailLabel];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v14 = [(HKElectrocardiogramBulletedTextView *)self detailLabel];
  [v14 setAdjustsFontForContentSizeCategory:1];

  long long v15 = [(HKElectrocardiogramBulletedTextView *)self detailLabel];
  [v15 setNumberOfLines:0];

  long long v16 = [(HKElectrocardiogramBulletedTextView *)self detailLabel];
  [v16 setTextAlignment:4];

  long long v17 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  id v18 = [(HKElectrocardiogramBulletedTextView *)self detailLabel];
  [v18 setFont:v17];

  uint64_t v19 = [MEMORY[0x1E4FB1618] labelColor];
  v20 = [(HKElectrocardiogramBulletedTextView *)self detailLabel];
  [v20 setTextColor:v19];

  v21 = [(HKElectrocardiogramBulletedTextView *)self detailLabel];
  [(HKElectrocardiogramBulletedTextView *)self addSubview:v21];

  [(HKElectrocardiogramBulletedTextView *)self _setupConstraints];
}

- (void)_setupConstraints
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(HKElectrocardiogramBulletedTextView *)self titleLabel];
  uint64_t v4 = [v3 topAnchor];
  id v5 = [(HKElectrocardiogramBulletedTextView *)self topAnchor];
  double v6 = [v4 constraintEqualToAnchor:v5 constant:10.0];
  [v6 setActive:1];

  char v7 = [(HKElectrocardiogramBulletedTextView *)self bodyFirstBaselineConstraints];
  uint64_t v8 = [(HKElectrocardiogramBulletedTextView *)self detailLabel];
  id v9 = [v8 firstBaselineAnchor];
  id v10 = [(HKElectrocardiogramBulletedTextView *)self titleLabel];
  v11 = [v10 lastBaselineAnchor];
  v12 = [v9 constraintEqualToAnchor:v11];
  v43[0] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
  [v7 addObjectsFromArray:v13];

  uint64_t v14 = (void *)MEMORY[0x1E4F28DC8];
  long long v15 = [(HKElectrocardiogramBulletedTextView *)self bodyFirstBaselineConstraints];
  [v14 activateConstraints:v15];

  long long v16 = [(HKElectrocardiogramBulletedTextView *)self bottomAnchor];
  long long v17 = [(HKElectrocardiogramBulletedTextView *)self detailLabel];
  id v18 = [v17 bottomAnchor];
  uint64_t v19 = [v16 constraintEqualToAnchor:v18 constant:10.0];
  [v19 setActive:1];

  v32 = (void *)MEMORY[0x1E4F28DC8];
  v41 = [(HKElectrocardiogramBulletedTextView *)self layoutMarginsGuide];
  v39 = [v41 leadingAnchor];
  v40 = [(HKElectrocardiogramBulletedTextView *)self titleLabel];
  v38 = [v40 leadingAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v42[0] = v37;
  v36 = [(HKElectrocardiogramBulletedTextView *)self titleLabel];
  v34 = [v36 trailingAnchor];
  v35 = [(HKElectrocardiogramBulletedTextView *)self layoutMarginsGuide];
  v33 = [v35 trailingAnchor];
  v31 = [v34 constraintGreaterThanOrEqualToAnchor:v33];
  v42[1] = v31;
  v30 = [(HKElectrocardiogramBulletedTextView *)self detailLabel];
  v20 = [v30 leadingAnchor];
  v21 = [(HKElectrocardiogramBulletedTextView *)self layoutMarginsGuide];
  v22 = [v21 leadingAnchor];
  v23 = [v20 constraintEqualToAnchor:v22];
  v42[2] = v23;
  v24 = [(HKElectrocardiogramBulletedTextView *)self layoutMarginsGuide];
  v25 = [v24 trailingAnchor];
  v26 = [(HKElectrocardiogramBulletedTextView *)self detailLabel];
  v27 = [v26 trailingAnchor];
  v28 = [v25 constraintGreaterThanOrEqualToAnchor:v27];
  v42[3] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:4];
  [v32 activateConstraints:v29];
}

- (void)updateConstraints
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FB17A8]);
  uint64_t v4 = (void *)[v3 initForTextStyle:*MEMORY[0x1E4FB28C8]];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(HKElectrocardiogramBulletedTextView *)self bodyFirstBaselineConstraints];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
        [v4 scaledValueForValue:24.0];
        objc_msgSend(v10, "setConstant:");
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  v11.receiver = self;
  v11.super_class = (Class)HKElectrocardiogramBulletedTextView;
  [(HKElectrocardiogramBulletedTextView *)&v11 updateConstraints];
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyFirstBaselineConstraints, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end