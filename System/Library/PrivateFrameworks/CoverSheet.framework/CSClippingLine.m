@interface CSClippingLine
- (CSClippingLine)initWithFrame:(CGRect)a3;
- (double)lineAlpha;
- (void)setLineAlpha:(double)a3;
@end

@implementation CSClippingLine

- (CSClippingLine)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)CSClippingLine;
  v7 = -[CSClippingLine initWithFrame:](&v14, sel_initWithFrame_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", x, y, width, height);
    realLine = v7->_realLine;
    v7->_realLine = (UIView *)v8;

    v10 = v7->_realLine;
    v11 = [MEMORY[0x1E4F428B8] whiteColor];
    v12 = [v11 colorWithAlphaComponent:0.25];
    [(UIView *)v10 setBackgroundColor:v12];

    [(UIView *)v7->_realLine setAlpha:0.0];
    [(UIView *)v7->_realLine setAutoresizingMask:18];
    [(CSClippingLine *)v7 addSubview:v7->_realLine];
  }
  return v7;
}

- (double)lineAlpha
{
  [(UIView *)self->_realLine alpha];
  return result;
}

- (void)setLineAlpha:(double)a3
{
}

- (void).cxx_destruct
{
}

@end