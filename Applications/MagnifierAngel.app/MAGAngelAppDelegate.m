@interface MAGAngelAppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (_TtC14MagnifierAngel19MAGAngelAppDelegate)init;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (uint64_t)applicationWillTerminate:;
- (void)cameraViewfinder:(id)a3 viewfinderSessionDidBegin:(id)a4;
- (void)cameraViewfinder:(id)a3 viewfinderSessionDidEnd:(id)a4;
- (void)checkForDeactivationReasonWithNotification:(id)a3;
@end

@implementation MAGAngelAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_100022F9C(&qword_100044050, type metadata accessor for LaunchOptionsKey);
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  v7 = self;
  char v8 = sub_100021E98();
  swift_bridgeObjectRelease();

  return v8 & 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = sub_1000224BC(v9);

  return v12;
}

- (void)checkForDeactivationReasonWithNotification:(id)a3
{
  id v5 = a3;
  v4 = self;
  if ((static MAGAXUtilities.isVoiceOverRunning.getter() & 1) == 0) {
    sub_10001B75C();
  }
}

- (void)cameraViewfinder:(id)a3 viewfinderSessionDidBegin:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = self;
  sub_1000227BC(a4, "Viewfinder session did start: %@", (uint64_t)&unk_10003DFE0, (uint64_t)&unk_100044C08);
}

- (void)cameraViewfinder:(id)a3 viewfinderSessionDidEnd:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = self;
  sub_1000227BC(a4, "Viewfinder session did end: %@", (uint64_t)&unk_10003DFB8, (uint64_t)&unk_100044BF0);
}

- (_TtC14MagnifierAngel19MAGAngelAppDelegate)init
{
  return (_TtC14MagnifierAngel19MAGAngelAppDelegate *)sub_100021580();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_objectUnderstandingService));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelDetectionManager));

  v3 = (char *)self + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelLaunchTime;
  uint64_t v4 = type metadata accessor for Date();
  id v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_lastPixelBufferCheckTime, v4);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_figCameraViewFinder));
  v5((char *)self + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_lastDescribeSceneRequestTime, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

- (uint64_t)applicationWillTerminate:
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Log.angel.getter();
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)id v6 = 136315138;
    uint64_t v8 = sub_10002D340(0xD00000000000001CLL, 0x80000001000390D0, &v9);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

@end