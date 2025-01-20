@interface EMKRippleAnimator
- (BOOL)isIdle;
- (BOOL)isPlaying;
- (EMKRippleAnimation)animation;
- (EMKRippleAnimator)initWithAnimation:(id)a3 foregroundColor:(id)a4;
- (UIColor)foregroundColor;
- (_NSTextAnimator)glimmerAnimator;
- (_NSTextAnimator)scaleRippleAnimator;
- (double)nextAnimationTriggerDelay;
- (id)notify;
- (unint64_t)state;
- (void)setAnimation:(id)a3;
- (void)setForegroundColor:(id)a3;
- (void)setGlimmerAnimator:(id)a3;
- (void)setNotify:(id)a3;
- (void)setScaleRippleAnimator:(id)a3;
- (void)start;
@end

@implementation EMKRippleAnimator

- (EMKRippleAnimator)initWithAnimation:(id)a3 foregroundColor:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)EMKRippleAnimator;
  id v5 = a4;
  id v6 = a3;
  v7 = [(EMKRippleAnimator *)&v9 init];
  -[EMKRippleAnimator setAnimation:](v7, "setAnimation:", v6, v9.receiver, v9.super_class);

  [(EMKRippleAnimator *)v7 setForegroundColor:v5];
  return v7;
}

- (unint64_t)state
{
  v2 = [(EMKRippleAnimator *)self glimmerAnimator];
  unint64_t v3 = [v2 state];

  if (v3 >= 4) {
    return 1;
  }
  else {
    return v3;
  }
}

- (BOOL)isPlaying
{
  return [(EMKRippleAnimator *)self state] == 2;
}

- (BOOL)isIdle
{
  return [(EMKRippleAnimator *)self state] == 1;
}

- (double)nextAnimationTriggerDelay
{
  v2 = [(EMKRippleAnimator *)self glimmerAnimator];
  [v2 nextAnimationTriggerDelay];
  double v4 = v3 * 0.33;

  return v4;
}

- (void)start
{
  double v3 = [(EMKRippleAnimator *)self glimmerAnimator];
  [v3 duration];
  double v5 = v4;

  id v6 = [(EMKRippleAnimator *)self glimmerAnimator];
  [v6 start];

  id v7 = [(EMKRippleAnimator *)self scaleRippleAnimator];
  [v7 startWithDuration:v5];
}

- (EMKRippleAnimation)animation
{
  return self->_animation;
}

- (void)setAnimation:(id)a3
{
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (void)setForegroundColor:(id)a3
{
}

- (_NSTextAnimator)scaleRippleAnimator
{
  return self->_scaleRippleAnimator;
}

- (void)setScaleRippleAnimator:(id)a3
{
}

- (_NSTextAnimator)glimmerAnimator
{
  return self->_glimmerAnimator;
}

- (void)setGlimmerAnimator:(id)a3
{
}

- (id)notify
{
  return self->_notify;
}

- (void)setNotify:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notify, 0);
  objc_storeStrong((id *)&self->_glimmerAnimator, 0);
  objc_storeStrong((id *)&self->_scaleRippleAnimator, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_animation, 0);
}

@end