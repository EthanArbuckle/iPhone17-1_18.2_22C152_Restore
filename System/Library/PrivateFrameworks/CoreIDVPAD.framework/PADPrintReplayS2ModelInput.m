@interface PADPrintReplayS2ModelInput
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation PADPrintReplayS2ModelInput

- (NSSet)featureNames
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAF98);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21F0CBD60;
  *(void *)(inited + 32) = 0x6567616D69;
  *(void *)(inited + 40) = 0xE500000000000000;
  sub_21F0C8464(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  v3 = (void *)sub_21F0C91D8();
  swift_bridgeObjectRelease();
  return (NSSet *)v3;
}

- (id)featureValueForName:(id)a3
{
  if (sub_21F0C9078() == 0x6567616D69 && v4 == 0xE500000000000000 || (sub_21F0C95D8() & 1) != 0)
  {
    uint64_t v5 = *(void *)self->image;
    v6 = self;
    swift_retain();
    id v7 = objc_msgSend(v6, sel_featureValueWithPixelBuffer_, v5);
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