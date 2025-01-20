@interface BlastDoorAttributionInfo_PreviewGenerationConstraints
- (BOOL)has_maxPixelWidth;
- (BOOL)has_minThumbSizeHeight;
- (BOOL)has_minThumbSizeWidth;
- (BOOL)has_scale;
- (BOOL)isSticker;
- (BlastDoorAttributionInfo_PreviewGenerationConstraints)init;
- (NSString)description;
- (double)maxPixelWidth;
- (double)minThumbSizeHeight;
- (double)minThumbSizeWidth;
- (double)scale;
@end

@implementation BlastDoorAttributionInfo_PreviewGenerationConstraints

- (NSString)description
{
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)has_maxPixelWidth
{
  return (self->attributionInfo_PreviewGenerationConstraints[OBJC_IVAR___BlastDoorAttributionInfo_PreviewGenerationConstraints_attributionInfo_PreviewGenerationConstraints] & 1) == 0;
}

- (double)maxPixelWidth
{
  double result = *(double *)((char *)&self->super.isa
                     + OBJC_IVAR___BlastDoorAttributionInfo_PreviewGenerationConstraints_attributionInfo_PreviewGenerationConstraints);
  if (self->attributionInfo_PreviewGenerationConstraints[OBJC_IVAR___BlastDoorAttributionInfo_PreviewGenerationConstraints_attributionInfo_PreviewGenerationConstraints]) {
    return 0.0;
  }
  return result;
}

- (BOOL)has_minThumbSizeHeight
{
  return (self->attributionInfo_PreviewGenerationConstraints[OBJC_IVAR___BlastDoorAttributionInfo_PreviewGenerationConstraints_attributionInfo_PreviewGenerationConstraints
                                                           + 16] & 1) == 0;
}

- (double)minThumbSizeHeight
{
  double result = *(double *)&self->attributionInfo_PreviewGenerationConstraints[OBJC_IVAR___BlastDoorAttributionInfo_PreviewGenerationConstraints_attributionInfo_PreviewGenerationConstraints
                                                                        + 8];
  if (self->attributionInfo_PreviewGenerationConstraints[OBJC_IVAR___BlastDoorAttributionInfo_PreviewGenerationConstraints_attributionInfo_PreviewGenerationConstraints
                                                        + 16])
    return 0.0;
  return result;
}

- (BOOL)has_minThumbSizeWidth
{
  return (self->attributionInfo_PreviewGenerationConstraints[OBJC_IVAR___BlastDoorAttributionInfo_PreviewGenerationConstraints_attributionInfo_PreviewGenerationConstraints
                                                           + 32] & 1) == 0;
}

- (double)minThumbSizeWidth
{
  double result = *(double *)&self->attributionInfo_PreviewGenerationConstraints[OBJC_IVAR___BlastDoorAttributionInfo_PreviewGenerationConstraints_attributionInfo_PreviewGenerationConstraints
                                                                        + 24];
  if (self->attributionInfo_PreviewGenerationConstraints[OBJC_IVAR___BlastDoorAttributionInfo_PreviewGenerationConstraints_attributionInfo_PreviewGenerationConstraints
                                                        + 32])
    return 0.0;
  return result;
}

- (BOOL)has_scale
{
  return (self->attributionInfo_PreviewGenerationConstraints[OBJC_IVAR___BlastDoorAttributionInfo_PreviewGenerationConstraints_attributionInfo_PreviewGenerationConstraints
                                                           + 48] & 1) == 0;
}

- (double)scale
{
  double result = *(double *)&self->attributionInfo_PreviewGenerationConstraints[OBJC_IVAR___BlastDoorAttributionInfo_PreviewGenerationConstraints_attributionInfo_PreviewGenerationConstraints
                                                                        + 40];
  if (self->attributionInfo_PreviewGenerationConstraints[OBJC_IVAR___BlastDoorAttributionInfo_PreviewGenerationConstraints_attributionInfo_PreviewGenerationConstraints
                                                        + 48])
    return 0.0;
  return result;
}

- (BOOL)isSticker
{
  return self->attributionInfo_PreviewGenerationConstraints[OBJC_IVAR___BlastDoorAttributionInfo_PreviewGenerationConstraints_attributionInfo_PreviewGenerationConstraints
                                                          + 49];
}

- (BlastDoorAttributionInfo_PreviewGenerationConstraints)init
{
  double result = (BlastDoorAttributionInfo_PreviewGenerationConstraints *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end