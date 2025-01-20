@interface GKNavigationControllerDeferredTransitionInfo
- (BOOL)animated;
- (UIViewController)viewController;
- (int)type;
- (void)setAnimated:(BOOL)a3;
- (void)setType:(int)a3;
- (void)setViewController:(id)a3;
@end

@implementation GKNavigationControllerDeferredTransitionInfo

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (BOOL)animated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (void).cxx_destruct
{
}

@end