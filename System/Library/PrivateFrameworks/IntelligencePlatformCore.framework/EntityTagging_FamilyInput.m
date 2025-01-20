@interface EntityTagging_FamilyInput
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation EntityTagging_FamilyInput

- (NSSet)featureNames
{
  swift_retain();
  sub_1C7917414();
  swift_release();
  v2 = (void *)sub_1C7926780();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  return sub_1C7918EA8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1C7917420);
}

@end