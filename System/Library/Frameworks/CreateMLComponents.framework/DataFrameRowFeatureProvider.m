@interface DataFrameRowFeatureProvider
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation DataFrameRowFeatureProvider

- (NSSet)featureNames
{
  swift_retain();
  sub_2394E989C();
  swift_release();
  v2 = (void *)sub_2396D0B00();
  swift_bridgeObjectRelease();

  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  sub_2396D0440();
  swift_retain();
  v3 = (void *)sub_2394E997C();
  swift_release();
  swift_bridgeObjectRelease();

  return v3;
}

@end