@interface FeedItemREElementDataSource
+ (NSString)applicationBundleIdentifier;
+ (NSString)bundleIdentifier;
+ (id)contentAttributes;
- (NSArray)supportedSections;
- (_TtC18HealthPlatformCore27FeedItemREElementDataSource)init;
- (void)getElementsInSection:(id)a3 withHandler:(id)a4;
@end

@implementation FeedItemREElementDataSource

+ (NSString)bundleIdentifier
{
  v2 = (void *)sub_1C1EAED28();
  return (NSString *)v2;
}

- (NSArray)supportedSections
{
  if (sub_1C1DD8038())
  {
    v2 = (void *)sub_1C1EAEE88();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

+ (NSString)applicationBundleIdentifier
{
  return (NSString *)0;
}

+ (id)contentAttributes
{
  v2 = (void *)sub_1C1EAEE88();
  return v2;
}

- (void)getElementsInSection:(id)a3 withHandler:(id)a4
{
  v6 = (void (*)(uint64_t))_Block_copy(a4);
  v7 = v6;
  if (a3)
  {
    uint64_t v8 = sub_1C1EAED38();
    a3 = v9;
    if (v7)
    {
LABEL_3:
      uint64_t v10 = swift_allocObject();
      *(void *)(v10 + 16) = v7;
      v7 = sub_1C1E22F80;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if (v6) {
      goto LABEL_3;
    }
  }
  uint64_t v10 = 0;
LABEL_6:
  v11 = self;
  sub_1C1E21084(v8, (unint64_t)a3, (uint64_t)v7, v10);
  sub_1C1E16DFC((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (_TtC18HealthPlatformCore27FeedItemREElementDataSource)init
{
  result = (_TtC18HealthPlatformCore27FeedItemREElementDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthPlatformCore27FeedItemREElementDataSource_store);
  swift_bridgeObjectRelease();
}

@end