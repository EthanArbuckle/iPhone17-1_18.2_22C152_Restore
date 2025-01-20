@interface CNContactProviderSupportCache
+ (_TtC8Contacts29CNContactProviderSupportCache)sharedCache;
- (NSArray)cachedBundleIdentifiers;
- (_TtC8Contacts29CNContactProviderSupportCache)init;
- (void)invalidateCache;
@end

@implementation CNContactProviderSupportCache

+ (_TtC8Contacts29CNContactProviderSupportCache)sharedCache
{
  if (qword_1E92A3BD0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1E92A3BC0;

  return (_TtC8Contacts29CNContactProviderSupportCache *)v2;
}

- (NSArray)cachedBundleIdentifiers
{
  swift_beginAccess();
  v3 = self;
  uint64_t v4 = swift_bridgeObjectRetain();
  sub_190B2C96C(v4);

  swift_bridgeObjectRelease();
  v5 = (void *)sub_190B772B8();
  swift_release();

  return (NSArray *)v5;
}

- (_TtC8Contacts29CNContactProviderSupportCache)init
{
  return (_TtC8Contacts29CNContactProviderSupportCache *)sub_190B53550();
}

- (void)invalidateCache
{
  v2 = self;
  sub_190B5378C((uint64_t)v2);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
}

@end