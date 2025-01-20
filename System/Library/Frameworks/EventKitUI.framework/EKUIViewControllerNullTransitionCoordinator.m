@interface EKUIViewControllerNullTransitionCoordinator
- (BOOL)animateAlongsideTransition:(id)a3 completion:(id)a4;
- (BOOL)animateAlongsideTransitionInView:(id)a3 animation:(id)a4 completion:(id)a5;
- (BOOL)initiallyInteractive;
- (BOOL)isAnimated;
- (BOOL)isCancelled;
- (BOOL)isInteractive;
- (BOOL)isInterruptible;
- (CGAffineTransform)targetTransform;
- (UIView)containerView;
- (double)completionVelocity;
- (double)percentComplete;
- (double)transitionDuration;
- (id)viewControllerForKey:(id)a3;
- (id)viewForKey:(id)a3;
- (int64_t)completionCurve;
- (int64_t)presentationStyle;
@end

@implementation EKUIViewControllerNullTransitionCoordinator

- (BOOL)isCancelled
{
  return 0;
}

- (CGAffineTransform)targetTransform
{
  uint64_t v3 = MEMORY[0x1E4F1DAB8];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v3 + 32);
  return self;
}

- (double)percentComplete
{
  return 0.0;
}

- (BOOL)isInteractive
{
  return 0;
}

- (UIView)containerView
{
  v2 = objc_opt_new();

  return (UIView *)v2;
}

- (int64_t)completionCurve
{
  return 0;
}

- (double)transitionDuration
{
  return 0.0;
}

- (BOOL)initiallyInteractive
{
  return 0;
}

- (BOOL)isInterruptible
{
  return 0;
}

- (int64_t)presentationStyle
{
  return 0;
}

- (double)completionVelocity
{
  return 0.0;
}

- (BOOL)isAnimated
{
  return 0;
}

- (id)viewControllerForKey:(id)a3
{
  return 0;
}

- (id)viewForKey:(id)a3
{
  return 0;
}

- (BOOL)animateAlongsideTransition:(id)a3 completion:(id)a4
{
  return 0;
}

- (BOOL)animateAlongsideTransitionInView:(id)a3 animation:(id)a4 completion:(id)a5
{
  return 0;
}

@end