@interface BlastDoorAttributionInfo
- (BOOL)has_adamID;
- (BOOL)has_previewGenerationSizeHeight;
- (BOOL)has_previewGenerationSizeWidth;
- (BlastDoorAttributionInfo)init;
- (BlastDoorAttributionInfo_PreviewGenerationConstraints)previewGenerationConstraints;
- (NSString)accessibilityStickerName;
- (NSString)bundleID;
- (NSString)description;
- (NSString)packName;
- (double)previewGenerationSizeHeight;
- (double)previewGenerationSizeWidth;
- (unint64_t)adamID;
@end

@implementation BlastDoorAttributionInfo

- (NSString)description
{
  long long v2 = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 136];
  v9[8] = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 120];
  v10[0] = v2;
  *(_OWORD *)((char *)v10 + 10) = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo
                                                                  + 146];
  long long v3 = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 72];
  v9[4] = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 56];
  v9[5] = v3;
  long long v4 = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 104];
  v9[6] = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 88];
  v9[7] = v4;
  long long v5 = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 8];
  v9[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo);
  v9[1] = v5;
  long long v6 = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 40];
  v9[2] = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 24];
  v9[3] = v6;
  sub_1B17B27F8((uint64_t)v9);
  sub_1B196A850();
  v7 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (BOOL)has_adamID
{
  return (self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo] & 1) == 0;
}

- (unint64_t)adamID
{
  if (self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo]) {
    return 0;
  }
  else {
    return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo);
  }
}

- (NSString)accessibilityStickerName
{
  return (NSString *)sub_1B17AD14C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo);
}

- (NSString)bundleID
{
  uint64_t v2 = *(void *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 48];
  if (v2)
  {
    if (v2 == 1)
    {
      result = (NSString *)sub_1B196B120();
      __break(1u);
      return result;
    }
    uint64_t v4 = *(void *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 40];
    swift_bridgeObjectRetain();
    long long v3 = (void *)sub_1B196A7E0();
    sub_1B11E7748(v4, v2);
  }
  else
  {
    long long v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)packName
{
  return (NSString *)sub_1B178E8A4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo);
}

- (BOOL)has_previewGenerationSizeHeight
{
  return (self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 80] & 1) == 0;
}

- (double)previewGenerationSizeHeight
{
  double result = *(double *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 72];
  if (self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 80]) {
    return 0.0;
  }
  return result;
}

- (BOOL)has_previewGenerationSizeWidth
{
  return (self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 96] & 1) == 0;
}

- (double)previewGenerationSizeWidth
{
  double result = *(double *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 88];
  if (self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 96]) {
    return 0.0;
  }
  return result;
}

- (BlastDoorAttributionInfo_PreviewGenerationConstraints)previewGenerationConstraints
{
  uint64_t v2 = (char *)self + OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo;
  __int16 v3 = *(_WORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 160];
  if ((v3 & 0xFF00) == 0x200)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v5 = *((void *)v2 + 20);
    int v6 = *((_DWORD *)v2 + 38);
    uint64_t v7 = *((void *)v2 + 18);
    int v8 = *((_DWORD *)v2 + 34);
    uint64_t v9 = *((void *)v2 + 16);
    int v10 = *((_DWORD *)v2 + 30);
    uint64_t v11 = *((void *)v2 + 14);
    v12 = (objc_class *)type metadata accessor for _ObjCAttributionInfo_PreviewGenerationConstraintsWrapper();
    v13 = (char *)objc_allocWithZone(v12);
    v14 = &v13[OBJC_IVAR___BlastDoorAttributionInfo_PreviewGenerationConstraints_attributionInfo_PreviewGenerationConstraints];
    *(void *)v14 = v11;
    v14[8] = v10 & 1;
    *((void *)v14 + 2) = v9;
    v14[24] = v8 & 1;
    *((void *)v14 + 4) = v7;
    v14[40] = v6 & 1;
    *((void *)v14 + 6) = v5;
    v14[56] = v3 & 1;
    v14[57] = HIBYTE(v3) & 1;
    v16.receiver = v13;
    v16.super_class = v12;
    uint64_t v4 = [(BlastDoorAttributionInfo *)&v16 init];
  }
  return (BlastDoorAttributionInfo_PreviewGenerationConstraints *)v4;
}

- (BlastDoorAttributionInfo)init
{
  double result = (BlastDoorAttributionInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  long long v2 = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 136];
  v7[8] = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 120];
  v8[0] = v2;
  *(_OWORD *)((char *)v8 + 10) = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo
                                                                 + 146];
  long long v3 = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 72];
  v7[4] = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 56];
  v7[5] = v3;
  long long v4 = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 104];
  v7[6] = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 88];
  v7[7] = v4;
  long long v5 = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 8];
  v7[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo);
  v7[1] = v5;
  long long v6 = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 40];
  v7[2] = *(_OWORD *)&self->attributionInfo[OBJC_IVAR___BlastDoorAttributionInfo_attributionInfo + 24];
  v7[3] = v6;
  sub_1B14DE308((uint64_t)v7);
}

@end