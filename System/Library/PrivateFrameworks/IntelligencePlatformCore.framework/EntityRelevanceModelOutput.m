@interface EntityRelevanceModelOutput
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation EntityRelevanceModelOutput

- (NSSet)featureNames
{
  swift_retain();
  sub_1C7916A44();
  swift_release();
  v2 = (void *)sub_1C7926780();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  return sub_1C79172E4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1C7916A9C);
}

@end