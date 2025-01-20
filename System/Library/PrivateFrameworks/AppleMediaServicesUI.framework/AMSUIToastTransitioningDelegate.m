@interface AMSUIToastTransitioningDelegate
- (id)_animator;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
@end

@implementation AMSUIToastTransitioningDelegate

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[AMSUIToastPresentationController alloc] initWithPresentedViewController:v7 presentingViewController:v6];

  return v8;
}

- (id)_animator
{
  BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  v3 = off_2643E2798;
  if (!IsReduceMotionEnabled) {
    v3 = off_2643E2810;
  }
  id v4 = objc_alloc_init(*v3);
  return v4;
}

@end