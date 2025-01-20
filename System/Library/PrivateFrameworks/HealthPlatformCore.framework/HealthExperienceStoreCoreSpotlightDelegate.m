@interface HealthExperienceStoreCoreSpotlightDelegate
- (BOOL)usePrivateIndex;
- (id)attributeSetForObject:(id)a3;
- (id)bundleIdentifier;
- (id)indexName;
- (id)initForStoreWithDescription:(id)a3 coordinator:(id)a4;
- (id)protectionClass;
@end

@implementation HealthExperienceStoreCoreSpotlightDelegate

- (id)bundleIdentifier
{
  v2 = (void *)sub_1C1EAED28();
  return v2;
}

- (id)indexName
{
  v2 = (void *)sub_1C1EAED28();
  return v2;
}

- (id)initForStoreWithDescription:(id)a3 coordinator:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_1C1DDAC08((uint64_t)v5, (uint64_t)v6);

  return v7;
}

- (id)protectionClass
{
  uint64_t v2 = qword_1EBB65E08;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();

  v4 = (void *)sub_1C1EAED28();
  swift_bridgeObjectRelease();
  return v4;
}

- (BOOL)usePrivateIndex
{
  return 1;
}

- (id)attributeSetForObject:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = (void *)sub_1C1E60024(v4);

  return v6;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC18HealthPlatformCore42HealthExperienceStoreCoreSpotlightDelegate__defaultsVersion;
  sub_1C1E19B70();
  uint64_t v5 = v4;
  id v7 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v7)((void *)(v4 - 8), v3, v4);
  v7((char *)self + OBJC_IVAR____TtC18HealthPlatformCore42HealthExperienceStoreCoreSpotlightDelegate__defaultsLocale, v5);
  id v6 = (char *)self
     + OBJC_IVAR____TtC18HealthPlatformCore42HealthExperienceStoreCoreSpotlightDelegate__defaultsStoreIdentifier;
  v7(v6, v5);
}

@end