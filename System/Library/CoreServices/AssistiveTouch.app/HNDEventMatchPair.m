@interface HNDEventMatchPair
- (CGPoint)point;
- (double)time;
- (void)setPoint:(CGPoint)a3;
- (void)setTime:(double)a3;
@end

@implementation HNDEventMatchPair

- (CGPoint)point
{
  double x = self->point.x;
  double y = self->point.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPoint:(CGPoint)a3
{
  self->point = a3;
}

- (double)time
{
  return self->time;
}

- (void)setTime:(double)a3
{
  self->time = a3;
}

@end