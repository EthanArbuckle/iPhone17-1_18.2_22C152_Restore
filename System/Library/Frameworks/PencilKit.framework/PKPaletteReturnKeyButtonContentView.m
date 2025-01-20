@interface PKPaletteReturnKeyButtonContentView
- (BOOL)useCompactLayout;
- (NSString)text;
- (PKPaletteReturnKeyButtonContentView)initWithFrame:(CGRect)a3;
- (UIColor)textColor;
- (UIImageView)imageView;
- (int64_t)layoutOrientation;
- (void)_updateUI;
- (void)setImageView:(id)a3;
- (void)setLayoutOrientation:(int64_t)a3;
- (void)setText:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setUseCompactLayout:(BOOL)a3;
@end

@implementation PKPaletteReturnKeyButtonContentView

- (PKPaletteReturnKeyButtonContentView)initWithFrame:(CGRect)a3
{
  v41[6] = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)PKPaletteReturnKeyButtonContentView;
  v3 = -[PKPaletteReturnKeyButtonContentView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4FB1C60]);
    stackView = v3->_stackView;
    v3->_stackView = v4;

    [(UIStackView *)v3->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v3->_stackView setAlignment:3];
    [(UIStackView *)v3->_stackView setSpacing:4.0];
    [(PKPaletteReturnKeyButtonContentView *)v3 addSubview:v3->_stackView];
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x2050000000;
    v6 = (void *)_MergedGlobals_5;
    uint64_t v40 = _MergedGlobals_5;
    if (!_MergedGlobals_5)
    {
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __getTUICandidateLabelClass_block_invoke;
      v36[3] = &unk_1E64C5478;
      v36[4] = &v37;
      __getTUICandidateLabelClass_block_invoke((uint64_t)v36);
      v6 = (void *)v38[3];
    }
    v7 = v6;
    _Block_object_dispose(&v37, 8);
    v8 = (TUICandidateLabel *)objc_alloc_init(v7);
    label = v3->_label;
    v3->_label = v8;

    v10 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.0];
    [(TUICandidateLabel *)v3->_label setFont:v10];

    [(TUICandidateLabel *)v3->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v3->_stackView addArrangedSubview:v3->_label];
    v11 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    imageView = v3->_imageView;
    v3->_imageView = v11;

    [(UIImageView *)v3->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIImageView *)v3->_imageView setTintColor:v13];

    [(UIStackView *)v3->_stackView addArrangedSubview:v3->_imageView];
    v14 = [(TUICandidateLabel *)v3->_label widthAnchor];
    uint64_t v15 = [v14 constraintEqualToConstant:0.0];
    labelWidthConstraint = v3->_labelWidthConstraint;
    v3->_labelWidthConstraint = (NSLayoutConstraint *)v15;

    v17 = [(TUICandidateLabel *)v3->_label heightAnchor];
    uint64_t v18 = [v17 constraintEqualToConstant:0.0];
    labelHeightConstraint = v3->_labelHeightConstraint;
    v3->_labelHeightConstraint = (NSLayoutConstraint *)v18;

    v29 = (void *)MEMORY[0x1E4F28DC8];
    v34 = [(PKPaletteReturnKeyButtonContentView *)v3 centerXAnchor];
    v33 = [(UIStackView *)v3->_stackView centerXAnchor];
    v32 = [v34 constraintEqualToAnchor:v33];
    v41[0] = v32;
    v31 = [(PKPaletteReturnKeyButtonContentView *)v3 centerYAnchor];
    v30 = [(UIStackView *)v3->_stackView centerYAnchor];
    v20 = [v31 constraintEqualToAnchor:v30];
    v41[1] = v20;
    v21 = [(PKPaletteReturnKeyButtonContentView *)v3 widthAnchor];
    v22 = [(UIStackView *)v3->_stackView widthAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    v41[2] = v23;
    v24 = [(PKPaletteReturnKeyButtonContentView *)v3 heightAnchor];
    v25 = [(UIStackView *)v3->_stackView heightAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    v41[3] = v26;
    v41[4] = v3->_labelWidthConstraint;
    v41[5] = v3->_labelHeightConstraint;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:6];
    [v29 activateConstraints:v27];

    [(PKPaletteReturnKeyButtonContentView *)v3 _updateUI];
  }
  return v3;
}

- (void)setText:(id)a3
{
  id v4 = a3;
  v5 = self->_text;
  v6 = (NSString *)v4;
  v11 = v6;
  if (v5 == v6)
  {

LABEL_9:
    v8 = v11;
    goto LABEL_10;
  }
  if (!v6 || !v5)
  {

    v8 = v11;
    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v5 isEqualToString:v6];

  v8 = v11;
  if (!v7)
  {
LABEL_8:
    v9 = (NSString *)[(NSString *)v8 copy];
    text = self->_text;
    self->_text = v9;

    [(PKPaletteReturnKeyButtonContentView *)self _updateUI];
    goto LABEL_9;
  }
LABEL_10:
}

- (UIColor)textColor
{
  return (UIColor *)[(TUICandidateLabel *)self->_label textColor];
}

- (void)setTextColor:(id)a3
{
}

- (void)setLayoutOrientation:(int64_t)a3
{
  if (self->_layoutOrientation != a3)
  {
    self->_layoutOrientation = a3;
    [(PKPaletteReturnKeyButtonContentView *)self _updateUI];
  }
}

- (void)setUseCompactLayout:(BOOL)a3
{
  if (self->_useCompactLayout != a3)
  {
    self->_useCompactLayout = a3;
    [(PKPaletteReturnKeyButtonContentView *)self _updateUI];
  }
}

- (void)_updateUI
{
  [(TUICandidateLabel *)self->_label setHidden:[(PKPaletteReturnKeyButtonContentView *)self useCompactLayout]];
  v3 = [(PKPaletteReturnKeyButtonContentView *)self text];
  [(TUICandidateLabel *)self->_label setText:v3];

  [(TUICandidateLabel *)self->_label setLayoutOrientation:[(PKPaletteReturnKeyButtonContentView *)self layoutOrientation]];
  id v4 = objc_opt_class();
  v5 = [(PKPaletteReturnKeyButtonContentView *)self text];
  v6 = [(TUICandidateLabel *)self->_label font];
  objc_msgSend(v4, "lineWidthForText:font:layoutOrientation:", v5, v6, -[PKPaletteReturnKeyButtonContentView layoutOrientation](self, "layoutOrientation"));
  double v8 = v7;

  int64_t v9 = [(PKPaletteReturnKeyButtonContentView *)self layoutOrientation];
  if (v9) {
    double v10 = 36.0;
  }
  else {
    double v10 = v8;
  }
  if (!v9) {
    double v8 = 36.0;
  }
  [(UIStackView *)self->_stackView setAxis:v9 != 0];
  [(NSLayoutConstraint *)self->_labelWidthConstraint setConstant:v10];
  labelHeightConstraint = self->_labelHeightConstraint;

  [(NSLayoutConstraint *)labelHeightConstraint setConstant:v8];
}

- (NSString)text
{
  return self->_text;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (BOOL)useCompactLayout
{
  return self->_useCompactLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_labelWidthConstraint, 0);
  objc_storeStrong((id *)&self->_labelHeightConstraint, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_stackView, 0);
}

@end