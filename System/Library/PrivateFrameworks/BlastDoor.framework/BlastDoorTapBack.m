@interface BlastDoorTapBack
- (BlastDoorTapBack)init;
- (BlastDoorTapBack_MessageSummaryInfo)messageSummaryInfo;
- (NSArray)participantDestinationIdentifiers;
- (NSString)associatedMessageFallbackHash;
- (NSString)associatedMessageGUID;
- (NSString)description;
- (NSString)plainTextBody;
- (_NSRange)associatedMessageRange;
- (int64_t)associatedMessageType;
@end

@implementation BlastDoorTapBack

- (NSString)description
{
  long long v2 = *(_OWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 136];
  v9[8] = *(_OWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 120];
  v9[9] = v2;
  long long v3 = *(_OWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 72];
  v9[4] = *(_OWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 56];
  v9[5] = v3;
  long long v4 = *(_OWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 104];
  v9[6] = *(_OWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 88];
  v9[7] = v4;
  long long v5 = *(_OWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 8];
  v9[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorTapBack_tapBack);
  v9[1] = v5;
  long long v6 = *(_OWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 40];
  v9[2] = *(_OWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 24];
  v9[3] = v6;
  uint64_t v10 = *(void *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 152];
  sub_1B17B3C00(v9);
  sub_1B196A850();
  v7 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (int64_t)associatedMessageType
{
  int64_t result = sub_1B17B3CC4(qword_1B19BB760[*((char *)&self->super.isa + OBJC_IVAR___BlastDoorTapBack_tapBack)]);
  if (v3) {
    __break(1u);
  }
  return result;
}

- (NSString)associatedMessageGUID
{
  return (NSString *)sub_1B179F944();
}

- (NSString)associatedMessageFallbackHash
{
  return (NSString *)sub_1B179F9F0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTapBack_tapBack);
}

- (_NSRange)associatedMessageRange
{
  NSUInteger v2 = sub_1B179FA74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTapBack_tapBack);
  result.length = v3;
  result.location = v2;
  return result;
}

- (NSArray)participantDestinationIdentifiers
{
  return (NSArray *)sub_1B179FAC4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTapBack_tapBack);
}

- (BlastDoorTapBack_MessageSummaryInfo)messageSummaryInfo
{
  NSUInteger v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorTapBack_tapBack);
  uint64_t v3 = *(void *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 96];
  if (v3)
  {
    uint64_t v4 = v2[18];
    uint64_t v16 = v2[17];
    uint64_t v6 = v2[15];
    uint64_t v5 = v2[16];
    uint64_t v7 = v2[14];
    uint64_t v9 = v2[11];
    uint64_t v8 = v2[12];
    uint64_t v10 = v2[10];
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
    v14 = [(BlastDoorTapBack *)&v17 init];
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

- (BlastDoorTapBack)init
{
  _NSRange result = (BlastDoorTapBack *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  long long v2 = *(_OWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 136];
  v7[8] = *(_OWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 120];
  v7[9] = v2;
  uint64_t v8 = *(void *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 152];
  long long v3 = *(_OWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 72];
  v7[4] = *(_OWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 56];
  v7[5] = v3;
  long long v4 = *(_OWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 104];
  v7[6] = *(_OWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 88];
  v7[7] = v4;
  long long v5 = *(_OWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 8];
  v7[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorTapBack_tapBack);
  v7[1] = v5;
  long long v6 = *(_OWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 40];
  v7[2] = *(_OWORD *)&self->tapBack[OBJC_IVAR___BlastDoorTapBack_tapBack + 24];
  v7[3] = v6;
  sub_1B14E9A2C(v7);
}

@end