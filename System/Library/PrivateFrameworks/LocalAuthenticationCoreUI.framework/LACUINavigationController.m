@interface LACUINavigationController
- (BOOL)_canShowWhileLocked;
- (BOOL)shouldTrackPreferredContentSize;
- (void)_preferredContentSizeDidChangeForChildViewController:(id)a3;
- (void)setShouldTrackPreferredContentSize:(BOOL)a3;
@end

@implementation LACUINavigationController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_preferredContentSizeDidChangeForChildViewController:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)LACUINavigationController;
  [(LACUINavigationController *)&v5 _preferredContentSizeDidChangeForChildViewController:v4];
  if ([(LACUINavigationController *)self shouldTrackPreferredContentSize])
  {
    [v4 preferredContentSize];
    -[LACUINavigationController setPreferredContentSize:](self, "setPreferredContentSize:");
  }
}

- (BOOL)shouldTrackPreferredContentSize
{
  return self->_shouldTrackPreferredContentSize;
}

- (void)setShouldTrackPreferredContentSize:(BOOL)a3
{
  self->_shouldTrackPreferredContentSize = a3;
}

@end