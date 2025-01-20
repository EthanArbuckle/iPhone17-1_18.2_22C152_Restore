@interface SceneDelegate
- (UIWindow)window;
- (_TtC17PeopleViewService13SceneDelegate)init;
- (uint64_t)sceneDidBecomeActive:;
- (uint64_t)sceneWillResignActive:;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation SceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_100010DE0(v8, v10);
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000115F8();
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_peopleView);
  if (v3)
  {
    id v5 = a3;
    v6 = self;
    id v8 = v3;
    unsigned __int8 v7 = sub_100012D68();
    sub_10000F90C(v7);
  }
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1000119FC(v7);
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  sub_10000E1DC(0, &qword_100026820);
  sub_10000FD40();
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  id v8 = self;
  sub_10000FDA8(v6);

  swift_bridgeObjectRelease();
}

- (_TtC17PeopleViewService13SceneDelegate)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_window) = 0;
  uint64_t v3 = OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_rootViewController;
  type metadata accessor for RootContainerViewController();
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v5 = self;
  *(Class *)((char *)&self->super.super.isa + v3) = (Class)[v4 init];
  *(Class *)((char *)&v5->super.super.isa + OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_peopleView) = 0;

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for SceneDelegate();
  return [(SceneDelegate *)&v7 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_rootViewController));
  uint64_t v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_peopleView);
}

- (uint64_t)sceneDidBecomeActive:
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  static PeopleLogger.viewService.getter();
  id v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    uint64_t v8 = sub_100018764(0xD000000000000018, 0x800000010001DCD0, &v9);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s -- app reloading all widget timeline", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  type metadata accessor for WidgetCenter();
  static WidgetCenter.shared.getter();
  dispatch thunk of WidgetCenter.reloadAllTimelines()();
  return swift_release();
}

- (uint64_t)sceneWillResignActive:
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  static PeopleLogger.viewService.getter();
  id v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    uint64_t v8 = sub_100018764(0xD000000000000019, 0x800000010001DC90, &v9);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

@end