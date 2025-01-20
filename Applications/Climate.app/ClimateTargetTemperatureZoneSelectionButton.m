@interface ClimateTargetTemperatureZoneSelectionButton
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (_TtC7Climate43ClimateTargetTemperatureZoneSelectionButton)init;
- (void)dimensionManager:(id)a3 didUpdateLocale:(id)a4;
- (void)dimensionManager:(id)a3 didUpdateTemperatureUnit:(id)a4;
- (void)setHighlighted:(BOOL)a3;
- (void)temperatureService:(id)a3 didUpdateCurrentTemperature:(id)a4;
- (void)temperatureService:(id)a3 didUpdateTargetTemperature:(id)a4;
- (void)zonesSyncedService:(id)a3 didUpdateOn:(BOOL)a4;
@end

@implementation ClimateTargetTemperatureZoneSelectionButton

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClimateTargetTemperatureZoneSelectionButton();
  return [(ClimateButton *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ClimateTargetTemperatureZoneSelectionButton();
  v4 = v6.receiver;
  [(ClimateButton *)&v6 setHighlighted:v3];
  double v5 = 0.2;
  if (!v4[OBJC_IVAR____TtC7Climate13ClimateButton_shouldBeHighlighted]) {
    double v5 = 1.0;
  }
  [*(id *)&v4[OBJC_IVAR____TtC7Climate43ClimateTargetTemperatureZoneSelectionButton_labelsView] setAlpha:v5];
}

- (_TtC7Climate43ClimateTargetTemperatureZoneSelectionButton)init
{
  uint64_t v3 = OBJC_IVAR____TtC7Climate43ClimateTargetTemperatureZoneSelectionButton_unselectedBackgroundView;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3) = (Class)[self materialViewWithRecipe:21];
  *((unsigned char *)&self->super.super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC7Climate43ClimateTargetTemperatureZoneSelectionButton_isOn) = 0;

  result = (_TtC7Climate43ClimateTargetTemperatureZoneSelectionButton *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (BOOL)isEnabled
{
  return 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate43ClimateTargetTemperatureZoneSelectionButton_unselectedBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate43ClimateTargetTemperatureZoneSelectionButton_temperature));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Climate43ClimateTargetTemperatureZoneSelectionButton_labelsView);
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
  sub_10000E930();

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
  sub_10000E930();

  sub_10000FF1C((uint64_t)v9);
}

- (void)zonesSyncedService:(id)a3 didUpdateOn:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_10000E930();
}

- (void)dimensionManager:(id)a3 didUpdateTemperatureUnit:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_10000E930();
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