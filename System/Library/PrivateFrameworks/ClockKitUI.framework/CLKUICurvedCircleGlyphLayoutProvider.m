@interface CLKUICurvedCircleGlyphLayoutProvider
- (CGAffineTransform)makeTransform;
- (CGPoint)layoutLocation;
- (CGRect)bounds;
- (CLKUICurvedCircleGlyphLayoutProvider)init;
- (double)centerAngle;
- (double)circleRadius;
- (double)distance;
- (double)extraWidthForImage;
- (double)maxAngularWidth;
- (double)maxTextWidth;
- (double)usedWidth;
- (void)setBounds:(CGRect)a3;
- (void)setCenterAngle:(double)a3;
- (void)setCircleRadius:(double)a3;
- (void)setDistance:(double)a3;
- (void)setExtraWidthForImage:(double)a3;
- (void)setLayoutLocation:(CGPoint)a3;
- (void)setMaxAngularWidth:(double)a3;
- (void)setUsedWidth:(double)a3;
@end

@implementation CLKUICurvedCircleGlyphLayoutProvider

- (CLKUICurvedCircleGlyphLayoutProvider)init
{
  v4.receiver = self;
  v4.super_class = (Class)CLKUICurvedCircleGlyphLayoutProvider;
  result = [(CLKUICurvedCircleGlyphLayoutProvider *)&v4 init];
  if (result)
  {
    *(_OWORD *)&result->_extraWidthForImage = 0u;
    *(_OWORD *)&result->_maxAngularWidth = 0u;
    result->_layoutLocation = (CGPoint)*MEMORY[0x1E4F1DAD8];
    result->_usedWidth = 0.0;
    result->_distance = 0.0;
    CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    result->_bounds.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    result->_bounds.size = v3;
  }
  return result;
}

- (double)maxTextWidth
{
  double maxAngularWidth = self->_maxAngularWidth;
  if (fabs(maxAngularWidth) >= 0.00000011920929
    && (double circleRadius = self->_circleRadius, fabs(circleRadius) >= 0.00000011920929))
  {
    if (maxAngularWidth > 3.14159265) {
      double maxAngularWidth = 6.28318531 - maxAngularWidth;
    }
    double v4 = maxAngularWidth * circleRadius;
  }
  else
  {
    double v4 = 1.79769313e308;
  }
  return v4 - self->_extraWidthForImage;
}

- (CGAffineTransform)makeTransform
{
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  double distance = self->_distance;
  double x = self->_layoutLocation.x;
  if (fabs(distance) >= 0.00000011920929)
  {
    double centerAngle = self->_centerAngle;
    double v10 = centerAngle + (x + self->_usedWidth * -0.5) / distance;
    CGFloat v11 = self->_bounds.origin.x;
    double y = self->_layoutLocation.y;
    CGFloat v12 = self->_bounds.origin.y;
    CGFloat width = self->_bounds.size.width;
    CGFloat height = self->_bounds.size.height;
    v26.origin.double x = v11;
    v26.origin.double y = v12;
    v26.size.CGFloat width = width;
    v26.size.CGFloat height = height;
    double MidX = CGRectGetMidX(v26);
    __double2 v16 = __sincos_stret(centerAngle);
    v27.origin.double x = v11;
    v27.origin.double y = v12;
    v27.size.CGFloat width = width;
    v27.size.CGFloat height = height;
    double v17 = y + CGRectGetMinY(v27) - distance * v16.__cosval;
    double v18 = self->_distance;
    __double2 v19 = __sincos_stret(v10);
    CGAffineTransformMakeTranslation(retstr, MidX - distance * v16.__sinval + v18 * v19.__sinval, v17 + v18 * v19.__cosval);
    long long v20 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v23.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v23.c = v20;
    *(_OWORD *)&v23.tdouble x = *(_OWORD *)&retstr->tx;
    result = CGAffineTransformRotate(&v24, &v23, -v10);
    long long v21 = *(_OWORD *)&v24.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v24.a;
    *(_OWORD *)&retstr->c = v21;
    *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v24.tx;
  }
  else
  {
    CGFloat v7 = self->_layoutLocation.y;
    return CGAffineTransformMakeTranslation(retstr, x, v7);
  }
  return result;
}

- (double)maxAngularWidth
{
  return self->_maxAngularWidth;
}

- (void)setMaxAngularWidth:(double)a3
{
  self->_double maxAngularWidth = a3;
}

- (double)circleRadius
{
  return self->_circleRadius;
}

- (void)setCircleRadius:(double)a3
{
  self->_double circleRadius = a3;
}

- (double)extraWidthForImage
{
  return self->_extraWidthForImage;
}

- (void)setExtraWidthForImage:(double)a3
{
  self->_extraWidthForImage = a3;
}

- (double)centerAngle
{
  return self->_centerAngle;
}

- (void)setCenterAngle:(double)a3
{
  self->_double centerAngle = a3;
}

- (CGPoint)layoutLocation
{
  double x = self->_layoutLocation.x;
  double y = self->_layoutLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLayoutLocation:(CGPoint)a3
{
  self->_layoutLocation = a3;
}

- (double)usedWidth
{
  return self->_usedWidth;
}

- (void)setUsedWidth:(double)a3
{
  self->_usedWidth = a3;
}

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  self->_double distance = a3;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

@end