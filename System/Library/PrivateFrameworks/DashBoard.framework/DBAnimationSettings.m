@interface DBAnimationSettings
- (DBAppDockViewController)appDockViewController;
- (NSString)toIdentifier;
- (UIColor)rootContainerBackgroundColor;
- (UIView)fromTransitionContainerView;
- (UIView)fromView;
- (UIView)rootContainerView;
- (UIView)toTransitionContainerView;
- (UIView)toView;
- (void)setAppDockViewController:(id)a3;
- (void)setFromTransitionContainerView:(id)a3;
- (void)setFromView:(id)a3;
- (void)setRootContainerBackgroundColor:(id)a3;
- (void)setRootContainerView:(id)a3;
- (void)setToIdentifier:(id)a3;
- (void)setToTransitionContainerView:(id)a3;
- (void)setToView:(id)a3;
@end

@implementation DBAnimationSettings

- (UIView)rootContainerView
{
  return self->_rootContainerView;
}

- (void)setRootContainerView:(id)a3
{
}

- (UIColor)rootContainerBackgroundColor
{
  return self->_rootContainerBackgroundColor;
}

- (void)setRootContainerBackgroundColor:(id)a3
{
}

- (UIView)toView
{
  return self->_toView;
}

- (void)setToView:(id)a3
{
}

- (UIView)toTransitionContainerView
{
  return self->_toTransitionContainerView;
}

- (void)setToTransitionContainerView:(id)a3
{
}

- (UIView)fromView
{
  return self->_fromView;
}

- (void)setFromView:(id)a3
{
}

- (UIView)fromTransitionContainerView
{
  return self->_fromTransitionContainerView;
}

- (void)setFromTransitionContainerView:(id)a3
{
}

- (DBAppDockViewController)appDockViewController
{
  return self->_appDockViewController;
}

- (void)setAppDockViewController:(id)a3
{
}

- (NSString)toIdentifier
{
  return self->_toIdentifier;
}

- (void)setToIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toIdentifier, 0);
  objc_storeStrong((id *)&self->_appDockViewController, 0);
  objc_storeStrong((id *)&self->_fromTransitionContainerView, 0);
  objc_storeStrong((id *)&self->_fromView, 0);
  objc_storeStrong((id *)&self->_toTransitionContainerView, 0);
  objc_storeStrong((id *)&self->_toView, 0);
  objc_storeStrong((id *)&self->_rootContainerBackgroundColor, 0);
  objc_storeStrong((id *)&self->_rootContainerView, 0);
}

@end