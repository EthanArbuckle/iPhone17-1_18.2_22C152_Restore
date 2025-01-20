@interface EKUIAlertController
- (BOOL)prohibitsRotation;
- (unint64_t)supportedInterfaceOrientations;
- (void)setProhibitsRotation:(BOOL)a3;
@end

@implementation EKUIAlertController

- (unint64_t)supportedInterfaceOrientations
{
  if (self->_prohibitsRotation)
  {
    v2 = [(EKUIAlertController *)self view];
    v3 = [v2 window];
    v4 = [v3 windowScene];
    char v5 = [v4 interfaceOrientation];

    return 1 << v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)EKUIAlertController;
    return [(EKUIAlertController *)&v7 supportedInterfaceOrientations];
  }
}

- (void)setProhibitsRotation:(BOOL)a3
{
  if (self->_prohibitsRotation != a3)
  {
    self->_prohibitsRotation = a3;
    [(EKUIAlertController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
  }
}

- (BOOL)prohibitsRotation
{
  return self->_prohibitsRotation;
}

@end