@interface BlastDoorStickerTapBack
- (BlastDoorMessage)messageContent;
- (BlastDoorStickerTapBack)init;
- (BlastDoorTapBack_MessageSummaryInfo)messageSummaryInfo;
- (NSArray)participantDestinationIdentifiers;
- (NSString)associatedMessageFallbackHash;
- (NSString)associatedMessageGUID;
- (NSString)description;
- (NSString)plainTextBody;
- (_NSRange)associatedMessageRange;
- (int64_t)associatedMessageType;
@end

@implementation BlastDoorStickerTapBack

- (NSString)description
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack;
  memcpy(__dst, (char *)self + OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack, sizeof(__dst));
  memcpy(v5, v2, sizeof(v5));
  sub_1B17B39DC(__dst);
  sub_1B196A850();
  v3 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (int64_t)associatedMessageType
{
  return qword_1B19BB748[*((char *)&self->super.isa + OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack)];
}

- (NSString)associatedMessageGUID
{
  return (NSString *)sub_1B179F944();
}

- (NSString)associatedMessageFallbackHash
{
  return (NSString *)sub_1B179F9F0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack);
}

- (_NSRange)associatedMessageRange
{
  NSUInteger v2 = sub_1B179FA74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack);
  result.length = v3;
  result.location = v2;
  return result;
}

- (NSArray)participantDestinationIdentifiers
{
  return (NSArray *)sub_1B179FAC4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack);
}

- (BlastDoorMessage)messageContent
{
  uint64_t v2 = *(void *)&self->stickerTapBack[OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack + 80];
  uint64_t v3 = *(void *)&self->stickerTapBack[OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack + 96];
  uint64_t v18 = *(void *)&self->stickerTapBack[OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack + 88];
  uint64_t v19 = *(void *)&self->stickerTapBack[OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack + 72];
  uint64_t v4 = *(void *)&self->stickerTapBack[OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack + 112];
  uint64_t v5 = *(void *)&self->stickerTapBack[OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack + 120];
  uint64_t v6 = *(void *)&self->stickerTapBack[OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack + 128];
  uint64_t v15 = *(void *)&self->stickerTapBack[OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack + 136];
  uint64_t v7 = *(void *)&self->stickerTapBack[OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack + 152];
  uint64_t v16 = *(void *)&self->stickerTapBack[OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack + 144];
  uint64_t v17 = *(void *)&self->stickerTapBack[OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack + 104];
  uint64_t v9 = *(void *)&self->stickerTapBack[OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack + 160];
  uint64_t v8 = *(void *)&self->stickerTapBack[OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack + 168];
  v10 = (objc_class *)type metadata accessor for _ObjCMessageWrapper();
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
  v13 = [(BlastDoorStickerTapBack *)&v20 init];
  return (BlastDoorMessage *)v13;
}

- (BlastDoorTapBack_MessageSummaryInfo)messageSummaryInfo
{
  uint64_t v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack);
  uint64_t v3 = *(void *)&self->stickerTapBack[OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack + 200];
  if (v3)
  {
    uint64_t v4 = v2[31];
    uint64_t v16 = v2[30];
    uint64_t v6 = v2[28];
    uint64_t v5 = v2[29];
    uint64_t v7 = v2[27];
    uint64_t v9 = v2[24];
    uint64_t v8 = v2[25];
    uint64_t v10 = v2[23];
    v11 = (objc_class *)type metadata accessor for _ObjCTapBack_MessageSummaryInfoWrapper();
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
    v14 = [(BlastDoorStickerTapBack *)&v17 init];
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
  uint64_t v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BlastDoorStickerTapBack)init
{
  _NSRange result = (BlastDoorStickerTapBack *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  memcpy(v2, (char *)self + OBJC_IVAR___BlastDoorStickerTapBack_stickerTapBack, sizeof(v2));
  sub_1B14E9534(v2);
}

@end