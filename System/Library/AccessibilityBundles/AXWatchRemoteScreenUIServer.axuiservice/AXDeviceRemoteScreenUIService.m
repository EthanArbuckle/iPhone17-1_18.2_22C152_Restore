@interface AXDeviceRemoteScreenUIService
+ (id)possibleRequiredEntitlementsForProcessingMessageWithIdentifier:(int64_t)a3;
- (_TtC27AXWatchRemoteScreenUIServer29AXDeviceRemoteScreenUIService)init;
- (_TtC27AXWatchRemoteScreenUIServer29AXDeviceRemoteScreenUIService)initWithDisplayManager:(id)a3;
- (id)processMessage:(id)a3 withIdentifier:(int64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6;
- (void)clientConnectionWasInterrupted;
- (void)npsSetTwiceEnabledRemoteScreenWithEnabled:(BOOL)a3;
- (void)restartTwiceRemoteScreen;
- (void)startTwiceRemoteScreenWithSendRestart:(BOOL)a3;
- (void)stopTwiceRemoteScreen;
@end

@implementation AXDeviceRemoteScreenUIService

- (_TtC27AXWatchRemoteScreenUIServer29AXDeviceRemoteScreenUIService)initWithDisplayManager:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC27AXWatchRemoteScreenUIServer29AXDeviceRemoteScreenUIService_rootViewController);
  void *v6 = 0;
  v6[1] = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC27AXWatchRemoteScreenUIServer29AXDeviceRemoteScreenUIService_displayManager) = (Class)a3;
  v9.receiver = self;
  v9.super_class = ObjectType;
  id v7 = a3;
  return [(AXDeviceRemoteScreenUIService *)&v9 init];
}

- (void)startTwiceRemoteScreenWithSendRestart:(BOOL)a3
{
  v4 = self;
  sub_3810(a3);
}

- (void)stopTwiceRemoteScreen
{
  v2 = self;
  sub_3B84();
}

- (void)restartTwiceRemoteScreen
{
  v2 = self;
  sub_3FE0();
}

- (void)npsSetTwiceEnabledRemoteScreenWithEnabled:(BOOL)a3
{
}

- (id)processMessage:(id)a3 withIdentifier:(int64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6
{
  if (a3) {
    uint64_t v8 = sub_62C0();
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = sub_62E0();
  unint64_t v11 = v10;
  v12 = self;
  sub_4174(v8, a4, v9, v11);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v13.super.isa = sub_62B0().super.isa;
  swift_bridgeObjectRelease();

  return v13.super.isa;
}

+ (id)possibleRequiredEntitlementsForProcessingMessageWithIdentifier:(int64_t)a3
{
  if (sub_60D8())
  {
    v3.super.isa = sub_6300().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v3.super.isa = 0;
  }

  return v3.super.isa;
}

- (void)clientConnectionWasInterrupted
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC27AXWatchRemoteScreenUIServer29AXDeviceRemoteScreenUIService_rootViewController);
  if (v2)
  {
    swift_getObjectType();
    v4 = self;
    id v5 = v2;
    sub_6240();
  }
}

- (_TtC27AXWatchRemoteScreenUIServer29AXDeviceRemoteScreenUIService)init
{
  result = (_TtC27AXWatchRemoteScreenUIServer29AXDeviceRemoteScreenUIService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27AXWatchRemoteScreenUIServer29AXDeviceRemoteScreenUIService_displayManager));
  NSSet v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC27AXWatchRemoteScreenUIServer29AXDeviceRemoteScreenUIService_rootViewController);
}

@end