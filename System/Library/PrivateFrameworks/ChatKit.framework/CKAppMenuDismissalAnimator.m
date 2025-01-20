@interface CKAppMenuDismissalAnimator
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation CKAppMenuDismissalAnimator

- (void)animateTransition:(id)a3
{
  uint64_t v3 = *MEMORY[0x1E4F43EB0];
  id v4 = a3;
  id v6 = [v4 viewControllerForKey:v3];
  v5 = [v6 view];
  [v5 removeFromSuperview];

  [v4 completeTransition:1];
}

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

@end