@interface MotionTransformerOutput
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation MotionTransformerOutput

- (NSSet)featureNames
{
  v2 = *(void **)self->provider;
  swift_retain();
  id v3 = objc_msgSend(v2, sel_featureNames);
  sub_250C1D8C8();
  swift_release();

  v4 = (void *)sub_250C1D8B8();
  swift_bridgeObjectRelease();
  return (NSSet *)v4;
}

- (id)featureValueForName:(id)a3
{
  sub_250C1D6D8();
  v4 = *(void **)self->provider;
  swift_retain();
  v5 = (void *)sub_250C1D6A8();
  id v6 = objc_msgSend(v4, sel_featureValueForName_, v5);
  swift_release();
  swift_bridgeObjectRelease();

  return v6;
}

@end