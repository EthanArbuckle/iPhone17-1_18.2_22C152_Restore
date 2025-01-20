@interface PalermoInput
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation PalermoInput

- (NSSet)featureNames
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269C32A40);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_252953B00;
  *(void *)(inited + 32) = 0x6F6E5F7365736F70;
  *(void *)(inited + 40) = 0xEA00000000006D72;
  *(void *)(inited + 48) = 29800;
  *(void *)(inited + 56) = 0xE200000000000000;
  sub_25290DF7C(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  v3 = (void *)sub_252951CB8();
  swift_bridgeObjectRelease();

  return (NSSet *)v3;
}

- (id)featureValueForName:(id)a3
{
  uint64_t v3 = sub_252951AE8();
  uint64_t v5 = v4;
  swift_retain();
  id v6 = sub_2528C6350(v3, v5);
  swift_release();
  swift_bridgeObjectRelease();

  return v6;
}

@end