@interface APUISystemApertureElementTransition
- (_TtC18ActivityProgressUIP33_A73398DBE9C416E2311A5D216094DCE135APUISystemApertureElementTransition)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation APUISystemApertureElementTransition

- (double)transitionDuration:(id)a3
{
  return 0.8;
}

- (void)animateTransition:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_100030E30(a3);
  swift_unknownObjectRelease();
}

- (_TtC18ActivityProgressUIP33_A73398DBE9C416E2311A5D216094DCE135APUISystemApertureElementTransition)init
{
  result = (_TtC18ActivityProgressUIP33_A73398DBE9C416E2311A5D216094DCE135APUISystemApertureElementTransition *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityProgressUIP33_A73398DBE9C416E2311A5D216094DCE135APUISystemApertureElementTransition_transitionCoordinator));
}

@end