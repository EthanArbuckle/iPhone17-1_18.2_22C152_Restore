@interface GDEntityPredicateHelper
+ (unint64_t)entityPredicateFrom:(id)a3;
- (_TtC20IntelligencePlatform23GDEntityPredicateHelper)init;
@end

@implementation GDEntityPredicateHelper

- (_TtC20IntelligencePlatform23GDEntityPredicateHelper)init
{
}

+ (unint64_t)entityPredicateFrom:(id)a3
{
  uint64_t v3 = sub_1B2E82378();
  unint64_t v5 = static GDEntityPredicateHelper.entityPredicate(from:)(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

@end