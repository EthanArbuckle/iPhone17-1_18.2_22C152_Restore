@interface SessionSceneDelegate
- (_TtC10ClockAngel20SessionSceneDelegate)init;
- (void)dealloc;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
@end

@implementation SessionSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10001DFD0(v8, v9);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10001E23C();
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10001B518(v4);
}

- (void)sceneWillResignActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10001EA70(25, 0xD000000000000017, (void *)0x8000000100099B90);
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10001EA70(28, 0xD00000000000001ALL, (void *)0x8000000100099B70);
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10001EA70(27, 0xD000000000000019, (void *)0x8000000100099B50);
}

- (void)dealloc
{
  v3 = self;
  id v4 = self;
  id v5 = [(SessionSceneDelegate *)v4 description];
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;

  uint64_t v12 = v6;
  uint64_t v13 = v8;
  v9._countAndFlagsBits = 0x74696E696564203ALL;
  v9._object = (void *)0xE800000000000000;
  String.append(_:)(v9);
  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v3 logInfo:v10];

  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for SessionSceneDelegate();
  [(SessionSceneDelegate *)&v11 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_10000FAF8((uint64_t)self + OBJC_IVAR____TtC10ClockAngel20SessionSceneDelegate_timerAttributes, &qword_1000C3B60);
  sub_10000FAF8((uint64_t)self + OBJC_IVAR____TtC10ClockAngel20SessionSceneDelegate_alarmAttributes, &qword_1000C3B68);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel20SessionSceneDelegate_currentSessionScene));

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel20SessionSceneDelegate_timerApertureElementProvider));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel20SessionSceneDelegate_alarmApertureElementProvider));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel20SessionSceneDelegate_stopwatchApertureElementProvider));

  swift_bridgeObjectRelease();
}

- (_TtC10ClockAngel20SessionSceneDelegate)init
{
  return (_TtC10ClockAngel20SessionSceneDelegate *)sub_10001BC6C();
}

@end