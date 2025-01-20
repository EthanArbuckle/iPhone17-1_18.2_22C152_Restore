@interface BlastDoorTextMessage_MessageSummaryInfo
- (BOOL)hasBeenRetried;
- (BOOL)has_hasBeenRetried;
- (BOOL)has_updatedDateWithServerTime;
- (BOOL)updatedDateWithServerTime;
- (BlastDoorTextMessage_MessageSummaryInfo)init;
- (NSString)associatedBalloonBundleID;
- (NSString)description;
- (NSString)sourceApplicationID;
@end

@implementation BlastDoorTextMessage_MessageSummaryInfo

- (NSString)description
{
  uint64_t v2 = *(void *)&self->textMessage_MessageSummaryInfo[OBJC_IVAR___BlastDoorTextMessage_MessageSummaryInfo_textMessage_MessageSummaryInfo
                                                      + 16];
  uint64_t v3 = *(void *)&self->textMessage_MessageSummaryInfo[OBJC_IVAR___BlastDoorTextMessage_MessageSummaryInfo_textMessage_MessageSummaryInfo
                                                      + 24];
  uint64_t v4 = *(void *)&self->textMessage_MessageSummaryInfo[OBJC_IVAR___BlastDoorTextMessage_MessageSummaryInfo_textMessage_MessageSummaryInfo
                                                      + 48];
  uint64_t v5 = *(void *)&self->textMessage_MessageSummaryInfo[OBJC_IVAR___BlastDoorTextMessage_MessageSummaryInfo_textMessage_MessageSummaryInfo
                                                      + 56];
  swift_retain();
  sub_1B11E7664(v2, v3);
  swift_retain();
  sub_1B11E7664(v4, v5);
  sub_1B196A850();
  v6 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (BOOL)has_updatedDateWithServerTime
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___BlastDoorTextMessage_MessageSummaryInfo_textMessage_MessageSummaryInfo) != 2;
}

- (BOOL)updatedDateWithServerTime
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___BlastDoorTextMessage_MessageSummaryInfo_textMessage_MessageSummaryInfo) & 1;
}

- (BOOL)has_hasBeenRetried
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR___BlastDoorTextMessage_MessageSummaryInfo_textMessage_MessageSummaryInfo
         + 1) != 2;
}

- (BOOL)hasBeenRetried
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR___BlastDoorTextMessage_MessageSummaryInfo_textMessage_MessageSummaryInfo
         + 1) & 1;
}

- (NSString)sourceApplicationID
{
  return (NSString *)sub_1B17AC8A4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTextMessage_MessageSummaryInfo_textMessage_MessageSummaryInfo);
}

- (NSString)associatedBalloonBundleID
{
  return (NSString *)sub_1B17ACA08((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTextMessage_MessageSummaryInfo_textMessage_MessageSummaryInfo);
}

- (BlastDoorTextMessage_MessageSummaryInfo)init
{
  result = (BlastDoorTextMessage_MessageSummaryInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2 = *(void *)&self->textMessage_MessageSummaryInfo[OBJC_IVAR___BlastDoorTextMessage_MessageSummaryInfo_textMessage_MessageSummaryInfo
                                                      + 16];
  uint64_t v3 = *(void *)&self->textMessage_MessageSummaryInfo[OBJC_IVAR___BlastDoorTextMessage_MessageSummaryInfo_textMessage_MessageSummaryInfo
                                                      + 24];
  uint64_t v4 = *(void *)&self->textMessage_MessageSummaryInfo[OBJC_IVAR___BlastDoorTextMessage_MessageSummaryInfo_textMessage_MessageSummaryInfo
                                                      + 48];
  uint64_t v5 = *(void *)&self->textMessage_MessageSummaryInfo[OBJC_IVAR___BlastDoorTextMessage_MessageSummaryInfo_textMessage_MessageSummaryInfo
                                                      + 56];
  swift_release();
  sub_1B11E7748(v2, v3);
  swift_release();
  sub_1B11E7748(v4, v5);
}

@end