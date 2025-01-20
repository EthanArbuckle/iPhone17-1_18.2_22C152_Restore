@interface SpringAnimation
- (BOOL)advanceWithDeltaTime:(double)a3;
- (_TtC15ActivityRingsUI15SpringAnimation)init;
- (_TtC15ActivityRingsUI15SpringAnimation)initWithInitialValue:(double)a3 delay:(double)a4;
- (double)target;
- (double)value;
- (void)completeWithSnap;
- (void)configureWithTension:(double)a3 friction:(double)a4 target:(double)a5;
- (void)updateTarget:(double)a3;
@end

@implementation SpringAnimation

- (double)value
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState);
}

- (double)target
{
  if (self->animationState[OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState + 16]) {
    return *(double *)&self->animationState[OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState + 8];
  }
  sub_21E185F30();
  __break(1u);
  return result;
}

- (_TtC15ActivityRingsUI15SpringAnimation)initWithInitialValue:(double)a3 delay:(double)a4
{
  v4 = (char *)self + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState;
  *(double *)v4 = a3;
  *(_OWORD *)(v4 + 8) = 0u;
  *(_OWORD *)(v4 + 24) = 0u;
  v4[40] = 0;
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_delay) = a4;
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_remainingDelay) = a4;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SpringAnimation();
  return [(SpringAnimation *)&v6 init];
}

- (void)configureWithTension:(double)a3 friction:(double)a4 target:(double)a5
{
  v5 = (double *)((char *)self + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState);
  v5[2] = a3;
  v5[3] = a4;
  v5[4] = a5;
  *((unsigned char *)v5 + 40) = 1;
}

- (void)updateTarget:(double)a3
{
  v3 = (double *)((char *)self + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState);
  if (self->animationState[OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState + 16])
  {
    v3[4] = a3;
    *((unsigned char *)v3 + 40) = 1;
  }
  else
  {
    sub_21E185F30();
    __break(1u);
  }
}

- (BOOL)advanceWithDeltaTime:(double)a3
{
  v4 = self;
  char v5 = sub_21E1807D4(a3);

  return v5 & 1;
}

- (void)completeWithSnap
{
  v2 = (char *)self + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState;
  if (self->animationState[OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState + 16] == 1)
  {
    *(void *)v2 = *((void *)v2 + 4);
    *((void *)v2 + 1) = 0;
    v2[40] = 1;
  }
}

- (_TtC15ActivityRingsUI15SpringAnimation)init
{
  double result = (_TtC15ActivityRingsUI15SpringAnimation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end