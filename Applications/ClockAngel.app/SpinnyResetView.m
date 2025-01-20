@interface SpinnyResetView
- (_TtC10ClockAngel15SpinnyResetView)initWithCoder:(id)a3;
- (_TtC10ClockAngel15SpinnyResetView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SpinnyResetView

- (void)layoutSubviews
{
  v2 = self;
  sub_100031820();
}

- (_TtC10ClockAngel15SpinnyResetView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10ClockAngel15SpinnyResetView_pendingWorkItem) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC10ClockAngel15SpinnyResetView_mode) = 0;
  id v4 = a3;

  result = (_TtC10ClockAngel15SpinnyResetView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC10ClockAngel15SpinnyResetView)initWithFrame:(CGRect)a3
{
  result = (_TtC10ClockAngel15SpinnyResetView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel15SpinnyResetView_lapViewRotationContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel15SpinnyResetView_lapViewTransitionContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel15SpinnyResetView_lapViewOffsetContainer));

  swift_release();
}

@end