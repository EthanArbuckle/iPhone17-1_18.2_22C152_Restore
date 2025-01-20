@interface SbertQuantizedEmbeddingModelOutput
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation SbertQuantizedEmbeddingModelOutput

- (NSSet)featureNames
{
  swift_retain();
  sub_253B0436C();
  swift_release();
  v2 = (void *)sub_253B09C40();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  return sub_253B0442C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_253B043C4);
}

@end