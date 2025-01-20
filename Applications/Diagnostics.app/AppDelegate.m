@interface AppDelegate
- (UIWindow)window;
- (_TtC11Diagnostics11AppDelegate)init;
- (uint64_t)sceneDidBecomeActive:;
- (uint64_t)sceneWillResignActive:;
- (void)application:(id)a3 didDiscardSceneSessions:(id)a4;
- (void)applicationWillTerminate:;
- (void)consumeLongPressForButtonKind:(int64_t)a3;
- (void)handleButtonEventWithEvent:(unint64_t)a3;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation AppDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC11Diagnostics11AppDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11Diagnostics11AppDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11Diagnostics11AppDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1000A8030((uint64_t)v8, v10);
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  sub_10003C374(0, &qword_100185018);
  sub_1000AAD54(&qword_100185020, &qword_100185018);
  static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a3;
  v7 = self;
  sub_1000A9358();

  swift_bridgeObjectRelease();
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000A9C30();
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000A9E70();
}

- (void)application:(id)a3 didDiscardSceneSessions:(id)a4
{
  uint64_t v5 = qword_1001827C8;
  id v6 = a3;
  v7 = self;
  if (v5 != -1) {
    swift_once();
  }
  sub_10003AFD0((uint64_t *)&unk_1001836E0);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_100123B50;
  *(void *)(v8 + 56) = &type metadata for String;
  *(void *)(v8 + 64) = sub_10004D9B4();
  *(void *)(v8 + 32) = 0xD000000000000027;
  *(void *)(v8 + 40) = 0x800000010012F630;
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();

  swift_bridgeObjectRelease();
}

- (void)consumeLongPressForButtonKind:(int64_t)a3
{
}

- (void)handleButtonEventWithEvent:(unint64_t)a3
{
}

- (_TtC11Diagnostics11AppDelegate)init
{
  return (_TtC11Diagnostics11AppDelegate *)sub_1000A76A4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11Diagnostics11AppDelegate_launcherServiceManager);
}

- (uint64_t)sceneDidBecomeActive:
{
  if (qword_1001827C8 != -1) {
    swift_once();
  }
  sub_10003AFD0((uint64_t *)&unk_1001836E0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100123B50;
  *(void *)(v0 + 56) = &type metadata for String;
  *(void *)(v0 + 64) = sub_10004D9B4();
  *(void *)(v0 + 32) = 0xD000000000000018;
  *(void *)(v0 + 40) = 0x800000010012F6E0;
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();
  id v1 = [self sharedApplication];
  [v1 setIdleTimerDisabled:1];

  if (qword_100182740 != -1) {
    swift_once();
  }
  v2 = (char *)qword_10018A358;
  int v3 = *(unsigned __int8 *)(qword_10018A358 + OBJC_IVAR____TtC11Diagnostics10Assertions_isVoiceControlEnabled);
  *(unsigned char *)(qword_10018A358 + OBJC_IVAR____TtC11Diagnostics10Assertions_isVoiceControlEnabled) = 0;
  if (v3 == 1)
  {
    SBSSpringBoardServerPort();
    SBSetVoiceControlEnabled();
  }
  id v4 = *(NSObject **)&v2[OBJC_IVAR____TtC11Diagnostics10Assertions_preventProxCardsQueue];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v2;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_1000AAD3C;
  *(void *)(v6 + 24) = v5;
  v10[4] = sub_10005B17C;
  v10[5] = v6;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_10004FD38;
  v10[3] = &unk_100151E58;
  v7 = _Block_copy(v10);
  uint64_t v8 = v2;
  swift_retain();
  swift_release();
  dispatch_sync(v4, v7);
  _Block_release(v7);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v4) {
    __break(1u);
  }
  return result;
}

- (uint64_t)sceneWillResignActive:
{
  if (qword_1001827C8 != -1) {
    swift_once();
  }
  sub_10003AFD0((uint64_t *)&unk_1001836E0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100123B50;
  *(void *)(v0 + 56) = &type metadata for String;
  *(void *)(v0 + 64) = sub_10004D9B4();
  *(void *)(v0 + 32) = 0xD000000000000019;
  *(void *)(v0 + 40) = 0x800000010012F6C0;
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();
  id v1 = [self sharedApplication];
  [v1 setIdleTimerDisabled:0];

  if (qword_100182740 != -1) {
    swift_once();
  }
  v2 = (char *)qword_10018A358;
  char v3 = *(unsigned char *)(qword_10018A358 + OBJC_IVAR____TtC11Diagnostics10Assertions_isVoiceControlEnabled);
  *(unsigned char *)(qword_10018A358 + OBJC_IVAR____TtC11Diagnostics10Assertions_isVoiceControlEnabled) = 1;
  if ((v3 & 1) == 0)
  {
    SBSSpringBoardServerPort();
    SBSetVoiceControlEnabled();
  }
  id v4 = *(NSObject **)&v2[OBJC_IVAR____TtC11Diagnostics10Assertions_preventProxCardsQueue];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v2;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_1000AAD24;
  *(void *)(v6 + 24) = v5;
  v10[4] = sub_10005B17C;
  v10[5] = v6;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_10004FD38;
  v10[3] = &unk_100151DE0;
  v7 = _Block_copy(v10);
  uint64_t v8 = v2;
  swift_retain();
  swift_release();
  dispatch_sync(v4, v7);
  _Block_release(v7);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v4) {
    __break(1u);
  }
  return result;
}

- (void)applicationWillTerminate:
{
  sub_10003AFD0((uint64_t *)&unk_1001836E0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100123B50;
  if (qword_1001827C8 != -1) {
    swift_once();
  }
  id v1 = (void *)qword_10018A3E8;
  *(void *)(v0 + 56) = sub_10003C374(0, (unint64_t *)&qword_1001832C0);
  *(void *)(v0 + 64) = sub_1000AAD54((unint64_t *)&qword_100184FF0, (unint64_t *)&qword_1001832C0);
  *(void *)(v0 + 32) = v1;
  id v2 = v1;
  char v3 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  if (qword_100182740 != -1) {
    swift_once();
  }
  id v4 = (void *)qword_10018A358;
  uint64_t v5 = *(NSObject **)(qword_10018A358 + OBJC_IVAR____TtC11Diagnostics10Assertions_preventTaskSuspendQueue);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v4;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_1000AACB4;
  *(void *)(v7 + 24) = v6;
  v14[4] = sub_100042974;
  v14[5] = v7;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_10004FD38;
  v14[3] = &unk_100151B88;
  uint64_t v8 = _Block_copy(v14);
  id v9 = v4;
  swift_retain();
  swift_release();
  dispatch_sync(v5, v8);
  _Block_release(v8);
  LOBYTE(v5) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if (v5)
  {
    __break(1u);
  }
  else
  {
    uint64_t v10 = qword_10018A358;
    sub_10004CC70();
    id v11 = sub_10004CDCC();
    [v11 setDiscoverableMode:*(void *)(v10 + OBJC_IVAR____TtC11Diagnostics10Assertions_airDropUserSetting)];

    sub_1000AA0D4();
    v12 = (unsigned char *)(qword_10018A358 + OBJC_IVAR____TtC11Diagnostics10Assertions_nearbySharingAssertionEnabled);
    *(unsigned char *)(qword_10018A358 + OBJC_IVAR____TtC11Diagnostics10Assertions_nearbySharingAssertionEnabled) = (*(unsigned char *)(qword_10018A358 + OBJC_IVAR____TtC11Diagnostics10Assertions_nearbySharingPreferencesState) & 1) == 0;
    id v13 = sub_10004CDCC();
    [v13 setNearbySharingEnabled:(*v12 & 1) == 0];
  }
}

@end