@interface CEKSliderDotView
- (BOOL)isOpaque;
- (BOOL)useLegibilityShadow;
- (CEKSliderDotView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
- (void)setUseLegibilityShadow:(BOOL)a3;
@end

@implementation CEKSliderDotView

- (CEKSliderDotView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CEKSliderDotView;
  v3 = -[CEKSliderDotView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(CEKSliderDotView *)v3 setContentMode:3];
  }
  return v4;
}

- (BOOL)isOpaque
{
  return 0;
}

- (void)setUseLegibilityShadow:(BOOL)a3
{
  if (self->_useLegibilityShadow != a3)
  {
    self->_useLegibilityShadow = a3;
    [(CEKSliderDotView *)self setNeedsDisplay];
  }
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  [(CEKSliderDotView *)self bounds];
  CGContextClearRect(CurrentContext, v21);
  double v9 = CEKPixelWidthForView(self);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  CGRect v23 = CGRectInset(v22, 1.0, 1.0);
  CGFloat v10 = v23.origin.x;
  CGFloat v11 = v23.origin.y;
  CGFloat v12 = v23.size.width;
  CGFloat v13 = v23.size.height;
  if ([(CEKSliderDotView *)self useLegibilityShadow])
  {
    v24.origin.CGFloat x = v10;
    v24.origin.CGFloat y = v11;
    v24.size.CGFloat width = v12;
    v24.size.CGFloat height = v13;
    CGRect v25 = CGRectInset(v24, -v9, -v9);
    CGFloat v14 = v25.origin.x;
    CGFloat v15 = v25.origin.y;
    CGFloat v16 = v25.size.width;
    CGFloat v17 = v25.size.height;
    v18 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.15];
    [v18 set];
    v26.origin.CGFloat x = v14;
    v26.origin.CGFloat y = v15;
    v26.size.CGFloat width = v16;
    v26.size.CGFloat height = v17;
    CGContextFillEllipseInRect(CurrentContext, v26);

    [MEMORY[0x1E4FB1618] labelColor];
  }
  else
  {
    [MEMORY[0x1E4FB1618] colorWithWhite:0.400000006 alpha:1.0];
  }
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  [v19 set];
  v27.origin.CGFloat x = v10;
  v27.origin.CGFloat y = v11;
  v27.size.CGFloat width = v12;
  v27.size.CGFloat height = v13;
  CGContextFillEllipseInRect(CurrentContext, v27);
}

- (BOOL)useLegibilityShadow
{
  return self->_useLegibilityShadow;
}

@end