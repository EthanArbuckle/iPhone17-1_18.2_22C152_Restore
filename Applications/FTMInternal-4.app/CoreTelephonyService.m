@interface CoreTelephonyService
- (_TtC13FTMInternal_420CoreTelephonyService)init;
- (void)cellMonitorUpdate:(id)a3 info:(id)a4;
- (void)connectionAvailability:(id)a3 availableConnections:(id)a4;
- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5;
- (void)dealloc;
@end

@implementation CoreTelephonyService

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  v5 = self;
  id v6 = [v4 defaultCenter];
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v6 removeObserver:v7];

  v8.receiver = v5;
  v8.super_class = ObjectType;
  [(CoreTelephonyService *)&v8 dealloc];
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

- (_TtC13FTMInternal_420CoreTelephonyService)init
{
  result = (_TtC13FTMInternal_420CoreTelephonyService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)cellMonitorUpdate:(id)a3 info:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_1001936B0((char *)a3, a4);
}

- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v9 = a3;
  id v10 = a5;
  v11 = self;
  sub_1001981C0((uint64_t)a3, v6, a5);
}

- (void)connectionAvailability:(id)a3 availableConnections:(id)a4
{
  if (a4) {
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  id v7 = self;
  sub_100198378();

  swift_bridgeObjectRelease();
}

@end