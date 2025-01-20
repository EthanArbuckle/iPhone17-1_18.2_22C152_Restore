@interface GCKeyboardButtonElement
- (int64_t)keyCode;
- (void)setKeyCode:(int64_t)a3;
@end

@implementation GCKeyboardButtonElement

- (int64_t)keyCode
{
  return self->_keyCode;
}

- (void)setKeyCode:(int64_t)a3
{
  self->_keyCode = a3;
}

@end