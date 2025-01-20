@interface AVMobileContentTabTransitionContext
- (AVPlayerViewControllerAnimationCoordinator)animationCoordinator;
- (unint64_t)direction;
- (void)setAnimationCoordinator:(id)a3;
- (void)setDirection:(unint64_t)a3;
@end

@implementation AVMobileContentTabTransitionContext

- (void).cxx_destruct
{
}

- (AVPlayerViewControllerAnimationCoordinator)animationCoordinator
{
  return self->_animationCoordinator;
}

- (unint64_t)direction
{
  return self->_direction;
}

- (void)setAnimationCoordinator:(id)a3
{
  v5 = (AVPlayerViewControllerAnimationCoordinator *)a3;
  animationCoordinator = self->_animationCoordinator;
  p_animationCoordinator = &self->_animationCoordinator;
  if (animationCoordinator != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_animationCoordinator, a3);
    v5 = v8;
  }
}

- (void)setDirection:(unint64_t)a3
{
  if (self->_direction != a3) {
    self->_direction = a3;
  }
}

@end