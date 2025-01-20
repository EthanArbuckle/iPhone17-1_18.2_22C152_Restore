@interface AXDeviceRemoteScreenService
+ (_TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService)sharedInstance;
- (BOOL)npsSetTwiceEnabled:(BOOL)a3;
- (BOOL)startTwiceRemoteScreen;
- (BOOL)stopTwiceRemoteScreen;
- (_TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService)init;
@end

@implementation AXDeviceRemoteScreenService

+ (_TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService)sharedInstance
{
  if (qword_26837DBD0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26837DD20;
  return (_TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService *)v2;
}

- (_TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService_serviceImpl);
  v5 = (objc_class *)type metadata accessor for AXWatchRemoteScreenServiceAXUIService();
  id v6 = objc_allocWithZone(v5);
  v7 = self;
  id v8 = objc_msgSend(v6, sel_init);
  v4[3] = v5;
  v4[4] = &off_26DE30ED0;
  void *v4 = v8;
  v9 = (Class *)((char *)&v7->super.isa
               + OBJC_IVAR____TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService_twiceEnabledEvent);
  void *v9 = 0xD000000000000036;
  v9[1] = 0x800000022A60BAF0;
  v10 = (Class *)((char *)&v7->super.isa
                + OBJC_IVAR____TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService_twiceEnabledKey);
  void *v10 = 0x64656C62616E65;
  v10[1] = 0xE700000000000000;

  v12.receiver = v7;
  v12.super_class = ObjectType;
  return [(AXDeviceRemoteScreenService *)&v12 init];
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService_serviceImpl);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (BOOL)npsSetTwiceEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  sub_22A5FF6A8((uint64_t)self + OBJC_IVAR____TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService_serviceImpl, (uint64_t)v10);
  uint64_t v5 = v11;
  uint64_t v6 = v12;
  __swift_project_boxed_opaque_existential_1(v10, v11);
  v7 = *(void (**)(BOOL, uint64_t, uint64_t))(v6 + 24);
  id v8 = self;
  v7(v3, v5, v6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);

  return 1;
}

- (BOOL)startTwiceRemoteScreen
{
  v2 = self;
  Swift::Bool v3 = AXDeviceRemoteScreenService.startTwiceRemoteScreen()();

  return v3;
}

- (BOOL)stopTwiceRemoteScreen
{
  v2 = self;
  Swift::Bool v3 = AXDeviceRemoteScreenService.stopTwiceRemoteScreen()();

  return v3;
}

@end