@interface HUColorWheelView
+ (double)_colorWheelRenderingScale;
- ($F24F406B2B787EFB06265DBA3D28CBD5)colorWheelCoordinateForPoint:(CGPoint)a3 boundedToWheel:(BOOL)a4;
- (CGPoint)pointForColorWheelCoordinate:(id)a3;
- (HUColorWheelSpace)colorWheelSpace;
- (HUColorWheelView)initWithColorWheelSpace:(id)a3;
- (double)_outerRadius;
- (double)wheelHoleRadius;
- (id)wheelBezierPath;
- (void)drawRect:(CGRect)a3;
- (void)setColorWheelSpace:(id)a3;
- (void)setWheelHoleRadius:(double)a3;
@end

@implementation HUColorWheelView

- (HUColorWheelView)initWithColorWheelSpace:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUColorWheelView;
  v5 = [(HUColorWheelView *)&v11 init];
  v6 = v5;
  if (v5)
  {
    [(HUColorWheelView *)v5 setColorWheelSpace:v4];
    [(HUColorWheelView *)v6 setOpaque:0];
    v7 = [(HUColorWheelView *)v6 widthAnchor];
    v8 = [(HUColorWheelView *)v6 heightAnchor];
    v9 = [v7 constraintEqualToAnchor:v8];
    [v9 setActive:1];
  }
  return v6;
}

- (void)setColorWheelSpace:(id)a3
{
  id v6 = a3;
  id v8 = v6;
  if (!v6)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"HUColorWheelView.m", 110, @"Invalid parameter not satisfying: %@", @"colorWheelSpace != nil" object file lineNumber description];

    id v6 = 0;
  }
  if (([(HUColorWheelSpace *)self->_colorWheelSpace isEqual:v6] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_colorWheelSpace, a3);
    [(HUColorWheelView *)self setNeedsDisplay];
  }
}

- (void)setWheelHoleRadius:(double)a3
{
  if (self->_wheelHoleRadius != a3)
  {
    self->_wheelHoleRadius = a3;
    [(HUColorWheelView *)self setNeedsDisplay];
  }
}

- (double)_outerRadius
{
  [(HUColorWheelView *)self bounds];
  double v4 = v3;
  [(HUColorWheelView *)self bounds];
  return fmin(v4, v5) * 0.5;
}

- (id)wheelBezierPath
{
  [(HUColorWheelView *)self bounds];
  UIRectGetCenter();
  double v4 = v3;
  double v6 = v5;
  v7 = (void *)MEMORY[0x1E4F427D0];
  [(HUColorWheelView *)self _outerRadius];
  v9 = objc_msgSend(v7, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v4, v6, v8, 0.0, 6.28318531);
  v10 = (void *)MEMORY[0x1E4F427D0];
  [(HUColorWheelView *)self wheelHoleRadius];
  v12 = objc_msgSend(v10, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v4, v6, v11, 0.0, 6.28318531);
  [v9 appendPath:v12];

  [v9 setUsesEvenOddFillRule:1];

  return v9;
}

- (CGPoint)pointForColorWheelCoordinate:(id)a3
{
  double var0 = a3.var0;
  if (a3.var1 == 1.79769313e308) {
    double var1 = 0.5;
  }
  else {
    double var1 = a3.var1;
  }
  [(HUColorWheelView *)self wheelHoleRadius];
  double v7 = v6;
  [(HUColorWheelView *)self _outerRadius];
  double v9 = v7 + (v8 - v7) * var1;
  [(HUColorWheelView *)self bounds];
  UIRectGetCenter();
  double v11 = v10;
  double v13 = v12;
  __double2 v14 = __sincos_stret(var0 * 6.28318531);
  double v15 = v13 - v14.__sinval * v9;
  double v16 = v11 + v14.__cosval * v9;
  result.y = v15;
  result.x = v16;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)colorWheelCoordinateForPoint:(CGPoint)a3 boundedToWheel:(BOOL)a4
{
  double y = a3.y;
  double x = a3.x;
  [(HUColorWheelView *)self bounds];
  [(HUColorWheelView *)self wheelHoleRadius];

  HUColorWheelCoordinateForPoint(x, y);
  result.double var1 = v8;
  result.double var0 = v7;
  return result;
}

+ (double)_colorWheelRenderingScale
{
  return 1.0;
}

- (void)drawRect:(CGRect)a3
{
  double v4 = [(HUColorWheelView *)self wheelBezierPath];
  [v4 addClip];

  double v5 = [(HUColorWheelView *)self colorWheelSpace];

  if (!v5) {
    NSLog(&cfstr_MissingColorSp.isa, self);
  }
  [(HUColorWheelView *)self bounds];
  UIRectGetCenter();
  [(HUColorWheelView *)self bounds];
  double v6 = HUSizeRoundedToScreenScale();
  double v8 = v7;
  [(id)objc_opt_class() _colorWheelRenderingScale];
  [(HUColorWheelView *)self wheelHoleRadius];
  uint64_t v10 = v9;
  id v11 = [(HUColorWheelView *)self colorWheelSpace];
  unint64_t v12 = (unint64_t)v6;
  unint64_t v13 = (unint64_t)v8;
  if (*(uint64_t *)&v6 != *(uint64_t *)&v8)
  {
    v33.width = v6;
    v33.height = v8;
    __double2 v14 = NSStringFromCGSize(v33);
    NSLog(&cfstr_AttemptingToDr.isa, v14);
  }
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  double v16 = CGBitmapContextCreateWithData(0, (unint64_t)v6, (unint64_t)v8, 8uLL, 4 * v12, DeviceRGB, 0x4001u, 0, 0);
  Data = CGBitmapContextGetData(v16);
  long long v27 = *MEMORY[0x1E4F1DAD8];
  double v18 = (double)v13;
  size_t v19 = v12 * v13;
  v20 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __HUCreateColorWheelImage_block_invoke;
  block[3] = &unk_1E6387710;
  double v28 = (double)v12;
  double v29 = v18;
  uint64_t v30 = v10;
  id v25 = v11;
  unint64_t v26 = (unint64_t)v6;
  uint64_t v31 = 4;
  v32 = Data;
  id v21 = v11;
  dispatch_apply(v19, v20, block);

  Image = CGBitmapContextCreateImage(v16);
  v23 = [MEMORY[0x1E4F42A80] imageWithCGImage:Image scale:0 orientation:1.0];
  CGContextRelease(v16);
  CGColorSpaceRelease(DeviceRGB);
  CGImageRelease(Image);

  [v23 size];
  UIRectCenteredAboutPoint();
  objc_msgSend(v23, "drawInRect:");
}

- (double)wheelHoleRadius
{
  return self->_wheelHoleRadius;
}

- (HUColorWheelSpace)colorWheelSpace
{
  return self->_colorWheelSpace;
}

- (void).cxx_destruct
{
}

@end