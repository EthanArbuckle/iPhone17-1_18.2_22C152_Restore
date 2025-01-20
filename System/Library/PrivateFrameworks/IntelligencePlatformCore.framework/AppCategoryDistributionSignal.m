@interface AppCategoryDistributionSignal
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation AppCategoryDistributionSignal

- (NSSet)featureNames
{
  swift_retain();
  sub_1C6E987C8();
  swift_release();
  v2 = (void *)sub_1C7926780();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  sub_1C7925E60();
  swift_retain();
  sub_1C6E99954();
  v4 = v3;
  swift_release();
  swift_bridgeObjectRelease();
  return v4;
}

@end