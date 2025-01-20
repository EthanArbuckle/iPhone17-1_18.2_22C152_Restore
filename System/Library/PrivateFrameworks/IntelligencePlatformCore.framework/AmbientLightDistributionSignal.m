@interface AmbientLightDistributionSignal
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation AmbientLightDistributionSignal

- (NSSet)featureNames
{
  swift_retain();
  sub_1C6E822D0();
  swift_release();
  v2 = (void *)sub_1C7926780();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  uint64_t v3 = sub_1C7925E60();
  uint64_t v5 = v4;
  swift_retain();
  id v6 = sub_1C6E82B8C(v3, v5);
  swift_release();
  swift_bridgeObjectRelease();
  return v6;
}

@end