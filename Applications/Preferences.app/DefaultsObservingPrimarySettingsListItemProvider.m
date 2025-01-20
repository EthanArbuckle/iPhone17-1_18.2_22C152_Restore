@interface DefaultsObservingPrimarySettingsListItemProvider
- (_TtC11SettingsApp48DefaultsObservingPrimarySettingsListItemProvider)init;
- (void)dealloc;
@end

@implementation DefaultsObservingPrimarySettingsListItemProvider

- (void)dealloc
{
  v2 = self;
  sub_1000F1164();
}

- (void).cxx_destruct
{
  sub_100045F84((uint64_t)self + OBJC_IVAR____TtC11SettingsApp48DefaultsObservingPrimarySettingsListItemProvider_id);
  sub_100042A1C((uint64_t)self + OBJC_IVAR____TtC11SettingsApp48DefaultsObservingPrimarySettingsListItemProvider_invalidator);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SettingsApp48DefaultsObservingPrimarySettingsListItemProvider_userDefaults));
  v3 = (char *)self + OBJC_IVAR____TtC11SettingsApp48DefaultsObservingPrimarySettingsListItemProvider_defaultsObserver;

  sub_100064640((uint64_t)v3);
}

- (_TtC11SettingsApp48DefaultsObservingPrimarySettingsListItemProvider)init
{
  result = (_TtC11SettingsApp48DefaultsObservingPrimarySettingsListItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end