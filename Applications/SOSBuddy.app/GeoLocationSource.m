@interface GeoLocationSource
- (_TtC8SOSBuddy17GeoLocationSource)init;
- (void)dealloc;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
@end

@implementation GeoLocationSource

- (_TtC8SOSBuddy17GeoLocationSource)init
{
  return (_TtC8SOSBuddy17GeoLocationSource *)sub_1000BE630();
}

- (void)dealloc
{
  v2 = self;
  sub_1000BECD8();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8SOSBuddy17GeoLocationSource__locationManager);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  sub_10001E6FC(0, &qword_100385858);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  v8 = self;
  sub_1000C0620(v6);

  swift_bridgeObjectRelease();
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000BFF00(v4);
}

@end