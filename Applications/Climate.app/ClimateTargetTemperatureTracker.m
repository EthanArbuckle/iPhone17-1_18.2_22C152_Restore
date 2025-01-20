@interface ClimateTargetTemperatureTracker
- (_TtC7Climate31ClimateTargetTemperatureTracker)init;
- (void)temperatureService:(id)a3 didUpdateCurrentTemperature:(id)a4;
- (void)temperatureService:(id)a3 didUpdateTargetTemperature:(id)a4;
@end

@implementation ClimateTargetTemperatureTracker

- (_TtC7Climate31ClimateTargetTemperatureTracker)init
{
  uint64_t v3 = OBJC_IVAR____TtC7Climate31ClimateTargetTemperatureTracker_targetTemperatures;
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_100034048((uint64_t)_swiftEmptyArrayStorage);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for ClimateTargetTemperatureTracker();
  return [(ClimateTargetTemperatureTracker *)&v6 init];
}

- (void).cxx_destruct
{
}

- (void)temperatureService:(id)a3 didUpdateTargetTemperature:(id)a4
{
  uint64_t v6 = sub_100006730(&qword_1000E5040);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100066048();
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_100065A0C(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)temperatureService:(id)a3 didUpdateCurrentTemperature:(id)a4
{
  uint64_t v5 = sub_100006730((uint64_t *)&unk_1000E4D00);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_100066048();
    static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = sub_100006730(&qword_1000E5040);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_100006730(&qword_1000E5040);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  sub_10000A404((uint64_t)v7, (uint64_t *)&unk_1000E4D00);
}

@end