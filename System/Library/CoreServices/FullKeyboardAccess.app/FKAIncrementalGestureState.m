@interface FKAIncrementalGestureState
- (BOOL)isPinchOrRotate;
- (BOOL)isSwipe;
- (CGPoint)startFingerControllerPoint;
- (NSDate)gestureStartTime;
- (NSTimer)gestureUpdateTimer;
- (NSTimer)startGestureTimer;
- (void)setGestureStartTime:(id)a3;
- (void)setGestureUpdateTimer:(id)a3;
- (void)setStartFingerControllerPoint:(CGPoint)a3;
- (void)setStartGestureTimer:(id)a3;
@end

@implementation FKAIncrementalGestureState

- (CGPoint)startFingerControllerPoint
{
  double x = self->_startFingerControllerPoint.x;
  double y = self->_startFingerControllerPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setStartFingerControllerPoint:(CGPoint)a3
{
  self->_startFingerControllerPoint = a3;
}

- (NSDate)gestureStartTime
{
  return self->_gestureStartTime;
}

- (void)setGestureStartTime:(id)a3
{
}

- (NSTimer)startGestureTimer
{
  return self->_startGestureTimer;
}

- (void)setStartGestureTimer:(id)a3
{
}

- (NSTimer)gestureUpdateTimer
{
  return self->_gestureUpdateTimer;
}

- (void)setGestureUpdateTimer:(id)a3
{
}

- (BOOL)isSwipe
{
  return self->_isSwipe;
}

- (BOOL)isPinchOrRotate
{
  return self->_isPinchOrRotate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureUpdateTimer, 0);
  objc_storeStrong((id *)&self->_startGestureTimer, 0);

  objc_storeStrong((id *)&self->_gestureStartTime, 0);
}

@end