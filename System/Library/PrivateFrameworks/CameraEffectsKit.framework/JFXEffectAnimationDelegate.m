@interface JFXEffectAnimationDelegate
- (BOOL)animationDidBegin;
- (BOOL)animationDidEnd;
- (id)completion;
- (void)animateWithCompletion:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)setAnimationDidBegin:(BOOL)a3;
- (void)setAnimationDidEnd:(BOOL)a3;
- (void)setCompletion:(id)a3;
@end

@implementation JFXEffectAnimationDelegate

- (void)animateWithCompletion:(id)a3
{
  id v4 = a3;
  [(JFXEffectAnimationDelegate *)self setAnimationDidBegin:1];
  [(JFXEffectAnimationDelegate *)self setCompletion:v4];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  [(JFXEffectAnimationDelegate *)self setAnimationDidEnd:1];
  v6 = [(JFXEffectAnimationDelegate *)self completion];

  if (v6)
  {
    v7 = [(JFXEffectAnimationDelegate *)self completion];
    v7[2](v7, v4);
  }
  [(JFXEffectAnimationDelegate *)self setCompletion:0];
}

- (BOOL)animationDidBegin
{
  return self->_animationDidBegin;
}

- (void)setAnimationDidBegin:(BOOL)a3
{
  self->_animationDidBegin = a3;
}

- (BOOL)animationDidEnd
{
  return self->_animationDidEnd;
}

- (void)setAnimationDidEnd:(BOOL)a3
{
  self->_animationDidEnd = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end