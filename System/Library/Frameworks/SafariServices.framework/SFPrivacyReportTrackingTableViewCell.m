@interface SFPrivacyReportTrackingTableViewCell
- (SFPrivacyReportTrackingTableViewCell)initWithDetailLabel:(BOOL)a3 reuseIdentifier:(id)a4;
- (UILabel)countLabel;
- (UILabel)domainDetailLabel;
- (UILabel)domainLabel;
- (double)count;
- (double)maxCount;
- (void)_updateCountViews;
- (void)setCount:(double)a3;
- (void)setMaxCount:(double)a3;
@end

@implementation SFPrivacyReportTrackingTableViewCell

- (SFPrivacyReportTrackingTableViewCell)initWithDetailLabel:(BOOL)a3 reuseIdentifier:(id)a4
{
  BOOL v4 = a3;
  v87[10] = *MEMORY[0x1E4F143B8];
  v85.receiver = self;
  v85.super_class = (Class)SFPrivacyReportTrackingTableViewCell;
  v5 = [(SFPrivacyReportTrackingTableViewCell *)&v85 initWithStyle:0 reuseIdentifier:a4];
  v6 = v5;
  if (v5)
  {
    [(SFPrivacyReportTrackingTableViewCell *)v5 setAccessoryType:1];
    v7 = [(SFPrivacyReportTrackingTableViewCell *)v6 contentView];
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    domainLabel = v6->_domainLabel;
    v6->_domainLabel = v8;

    v10 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(UILabel *)v6->_domainLabel setFont:v10];

    v11 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v6->_domainLabel setTextColor:v11];

    [(UILabel *)v6->_domainLabel setNumberOfLines:1];
    [(UILabel *)v6->_domainLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v6->_domainLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [v7 addSubview:v6->_domainLabel];
    BOOL v78 = v4;
    if (v4)
    {
      v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      domainDetailLabel = v6->_domainDetailLabel;
      v6->_domainDetailLabel = v12;

      v14 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
      [(UILabel *)v6->_domainDetailLabel setFont:v14];

      v15 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      [(UILabel *)v6->_domainDetailLabel setTextColor:v15];

      [(UILabel *)v6->_domainDetailLabel setNumberOfLines:0];
      [(UILabel *)v6->_domainDetailLabel setAdjustsFontForContentSizeCategory:1];
      [(UILabel *)v6->_domainDetailLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      [v7 addSubview:v6->_domainDetailLabel];
    }
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __76__SFPrivacyReportTrackingTableViewCell_initWithDetailLabel_reuseIdentifier___block_invoke;
    v83[3] = &unk_1E5C76F30;
    id v16 = v7;
    id v84 = v16;
    uint64_t v17 = MEMORY[0x1AD0C36A0](v83);
    uint64_t v18 = (*(void (**)(void))(v17 + 16))();
    countLabel = v6->_countLabel;
    v6->_countLabel = (UILabel *)v18;

    v20 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v6->_countLabel setTextColor:v20];

    v80 = (void *)v17;
    uint64_t v21 = (*(void (**)(uint64_t))(v17 + 16))(v17);
    maxCountLabel = v6->_maxCountLabel;
    v6->_maxCountLabel = (UILabel *)v21;

    v23 = [MEMORY[0x1E4FB1618] systemRedColor];
    [(UILabel *)v6->_maxCountLabel setTextColor:v23];

    [(UILabel *)v6->_maxCountLabel setHidden:1];
    v24 = objc_alloc_init(SFPrivacyReportMeterBar);
    countMeter = v6->_countMeter;
    v6->_countMeter = v24;

    [(SFPrivacyReportMeterBar *)v6->_countMeter setTranslatesAutoresizingMaskIntoConstraints:0];
    [v16 addSubview:v6->_countMeter];
    v26 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
    maxCountMeterGuide = v6->_maxCountMeterGuide;
    v6->_maxCountMeterGuide = v26;

    [v16 addLayoutGuide:v6->_maxCountMeterGuide];
    v28 = [v16 layoutMarginsGuide];
    v61 = (void *)MEMORY[0x1E4F28DC8];
    v76 = [(UILabel *)v6->_domainLabel leadingAnchor];
    v74 = [v28 leadingAnchor];
    v72 = [v76 constraintEqualToAnchor:v74];
    v87[0] = v72;
    v70 = [(UILabel *)v6->_domainLabel trailingAnchor];
    v69 = [v28 trailingAnchor];
    v68 = [v70 constraintEqualToAnchor:v69];
    v87[1] = v68;
    v67 = [(UILayoutGuide *)v6->_maxCountMeterGuide leadingAnchor];
    v66 = [v28 leadingAnchor];
    v65 = [v67 constraintEqualToAnchor:v66];
    v87[2] = v65;
    v64 = [(UILabel *)v6->_maxCountLabel leadingAnchor];
    v63 = [(UILayoutGuide *)v6->_maxCountMeterGuide trailingAnchor];
    v62 = [v64 constraintEqualToSystemSpacingAfterAnchor:v63 multiplier:1.0];
    v87[3] = v62;
    v60 = [(UILabel *)v6->_maxCountLabel trailingAnchor];
    v59 = [v16 trailingAnchor];
    v58 = [v60 constraintEqualToAnchor:v59 constant:-12.0];
    v87[4] = v58;
    v57 = [(UILabel *)v6->_countLabel leadingAnchor];
    v56 = [(SFPrivacyReportMeterBar *)v6->_countMeter trailingAnchor];
    v55 = [v57 constraintEqualToSystemSpacingAfterAnchor:v56 multiplier:1.0];
    v87[5] = v55;
    v54 = [(SFPrivacyReportMeterBar *)v6->_countMeter leadingAnchor];
    v82 = v28;
    v53 = [v28 leadingAnchor];
    v52 = [v54 constraintEqualToAnchor:v53];
    v87[6] = v52;
    v51 = [(UILabel *)v6->_domainLabel topAnchor];
    v29 = [v16 topAnchor];
    v30 = [v51 constraintEqualToSystemSpacingBelowAnchor:v29 multiplier:1.0];
    v87[7] = v30;
    v81 = v16;
    v31 = [v16 bottomAnchor];
    v32 = [(UILabel *)v6->_countLabel bottomAnchor];
    v33 = [v31 constraintEqualToSystemSpacingBelowAnchor:v32 multiplier:1.0];
    v87[8] = v33;
    v34 = [(SFPrivacyReportMeterBar *)v6->_countMeter centerYAnchor];
    v35 = [(UILabel *)v6->_countLabel centerYAnchor];
    v36 = [v34 constraintEqualToAnchor:v35];
    v87[9] = v36;
    v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:10];
    [v61 activateConstraints:v37];

    if (v78)
    {
      v75 = (void *)MEMORY[0x1E4F28DC8];
      v38 = [(UILabel *)v6->_domainDetailLabel leadingAnchor];
      v39 = [v82 leadingAnchor];
      v40 = [v38 constraintEqualToAnchor:v39];
      v86[0] = v40;
      v79 = [(UILabel *)v6->_domainDetailLabel trailingAnchor];
      v77 = [v82 trailingAnchor];
      v73 = [v79 constraintEqualToAnchor:v77];
      v86[1] = v73;
      v71 = [(UILabel *)v6->_domainDetailLabel topAnchor];
      v41 = [(UILabel *)v6->_domainLabel bottomAnchor];
      v42 = [v71 constraintEqualToSystemSpacingBelowAnchor:v41 multiplier:0.25];
      v86[2] = v42;
      v43 = [(UILabel *)v6->_countLabel topAnchor];
      v44 = [(UILabel *)v6->_domainDetailLabel bottomAnchor];
      v45 = [v43 constraintEqualToSystemSpacingBelowAnchor:v44 multiplier:0.25];
      v86[3] = v45;
      v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:4];
      [v75 activateConstraints:v46];
    }
    else
    {
      v38 = [(UILabel *)v6->_countLabel topAnchor];
      v39 = [(UILabel *)v6->_domainLabel bottomAnchor];
      v40 = [v38 constraintEqualToSystemSpacingBelowAnchor:v39 multiplier:0.25];
      [v40 setActive:1];
    }

    v47 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    countFormatter = v6->_countFormatter;
    v6->_countFormatter = v47;

    [(NSNumberFormatter *)v6->_countFormatter setNumberStyle:1];
    [(SFPrivacyReportTrackingTableViewCell *)v6 _updateCountViews];
    v49 = v6;
  }
  return v6;
}

id __76__SFPrivacyReportTrackingTableViewCell_initWithDetailLabel_reuseIdentifier___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  v3 = [MEMORY[0x1E4FB17A0] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2950]];
  BOOL v4 = [v3 fontDescriptorWithSymbolicTraits:0x8000];

  v5 = [MEMORY[0x1E4FB1798] fontWithDescriptor:v4 size:0.0];
  [v2 setFont:v5];

  [v2 setNumberOfLines:1];
  [v2 setAdjustsFontForContentSizeCategory:1];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  [*(id *)(a1 + 32) addSubview:v2];

  return v2;
}

- (void)setCount:(double)a3
{
  if (self->_count != a3)
  {
    self->_count = a3;
    [(SFPrivacyReportTrackingTableViewCell *)self _updateCountViews];
  }
}

- (void)setMaxCount:(double)a3
{
  if (self->_maxCount != a3)
  {
    self->_maxCount = a3;
    [(SFPrivacyReportTrackingTableViewCell *)self _updateCountViews];
  }
}

- (void)_updateCountViews
{
  countFormatter = self->_countFormatter;
  BOOL v4 = [NSNumber numberWithDouble:self->_count];
  v5 = [(NSNumberFormatter *)countFormatter stringFromNumber:v4];
  [(UILabel *)self->_countLabel setText:v5];

  v6 = self->_countFormatter;
  v7 = [NSNumber numberWithDouble:self->_maxCount];
  v8 = [(NSNumberFormatter *)v6 stringFromNumber:v7];
  [(UILabel *)self->_maxCountLabel setText:v8];

  [(NSLayoutConstraint *)self->_countMeterWidthConstraint setActive:0];
  double maxCount = self->_maxCount;
  v10 = [(SFPrivacyReportMeterBar *)self->_countMeter widthAnchor];
  v11 = v10;
  if (maxCount <= 0.0001)
  {
    v15 = [v10 constraintEqualToConstant:0.0];
    countMeterWidthConstraint = self->_countMeterWidthConstraint;
    self->_countMeterWidthConstraint = v15;
  }
  else
  {
    countMeterWidthConstraint = [(UILayoutGuide *)self->_maxCountMeterGuide widthAnchor];
    v13 = [v11 constraintEqualToAnchor:countMeterWidthConstraint multiplier:self->_count / self->_maxCount];
    v14 = self->_countMeterWidthConstraint;
    self->_countMeterWidthConstraint = v13;
  }
  LODWORD(v16) = 1144586240;
  [(NSLayoutConstraint *)self->_countMeterWidthConstraint setPriority:v16];
  uint64_t v17 = self->_countMeterWidthConstraint;

  [(NSLayoutConstraint *)v17 setActive:1];
}

- (UILabel)domainLabel
{
  return self->_domainLabel;
}

- (UILabel)domainDetailLabel
{
  return self->_domainDetailLabel;
}

- (UILabel)countLabel
{
  return self->_countLabel;
}

- (double)count
{
  return self->_count;
}

- (double)maxCount
{
  return self->_maxCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countLabel, 0);
  objc_storeStrong((id *)&self->_domainDetailLabel, 0);
  objc_storeStrong((id *)&self->_domainLabel, 0);
  objc_storeStrong((id *)&self->_countFormatter, 0);
  objc_storeStrong((id *)&self->_countMeterWidthConstraint, 0);
  objc_storeStrong((id *)&self->_maxCountMeterGuide, 0);
  objc_storeStrong((id *)&self->_maxCountLabel, 0);

  objc_storeStrong((id *)&self->_countMeter, 0);
}

@end