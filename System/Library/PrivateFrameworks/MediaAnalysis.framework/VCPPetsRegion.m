@interface VCPPetsRegion
- (CGRect)bound;
- (VCPPetsRegion)initWith:(CGRect)a3 confidence:(float)a4;
- (float)confidence;
- (void)setBound:(CGRect)a3;
- (void)setConfidence:(float)a3;
@end

@implementation VCPPetsRegion

- (VCPPetsRegion)initWith:(CGRect)a3 confidence:(float)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)VCPPetsRegion;
  result = [(VCPPetsRegion *)&v10 init];
  if (result)
  {
    result->_bound.origin.CGFloat x = x;
    result->_bound.origin.CGFloat y = y;
    result->_bound.size.CGFloat width = width;
    result->_bound.size.CGFloat height = height;
    result->_confidence = a4;
  }
  return result;
}

- (CGRect)bound
{
  objc_copyStruct(v6, &self->_bound, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (void)setBound:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_bound, &v3, 32, 1, 0);
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

@end