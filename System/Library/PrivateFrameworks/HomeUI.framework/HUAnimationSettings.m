@interface HUAnimationSettings
+ (HUAnimationSettings)settingsWithDuration:(double)a3;
+ (HUAnimationSettings)settingsWithDuration:(double)a3 curve:(int64_t)a4;
- (CAMediaTimingFunction)timingFunction;
- (HUAnimationSettings)init;
- (double)delay;
- (double)duration;
- (double)durationWithSpeed;
- (double)interpolatedProgressForProgress:(double)a3;
- (double)interpolatedProgressForTime:(double)a3;
- (double)speed;
- (float)repeatCount;
- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)settingsSpedUpByFactor:(double)a3;
- (void)setDelay:(double)a3;
- (void)setDuration:(double)a3;
- (void)setRepeatCount:(float)a3;
- (void)setSpeed:(double)a3;
- (void)setTimingFunction:(id)a3;
@end

@implementation HUAnimationSettings

+ (HUAnimationSettings)settingsWithDuration:(double)a3
{
  return (HUAnimationSettings *)[a1 settingsWithDuration:0 curve:a3];
}

+ (HUAnimationSettings)settingsWithDuration:(double)a3 curve:(int64_t)a4
{
  id v6 = objc_alloc_init((Class)a1);
  [v6 setDuration:a3];
  v7 = objc_msgSend(MEMORY[0x1E4F39C10], "hu_functionWithAnimationCurve:", a4);
  [v6 setTimingFunction:v7];

  return (HUAnimationSettings *)v6;
}

- (HUAnimationSettings)init
{
  v3.receiver = self;
  v3.super_class = (Class)HUAnimationSettings;
  result = [(HUAnimationSettings *)&v3 init];
  if (result)
  {
    result->_duration = 0.25;
    result->_speed = 1.0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[HUAnimationSettings allocWithZone:a3] init];
  [(HUAnimationSettings *)self duration];
  -[HUAnimationSettings setDuration:](v4, "setDuration:");
  v5 = [(HUAnimationSettings *)self timingFunction];
  [(HUAnimationSettings *)v4 setTimingFunction:v5];

  [(HUAnimationSettings *)self speed];
  -[HUAnimationSettings setSpeed:](v4, "setSpeed:");
  [(HUAnimationSettings *)self delay];
  -[HUAnimationSettings setDelay:](v4, "setDelay:");
  [(HUAnimationSettings *)self repeatCount];
  -[HUAnimationSettings setRepeatCount:](v4, "setRepeatCount:");
  return v4;
}

- (void)setSpeed:(double)a3
{
  if (a3 <= 0.00000011920929)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"HUAnimationSettings.m" lineNumber:78 description:@"Speed must be a non-zero value"];
  }
  self->_speed = a3;
}

- (double)durationWithSpeed
{
  [(HUAnimationSettings *)self duration];
  double v4 = v3;
  [(HUAnimationSettings *)self speed];
  return v4 / v5;
}

- (double)interpolatedProgressForProgress:(double)a3
{
  double v5 = [(HUAnimationSettings *)self timingFunction];
  if (v5)
  {
    id v6 = [(HUAnimationSettings *)self timingFunction];
    *(float *)&double v7 = a3;
    [v6 _solveForInput:v7];
    a3 = v8;
  }
  return a3;
}

- (double)interpolatedProgressForTime:(double)a3
{
  [(HUAnimationSettings *)self duration];
  double v6 = v5;
  double v7 = 1.0;
  if (v6 >= 0.00000011920929)
  {
    [(HUAnimationSettings *)self durationWithSpeed];
    double v7 = a3 / v8;
  }

  [(HUAnimationSettings *)self interpolatedProgressForProgress:v7];
  return result;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  double v5 = [MEMORY[0x1E4F39B48] animationWithKeyPath:a4];
  [(HUAnimationSettings *)self duration];
  objc_msgSend(v5, "setDuration:");
  [(HUAnimationSettings *)self delay];
  objc_msgSend(v5, "setBeginTime:");
  [(HUAnimationSettings *)self speed];
  *(float *)&double v6 = v6;
  [v5 setSpeed:v6];
  [(HUAnimationSettings *)self repeatCount];
  objc_msgSend(v5, "setRepeatCount:");

  return v5;
}

- (id)settingsSpedUpByFactor:(double)a3
{
  double v4 = (void *)[(HUAnimationSettings *)self copy];
  [v4 speed];
  [v4 setSpeed:v5 * a3];

  return v4;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (double)speed
{
  return self->_speed;
}

- (float)repeatCount
{
  return self->_repeatCount;
}

- (void)setRepeatCount:(float)a3
{
  self->_repeatCount = a3;
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end