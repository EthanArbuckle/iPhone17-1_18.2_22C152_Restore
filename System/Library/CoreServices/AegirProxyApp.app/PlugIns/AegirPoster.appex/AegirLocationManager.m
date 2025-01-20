@interface AegirLocationManager
- (_TtC11AegirPoster20AegirLocationManager)init;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
@end

@implementation AegirLocationManager

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  sub_1000203F4(0, (unint64_t *)&qword_100045680);
  unint64_t v6 = sub_100031D58();
  id v7 = a3;
  v8 = self;
  sub_1000239B8(v6);

  swift_bridgeObjectRelease();
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_100023BD4();
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000231C8(v4);
}

- (_TtC11AegirPoster20AegirLocationManager)init
{
  result = (_TtC11AegirPoster20AegirLocationManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11AegirPoster20AegirLocationManager_locationQueue);
}

@end