@interface SatelliteListItemProvider
- (_TtC11SettingsApp25SatelliteListItemProvider)init;
- (void)activeSubscriptionsDidChange;
- (void)dealloc;
- (void)displayStatusChanged:(id)a3 status:(id)a4;
- (void)manager:(id)a3 offGridModeUpdated:(int64_t)a4 publishStatus:(int64_t)a5 context:(id)a6;
- (void)stateChanged:(id)a3;
@end

@implementation SatelliteListItemProvider

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11SettingsApp25SatelliteListItemProvider_stewieStateMonitor);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11SettingsApp25SatelliteListItemProvider_stewieStateMonitor) = 0;
  v5 = self;

  v6 = *(Class *)((char *)&v5->super.isa
                + OBJC_IVAR____TtC11SettingsApp25SatelliteListItemProvider_idsOffGridStateManager);
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC11SettingsApp25SatelliteListItemProvider_idsOffGridStateManager) = 0;

  v7.receiver = v5;
  v7.super_class = ObjectType;
  [(SatelliteListItemProvider *)&v7 dealloc];
}

- (void).cxx_destruct
{
  sub_10003DC0C((uint64_t)self + OBJC_IVAR____TtC11SettingsApp25SatelliteListItemProvider_id, (uint64_t (*)(void))type metadata accessor for PrimarySettingsListItemIdentifier);
  swift_release();
  sub_1000196E4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11SettingsApp25SatelliteListItemProvider_satelliteState), *(void *)&self->satelliteStateLock[OBJC_IVAR____TtC11SettingsApp25SatelliteListItemProvider_satelliteState]);
  sub_100042A1C((uint64_t)self + OBJC_IVAR____TtC11SettingsApp25SatelliteListItemProvider_invalidator);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SettingsApp25SatelliteListItemProvider_stewieStateMonitor));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SettingsApp25SatelliteListItemProvider_idsOffGridStateManager));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11SettingsApp25SatelliteListItemProvider_ctClient);
}

- (_TtC11SettingsApp25SatelliteListItemProvider)init
{
  result = (_TtC11SettingsApp25SatelliteListItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)stateChanged:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000ABE88(v4);
}

- (void)manager:(id)a3 offGridModeUpdated:(int64_t)a4 publishStatus:(int64_t)a5 context:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  v11 = self;
  sub_1000AE180(a4);
}

- (void)displayStatusChanged:(id)a3 status:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  sub_1000AC724(a3, a4);
}

- (void)activeSubscriptionsDidChange
{
  v2 = self;
  sub_1000AD9B4();
}

@end