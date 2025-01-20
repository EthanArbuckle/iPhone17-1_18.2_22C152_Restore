@interface StaggeredAlphaAnimator
- (BOOL)isReversed;
- (BOOL)isRunning;
- (_TtC8HealthUIP33_2CCCC3E80CB68C77458B1C83C70AE82122StaggeredAlphaAnimator)init;
- (double)fractionComplete;
- (int64_t)state;
- (void)finishAnimationAtPosition:(int64_t)a3;
- (void)pauseAnimation;
- (void)setFractionComplete:(double)a3;
- (void)setReversed:(BOOL)a3;
- (void)startAnimation;
- (void)startAnimationAfterDelay:(double)a3;
- (void)stopAnimation:(BOOL)a3;
@end

@implementation StaggeredAlphaAnimator

- (_TtC8HealthUIP33_2CCCC3E80CB68C77458B1C83C70AE82122StaggeredAlphaAnimator)init
{
  result = (_TtC8HealthUIP33_2CCCC3E80CB68C77458B1C83C70AE82122StaggeredAlphaAnimator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8HealthUIP33_2CCCC3E80CB68C77458B1C83C70AE82122StaggeredAlphaAnimator_backgroundAnimator));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8HealthUIP33_2CCCC3E80CB68C77458B1C83C70AE82122StaggeredAlphaAnimator_foregroundAnimator);
}

- (int64_t)state
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC8HealthUIP33_2CCCC3E80CB68C77458B1C83C70AE82122StaggeredAlphaAnimator_foregroundAnimator), sel_state);
}

- (BOOL)isRunning
{
  return objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC8HealthUIP33_2CCCC3E80CB68C77458B1C83C70AE82122StaggeredAlphaAnimator_foregroundAnimator), sel_isRunning);
}

- (BOOL)isReversed
{
  return objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC8HealthUIP33_2CCCC3E80CB68C77458B1C83C70AE82122StaggeredAlphaAnimator_backgroundAnimator), sel_isReversed);
}

- (void)setReversed:(BOOL)a3
{
}

- (double)fractionComplete
{
  objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC8HealthUIP33_2CCCC3E80CB68C77458B1C83C70AE82122StaggeredAlphaAnimator_foregroundAnimator), sel_fractionComplete);
  return result;
}

- (void)setFractionComplete:(double)a3
{
}

- (void)startAnimation
{
}

- (void)startAnimationAfterDelay:(double)a3
{
}

- (void)pauseAnimation
{
}

- (void)stopAnimation:(BOOL)a3
{
}

- (void)finishAnimationAtPosition:(int64_t)a3
{
  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8HealthUIP33_2CCCC3E80CB68C77458B1C83C70AE82122StaggeredAlphaAnimator_backgroundAnimator);
  v5 = self;
  objc_msgSend(v4, sel_finishAnimationAtPosition_, a3);
  objc_msgSend(*(id *)((char *)&v5->super.isa+ OBJC_IVAR____TtC8HealthUIP33_2CCCC3E80CB68C77458B1C83C70AE82122StaggeredAlphaAnimator_foregroundAnimator), sel_finishAnimationAtPosition_, a3);
}

@end