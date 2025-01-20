@interface BlastDoorEmojiTapBack
- (BlastDoorEmojiTapBack)init;
- (BlastDoorTapBack_MessageSummaryInfo)messageSummaryInfo;
- (NSArray)participantDestinationIdentifiers;
- (NSString)associatedMessageEmoji;
- (NSString)associatedMessageFallbackHash;
- (NSString)associatedMessageGUID;
- (NSString)description;
- (NSString)plainTextBody;
- (_NSRange)associatedMessageRange;
- (int64_t)associatedMessageType;
@end

@implementation BlastDoorEmojiTapBack

- (NSString)description
{
  long long v2 = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 168];
  v10[10] = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 152];
  v10[11] = v2;
  long long v3 = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 104];
  v10[6] = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 88];
  v10[7] = v3;
  long long v4 = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 136];
  v10[8] = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 120];
  v10[9] = v4;
  long long v5 = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 40];
  v10[2] = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 24];
  v10[3] = v5;
  long long v6 = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 72];
  v10[4] = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 56];
  v10[5] = v6;
  long long v7 = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 8];
  v10[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack);
  v10[1] = v7;
  uint64_t v11 = *(void *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 184];
  sub_1B14E37CC(v10);
  sub_1B196A850();
  v8 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v8;
}

- (int64_t)associatedMessageType
{
  return qword_1B19BB6C0[*((char *)&self->super.isa + OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack)];
}

- (NSString)associatedMessageGUID
{
  return (NSString *)sub_1B179F944();
}

- (NSString)associatedMessageFallbackHash
{
  return (NSString *)sub_1B179F9F0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack);
}

- (_NSRange)associatedMessageRange
{
  NSUInteger v2 = sub_1B179FA74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack);
  result.length = v3;
  result.location = v2;
  return result;
}

- (NSString)associatedMessageEmoji
{
  return (NSString *)sub_1B1783120((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack);
}

- (NSArray)participantDestinationIdentifiers
{
  return (NSArray *)sub_1B1783264((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack);
}

- (BlastDoorTapBack_MessageSummaryInfo)messageSummaryInfo
{
  NSUInteger v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack);
  uint64_t v3 = *(void *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 128];
  if (v3)
  {
    uint64_t v4 = v2[22];
    uint64_t v16 = v2[21];
    uint64_t v6 = v2[19];
    uint64_t v5 = v2[20];
    uint64_t v7 = v2[18];
    uint64_t v9 = v2[15];
    uint64_t v8 = v2[16];
    uint64_t v10 = v2[14];
    uint64_t v11 = (objc_class *)type metadata accessor for _ObjCTapBack_MessageSummaryInfoWrapper();
    v12 = (char *)objc_allocWithZone(v11);
    v13 = &v12[OBJC_IVAR___BlastDoorTapBack_MessageSummaryInfo_tapBack_MessageSummaryInfo];
    char *v13 = v10;
    *((void *)v13 + 1) = v9;
    *((void *)v13 + 2) = v8;
    *((void *)v13 + 3) = v3;
    *((void *)v13 + 4) = v7;
    *((void *)v13 + 5) = v6;
    *((void *)v13 + 6) = v5;
    *((void *)v13 + 7) = v16;
    *((void *)v13 + 8) = v4;
    swift_bridgeObjectRetain();
    swift_retain();
    sub_1B11E7664(v6, v5);
    v17.receiver = v12;
    v17.super_class = v11;
    swift_bridgeObjectRetain();
    v14 = [(BlastDoorEmojiTapBack *)&v17 init];
  }
  else
  {
    v14 = 0;
  }
  return (BlastDoorTapBack_MessageSummaryInfo *)v14;
}

- (NSString)plainTextBody
{
  swift_bridgeObjectRetain();
  NSUInteger v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BlastDoorEmojiTapBack)init
{
  _NSRange result = (BlastDoorEmojiTapBack *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  long long v2 = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 168];
  v8[10] = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 152];
  v8[11] = v2;
  uint64_t v9 = *(void *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 184];
  long long v3 = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 104];
  v8[6] = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 88];
  v8[7] = v3;
  long long v4 = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 136];
  v8[8] = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 120];
  v8[9] = v4;
  long long v5 = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 40];
  v8[2] = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 24];
  v8[3] = v5;
  long long v6 = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 72];
  v8[4] = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 56];
  v8[5] = v6;
  long long v7 = *(_OWORD *)&self->emojiTapBack[OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack + 8];
  v8[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorEmojiTapBack_emojiTapBack);
  v8[1] = v7;
  sub_1B14E3598(v8);
}

@end