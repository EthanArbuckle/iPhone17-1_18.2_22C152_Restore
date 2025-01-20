@interface HUSpringAnimationSettings
+ (id)criticallyDampedSpringSettings;
- (CASpringAnimation)springAnimation;
- (HUSpringAnimationSettings)init;
- (double)completionEpsilon;
- (double)damping;
- (double)delay;
- (double)duration;
- (double)initialVelocity;
- (double)interpolatedProgressForProgress:(double)a3;
- (double)mass;
- (double)speed;
- (double)stiffness;
- (float)repeatCount;
- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4;
- (id)_initWithSpringAnimation:(id)a3 completionEpsilon:(double)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)timingFunction;
- (void)_updateDuration;
- (void)setCompletionEpsilon:(double)a3;
- (void)setDamping:(double)a3;
- (void)setDelay:(double)a3;
- (void)setDuration:(double)a3;
- (void)setInitialVelocity:(double)a3;
- (void)setMass:(double)a3;
- (void)setRepeatCount:(float)a3;
- (void)setSpeed:(double)a3;
- (void)setStiffness:(double)a3;
- (void)setTimingFunction:(id)a3;
@end

@implementation HUSpringAnimationSettings

- (HUSpringAnimationSettings)init
{
  return (HUSpringAnimationSettings *)[(HUSpringAnimationSettings *)self _initWithSpringAnimation:0 completionEpsilon:0.001];
}

- (id)_initWithSpringAnimation:(id)a3 completionEpsilon:(double)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUSpringAnimationSettings;
  v7 = [(HUAnimationSettings *)&v11 init];
  if (v7)
  {
    if (v6)
    {
      v8 = (void *)[v6 copy];
    }
    else
    {
      v8 = [MEMORY[0x1E4F39C90] animation];
    }
    v9 = v8;
    objc_storeStrong((id *)&v7->_springAnimation, v8);

    [(HUSpringAnimationSettings *)v7 setCompletionEpsilon:a4];
  }

  return v7;
}

+ (id)criticallyDampedSpringSettings
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 setMass:3.0];
  [v2 setStiffness:1000.0];
  [v2 setDamping:500.0];

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HUSpringAnimationSettings allocWithZone:a3];
  v5 = [(HUSpringAnimationSettings *)self springAnimation];
  [(HUSpringAnimationSettings *)self completionEpsilon];
  id v6 = -[HUSpringAnimationSettings _initWithSpringAnimation:completionEpsilon:](v4, "_initWithSpringAnimation:completionEpsilon:", v5);

  return v6;
}

- (id)timingFunction
{
  id v2 = [(HUSpringAnimationSettings *)self springAnimation];
  v3 = [v2 timingFunction];

  return v3;
}

- (void)setTimingFunction:(id)a3
{
  id v4 = a3;
  id v5 = [(HUSpringAnimationSettings *)self springAnimation];
  [v5 setTimingFunction:v4];
}

- (double)mass
{
  id v2 = [(HUSpringAnimationSettings *)self springAnimation];
  [v2 mass];
  double v4 = v3;

  return v4;
}

- (void)setMass:(double)a3
{
  id v5 = [(HUSpringAnimationSettings *)self springAnimation];
  [v5 setMass:a3];

  [(HUSpringAnimationSettings *)self _updateDuration];
}

- (double)stiffness
{
  id v2 = [(HUSpringAnimationSettings *)self springAnimation];
  [v2 stiffness];
  double v4 = v3;

  return v4;
}

- (void)setStiffness:(double)a3
{
  id v5 = [(HUSpringAnimationSettings *)self springAnimation];
  [v5 setStiffness:a3];

  [(HUSpringAnimationSettings *)self _updateDuration];
}

- (double)damping
{
  id v2 = [(HUSpringAnimationSettings *)self springAnimation];
  [v2 damping];
  double v4 = v3;

  return v4;
}

- (void)setDamping:(double)a3
{
  id v5 = [(HUSpringAnimationSettings *)self springAnimation];
  [v5 setDamping:a3];

  [(HUSpringAnimationSettings *)self _updateDuration];
}

- (double)initialVelocity
{
  id v2 = [(HUSpringAnimationSettings *)self springAnimation];
  [v2 velocity];
  double v4 = v3;

  return v4;
}

- (void)setInitialVelocity:(double)a3
{
  id v5 = [(HUSpringAnimationSettings *)self springAnimation];
  [v5 setVelocity:a3];

  [(HUSpringAnimationSettings *)self _updateDuration];
}

- (double)duration
{
  id v2 = [(HUSpringAnimationSettings *)self springAnimation];
  [v2 duration];
  double v4 = v3;

  return v4;
}

- (void)setDuration:(double)a3
{
}

- (void)setCompletionEpsilon:(double)a3
{
  self->_completionEpsilon = a3;
  [(HUSpringAnimationSettings *)self _updateDuration];
}

- (double)delay
{
  id v2 = [(HUSpringAnimationSettings *)self springAnimation];
  [v2 beginTime];
  double v4 = v3;

  return v4;
}

- (void)setDelay:(double)a3
{
  id v4 = [(HUSpringAnimationSettings *)self springAnimation];
  [v4 setBeginTime:a3];
}

- (double)speed
{
  id v2 = [(HUSpringAnimationSettings *)self springAnimation];
  [v2 speed];
  double v4 = v3;

  return v4;
}

- (void)setSpeed:(double)a3
{
  if (a3 <= 0.00000011920929)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"HUAnimationSettings.m" lineNumber:230 description:@"Speed must be non-zero"];
  }
  id v6 = [(HUSpringAnimationSettings *)self springAnimation];
  float v5 = a3;
  *(float *)&double v7 = v5;
  [v6 setSpeed:v7];

  [(HUSpringAnimationSettings *)self _updateDuration];
}

- (float)repeatCount
{
  id v2 = [(HUSpringAnimationSettings *)self springAnimation];
  [v2 repeatCount];
  float v4 = v3;

  return v4;
}

- (void)setRepeatCount:(float)a3
{
  id v5 = [(HUSpringAnimationSettings *)self springAnimation];
  *(float *)&double v4 = a3;
  [v5 setRepeatCount:v4];
}

- (double)interpolatedProgressForProgress:(double)a3
{
  double v4 = [(HUSpringAnimationSettings *)self springAnimation];
  *(float *)&double v5 = a3;
  [v4 _solveForInput:v5];
  double v7 = v6;

  return v7;
}

- (void)_updateDuration
{
  float v3 = [(HUSpringAnimationSettings *)self springAnimation];
  [v3 durationForEpsilon:self->_completionEpsilon];
  double v5 = v4;

  id v6 = [(HUSpringAnimationSettings *)self springAnimation];
  [v6 setDuration:v5];
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  id v5 = a4;
  id v6 = [(HUSpringAnimationSettings *)self springAnimation];
  double v7 = (void *)[v6 copy];

  [v7 setKeyPath:v5];

  return v7;
}

- (double)completionEpsilon
{
  return self->_completionEpsilon;
}

- (CASpringAnimation)springAnimation
{
  return self->_springAnimation;
}

- (void).cxx_destruct
{
}

@end