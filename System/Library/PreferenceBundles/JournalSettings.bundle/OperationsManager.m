@interface OperationsManager
- (_TtC15JournalSettings17OperationsManager)init;
@end

@implementation OperationsManager

- (_TtC15JournalSettings17OperationsManager)init
{
  return (_TtC15JournalSettings17OperationsManager *)sub_74228();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15JournalSettings17OperationsManager_cacheQueueLowPriority));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15JournalSettings17OperationsManager_cacheQueueRegularPriority));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15JournalSettings17OperationsManager_cacheQueueHighPriority));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15JournalSettings17OperationsManager_mapTableFileAttachmentsQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15JournalSettings17OperationsManager_mapTableAssetMetadataQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15JournalSettings17OperationsManager_fileAttachmentsQueue));

  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15JournalSettings17OperationsManager_batchRecordDownloadQueue);
}

@end