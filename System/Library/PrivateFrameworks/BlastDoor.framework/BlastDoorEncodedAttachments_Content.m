@interface BlastDoorEncodedAttachments_Content
- (BlastDoorEncodedAttachmentsEncodedContentWrapper)content;
- (BlastDoorEncodedAttachments_Content)init;
- (NSString)description;
@end

@implementation BlastDoorEncodedAttachments_Content

- (NSString)description
{
  sub_1B17B2C88((uint64_t)self + OBJC_IVAR___BlastDoorEncodedAttachments_Content_encodedAttachments_Content, (uint64_t)&v4);
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BlastDoorEncodedAttachmentsEncodedContentWrapper)content
{
  sub_1B17B2C88((uint64_t)self + OBJC_IVAR___BlastDoorEncodedAttachments_Content_encodedAttachments_Content, (uint64_t)v10);
  sub_1B14EE608((uint64_t)v10, (uint64_t)v9);
  v3 = (objc_class *)type metadata accessor for _ObjCEnumEncodedAttachmentsEncodedContentWrapper();
  id v4 = objc_allocWithZone(v3);
  sub_1B1501734((uint64_t)v9, (uint64_t)v4 + OBJC_IVAR___BlastDoorEncodedAttachmentsEncodedContentWrapper_encodedAttachments_EncodedContent);
  v8.receiver = v4;
  v8.super_class = v3;
  v5 = self;
  v6 = [(BlastDoorEncodedAttachments_Content *)&v8 init];
  sub_1B1627CD0((uint64_t)v9);

  return (BlastDoorEncodedAttachmentsEncodedContentWrapper *)v6;
}

- (BlastDoorEncodedAttachments_Content)init
{
  result = (BlastDoorEncodedAttachments_Content *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end