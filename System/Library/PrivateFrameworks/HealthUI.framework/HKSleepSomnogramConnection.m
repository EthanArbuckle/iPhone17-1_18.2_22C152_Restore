@interface HKSleepSomnogramConnection
- (CGPoint)endPoint;
- (CGPoint)startPoint;
- (HKSleepSomnogramConnection)initWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4;
- (void)setEndPoint:(CGPoint)a3;
- (void)setStartPoint:(CGPoint)a3;
@end

@implementation HKSleepSomnogramConnection

- (HKSleepSomnogramConnection)initWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat v6 = a3.y;
  CGFloat v7 = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)HKSleepSomnogramConnection;
  result = [(HKSleepSomnogramConnection *)&v9 init];
  if (result)
  {
    result->_startPoint.CGFloat x = v7;
    result->_startPoint.CGFloat y = v6;
    result->_endPoint.CGFloat x = x;
    result->_endPoint.CGFloat y = y;
  }
  return result;
}

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