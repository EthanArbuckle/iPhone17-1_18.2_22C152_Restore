@interface DBStatusBarWindow
- (BOOL)_canBecomeKeyWindow;
- (BOOL)_reversesLinearFocusWrapping;
- (BOOL)isRightHandDrive;
- (void)setRightHandDrive:(BOOL)a3;
@end

@implementation DBStatusBarWindow

- (BOOL)_reversesLinearFocusWrapping
{
  v3 = [(DBStatusBarWindow *)self traitCollection];
  BOOL v4 = [v3 layoutDirection] == 0;

  return [(DBStatusBarWindow *)self isRightHandDrive] ^ v4;
}

- (BOOL)_canBecomeKeyWindow
{
  return 0;
}

- (BOOL)isRightHandDrive
{
  return self->_rightHandDrive;
}

- (void)setRightHandDrive:(BOOL)a3
{
  self->_rightHandDrive = a3;
}

@end