@interface ClimateZoneTargetTemperatureStepper
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)dimensionManager:(id)a3 didUpdateLocale:(id)a4;
- (void)dimensionManager:(id)a3 didUpdateTemperatureUnit:(id)a4;
- (void)temperatureService:(id)a3 didUpdateTargetTemperature:(id)a4;
@end

@implementation ClimateZoneTargetTemperatureStepper

- (void)temperatureService:(id)a3 didUpdateTargetTemperature:(id)a4
{
  uint64_t v6 = sub_100006730(&qword_1000E5040);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007310(0, (unint64_t *)&qword_1000E4D10);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_100028140((uint64_t)v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for ClimateZoneTargetTemperatureStepper();
  uint64_t v7 = (char *)v12.receiver;
  id v8 = a4;
  id v9 = -[ClimateZoneTargetTemperatureStepper hitTest:withEvent:](&v12, "hitTest:withEvent:", v8, x, y);
  if (!v9)
  {
    id v10 = *(void **)&v7[OBJC_IVAR____TtC7Climate35ClimateZoneTargetTemperatureStepper_temperatureButton];
    [v10 frame];
    v14.double x = x;
    v14.double y = y;
    if (CGRectContainsPoint(v15, v14)) {
      id v9 = v10;
    }
    else {
      id v9 = 0;
    }
  }

  return v9;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC7Climate35ClimateZoneTargetTemperatureStepper_currentValue;
  uint64_t v4 = sub_100006730(&qword_1000E5040);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Climate35ClimateZoneTargetTemperatureStepper_temperatureButton);
}

- (void)dimensionManager:(id)a3 didUpdateTemperatureUnit:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_100029264();
}

- (void)dimensionManager:(id)a3 didUpdateLocale:(id)a4
{
  uint64_t v4 = type metadata accessor for Locale();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Locale._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end