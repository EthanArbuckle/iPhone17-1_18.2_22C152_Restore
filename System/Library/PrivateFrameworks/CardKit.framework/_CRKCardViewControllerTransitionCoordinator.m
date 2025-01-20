@interface _CRKCardViewControllerTransitionCoordinator
- (BOOL)isAnimated;
- (UIView)containerView;
- (_CRKCardViewControllerTransitionCoordinator)init;
- (double)duration;
- (id)animations;
- (id)completion;
- (id)finalSetup;
- (id)initialSetup;
- (void)setAnimated:(BOOL)a3;
- (void)setAnimations:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setDuration:(double)a3;
- (void)setFinalSetup:(id)a3;
- (void)setInitialSetup:(id)a3;
@end

@implementation _CRKCardViewControllerTransitionCoordinator

- (_CRKCardViewControllerTransitionCoordinator)init
{
  v9.receiver = self;
  v9.super_class = (Class)_CRKCardViewControllerTransitionCoordinator;
  v2 = [(_CRKCardViewControllerTransitionCoordinator *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_animated = 0;
    id initialSetup = v2->_initialSetup;
    v2->_id initialSetup = 0;

    id finalSetup = v3->_finalSetup;
    v3->_id finalSetup = 0;

    id animations = v3->_animations;
    v3->_id animations = 0;

    id completion = v3->_completion;
    v3->_id completion = 0;

    objc_storeWeak((id *)&v3->_containerView, 0);
    v3->_duration = 0.2;
  }
  return v3;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (id)initialSetup
{
  return self->_initialSetup;
}

- (void)setInitialSetup:(id)a3
{
}

- (id)finalSetup
{
  return self->_finalSetup;
}

- (void)setFinalSetup:(id)a3
{
}

- (id)animations
{
  return self->_animations;
}

- (void)setAnimations:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (UIView)containerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);

  return (UIView *)WeakRetained;
}

- (void)setContainerView:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containerView);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_animations, 0);
  objc_storeStrong(&self->_finalSetup, 0);

  objc_storeStrong(&self->_initialSetup, 0);
}

@end