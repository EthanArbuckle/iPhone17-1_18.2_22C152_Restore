@interface LocationManagerDelegate
- (_TtC16HomeEnergyDaemon23LocationManagerDelegate)init;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
@end

@implementation LocationManagerDelegate

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2520FE2E8(v4);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  sub_251FF9AB4(0, &qword_26B2250A8);
  uint64_t v6 = sub_2521B6FB0();
  id v8 = a3;
  v7 = self;
  sub_2520FE570(v6);
  swift_bridgeObjectRelease();
}

- (_TtC16HomeEnergyDaemon23LocationManagerDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LocationManagerDelegate();
  return [(LocationManagerDelegate *)&v3 init];
}

@end