@interface MotionStateSignal
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation MotionStateSignal

- (NSSet)featureNames
{
  swift_retain();
  MotionStateSignal.featureNames.getter();
  swift_release();
  v2 = (void *)sub_1C7926780();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  uint64_t v3 = sub_1C7925E60();
  v5 = v4;
  swift_retain();
  v6._countAndFlagsBits = v3;
  v6._object = v5;
  v7 = (void *)MotionStateSignal.featureValue(for:)(v6);
  swift_release();
  swift_bridgeObjectRelease();
  return v7;
}

@end