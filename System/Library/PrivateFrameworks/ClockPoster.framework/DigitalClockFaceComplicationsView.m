@interface DigitalClockFaceComplicationsView
- (_TtC11ClockPoster33DigitalClockFaceComplicationsView)initWithCoder:(id)a3;
- (_TtC11ClockPoster33DigitalClockFaceComplicationsView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation DigitalClockFaceComplicationsView

- (_TtC11ClockPoster33DigitalClockFaceComplicationsView)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC11ClockPoster33DigitalClockFaceComplicationsView_currentTemperature;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269750BE8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (char *)self + OBJC_IVAR____TtC11ClockPoster33DigitalClockFaceComplicationsView_alarmInfo;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269750E88);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11ClockPoster33DigitalClockFaceComplicationsView_dateLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11ClockPoster33DigitalClockFaceComplicationsView_temperatureLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11ClockPoster33DigitalClockFaceComplicationsView_alarmComplication) = 0;
  id v9 = a3;

  result = (_TtC11ClockPoster33DigitalClockFaceComplicationsView *)sub_24A057BC8();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_249FE85E0();
}

- (_TtC11ClockPoster33DigitalClockFaceComplicationsView)initWithFrame:(CGRect)a3
{
  result = (_TtC11ClockPoster33DigitalClockFaceComplicationsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_249F6E790((uint64_t)self + OBJC_IVAR____TtC11ClockPoster33DigitalClockFaceComplicationsView_currentTemperature, &qword_269750C48);
  swift_bridgeObjectRelease();
  sub_249F6E790((uint64_t)self + OBJC_IVAR____TtC11ClockPoster33DigitalClockFaceComplicationsView_alarmInfo, &qword_269750EA8);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster33DigitalClockFaceComplicationsView_dateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster33DigitalClockFaceComplicationsView_temperatureLabel));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11ClockPoster33DigitalClockFaceComplicationsView_alarmComplication);
}

@end