@interface DaemonListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSString)description;
- (_TtC10healthappd22DaemonListenerDelegate)init;
- (void)dealloc;
- (void)debuggingInfoRequestedWithNote:(id)a3;
@end

@implementation DaemonListenerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1000356E8(v7);

  return v9 & 1;
}

- (NSString)description
{
  v2 = self;
  sub_1000347D0();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void)dealloc
{
  NSString v3 = (objc_class *)type metadata accessor for DaemonListenerDelegate();
  v4 = self;
  DebuggingResponder.deregisterForDebuggingRequests()();
  v5.receiver = v4;
  v5.super_class = v3;
  [(DaemonListenerDelegate *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_healthExperienceStoreOracle));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC10healthappd22DaemonListenerDelegate)init
{
  result = (_TtC10healthappd22DaemonListenerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)debuggingInfoRequestedWithNote:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_100034B50();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end