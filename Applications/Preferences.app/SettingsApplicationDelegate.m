@interface SettingsApplicationDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (_TtC11SettingsApp27SettingsApplicationDelegate)init;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (void)dealloc;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)profileConnectionDidReceivePasscodeChangedNotification:(id)a3 userInfo:(id)a4;
- (void)profileConnectionDidReceiveProfileListChangedNotification:(id)a3 userInfo:(id)a4;
- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4;
@end

@implementation SettingsApplicationDelegate

- (_TtC11SettingsApp27SettingsApplicationDelegate)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11SettingsApp27SettingsApplicationDelegate_observationTokens) = (Class)&_swiftEmptyArrayStorage;
  ObservationRegistrar.init()();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SettingsApplicationDelegate();
  return [(SettingsApplicationDelegate *)&v4 init];
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_100082118();
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  v7 = self;
  char v8 = sub_10001ECEC();

  swift_bridgeObjectRelease();
  return v8 & 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = [v9 role];
  id v13 = [objc_allocWithZone((Class)UISceneConfiguration) initWithName:0 sessionRole:v12];

  type metadata accessor for SettingsAppSceneDelegate();
  [v13 setDelegateClass:swift_getObjCClassFromMetadata()];

  return v13;
}

- (void)dealloc
{
  v2 = self;
  sub_1000819BC();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC11SettingsApp27SettingsApplicationDelegate___observationRegistrar;
  uint64_t v4 = type metadata accessor for ObservationRegistrar();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (void)profileConnectionDidReceiveProfileListChangedNotification:(id)a3 userInfo:(id)a4
{
}

- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4
{
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
}

- (void)profileConnectionDidReceivePasscodeChangedNotification:(id)a3 userInfo:(id)a4
{
}

@end