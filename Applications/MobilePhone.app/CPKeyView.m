@interface CPKeyView
- (BOOL)canBecomeFocused;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)keyIndex;
- (void)setKeyIndex:(int64_t)a3;
@end

@implementation CPKeyView

- (BOOL)canBecomeFocused
{
  return 1;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (int64_t)keyIndex
{
  return self->_keyIndex;
}

- (void)setKeyIndex:(int64_t)a3
{
  self->_keyIndex = a3;
}

@end