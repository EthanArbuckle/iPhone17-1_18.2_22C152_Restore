@interface MentionGenerationModelInput
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation MentionGenerationModelInput

- (NSSet)featureNames
{
  swift_retain();
  sub_1B2E33F14();
  swift_release();
  v2 = (void *)sub_1B2E82AF8();
  swift_bridgeObjectRelease();

  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  return sub_1B2E34074((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1B2E33F20);
}

@end