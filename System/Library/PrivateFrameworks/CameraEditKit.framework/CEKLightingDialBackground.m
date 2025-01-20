@interface CEKLightingDialBackground
- (CEKLightingDialBackground)initWithFrame:(CGRect)a3;
- (double)radius;
- (void)drawRect:(CGRect)a3;
- (void)setRadius:(double)a3;
@end

@implementation CEKLightingDialBackground

- (CEKLightingDialBackground)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CEKLightingDialBackground;
  v3 = -[CEKLightingDialBackground initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CEKLightingDialBackground *)v3 setOpaque:0];
    [(CEKLightingDialBackground *)v4 setContentMode:3];
  }
  return v4;
}

- (void)setRadius:(double)a3
{
  if (self->_radius != a3)
  {
    self->_radius = a3;
    [(CEKLightingDialBackground *)self setNeedsDisplay];
  }
}

- (void)drawRect:(CGRect)a3
{
  CurrentContext = UIGraphicsGetCurrentContext();
  [(CEKLightingDialBackground *)self bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [(CEKLightingDialBackground *)self radius];
  UIRoundToViewScale();
  double v14 = v13;
  double v15 = CEKPixelWidthForView(self);
  v31.origin.CGFloat x = v6;
  v31.origin.CGFloat y = v8;
  v31.size.CGFloat width = v10;
  v31.size.CGFloat height = v12;
  CGFloat v16 = v15 + CGRectGetMinY(v31);
  v32.origin.CGFloat x = v6;
  v32.origin.CGFloat y = v8;
  v32.size.CGFloat width = v10;
  v32.size.CGFloat height = v12;
  CGFloat v17 = CGRectGetMidX(v32) + v14 * -0.5;
  v33.origin.CGFloat x = v17;
  v33.origin.CGFloat y = v16;
  v33.size.CGFloat width = v14;
  v33.size.CGFloat height = v14;
  CGRect v34 = CGRectInset(v33, v15, v15);
  CGFloat x = v34.origin.x;
  CGFloat y = v34.origin.y;
  CGFloat width = v34.size.width;
  CGFloat height = v34.size.height;
  v22 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  v23 = [v22 colorWithAlphaComponent:0.3];
  [v23 set];

  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  CGContextFillEllipseInRect(CurrentContext, v35);
  v24 = [MEMORY[0x1E4FB1618] labelColor];
  v25 = [v24 colorWithAlphaComponent:0.1];
  [v25 set];

  CGContextSetLineWidth(CurrentContext, v15);
  CGFloat v26 = v17;
  CGFloat v27 = v16;
  double v28 = v14;
  double v29 = v14;
  CGContextStrokeEllipseInRect(CurrentContext, *(CGRect *)&v26);
}

- (double)radius
{
  return self->_radius;
}

@end