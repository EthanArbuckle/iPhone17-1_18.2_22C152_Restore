@interface BlastDoorSticker
- (BOOL)has_associatedMessageRange;
- (BlastDoorMessage)messageContent;
- (BlastDoorSticker)init;
- (NSArray)participantDestinationIdentifiers;
- (NSString)associatedMessageFallbackHash;
- (NSString)associatedMessageGUID;
- (NSString)description;
- (_NSRange)associatedMessageRange;
@end

@implementation BlastDoorSticker

- (NSString)description
{
  long long v2 = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 136];
  v9[8] = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 120];
  v9[9] = v2;
  v9[10] = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 152];
  long long v3 = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 72];
  v9[4] = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 56];
  v9[5] = v3;
  long long v4 = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 104];
  v9[6] = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 88];
  v9[7] = v4;
  long long v5 = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 8];
  v9[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorSticker_sticker);
  v9[1] = v5;
  long long v6 = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 40];
  v9[2] = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 24];
  v9[3] = v6;
  uint64_t v10 = *(void *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 168];
  sub_1B17B3E30((uint64_t)v9);
  sub_1B196A850();
  v7 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (NSString)associatedMessageGUID
{
  return (NSString *)sub_1B17AD0C8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSticker_sticker);
}

- (BOOL)has_associatedMessageRange
{
  return (self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 24] & 1) == 0;
}

- (_NSRange)associatedMessageRange
{
  long long v2 = self;
  uint64_t v3 = sub_1B17A13FC();
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (NSString)associatedMessageFallbackHash
{
  return (NSString *)sub_1B17A1678((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSticker_sticker);
}

- (BlastDoorMessage)messageContent
{
  uint64_t v2 = *(void *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 56];
  uint64_t v3 = *(void *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 72];
  uint64_t v18 = *(void *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 64];
  uint64_t v19 = *(void *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 48];
  uint64_t v4 = *(void *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 88];
  uint64_t v5 = *(void *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 96];
  uint64_t v6 = *(void *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 104];
  uint64_t v15 = *(void *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 112];
  uint64_t v7 = *(void *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 128];
  uint64_t v16 = *(void *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 120];
  uint64_t v17 = *(void *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 80];
  uint64_t v9 = *(void *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 136];
  uint64_t v8 = *(void *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 144];
  uint64_t v10 = (objc_class *)type metadata accessor for _ObjCMessageWrapper();
  v11 = (char *)objc_allocWithZone(v10);
  v12 = &v11[OBJC_IVAR___BlastDoorMessage_message];
  *(void *)v12 = v19;
  *((void *)v12 + 1) = v2;
  *((void *)v12 + 2) = v18;
  *((void *)v12 + 3) = v3;
  *((void *)v12 + 4) = v17;
  *((void *)v12 + 5) = v4;
  *((void *)v12 + 6) = v5;
  *((void *)v12 + 7) = v6;
  *((void *)v12 + 8) = v15;
  *((void *)v12 + 9) = v16;
  *((void *)v12 + 10) = v7;
  *((void *)v12 + 11) = v9;
  *((void *)v12 + 12) = v8;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1B12FC558(v5);
  v20.receiver = v11;
  v20.super_class = v10;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13 = [(BlastDoorSticker *)&v20 init];
  return (BlastDoorMessage *)v13;
}

- (NSArray)participantDestinationIdentifiers
{
  if (*(void *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 168])
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = (void *)sub_1B196AAF0();
    swift_bridgeObjectRelease();
    return (NSArray *)v2;
  }
  else
  {
    _NSRange result = (NSArray *)sub_1B196B120();
    __break(1u);
  }
  return result;
}

- (BlastDoorSticker)init
{
  _NSRange result = (BlastDoorSticker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  long long v2 = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 136];
  v7[8] = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 120];
  v7[9] = v2;
  v7[10] = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 152];
  uint64_t v8 = *(void *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 168];
  long long v3 = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 72];
  v7[4] = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 56];
  v7[5] = v3;
  long long v4 = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 104];
  v7[6] = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 88];
  v7[7] = v4;
  long long v5 = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 8];
  v7[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorSticker_sticker);
  v7[1] = v5;
  long long v6 = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 40];
  v7[2] = *(_OWORD *)&self->sticker[OBJC_IVAR___BlastDoorSticker_sticker + 24];
  v7[3] = v6;
  sub_1B14ED9FC((uint64_t)v7);
}

@end