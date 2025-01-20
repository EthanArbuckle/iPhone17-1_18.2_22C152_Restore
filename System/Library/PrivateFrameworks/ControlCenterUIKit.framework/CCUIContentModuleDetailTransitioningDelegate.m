@interface CCUIContentModuleDetailTransitioningDelegate
- (CCUIContentModuleDetailTransitioningDelegate)initWithAnchoringViewController:(id)a3;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
@end

@implementation CCUIContentModuleDetailTransitioningDelegate

- (CCUIContentModuleDetailTransitioningDelegate)initWithAnchoringViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CCUIContentModuleDetailTransitioningDelegate;
  v6 = [(CCUIContentModuleDetailTransitioningDelegate *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_anchoringViewController, a3);
  }

  return v7;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  objc_super v9 = [[CCUIContentModuleDetailPresentationController alloc] initWithPresentedViewController:v8 presentingViewController:v7 anchoringViewController:self->_anchoringViewController];

  return v9;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v5 = [[CCUIContentModuleDetailAnimationController alloc] initForPresenting:1 anchoringViewController:self->_anchoringViewController];
  return v5;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v3 = [[CCUIContentModuleDetailAnimationController alloc] initForPresenting:0 anchoringViewController:self->_anchoringViewController];
  return v3;
}

- (void).cxx_destruct
{
}

@end