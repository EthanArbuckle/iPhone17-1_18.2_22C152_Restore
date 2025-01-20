@interface IMPurgedAttachmentHandler
- (IMPurgedAttachmentHandler)init;
- (IMPurgedAttachmentHandler)initWithBatchSize:(int64_t)a3;
- (IMPurgedAttachmentHandlerDelegate)delegate;
- (void)complete;
- (void)registerPurgedAttachmentAtPath:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation IMPurgedAttachmentHandler

- (IMPurgedAttachmentHandlerDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___IMPurgedAttachmentHandler_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1E016AE80](v2);

  return (IMPurgedAttachmentHandlerDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (IMPurgedAttachmentHandler)initWithBatchSize:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMPurgedAttachmentHandler_currentBatch) = 0;
  v5 = (objc_class *)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMPurgedAttachmentHandler_attachmentPaths) = (Class)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMPurgedAttachmentHandler_successfullyDeletedLivePhotoComponents) = v5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMPurgedAttachmentHandler_livePhotoComponentDeletionFailures) = v5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMPurgedAttachmentHandler_livePhotoBundleOrComponentPaths) = v5;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMPurgedAttachmentHandler_batchSize) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)IMPurgedAttachmentHandler;
  return [(IMPurgedAttachmentHandler *)&v7 init];
}

- (void)registerPurgedAttachmentAtPath:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1D9906DA0();
    v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    v6 = 0;
  }
  objc_super v7 = self;
  v8.value._countAndFlagsBits = v4;
  v8.value._object = v6;
  IMPurgedAttachmentHandler.registerPurgedAttachment(at:)(v8);

  swift_bridgeObjectRelease();
}

- (void)complete
{
  v2 = self;
  sub_1D9892CF8();
  *(Class *)((char *)&v2->super.isa + OBJC_IVAR___IMPurgedAttachmentHandler_currentBatch) = 0;
}

- (IMPurgedAttachmentHandler)init
{
  result = (IMPurgedAttachmentHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___IMPurgedAttachmentHandler_delegate;

  sub_1D9896A4C((uint64_t)v3);
}

@end