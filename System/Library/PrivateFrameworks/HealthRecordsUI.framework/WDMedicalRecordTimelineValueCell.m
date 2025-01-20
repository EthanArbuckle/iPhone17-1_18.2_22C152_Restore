@interface WDMedicalRecordTimelineValueCell
+ (double)_titleLabelTopToFirstBaseline;
+ (id)_titleLabelFont;
+ (id)_unitLabelFontMultipleLines;
+ (id)_unitLabelFontSingleLine;
+ (id)_valueLabelFontMultipleLines;
+ (id)_valueLabelFontSingleLine;
- (NSLayoutConstraint)subtitleBottomConstraint;
- (NSLayoutConstraint)titleHeightConstraint;
- (NSLayoutConstraint)titleValueGapConstraint;
- (NSLayoutConstraint)titleWidthConstraint;
- (NSLayoutConstraint)valueHeightConstraint;
- (NSLayoutConstraint)valueLeftAlignConstraint;
- (NSLayoutConstraint)valueRightAlignConstraint;
- (NSLayoutConstraint)valueWidthConstraint;
- (NSString)subtitle;
- (NSString)title;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UILabel)valueLabel;
- (id)_generateValueDisplayAttributedString;
- (id)_generateValueDisplayAttributedStringWithValueFont:(id)a3 unitFont:(id)a4;
- (id)unit;
- (id)value;
- (void)setAttributedSubtitleText:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleBottomConstraint:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleHeightConstraint:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleValueGapConstraint:(id)a3;
- (void)setTitleWidthConstraint:(id)a3;
- (void)setValue:(id)a3 unit:(id)a4;
- (void)setValueHeightConstraint:(id)a3;
- (void)setValueLabel:(id)a3;
- (void)setValueLeftAlignConstraint:(id)a3;
- (void)setValueRightAlignConstraint:(id)a3;
- (void)setValueWidthConstraint:(id)a3;
- (void)setupSubviews;
- (void)updateConstraints;
@end

@implementation WDMedicalRecordTimelineValueCell

- (void)setupSubviews
{
  v120.receiver = self;
  v120.super_class = (Class)WDMedicalRecordTimelineValueCell;
  [(WDMedicalRecordGroupableCell *)&v120 setupSubviews];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(WDMedicalRecordTimelineValueCell *)self setTitleLabel:v3];

  v4 = [(id)objc_opt_class() _titleLabelFont];
  v5 = [(WDMedicalRecordTimelineValueCell *)self titleLabel];
  [v5 setFont:v4];

  v6 = [MEMORY[0x1E4FB1618] labelColor];
  v7 = [(WDMedicalRecordTimelineValueCell *)self titleLabel];
  [v7 setTextColor:v6];

  v8 = [(WDMedicalRecordTimelineValueCell *)self titleLabel];
  [v8 setNumberOfLines:8];

  v9 = [(WDMedicalRecordTimelineValueCell *)self titleLabel];
  [v9 setLineBreakMode:5];

  v10 = [(WDMedicalRecordTimelineValueCell *)self titleLabel];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  v11 = [(WDMedicalRecordTimelineValueCell *)self contentView];
  v12 = [(WDMedicalRecordTimelineValueCell *)self titleLabel];
  [v11 addSubview:v12];

  id v13 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(WDMedicalRecordTimelineValueCell *)self setSubtitleLabel:v13];

  v14 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2950] variant:1280];
  v15 = [(WDMedicalRecordTimelineValueCell *)self subtitleLabel];
  [v15 setFont:v14];

  v16 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v17 = [(WDMedicalRecordTimelineValueCell *)self subtitleLabel];
  [v17 setTextColor:v16];

  v18 = [(WDMedicalRecordTimelineValueCell *)self subtitleLabel];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

  v19 = [(WDMedicalRecordTimelineValueCell *)self contentView];
  v20 = [(WDMedicalRecordTimelineValueCell *)self subtitleLabel];
  [v19 addSubview:v20];

  id v21 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(WDMedicalRecordTimelineValueCell *)self setValueLabel:v21];

  v22 = [(WDMedicalRecordTimelineValueCell *)self valueLabel];
  [v22 setNumberOfLines:3];

  v23 = [(id)objc_opt_class() _valueLabelFontSingleLine];
  v24 = [(WDMedicalRecordTimelineValueCell *)self valueLabel];
  [v24 setFont:v23];

  v25 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_clinicalRecordValueColor");
  v26 = [(WDMedicalRecordTimelineValueCell *)self valueLabel];
  [v26 setTextColor:v25];

  v27 = [(WDMedicalRecordTimelineValueCell *)self valueLabel];
  [v27 setTranslatesAutoresizingMaskIntoConstraints:0];

  v28 = [(WDMedicalRecordTimelineValueCell *)self contentView];
  v29 = [(WDMedicalRecordTimelineValueCell *)self valueLabel];
  [v28 addSubview:v29];

  v30 = [(WDMedicalRecordTimelineValueCell *)self titleLabel];
  v31 = [v30 leadingAnchor];
  v32 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v33 = [v32 leadingAnchor];
  v34 = [v31 constraintEqualToAnchor:v33 constant:16.0];
  [v34 setActive:1];

  v35 = [(WDMedicalRecordTimelineValueCell *)self valueLabel];
  v36 = [v35 topAnchor];
  v37 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v38 = [v37 topAnchor];
  v39 = [v36 constraintEqualToAnchor:v38 constant:7.0];
  [v39 setActive:1];

  v40 = [(WDMedicalRecordTimelineValueCell *)self valueLabel];
  v41 = [v40 firstBaselineAnchor];
  v42 = [(WDMedicalRecordTimelineValueCell *)self titleLabel];
  v43 = [v42 firstBaselineAnchor];
  v44 = [v41 constraintEqualToAnchor:v43];
  [v44 setActive:1];

  v45 = [(WDMedicalRecordTimelineValueCell *)self valueLabel];
  v46 = [v45 leadingAnchor];
  v47 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v48 = [v47 leadingAnchor];
  v49 = [v46 constraintEqualToAnchor:v48 constant:16.0];
  [(WDMedicalRecordTimelineValueCell *)self setValueLeftAlignConstraint:v49];

  v50 = [(WDMedicalRecordTimelineValueCell *)self valueLabel];
  v51 = [v50 trailingAnchor];
  v52 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v53 = [v52 trailingAnchor];
  v54 = [v51 constraintEqualToAnchor:v53 constant:-16.0];
  [(WDMedicalRecordTimelineValueCell *)self setValueRightAlignConstraint:v54];

  v55 = [(WDMedicalRecordTimelineValueCell *)self titleLabel];
  v56 = [v55 trailingAnchor];
  v57 = [(WDMedicalRecordTimelineValueCell *)self valueLabel];
  v58 = [v57 leadingAnchor];
  v59 = [v56 constraintLessThanOrEqualToAnchor:v58 constant:-16.0];
  [(WDMedicalRecordTimelineValueCell *)self setTitleValueGapConstraint:v59];

  v60 = [(WDMedicalRecordTimelineValueCell *)self titleLabel];
  v61 = [v60 widthAnchor];
  v62 = [v61 constraintEqualToConstant:0.0];
  [(WDMedicalRecordTimelineValueCell *)self setTitleWidthConstraint:v62];

  v63 = [(WDMedicalRecordTimelineValueCell *)self valueLabel];
  v64 = [v63 widthAnchor];
  v65 = [v64 constraintEqualToConstant:0.0];
  [(WDMedicalRecordTimelineValueCell *)self setValueWidthConstraint:v65];

  v66 = [(WDMedicalRecordTimelineValueCell *)self titleWidthConstraint];
  [v66 setActive:1];

  v67 = [(WDMedicalRecordTimelineValueCell *)self valueWidthConstraint];
  [v67 setActive:1];

  v68 = [(WDMedicalRecordTimelineValueCell *)self titleLabel];
  v69 = [v68 heightAnchor];
  v70 = [v69 constraintEqualToConstant:0.0];
  [(WDMedicalRecordTimelineValueCell *)self setTitleHeightConstraint:v70];

  v71 = [(WDMedicalRecordTimelineValueCell *)self valueLabel];
  v72 = [v71 heightAnchor];
  v73 = [v72 constraintEqualToConstant:0.0];
  [(WDMedicalRecordTimelineValueCell *)self setValueHeightConstraint:v73];

  v74 = [(WDMedicalRecordTimelineValueCell *)self titleHeightConstraint];
  LODWORD(v75) = 1148829696;
  [v74 setPriority:v75];

  v76 = [(WDMedicalRecordTimelineValueCell *)self valueHeightConstraint];
  LODWORD(v77) = 1148829696;
  [v76 setPriority:v77];

  v78 = [(WDMedicalRecordTimelineValueCell *)self titleHeightConstraint];
  [v78 setActive:1];

  v79 = [(WDMedicalRecordTimelineValueCell *)self valueHeightConstraint];
  [v79 setActive:1];

  v80 = [(WDMedicalRecordTimelineValueCell *)self subtitleLabel];
  v81 = [v80 leadingAnchor];
  v82 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v83 = [v82 leadingAnchor];
  v84 = [v81 constraintEqualToAnchor:v83 constant:16.0];
  [v84 setActive:1];

  v85 = [(WDMedicalRecordTimelineValueCell *)self subtitleLabel];
  v86 = [v85 trailingAnchor];
  v87 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v88 = [v87 trailingAnchor];
  v89 = [v86 constraintEqualToAnchor:v88 constant:-16.0];
  [v89 setActive:1];

  v90 = [(WDMedicalRecordTimelineValueCell *)self subtitleLabel];
  v91 = [v90 bottomAnchor];
  v92 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v93 = [v92 bottomAnchor];
  v94 = [v91 constraintEqualToAnchor:v93 constant:-12.0];
  [v94 setActive:1];

  v95 = [(WDMedicalRecordTimelineValueCell *)self subtitleLabel];
  v96 = [v95 topAnchor];
  v97 = [(WDMedicalRecordTimelineValueCell *)self valueLabel];
  v98 = [v97 bottomAnchor];
  v99 = [v96 constraintGreaterThanOrEqualToAnchor:v98 constant:2.0];
  [v99 setActive:1];

  v100 = [(WDMedicalRecordTimelineValueCell *)self subtitleLabel];
  v101 = [v100 topAnchor];
  v102 = [(WDMedicalRecordTimelineValueCell *)self titleLabel];
  v103 = [v102 bottomAnchor];
  v104 = [v101 constraintGreaterThanOrEqualToAnchor:v103 constant:2.0];
  [v104 setActive:1];

  v105 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v106 = [v105 bottomAnchor];
  v107 = [(WDMedicalRecordTimelineValueCell *)self valueLabel];
  v108 = [v107 bottomAnchor];
  v109 = [v106 constraintGreaterThanOrEqualToAnchor:v108 constant:10.0];
  [v109 setActive:1];

  v110 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v111 = [v110 bottomAnchor];
  v112 = [(WDMedicalRecordTimelineValueCell *)self titleLabel];
  v113 = [v112 bottomAnchor];
  v114 = [v111 constraintGreaterThanOrEqualToAnchor:v113 constant:10.0];
  [v114 setActive:1];

  v115 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v116 = [v115 bottomAnchor];
  v117 = [(WDMedicalRecordTimelineValueCell *)self subtitleLabel];
  v118 = [v117 lastBaselineAnchor];
  v119 = [v116 constraintGreaterThanOrEqualToAnchor:v118 constant:12.0];
  [(WDMedicalRecordTimelineValueCell *)self setSubtitleBottomConstraint:v119];
}

- (void)updateConstraints
{
  v19.receiver = self;
  v19.super_class = (Class)WDMedicalRecordTimelineValueCell;
  [(WDMedicalRecordTimelineValueCell *)&v19 updateConstraints];
  id v3 = [(WDMedicalRecordTimelineValueCell *)self contentView];
  [v3 frame];
  CGFloat v4 = CGRectGetWidth(v20) + -32.0;

  v5 = [(WDMedicalRecordTimelineValueCell *)self valueLabel];
  objc_msgSend(v5, "sizeThatFits:", v4 * 0.67 + -16.0, 1.79769313e308);
  double v7 = v6;
  double v9 = v8;

  v10 = [(WDMedicalRecordTimelineValueCell *)self titleLabel];
  objc_msgSend(v10, "sizeThatFits:", v4 - v7 + -48.0, 1.79769313e308);
  double v12 = v11;
  double v14 = v13;

  v15 = [(WDMedicalRecordTimelineValueCell *)self titleWidthConstraint];
  [v15 setConstant:v12];

  v16 = [(WDMedicalRecordTimelineValueCell *)self valueWidthConstraint];
  [v16 setConstant:v7];

  v17 = [(WDMedicalRecordTimelineValueCell *)self titleHeightConstraint];
  [v17 setConstant:v14];

  v18 = [(WDMedicalRecordTimelineValueCell *)self valueHeightConstraint];
  [v18 setConstant:v9];
}

- (void)setTitle:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(NSString *)self->_titleString isEqualToString:v4])
  {
    v5 = (NSString *)[v4 copy];
    titleString = self->_titleString;
    self->_titleString = v5;

    double v7 = self->_titleString;
    double v8 = [(WDMedicalRecordTimelineValueCell *)self titleLabel];
    [v8 setText:v7];

    NSUInteger v9 = [(NSString *)self->_titleString length];
    v10 = (void *)MEMORY[0x1E4F28DC8];
    if (v9)
    {
      double v11 = [(WDMedicalRecordTimelineValueCell *)self valueLeftAlignConstraint];
      v24[0] = v11;
      double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
      [v10 deactivateConstraints:v12];

      double v13 = (void *)MEMORY[0x1E4F28DC8];
      double v14 = [(WDMedicalRecordTimelineValueCell *)self valueRightAlignConstraint];
      v23[0] = v14;
      v15 = [(WDMedicalRecordTimelineValueCell *)self titleValueGapConstraint];
      v23[1] = v15;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
      [v13 activateConstraints:v16];
    }
    else
    {
      v17 = [(WDMedicalRecordTimelineValueCell *)self valueRightAlignConstraint];
      v22[0] = v17;
      v18 = [(WDMedicalRecordTimelineValueCell *)self titleValueGapConstraint];
      v22[1] = v18;
      objc_super v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
      [v10 deactivateConstraints:v19];

      CGRect v20 = (void *)MEMORY[0x1E4F28DC8];
      double v14 = [(WDMedicalRecordTimelineValueCell *)self valueLeftAlignConstraint];
      id v21 = v14;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
      [v20 activateConstraints:v15];
    }

    [(WDMedicalRecordTimelineValueCell *)self setNeedsUpdateConstraints];
    [(WDMedicalRecordTimelineValueCell *)self setNeedsLayout];
  }
}

- (NSString)title
{
  return self->_titleString;
}

- (void)setSubtitle:(id)a3
{
  id v10 = a3;
  if (!-[NSString isEqualToString:](self->_subtitleString, "isEqualToString:"))
  {
    id v4 = (NSString *)[v10 copy];
    subtitleString = self->_subtitleString;
    self->_subtitleString = v4;

    double v6 = self->_subtitleString;
    double v7 = [(WDMedicalRecordTimelineValueCell *)self subtitleLabel];
    [v7 setText:v6];

    BOOL v8 = [(NSString *)self->_subtitleString length] != 0;
    NSUInteger v9 = [(WDMedicalRecordTimelineValueCell *)self subtitleBottomConstraint];
    [v9 setActive:v8];

    [(WDMedicalRecordTimelineValueCell *)self setNeedsUpdateConstraints];
    [(WDMedicalRecordTimelineValueCell *)self setNeedsLayout];
  }
}

- (NSString)subtitle
{
  return self->_subtitleString;
}

- (id)value
{
  return self->_valueString;
}

- (id)unit
{
  return self->_unitString;
}

- (void)setValue:(id)a3 unit:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if (![(NSString *)self->_valueString isEqualToString:v13]
    || ![(NSString *)self->_unitString isEqualToString:v6])
  {
    double v7 = (NSString *)[v13 copy];
    valueString = self->_valueString;
    self->_valueString = v7;

    NSUInteger v9 = (NSString *)[v6 copy];
    unitString = self->_unitString;
    self->_unitString = v9;

    double v11 = [(WDMedicalRecordTimelineValueCell *)self _generateValueDisplayAttributedString];
    double v12 = [(WDMedicalRecordTimelineValueCell *)self valueLabel];
    [v12 setAttributedText:v11];

    [(WDMedicalRecordTimelineValueCell *)self setNeedsUpdateConstraints];
  }
}

- (void)setAttributedSubtitleText:(id)a3
{
  id v4 = a3;
  id v5 = [(WDMedicalRecordTimelineValueCell *)self subtitleLabel];
  [v5 setAttributedText:v4];
}

- (id)_generateValueDisplayAttributedString
{
  id v3 = [(id)objc_opt_class() _valueLabelFontSingleLine];
  id v4 = [(id)objc_opt_class() _unitLabelFontSingleLine];
  id v5 = [(WDMedicalRecordTimelineValueCell *)self _generateValueDisplayAttributedStringWithValueFont:v3 unitFont:v4];
  id v6 = [(WDMedicalRecordTimelineValueCell *)self contentView];
  [v6 bounds];
  CGFloat v7 = (CGRectGetWidth(v23) + -32.0) * 0.67 + -16.0;

  objc_msgSend(v5, "boundingRectWithSize:options:context:", 1, 0, v7, 1.79769313e308);
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [v3 lineHeight];
  double v17 = v16;
  v24.origin.x = v9;
  v24.origin.y = v11;
  v24.size.width = v13;
  v24.size.height = v15;
  if (CGRectGetHeight(v24) + v17 * -2.0 >= 2.22044605e-16)
  {
    uint64_t v18 = [(id)objc_opt_class() _valueLabelFontMultipleLines];

    uint64_t v19 = [(id)objc_opt_class() _unitLabelFontMultipleLines];

    uint64_t v20 = [(WDMedicalRecordTimelineValueCell *)self _generateValueDisplayAttributedStringWithValueFont:v18 unitFont:v19];

    id v5 = (void *)v20;
    id v4 = (void *)v19;
    id v3 = (void *)v18;
  }

  return v5;
}

- (id)_generateValueDisplayAttributedStringWithValueFont:(id)a3 unitFont:(id)a4
{
  v43[2] = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v8 = [(WDMedicalRecordTimelineValueCell *)self value];
  uint64_t v9 = [v8 length];

  double v10 = (void *)MEMORY[0x1E4FB06F8];
  CGFloat v11 = (uint64_t *)MEMORY[0x1E4FB0700];
  double v12 = &stru_1F1D9FF30;
  if (v9)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v14 = [(WDMedicalRecordTimelineValueCell *)self value];
    CGFloat v15 = (void *)v14;
    if (v14) {
      double v12 = (__CFString *)v14;
    }
    uint64_t v16 = *v11;
    v42[0] = *v10;
    v42[1] = v16;
    v43[0] = v36;
    double v17 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_clinicalRecordValueColor", v36);
    v43[1] = v17;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];
    uint64_t v19 = (void *)[v13 initWithString:v12 attributes:v18];

    CGFloat v11 = (uint64_t *)MEMORY[0x1E4FB0700];
    [v7 addObject:v19];
  }
  uint64_t v20 = [(WDMedicalRecordTimelineValueCell *)self unit];
  uint64_t v21 = [v20 length];

  if (v21)
  {
    if ([v7 count])
    {
      id v22 = objc_alloc(MEMORY[0x1E4F28B18]);
      uint64_t v23 = *v10;
      uint64_t v40 = *v10;
      id v41 = v6;
      CGRect v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      v25 = (void *)[v22 initWithString:@" " attributes:v24];

      [v7 addObject:v25];
    }
    else
    {
      uint64_t v23 = *v10;
    }
    id v26 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v27 = [(WDMedicalRecordTimelineValueCell *)self unit];
    v28 = (void *)v27;
    if (v27) {
      v29 = (__CFString *)v27;
    }
    else {
      v29 = &stru_1F1D9FF30;
    }
    uint64_t v30 = *v11;
    v38[0] = v23;
    v38[1] = v30;
    v39[0] = v6;
    v31 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_clinicalRecordUnitColor");
    v39[1] = v31;
    v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
    v33 = (void *)[v26 initWithString:v29 attributes:v32];

    [v7 addObject:v33];
  }
  if ([v7 count])
  {
    v34 = HKUIJoinAttributedStringsForLocale();
  }
  else
  {
    v34 = 0;
  }

  return v34;
}

+ (id)_titleLabelFont
{
  return (id)[MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28C8] design:*MEMORY[0x1E4FB0938] variant:1024];
}

+ (double)_titleLabelTopToFirstBaseline
{
  v2 = [(id)objc_opt_class() _titleLabelFont];
  [v2 _scaledValueForValue:27.0];
  double v4 = v3;

  return v4;
}

+ (id)_valueLabelFontSingleLine
{
  return (id)[MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2988] addingSymbolicTraits:0x8000 design:*MEMORY[0x1E4FB0938] weight:*MEMORY[0x1E4FB09E0]];
}

+ (id)_unitLabelFontSingleLine
{
  return (id)[MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2950] addingSymbolicTraits:0x8000 weight:*MEMORY[0x1E4FB09E0]];
}

+ (id)_valueLabelFontMultipleLines
{
  return (id)[MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2998] variant:66560];
}

+ (id)_unitLabelFontMultipleLines
{
  return (id)[MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2950] variant:1280];
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

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
}

- (NSLayoutConstraint)titleWidthConstraint
{
  return self->_titleWidthConstraint;
}

- (void)setTitleWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)valueWidthConstraint
{
  return self->_valueWidthConstraint;
}

- (void)setValueWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleHeightConstraint
{
  return self->_titleHeightConstraint;
}

- (void)setTitleHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)valueHeightConstraint
{
  return self->_valueHeightConstraint;
}

- (void)setValueHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleValueGapConstraint
{
  return self->_titleValueGapConstraint;
}

- (void)setTitleValueGapConstraint:(id)a3
{
}

- (NSLayoutConstraint)valueLeftAlignConstraint
{
  return self->_valueLeftAlignConstraint;
}

- (void)setValueLeftAlignConstraint:(id)a3
{
}

- (NSLayoutConstraint)valueRightAlignConstraint
{
  return self->_valueRightAlignConstraint;
}

- (void)setValueRightAlignConstraint:(id)a3
{
}

- (NSLayoutConstraint)subtitleBottomConstraint
{
  return self->_subtitleBottomConstraint;
}

- (void)setSubtitleBottomConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleBottomConstraint, 0);
  objc_storeStrong((id *)&self->_valueRightAlignConstraint, 0);
  objc_storeStrong((id *)&self->_valueLeftAlignConstraint, 0);
  objc_storeStrong((id *)&self->_titleValueGapConstraint, 0);
  objc_storeStrong((id *)&self->_valueHeightConstraint, 0);
  objc_storeStrong((id *)&self->_titleHeightConstraint, 0);
  objc_storeStrong((id *)&self->_valueWidthConstraint, 0);
  objc_storeStrong((id *)&self->_titleWidthConstraint, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_unitString, 0);
  objc_storeStrong((id *)&self->_valueString, 0);
  objc_storeStrong((id *)&self->_subtitleString, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
}

@end