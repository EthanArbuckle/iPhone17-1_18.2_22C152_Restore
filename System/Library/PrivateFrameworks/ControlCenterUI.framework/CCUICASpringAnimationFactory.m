@interface CCUICASpringAnimationFactory
- (BOOL)_shouldAnimateAdditivelyForView:(id)a3 withKeyPath:(id)a4;
- (CCUICASpringAnimationFactory)initWithParameters:(id)a3 speed:(double)a4;
- (double)animationDuration;
- (id)_animation;
- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4;
@end

@implementation CCUICASpringAnimationFactory

- (CCUICASpringAnimationFactory)initWithParameters:(id)a3 speed:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CCUICASpringAnimationFactory;
  v8 = [(CCUICASpringAnimationFactory *)&v11 init];
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
  v2 = [(CCUICASpringAnimationFactory *)self _animation];
  [v2 durationForEpsilon:0.0];
  double v4 = v3;

  return v4;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  id v5 = a4;
  v6 = [(CCUICASpringAnimationFactory *)self _animation];
  [v6 setKeyPath:v5];

  return v6;
}

- (BOOL)_shouldAnimateAdditivelyForView:(id)a3 withKeyPath:(id)a4
{
  return 1;
}

- (id)_animation
{
  double v3 = [MEMORY[0x1E4F39C90] animation];
  [(CCUICASpringAnimationParameters *)self->_parameters mass];
  objc_msgSend(v3, "setMass:");
  [(CCUICASpringAnimationParameters *)self->_parameters stiffness];
  objc_msgSend(v3, "setStiffness:");
  [(CCUICASpringAnimationParameters *)self->_parameters damping];
  objc_msgSend(v3, "setDamping:");
  double speed = self->_speed;
  *(float *)&double speed = speed;
  [v3 setSpeed:speed];
  id v5 = [(CCUICASpringAnimationParameters *)self->_parameters timingFunction];
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    v10 = [MEMORY[0x1E4F39C10] functionWithName:v9];
  }
  else
  {
    v10 = 0;
  }
  uint64_t v11 = objc_opt_class();
  id v12 = v7;
  if (v11)
  {
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }
  id v14 = v13;

  if (v14)
  {
    [v14 controlPoint1];
    double v16 = v15;
    double v18 = v17;
    [v14 controlPoint2];
    float v19 = v16;
    float v20 = v18;
    *(float *)&double v22 = v21;
    *(float *)&double v24 = v23;
    *(float *)&double v21 = v19;
    *(float *)&double v23 = v20;
    uint64_t v25 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v21 :v23 :v22 :v24];

    v10 = (void *)v25;
  }
  if (v12 && !v10)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    v28 = [NSString stringWithUTF8String:"CAMediaTimingFunction *CATimingFunctionFromDescription(__strong id<CCUIAnimationTimingFunctionDescription>)"];
    [v27 handleFailureInFunction:v28 file:@"CCUIAnimationRunner.m" lineNumber:36 description:@"Unknown timing function"];
  }
  [v3 setTimingFunction:v10];

  return v3;
}

- (void).cxx_destruct
{
}

@end