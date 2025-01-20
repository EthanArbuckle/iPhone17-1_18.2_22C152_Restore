@interface LocationManager
- (_TtC16EventViewService15LocationManager)init;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
@end

@implementation LocationManager

- (_TtC16EventViewService15LocationManager)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtC16EventViewService15LocationManager_manager;
  id v5 = objc_allocWithZone((Class)CLLocationManager);
  v6 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)[v5 init];
  v7 = (char *)v6 + OBJC_IVAR____TtC16EventViewService15LocationManager_checkedThrowingContinuation;
  uint64_t v8 = sub_10000570C(&qword_1001A5B40);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);

  v10.receiver = v6;
  v10.super_class = ObjectType;
  return [(LocationManager *)&v10 init];
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC16EventViewService15LocationManager_checkedThrowingContinuation;

  sub_10001B754((uint64_t)v3);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  sub_10001B6AC();
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  uint64_t v8 = self;
  sub_10001B354(v7, v6);

  swift_bridgeObjectRelease();
}

@end