@interface BlastDoorBasicEmojiTapback
- (BlastDoorBasicEmojiTapback)init;
- (BlastDoorBasicTapBack_MessageSummaryInfo)messageSummaryInfo;
- (NSArray)participantDestinationIdentifiers;
- (NSString)associatedMessageEmoji;
- (NSString)associatedMessageFallbackHash;
- (NSString)associatedMessageGUID;
- (NSString)description;
- (NSString)plainTextBody;
- (_NSRange)associatedMessageRange;
- (int64_t)associatedMessageType;
@end

@implementation BlastDoorBasicEmojiTapback

- (NSString)description
{
  long long v2 = *(_OWORD *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 104];
  v8[6] = *(_OWORD *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 88];
  v8[7] = v2;
  v8[8] = *(_OWORD *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 120];
  long long v3 = *(_OWORD *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 40];
  v8[2] = *(_OWORD *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 24];
  v8[3] = v3;
  long long v4 = *(_OWORD *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 72];
  v8[4] = *(_OWORD *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 56];
  v8[5] = v4;
  long long v5 = *(_OWORD *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 8];
  v8[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback);
  v8[1] = v5;
  uint64_t v9 = *(void *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 136];
  sub_1B14DEE44(v8);
  sub_1B196A850();
  v6 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (int64_t)associatedMessageType
{
  if (*((unsigned char *)&self->super.isa + OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback)) {
    return 3006;
  }
  else {
    return 2006;
  }
}

- (NSString)associatedMessageGUID
{
  return (NSString *)sub_1B179F944();
}

- (NSString)associatedMessageFallbackHash
{
  return (NSString *)sub_1B179F9F0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback);
}

- (_NSRange)associatedMessageRange
{
  NSUInteger v2 = sub_1B179FA74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback);
  result.length = v3;
  result.location = v2;
  return result;
}

- (NSString)associatedMessageEmoji
{
  return (NSString *)sub_1B1783120((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback);
}

- (NSArray)participantDestinationIdentifiers
{
  return (NSArray *)sub_1B1783264((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback);
}

- (BlastDoorBasicTapBack_MessageSummaryInfo)messageSummaryInfo
{
  NSUInteger v2 = (char *)self + OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback;
  uint64_t v3 = *(void *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 120];
  if (v3 == 1)
  {
    long long v4 = 0;
  }
  else
  {
    uint64_t v6 = *((void *)v2 + 14);
    uint64_t v5 = *((void *)v2 + 15);
    v7 = (objc_class *)type metadata accessor for _ObjCBasicTapBack_MessageSummaryInfoWrapper();
    v8 = (char *)objc_allocWithZone(v7);
    uint64_t v9 = &v8[OBJC_IVAR___BlastDoorBasicTapBack_MessageSummaryInfo_basicTapBack_MessageSummaryInfo];
    *uint64_t v9 = v6;
    *((void *)v9 + 1) = v5;
    *((void *)v9 + 2) = v3;
    v11.receiver = v8;
    v11.super_class = v7;
    swift_bridgeObjectRetain();
    long long v4 = [(BlastDoorBasicEmojiTapback *)&v11 init];
  }
  return (BlastDoorBasicTapBack_MessageSummaryInfo *)v4;
}

- (NSString)plainTextBody
{
  swift_bridgeObjectRetain();
  NSUInteger v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BlastDoorBasicEmojiTapback)init
{
  _NSRange result = (BlastDoorBasicEmojiTapback *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  long long v2 = *(_OWORD *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 104];
  v6[6] = *(_OWORD *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 88];
  v6[7] = v2;
  v6[8] = *(_OWORD *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 120];
  uint64_t v7 = *(void *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 136];
  long long v3 = *(_OWORD *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 40];
  v6[2] = *(_OWORD *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 24];
  v6[3] = v3;
  long long v4 = *(_OWORD *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 72];
  v6[4] = *(_OWORD *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 56];
  v6[5] = v4;
  long long v5 = *(_OWORD *)&self->basicEmojiTapback[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback + 8];
  v6[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback);
  v6[1] = v5;
  sub_1B14DEC80(v6);
}

@end