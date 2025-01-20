@interface HRBulletedIndentedLabel
+ (id)_bodyFont;
+ (id)_bodyFontTextStyle;
- (HRBulletedIndentedLabel)initWithText:(id)a3;
- (NSString)text;
- (UILabel)label;
- (id)firstBaselineAnchor;
- (id)lastBaselineAnchor;
- (void)_setUpConstraints;
- (void)_setUpUI;
- (void)_updateLeadingDetailAttributedTextSize;
- (void)setLabel:(id)a3;
- (void)setText:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HRBulletedIndentedLabel

- (HRBulletedIndentedLabel)initWithText:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HRBulletedIndentedLabel;
  v6 = -[HRBulletedIndentedLabel initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_text, a3);
    [(HRBulletedIndentedLabel *)v7 _setUpUI];
    [(HRBulletedIndentedLabel *)v7 _setUpConstraints];
  }

  return v7;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
  [(HRBulletedIndentedLabel *)self _updateLeadingDetailAttributedTextSize];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v9 = a3;
  if (!v9) {
    goto LABEL_3;
  }
  v4 = [v9 preferredContentSizeCategory];
  id v5 = [(HRBulletedIndentedLabel *)self traitCollection];
  v6 = [v5 preferredContentSizeCategory];
  char v7 = [v4 isEqualToString:v6];

  v8 = v9;
  if ((v7 & 1) == 0)
  {
LABEL_3:
    [(HRBulletedIndentedLabel *)self _updateLeadingDetailAttributedTextSize];
    [(HRBulletedIndentedLabel *)self setNeedsUpdateConstraints];
    v8 = v9;
  }
}

- (void)_setUpUI
{
  id v3 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HRBulletedIndentedLabel *)self setLabel:v3];

  v4 = [(HRBulletedIndentedLabel *)self label];
  [v4 setAdjustsFontForContentSizeCategory:1];

  id v5 = [(HRBulletedIndentedLabel *)self label];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [(HRBulletedIndentedLabel *)self label];
  [v6 setNumberOfLines:0];

  char v7 = [(HRBulletedIndentedLabel *)self label];
  [(HRBulletedIndentedLabel *)self addSubview:v7];

  [(HRBulletedIndentedLabel *)self _updateLeadingDetailAttributedTextSize];
}

- (void)_setUpConstraints
{
  id v3 = [(HRBulletedIndentedLabel *)self label];
  objc_msgSend(v3, "hk_alignConstraintsWithView:", self);
}

- (void)_updateLeadingDetailAttributedTextSize
{
  id v3 = (void *)MEMORY[0x263F1C658];
  v4 = [(id)objc_opt_class() _bodyFontTextStyle];
  id v5 = [v3 preferredFontForTextStyle:v4];
  v6 = [(HRBulletedIndentedLabel *)self label];
  [v6 setFont:v5];

  char v7 = (void *)MEMORY[0x263F089B8];
  id v11 = [(HRBulletedIndentedLabel *)self text];
  v8 = [(id)objc_opt_class() _bodyFontTextStyle];
  id v9 = objc_msgSend(v7, "hrui_bulletedString:textStyle:", v11, v8);
  v10 = [(HRBulletedIndentedLabel *)self label];
  [v10 setAttributedText:v9];
}

- (id)firstBaselineAnchor
{
  v2 = [(HRBulletedIndentedLabel *)self label];
  id v3 = [v2 firstBaselineAnchor];

  return v3;
}

- (id)lastBaselineAnchor
{
  v2 = [(HRBulletedIndentedLabel *)self label];
  id v3 = [v2 lastBaselineAnchor];

  return v3;
}

+ (id)_bodyFontTextStyle
{
  return (id)*MEMORY[0x263F1D260];
}

+ (id)_bodyFont
{
  v2 = (void *)MEMORY[0x263F1C658];
  id v3 = [(id)objc_opt_class() _bodyFontTextStyle];
  v4 = [v2 preferredFontForTextStyle:v3];

  return v4;
}

- (NSString)text
{
  return self->_text;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end