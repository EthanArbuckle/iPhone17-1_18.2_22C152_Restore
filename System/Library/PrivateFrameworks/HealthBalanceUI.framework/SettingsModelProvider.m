@interface SettingsModelProvider
- (_TtC15HealthBalanceUI21SettingsModelProvider)init;
- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4;
@end

@implementation SettingsModelProvider

- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  id v6 = a4;
  v7 = self;
  sub_250F3FE7C(v6, (uint64_t)v7);
  swift_unknownObjectRelease();
}

- (_TtC15HealthBalanceUI21SettingsModelProvider)init
{
  result = (_TtC15HealthBalanceUI21SettingsModelProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC15HealthBalanceUI21SettingsModelProvider___observationRegistrar;
  uint64_t v4 = sub_251037570();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end