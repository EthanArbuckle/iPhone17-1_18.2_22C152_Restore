@interface LocationManager
- (_TtC7parsecd15LocationManager)init;
- (void)bagChangeNotification:(id)a3;
- (void)dealloc;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)performedSearchNotification:(id)a3;
- (void)updateCountryCode:(id)a3;
- (void)updateMapsClientMetadata:(id)a3;
@end

@implementation LocationManager

- (void)dealloc
{
  v2 = self;
  sub_100079BC8();
}

- (void).cxx_destruct
{
  sub_10001CDE0((uint64_t)self + OBJC_IVAR____TtC7parsecd15LocationManager_assembly);
  swift_unknownObjectRelease();

  sub_1000251FC();
  sub_1000255D4((uint64_t)self + OBJC_IVAR____TtC7parsecd15LocationManager_geoLocationAge, &qword_10021BB10);
  sub_1000251FC();
  sub_1000251FC();
  sub_1000251FC();
  swift_release();

  swift_release();
}

- (void)bagChangeNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_10007A1D8();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)performedSearchNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_10007AC4C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)updateMapsClientMetadata:(id)a3
{
}

- (void)updateCountryCode:(id)a3
{
}

- (_TtC7parsecd15LocationManager)init
{
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  sub_100023FA0(0, &qword_10021A9F8);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a3;
  v7 = self;
  sub_10007CF94();

  swift_bridgeObjectRelease();
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  id v6 = a3;
  v7 = self;
  sub_10007D028((uint64_t)v7, a4);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  v7 = self;
  sub_10007D2E8();
}

@end