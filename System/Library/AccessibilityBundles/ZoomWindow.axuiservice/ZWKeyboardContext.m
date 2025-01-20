@interface ZWKeyboardContext
- (BOOL)isKeyboardVisible;
- (BOOL)userMovedKeyboardLens;
- (BOOL)zoomFollowsFocus;
- (BOOL)zoomRepositionsForKeyboard;
- (CGRect)keyboardFrame;
- (void)setKeyboardFrame:(CGRect)a3;
- (void)setUserMovedKeyboardLens:(BOOL)a3;
- (void)setZoomFollowsFocus:(BOOL)a3;
- (void)setZoomRepositionsForKeyboard:(BOOL)a3;
@end

@implementation ZWKeyboardContext

- (BOOL)isKeyboardVisible
{
  return !CGRectIsEmpty(self->_keyboardFrame);
}

- (CGRect)keyboardFrame
{
  double x = self->_keyboardFrame.origin.x;
  double y = self->_keyboardFrame.origin.y;
  double width = self->_keyboardFrame.size.width;
  double height = self->_keyboardFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setKeyboardFrame:(CGRect)a3
{
  self->_keyboardFrame = a3;
}

- (BOOL)zoomFollowsFocus
{
  return self->_zoomFollowsFocus;
}

- (void)setZoomFollowsFocus:(BOOL)a3
{
  self->_zoomFollowsFocus = a3;
}

- (BOOL)zoomRepositionsForKeyboard
{
  return self->_zoomRepositionsForKeyboard;
}

- (void)setZoomRepositionsForKeyboard:(BOOL)a3
{
  self->_zoomRepositionsForKeyboard = a3;
}

- (BOOL)userMovedKeyboardLens
{
  return self->_userMovedKeyboardLens;
}

- (void)setUserMovedKeyboardLens:(BOOL)a3
{
  self->_userMovedKeyboardLens = a3;
}

@end