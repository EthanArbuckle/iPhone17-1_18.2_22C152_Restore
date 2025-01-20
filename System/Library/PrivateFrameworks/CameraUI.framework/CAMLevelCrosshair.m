@interface CAMLevelCrosshair
+ (void)_drawCrosshairInContext:(CGContext *)a3 withBounds:(CGRect)a4 strokeWidth:(double)a5 color:(id)a6;
- (BOOL)isHighlighted;
- (CAMLevelCrosshair)initWithCoder:(id)a3;
- (CAMLevelCrosshair)initWithFrame:(CGRect)a3;
- (void)_commonCAMLevelCrosshairInitialization;
- (void)drawRect:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation CAMLevelCrosshair

+ (void)_drawCrosshairInContext:(CGContext *)a3 withBounds:(CGRect)a4 strokeWidth:(double)a5 color:(id)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  objc_msgSend(a6, "setStroke", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5);
  UIRectGetCenter();
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v20);
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGFloat MaxY = CGRectGetMaxY(v21);
  CGContextMoveToPoint(a3, v12, MinY);
  CGContextAddLineToPoint(a3, v12, MaxY);
  CGContextDrawPath(a3, kCGPathStroke);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  CGFloat MinX = CGRectGetMinX(v22);
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  CGFloat MaxX = CGRectGetMaxX(v23);
  CGContextMoveToPoint(a3, MinX, v14);
  CGContextAddLineToPoint(a3, MaxX, v14);
  CGContextDrawPath(a3, kCGPathStroke);
}

- (CAMLevelCrosshair)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMLevelCrosshair;
  v3 = -[CAMLevelCrosshair initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(CAMLevelCrosshair *)v3 _commonCAMLevelCrosshairInitialization];
  }
  return v4;
}

- (CAMLevelCrosshair)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMLevelCrosshair;
  v3 = [(CAMLevelCrosshair *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(CAMLevelCrosshair *)v3 _commonCAMLevelCrosshairInitialization];
  }
  return v4;
}

- (void)_commonCAMLevelCrosshairInitialization
{
  [(CAMLevelCrosshair *)self setOpaque:0];
  [(CAMLevelCrosshair *)self setContentMode:3];
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    [(CAMLevelCrosshair *)self setNeedsDisplay];
  }
}

- (void)drawRect:(CGRect)a3
{
  [(CAMLevelCrosshair *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  BOOL v12 = [(CAMLevelCrosshair *)self isHighlighted];
  double v13 = CAMPixelWidthForView(self);
  id v16 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.15];
  if (v12) {
    [MEMORY[0x263F825C8] systemYellowColor];
  }
  else {
  CGFloat v14 = [MEMORY[0x263F825C8] whiteColor];
  }
  CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend((id)objc_opt_class(), "_drawCrosshairInContext:withBounds:strokeWidth:color:", CurrentContext, v16, v5, v7, v9, v11, v13 * 2.0 + 1.0);
  objc_msgSend((id)objc_opt_class(), "_drawCrosshairInContext:withBounds:strokeWidth:color:", CurrentContext, v14, v5, v7, v9, v11, 1.0);
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

@end