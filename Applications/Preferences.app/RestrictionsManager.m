@interface RestrictionsManager
- (_TtC11SettingsApp19RestrictionsManager)init;
- (uint64_t)profileConnectionDidReceiveRestrictionChangedNotification:(void *)a3 userInfo:(uint64_t)a4;
- (void)dealloc;
@end

@implementation RestrictionsManager

- (_TtC11SettingsApp19RestrictionsManager)init
{
  return (_TtC11SettingsApp19RestrictionsManager *)sub_1000185E4();
}

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = [v3 sharedConnection];
  if (v5)
  {
    v6 = v5;
    [v5 unregisterObserver:v4];

    v7.receiver = v4;
    v7.super_class = (Class)type metadata accessor for RestrictionsManager();
    [(RestrictionsManager *)&v7 dealloc];
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC11SettingsApp19RestrictionsManager___observationRegistrar;
  uint64_t v4 = type metadata accessor for ObservationRegistrar();
  id v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (uint64_t)profileConnectionDidReceiveRestrictionChangedNotification:(void *)a3 userInfo:(uint64_t)a4
{
  if (a4) {
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  id v7 = a1;
  _s11SettingsApp19RestrictionsManagerC027profileConnectionDidReceiveB28WhitelistChangedNotification_8userInfoySo09MCProfileF0CSg_SDys11AnyHashableVypGSgtF_0();

  return swift_bridgeObjectRelease();
}

@end