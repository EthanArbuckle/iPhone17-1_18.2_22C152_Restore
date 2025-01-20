@interface VCPKeypoint
- (CGPoint)location;
- (float)confidence;
- (void)setConfidence:(float)a3;
- (void)setLocation:(CGPoint)a3;
@end

@implementation VCPKeypoint

- (CGPoint)location
{
  double x = self->_location.x;
  double y = self->_location.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLocation:(CGPoint)a3
{
  self->_location = a3;
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