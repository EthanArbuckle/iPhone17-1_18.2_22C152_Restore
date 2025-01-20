@interface BlastDoorTapBack_MessageSummaryInfo
- (BlastDoorTapBack_MessageSummaryInfo)init;
- (NSString)description;
- (NSString)pluginBundleID;
- (NSString)pluginDisplayName;
- (NSString)summary;
- (int64_t)contentType;
@end

@implementation BlastDoorTapBack_MessageSummaryInfo

- (NSString)description
{
  uint64_t v2 = *(void *)&self->tapBack_MessageSummaryInfo[OBJC_IVAR___BlastDoorTapBack_MessageSummaryInfo_tapBack_MessageSummaryInfo
                                                  + 32];
  long long v5 = *(_OWORD *)&self->tapBack_MessageSummaryInfo[OBJC_IVAR___BlastDoorTapBack_MessageSummaryInfo_tapBack_MessageSummaryInfo
                                                  + 40];
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1B11E7664(v2, v5);
  swift_bridgeObjectRetain();
  sub_1B196A850();
  v3 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (int64_t)contentType
{
  int64_t result = sub_1B17B4218(qword_1B19BB850[*((char *)&self->super.isa
                                         + OBJC_IVAR___BlastDoorTapBack_MessageSummaryInfo_tapBack_MessageSummaryInfo)]);
  if (v3) {
    __break(1u);
  }
  return result;
}

- (NSString)summary
{
  return (NSString *)sub_1B17AB9BC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTapBack_MessageSummaryInfo_tapBack_MessageSummaryInfo);
}

- (NSString)pluginBundleID
{
  return (NSString *)sub_1B17ABA40((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTapBack_MessageSummaryInfo_tapBack_MessageSummaryInfo);
}

- (NSString)pluginDisplayName
{
  return (NSString *)sub_1B17ABBA4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTapBack_MessageSummaryInfo_tapBack_MessageSummaryInfo);
}

- (BlastDoorTapBack_MessageSummaryInfo)init
{
  int64_t result = (BlastDoorTapBack_MessageSummaryInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2 = *(void *)&self->tapBack_MessageSummaryInfo[OBJC_IVAR___BlastDoorTapBack_MessageSummaryInfo_tapBack_MessageSummaryInfo
                                                  + 32];
  uint64_t v3 = *(void *)&self->tapBack_MessageSummaryInfo[OBJC_IVAR___BlastDoorTapBack_MessageSummaryInfo_tapBack_MessageSummaryInfo
                                                  + 40];
  swift_release();
  swift_bridgeObjectRelease();
  sub_1B11E7748(v2, v3);
  swift_bridgeObjectRelease();
}

@end