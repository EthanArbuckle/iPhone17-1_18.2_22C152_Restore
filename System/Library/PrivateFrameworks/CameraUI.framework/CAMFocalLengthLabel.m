@interface CAMFocalLengthLabel
- (CAMFocalLengthLabel)initWithFrame:(CGRect)a3;
- (CGSize)_numeralSize;
- (CGSize)_unitSize;
- (CGSize)intrinsicContentSize;
- (UIFont)_numeralFont;
- (UIFont)_unitFont;
- (UILabel)_numeralLabel;
- (UILabel)_unitLabel;
- (int64_t)focalLength;
- (void)_updateFontsAndTextAnimated:(BOOL)a3;
- (void)_updateNumeralTextAnimated:(BOOL)a3;
- (void)_updateUnitText;
- (void)layoutSubviews;
- (void)setFocalLength:(int64_t)a3;
- (void)setFocalLength:(int64_t)a3 animated:(BOOL)a4;
- (void)set_numeralFont:(id)a3;
- (void)set_numeralSize:(CGSize)a3;
- (void)set_unitFont:(id)a3;
- (void)set_unitSize:(CGSize)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CAMFocalLengthLabel

- (CAMFocalLengthLabel)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CAMFocalLengthLabel;
  v3 = -[CAMFocalLengthLabel initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    numeralLabel = v3->__numeralLabel;
    v3->__numeralLabel = v4;

    v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    unitLabel = v3->__unitLabel;
    v3->__unitLabel = v6;

    [(UILabel *)v3->__numeralLabel setTextAlignment:1];
    [(UILabel *)v3->__unitLabel setTextAlignment:1];
    [(CAMFocalLengthLabel *)v3 addSubview:v3->__numeralLabel];
    [(CAMFocalLengthLabel *)v3 addSubview:v3->__unitLabel];
    [(CAMFocalLengthLabel *)v3 _updateFontsAndTextAnimated:0];
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  v3 = [(CAMFocalLengthLabel *)self _unitFont];
  v4 = [(CAMFocalLengthLabel *)self _numeralFont];
  [v3 ascender];
  [v3 descender];
  [v4 ascender];
  UIRoundToViewScale();
  double v6 = v5;
  [(CAMFocalLengthLabel *)self _numeralSize];
  [(CAMFocalLengthLabel *)self _unitSize];
  UICeilToViewScale();
  double v8 = v7;

  double v9 = v8;
  double v10 = v6;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  id v23 = [(CAMFocalLengthLabel *)self _numeralLabel];
  v3 = [(CAMFocalLengthLabel *)self _unitLabel];
  [(CAMFocalLengthLabel *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  CGFloat v11 = v10;
  [(CAMFocalLengthLabel *)self _numeralSize];
  double v13 = v12;
  [(CAMFocalLengthLabel *)self _unitSize];
  double v15 = v14;
  CEKPixelWidthForView();
  double v17 = v5 + v16;
  v25.origin.x = v5;
  v25.origin.y = v7;
  v25.size.width = v9;
  v25.size.height = v11;
  CGFloat v18 = CGRectGetMaxY(v25) - v15;
  v19 = [(CAMFocalLengthLabel *)self _unitFont];
  v20 = [(CAMFocalLengthLabel *)self _numeralFont];
  [v20 ascender];
  [v20 capHeight];
  [v19 descender];
  UIRoundToViewScale();
  CGFloat v22 = v18 - v21;
  objc_msgSend(v23, "setFrame:", v5, v7 - v21, v9, v13);
  objc_msgSend(v3, "setFrame:", v17, v22, v9, v15);
}

- (void)tintColorDidChange
{
  id v5 = [(CAMFocalLengthLabel *)self tintColor];
  v3 = [(CAMFocalLengthLabel *)self _numeralLabel];
  [v3 setTextColor:v5];

  double v4 = [(CAMFocalLengthLabel *)self _unitLabel];
  [v4 setTextColor:v5];
}

- (void)traitCollectionDidChange:(id)a3
{
  category = [a3 preferredContentSizeCategory];
  double v4 = [(CAMFocalLengthLabel *)self traitCollection];
  id v5 = [v4 preferredContentSizeCategory];

  LODWORD(v4) = UIContentSizeCategoryIsAccessibilityCategory(category);
  if (v4 != UIContentSizeCategoryIsAccessibilityCategory(v5)) {
    [(CAMFocalLengthLabel *)self _updateFontsAndTextAnimated:0];
  }
}

- (void)setFocalLength:(int64_t)a3
{
}

- (void)setFocalLength:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_focalLength != a3)
  {
    self->_focalLength = a3;
    [(CAMFocalLengthLabel *)self _updateNumeralTextAnimated:a4];
  }
}

- (void)_updateFontsAndTextAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CAMFocalLengthLabel *)self traitCollection];
  double v6 = [v5 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  double v8 = 13.0;
  if (IsAccessibilityCategory)
  {
    double v8 = 17.0;
    double v9 = 12.0;
  }
  else
  {
    double v9 = 9.0;
  }
  double v10 = *MEMORY[0x263F81840];
  CGFloat v11 = +[CAMFont cameraMonospacedFontOfSize:v8 weight:*MEMORY[0x263F81840]];
  [(CAMFocalLengthLabel *)self set_numeralFont:v11];

  double v12 = +[CAMFont cameraMonospacedFontOfSize:v9 weight:v10];
  [(CAMFocalLengthLabel *)self set_unitFont:v12];

  [(CAMFocalLengthLabel *)self _updateNumeralTextAnimated:v3];
  [(CAMFocalLengthLabel *)self _updateUnitText];
}

- (void)_updateNumeralTextAnimated:(BOOL)a3
{
  v16[2] = *MEMORY[0x263EF8340];
  double v4 = [(CAMFocalLengthLabel *)self _numeralFont];
  id v5 = [(CAMFocalLengthLabel *)self _numeralLabel];
  uint64_t v6 = *MEMORY[0x263F81510];
  v15[0] = *MEMORY[0x263F814F0];
  v15[1] = v6;
  v16[0] = v4;
  v16[1] = &unk_26BDDF4B8;
  double v7 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  unint64_t v8 = [(CAMFocalLengthLabel *)self focalLength];
  if (v8 > 3) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = qword_209C7B588[v8];
  }
  double v10 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v9);
  CGFloat v11 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v10 attributes:v7];
  [v5 setAttributedText:v11];

  [v5 intrinsicContentSize];
  UICeilToViewScale();
  double v13 = v12;
  UICeilToViewScale();
  -[CAMFocalLengthLabel set_numeralSize:](self, "set_numeralSize:", v13, v14);
}

- (void)_updateUnitText
{
  v12[2] = *MEMORY[0x263EF8340];
  BOOL v3 = [(CAMFocalLengthLabel *)self _unitFont];
  double v4 = [(CAMFocalLengthLabel *)self _unitLabel];
  uint64_t v5 = *MEMORY[0x263F81510];
  v11[0] = *MEMORY[0x263F814F0];
  v11[1] = v5;
  v12[0] = v3;
  v12[1] = &unk_26BDDE8E0;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  double v7 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@"MM" attributes:v6];
  [v4 setAttributedText:v7];

  [v4 intrinsicContentSize];
  UICeilToViewScale();
  double v9 = v8;
  UICeilToViewScale();
  -[CAMFocalLengthLabel set_unitSize:](self, "set_unitSize:", v9, v10);
}

- (int64_t)focalLength
{
  return self->_focalLength;
}

- (UILabel)_unitLabel
{
  return self->__unitLabel;
}

- (UILabel)_numeralLabel
{
  return self->__numeralLabel;
}

- (UIFont)_numeralFont
{
  return self->__numeralFont;
}

- (void)set_numeralFont:(id)a3
{
}

- (UIFont)_unitFont
{
  return self->__unitFont;
}

- (void)set_unitFont:(id)a3
{
}

- (CGSize)_numeralSize
{
  double width = self->__numeralSize.width;
  double height = self->__numeralSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)set_numeralSize:(CGSize)a3
{
  self->__numeralSize = a3;
}

- (CGSize)_unitSize
{
  double width = self->__unitSize.width;
  double height = self->__unitSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)set_unitSize:(CGSize)a3
{
  self->__unitSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__unitFont, 0);
  objc_storeStrong((id *)&self->__numeralFont, 0);
  objc_storeStrong((id *)&self->__numeralLabel, 0);
  objc_storeStrong((id *)&self->__unitLabel, 0);
}

@end