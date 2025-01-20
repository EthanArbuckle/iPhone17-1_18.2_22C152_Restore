@interface BlastDoorSMSCTPartPlain
- (BlastDoorSMSCTPartPlain)init;
- (NSString)description;
- (NSString)plainTextContentBody;
@end

@implementation BlastDoorSMSCTPartPlain

- (NSString)description
{
  swift_bridgeObjectRetain();
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)plainTextContentBody
{
  return (NSString *)sub_1B17AD0C8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSCTPartPlain_sMSCTPartPlain);
}

- (BlastDoorSMSCTPartPlain)init
{
  result = (BlastDoorSMSCTPartPlain *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end