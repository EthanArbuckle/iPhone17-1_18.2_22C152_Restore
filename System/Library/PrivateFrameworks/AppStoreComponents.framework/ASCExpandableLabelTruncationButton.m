@interface ASCExpandableLabelTruncationButton
+ (Class)layerClass;
+ (double)maximumFadeWidth;
- (ASCExpandableLabelTruncationButton)initWithFrame:(CGRect)a3;
- (BOOL)isRTL;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIColor)gradientColor;
- (UIFont)font;
- (UILabel)moreLabel;
- (double)doubleSpaceWidth;
- (void)layoutSubviews;
- (void)setFont:(id)a3;
- (void)setGradientColor:(id)a3;
- (void)setIsRTL:(BOOL)a3;
- (void)updateGradientLayer;
@end

@implementation ASCExpandableLabelTruncationButton

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

+ (double)maximumFadeWidth
{
  return 100.0;
}

- (ASCExpandableLabelTruncationButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v20[1] = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)ASCExpandableLabelTruncationButton;
  v7 = -[ASCExpandableLabelTruncationButton initWithFrame:](&v19, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    v7->_isRTL = 0;
    uint64_t v9 = [MEMORY[0x1E4FB1618] clearColor];
    gradientColor = v8->_gradientColor;
    v8->_gradientColor = (UIColor *)v9;

    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", x, y, width, height);
    moreLabel = v8->_moreLabel;
    v8->_moreLabel = (UILabel *)v11;

    v14 = ASCLocalizedString(@"EXPANDABLE_LABEL_TRUNCATION_TEXT", v13);
    [(UILabel *)v8->_moreLabel setText:v14];

    v15 = [(ASCExpandableLabelTruncationButton *)v8 tintColor];
    [(UILabel *)v8->_moreLabel setTextColor:v15];

    [(UILabel *)v8->_moreLabel setAdjustsFontForContentSizeCategory:1];
    [(ASCExpandableLabelTruncationButton *)v8 addSubview:v8->_moreLabel];
    v20[0] = objc_opt_class();
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    id v17 = (id)[(ASCExpandableLabelTruncationButton *)v8 registerForTraitChanges:v16 withTarget:v8 action:sel_updateGradientLayer];
  }
  return v8;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(ASCExpandableLabelTruncationButton *)self moreLabel];
  objc_msgSend(v6, "sizeThatFits:", width, height);
  double v8 = v7;
  double v10 = v9;

  uint64_t v11 = [(ASCExpandableLabelTruncationButton *)self moreLabel];
  v12 = [v11 font];
  [v12 lineHeight];
  double v14 = v13 + v13;

  +[ASCExpandableLabelTruncationButton maximumFadeWidth];
  if (v14 >= v15) {
    double v14 = v15;
  }
  [(ASCExpandableLabelTruncationButton *)self doubleSpaceWidth];
  double v17 = v8 + v16 + v14;
  double v18 = v10;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)ASCExpandableLabelTruncationButton;
  [(ASCExpandableLabelTruncationButton *)&v15 layoutSubviews];
  v3 = [(ASCExpandableLabelTruncationButton *)self moreLabel];
  [(ASCExpandableLabelTruncationButton *)self bounds];
  objc_msgSend(v3, "sizeThatFits:", v4, v5);
  double v7 = v6;
  double v9 = v8;

  double v10 = 0.0;
  if (![(ASCExpandableLabelTruncationButton *)self isRTL])
  {
    [(ASCExpandableLabelTruncationButton *)self bounds];
    double v10 = v11 - v7;
  }
  [(ASCExpandableLabelTruncationButton *)self bounds];
  double v13 = v12 * 0.5 - v9 * 0.5;
  double v14 = [(ASCExpandableLabelTruncationButton *)self moreLabel];
  objc_msgSend(v14, "setFrame:", v10, v13, v7, v9);

  [(ASCExpandableLabelTruncationButton *)self updateGradientLayer];
}

- (UIFont)font
{
  v2 = [(ASCExpandableLabelTruncationButton *)self moreLabel];
  v3 = [v2 font];

  return (UIFont *)v3;
}

- (void)setFont:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCExpandableLabelTruncationButton *)self moreLabel];
  [v5 setFont:v4];
}

- (double)doubleSpaceWidth
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *MEMORY[0x1E4FB12B0];
  v2 = [(ASCExpandableLabelTruncationButton *)self moreLabel];
  v3 = [v2 font];
  v9[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  objc_msgSend(@"  ", "boundingRectWithSize:options:attributes:context:", 0, v4, 0, 1.79769313e308, 1.79769313e308);
  double v6 = v5;

  return v6;
}

- (void)setGradientColor:(id)a3
{
  objc_storeStrong((id *)&self->_gradientColor, a3);

  [(ASCExpandableLabelTruncationButton *)self updateGradientLayer];
}

- (void)updateGradientLayer
{
  v23[2] = *MEMORY[0x1E4F143B8];
  v3 = [(ASCExpandableLabelTruncationButton *)self gradientColor];
  id v4 = [v3 colorWithAlphaComponent:0.0];
  v23[0] = [v4 CGColor];
  id v5 = [(ASCExpandableLabelTruncationButton *)self gradientColor];
  v23[1] = [v5 CGColor];
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  double v7 = [(ASCExpandableLabelTruncationButton *)self layer];
  [v7 setColors:v6];

  uint64_t v8 = [(ASCExpandableLabelTruncationButton *)self moreLabel];
  [v8 frame];
  double v10 = v9;
  [(ASCExpandableLabelTruncationButton *)self doubleSpaceWidth];
  double v12 = v11 + v10;

  [(ASCExpandableLabelTruncationButton *)self bounds];
  v22[0] = &unk_1F1E15BF0;
  double v14 = [NSNumber numberWithDouble:1.0 - v12 / v13];
  v22[1] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  double v16 = [(ASCExpandableLabelTruncationButton *)self layer];
  [v16 setLocations:v15];

  LOBYTE(v15) = [(ASCExpandableLabelTruncationButton *)self isRTL];
  double v17 = [(ASCExpandableLabelTruncationButton *)self layer];
  double v18 = v17;
  if (v15)
  {
    objc_msgSend(v17, "setStartPoint:", 1.0, 0.5);

    objc_super v19 = [(ASCExpandableLabelTruncationButton *)self layer];
    v20 = v19;
    double v21 = 0.0;
  }
  else
  {
    objc_msgSend(v17, "setStartPoint:", 0.0, 0.5);

    objc_super v19 = [(ASCExpandableLabelTruncationButton *)self layer];
    v20 = v19;
    double v21 = 1.0;
  }
  objc_msgSend(v19, "setEndPoint:", v21, 0.5);
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (UIColor)gradientColor
{
  return self->_gradientColor;
}

- (UILabel)moreLabel
{
  return self->_moreLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreLabel, 0);

  objc_storeStrong((id *)&self->_gradientColor, 0);
}

@end