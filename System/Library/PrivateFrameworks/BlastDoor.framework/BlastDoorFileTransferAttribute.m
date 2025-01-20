@interface BlastDoorFileTransferAttribute
- (BlastDoorFileTransferAttribute)init;
- (BlastDoorFileTransferAttributeAttachmentSubtypeWrapper)attachmentSubtype;
- (BlastDoorFileTransferAttribute_ImageInfo)imageInfo;
- (NSArray)attachments;
- (NSNumber)legacyAnimoji;
- (NSString)description;
- (NSString)mimeType;
- (NSString)name;
- (NSString)utiType;
- (unint64_t)datasize;
- (void)setAttachmentSubtype:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setDatasize:(unint64_t)a3;
- (void)setImageInfo:(id)a3;
- (void)setLegacyAnimoji:(id)a3;
- (void)setMimeType:(id)a3;
- (void)setName:(id)a3;
- (void)setUtiType:(id)a3;
@end

@implementation BlastDoorFileTransferAttribute

- (NSArray)attachments
{
  swift_beginAccess();
  type metadata accessor for _ObjCFileTransferAttribute_AttachmentInfoWrapper(0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1B196AAF0();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setAttachments:(id)a3
{
  type metadata accessor for _ObjCFileTransferAttribute_AttachmentInfoWrapper(0);
  uint64_t v4 = sub_1B196AB20();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___BlastDoorFileTransferAttribute_attachments);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (BlastDoorFileTransferAttribute_ImageInfo)imageInfo
{
  return (BlastDoorFileTransferAttribute_ImageInfo *)sub_1B18BCC34((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorFileTransferAttribute_imageInfo);
}

- (void)setImageInfo:(id)a3
{
}

- (BlastDoorFileTransferAttributeAttachmentSubtypeWrapper)attachmentSubtype
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorFileTransferAttribute_attachmentSubtype);
  swift_beginAccess();
  return (BlastDoorFileTransferAttributeAttachmentSubtypeWrapper *)*v2;
}

- (void)setAttachmentSubtype:(id)a3
{
  uint64_t v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___BlastDoorFileTransferAttribute_attachmentSubtype);
  swift_beginAccess();
  v5 = *v4;
  *uint64_t v4 = a3;
  id v6 = a3;
}

- (NSString)name
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setName:(id)a3
{
  uint64_t v4 = sub_1B196A810();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___BlastDoorFileTransferAttribute_name);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (unint64_t)datasize
{
  v2 = (unint64_t *)((char *)self + OBJC_IVAR___BlastDoorFileTransferAttribute_datasize);
  swift_beginAccess();
  return *v2;
}

- (void)setDatasize:(unint64_t)a3
{
  uint64_t v4 = (unint64_t *)((char *)self + OBJC_IVAR___BlastDoorFileTransferAttribute_datasize);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (NSString)utiType
{
  return (NSString *)sub_1B18BC98C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorFileTransferAttribute_utiType);
}

- (void)setUtiType:(id)a3
{
}

- (NSString)mimeType
{
  return (NSString *)sub_1B18BC98C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorFileTransferAttribute_mimeType);
}

- (void)setMimeType:(id)a3
{
}

- (NSNumber)legacyAnimoji
{
  return (NSNumber *)sub_1B18BCC34((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorFileTransferAttribute_legacyAnimoji);
}

- (void)setLegacyAnimoji:(id)a3
{
}

- (NSString)description
{
  v2 = self;
  sub_1B18BD360();

  v3 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BlastDoorFileTransferAttribute)init
{
  result = (BlastDoorFileTransferAttribute *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorFileTransferAttribute_legacyAnimoji);
}

@end