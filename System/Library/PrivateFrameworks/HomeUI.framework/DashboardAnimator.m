@interface DashboardAnimator
- (_TtC6HomeUI17DashboardAnimator)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation DashboardAnimator

- (double)transitionDuration:(id)a3
{
  return dbl_1BEA14B38[*((char *)&self->super.isa + OBJC_IVAR____TtC6HomeUI17DashboardAnimator_style)];
}

- (void)animateTransition:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1BE4788D4(a3);
  swift_unknownObjectRelease();
}

- (_TtC6HomeUI17DashboardAnimator)init
{
  result = (_TtC6HomeUI17DashboardAnimator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6HomeUI17DashboardAnimator_targetNavigationBarAppearance);
}

@end