@interface CCUIContentModuleDetailClickPresentationTransition
- (CCUIContentModuleDetailAnimationController)animationController;
- (CCUIContentModuleDetailClickPresentationTransition)initWithPresentedViewController:(id)a3 animationController:(id)a4;
- (UIViewController)presentedViewController;
- (UIViewPropertyAnimator)customAnimator;
- (void)performTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5;
- (void)transitionDidEnd:(BOOL)a3;
@end

@implementation CCUIContentModuleDetailClickPresentationTransition

- (CCUIContentModuleDetailClickPresentationTransition)initWithPresentedViewController:(id)a3 animationController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CCUIContentModuleDetailClickPresentationTransition;
  v9 = [(CCUIContentModuleDetailClickPresentationTransition *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_presentedViewController, a3);
    objc_storeStrong((id *)&v10->_animationController, a4);
  }

  return v10;
}

- (UIViewPropertyAnimator)customAnimator
{
  return [(CCUIContentModuleDetailAnimationController *)self->_animationController propertyAnimator];
}

- (void)performTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5
{
  id v8 = [(UIViewController *)self->_presentedViewController transitionCoordinator];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v8 _mainContext];
    if (v6)
    {
      id v7 = (void *)v6;
      [(CCUIContentModuleDetailAnimationController *)self->_animationController performTransition:v6];
    }
  }
}

- (void)transitionDidEnd:(BOOL)a3
{
  [(CCUIContentModuleDetailAnimationController *)self->_animationController animationEnded:a3];
  animationController = self->_animationController;
  self->_animationController = 0;
}

- (UIViewController)presentedViewController
{
  return self->_presentedViewController;
}

- (CCUIContentModuleDetailAnimationController)animationController
{
  return self->_animationController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_presentedViewController, 0);
}

@end