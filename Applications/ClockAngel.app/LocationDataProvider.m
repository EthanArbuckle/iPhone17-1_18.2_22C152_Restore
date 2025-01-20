@interface LocationDataProvider
- (_TtC10ClockAngel20LocationDataProvider)init;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
@end

@implementation LocationDataProvider

- (_TtC10ClockAngel20LocationDataProvider)init
{
  return (_TtC10ClockAngel20LocationDataProvider *)sub_100029760();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC10ClockAngel20LocationDataProvider_distanceFilter;
  uint64_t v4 = sub_100007830(&qword_1000C40D8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10ClockAngel20LocationDataProvider____lazy_storage___locationManager);

  sub_10002DDFC(v5);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  sub_100014314(0, &qword_1000C42E0);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  v8 = self;
  sub_10002A9B4(v7, v6);

  swift_bridgeObjectRelease();
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_10002E8F4((uint64_t)v8);
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10002AFAC(v4);
}

@end