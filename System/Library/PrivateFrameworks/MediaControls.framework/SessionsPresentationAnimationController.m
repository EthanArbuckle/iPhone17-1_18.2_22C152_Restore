@interface SessionsPresentationAnimationController
- (_TtC13MediaControls39SessionsPresentationAnimationController)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation SessionsPresentationAnimationController

- (double)transitionDuration:(id)a3
{
  double result = 0.35;
  if (*((unsigned char *)&self->super.isa + OBJC_IVAR____TtC13MediaControls39SessionsPresentationAnimationController_style)) {
    return 0.25;
  }
  return result;
}

- (void)animateTransition:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1AE9319F4(a3);
  swift_unknownObjectRelease();
}

- (_TtC13MediaControls39SessionsPresentationAnimationController)init
{
  double result = (_TtC13MediaControls39SessionsPresentationAnimationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13MediaControls39SessionsPresentationAnimationController_viewController));
}

@end