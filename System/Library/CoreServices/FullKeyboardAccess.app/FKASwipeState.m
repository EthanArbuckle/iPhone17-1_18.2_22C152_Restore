@interface FKASwipeState
- (BOOL)isPinchOrRotate;
- (BOOL)isSwipe;
- (int64_t)direction;
- (unint64_t)numberOfFingers;
- (void)setDirection:(int64_t)a3;
- (void)setNumberOfFingers:(unint64_t)a3;
@end

@implementation FKASwipeState

- (BOOL)isSwipe
{
  return 1;
}

- (BOOL)isPinchOrRotate
{
  return 0;
}

- (int64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (unint64_t)numberOfFingers
{
  return self->_numberOfFingers;
}

- (void)setNumberOfFingers:(unint64_t)a3
{
  self->_numberOfFingers = a3;
}

@end