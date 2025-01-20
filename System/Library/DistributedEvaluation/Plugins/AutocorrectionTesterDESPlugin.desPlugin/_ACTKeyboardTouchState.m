@interface _ACTKeyboardTouchState
- (BOOL)dragged;
- (CGPoint)initialDragPoint;
- (TIKeyboardTouchEvent)lastTouchEvent;
- (void)setDragged:(BOOL)a3;
- (void)setInitialDragPoint:(CGPoint)a3;
- (void)setLastTouchEvent:(id)a3;
@end

@implementation _ACTKeyboardTouchState

- (TIKeyboardTouchEvent)lastTouchEvent
{
  return self->_lastTouchEvent;
}

- (void)setLastTouchEvent:(id)a3
{
}

- (CGPoint)initialDragPoint
{
  double x = self->_initialDragPoint.x;
  double y = self->_initialDragPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialDragPoint:(CGPoint)a3
{
  self->_initialDragPoint = a3;
}

- (BOOL)dragged
{
  return self->_dragged;
}

- (void)setDragged:(BOOL)a3
{
  self->_dragged = a3;
}

- (void).cxx_destruct
{
}

@end