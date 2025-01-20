@interface SettingsWindowSceneDelegate
- (_TtC12AutoSettings27SettingsWindowSceneDelegate)init;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:;
- (void)sceneWillEnterForeground:;
@end

@implementation SettingsWindowSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10000C4E8(v8, v9);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000CAE4(v4);
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  sub_1000076B0(0, &qword_10002C2E8);
  sub_10000D53C();
  static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a3;
  v7 = self;
  sub_10000CD24();

  swift_bridgeObjectRelease();
}

- (_TtC12AutoSettings27SettingsWindowSceneDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SettingsWindowSceneDelegate();
  return [(SettingsWindowSceneDelegate *)&v3 init];
}

- (void)sceneWillEnterForeground:
{
  if (qword_10002BDE0 != -1) {
    swift_once();
  }
  v0 = qword_10002D1D0;
  os_log_type_t v1 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v0, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, v1, "AutoSettings scene will enter foreground", v2, 2u);
    swift_slowDealloc();
  }
  id v3 = [self sharedApplication];
  id v4 = [v3 delegate];

  if (!v4)
  {
    __break(1u);
    goto LABEL_11;
  }
  type metadata accessor for AppDelegate();
  v5 = *(void **)(swift_dynamicCastClassUnconditional() + OBJC_IVAR____TtC12AutoSettings11AppDelegate_settingsCarManager);
  if (!v5)
  {
LABEL_11:
    __break(1u);
    return;
  }
  id v6 = v5;
  sub_100012470();
  swift_unknownObjectRelease();
}

- (void)sceneDidEnterBackground:
{
  uint64_t v0 = type metadata accessor for Date();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  id v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10002BDE0 != -1) {
    swift_once();
  }
  id v4 = qword_10002D1D0;
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "AutoSettings scene did enter background", v6, 2u);
    swift_slowDealloc();
  }
  id v7 = [self sharedApplication];
  id v8 = [v7 delegate];

  if (v8)
  {
    type metadata accessor for AppDelegate();
    id v9 = *(void **)(swift_dynamicCastClassUnconditional()
                  + OBJC_IVAR____TtC12AutoSettings11AppDelegate_settingsCarManager);
    if (v9)
    {
      id v10 = v9;
      Date.init()();
      v11 = &v10[OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_lastBackgroundTime];
      swift_beginAccess();
      (*(void (**)(char *, char *, uint64_t))(v1 + 40))(v11, v3, v0);
      swift_endAccess();
      swift_unknownObjectRelease();

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

@end