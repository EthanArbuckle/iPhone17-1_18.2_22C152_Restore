@interface TodayTransitionPresentAnimation
- (_TtC18ASMessagesProvider31TodayTransitionPresentAnimation)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation TodayTransitionPresentAnimation

- (double)transitionDuration:(id)a3
{
  if (!a3) {
    return 0.0;
  }
  swift_unknownObjectRetain_n();
  v5 = self;
  id v6 = [a3 containerView];
  id v7 = [v6 traitCollection];

  LOBYTE(v6) = sub_77DDC0();
  swift_unknownObjectRelease_n();

  double result = 0.61;
  if (v6) {
    return 0.62;
  }
  return result;
}

- (void)animateTransition:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_C4B2C(0);
  if (*((unsigned char *)&v5->super.super.isa
       + OBJC_IVAR____TtC18ASMessagesProvider31TodayTransitionPresentAnimation_shouldUseReducedMotionTransition) == 1)
  {
    sub_4DEE34(a3);
  }
  else
  {
    sub_4DE9F8(a3);
    if ((*((unsigned char *)&v5->super.super.isa
          + OBJC_IVAR____TtC18ASMessagesProvider31TodayTransitionPresentAnimation_shouldAnimateTabBar) & 1) != 0)
      sub_4DE844(a3);
  }
  swift_unknownObjectRelease();
}

- (_TtC18ASMessagesProvider31TodayTransitionPresentAnimation)init
{
  double result = (_TtC18ASMessagesProvider31TodayTransitionPresentAnimation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end