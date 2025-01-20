@interface HRMetadataEducationTableViewCell
+ (id)defaultReuseIdentifier;
- (HRMetadataEducationTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSLayoutConstraint)bodyBottomAnchorToBottomConstraint;
- (NSLayoutConstraint)titleBaselineToBodyBaselineConstraint;
- (NSLayoutConstraint)topToTitleBaselineConstraint;
- (NSString)bodyText;
- (NSString)titleText;
- (UILabel)bodyLabel;
- (UILabel)titleLabel;
- (double)_bodyBottomAnchorToBottom;
- (double)_titleBaselineToBodyBaseline;
- (double)_topToTitleBaseline;
- (id)_bodyLabelFont;
- (id)_bodyLabelFontTextStyle;
- (id)_titleLabelFont;
- (id)_titleLabelFontTextStyle;
- (void)_setUpConstraints;
- (void)_setUpUI;
- (void)_updateForCurrentSizeCategory;
- (void)setBodyBottomAnchorToBottomConstraint:(id)a3;
- (void)setBodyLabel:(id)a3;
- (void)setBodyText:(id)a3;
- (void)setTitleBaselineToBodyBaselineConstraint:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setTopToTitleBaselineConstraint:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HRMetadataEducationTableViewCell

+ (id)defaultReuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (HRMetadataEducationTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HRMetadataEducationTableViewCell;
  v4 = [(HRMetadataEducationTableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(HRMetadataEducationTableViewCell *)v4 setSelectionStyle:0];
    [(HRMetadataEducationTableViewCell *)v5 _setUpUI];
    [(HRMetadataEducationTableViewCell *)v5 _setUpConstraints];
  }
  return v5;
}

- (void)setTitleText:(id)a3
{
  v5 = (NSString *)a3;
  titleText = self->_titleText;
  if (titleText != v5)
  {
    v9 = v5;
    if (!titleText || !-[NSString isEqualToString:](v5, "isEqualToString:"))
    {
      objc_storeStrong((id *)&self->_titleText, a3);
      objc_super v7 = [(HRMetadataEducationTableViewCell *)self titleLabel];
      [v7 setText:v9];

      v8 = [(HRMetadataEducationTableViewCell *)self contentView];
      [v8 setNeedsLayout];
    }
  }
  MEMORY[0x270F9A758]();
}

- (void)setBodyText:(id)a3
{
  v5 = (NSString *)a3;
  bodyText = self->_bodyText;
  if (bodyText != v5)
  {
    v9 = v5;
    if (!bodyText || !-[NSString isEqualToString:](v5, "isEqualToString:"))
    {
      objc_storeStrong((id *)&self->_bodyText, a3);
      objc_super v7 = [(HRMetadataEducationTableViewCell *)self bodyLabel];
      [v7 setText:v9];

      v8 = [(HRMetadataEducationTableViewCell *)self contentView];
      [v8 setNeedsLayout];
    }
  }
  MEMORY[0x270F9A758]();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HRMetadataEducationTableViewCell;
  [(HRMetadataEducationTableViewCell *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    v5 = [(HRMetadataEducationTableViewCell *)self traitCollection];
    v6 = [v5 preferredContentSizeCategory];
    objc_super v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0) {
      [(HRMetadataEducationTableViewCell *)self _updateForCurrentSizeCategory];
    }
  }
}

- (void)_setUpUI
{
  [(HRMetadataEducationTableViewCell *)self setSelectionStyle:0];
  id v3 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HRMetadataEducationTableViewCell *)self setTitleLabel:v3];

  id v4 = [(HRMetadataEducationTableViewCell *)self _titleLabelFont];
  v5 = [(HRMetadataEducationTableViewCell *)self titleLabel];
  [v5 setFont:v4];

  v6 = [MEMORY[0x263F1C550] blackColor];
  objc_super v7 = [(HRMetadataEducationTableViewCell *)self titleLabel];
  [v7 setTextColor:v6];

  char v8 = [(HRMetadataEducationTableViewCell *)self titleLabel];
  [v8 setNumberOfLines:0];

  objc_super v9 = [(HRMetadataEducationTableViewCell *)self titleLabel];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  v10 = [(HRMetadataEducationTableViewCell *)self titleLabel];
  [v10 setAdjustsFontForContentSizeCategory:1];

  v11 = [(HRMetadataEducationTableViewCell *)self contentView];
  v12 = [(HRMetadataEducationTableViewCell *)self titleLabel];
  [v11 addSubview:v12];

  id v13 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HRMetadataEducationTableViewCell *)self setBodyLabel:v13];

  v14 = [(HRMetadataEducationTableViewCell *)self _bodyLabelFont];
  v15 = [(HRMetadataEducationTableViewCell *)self bodyLabel];
  [v15 setFont:v14];

  v16 = [MEMORY[0x263F1C550] blackColor];
  v17 = [(HRMetadataEducationTableViewCell *)self bodyLabel];
  [v17 setTextColor:v16];

  v18 = [(HRMetadataEducationTableViewCell *)self bodyLabel];
  [v18 setNumberOfLines:0];

  v19 = [(HRMetadataEducationTableViewCell *)self bodyLabel];
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];

  v20 = [(HRMetadataEducationTableViewCell *)self bodyLabel];
  [v20 setAdjustsFontForContentSizeCategory:1];

  id v22 = [(HRMetadataEducationTableViewCell *)self contentView];
  v21 = [(HRMetadataEducationTableViewCell *)self bodyLabel];
  [v22 addSubview:v21];
}

- (void)_setUpConstraints
{
  id v3 = [(HRMetadataEducationTableViewCell *)self titleLabel];
  id v4 = [(HRMetadataEducationTableViewCell *)self contentView];
  v5 = [v4 layoutMarginsGuide];
  objc_msgSend(v3, "hrui_alignHorizontalConstraintsWithGuide:insets:", v5, *MEMORY[0x263F1C228], *(double *)(MEMORY[0x263F1C228] + 8), *(double *)(MEMORY[0x263F1C228] + 16), *(double *)(MEMORY[0x263F1C228] + 24));

  v6 = [(HRMetadataEducationTableViewCell *)self bodyLabel];
  objc_super v7 = [(HRMetadataEducationTableViewCell *)self titleLabel];
  objc_msgSend(v6, "hk_alignHorizontalConstraintsWithView:margin:", v7, 0.0);

  char v8 = [(HRMetadataEducationTableViewCell *)self titleLabel];
  objc_super v9 = [v8 firstBaselineAnchor];
  v10 = [(HRMetadataEducationTableViewCell *)self contentView];
  v11 = [v10 topAnchor];
  [(HRMetadataEducationTableViewCell *)self _topToTitleBaseline];
  v12 = objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11);
  [(HRMetadataEducationTableViewCell *)self setTopToTitleBaselineConstraint:v12];

  id v13 = [(HRMetadataEducationTableViewCell *)self bodyLabel];
  v14 = [v13 firstBaselineAnchor];
  v15 = [(HRMetadataEducationTableViewCell *)self titleLabel];
  v16 = [v15 lastBaselineAnchor];
  [(HRMetadataEducationTableViewCell *)self _titleBaselineToBodyBaseline];
  v17 = objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16);
  [(HRMetadataEducationTableViewCell *)self setTitleBaselineToBodyBaselineConstraint:v17];

  v18 = [(HRMetadataEducationTableViewCell *)self contentView];
  v19 = [v18 bottomAnchor];
  v20 = [(HRMetadataEducationTableViewCell *)self bodyLabel];
  v21 = [v20 bottomAnchor];
  [(HRMetadataEducationTableViewCell *)self _bodyBottomAnchorToBottom];
  id v22 = objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21);
  [(HRMetadataEducationTableViewCell *)self setBodyBottomAnchorToBottomConstraint:v22];

  v23 = [(HRMetadataEducationTableViewCell *)self topToTitleBaselineConstraint];
  [v23 setActive:1];

  v24 = [(HRMetadataEducationTableViewCell *)self titleBaselineToBodyBaselineConstraint];
  [v24 setActive:1];

  id v25 = [(HRMetadataEducationTableViewCell *)self bodyBottomAnchorToBottomConstraint];
  [v25 setActive:1];
}

- (void)_updateForCurrentSizeCategory
{
  [(HRMetadataEducationTableViewCell *)self _topToTitleBaseline];
  double v4 = v3;
  v5 = [(HRMetadataEducationTableViewCell *)self topToTitleBaselineConstraint];
  [v5 setConstant:v4];

  [(HRMetadataEducationTableViewCell *)self _titleBaselineToBodyBaseline];
  double v7 = v6;
  char v8 = [(HRMetadataEducationTableViewCell *)self titleBaselineToBodyBaselineConstraint];
  [v8 setConstant:v7];

  [(HRMetadataEducationTableViewCell *)self _bodyBottomAnchorToBottom];
  double v10 = v9;
  id v11 = [(HRMetadataEducationTableViewCell *)self bodyBottomAnchorToBottomConstraint];
  [v11 setConstant:v10];
}

- (id)_titleLabelFontTextStyle
{
  return (id)*MEMORY[0x263F1D300];
}

- (id)_bodyLabelFontTextStyle
{
  return (id)*MEMORY[0x263F1D260];
}

- (id)_titleLabelFont
{
  v2 = (void *)MEMORY[0x263F1C658];
  double v3 = [(HRMetadataEducationTableViewCell *)self _titleLabelFontTextStyle];
  double v4 = objc_msgSend(v2, "hk_preferredFontForTextStyle:symbolicTraits:", v3, 32770);

  return v4;
}

- (id)_bodyLabelFont
{
  v2 = (void *)MEMORY[0x263F1C658];
  double v3 = [(HRMetadataEducationTableViewCell *)self _bodyLabelFontTextStyle];
  double v4 = objc_msgSend(v2, "hk_preferredFontForTextStyle:symbolicTraits:", v3, 0x8000);

  return v4;
}

- (double)_topToTitleBaseline
{
  v2 = (void *)MEMORY[0x263F1C668];
  double v3 = [(HRMetadataEducationTableViewCell *)self _titleLabelFontTextStyle];
  double v4 = [v2 metricsForTextStyle:v3];

  [v4 scaledValueForValue:44.0];
  double v6 = v5;

  return v6;
}

- (double)_titleBaselineToBodyBaseline
{
  v2 = (void *)MEMORY[0x263F1C668];
  double v3 = [(HRMetadataEducationTableViewCell *)self _titleLabelFontTextStyle];
  double v4 = [v2 metricsForTextStyle:v3];

  [v4 scaledValueForValue:28.0];
  double v6 = v5;

  return v6;
}

- (double)_bodyBottomAnchorToBottom
{
  v2 = (void *)MEMORY[0x263F1C668];
  double v3 = [(HRMetadataEducationTableViewCell *)self _bodyLabelFontTextStyle];
  double v4 = [v2 metricsForTextStyle:v3];

  [v4 scaledValueForValue:28.0];
  double v6 = v5;

  return v6;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)bodyText
{
  return self->_bodyText;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void)setBodyLabel:(id)a3
{
}

- (NSLayoutConstraint)topToTitleBaselineConstraint
{
  return self->_topToTitleBaselineConstraint;
}

- (void)setTopToTitleBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleBaselineToBodyBaselineConstraint
{
  return self->_titleBaselineToBodyBaselineConstraint;
}

- (void)setTitleBaselineToBodyBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)bodyBottomAnchorToBottomConstraint
{
  return self->_bodyBottomAnchorToBottomConstraint;
}

- (void)setBodyBottomAnchorToBottomConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyBottomAnchorToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_titleBaselineToBodyBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_topToTitleBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_bodyText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

@end