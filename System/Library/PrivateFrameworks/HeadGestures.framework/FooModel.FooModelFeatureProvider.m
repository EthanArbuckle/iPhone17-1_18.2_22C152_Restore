@interface FooModel.FooModelFeatureProvider
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)setFeatureNames:(id)a3;
@end

@implementation FooModel.FooModelFeatureProvider

- (NSSet)featureNames
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_250C1D8B8();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (void)setFeatureNames:(id)a3
{
  *(void *)self->featureNames = sub_250C1D8C8();
  swift_retain();
  swift_release();
  swift_bridgeObjectRelease();
}

- (id)featureValueForName:(id)a3
{
  uint64_t v3 = sub_250C1D6D8();
  uint64_t v5 = v4;
  swift_retain();
  id v6 = sub_250BEB9E4(v3, v5);
  swift_release();
  swift_bridgeObjectRelease();
  return v6;
}

@end