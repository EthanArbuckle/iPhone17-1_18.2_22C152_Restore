@interface ShareAudioPresentationAnimationController
- (_TtC13MediaControls41ShareAudioPresentationAnimationController)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation ShareAudioPresentationAnimationController

- (double)transitionDuration:(id)a3
{
  return 0.25;
}

- (void)animateTransition:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1AE90EA7C(a3);
  swift_unknownObjectRelease();
}

- (_TtC13MediaControls41ShareAudioPresentationAnimationController)init
{
  result = (_TtC13MediaControls41ShareAudioPresentationAnimationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13MediaControls41ShareAudioPresentationAnimationController_viewController));
}

@end