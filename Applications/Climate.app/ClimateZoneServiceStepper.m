@interface ClimateZoneServiceStepper
- (CAFTemperature)temperature;
- (void)setTemperature:(id)a3;
- (void)temperatureService:(id)a3 didUpdateCurrentTemperature:(id)a4;
- (void)temperatureService:(id)a3 didUpdateTargetTemperature:(id)a4;
@end

@implementation ClimateZoneServiceStepper

- (CAFTemperature)temperature
{
  v2 = (id *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC7Climate25ClimateZoneServiceStepper_temperature);
  swift_beginAccess();
  return (CAFTemperature *)*v2;
}

- (void)setTemperature:(id)a3
{
  id v5 = a3;
  v4 = self;
  sub_100015C78(v5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate25ClimateZoneServiceStepper_temperature));
}

- (void)temperatureService:(id)a3 didUpdateCurrentTemperature:(id)a4
{
  uint64_t v5 = sub_100006730((uint64_t *)&unk_1000E4D00);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_100007310(0, (unint64_t *)&qword_1000E4D10);
    static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = sub_100006730(&qword_1000E5040);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_100006730(&qword_1000E5040);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  sub_10000FF1C((uint64_t)v7);
}

- (void)temperatureService:(id)a3 didUpdateTargetTemperature:(id)a4
{
  uint64_t v4 = sub_100006730(&qword_1000E5040);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007310(0, (unint64_t *)&qword_1000E4D10);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end