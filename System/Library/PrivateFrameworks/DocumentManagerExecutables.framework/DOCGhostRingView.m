@interface DOCGhostRingView
+ (Class)layerClass;
- (DOCGhostRingView)initWithFrame:(CGRect)a3;
- (void)_updateShapePath;
- (void)layoutSubviews;
- (void)setTintColor:(id)a3;
@end

@implementation DOCGhostRingView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (DOCGhostRingView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)DOCGhostRingView;
  v3 = -[DOCGhostRingView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(DOCGhostRingView *)v3 layer];
    [v5 setLineCap:*MEMORY[0x263F15E70]];
    id v6 = [MEMORY[0x263F825C8] clearColor];
    objc_msgSend(v5, "setFillColor:", objc_msgSend(v6, "CGColor"));
  }
  return v4;
}

- (void)setTintColor:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)DOCGhostRingView;
  id v4 = a3;
  [(DOCGhostRingView *)&v8 setTintColor:v4];
  v5 = [(DOCGhostRingView *)self layer];
  id v6 = v4;
  uint64_t v7 = [v6 CGColor];

  [v5 setStrokeColor:v7];
}

- (void)_updateShapePath
{
  id v13 = [(DOCGhostRingView *)self layer];
  [(DOCGhostRingView *)self bounds];
  double x = v15.origin.x;
  double y = v15.origin.y;
  double width = v15.size.width;
  double height = v15.size.height;
  CGFloat v7 = v15.size.width * 0.5;
  double MidX = CGRectGetMidX(v15);
  v16.origin.double x = x;
  v16.origin.double y = y;
  v16.size.double width = width;
  v16.size.double height = height;
  double MidY = CGRectGetMidY(v16);
  v10 = [MEMORY[0x263F824C0] bezierPath];
  objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, v7, -1.57079633, 4.71238898);
  id v11 = v10;
  objc_msgSend(v13, "setPath:", objc_msgSend(v11, "CGPath"));
  objc_msgSend(v13, "setBounds:", x, y, width, height);
  if (width >= height) {
    double v12 = height;
  }
  else {
    double v12 = width;
  }
  [v13 setLineWidth:v12 / 36.0 * 3.0];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)DOCGhostRingView;
  [(DOCGhostRingView *)&v3 layoutSubviews];
  [(DOCGhostRingView *)self _updateShapePath];
}

@end