@interface TestRunnerView
- (UIStackView)stackView;
- (_TtC11Diagnostics14TestRunnerView)initWithCoder:(id)a3;
- (_TtC11Diagnostics14TestRunnerView)initWithFrame:(CGRect)a3;
- (void)skipPressed;
- (void)tintColorDidChange;
@end

@implementation TestRunnerView

- (UIStackView)stackView
{
  return (UIStackView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                + OBJC_IVAR____TtC11Diagnostics14TestRunnerView_stackView));
}

- (_TtC11Diagnostics14TestRunnerView)initWithFrame:(CGRect)a3
{
  return (_TtC11Diagnostics14TestRunnerView *)sub_1000469C8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11Diagnostics14TestRunnerView)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics14TestRunnerView *)sub_100046E78(a3);
}

- (void)tintColorDidChange
{
  v2 = self;
  sub_100047798();
}

- (void)skipPressed
{
  v2 = self;
  sub_100048FC4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics14TestRunnerView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics14TestRunnerView_runnerContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics14TestRunnerView_buttonContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics14TestRunnerView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics14TestRunnerView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics14TestRunnerView_progressIndicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics14TestRunnerView_skipButton));
  sub_100049760((uint64_t)self + OBJC_IVAR____TtC11Diagnostics14TestRunnerView_delegate);
  sub_10003B0B8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC11Diagnostics14TestRunnerView_containerLayoutUpdateHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics14TestRunnerView_idleTimeoutTimer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics14TestRunnerView_buttonContainerShowingHeightConstraint));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11Diagnostics14TestRunnerView_buttonContainerHidingHeightConstraint);
}

@end