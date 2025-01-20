@interface BodyPoint
- (BodyPoint)init;
- (CGPoint)location;
- (float)score;
- (void)dealloc;
- (void)setLocation:(CGPoint)a3;
- (void)setScore:(float)a3;
@end

@implementation BodyPoint

- (BodyPoint)init
{
  v3.receiver = self;
  v3.super_class = (Class)BodyPoint;
  return [(BodyPoint *)&v3 init];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)BodyPoint;
  [(BodyPoint *)&v2 dealloc];
}

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

- (float)score
{
  return self->_score;
}

- (void)setScore:(float)a3
{
  self->_score = a3;
}

@end