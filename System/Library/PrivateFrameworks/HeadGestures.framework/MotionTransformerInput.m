@interface MotionTransformerInput
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation MotionTransformerInput

- (NSSet)featureNames
{
  sub_250BEFFAC();
  v2 = (void *)sub_250C1D8B8();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  uint64_t v3 = sub_250C1D6D8();
  uint64_t v5 = v4;
  swift_retain();
  id v6 = sub_250BEFBE4(v3, v5);
  swift_release();
  swift_bridgeObjectRelease();
  return v6;
}

@end