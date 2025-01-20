@interface AXTwiceCompanionPullToDismissAnimatedController
- (_TtC21AXWatchRemoteScreenUI47AXTwiceCompanionPullToDismissAnimatedController)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation AXTwiceCompanionPullToDismissAnimatedController

- (double)transitionDuration:(id)a3
{
  return 0.3;
}

- (void)animateTransition:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_22C0526AC(a3);
  swift_unknownObjectRelease();
}

- (_TtC21AXWatchRemoteScreenUI47AXTwiceCompanionPullToDismissAnimatedController)init
{
  result = (_TtC21AXWatchRemoteScreenUI47AXTwiceCompanionPullToDismissAnimatedController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI47AXTwiceCompanionPullToDismissAnimatedController_dismissedVC));
}

@end