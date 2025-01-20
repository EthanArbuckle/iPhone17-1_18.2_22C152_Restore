@interface CKNoAnimationSearchFieldAnimator
- (BOOL)isAppearing;
- (CKNoAnimationSearchFieldAnimator)initWithAppearing:(BOOL)a3;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
- (void)setAppearing:(BOOL)a3;
@end

@implementation CKNoAnimationSearchFieldAnimator

- (CKNoAnimationSearchFieldAnimator)initWithAppearing:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKNoAnimationSearchFieldAnimator;
  result = [(CKNoAnimationSearchFieldAnimator *)&v5 init];
  if (result) {
    result->_appearing = a3;
  }
  return result;
}

- (void)animateTransition:(id)a3
{
  id v6 = a3;
  if ([(CKNoAnimationSearchFieldAnimator *)self isAppearing])
  {
    v4 = [v6 viewForKey:*MEMORY[0x1E4F43EC8]];
    objc_super v5 = [v6 containerView];
    [v5 bounds];
    objc_msgSend(v4, "setFrame:");
    [v5 addSubview:v4];
  }
  else
  {
    v4 = [v6 viewForKey:*MEMORY[0x1E4F43EB8]];
    [v4 removeFromSuperview];
  }

  [v6 completeTransition:1];
}

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

- (BOOL)isAppearing
{
  return self->_appearing;
}

- (void)setAppearing:(BOOL)a3
{
  self->_appearing = a3;
}

@end