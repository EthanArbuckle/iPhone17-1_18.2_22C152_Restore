@interface ActionFeatureWrapper
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation ActionFeatureWrapper

- (NSSet)featureNames
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269C32A40);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_252953740;
  *(void *)(inited + 32) = 0x7475706E69;
  *(void *)(inited + 40) = 0xE500000000000000;
  sub_25290DF7C(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  v3 = (void *)sub_252951CB8();
  swift_bridgeObjectRelease();

  return (NSSet *)v3;
}

- (id)featureValueForName:(id)a3
{
  swift_retain();
  v3 = (void *)_s5Human20ActionFeatureWrapperC12featureValue3forSo09MLFeatureF0CSgSS_tF_0();
  swift_release();

  return v3;
}

@end