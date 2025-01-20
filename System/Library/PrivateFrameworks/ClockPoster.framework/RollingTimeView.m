@interface RollingTimeView
- (_TtC11ClockPoster15RollingTimeView)initWithCoder:(id)a3;
- (_TtC11ClockPoster15RollingTimeView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation RollingTimeView

- (_TtC11ClockPoster15RollingTimeView)initWithFrame:(CGRect)a3
{
  return (_TtC11ClockPoster15RollingTimeView *)sub_249FCA334(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11ClockPoster15RollingTimeView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_249FCEEE8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_249FCA884();
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC11ClockPoster15RollingTimeView_timeZone;
  uint64_t v4 = sub_24A0563F8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_249FCFFE8((uint64_t)self + OBJC_IVAR____TtC11ClockPoster15RollingTimeView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster15RollingTimeView_compositingFilter));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_249FCFF20((uint64_t)self + OBJC_IVAR____TtC11ClockPoster15RollingTimeView_timeString, type metadata accessor for TimeString);
}

@end