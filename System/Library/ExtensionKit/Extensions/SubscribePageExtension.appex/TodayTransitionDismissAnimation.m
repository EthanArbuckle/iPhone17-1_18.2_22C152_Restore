@interface TodayTransitionDismissAnimation
- (_TtC22SubscribePageExtension31TodayTransitionDismissAnimation)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation TodayTransitionDismissAnimation

- (double)transitionDuration:(id)a3
{
  if (!a3) {
    return 0.0;
  }
  swift_unknownObjectRetain_n();
  v5 = self;
  id v6 = [a3 containerView];
  id v7 = [v6 traitCollection];

  LOBYTE(v6) = sub_100767CE0();
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
  sub_1005683DC(a3);
  swift_unknownObjectRelease();
}

- (_TtC22SubscribePageExtension31TodayTransitionDismissAnimation)init
{
  double result = (_TtC22SubscribePageExtension31TodayTransitionDismissAnimation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end