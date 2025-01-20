@interface MPRootViewController
- (id)baseViewController;
@end

@implementation MPRootViewController

- (id)baseViewController
{
  baseViewController = self->_baseViewController;
  if (!baseViewController)
  {
    v4 = objc_alloc_init(PhoneTabBarController);
    v5 = self->_baseViewController;
    self->_baseViewController = (PhoneBaseViewController *)v4;

    [(MPRootViewController *)self addChildViewController:self->_baseViewController];
    baseViewController = self->_baseViewController;
  }

  return baseViewController;
}

- (void).cxx_destruct
{
}

@end