@interface CAMExposureBiasSliderThumb
- (CAMExposureBiasSliderThumb)initWithFrame:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (double)_interpolatedValueWithMin:(double)a3 mid:(double)a4 max:(double)a5;
- (double)_sunRadius;
- (double)_sunRayLength;
- (double)_sunRaySpacing;
- (double)maxRadius;
- (float)normalizedExposureValue;
- (void)drawRect:(CGRect)a3;
- (void)setNormalizedExposureValue:(float)a3;
@end

@implementation CAMExposureBiasSliderThumb

- (CAMExposureBiasSliderThumb)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMExposureBiasSliderThumb;
  v3 = -[CAMExposureBiasSliderThumb initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(CAMExposureBiasSliderThumb *)v3 setOpaque:0];
  }
  return v4;
}

- (void)setNormalizedExposureValue:(float)a3
{
  if (self->_normalizedExposureValue != a3)
  {
    self->_normalizedExposureValue = a3;
    [(CAMExposureBiasSliderThumb *)self setNeedsDisplay];
  }
}

- (double)maxRadius
{
  return 14.5;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(CAMExposureBiasSliderThumb *)self _sunRadius];
  [(CAMExposureBiasSliderThumb *)self _sunRaySpacing];
  [(CAMExposureBiasSliderThumb *)self _sunRayLength];
  UICeilToViewScale();
  double v5 = v4 + v4;
  double v6 = v5;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  [(CAMExposureBiasSliderThumb *)self bounds];
  CGFloat x = v24.origin.x;
  CGFloat y = v24.origin.y;
  CGFloat width = v24.size.width;
  CGFloat height = v24.size.height;
  double MidX = CGRectGetMidX(v24);
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v25);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v22 = [(CAMExposureBiasSliderThumb *)self tintColor];
  [v22 set];
  [(CAMExposureBiasSliderThumb *)self _sunRadius];
  double v12 = v11;
  CGContextBeginPath(CurrentContext);
  CGContextMoveToPoint(CurrentContext, MidX + v12, MidY);
  double v13 = 0.0;
  CGContextAddArc(CurrentContext, MidX, MidY, v12, 0.0, 6.28318531, 0);
  CGContextClosePath(CurrentContext);
  CGContextFillPath(CurrentContext);
  CGContextBeginPath(CurrentContext);
  [(CAMExposureBiasSliderThumb *)self _sunRadius];
  double v15 = v14;
  [(CAMExposureBiasSliderThumb *)self _sunRaySpacing];
  double v17 = v15 + v16;
  [(CAMExposureBiasSliderThumb *)self _sunRayLength];
  double v19 = v17 + v18;
  int v20 = 8;
  do
  {
    __double2 v21 = __sincos_stret(v13 * 0.785398163);
    CGContextMoveToPoint(CurrentContext, MidX + v17 * v21.__cosval, MidY + v17 * v21.__sinval);
    CGContextAddLineToPoint(CurrentContext, MidX + v19 * v21.__cosval, MidY + v19 * v21.__sinval);
    double v13 = v13 + 1.0;
    --v20;
  }
  while (v20);
  CGContextClosePath(CurrentContext);
  CGContextStrokePath(CurrentContext);
}

- (double)_interpolatedValueWithMin:(double)a3 mid:(double)a4 max:(double)a5
{
  float normalizedExposureValue = self->_normalizedExposureValue;
  double v6 = normalizedExposureValue;
  if (normalizedExposureValue >= 0.5) {
    return a4 + (v6 + -0.5 + v6 + -0.5) * (a5 - a4);
  }
  else {
    return a3 + (v6 + v6) * (a4 - a3);
  }
}

- (double)_sunRadius
{
  [(CAMExposureBiasSliderThumb *)self _interpolatedValueWithMin:6.0 mid:9.0 max:11.0];
  return v2 * 0.5;
}

- (double)_sunRayLength
{
  [(CAMExposureBiasSliderThumb *)self _interpolatedValueWithMin:3.5 mid:5.0 max:6.0];
  return result;
}

- (double)_sunRaySpacing
{
  [(CAMExposureBiasSliderThumb *)self _interpolatedValueWithMin:2.0 mid:3.0 max:3.0];
  return result;
}

- (float)normalizedExposureValue
{
  return self->_normalizedExposureValue;
}

@end