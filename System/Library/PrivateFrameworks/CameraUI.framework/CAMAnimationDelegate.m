@interface CAMAnimationDelegate
- (id)completion;
- (id)start;
- (void)animationDidStart:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)setCompletion:(id)a3;
- (void)setStart:(id)a3;
@end

@implementation CAMAnimationDelegate

- (void)setCompletion:(id)a3
{
}

- (void)animationDidStart:(id)a3
{
  v4 = [(CAMAnimationDelegate *)self start];

  if (v4)
  {
    v5 = [(CAMAnimationDelegate *)self start];
    v5[2]();
  }
}

- (id)start
{
  return self->_start;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [(CAMAnimationDelegate *)self completion];

  if (v6)
  {
    v7 = [(CAMAnimationDelegate *)self completion];
    v7[2](v7, v4);
  }
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_start, 0);
  objc_storeStrong(&self->_completion, 0);
}

- (void)setStart:(id)a3
{
}

@end