@interface BlastDoorSMSCTPartAttachment
- (BlastDoorSMSCTPartAttachment)init;
- (NSData)contentData;
- (NSString)description;
@end

@implementation BlastDoorSMSCTPartAttachment

- (NSString)description
{
  sub_1B11F10F4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorSMSCTPartAttachment_sMSCTPartAttachment), *(void *)&self->sMSCTPartAttachment[OBJC_IVAR___BlastDoorSMSCTPartAttachment_sMSCTPartAttachment]);
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSData)contentData
{
  return (NSData *)sub_1B179AEC4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSCTPartAttachment_sMSCTPartAttachment, (void (*)(uint64_t, uint64_t))sub_1B11F10F4);
}

- (BlastDoorSMSCTPartAttachment)init
{
  result = (BlastDoorSMSCTPartAttachment *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end