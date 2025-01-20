@interface HealthDataListItemProvider
- (_TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider)init;
- (uint64_t)applicationsDidInstall:(uint64_t)a3;
- (void)dealloc;
- (void)sourceListDataSourceDidUpdate:(id)a3;
@end

@implementation HealthDataListItemProvider

- (void)dealloc
{
  v2 = self;
  sub_18840();
}

- (void).cxx_destruct
{
  sub_78F0((uint64_t)self + OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_invalidator);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_healthStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_healthAuthorizationStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_sourceListDataSource));
  sub_87CC(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_appsAndStudiesString), *(void *)&self->id[OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_appsAndStudiesString], self->invalidator[OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_appsAndStudiesString + 7]);

  swift_bridgeObjectRelease();
}

- (void)sourceListDataSourceDidUpdate:(id)a3
{
  id v5 = a3;
  v4 = self;
  sub_197A8(v5);
}

- (_TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider)init
{
  result = (_TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (uint64_t)applicationsDidInstall:(uint64_t)a3
{
  if (a3) {
    unint64_t v4 = sub_4C5D0();
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = a1;
  sub_1AA1C(v4);

  return swift_bridgeObjectRelease();
}

@end