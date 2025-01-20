@interface MKCALayerCompletionDelegate
+ (id)delegateWithCompletion:(id)a3;
- (id)completion;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)setCompletion:(id)a3;
@end

@implementation MKCALayerCompletionDelegate

+ (id)delegateWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setCompletion:v3];

  return v4;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  completion = (void (**)(id, BOOL, id))self->_completion;
  if (completion)
  {
    completion[2](completion, a4, a3);
    completion = (void (**)(id, BOOL, id))self->_completion;
  }
  self->_completion = 0;
}

- (id)completion
{
  return self->_completion;
}

@end