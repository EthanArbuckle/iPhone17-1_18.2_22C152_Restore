@interface ShirazOutput
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation ShirazOutput

- (NSSet)featureNames
{
  v2 = *(void **)self->provider;
  swift_retain();
  id v3 = objc_msgSend(v2, sel_featureNames);
  sub_252951CC8();
  swift_release();

  v4 = (void *)sub_252951CB8();
  swift_bridgeObjectRelease();

  return (NSSet *)v4;
}

- (id)featureValueForName:(id)a3
{
  sub_252951AE8();
  v4 = *(void **)self->provider;
  swift_retain();
  v5 = (void *)sub_252951AB8();
  id v6 = objc_msgSend(v4, sel_featureValueForName_, v5);
  swift_release();
  swift_bridgeObjectRelease();

  return v6;
}

@end