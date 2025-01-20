@interface TodayTransitionPresentAnimation
- (_TtC20ProductPageExtension31TodayTransitionPresentAnimation)init;
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

  LOBYTE(v6) = sub_10077C3B0();
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
  sub_10007C094(0);
  if (*((unsigned char *)&v5->super.super.isa
       + OBJC_IVAR____TtC20ProductPageExtension31TodayTransitionPresentAnimation_shouldUseReducedMotionTransition) == 1)
  {
    sub_100569264(a3);
  }
  else
  {
    sub_100568E28(a3);
    if ((*((unsigned char *)&v5->super.super.isa
          + OBJC_IVAR____TtC20ProductPageExtension31TodayTransitionPresentAnimation_shouldAnimateTabBar) & 1) != 0)
      sub_100568C74(a3);
  }
  swift_unknownObjectRelease();
}

- (_TtC20ProductPageExtension31TodayTransitionPresentAnimation)init
{
  double result = (_TtC20ProductPageExtension31TodayTransitionPresentAnimation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end