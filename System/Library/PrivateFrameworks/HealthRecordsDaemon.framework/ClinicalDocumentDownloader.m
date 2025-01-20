@interface ClinicalDocumentDownloader
- (_TtC19HealthRecordsDaemon26ClinicalDocumentDownloader)init;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_beginOrResumeDownloadingAttachments:(NSArray *)a3 shouldRequestMore:(BOOL)a4 completion:(id)a5;
- (void)remote_downloadAttachment:(HKMedicalDownloadableAttachment *)a3 completion:(id)a4;
- (void)remote_pingDownloaderWithCompletion:(id)a3;
- (void)remote_triggerDownloadForAttachment:(NSUUID *)a3 completion:(id)a4;
@end

@implementation ClinicalDocumentDownloader

- (_TtC19HealthRecordsDaemon26ClinicalDocumentDownloader)init
{
  result = (_TtC19HealthRecordsDaemon26ClinicalDocumentDownloader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthRecordsDaemon26ClinicalDocumentDownloader_client));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthRecordsDaemon26ClinicalDocumentDownloader_healthStore));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthRecordsDaemon26ClinicalDocumentDownloader_documentStore));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC19HealthRecordsDaemon26ClinicalDocumentDownloader_accountStore);
}

- (void)remote_beginOrResumeDownloadingAttachments:(NSArray *)a3 shouldRequestMore:(BOOL)a4 completion:(id)a5
{
  sub_22D0CEB40();
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(unsigned char *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = v12;
  *(void *)(v13 + 40) = self;
  uint64_t v14 = sub_22D2BCED0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26853F220;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_26853F228;
  v16[5] = v15;
  v17 = a3;
  v18 = self;
  sub_22D0CE69C((uint64_t)v11, (uint64_t)&unk_26853F230, (uint64_t)v16);
  swift_release();
}

- (void)remote_downloadAttachment:(HKMedicalDownloadableAttachment *)a3 completion:(id)a4
{
  sub_22D0CEB40();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_22D2BCED0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26853F200;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26853F208;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_22D0CE69C((uint64_t)v9, (uint64_t)&unk_26853F210, (uint64_t)v14);
  swift_release();
}

- (void)remote_pingDownloaderWithCompletion:(id)a3
{
  sub_22D0CEB40();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_22D2BCED0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26853F1E0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26853F1E8;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_22D0CE69C((uint64_t)v7, (uint64_t)&unk_26853F1F0, (uint64_t)v12);
  swift_release();
}

- (void)remote_triggerDownloadForAttachment:(NSUUID *)a3 completion:(id)a4
{
  sub_22D0CEB40();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_22D2BCED0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26853F1A0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26853F1B0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_22D0CE69C((uint64_t)v9, (uint64_t)&unk_26853ED00, (uint64_t)v14);
  swift_release();
}

- (id)exportedInterface
{
  id v2 = (id)HKClinicalDocumentDownloaderInterface();
  return v2;
}

- (id)remoteInterface
{
  return 0;
}

@end