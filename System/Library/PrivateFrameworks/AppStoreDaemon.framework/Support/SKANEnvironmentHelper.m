@interface SKANEnvironmentHelper
+ (BOOL)shouldUseDevelopmentSettingsForEnvironment:(id)a3;
+ (id)environmentForParams:(id)a3;
+ (id)pingbackDelayOverrideForEnvironment:(id)a3;
+ (id)shouldUseProxyOverrideForEnvironment:(id)a3;
+ (id)windowDurationOverrideForEnvironment:(id)a3;
- (_TtC9appstored21SKANEnvironmentHelper)init;
@end

@implementation SKANEnvironmentHelper

+ (id)environmentForParams:(id)a3
{
  id v3 = a3;
  v4 = sub_1000AB9F8(v3);

  return v4;
}

+ (BOOL)shouldUseDevelopmentSettingsForEnvironment:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  id v4 = a3;
  LOBYTE(v3) = sub_1000ABCD8(v3);

  return v3 & 1;
}

+ (id)pingbackDelayOverrideForEnvironment:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000ABF28(a3, (uint64_t (*)(uint64_t))sub_1003F3FE0);

  return v5;
}

+ (id)windowDurationOverrideForEnvironment:(id)a3
{
  id v4 = a3;
  sub_1000ABDE8((uint64_t)a3);
  uint64_t v6 = v5;

  if (v6)
  {
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v7 = 0;
  }
  return v7;
}

+ (id)shouldUseProxyOverrideForEnvironment:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000ABF28(a3, (uint64_t (*)(uint64_t))sub_1003F4058);

  return v5;
}

- (_TtC9appstored21SKANEnvironmentHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SKANEnvironmentHelper();
  return [(SKANEnvironmentHelper *)&v3 init];
}

@end