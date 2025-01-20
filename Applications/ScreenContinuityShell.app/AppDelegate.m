@interface AppDelegate
+ (void)main;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (_TtC21ScreenContinuityShell11AppDelegate)init;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
@end

@implementation AppDelegate

- (_TtC21ScreenContinuityShell11AppDelegate)init
{
  return (_TtC21ScreenContinuityShell11AppDelegate *)sub_10000DCD4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC21ScreenContinuityShell11AppDelegate_xpcEventQueue));
  v3 = (char *)self + OBJC_IVAR____TtC21ScreenContinuityShell11AppDelegate____lazy_storage___displayRegistrarVendor;
  if (*(void *)&self->$__lazy_storage_$_displayRegistrarVendor[OBJC_IVAR____TtC21ScreenContinuityShell11AppDelegate____lazy_storage___displayRegistrarVendor
                                                                + 8])
  {
    sub_10000BDB8((uint64_t)v3);
  }
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_100010CD0(&qword_100021CC0, type metadata accessor for LaunchOptionsKey);
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  v7 = self;
  char v8 = sub_10000FF7C();

  swift_bridgeObjectRelease();
  return v8 & 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = sub_1000101E0(v9);

  return v12;
}

+ (void)main
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v3 = __chkstk_darwin(v0, v2);
  v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3, v6);
  id v8 = (char *)&v36 - v7;
  static Logger.angel.getter();
  v9._object = (void *)0x8000000100019C40;
  v9._countAndFlagsBits = 0xD000000000000062;
  v10._countAndFlagsBits = 0x29286E69616DLL;
  v10._object = (void *)0xE600000000000000;
  Logger.debugMarker(_:line:function:message:)(v9, 51, v10, (Swift::String_optional)0);
  v13 = *(void (**)(char *, uint64_t))(v1 + 8);
  uint64_t v11 = v1 + 8;
  id v12 = v13;
  v13(v8, v0);
  uint64_t v14 = type metadata accessor for OnenessFeatureFlags();
  uint64_t v44 = v14;
  uint64_t v45 = sub_100010CD0(&qword_100022320, (void (*)(uint64_t))&type metadata accessor for OnenessFeatureFlags);
  v15 = sub_10001086C(v43);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v14 - 8) + 104))(v15, enum case for OnenessFeatureFlags.Shell(_:), v14);
  LOBYTE(v14) = isFeatureEnabled(_:)();
  sub_10000BDB8((uint64_t)v43);
  id v16 = 0;
  if (v14)
  {
    type metadata accessor for AngelServer();
    v17 = (void *)static AngelServer.sharedInstance.getter();
    AngelServer.startUp()();

    uint64_t v18 = type metadata accessor for LiveActivityDisplayingVendor();
    uint64_t v19 = swift_allocObject();
    uint64_t v44 = v18;
    uint64_t v45 = sub_100010CD0(&qword_1000223D8, (void (*)(uint64_t))type metadata accessor for LiveActivityDisplayingVendor);
    v43[0] = v19;
    v20 = (void *)static AngelServer.sharedInstance.getter();
    AngelServer.provideLiveActivityVendor(_:)();

    v21 = self;
    static RunningBoardServiceSpecification.serviceDomain.getter();
    NSString v22 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v16 = [v21 activateManualDomain:v22];

    sub_10000BDB8((uint64_t)v43);
  }
  type metadata accessor for AppDelegate();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  v24 = NSStringFromClass(ObjCClassFromMetadata);
  if (!v24)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    v24 = (NSString *)String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  uint64_t v41 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v26 = v25;
  type metadata accessor for Application();
  v27 = (objc_class *)swift_getObjCClassFromMetadata();
  v28 = NSStringFromClass(v27);
  if (!v28)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    v28 = (NSString *)String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  static Logger.angel.getter();
  swift_bridgeObjectRetain();
  v29 = Logger.logObject.getter();
  os_log_type_t v30 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v29, v30))
  {
    v40 = v5;
    uint64_t v31 = swift_slowAlloc();
    uint64_t v39 = v11;
    v32 = (uint8_t *)v31;
    uint64_t v33 = swift_slowAlloc();
    uint64_t v38 = v0;
    v43[0] = v33;
    v37 = v12;
    *(_DWORD *)v32 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v42 = sub_10000B648(v41, v26, v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "appDelegateClassString: %{public}s", v32, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v37(v40, v38);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v12(v5, v0);
  }
  int v34 = static CommandLine.argc.getter();
  v35 = (char **)static CommandLine.unsafeArgv.getter();
  UIApplicationMain(v34, v35, v28, v24);

  if (v16)
  {
    [v16 invalidate];
    swift_unknownObjectRelease();
  }
}

@end