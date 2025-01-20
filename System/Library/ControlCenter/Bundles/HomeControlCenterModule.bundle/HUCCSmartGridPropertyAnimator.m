@interface HUCCSmartGridPropertyAnimator
- (HUCCSmartGridPropertyAnimatorDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)startAnimation;
@end

@implementation HUCCSmartGridPropertyAnimator

- (void)startAnimation
{
  v7.receiver = self;
  v7.super_class = (Class)HUCCSmartGridPropertyAnimator;
  [(UIViewPropertyAnimator *)&v7 startAnimation];
  v5 = objc_msgSend_delegate(self, v3, v4);
  objc_msgSend_propertyAnimatorDidStartAnimating_(v5, v6, (uint64_t)self);
}

- (HUCCSmartGridPropertyAnimatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUCCSmartGridPropertyAnimatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end