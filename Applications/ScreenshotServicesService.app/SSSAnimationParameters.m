@interface SSSAnimationParameters
- (BOOL)_shouldAnimateAdditivelyForView:(id)a3 withKeyPath:(id)a4;
- (SSSAnimationParameters)init;
- (double)delay;
- (double)duration;
- (id)_animationForKeyPath:(id)a3;
- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4;
- (id)animationUsingParametersForKeyPath:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)timingParameters;
- (int64_t)animationReason;
- (unint64_t)animationOptions;
- (void)setAnimationOptions:(unint64_t)a3;
- (void)setAnimationReason:(int64_t)a3;
- (void)setDelay:(double)a3;
- (void)setDuration:(double)a3;
@end

@implementation SSSAnimationParameters

- (SSSAnimationParameters)init
{
  v4.receiver = self;
  v4.super_class = (Class)SSSAnimationParameters;
  v2 = [(SSSAnimationParameters *)&v4 init];
  [(SSSAnimationParameters *)v2 setAnimationOptions:6];
  return v2;
}

- (BOOL)_shouldAnimateAdditivelyForView:(id)a3 withKeyPath:(id)a4
{
  return 1;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  return [(SSSAnimationParameters *)self _animationForKeyPath:a4];
}

- (id)_animationForKeyPath:(id)a3
{
  objc_super v4 = [(SSSAnimationParameters *)self animationUsingParametersForKeyPath:a3];
  [(SSSAnimationParameters *)self duration];
  [v4 setDuration:];
  [v4 speed];
  float v6 = v5;
  UIAnimationDragCoefficient();
  *(float *)&double v8 = v6 / v7;
  [v4 setSpeed:v8];

  return v4;
}

- (id)animationUsingParametersForKeyPath:(id)a3
{
  return +[CABasicAnimation animationWithKeyPath:a3];
}

- (id)timingParameters
{
  id v2 = objc_alloc_init((Class)UICubicTimingParameters);

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = objc_alloc_init((Class)objc_opt_class());
  [(SSSAnimationParameters *)self duration];
  v4[3] = v5;
  [(SSSAnimationParameters *)self delay];
  v4[1] = v6;
  v4[4] = [(SSSAnimationParameters *)self animationReason];
  return v4;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (unint64_t)animationOptions
{
  return self->_animationOptions;
}

- (void)setAnimationOptions:(unint64_t)a3
{
  self->_animationOptions = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (int64_t)animationReason
{
  return self->_animationReason;
}

- (void)setAnimationReason:(int64_t)a3
{
  self->_animationReason = a3;
}

@end