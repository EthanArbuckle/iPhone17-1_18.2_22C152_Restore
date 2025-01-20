@interface BlastDoorEncodedAttachments_EncodedAstc
- (BlastDoorEncodedAttachments_EncodedAstc)init;
- (BlastDoorImage)image;
- (NSString)description;
- (NSString)originalUTIType;
@end

@implementation BlastDoorEncodedAttachments_EncodedAstc

- (NSString)description
{
  sub_1B17B4164((uint64_t)self + OBJC_IVAR___BlastDoorEncodedAttachments_EncodedAstc_encodedAttachments_EncodedAstc, (uint64_t)v4);
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BlastDoorImage)image
{
  v2 = self;
  v3 = (void *)sub_1B17A8594();

  return (BlastDoorImage *)v3;
}

- (NSString)originalUTIType
{
  sub_1B17B4164((uint64_t)self + OBJC_IVAR___BlastDoorEncodedAttachments_EncodedAstc_encodedAttachments_EncodedAstc, (uint64_t)v4);
  if (v5)
  {
    swift_bridgeObjectRetain();
    sub_1B14EE76C((uint64_t)v4);
    v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
    return (NSString *)v2;
  }
  else
  {
    result = (NSString *)sub_1B196B120();
    __break(1u);
  }
  return result;
}

- (BlastDoorEncodedAttachments_EncodedAstc)init
{
  result = (BlastDoorEncodedAttachments_EncodedAstc *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end