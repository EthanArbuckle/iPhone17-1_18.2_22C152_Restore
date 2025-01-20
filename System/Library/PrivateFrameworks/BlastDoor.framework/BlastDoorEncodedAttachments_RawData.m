@interface BlastDoorEncodedAttachments_RawData
- (BlastDoorEncodedAttachments_RawData)init;
- (NSData)data;
- (NSString)description;
@end

@implementation BlastDoorEncodedAttachments_RawData

- (NSString)description
{
  sub_1B11F1108(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorEncodedAttachments_RawData_encodedAttachments_RawData), *(void *)&self->encodedAttachments_RawData[OBJC_IVAR___BlastDoorEncodedAttachments_RawData_encodedAttachments_RawData]);
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSData)data
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorEncodedAttachments_RawData_encodedAttachments_RawData);
  unint64_t v3 = *(void *)&self->encodedAttachments_RawData[OBJC_IVAR___BlastDoorEncodedAttachments_RawData_encodedAttachments_RawData];
  sub_1B11F1108(v2, v3);
  v4 = (void *)sub_1B1969DB0();
  sub_1B11ED78C(v2, v3);
  return (NSData *)v4;
}

- (BlastDoorEncodedAttachments_RawData)init
{
  result = (BlastDoorEncodedAttachments_RawData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end