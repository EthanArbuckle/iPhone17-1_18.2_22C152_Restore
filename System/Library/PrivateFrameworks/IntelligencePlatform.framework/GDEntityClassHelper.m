@interface GDEntityClassHelper
+ (unint64_t)entityClassFrom:(id)a3;
- (_TtC20IntelligencePlatform19GDEntityClassHelper)init;
@end

@implementation GDEntityClassHelper

- (_TtC20IntelligencePlatform19GDEntityClassHelper)init
{
}

+ (unint64_t)entityClassFrom:(id)a3
{
  uint64_t v3 = sub_1B2E82378();
  unint64_t v5 = static GDEntityClassHelper.entityClass(from:)(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

@end