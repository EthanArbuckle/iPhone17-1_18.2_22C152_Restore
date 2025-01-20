@interface AVPanGestureIncrement
+ (AVPanGestureIncrement)gestureIncrementWithTranslation:(CGPoint)a3 velocity:(CGPoint)a4 timestamp:(double)a5 hasMultipleTouches:(BOOL)a6;
- (BOOL)hasMultipleTouches;
- (CGPoint)translation;
- (CGPoint)velocity;
- (double)timestamp;
- (id)debugDescription;
@end

@implementation AVPanGestureIncrement

- (BOOL)hasMultipleTouches
{
  return self->_hasMultipleTouches;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (CGPoint)velocity
{
  double x = self->_velocity.x;
  double y = self->_velocity.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)translation
{
  double x = self->_translation.x;
  double y = self->_translation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"translation: (%f, %f)  velocity: (%f, %f)  hasMultipleTouches: %d  horizontalSkew: %f", *(void *)&self->_translation.x, *(void *)&self->_translation.y, *(void *)&self->_velocity.x, *(void *)&self->_velocity.y, self->_hasMultipleTouches, self->_velocity.x / self->_velocity.y];
}

+ (AVPanGestureIncrement)gestureIncrementWithTranslation:(CGPoint)a3 velocity:(CGPoint)a4 timestamp:(double)a5 hasMultipleTouches:(BOOL)a6
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat v10 = a3.y;
  CGFloat v11 = a3.x;
  v12 = objc_alloc_init(AVPanGestureIncrement);
  v12->_translation.CGFloat y = v10;
  v12->_velocity.CGFloat x = x;
  v12->_velocity.CGFloat y = y;
  v12->_hasMultipleTouches = a6;
  v12->_timestamp = a5;
  v12->_translation.CGFloat x = v11;

  return v12;
}

@end