@interface PADFacePoseModelInput
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation PADFacePoseModelInput

- (NSSet)featureNames
{
  sub_21F0C8464((uint64_t)&unk_26D0A5DB0);
  swift_arrayDestroy();
  v2 = (void *)sub_21F0C91D8();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  if (sub_21F0C9078() == 0xD000000000000011 && v4 == 0x800000021F0CE380 || (sub_21F0C95D8() & 1) != 0)
  {
    uint64_t v5 = *(void *)self->image_Placeholder;
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