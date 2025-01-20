@interface AVMobileContentTabPresentationContext
- (AVMobileContentTabTransitionContext)transitionContext;
- (UIViewController)customInfoViewController;
- (UIViewController)upcomingCustomInfoViewController;
- (double)presentationHeight;
- (unint64_t)contentTabsLayout;
- (unint64_t)state;
- (void)setContentTabsLayout:(unint64_t)a3;
- (void)setCustomInfoViewController:(id)a3;
- (void)setPresentationHeight:(double)a3;
- (void)setState:(unint64_t)a3;
- (void)setTransitionContext:(id)a3;
@end

@implementation AVMobileContentTabPresentationContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upcomingCustomInfoViewController, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);

  objc_storeStrong((id *)&self->_customInfoViewController, 0);
}

- (UIViewController)upcomingCustomInfoViewController
{
  return self->_upcomingCustomInfoViewController;
}

- (AVMobileContentTabTransitionContext)transitionContext
{
  return self->_transitionContext;
}

- (unint64_t)contentTabsLayout
{
  return self->_contentTabsLayout;
}

- (double)presentationHeight
{
  return self->_presentationHeight;
}

- (UIViewController)customInfoViewController
{
  return self->_customInfoViewController;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setTransitionContext:(id)a3
{
  v5 = (AVMobileContentTabTransitionContext *)a3;
  transitionContext = self->_transitionContext;
  p_transitionContext = &self->_transitionContext;
  if (transitionContext != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_transitionContext, a3);
    v5 = v8;
  }
}

- (void)setContentTabsLayout:(unint64_t)a3
{
  if (self->_contentTabsLayout != a3) {
    self->_contentTabsLayout = a3;
  }
}

- (void)setPresentationHeight:(double)a3
{
  if (self->_presentationHeight != a3) {
    self->_presentationHeight = a3;
  }
}

- (void)setCustomInfoViewController:(id)a3
{
  v5 = (UIViewController *)a3;
  customInfoViewController = self->_customInfoViewController;
  p_customInfoViewController = &self->_customInfoViewController;
  if (customInfoViewController != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_customInfoViewController, a3);
    v5 = v8;
  }
}

- (void)setState:(unint64_t)a3
{
  if (self->_state != a3) {
    self->_state = a3;
  }
}

@end