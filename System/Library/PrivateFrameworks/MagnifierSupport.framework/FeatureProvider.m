@interface FeatureProvider
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation FeatureProvider

- (NSSet)featureNames
{
  sub_235677450((uint64_t)&unk_26E8BF368);
  swift_arrayDestroy();
  v2 = (void *)sub_235949FD8();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  if (sub_235949AC8() == 0x6567616D69 && v4 == 0xE500000000000000 || (sub_23594AB78() & 1) != 0)
  {
    id v5 = 0;
  }
  else
  {
    uint64_t v6 = *(void *)self->image;
    v7 = self;
    sub_2359470F8();
    id v5 = objc_msgSend(v7, sel_featureValueWithPixelBuffer_, v6);
    swift_release();
  }
  swift_bridgeObjectRelease();
  return v5;
}

@end