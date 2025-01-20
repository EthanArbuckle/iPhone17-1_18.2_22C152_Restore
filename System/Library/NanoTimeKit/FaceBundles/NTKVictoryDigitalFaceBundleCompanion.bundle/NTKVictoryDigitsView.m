@interface NTKVictoryDigitsView
+ (id)_fontForAppearance:(int64_t)a3 forDevice:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)digitText;
- (UIColor)color;
- (UIColor)outlineBackgroundColor;
- (double)scale;
- (id)_createLabel;
- (id)initForDevice:(id)a3;
- (int64_t)appearance;
- (void)_updateFonts;
- (void)applyColor;
- (void)layoutSubviews;
- (void)prepareAppearance:(int64_t)a3;
- (void)setAppearance:(int64_t)a3;
- (void)setColor:(id)a3;
- (void)setDigitText:(id)a3;
- (void)setDimmingFactor:(double)a3 isUpper:(BOOL)a4;
- (void)setOutlineBackgroundColor:(id)a3;
- (void)setScale:(double)a3;
@end

@implementation NTKVictoryDigitsView

- (id)initForDevice:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NTKVictoryDigitsView;
  v6 = -[NTKVictoryDigitsView initWithFrame:](&v12, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = +[UIColor blackColor];
    [(NTKVictoryDigitsView *)v7 setBackgroundColor:v8];

    [(NTKVictoryDigitsView *)v7 setOpaque:1];
    uint64_t v9 = [(NTKVictoryDigitsView *)v7 _createLabel];
    label = v7->_label;
    v7->_label = (NTKVictoryLabel *)v9;

    [(NTKVictoryDigitsView *)v7 addSubview:v7->_label];
    v7->_hasSetAppearance = 0;
    v7->_scale = 1.0;
  }

  return v7;
}

- (void)setAppearance:(int64_t)a3
{
  if (!self->_hasSetAppearance || self->_appearance != a3)
  {
    self->_appearance = a3;
    self->_hasSetAppearance = 1;
    -[NTKVictoryDigitsView prepareAppearance:](self, "prepareAppearance:");
    [(NTKVictoryDigitsView *)self _updateFonts];
    [(NTKVictoryDigitsView *)self setNeedsLayout];
  }
}

- (void)prepareAppearance:(int64_t)a3
{
  id v3 = [(id)objc_opt_class() _fontForAppearance:a3 forDevice:self->_device];
}

- (void)setDimmingFactor:(double)a3 isUpper:(BOOL)a4
{
  unsigned int v4 = a4;
  double v5 = a3;
  dimmingOverlay = self->_dimmingOverlay;
  if (!dimmingOverlay)
  {
    v8 = +[CAGradientLayer layer];
    uint64_t v9 = self->_dimmingOverlay;
    self->_dimmingOverlay = v8;

    v10 = +[NSNull null];
    v17[0] = @"frame";
    v17[1] = @"colors";
    v18[0] = v10;
    v18[1] = v10;
    v17[2] = @"startPoint";
    v17[3] = @"endPoint";
    v18[2] = v10;
    v18[3] = v10;
    v17[4] = @"opacity";
    v18[4] = v10;
    v11 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:5];
    [(CAGradientLayer *)self->_dimmingOverlay setActions:v11];

    id v12 = +[UIColor colorWithWhite:0.0 alpha:0.9];
    v16[0] = [v12 CGColor];
    id v13 = +[UIColor colorWithWhite:0.0 alpha:0.7];
    v16[1] = [v13 CGColor];
    v14 = +[NSArray arrayWithObjects:v16 count:2];
    [(CAGradientLayer *)self->_dimmingOverlay setColors:v14];

    -[CAGradientLayer setStartPoint:](self->_dimmingOverlay, "setStartPoint:", 0.0, 1.0);
    -[CAGradientLayer setEndPoint:](self->_dimmingOverlay, "setEndPoint:", 0.0, 0.0);
    self->_dimIsUpper = 1;
    [(NTKVictoryDigitsView *)self bounds];
    -[CAGradientLayer setFrame:](self->_dimmingOverlay, "setFrame:");
    v15 = [(NTKVictoryDigitsView *)self layer];
    [v15 addSublayer:self->_dimmingOverlay];

    dimmingOverlay = self->_dimmingOverlay;
  }
  if (self->_dimIsUpper != v4)
  {
    -[CAGradientLayer setStartPoint:](dimmingOverlay, "setStartPoint:", 0.0, (double)v4);
    -[CAGradientLayer setEndPoint:](self->_dimmingOverlay, "setEndPoint:", 0.0, (double)(v4 ^ 1));
    self->_dimIsUpper = v4;
    dimmingOverlay = self->_dimmingOverlay;
  }
  *(float *)&a3 = v5;
  [(CAGradientLayer *)dimmingOverlay setOpacity:a3];
}

- (void)setColor:(id)a3
{
  id v4 = a3;
  double v5 = [(UIColor *)self->_color CGColor];
  id obj = v4;
  if (!CGColorEqualToColor(v5, (CGColorRef)[obj CGColor]))
  {
    objc_storeStrong((id *)&self->_color, obj);
    [(NTKVictoryDigitsView *)self applyColor];
  }
}

- (void)applyColor
{
  if ((self->_appearance & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    id v3 = [(NTKVictoryDigitsView *)self outlineBackgroundColor];
    [(NTKVictoryLabel *)self->_label setFillColor:v3];

    color = self->_color;
    label = self->_label;
    [(NTKVictoryLabel *)label setOutlineColor:color];
  }
  else
  {
    v6 = self->_color;
    v7 = self->_label;
    [(NTKVictoryLabel *)v7 setFillColor:v6];
  }
}

- (UIColor)outlineBackgroundColor
{
  outlineBackgroundColor = self->_outlineBackgroundColor;
  if (!outlineBackgroundColor)
  {
    id v4 = +[UIColor colorWithWhite:0.12 alpha:1.0];
    double v5 = self->_outlineBackgroundColor;
    self->_outlineBackgroundColor = v4;

    outlineBackgroundColor = self->_outlineBackgroundColor;
  }

  return outlineBackgroundColor;
}

- (void)setDigitText:(id)a3
{
  id v7 = a3;
  id v4 = [(NTKVictoryLabel *)self->_label text];
  id v5 = [v4 length];
  if (v5 == [v7 length])
  {

    [(NTKVictoryLabel *)self->_label setText:v7];
    [(NTKVictoryLabel *)self->_label sizeToFit];
  }
  else
  {
    double tritiumOnFraction = self->_tritiumOnFraction;

    [(NTKVictoryLabel *)self->_label setText:v7];
    [(NTKVictoryLabel *)self->_label sizeToFit];
    if (tritiumOnFraction < 1.0) {
      [(NTKVictoryDigitsView *)self applyColor];
    }
  }
}

- (NSString)digitText
{
  return (NSString *)[(NTKVictoryLabel *)self->_label text];
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
  CGAffineTransformMakeScale(&v6, a3, a3);
  label = self->_label;
  CGAffineTransform v5 = v6;
  [(NTKVictoryLabel *)label setTransform:&v5];
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)NTKVictoryDigitsView;
  [(NTKVictoryDigitsView *)&v13 layoutSubviews];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  sub_7A40(self->_device, &v10);
  [(NTKVictoryLabel *)self->_label bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  [(NTKVictoryDigitsView *)self bounds];
  -[NTKVictoryLabel ntk_setBoundsAndPositionFromFrame:](self->_label, "ntk_setBoundsAndPositionFromFrame:", v9 - v6 - *((double *)&v11 + 1), v4, v6, v8);
  [(NTKVictoryDigitsView *)self bounds];
  -[CAGradientLayer setFrame:](self->_dimmingOverlay, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  memset(v5, 0, sizeof(v5));
  sub_7A40(self->_device, v5);
  double v4 = *((double *)v5 + 1);
  double v3 = *(double *)v5;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_updateFonts
{
  double v3 = [(id)objc_opt_class() _fontForAppearance:1 forDevice:self->_device];
  [(NTKVictoryLabel *)self->_label setFont:v3];

  double v4 = 0.0;
  if ((self->_appearance & 0xFFFFFFFFFFFFFFFELL) == 2) {
    double v4 = 1.0;
  }
  [(NTKVictoryLabel *)self->_label setOutlineAlpha:v4];

  [(NTKVictoryDigitsView *)self applyColor];
}

+ (id)_fontForAppearance:(int64_t)a3 forDevice:(id)a4
{
  BOOL v4 = a3 != 1;
  sub_7A40(a4, &v7);
  double v5 = v8;

  return +[NTKVictoryLabel victoryFontWithSize:v4 style:v5];
}

- (id)_createLabel
{
  id v3 = objc_msgSend(objc_alloc((Class)NTKVictoryLabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [v3 setTextAlignment:2];
  long long v6 = 0u;
  memset(v5, 0, sizeof(v5));
  sub_7A40(self->_device, v5);
  [v3 setAdditionalPaddingInsets:*(double *)&v6];
  objc_msgSend(v3, "setDrawingRectOffset:", *((double *)&v6 + 1), 0.0);

  return v3;
}

- (UIColor)color
{
  return self->_color;
}

- (double)scale
{
  return self->_scale;
}

- (int64_t)appearance
{
  return self->_appearance;
}

- (void)setOutlineBackgroundColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outlineBackgroundColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_dimmingOverlay, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end