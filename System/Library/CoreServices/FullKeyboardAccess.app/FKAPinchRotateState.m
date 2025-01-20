@interface FKAPinchRotateState
- (BOOL)isPinchOrRotate;
- (BOOL)isSwipe;
- (int64_t)type;
- (void)setType:(int64_t)a3;
@end

@implementation FKAPinchRotateState

- (BOOL)isSwipe
{
  return 0;
}

- (BOOL)isPinchOrRotate
{
  return 1;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

@end