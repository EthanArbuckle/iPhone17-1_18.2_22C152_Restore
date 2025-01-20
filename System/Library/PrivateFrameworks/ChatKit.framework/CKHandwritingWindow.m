@interface CKHandwritingWindow
- (BOOL)_canAffectStatusBarAppearance;
- (BOOL)eatOrientationEvents;
- (void)_updateInterfaceOrientationFromDeviceOrientation:(BOOL)a3;
- (void)setEatOrientationEvents:(BOOL)a3;
@end

@implementation CKHandwritingWindow

- (BOOL)_canAffectStatusBarAppearance
{
  return 0;
}

- (void)_updateInterfaceOrientationFromDeviceOrientation:(BOOL)a3
{
  if (![(CKHandwritingWindow *)self eatOrientationEvents])
  {
    v4.receiver = self;
    v4.super_class = (Class)CKHandwritingWindow;
    [(CKHandwritingWindow *)&v4 _updateInterfaceOrientationFromDeviceOrientation:0];
  }
}

- (BOOL)eatOrientationEvents
{
  return self->_eatOrientationEvents;
}

- (void)setEatOrientationEvents:(BOOL)a3
{
  self->_eatOrientationEvents = a3;
}

@end