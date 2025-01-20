@interface ClimateZoneHeatingCoolingVentingPositionView
- (void)fanService:(id)a3 didUpdateFanLevel:(unsigned __int8)a4;
- (void)heatingCoolingService:(id)a3 didUpdateHeatingCoolingLevel:(int)a4;
- (void)heatingCoolingService:(id)a3 didUpdateOn:(BOOL)a4;
- (void)temperatureService:(id)a3 didUpdateCurrentTemperature:(id)a4;
- (void)temperatureService:(id)a3 didUpdateTargetTemperature:(id)a4;
@end

@implementation ClimateZoneHeatingCoolingVentingPositionView

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate44ClimateZoneHeatingCoolingVentingPositionView_seatView));
  v3 = (char *)self + OBJC_IVAR____TtC7Climate44ClimateZoneHeatingCoolingVentingPositionView_images;
  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC7Climate44ClimateZoneHeatingCoolingVentingPositionView_images);
  v5 = *(void **)&self->super.activeZoneTracker[OBJC_IVAR____TtC7Climate44ClimateZoneHeatingCoolingVentingPositionView_images];
  id v6 = (id)*((void *)v3 + 2);
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
  sub_100076BC8();

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
  sub_100076BC8();

  sub_10000FF1C((uint64_t)v9);
}

- (void)heatingCoolingService:(id)a3 didUpdateOn:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_100076BC8();
}

- (void)heatingCoolingService:(id)a3 didUpdateHeatingCoolingLevel:(int)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_100076BC8();
}

- (void)fanService:(id)a3 didUpdateFanLevel:(unsigned __int8)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_100076BC8();
}

@end