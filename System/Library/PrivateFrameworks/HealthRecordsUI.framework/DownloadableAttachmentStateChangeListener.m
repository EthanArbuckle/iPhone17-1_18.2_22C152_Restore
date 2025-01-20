@interface DownloadableAttachmentStateChangeListener
- (_TtC15HealthRecordsUI41DownloadableAttachmentStateChangeListener)init;
- (void)downloadableAttachmentDidChangeState:(id)a3;
@end

@implementation DownloadableAttachmentStateChangeListener

- (void)downloadableAttachmentDidChangeState:(id)a3
{
  id v5 = a3;
  v4 = self;
  sub_1C23B6DD4(v5);
}

- (_TtC15HealthRecordsUI41DownloadableAttachmentStateChangeListener)init
{
  result = (_TtC15HealthRecordsUI41DownloadableAttachmentStateChangeListener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI41DownloadableAttachmentStateChangeListener__latestChange;
  sub_1C23B6744(0, (unint64_t *)&unk_1EA2E5580, (uint64_t (*)(uint64_t))sub_1C23B655C, MEMORY[0x1E4F1AC70]);
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_release();
}

@end