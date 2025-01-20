@interface BlastDoorBasicTapBack
- (BlastDoorBasicTapBack)init;
- (BlastDoorBasicTapBack_MessageSummaryInfo)messageSummaryInfo;
- (NSArray)participantDestinationIdentifiers;
- (NSString)associatedMessageFallbackHash;
- (NSString)associatedMessageGUID;
- (NSString)description;
- (NSString)plainTextBody;
- (_NSRange)associatedMessageRange;
- (int64_t)associatedMessageType;
@end

@implementation BlastDoorBasicTapBack

- (NSString)description
{
  uint64_t v2 = *(void *)&self->basicTapBack[OBJC_IVAR___BlastDoorBasicTapBack_basicTapBack + 72];
  uint64_t v3 = *(void *)&self->basicTapBack[OBJC_IVAR___BlastDoorBasicTapBack_basicTapBack + 80];
  long long v6 = *(_OWORD *)&self->basicTapBack[OBJC_IVAR___BlastDoorBasicTapBack_basicTapBack + 88];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1B136C45C(v2, v3, v6);
  swift_bridgeObjectRetain();
  sub_1B196A850();
  v4 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (int64_t)associatedMessageType
{
  int64_t result = sub_1B17B2998(qword_1B19BB650[*((char *)&self->super.isa + OBJC_IVAR___BlastDoorBasicTapBack_basicTapBack)]);
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
  return (NSString *)sub_1B179F9F0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicTapBack_basicTapBack);
}

- (_NSRange)associatedMessageRange
{
  NSUInteger v2 = sub_1B179FA74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicTapBack_basicTapBack);
  result.length = v3;
  result.location = v2;
  return result;
}

- (NSArray)participantDestinationIdentifiers
{
  return (NSArray *)sub_1B179FAC4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicTapBack_basicTapBack);
}

- (BlastDoorBasicTapBack_MessageSummaryInfo)messageSummaryInfo
{
  NSUInteger v2 = (char *)self + OBJC_IVAR___BlastDoorBasicTapBack_basicTapBack;
  uint64_t v3 = *(void *)&self->basicTapBack[OBJC_IVAR___BlastDoorBasicTapBack_basicTapBack + 88];
  if (v3 == 1)
  {
    v4 = 0;
  }
  else
  {
    uint64_t v6 = *((void *)v2 + 10);
    uint64_t v5 = *((void *)v2 + 11);
    v7 = (objc_class *)type metadata accessor for _ObjCBasicTapBack_MessageSummaryInfoWrapper();
    v8 = (char *)objc_allocWithZone(v7);
    v9 = &v8[OBJC_IVAR___BlastDoorBasicTapBack_MessageSummaryInfo_basicTapBack_MessageSummaryInfo];
    char *v9 = v6;
    *((void *)v9 + 1) = v5;
    *((void *)v9 + 2) = v3;
    v11.receiver = v8;
    v11.super_class = v7;
    swift_bridgeObjectRetain();
    v4 = [(BlastDoorBasicTapBack *)&v11 init];
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

- (BlastDoorBasicTapBack)init
{
  _NSRange result = (BlastDoorBasicTapBack *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2 = *(void *)&self->basicTapBack[OBJC_IVAR___BlastDoorBasicTapBack_basicTapBack + 72];
  uint64_t v3 = *(void *)&self->basicTapBack[OBJC_IVAR___BlastDoorBasicTapBack_basicTapBack + 80];
  uint64_t v4 = *(void *)&self->basicTapBack[OBJC_IVAR___BlastDoorBasicTapBack_basicTapBack + 88];
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B136C738(v2, v3, v4);
  swift_bridgeObjectRelease();
}

@end