@interface BlastDoorEncodedAttachmentsEncodedContentWrapper
- (BlastDoorEncodedAttachmentsEncodedContentWrapper)init;
- (BlastDoorEncodedAttachments_EncodedAstc)astc;
- (BlastDoorEncodedAttachments_RawData)other;
- (NSString)description;
- (unint64_t)type;
@end

@implementation BlastDoorEncodedAttachmentsEncodedContentWrapper

- (NSString)description
{
  sub_1B1501734((uint64_t)self + OBJC_IVAR___BlastDoorEncodedAttachmentsEncodedContentWrapper_encodedAttachments_EncodedContent, (uint64_t)&v4);
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (unint64_t)type
{
  sub_1B1501734((uint64_t)self + OBJC_IVAR___BlastDoorEncodedAttachmentsEncodedContentWrapper_encodedAttachments_EncodedContent, (uint64_t)v3);
  if (v4)
  {
    sub_1B11ED78C(v3[0], v3[1]);
    return 1;
  }
  else
  {
    sub_1B1627CD0((uint64_t)v3);
    return 0;
  }
}

- (BlastDoorEncodedAttachments_EncodedAstc)astc
{
  v2 = self;
  id v3 = sub_1B17B0C50();

  return (BlastDoorEncodedAttachments_EncodedAstc *)v3;
}

- (BlastDoorEncodedAttachments_RawData)other
{
  v2 = self;
  id v3 = sub_1B17B0D58();

  return (BlastDoorEncodedAttachments_RawData *)v3;
}

- (BlastDoorEncodedAttachmentsEncodedContentWrapper)init
{
  result = (BlastDoorEncodedAttachmentsEncodedContentWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end