@interface BlastDoorEmojiImageAttachmentInfo
- (BlastDoorEmojiImageAttachmentInfo)init;
- (NSString)description;
- (NSString)emojiImageContentIdentifer;
- (NSString)emojiImageShortDescription;
- (NSString)stickerBalloonBundleID;
- (NSString)stickerExternalURI;
- (NSString)stickerHash;
- (NSString)stickerIdentifier;
- (NSString)stickerPackIdentifier;
@end

@implementation BlastDoorEmojiImageAttachmentInfo

- (NSString)description
{
  long long v2 = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                + 168];
  v11[10] = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                     + 152];
  v11[11] = v2;
  long long v3 = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                + 200];
  v11[12] = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                     + 184];
  v11[13] = v3;
  long long v4 = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                + 104];
  v11[6] = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                    + 88];
  v11[7] = v4;
  long long v5 = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                + 136];
  v11[8] = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                    + 120];
  v11[9] = v5;
  long long v6 = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                + 40];
  v11[2] = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                    + 24];
  v11[3] = v6;
  long long v7 = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                + 72];
  v11[4] = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                    + 56];
  v11[5] = v7;
  long long v8 = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                + 8];
  v11[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo);
  v11[1] = v8;
  sub_1B14DCD38(v11);
  sub_1B196A850();
  v9 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v9;
}

- (NSString)emojiImageContentIdentifer
{
  return (NSString *)sub_1B1798A20((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo);
}

- (NSString)emojiImageShortDescription
{
  return (NSString *)sub_1B17969C4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo);
}

- (NSString)stickerIdentifier
{
  return (NSString *)sub_1B1778E0C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo);
}

- (NSString)stickerPackIdentifier
{
  if (*(void *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                + 112])
  {
    swift_bridgeObjectRetain();
    long long v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
    return (NSString *)v2;
  }
  else
  {
    result = (NSString *)sub_1B196B120();
    __break(1u);
  }
  return result;
}

- (NSString)stickerHash
{
  if (*(void *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                + 144])
  {
    swift_bridgeObjectRetain();
    long long v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
    return (NSString *)v2;
  }
  else
  {
    result = (NSString *)sub_1B196B120();
    __break(1u);
  }
  return result;
}

- (NSString)stickerExternalURI
{
  uint64_t v2 = *(void *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                + 176];
  if (v2)
  {
    if (v2 == 1)
    {
      result = (NSString *)sub_1B196B120();
      __break(1u);
      return result;
    }
    uint64_t v4 = *(void *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                  + 168];
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

- (NSString)stickerBalloonBundleID
{
  uint64_t v2 = *(void *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                + 208];
  if (v2)
  {
    if (v2 == 1)
    {
      result = (NSString *)sub_1B196B120();
      __break(1u);
      return result;
    }
    uint64_t v4 = *(void *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                  + 200];
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

- (BlastDoorEmojiImageAttachmentInfo)init
{
  result = (BlastDoorEmojiImageAttachmentInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  long long v2 = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                + 168];
  v9[10] = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                    + 152];
  v9[11] = v2;
  long long v3 = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                + 200];
  v9[12] = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                    + 184];
  v9[13] = v3;
  long long v4 = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                + 104];
  v9[6] = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                   + 88];
  v9[7] = v4;
  long long v5 = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                + 136];
  v9[8] = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                   + 120];
  v9[9] = v5;
  long long v6 = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                + 40];
  v9[2] = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                   + 24];
  v9[3] = v6;
  long long v7 = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                + 72];
  v9[4] = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                   + 56];
  v9[5] = v7;
  long long v8 = *(_OWORD *)&self->emojiImageAttachmentInfo[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo
                                                + 8];
  v9[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo);
  v9[1] = v8;
  sub_1B14DCBE0(v9);
}

@end