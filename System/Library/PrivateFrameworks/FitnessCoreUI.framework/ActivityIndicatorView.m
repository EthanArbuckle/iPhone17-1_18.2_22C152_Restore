@interface ActivityIndicatorView
- (_TtC13FitnessCoreUI21ActivityIndicatorView)initWithCoder:(id)a3;
- (_TtC13FitnessCoreUI21ActivityIndicatorView)initWithFrame:(CGRect)a3;
@end

@implementation ActivityIndicatorView

- (_TtC13FitnessCoreUI21ActivityIndicatorView)initWithCoder:(id)a3
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = a3;
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  result = (_TtC13FitnessCoreUI21ActivityIndicatorView *)sub_24EEDDCF0();
  __break(1u);
  return result;
}

- (_TtC13FitnessCoreUI21ActivityIndicatorView)initWithFrame:(CGRect)a3
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  result = (_TtC13FitnessCoreUI21ActivityIndicatorView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13FitnessCoreUI21ActivityIndicatorView_activityIndicatorView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13FitnessCoreUI21ActivityIndicatorView_internalMessageLabel);
}

@end