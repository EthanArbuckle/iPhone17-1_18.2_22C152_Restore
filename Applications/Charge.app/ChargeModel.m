@interface ChargeModel
- (_TtC6Charge11ChargeModel)init;
- (void)carDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
- (void)carDidUpdateAccessories:(id)a3;
- (void)chargingRateService:(id)a3 didUpdateChargingSpeed:(id)a4;
- (void)chargingRateService:(id)a3 didUpdatePower:(id)a4;
- (void)chargingStatusService:(id)a3 didUpdateCableState:(unsigned __int8)a4;
- (void)chargingTimeService:(id)a3 didUpdateRemainingTime:(id)a4;
- (void)dimensionManager:(id)a3 didUpdateLocale:(id)a4;
- (void)dimensionManager:(id)a3 didUpdateMeasurementSystem:(unint64_t)a4;
- (void)dimensionManager:(id)a3 didUpdateVehicleChargePowerUnit:(id)a4;
- (void)distanceDisplayService:(id)a3 didUpdateDistanceKM:(id)a4;
- (void)distanceDisplayService:(id)a3 didUpdateDistanceMiles:(id)a4;
@end

@implementation ChargeModel

- (void)carDidUpdateAccessories:(id)a3
{
  id v4 = a3;
  v6 = self;
  os_log_type_t v5 = static os_log_type_t.debug.getter();
  sub_10000B7A0(v5, 0xD000000000000020, 0x800000010001C3B0, 0xD00000000000001BLL, 0x800000010001C3E0);
  sub_1000187DC();
}

- (void)carDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_100019E74(a4);
}

- (void)chargingStatusService:(id)a3 didUpdateCableState:(unsigned __int8)a4
{
  id v5 = a3;
  id v6 = self;
  sub_100018F74();
}

- (void)chargingTimeService:(id)a3 didUpdateRemainingTime:(id)a4
{
  uint64_t v4 = sub_100009768(&qword_10002AAD8);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009C7C(0, &qword_10002BB00);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)chargingRateService:(id)a3 didUpdatePower:(id)a4
{
}

- (void)chargingRateService:(id)a3 didUpdateChargingSpeed:(id)a4
{
  uint64_t v5 = sub_100009768(&qword_10002BAE0);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_100009C7C(0, (unint64_t *)&unk_10002BAF0);
    static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = sub_100009768(&qword_10002BAE8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_100009768(&qword_10002BAE8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  sub_100019E14((uint64_t)v7);
}

- (void)distanceDisplayService:(id)a3 didUpdateDistanceKM:(id)a4
{
}

- (void)distanceDisplayService:(id)a3 didUpdateDistanceMiles:(id)a4
{
}

- (void)dimensionManager:(id)a3 didUpdateMeasurementSystem:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_100019100();
}

- (void)dimensionManager:(id)a3 didUpdateVehicleChargePowerUnit:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_100019100();
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

- (_TtC6Charge11ChargeModel)init
{
  result = (_TtC6Charge11ChargeModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC6Charge11ChargeModel__isCharging;
  uint64_t v4 = sub_100009768(&qword_10002BB08);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC6Charge11ChargeModel__supplementaryStatusText;
  uint64_t v6 = sub_100009768(&qword_10002BB10);
  id v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end