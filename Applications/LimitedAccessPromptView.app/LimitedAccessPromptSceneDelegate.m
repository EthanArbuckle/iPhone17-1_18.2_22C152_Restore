@interface LimitedAccessPromptSceneDelegate
- (_TtC23LimitedAccessPromptView32LimitedAccessPromptSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4;
@end

@implementation LimitedAccessPromptSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  uint64_t v8 = qword_10002E370;
  id v9 = a3;
  id v10 = a4;
  id v16 = a5;
  v11 = self;
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for Logger();
  sub_100009338(v12, (uint64_t)qword_10002FD80);
  v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "LimitedAccessPromptSceneDelegate willConnectToWithOptions", v15, 2u);
    swift_slowDealloc();
  }
}

- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;
  id v9 = a3;
  id v10 = self;
  sub_10001D71C(v6, v8);

  swift_bridgeObjectRelease();
}

- (_TtC23LimitedAccessPromptView32LimitedAccessPromptSceneDelegate)init
{
  return (_TtC23LimitedAccessPromptView32LimitedAccessPromptSceneDelegate *)sub_10001CCC8(self, (uint64_t)a2, type metadata accessor for LimitedAccessPromptSceneDelegate);
}

@end