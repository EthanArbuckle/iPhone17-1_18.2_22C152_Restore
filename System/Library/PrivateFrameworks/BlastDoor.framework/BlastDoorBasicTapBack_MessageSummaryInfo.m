@interface BlastDoorBasicTapBack_MessageSummaryInfo
- (BlastDoorBasicTapBack_MessageSummaryInfo)init;
- (NSString)description;
- (NSString)summary;
- (int64_t)contentType;
@end

@implementation BlastDoorBasicTapBack_MessageSummaryInfo

- (NSString)description
{
  swift_bridgeObjectRetain();
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (int64_t)contentType
{
  return qword_1B19BB838[*((char *)&self->super.isa
                         + OBJC_IVAR___BlastDoorBasicTapBack_MessageSummaryInfo_basicTapBack_MessageSummaryInfo)];
}

- (NSString)summary
{
  return (NSString *)sub_1B17AB9BC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicTapBack_MessageSummaryInfo_basicTapBack_MessageSummaryInfo);
}

- (BlastDoorBasicTapBack_MessageSummaryInfo)init
{
  result = (BlastDoorBasicTapBack_MessageSummaryInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end