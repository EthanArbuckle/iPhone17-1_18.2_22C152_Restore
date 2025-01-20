@interface NTKParmesanAssetLayout
- (BOOL)isEqual:(id)a3;
- (BOOL)linkFromSrcDirectory:(id)a3 toDstDirectory:(id)a4;
- (BOOL)userEdited;
- (NSString)baseImageName;
- (NSString)description;
- (NSString)uniqueSnapshotIdentifier;
- (NTKParmesanAssetColorAnalysis)colorAnalysis;
- (NTKParmesanAssetLayout)init;
- (NTKParmesanAssetLayout)initWithOriginalCrop:(id)a3 baseImageName:(id)a4 mask:(id)a5 timeLayout:(id)a6 colorAnalysis:(id)a7 imageAOTBrightness:(double)a8 userEdited:(BOOL)a9;
- (NTKParmesanAssetMask)mask;
- (NTKParmesanCrop)originalCrop;
- (NTKParmesanTimeLayout)timeLayout;
- (double)imageAOTBrightness;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (void)setBaseImageName:(id)a3;
- (void)setColorAnalysis:(id)a3;
- (void)setImageAOTBrightness:(double)a3;
- (void)setMask:(id)a3;
- (void)setOriginalCrop:(id)a3;
- (void)setTimeLayout:(id)a3;
- (void)setUserEdited:(BOOL)a3;
@end

@implementation NTKParmesanAssetLayout

- (NTKParmesanCrop)originalCrop
{
  return (NTKParmesanCrop *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                    + OBJC_IVAR___NTKParmesanAssetLayout_originalCrop));
}

- (void)setOriginalCrop:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanAssetLayout_originalCrop);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanAssetLayout_originalCrop) = (Class)a3;
  id v3 = a3;
}

- (NSString)baseImageName
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setBaseImageName:(id)a3
{
  uint64_t v4 = sub_246C2CC48();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___NTKParmesanAssetLayout_baseImageName);
  uint64_t *v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

- (NTKParmesanAssetMask)mask
{
  return (NTKParmesanAssetMask *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                         + OBJC_IVAR___NTKParmesanAssetLayout_mask));
}

- (void)setMask:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanAssetLayout_mask);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanAssetLayout_mask) = (Class)a3;
  id v3 = a3;
}

- (NTKParmesanTimeLayout)timeLayout
{
  return (NTKParmesanTimeLayout *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR___NTKParmesanAssetLayout_timeLayout));
}

- (void)setTimeLayout:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanAssetLayout_timeLayout);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanAssetLayout_timeLayout) = (Class)a3;
  id v3 = a3;
}

- (NTKParmesanAssetColorAnalysis)colorAnalysis
{
  return (NTKParmesanAssetColorAnalysis *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                  + OBJC_IVAR___NTKParmesanAssetLayout_colorAnalysis));
}

- (void)setColorAnalysis:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanAssetLayout_colorAnalysis);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanAssetLayout_colorAnalysis) = (Class)a3;
  id v3 = a3;
}

- (double)imageAOTBrightness
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanAssetLayout_imageAOTBrightness);
}

- (void)setImageAOTBrightness:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanAssetLayout_imageAOTBrightness) = a3;
}

- (BOOL)userEdited
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___NTKParmesanAssetLayout_userEdited);
}

- (void)setUserEdited:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___NTKParmesanAssetLayout_userEdited) = a3;
}

- (NTKParmesanAssetLayout)initWithOriginalCrop:(id)a3 baseImageName:(id)a4 mask:(id)a5 timeLayout:(id)a6 colorAnalysis:(id)a7 imageAOTBrightness:(double)a8 userEdited:(BOOL)a9
{
  uint64_t v15 = sub_246C2CC48();
  uint64_t v17 = v16;
  id v18 = a3;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  v22 = (NTKParmesanAssetLayout *)sub_246BEB9F0(v18, v15, v17, a5, v20, a7, a9, a8);

  return v22;
}

- (NSString)description
{
  return (NSString *)sub_246BEB0B4(self, (uint64_t)a2, (void (*)(void))sub_246BE9AFC);
}

- (NTKParmesanAssetLayout)init
{
  result = (NTKParmesanAssetLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanAssetLayout_colorAnalysis);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_246C2D1F8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v5 = self;
  }
  sub_246BB367C((uint64_t)v11, (uint64_t)v9);
  if (!v10)
  {
    sub_246B8EA34((uint64_t)v9, &qword_2691D69A0);
    goto LABEL_8;
  }
  type metadata accessor for ParmesanAssetLayout();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:

    char v6 = 0;
    goto LABEL_9;
  }
  char v6 = sub_246BEBBB0((uint64_t)self, (uint64_t)v8);

LABEL_9:
  sub_246B8EA34((uint64_t)v11, &qword_2691D69A0);
  return v6 & 1;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_246BEAD8C();

  return v3;
}

- (id)copyWithZone:(void *)a3
{
  int64_t v3 = self;
  sub_246BEAF0C(v6);

  sub_246B8F7E8(v6, v6[3]);
  id v4 = (void *)sub_246C2D558();
  sub_246B8EB94((uint64_t)v6);
  return v4;
}

- (NSString)uniqueSnapshotIdentifier
{
  return (NSString *)sub_246BEB0B4(self, (uint64_t)a2, (void (*)(void))sub_246BEB124);
}

- (BOOL)linkFromSrcDirectory:(id)a3 toDstDirectory:(id)a4
{
  uint64_t v5 = sub_246C2CC48();
  v7 = v6;
  uint64_t v8 = sub_246C2CC48();
  uint64_t v10 = v9;
  v11 = self;
  LOBYTE(v8) = sub_246BEB358(v5, v7, v8, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

@end