@interface ASCBorderView
- (ASCBorderView)initWithCoder:(id)a3;
- (ASCBorderView)initWithFrame:(CGRect)a3;
- (NSString)cornerCurve;
- (UIColor)color;
- (double)cornerRadius;
- (double)width;
- (unint64_t)cornerMask;
- (void)encodeWithCoder:(id)a3;
- (void)setColor:(id)a3;
- (void)setCornerCurve:(id)a3;
- (void)setCornerMask:(unint64_t)a3;
- (void)setCornerRadius:(double)a3;
- (void)setWidth:(double)a3;
- (void)updateBorderColor;
@end

@implementation ASCBorderView

- (ASCBorderView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ASCBorderView;
  v3 = -[ASCBorderView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4FB1618] clearColor];
    color = v3->_color;
    v3->_color = (UIColor *)v4;

    [(ASCBorderView *)v3 updateBorderColor];
    v6 = [MEMORY[0x1E4FB1E20] systemTraitsAffectingColorAppearance];
    id v7 = (id)[(ASCBorderView *)v3 registerForTraitChanges:v6 withAction:sel_updateBorderColor];
  }
  return v3;
}

- (ASCBorderView)initWithCoder:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);

  [(ASCBorderView *)self updateBorderColor];
}

- (double)width
{
  v2 = [(ASCBorderView *)self layer];
  [v2 borderWidth];
  double v4 = v3;

  return v4;
}

- (void)setWidth:(double)a3
{
  id v4 = [(ASCBorderView *)self layer];
  [v4 setBorderWidth:a3];
}

- (double)cornerRadius
{
  v2 = [(ASCBorderView *)self layer];
  [v2 cornerRadius];
  double v4 = v3;

  return v4;
}

- (void)setCornerRadius:(double)a3
{
  id v4 = [(ASCBorderView *)self layer];
  [v4 setCornerRadius:a3];
}

- (NSString)cornerCurve
{
  v2 = [(ASCBorderView *)self layer];
  double v3 = [v2 cornerCurve];

  return (NSString *)v3;
}

- (void)setCornerCurve:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCBorderView *)self layer];
  [v5 setCornerCurve:v4];
}

- (unint64_t)cornerMask
{
  v2 = [(ASCBorderView *)self layer];
  unint64_t v3 = [v2 maskedCorners];

  return v3;
}

- (void)setCornerMask:(unint64_t)a3
{
  id v4 = [(ASCBorderView *)self layer];
  [v4 setMaskedCorners:a3];
}

- (void)updateBorderColor
{
  id v5 = [(ASCBorderView *)self color];
  uint64_t v3 = [v5 CGColor];
  id v4 = [(ASCBorderView *)self layer];
  [v4 setBorderColor:v3];
}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
}

@end