@interface LightLayerModule
- (_TtC16IntelligentLight16LightLayerModule)init;
- (void)dealloc;
- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4;
- (void)thermalStateDidChangeWithNotification:(id)a3;
@end

@implementation LightLayerModule

- (_TtC16IntelligentLight16LightLayerModule)init
{
  return (_TtC16IntelligentLight16LightLayerModule *)sub_1000097C4();
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16IntelligentLight16LightLayerModule_displayMonitor);
  v3 = self;
  [v2 removeObserver:v3];
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for LightLayerModule();
  [(LightLayerModule *)&v4 dealloc];
}

- (void).cxx_destruct
{
  sub_1000087CC((uint64_t)self + OBJC_IVAR____TtC16IntelligentLight16LightLayerModule_moduleAccessor);
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16IntelligentLight16LightLayerModule_displayMonitor);
}

- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10000C144(v7);
}

- (void)thermalStateDidChangeWithNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_10000ACB0();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end