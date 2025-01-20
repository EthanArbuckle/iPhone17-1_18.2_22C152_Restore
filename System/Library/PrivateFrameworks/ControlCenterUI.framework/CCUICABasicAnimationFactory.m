@interface CCUICABasicAnimationFactory
- (BOOL)_shouldAnimateAdditivelyForView:(id)a3 withKeyPath:(id)a4;
- (CCUICABasicAnimationFactory)initWithParameters:(id)a3 speed:(double)a4;
- (double)animationDuration;
- (id)_animation;
- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4;
@end

@implementation CCUICABasicAnimationFactory

- (CCUICABasicAnimationFactory)initWithParameters:(id)a3 speed:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CCUICABasicAnimationFactory;
  v8 = [(CCUICABasicAnimationFactory *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_parameters, a3);
    v9->_speed = a4;
  }

  return v9;
}

- (double)animationDuration
{
  [(CCUICABasicAnimationParameters *)self->_parameters duration];
  return result;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  id v5 = a4;
  v6 = [(CCUICABasicAnimationFactory *)self _animation];
  [v6 setKeyPath:v5];

  return v6;
}

- (BOOL)_shouldAnimateAdditivelyForView:(id)a3 withKeyPath:(id)a4
{
  return 1;
}

- (id)_animation
{
  v3 = [MEMORY[0x1E4F39B48] animation];
  [(CCUICABasicAnimationParameters *)self->_parameters duration];
  objc_msgSend(v3, "setDuration:");
  double speed = self->_speed;
  *(float *)&double speed = speed;
  [v3 setSpeed:speed];

  return v3;
}

- (void).cxx_destruct
{
}

@end