@interface ITKLineSegment
- (CGPoint)endPoint;
- (CGPoint)startPoint;
- (void)setEndPoint:(CGPoint)a3;
- (void)setStartPoint:(CGPoint)a3;
@end

@implementation ITKLineSegment

- (CGPoint)startPoint
{
  double x = self->_startPoint.x;
  double y = self->_startPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setStartPoint:(CGPoint)a3
{
  self->_startPoint = a3;
}

- (CGPoint)endPoint
{
  double x = self->_endPoint.x;
  double y = self->_endPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setEndPoint:(CGPoint)a3
{
  self->_endPoint = a3;
}

@end