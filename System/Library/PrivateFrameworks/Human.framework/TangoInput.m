@interface TangoInput
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation TangoInput

- (NSSet)featureNames
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269C32A40);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_252953740;
  *(void *)(inited + 32) = 0x6D695F7475706E69;
  *(void *)(inited + 40) = 0xEB00000000656761;
  sub_25290DF7C(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  v3 = (void *)sub_252951CB8();
  swift_bridgeObjectRelease();

  return (NSSet *)v3;
}

- (id)featureValueForName:(id)a3
{
  if (sub_252951AE8() == 0x6D695F7475706E69 && v4 == 0xEB00000000656761 || (sub_252952108() & 1) != 0)
  {
    uint64_t v5 = *(void *)self->input_image;
    v6 = self;
    swift_retain();
    id v7 = objc_msgSend(v6, sel_featureValueWithMultiArray_, v5);
    swift_release();
  }
  else
  {
    id v7 = 0;
  }
  swift_bridgeObjectRelease();

  return v7;
}

@end