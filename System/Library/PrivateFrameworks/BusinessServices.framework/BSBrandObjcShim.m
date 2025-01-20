@interface BSBrandObjcShim
+ (NSString)placeholderName;
+ (id)mockBrand;
- (BOOL)isRCSChatBot;
- (BOOL)isVerified;
- (BSBrandObjcShim)init;
- (NSArray)categories;
- (NSData)logoFingerprint;
- (NSString)address;
- (NSString)brandURI;
- (NSString)emailAddress;
- (NSString)localizedDescription;
- (NSString)localizedResponseTime;
- (NSString)messageNumber;
- (NSString)name;
- (NSString)primaryBrandColorHexString;
- (NSString)primaryPhoneNumber;
- (NSString)secondaryBrandColorHexString;
- (NSString)verifiedBy;
- (NSURL)genericCSSTemplateURL;
- (NSURL)termsAndConditionsURL;
- (NSURL)website;
- (void)assetDataOfType:(int64_t)a3 usingSim:(id)a4 completion:(id)a5;
- (void)clearCachedAssets:(id)a3;
- (void)logoDataOfType:(int64_t)a3 desiredSize:(CGSize)a4 completion:(id)a5;
- (void)logoDataOfType:(int64_t)a3 desiredSize:(CGSize)a4 usingSim:(id)a5 completion:(id)a6;
- (void)logoFileURLOfType:(int64_t)a3 desiredSize:(CGSize)a4 completionHandler:(id)a5;
- (void)squareLogoDataForDesiredSize:(CGSize)a3 completion:(id)a4;
- (void)wideLogoDataForDesiredSize:(CGSize)a3 completion:(id)a4;
@end

@implementation BSBrandObjcShim

- (NSString)brandURI
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  uint64_t v4 = v3[5];
  uint64_t v5 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v4);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 32);
  v7 = self;
  v6(v4, v5);

  v8 = (void *)sub_229167510();
  swift_bridgeObjectRelease();
  return (NSString *)v8;
}

- (BOOL)isRCSChatBot
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  id v4 = objc_allocWithZone((Class)IMSharedUtilitiesSoftLinkingWrapper);
  uint64_t v5 = self;
  id v6 = objc_msgSend(v4, sel_init);
  v7 = v3 + 2;
  uint64_t v8 = v3[5];
  uint64_t v9 = v3[6];
  __swift_project_boxed_opaque_existential_1(v7, v8);
  (*(void (**)(uint64_t, uint64_t))(v9 + 32))(v8, v9);
  v10 = (void *)sub_229167510();
  swift_bridgeObjectRelease();
  LOBYTE(v4) = objc_msgSend(v6, sel_isRCSChatBot_, v10);

  return (char)v4;
}

- (NSString)name
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  uint64_t v4 = v3[5];
  uint64_t v5 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v4);
  id v6 = *(void (**)(uint64_t, uint64_t))(v5 + 40);
  v7 = self;
  v6(v4, v5);

  uint64_t v8 = (void *)sub_229167510();
  swift_bridgeObjectRelease();
  return (NSString *)v8;
}

- (NSArray)categories
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  uint64_t v4 = v3[5];
  uint64_t v5 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v4);
  id v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 48);
  v7 = self;
  uint64_t v8 = v6(v4, v5);

  if (v8)
  {
    uint64_t v9 = (void *)sub_2291675B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = 0;
  }
  return (NSArray *)v9;
}

- (NSString)primaryPhoneNumber
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  uint64_t v4 = v3[5];
  uint64_t v5 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v4);
  id v6 = *(void (**)(uint64_t, uint64_t))(v5 + 64);
  v7 = self;
  v6(v4, v5);
  uint64_t v9 = v8;

  if (v9)
  {
    v10 = (void *)sub_229167510();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return (NSString *)v10;
}

- (NSString)primaryBrandColorHexString
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  uint64_t v4 = v3[5];
  uint64_t v5 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v4);
  id v6 = *(void (**)(uint64_t, uint64_t))(v5 + 72);
  v7 = self;
  v6(v4, v5);
  uint64_t v9 = v8;

  if (v9)
  {
    v10 = (void *)sub_229167510();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return (NSString *)v10;
}

- (NSString)secondaryBrandColorHexString
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  uint64_t v4 = v3[5];
  uint64_t v5 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v4);
  id v6 = *(void (**)(uint64_t, uint64_t))(v5 + 80);
  v7 = self;
  v6(v4, v5);
  uint64_t v9 = v8;

  if (v9)
  {
    v10 = (void *)sub_229167510();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return (NSString *)v10;
}

- (BOOL)isVerified
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  uint64_t v4 = v3[5];
  uint64_t v5 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v4);
  id v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 88);
  v7 = self;
  char v8 = v6(v4, v5);

  return v8 & 1;
}

- (NSString)verifiedBy
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  uint64_t v4 = v3[5];
  uint64_t v5 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v4);
  id v6 = *(void (**)(uint64_t, uint64_t))(v5 + 96);
  v7 = self;
  v6(v4, v5);
  uint64_t v9 = v8;

  if (v9)
  {
    v10 = (void *)sub_229167510();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return (NSString *)v10;
}

- (NSURL)website
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682C5FE8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  uint64_t v7 = v6[5];
  uint64_t v8 = v6[6];
  __swift_project_boxed_opaque_existential_1(v6 + 2, v7);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v8 + 104);
  v10 = self;
  v9(v7, v8);

  uint64_t v11 = sub_2291673E0();
  uint64_t v12 = *(void *)(v11 - 8);
  v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v5, 1, v11) != 1)
  {
    v13 = (void *)sub_2291673A0();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v5, v11);
  }
  return (NSURL *)v13;
}

- (NSString)messageNumber
{
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  uint64_t v4 = v3[5];
  uint64_t v5 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v4);
  id v6 = *(void (**)(uint64_t, uint64_t))(v5 + 112);
  uint64_t v7 = self;
  v6(v4, v5);
  uint64_t v9 = v8;

  if (v9)
  {
    v10 = (void *)sub_229167510();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return (NSString *)v10;
}

- (NSString)emailAddress
{
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  uint64_t v4 = v3[5];
  uint64_t v5 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v4);
  id v6 = *(void (**)(uint64_t, uint64_t))(v5 + 120);
  uint64_t v7 = self;
  v6(v4, v5);
  uint64_t v9 = v8;

  if (v9)
  {
    v10 = (void *)sub_229167510();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return (NSString *)v10;
}

- (NSString)address
{
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  uint64_t v4 = v3[5];
  uint64_t v5 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v4);
  id v6 = *(void (**)(uint64_t, uint64_t))(v5 + 128);
  uint64_t v7 = self;
  v6(v4, v5);
  uint64_t v9 = v8;

  if (v9)
  {
    v10 = (void *)sub_229167510();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return (NSString *)v10;
}

- (NSURL)termsAndConditionsURL
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682C5FE8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  uint64_t v7 = v6[5];
  uint64_t v8 = v6[6];
  __swift_project_boxed_opaque_existential_1(v6 + 2, v7);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v8 + 136);
  v10 = self;
  v9(v7, v8);

  uint64_t v11 = sub_2291673E0();
  uint64_t v12 = *(void *)(v11 - 8);
  v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v5, 1, v11) != 1)
  {
    v13 = (void *)sub_2291673A0();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v5, v11);
  }
  return (NSURL *)v13;
}

- (NSURL)genericCSSTemplateURL
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682C5FE8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  uint64_t v7 = v6[5];
  uint64_t v8 = v6[6];
  __swift_project_boxed_opaque_existential_1(v6 + 2, v7);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v8 + 144);
  v10 = self;
  v9(v7, v8);

  uint64_t v11 = sub_2291673E0();
  uint64_t v12 = *(void *)(v11 - 8);
  v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v5, 1, v11) != 1)
  {
    v13 = (void *)sub_2291673A0();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v5, v11);
  }
  return (NSURL *)v13;
}

- (NSString)localizedDescription
{
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  uint64_t v4 = v3[5];
  uint64_t v5 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v4);
  id v6 = *(void (**)(uint64_t, uint64_t))(v5 + 56);
  uint64_t v7 = self;
  v6(v4, v5);
  uint64_t v9 = v8;

  if (v9)
  {
    v10 = (void *)sub_229167510();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return (NSString *)v10;
}

- (NSString)localizedResponseTime
{
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  uint64_t v4 = v3[5];
  uint64_t v5 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v4);
  id v6 = *(void (**)(uint64_t, uint64_t))(v5 + 152);
  uint64_t v7 = self;
  v6(v4, v5);
  uint64_t v9 = v8;

  if (v9)
  {
    v10 = (void *)sub_229167510();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return (NSString *)v10;
}

- (NSData)logoFingerprint
{
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  uint64_t v4 = v3[5];
  uint64_t v5 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v4);
  id v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 160);
  uint64_t v7 = self;
  uint64_t v8 = v6(v4, v5);
  unint64_t v10 = v9;

  if (v10 >> 60 == 15)
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = (void *)sub_2291673F0();
    sub_229144D3C(v8, v10);
  }
  return (NSData *)v11;
}

- (void)squareLogoDataForDesiredSize:(CGSize)a3 completion:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v7 = _Block_copy(a4);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  unint64_t v9 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  unint64_t v10 = self;
  sub_2291643A0(v9, (void (*)(void, unint64_t, void *))sub_229160074, v8, width, height);

  swift_release();
}

- (void)wideLogoDataForDesiredSize:(CGSize)a3 completion:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v7 = _Block_copy(a4);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  unint64_t v9 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  unint64_t v10 = self;
  sub_2291649A8(v9, (void (*)(void, unint64_t, void *))sub_229160074, v8, width, height);

  swift_release();
}

- (void)logoFileURLOfType:(int64_t)a3 desiredSize:(CGSize)a4 completionHandler:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682C6458);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  v14 = (CGFloat *)swift_allocObject();
  *((void *)v14 + 2) = a3;
  v14[3] = width;
  v14[4] = height;
  *((void *)v14 + 5) = v13;
  *((void *)v14 + 6) = self;
  uint64_t v15 = sub_2291675F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2682C6468;
  v16[5] = v14;
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_2682C6478;
  v17[5] = v16;
  v18 = self;
  sub_22915EB90((uint64_t)v12, (uint64_t)&unk_2682C6488, (uint64_t)v17);
  swift_release();
}

- (void)logoDataOfType:(int64_t)a3 desiredSize:(CGSize)a4 completion:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  unint64_t v9 = _Block_copy(a5);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  uint64_t v11 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  uint64_t v12 = self;
  sub_229164FB0(a3, 0, 0, v11, (void (*)(void, unint64_t, void *))sub_229160074, v10, width, height);

  swift_release();
}

- (void)logoDataOfType:(int64_t)a3 desiredSize:(CGSize)a4 usingSim:(id)a5 completion:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v11 = _Block_copy(a6);
  if (a5)
  {
    uint64_t v12 = sub_229167520();
    a5 = v13;
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v11;
  uint64_t v15 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  v16 = self;
  sub_229164FB0(a3, v12, (uint64_t)a5, v15, (void (*)(void, unint64_t, void *))sub_229160074, v14, width, height);

  swift_release();
  swift_bridgeObjectRelease();
}

- (void)assetDataOfType:(int64_t)a3 usingSim:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  if (a4)
  {
    uint64_t v9 = sub_229167520();
    a4 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v8;
  uint64_t v12 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  v13 = self;
  sub_2291656F8(a3, v9, (uint64_t)a4, v12, (void (*)(void, unint64_t, void *))sub_229154ACC, v11);

  swift_release();
  swift_bridgeObjectRelease();
}

- (void)clearCachedAssets:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_22915F9FC;
  *(void *)(v6 + 24) = v5;
  uint64_t v7 = self;
  swift_retain();
  sub_22916342C();

  swift_release();
  swift_release();
}

+ (id)mockBrand
{
  id v2 = _s16BusinessServices13BrandObjcShimC04mockC0ACyFZ_0();
  return v2;
}

- (BSBrandObjcShim)init
{
  result = (BSBrandObjcShim *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

+ (NSString)placeholderName
{
  if (qword_2682C5FC0 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  id v2 = (void *)sub_229167510();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

@end