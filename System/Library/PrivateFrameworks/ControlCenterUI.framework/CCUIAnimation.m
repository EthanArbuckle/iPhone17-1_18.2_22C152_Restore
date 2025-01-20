@interface CCUIAnimation
+ (id)animationWithParameters:(id)a3 animations:(id)a4;
+ (id)animationWithParameters:(id)a3 delay:(double)a4 animations:(id)a5;
+ (id)animationWithParameters:(id)a3 delay:(double)a4 speed:(double)a5 animations:(id)a6;
- (CCUIAnimationParameters)parameters;
- (double)delay;
- (double)speed;
- (id)_initWithParameters:(id)a3 delay:(double)a4 speed:(double)a5 animations:(id)a6;
- (id)animations;
@end

@implementation CCUIAnimation

+ (id)animationWithParameters:(id)a3 animations:(id)a4
{
  return (id)[a1 animationWithParameters:a3 delay:a4 animations:0.0];
}

+ (id)animationWithParameters:(id)a3 delay:(double)a4 animations:(id)a5
{
  return (id)[a1 animationWithParameters:a3 delay:a5 speed:a4 animations:1.0];
}

+ (id)animationWithParameters:(id)a3 delay:(double)a4 speed:(double)a5 animations:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  v12 = (void *)[objc_alloc((Class)a1) _initWithParameters:v11 delay:v10 speed:a4 animations:a5];

  return v12;
}

- (id)_initWithParameters:(id)a3 delay:(double)a4 speed:(double)a5 animations:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CCUIAnimation;
  v12 = [(CCUIAnimation *)&v18 init];
  if (v12)
  {
    uint64_t v13 = [v10 copyWithZone:0];
    parameters = v12->_parameters;
    v12->_parameters = (CCUIAnimationParameters *)v13;

    v12->_delay = a4;
    v12->_speed = a5;
    uint64_t v15 = [v11 copy];
    id animations = v12->_animations;
    v12->_id animations = (id)v15;
  }
  return v12;
}

- (CCUIAnimationParameters)parameters
{
  return self->_parameters;
}

- (double)delay
{
  return self->_delay;
}

- (double)speed
{
  return self->_speed;
}

- (id)animations
{
  return self->_animations;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animations, 0);

  objc_storeStrong((id *)&self->_parameters, 0);
}

@end