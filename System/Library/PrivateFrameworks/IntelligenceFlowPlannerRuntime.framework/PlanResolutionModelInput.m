@interface PlanResolutionModelInput
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation PlanResolutionModelInput

- (NSSet)featureNames
{
  swift_retain();
  sub_25326C1C8();
  swift_release();
  v2 = (void *)sub_253277278();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  return sub_25326C888((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_25326C1D4);
}

@end