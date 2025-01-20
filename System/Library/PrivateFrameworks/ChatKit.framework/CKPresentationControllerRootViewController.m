@interface CKPresentationControllerRootViewController
- (BOOL)allowsRotation;
- (BOOL)allowsStatusBarChanges;
- (BOOL)restrictedToPortraitOrientation;
- (unint64_t)supportedInterfaceOrientations;
- (void)setAllowsRotation:(BOOL)a3;
- (void)setAllowsStatusBarChanges:(BOOL)a3;
- (void)setRestrictedToPortraitOrientation:(BOOL)a3;
@end

@implementation CKPresentationControllerRootViewController

- (unint64_t)supportedInterfaceOrientations
{
  if ([(CKPresentationControllerRootViewController *)self restrictedToPortraitOrientation])
  {
    return 2;
  }
  v4.receiver = self;
  v4.super_class = (Class)CKPresentationControllerRootViewController;
  return [(CKPresentationControllerRootViewController *)&v4 supportedInterfaceOrientations];
}

- (BOOL)allowsRotation
{
  return self->_allowsRotation;
}

- (void)setAllowsRotation:(BOOL)a3
{
  self->_allowsRotation = a3;
}

- (BOOL)allowsStatusBarChanges
{
  return self->_allowsStatusBarChanges;
}

- (void)setAllowsStatusBarChanges:(BOOL)a3
{
  self->_allowsStatusBarChanges = a3;
}

- (BOOL)restrictedToPortraitOrientation
{
  return self->_restrictedToPortraitOrientation;
}

- (void)setRestrictedToPortraitOrientation:(BOOL)a3
{
  self->_restrictedToPortraitOrientation = a3;
}

@end