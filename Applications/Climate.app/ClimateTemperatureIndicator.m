@interface ClimateTemperatureIndicator
- (BOOL)isEnabled;
- (void)dimensionManager:(id)a3 didUpdateLocale:(id)a4;
- (void)dimensionManager:(id)a3 didUpdateTemperatureUnit:(id)a4;
- (void)setEnabled:(BOOL)a3;
- (void)temperatureService:(id)a3 didUpdateCurrentTemperature:(id)a4;
- (void)temperatureService:(id)a3 didUpdateTargetTemperature:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ClimateTemperatureIndicator

- (BOOL)isEnabled
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClimateTemperatureIndicator();
  return [(ClimateTemperatureIndicator *)&v3 isEnabled];
}

- (void)setEnabled:(BOOL)a3
{
  if (*((unsigned char *)&self->super.super.super.super.super.super.super.isa
       + OBJC_IVAR____TtC7Climate27ClimateTemperatureIndicator_style))
  {
    BOOL v3 = a3;
    v4.receiver = self;
    v4.super_class = (Class)type metadata accessor for ClimateTemperatureIndicator();
    [(ClimateTemperatureIndicator *)&v4 setEnabled:v3];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100093BEC();
}

- (void).cxx_destruct
{
  sub_100026DD0((uint64_t)self + OBJC_IVAR____TtC7Climate27ClimateTemperatureIndicator_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate27ClimateTemperatureIndicator_temperature));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate27ClimateTemperatureIndicator_upArrow));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate27ClimateTemperatureIndicator_downArrow));
  swift_bridgeObjectRelease();
  BOOL v3 = (char *)self + OBJC_IVAR____TtC7Climate27ClimateTemperatureIndicator_currentValue;
  uint64_t v4 = sub_100006730(&qword_1000E5040);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

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
  sub_1000933EC(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)temperatureService:(id)a3 didUpdateCurrentTemperature:(id)a4
{
  uint64_t v7 = sub_100006730((uint64_t *)&unk_1000E4D00);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_100007310(0, (unint64_t *)&qword_1000E4D10);
    static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = sub_100006730(&qword_1000E5040);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = sub_100006730(&qword_1000E5040);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  id v12 = a3;
  v13 = self;
  sub_100091504();

  sub_10000A404((uint64_t)v9, (uint64_t *)&unk_1000E4D00);
}

- (void)dimensionManager:(id)a3 didUpdateTemperatureUnit:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_100091504();
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