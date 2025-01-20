@interface MentionGenerationInput
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation MentionGenerationInput

- (NSSet)featureNames
{
  swift_retain();
  sub_1B2D539C0();
  swift_release();
  v2 = (void *)sub_1B2E82AF8();
  swift_bridgeObjectRelease();

  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  uint64_t v3 = sub_1B2E82378();
  uint64_t v5 = v4;
  swift_retain();
  id v6 = sub_1B2D539CC(v3, v5);
  swift_release();
  swift_bridgeObjectRelease();

  return v6;
}

@end