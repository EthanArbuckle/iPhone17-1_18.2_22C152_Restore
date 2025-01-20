@interface NWCMapLocationView
- (NWCMapLocationView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
- (void)positionAtPoint:(CGPoint)a3 withinBounds:(CGRect)a4;
@end

@implementation NWCMapLocationView

- (NWCMapLocationView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NWCMapLocationView;
  v3 = -[NWCMapLocationView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(NWCMapLocationView *)v3 setOpaque:0];
  }
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  id v8 = [MEMORY[0x263F1C550] whiteColor];
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v8 CGColor]);

  v10.origin.CGFloat x = x;
  v10.origin.CGFloat y = y;
  v10.size.CGFloat width = width;
  v10.size.CGFloat height = height;
  CGContextFillEllipseInRect(CurrentContext, v10);

  CGContextFillPath(CurrentContext);
}

- (void)positionAtPoint:(CGPoint)a3 withinBounds:(CGRect)a4
{
  CGFloat rect = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  [(NWCMapLocationView *)self frame];
  UIRectCenteredAboutPointScale();
  double v8 = v17.origin.x;
  double v9 = v17.origin.y;
  CGFloat v10 = v17.size.width;
  CGFloat height = v17.size.height;
  if (CGRectGetMinX(v17) < 0.0) {
    double v8 = 0.0;
  }
  v18.origin.CGFloat x = v8;
  v18.origin.CGFloat y = v9;
  v18.size.CGFloat width = v10;
  v18.size.CGFloat height = height;
  if (CGRectGetMinY(v18) < 0.0) {
    double v9 = 0.0;
  }
  v19.origin.CGFloat x = v8;
  v19.origin.CGFloat y = v9;
  v19.size.CGFloat width = v10;
  v19.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v19);
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = rect;
  if (MaxX > CGRectGetWidth(v20))
  {
    v21.origin.CGFloat x = x;
    v21.size.CGFloat height = rect;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    double v13 = CGRectGetWidth(v21);
    v22.origin.CGFloat x = v8;
    v22.origin.CGFloat y = v9;
    v22.size.CGFloat width = v10;
    v22.size.CGFloat height = height;
    double v8 = v13 - CGRectGetWidth(v22);
  }
  v23.origin.CGFloat x = v8;
  v23.origin.CGFloat y = v9;
  v23.size.CGFloat width = v10;
  v23.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v23);
  v24.origin.CGFloat x = x;
  v24.size.CGFloat height = rect;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  if (MaxY > CGRectGetHeight(v24))
  {
    v25.origin.CGFloat x = x;
    v25.size.CGFloat height = rect;
    v25.origin.CGFloat y = y;
    v25.size.CGFloat width = width;
    CGRectGetHeight(v25);
    v26.origin.CGFloat x = v8;
    v26.origin.CGFloat y = v9;
    v26.size.CGFloat width = v10;
    v26.size.CGFloat height = height;
    CGRectGetHeight(v26);
  }

  MEMORY[0x270F9A6D0](self, sel_setFrame_);
}

@end