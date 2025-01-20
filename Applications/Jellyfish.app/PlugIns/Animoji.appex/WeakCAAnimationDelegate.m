@interface WeakCAAnimationDelegate
+ (id)weakAnimationDelegate:(id)a3;
- (CAAnimationDelegate)animationDelegate;
- (void)animationDidStart:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)setAnimationDelegate:(id)a3;
@end

@implementation WeakCAAnimationDelegate

+ (id)weakAnimationDelegate:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setAnimationDelegate:v4];

  return v5;
}

- (void)animationDidStart:(id)a3
{
  id v8 = a3;
  p_animationDelegate = &self->_animationDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_animationDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_animationDelegate);
    [v7 animationDidStart:v8];
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  p_animationDelegate = &self->_animationDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_animationDelegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)p_animationDelegate);
    [v9 animationDidStop:v10 finished:v4];
  }
}

- (CAAnimationDelegate)animationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animationDelegate);

  return (CAAnimationDelegate *)WeakRetained;
}

- (void)setAnimationDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end