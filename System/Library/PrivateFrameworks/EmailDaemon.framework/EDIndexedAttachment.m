@interface EDIndexedAttachment
- (BOOL)isEqual:(id)a3;
- (EDIndexedAttachment)init;
- (EDIndexedAttachment)initWithMessageID:(id)a3 attachmentID:(id)a4;
- (EDPersistedAttachmentID)attachmentID;
- (EDPersistedMessageID)messageID;
- (int64_t)hash;
@end

@implementation EDIndexedAttachment

- (EDPersistedMessageID)messageID
{
  return (EDPersistedMessageID *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                         + OBJC_IVAR___EDIndexedAttachment_messageID));
}

- (EDPersistedAttachmentID)attachmentID
{
  return (EDPersistedAttachmentID *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                            + OBJC_IVAR___EDIndexedAttachment_attachmentID));
}

- (EDIndexedAttachment)initWithMessageID:(id)a3 attachmentID:(id)a4
{
  return (EDIndexedAttachment *)sub_1DB5A7AC0((char *)self, (uint64_t)a2, a3, a4, &OBJC_IVAR___EDIndexedAttachment_messageID, &OBJC_IVAR___EDIndexedAttachment_attachmentID, (objc_class **)off_1E6BFE118);
}

- (BOOL)isEqual:(id)a3
{
  return sub_1DB5A7CC4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))EDIndexedAttachment.isEqual(_:));
}

- (int64_t)hash
{
  return (int64_t)sub_1DB5A7D58(self, (uint64_t)a2, (SEL *)&selRef_attachmentID);
}

- (EDIndexedAttachment)init
{
  result = (EDIndexedAttachment *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___EDIndexedAttachment_attachmentID);
}

@end