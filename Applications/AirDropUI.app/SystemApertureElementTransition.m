@interface SystemApertureElementTransition
- (_TtC9AirDropUIP33_545EB857E99384AFBD8884C8F47F06D831SystemApertureElementTransition)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation SystemApertureElementTransition

- (double)transitionDuration:(id)a3
{
  return 0.8;
}

- (void)animateTransition:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_10000866C(a3);
  swift_unknownObjectRelease();
}

- (_TtC9AirDropUIP33_545EB857E99384AFBD8884C8F47F06D831SystemApertureElementTransition)init
{
  result = (_TtC9AirDropUIP33_545EB857E99384AFBD8884C8F47F06D831SystemApertureElementTransition *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9AirDropUIP33_545EB857E99384AFBD8884C8F47F06D831SystemApertureElementTransition_transitionCoordinator));
}

@end