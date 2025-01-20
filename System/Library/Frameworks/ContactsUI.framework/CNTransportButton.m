@interface CNTransportButton
+ (CNTransportButton)transportButtonWithType:(int64_t)a3;
+ (id)transportButton;
- (BOOL)showBackgroundPlatter;
- (CGSize)intrinsicContentSize;
- (UIColor)glyphColor;
- (UIImage)image;
- (int64_t)transportType;
- (void)_updateImageWithType:(int64_t)a3;
- (void)_updateTouchInsetsToFillContainerWithSize:(CGSize)a3;
- (void)setGlyphColor:(id)a3;
- (void)setImage:(id)a3;
- (void)setShowBackgroundPlatter:(BOOL)a3;
- (void)setTransportType:(int64_t)a3;
- (void)tintColorDidChange;
@end

@implementation CNTransportButton

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_glyphColor, 0);
}

- (void)setImage:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (UIColor)glyphColor
{
  return self->_glyphColor;
}

- (BOOL)showBackgroundPlatter
{
  return self->_showBackgroundPlatter;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)_updateTouchInsetsToFillContainerWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(CNTransportButton *)self frame];
  double v6 = width - CGRectGetMaxX(v15);
  if (v6 >= 37.0) {
    double v7 = -8.0;
  }
  else {
    double v7 = -v6;
  }
  if (width >= height) {
    double v8 = height;
  }
  else {
    double v8 = width;
  }
  double v9 = v8 + -37.0;
  BOOL v10 = v8 <= 44.0;
  double v11 = 7.0;
  if (!v10) {
    double v11 = v9;
  }
  double v12 = v11 * -0.5;
  BOOL v10 = v11 <= 0.0;
  double v13 = -0.0;
  if (!v10) {
    double v13 = v12;
  }

  -[CNTransportButton _setTouchInsets:](self, "_setTouchInsets:", v13, v13, v13, v7);
}

- (void)_updateImageWithType:(int64_t)a3
{
  v5 = (void *)MEMORY[0x1E4FB1818];
  double v6 = [(CNTransportButton *)self glyphColor];
  objc_msgSend(v5, "cnui_symbolImageForTransportType:withColor:", a3, v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    [(CNTransportButton *)self setHidden:0];
    [(CNTransportButton *)self setImage:v8];
    double v7 = [(CNTransportButton *)self image];
    [(CNTransportButton *)self setImage:v7 forState:0];
  }
  else
  {
    [(CNTransportButton *)self setHidden:1];
    [(CNTransportButton *)self setImage:0];
    [(CNTransportButton *)self setImage:0 forState:0];
  }
}

- (void)setGlyphColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_glyphColor != v5)
  {
    objc_storeStrong((id *)&self->_glyphColor, a3);
    [(CNTransportButton *)self setTintColor:v5];
    [(CNTransportButton *)self _updateImageWithType:[(CNTransportButton *)self transportType]];
  }
}

- (void)tintColorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)CNTransportButton;
  [(CNTransportButton *)&v4 tintColorDidChange];
  v3 = [(CNTransportButton *)self glyphColor];

  if (!v3) {
    [(CNTransportButton *)self _updateImageWithType:[(CNTransportButton *)self transportType]];
  }
}

- (void)setShowBackgroundPlatter:(BOOL)a3
{
  if (self->_showBackgroundPlatter != a3)
  {
    self->_showBackgroundPlatter = a3;
    if (a3)
    {
      objc_super v4 = +[CNContactStyle currentStyle];
      v5 = [v4 transportBackgroundColor];
      [(CNTransportButton *)self setBackgroundColor:v5];

      double v6 = [(CNTransportButton *)self _screen];
      [v6 scale];
      if (v7 == 0.0)
      {
        if (RoundToScale_onceToken != -1) {
          dispatch_once(&RoundToScale_onceToken, &__block_literal_global_33);
        }
        double v7 = *(double *)&RoundToScale___s;
      }
      double v8 = 19.0;
      if (v7 != 1.0) {
        double v8 = round(v7 * 18.5) / v7;
      }

      double v9 = [(CNTransportButton *)self layer];
      [v9 setCornerRadius:v8];

      BOOL v10 = [(CNTransportButton *)self layer];
      [v10 setBorderWidth:1.0];

      id v17 = +[CNContactStyle currentStyle];
      id v11 = [v17 transportBorderColor];
      uint64_t v12 = [v11 CGColor];
      double v13 = [(CNTransportButton *)self layer];
      [v13 setBorderColor:v12];
    }
    else
    {
      v14 = [MEMORY[0x1E4FB1618] clearColor];
      [(CNTransportButton *)self setBackgroundColor:v14];

      CGRect v15 = [(CNTransportButton *)self layer];
      [v15 setCornerRadius:0.0];

      v16 = [(CNTransportButton *)self layer];
      [v16 setBorderWidth:0.0];

      id v17 = [(CNTransportButton *)self layer];
      [v17 setBorderColor:0];
    }
  }
}

- (void)setTransportType:(int64_t)a3
{
  if (self->_transportType != a3)
  {
    self->_transportType = a3;
    -[CNTransportButton _updateImageWithType:](self, "_updateImageWithType:");
  }
}

- (CGSize)intrinsicContentSize
{
  double v2 = 37.0;
  double v3 = 37.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

+ (CNTransportButton)transportButtonWithType:(int64_t)a3
{
  double v3 = [a1 buttonWithType:a3];
  LODWORD(v4) = 1148846080;
  [v3 setContentCompressionResistancePriority:0 forAxis:v4];
  LODWORD(v5) = 1148846080;
  [v3 setContentCompressionResistancePriority:1 forAxis:v5];
  LODWORD(v6) = 1148846080;
  [v3 setContentHuggingPriority:0 forAxis:v6];
  LODWORD(v7) = 1148846080;
  [v3 setContentHuggingPriority:1 forAxis:v7];
  [v3 setShowBackgroundPlatter:1];
  objc_msgSend(v3, "_setTouchInsets:", -3.5, -3.5, -3.5, -3.5);

  return (CNTransportButton *)v3;
}

+ (id)transportButton
{
  return (id)[a1 transportButtonWithType:1];
}

@end