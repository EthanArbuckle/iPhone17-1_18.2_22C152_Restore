@interface DiningOutModelInput
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation DiningOutModelInput

- (NSSet)featureNames
{
  swift_retain();
  sub_1C791680C();
  swift_release();
  v2 = (void *)sub_1C7926780();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  return sub_1C7916B04((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1C7916818);
}

@end