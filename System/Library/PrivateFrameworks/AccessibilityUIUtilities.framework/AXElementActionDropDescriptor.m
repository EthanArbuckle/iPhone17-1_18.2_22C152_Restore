@interface AXElementActionDropDescriptor
- (CGPoint)contextSpacePoint;
- (CGPoint)fixedScreenSpacePoint;
- (unsigned)contextID;
- (void)setContextID:(unsigned int)a3;
- (void)setContextSpacePoint:(CGPoint)a3;
- (void)setFixedScreenSpacePoint:(CGPoint)a3;
@end

@implementation AXElementActionDropDescriptor

- (CGPoint)fixedScreenSpacePoint
{
  double x = self->_fixedScreenSpacePoint.x;
  double y = self->_fixedScreenSpacePoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setFixedScreenSpacePoint:(CGPoint)a3
{
  self->_fixedScreenSpacePoint = a3;
}

- (CGPoint)contextSpacePoint
{
  double x = self->_contextSpacePoint.x;
  double y = self->_contextSpacePoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setContextSpacePoint:(CGPoint)a3
{
  self->_contextSpacePoint = a3;
}

- (unsigned)contextID
{
  return self->_contextID;
}

- (void)setContextID:(unsigned int)a3
{
  self->_contextID = a3;
}

@end