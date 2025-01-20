@interface CircularTransition
- (_TtC13FTMInternal_418CircularTransition)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation CircularTransition

- (_TtC13FTMInternal_418CircularTransition)init
{
  return (_TtC13FTMInternal_418CircularTransition *)sub_10016ACA8();
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13FTMInternal_418CircularTransition_circleColor);
}

- (double)transitionDuration:(id)a3
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC13FTMInternal_418CircularTransition_duration);
}

- (void)animateTransition:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_10016AE5C(a3);
  swift_unknownObjectRelease();
}

@end