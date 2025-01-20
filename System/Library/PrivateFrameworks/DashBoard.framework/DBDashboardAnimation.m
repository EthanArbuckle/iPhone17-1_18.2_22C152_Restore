@interface DBDashboardAnimation
- (DBAppDockViewController)appDockViewController;
- (DBDashboardAnimation)initWithSettings:(id)a3;
- (NSString)toIdentifier;
- (UIColor)rootContainerBackgroundColor;
- (UIView)fromTransitionContainerView;
- (UIView)fromView;
- (UIView)rootContainerView;
- (UIView)toTransitionContainerView;
- (UIView)toView;
- (void)startAnimationWithCompletion:(id)a3;
@end

@implementation DBDashboardAnimation

- (DBDashboardAnimation)initWithSettings:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)DBDashboardAnimation;
  v5 = [(DBDashboardAnimation *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 appDockViewController];
    appDockViewController = v5->_appDockViewController;
    v5->_appDockViewController = (DBAppDockViewController *)v6;

    uint64_t v8 = [v4 fromTransitionContainerView];
    fromTransitionContainerView = v5->_fromTransitionContainerView;
    v5->_fromTransitionContainerView = (UIView *)v8;

    uint64_t v10 = [v4 fromView];
    fromView = v5->_fromView;
    v5->_fromView = (UIView *)v10;

    uint64_t v12 = [v4 toIdentifier];
    toIdentifier = v5->_toIdentifier;
    v5->_toIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 toTransitionContainerView];
    toTransitionContainerView = v5->_toTransitionContainerView;
    v5->_toTransitionContainerView = (UIView *)v14;

    uint64_t v16 = [v4 toView];
    toView = v5->_toView;
    v5->_toView = (UIView *)v16;

    uint64_t v18 = [v4 rootContainerView];
    rootContainerView = v5->_rootContainerView;
    v5->_rootContainerView = (UIView *)v18;

    uint64_t v20 = [v4 rootContainerBackgroundColor];
    rootContainerBackgroundColor = v5->_rootContainerBackgroundColor;
    v5->_rootContainerBackgroundColor = (UIColor *)v20;
  }
  return v5;
}

- (void)startAnimationWithCompletion:(id)a3
{
}

- (DBAppDockViewController)appDockViewController
{
  return self->_appDockViewController;
}

- (UIView)fromTransitionContainerView
{
  return self->_fromTransitionContainerView;
}

- (UIView)fromView
{
  return self->_fromView;
}

- (NSString)toIdentifier
{
  return self->_toIdentifier;
}

- (UIView)toTransitionContainerView
{
  return self->_toTransitionContainerView;
}

- (UIView)toView
{
  return self->_toView;
}

- (UIView)rootContainerView
{
  return self->_rootContainerView;
}

- (UIColor)rootContainerBackgroundColor
{
  return self->_rootContainerBackgroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootContainerBackgroundColor, 0);
  objc_storeStrong((id *)&self->_rootContainerView, 0);
  objc_storeStrong((id *)&self->_toView, 0);
  objc_storeStrong((id *)&self->_toTransitionContainerView, 0);
  objc_storeStrong((id *)&self->_toIdentifier, 0);
  objc_storeStrong((id *)&self->_fromView, 0);
  objc_storeStrong((id *)&self->_fromTransitionContainerView, 0);
  objc_storeStrong((id *)&self->_appDockViewController, 0);
}

@end