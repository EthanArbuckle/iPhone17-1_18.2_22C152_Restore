@interface GeneralSettingsListItemProvider
- (_TtC11SettingsApp31GeneralSettingsListItemProvider)init;
- (void)client:(id)a3 scanDidCompleteForOptions:(id)a4 results:(id)a5 error:(id)a6;
- (void)dealloc;
@end

@implementation GeneralSettingsListItemProvider

- (void)dealloc
{
  v2 = self;
  sub_1000AFA64();
}

- (void).cxx_destruct
{
  sub_100045F84((uint64_t)self + OBJC_IVAR____TtC11SettingsApp31GeneralSettingsListItemProvider_id);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SettingsApp31GeneralSettingsListItemProvider_softwareUpdateClient));
  v3 = (char *)self + OBJC_IVAR____TtC11SettingsApp31GeneralSettingsListItemProvider_invalidator;

  sub_100042A1C((uint64_t)v3);
}

- (_TtC11SettingsApp31GeneralSettingsListItemProvider)init
{
  result = (_TtC11SettingsApp31GeneralSettingsListItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)client:(id)a3 scanDidCompleteForOptions:(id)a4 results:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = self;
  id v14 = a6;
  sub_10001622C();
}

@end