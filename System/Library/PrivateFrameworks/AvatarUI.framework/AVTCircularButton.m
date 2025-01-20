@interface AVTCircularButton
- (AVTCircularButton)initWithCoder:(id)a3;
- (AVTCircularButton)initWithFrame:(CGRect)a3;
- (BOOL)isUsingDynamicBackground;
- (CAShapeLayer)clippingLayer;
- (UIColor)dynamicBackgroundColor;
- (UIColor)symbolTintColor;
- (UIImage)symbolImage;
- (double)circleLayerAlpha;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setClippingLayer:(id)a3;
- (void)setDynamicBackgroundColor:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIsUsingDynamicBackground:(BOOL)a3;
- (void)setSymbolImage:(id)a3;
- (void)setSymbolImageWithName:(id)a3;
- (void)setSymbolImageWithName:(id)a3 configuration:(id)a4;
- (void)setSymbolTintColor:(id)a3;
- (void)setupView;
- (void)tintColorDidChange;
- (void)updateBackgroundColorIfNeeded;
- (void)updateDynamicBackgroundColor;
@end

@implementation AVTCircularButton

- (AVTCircularButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVTCircularButton;
  v3 = -[AVTCircularButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(AVTCircularButton *)v3 setupView];
  }
  return v4;
}

- (AVTCircularButton)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVTCircularButton;
  v3 = [(AVTCircularButton *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(AVTCircularButton *)v3 setupView];
  }
  return v4;
}

- (void)setupView
{
  [(AVTCircularButton *)self setAdjustsImageWhenHighlighted:0];
  [(AVTCircularButton *)self setAdjustsImageSizeForAccessibilityContentSizeCategory:0];
  v3 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
  clippingLayer = self->_clippingLayer;
  self->_clippingLayer = v3;

  v5 = self->_clippingLayer;
  objc_super v6 = [(AVTCircularButton *)self layer];
  [v6 setMask:v5];

  [(AVTCircularButton *)self updateDynamicBackgroundColor];
  id v7 = [(AVTCircularButton *)self dynamicBackgroundColor];
  [(AVTCircularButton *)self setBackgroundColor:v7];
}

- (void)updateBackgroundColorIfNeeded
{
  if ([(AVTCircularButton *)self isUsingDynamicBackground])
  {
    [(AVTCircularButton *)self updateDynamicBackgroundColor];
    id v3 = [(AVTCircularButton *)self dynamicBackgroundColor];
    [(AVTCircularButton *)self setBackgroundColor:v3];
  }
}

- (void)setBackgroundColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVTCircularButton;
  id v4 = a3;
  [(AVTCircularButton *)&v6 setBackgroundColor:v4];
  id v5 = [(AVTCircularButton *)self dynamicBackgroundColor];

  [(AVTCircularButton *)self setIsUsingDynamicBackground:v5 == v4];
}

- (void)updateDynamicBackgroundColor
{
  id v3 = [(AVTCircularButton *)self tintColor];
  id v7 = [v3 colorWithAlphaComponent:0.15];

  id v4 = [(AVTCircularButton *)self tintColor];
  id v5 = [v4 colorWithAlphaComponent:0.3];

  objc_super v6 = +[AVTUIColorRepository dynamicColorWithLightColor:v7 darkColor:v5];
  [(AVTCircularButton *)self setDynamicBackgroundColor:v6];
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)AVTCircularButton;
  [(AVTCircularButton *)&v3 tintColorDidChange];
  [(AVTCircularButton *)self updateBackgroundColorIfNeeded];
}

- (double)circleLayerAlpha
{
  v2 = [(AVTCircularButton *)self traitCollection];
  BOOL v3 = [v2 userInterfaceStyle] == 2;

  return dbl_20AFF20E0[v3];
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)AVTCircularButton;
  [(AVTCircularButton *)&v7 layoutSubviews];
  BOOL v3 = (void *)MEMORY[0x263F1C478];
  [(AVTCircularButton *)self bounds];
  objc_msgSend(v3, "bezierPathWithOvalInRect:");
  id v4 = objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 CGPath];
  objc_super v6 = [(AVTCircularButton *)self clippingLayer];
  [v6 setPath:v5];
}

- (void)setSymbolImageWithName:(id)a3
{
  id v4 = (void *)MEMORY[0x263F1C6C8];
  uint64_t v5 = *MEMORY[0x263F1D260];
  id v6 = a3;
  id v7 = [v4 configurationWithTextStyle:v5 scale:2];
  [(AVTCircularButton *)self setSymbolImageWithName:v6 configuration:v7];
}

- (void)setSymbolImageWithName:(id)a3 configuration:(id)a4
{
  uint64_t v5 = [MEMORY[0x263F1C6B0] systemImageNamed:a3 withConfiguration:a4];
  symbolImage = self->_symbolImage;
  self->_symbolImage = v5;
  id v7 = v5;

  [(AVTCircularButton *)self setImage:self->_symbolImage forState:0];
}

- (void)setSymbolTintColor:(id)a3
{
  v8 = (UIColor *)a3;
  if (self->_symbolTintColor != v8)
  {
    objc_storeStrong((id *)&self->_symbolTintColor, a3);
    uint64_t v5 = [(UIImage *)self->_symbolImage imageWithTintColor:v8];
    id v6 = [v5 imageWithRenderingMode:1];
    symbolImage = self->_symbolImage;
    self->_symbolImage = v6;

    [(AVTCircularButton *)self setImage:self->_symbolImage forState:0];
    [(AVTCircularButton *)self setAdjustsImageWhenHighlighted:1];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVTCircularButton;
  -[AVTCircularButton setHighlighted:](&v11, sel_setHighlighted_);
  if (([(AVTCircularButton *)self adjustsImageWhenHighlighted] & 1) == 0)
  {
    symbolTintColor = self->_symbolTintColor;
    if (symbolTintColor)
    {
      id v6 = symbolTintColor;
    }
    else
    {
      id v6 = [(AVTCircularButton *)self tintColor];
    }
    id v7 = v6;
    double v8 = 0.3;
    if (!v3) {
      double v8 = 1.0;
    }
    v9 = [(UIColor *)v6 colorWithAlphaComponent:v8];
    v10 = [(AVTCircularButton *)self imageView];
    [v10 setTintColor:v9];
  }
}

- (CAShapeLayer)clippingLayer
{
  return self->_clippingLayer;
}

- (void)setClippingLayer:(id)a3
{
}

- (UIColor)dynamicBackgroundColor
{
  return self->_dynamicBackgroundColor;
}

- (void)setDynamicBackgroundColor:(id)a3
{
}

- (UIImage)symbolImage
{
  return self->_symbolImage;
}

- (void)setSymbolImage:(id)a3
{
}

- (UIColor)symbolTintColor
{
  return self->_symbolTintColor;
}

- (BOOL)isUsingDynamicBackground
{
  return self->_isUsingDynamicBackground;
}

- (void)setIsUsingDynamicBackground:(BOOL)a3
{
  self->_isUsingDynamicBackground = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolTintColor, 0);
  objc_storeStrong((id *)&self->_symbolImage, 0);
  objc_storeStrong((id *)&self->_dynamicBackgroundColor, 0);
  objc_storeStrong((id *)&self->_clippingLayer, 0);
}

@end