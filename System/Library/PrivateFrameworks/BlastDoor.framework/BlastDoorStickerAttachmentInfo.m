@interface BlastDoorStickerAttachmentInfo
- (BOOL)has_associatedPositionIntent;
- (BOOL)has_parentPreviewWidth;
- (BOOL)has_positionIntent;
- (BOOL)has_stickerOffset;
- (BOOL)has_stickerPositionVersion;
- (BOOL)has_stickerRotation;
- (BOOL)has_stickerScale;
- (BOOL)isReaction;
- (BlastDoorStickerAttachmentInfo)init;
- (CGPoint)stickerOffset;
- (NSString)balloonBundleID;
- (NSString)description;
- (NSString)stickerExternalURI;
- (NSString)stickerHash;
- (NSString)stickerIdentifier;
- (NSString)stickerPackIdentifier;
- (double)parentPreviewWidth;
- (double)stickerRotation;
- (double)stickerScale;
- (unint64_t)associatedPositionIntent;
- (unint64_t)positionIntent;
- (unint64_t)stickerPositionVersion;
@end

@implementation BlastDoorStickerAttachmentInfo

- (NSString)description
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo;
  memcpy(__dst, (char *)self + OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo, 0x111uLL);
  memcpy(v5, v2, sizeof(v5));
  sub_1B14DCFF8(__dst);
  sub_1B196A850();
  v3 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)stickerIdentifier
{
  return (NSString *)sub_1B1798A20((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo);
}

- (NSString)stickerPackIdentifier
{
  return (NSString *)sub_1B17969C4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo);
}

- (NSString)stickerHash
{
  return (NSString *)sub_1B1778E0C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo);
}

- (NSString)stickerExternalURI
{
  uint64_t v2 = *(void *)&self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 112];
  if (v2)
  {
    if (v2 == 1)
    {
      result = (NSString *)sub_1B196B120();
      __break(1u);
      return result;
    }
    uint64_t v4 = *(void *)&self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 104];
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1B196A7E0();
    sub_1B11E7748(v4, v2);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)balloonBundleID
{
  uint64_t v2 = *(void *)&self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 144];
  if (v2)
  {
    if (v2 == 1)
    {
      result = (NSString *)sub_1B196B120();
      __break(1u);
      return result;
    }
    uint64_t v4 = *(void *)&self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 136];
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1B196A7E0();
    sub_1B11E7748(v4, v2);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)has_positionIntent
{
  return (self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 160] & 1) == 0;
}

- (unint64_t)positionIntent
{
  if (self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 160]) {
    return 0;
  }
  else {
    return *(void *)&self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo
  }
                                                 + 152];
}

- (BOOL)has_associatedPositionIntent
{
  return (self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 176] & 1) == 0;
}

- (unint64_t)associatedPositionIntent
{
  if (self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 176]) {
    return 0;
  }
  else {
    return *(void *)&self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo
  }
                                                 + 168];
}

- (BOOL)has_parentPreviewWidth
{
  return (self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 192] & 1) == 0;
}

- (double)parentPreviewWidth
{
  double result = *(double *)&self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo
                                                 + 184];
  if (self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 192]) {
    return 0.0;
  }
  return result;
}

- (BOOL)has_stickerOffset
{
  return (self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 216] & 1) == 0;
}

- (CGPoint)stickerOffset
{
  uint64_t v2 = (double *)((char *)self + OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo);
  double v3 = 0.0;
  double v4 = 0.0;
  if ((self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 216] & 1) == 0)
  {
    double v4 = v2[26];
    double v3 = v2[27];
  }
  result.y = v3;
  result.x = v4;
  return result;
}

- (BOOL)has_stickerScale
{
  return (self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 232] & 1) == 0;
}

- (double)stickerScale
{
  double result = *(double *)&self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo
                                                 + 224];
  if (self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 232]) {
    return 0.0;
  }
  return result;
}

- (BOOL)has_stickerRotation
{
  return (self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 248] & 1) == 0;
}

- (double)stickerRotation
{
  double result = *(double *)&self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo
                                                 + 240];
  if (self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 248]) {
    return 0.0;
  }
  return result;
}

- (BOOL)isReaction
{
  return self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 249];
}

- (BOOL)has_stickerPositionVersion
{
  return (self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 264] & 1) == 0;
}

- (unint64_t)stickerPositionVersion
{
  if (self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 264]) {
    return 0;
  }
  else {
    return *(void *)&self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo
  }
                                                 + 256];
}

- (BlastDoorStickerAttachmentInfo)init
{
  double result = (BlastDoorStickerAttachmentInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  memcpy(__dst, (char *)self + OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo, 0x111uLL);
  sub_1B14DCE38(__dst);
}

@end