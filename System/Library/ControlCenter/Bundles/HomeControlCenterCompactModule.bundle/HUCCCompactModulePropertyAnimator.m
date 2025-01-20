@interface HUCCCompactModulePropertyAnimator
- (HUCCCompactModulePropertyAnimatorDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)startAnimation;
@end

@implementation HUCCCompactModulePropertyAnimator

- (void)startAnimation
{
  v4.receiver = self;
  v4.super_class = (Class)HUCCCompactModulePropertyAnimator;
  [(UIViewPropertyAnimator *)&v4 startAnimation];
  v3 = [(HUCCCompactModulePropertyAnimator *)self delegate];
  [v3 propertyAnimatorDidStartAnimating:self];
}

- (HUCCCompactModulePropertyAnimatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUCCCompactModulePropertyAnimatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end