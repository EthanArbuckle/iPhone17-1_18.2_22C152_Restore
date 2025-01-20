@interface TestRunnerIconView
- (_TtC11Diagnostics18TestRunnerIconView)initWithCoder:(id)a3;
- (_TtC11Diagnostics18TestRunnerIconView)initWithFrame:(CGRect)a3;
@end

@implementation TestRunnerIconView

- (_TtC11Diagnostics18TestRunnerIconView)initWithFrame:(CGRect)a3
{
  return (_TtC11Diagnostics18TestRunnerIconView *)sub_10006CE4C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11Diagnostics18TestRunnerIconView)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics18TestRunnerIconView *)sub_10006CF68(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics18TestRunnerIconView_activityIndicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics18TestRunnerIconView_checkmarkView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11Diagnostics18TestRunnerIconView_imageView);
}

@end