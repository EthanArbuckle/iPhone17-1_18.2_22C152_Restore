@interface PlayClockFaceView
- (_TtC11ClockPoster17PlayClockFaceView)initWithCoder:(id)a3;
- (_TtC11ClockPoster17PlayClockFaceView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PlayClockFaceView

- (_TtC11ClockPoster17PlayClockFaceView)initWithFrame:(CGRect)a3
{
  return (_TtC11ClockPoster17PlayClockFaceView *)sub_24A054EE0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11ClockPoster17PlayClockFaceView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_tintColors) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_alarmComplicationView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_onDeckAlarmComplicationView) = 0;
  uint64_t v4 = OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_timeView;
  id v5 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)sub_24A05529C();

  result = (_TtC11ClockPoster17PlayClockFaceView *)sub_24A057BC8();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_24A055148();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_alarmComplicationView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_onDeckAlarmComplicationView));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_timeView);
}

@end