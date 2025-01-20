@interface CKAppMenuPresentationAnimator
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation CKAppMenuPresentationAnimator

- (void)animateTransition:(id)a3
{
  uint64_t v3 = *MEMORY[0x1E4F43EC0];
  id v4 = a3;
  id v16 = [v4 viewControllerForKey:v3];
  v5 = [v4 containerView];
  v6 = [v16 view];
  [v5 addSubview:v6];

  [v4 finalFrameForViewController:v16];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = [v16 view];
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  [v4 completeTransition:1];
}

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

@end