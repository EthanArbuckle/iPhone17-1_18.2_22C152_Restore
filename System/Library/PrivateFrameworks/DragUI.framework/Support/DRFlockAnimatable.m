@interface DRFlockAnimatable
+ (id)animationBlock:(id)a3;
- (id)animationBlock;
- (id)completionBlock;
- (void)setAnimationBlock:(id)a3;
- (void)setCompletionBlock:(id)a3;
@end

@implementation DRFlockAnimatable

+ (id)animationBlock:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setAnimationBlock:v3];

  return v4;
}

- (id)animationBlock
{
  return self->_animationBlock;
}

- (void)setAnimationBlock:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_animationBlock, 0);
}

@end