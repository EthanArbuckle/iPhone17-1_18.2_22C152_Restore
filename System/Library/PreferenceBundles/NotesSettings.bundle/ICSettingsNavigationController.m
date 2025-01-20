@interface ICSettingsNavigationController
- (ICSettingsNavigationController)initWithRootViewController:(id)a3 supportedInterfaceOrientations:(unint64_t)a4;
- (unint64_t)supportedInterfaceOrientations;
- (unint64_t)supportedInterfaceOrientationsMask;
- (void)setSupportedInterfaceOrientationsMask:(unint64_t)a3;
@end

@implementation ICSettingsNavigationController

- (ICSettingsNavigationController)initWithRootViewController:(id)a3 supportedInterfaceOrientations:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)ICSettingsNavigationController;
  result = [(ICSettingsNavigationController *)&v6 initWithRootViewController:a3];
  if (result) {
    result->_supportedInterfaceOrientationsMask = a4;
  }
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  return [(ICSettingsNavigationController *)self supportedInterfaceOrientationsMask];
}

- (unint64_t)supportedInterfaceOrientationsMask
{
  return self->_supportedInterfaceOrientationsMask;
}

- (void)setSupportedInterfaceOrientationsMask:(unint64_t)a3
{
  self->_supportedInterfaceOrientationsMask = a3;
}

@end