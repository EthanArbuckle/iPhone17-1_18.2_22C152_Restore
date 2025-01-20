@interface AVPresentationContextTransition
- (BOOL)hasAVKitAnimator;
- (BOOL)isRotated;
- (BOOL)presenterSupportsOrientation:(int64_t)a3;
- (BOOL)wasCancelledWithInactiveScene;
- (BOOL)wasInitiallyInteractive;
- (CGAffineTransform)counterRotationTransform;
- (CGAffineTransform)rotationTransform;
- (int64_t)finalInterfaceOrientation;
- (int64_t)initialInterfaceOrientation;
- (int64_t)interfaceRotation;
- (unint64_t)presenterSupportedOrientations;
- (void)setFinalInterfaceOrientation:(int64_t)a3;
- (void)setHasAVKitAnimator:(BOOL)a3;
- (void)setInitialInterfaceOrientation:(int64_t)a3;
- (void)setPresenterSupportedOrientations:(unint64_t)a3;
- (void)setWasCancelledWithInactiveScene:(BOOL)a3;
- (void)setWasInitiallyInteractive:(BOOL)a3;
@end

@implementation AVPresentationContextTransition

- (void)setFinalInterfaceOrientation:(int64_t)a3
{
  self->_finalInterfaceOrientation = a3;
}

- (int64_t)finalInterfaceOrientation
{
  return self->_finalInterfaceOrientation;
}

- (void)setInitialInterfaceOrientation:(int64_t)a3
{
  self->_initialInterfaceOrientation = a3;
}

- (void)setPresenterSupportedOrientations:(unint64_t)a3
{
  self->_presenterSupportedOrientations = a3;
}

- (unint64_t)presenterSupportedOrientations
{
  return self->_presenterSupportedOrientations;
}

- (void)setWasCancelledWithInactiveScene:(BOOL)a3
{
  self->_wasCancelledWithInactiveScene = a3;
}

- (BOOL)wasCancelledWithInactiveScene
{
  return self->_wasCancelledWithInactiveScene;
}

- (void)setHasAVKitAnimator:(BOOL)a3
{
  self->_hasAVKitAnimator = a3;
}

- (BOOL)hasAVKitAnimator
{
  return self->_hasAVKitAnimator;
}

- (void)setWasInitiallyInteractive:(BOOL)a3
{
  self->_wasInitiallyInteractive = a3;
}

- (BOOL)wasInitiallyInteractive
{
  return self->_wasInitiallyInteractive;
}

- (int64_t)initialInterfaceOrientation
{
  BOOL v3 = [(AVPresentationContextTransition *)self wasCancelledWithInactiveScene];
  uint64_t v4 = 24;
  if (v3) {
    uint64_t v4 = 32;
  }
  return *(int64_t *)((char *)&self->super.isa + v4);
}

- (BOOL)presenterSupportsOrientation:(int64_t)a3
{
  return ((1 << a3) & ~[(AVPresentationContextTransition *)self presenterSupportedOrientations]) == 0;
}

- (BOOL)isRotated
{
  uint64_t v2 = [(AVPresentationContextTransition *)self interfaceRotation];
  if (v2 >= 0) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = -v2;
  }
  return v3 == 1;
}

- (int64_t)interfaceRotation
{
  int64_t v3 = [(AVPresentationContextTransition *)self initialInterfaceOrientation];
  int64_t v4 = [(AVPresentationContextTransition *)self finalInterfaceOrientation];
  uint64_t v5 = -1;
  uint64_t v6 = 1;
  if (v3 != 4) {
    uint64_t v6 = 2 * (v3 == 2);
  }
  if (v3 != 3) {
    uint64_t v5 = v6;
  }
  if (v3 == 1) {
    uint64_t v5 = 0;
  }
  uint64_t v7 = 1;
  uint64_t v8 = -1;
  uint64_t v9 = -2;
  if (v4 != 2) {
    uint64_t v9 = 0;
  }
  if (v4 != 4) {
    uint64_t v8 = v9;
  }
  if (v4 != 3) {
    uint64_t v7 = v8;
  }
  if (v4 == 1) {
    uint64_t v7 = 0;
  }
  return v7 + v5;
}

- (CGAffineTransform)counterRotationTransform
{
  double v4 = (double)-[(AVPresentationContextTransition *)self interfaceRotation] * 1.57079633;

  return CGAffineTransformMakeRotation(retstr, v4);
}

- (CGAffineTransform)rotationTransform
{
  double v4 = (double)[(AVPresentationContextTransition *)self interfaceRotation] * 1.57079633;

  return CGAffineTransformMakeRotation(retstr, v4);
}

@end