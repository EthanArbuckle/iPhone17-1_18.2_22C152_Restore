@interface locationEncoderInput
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation locationEncoderInput

- (NSSet)featureNames
{
  swift_retain();
  sub_1B2E33AB4();
  swift_release();
  v2 = (void *)sub_1B2E82AF8();
  swift_bridgeObjectRelease();

  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  return sub_1B2E33CBC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1B2E33AC0);
}

@end