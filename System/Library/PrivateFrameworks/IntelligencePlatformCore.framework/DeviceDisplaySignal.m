@interface DeviceDisplaySignal
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation DeviceDisplaySignal

- (NSSet)featureNames
{
  swift_retain();
  sub_1C6FF8A34();
  swift_release();
  v2 = (void *)sub_1C7926780();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  sub_1C7925E60();
  swift_retain();
  id v3 = sub_1C6FF9C1C();
  swift_release();
  swift_bridgeObjectRelease();
  return v3;
}

@end