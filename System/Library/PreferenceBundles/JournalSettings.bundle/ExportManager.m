@interface ExportManager
- (_TtC15JournalSettings13ExportManager)init;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)documentPickerWasCancelled:(id)a3;
@end

@implementation ExportManager

- (_TtC15JournalSettings13ExportManager)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15JournalSettings13ExportManager_progressAlertController) = 0;
  v3 = (char *)self + OBJC_IVAR____TtC15JournalSettings13ExportManager_currentExportOptions;
  uint64_t v4 = type metadata accessor for ExportOptions();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15JournalSettings13ExportManager_currentExportTask) = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ExportManager();
  return [(ExportManager *)&v6 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15JournalSettings13ExportManager_progressAlertController));
  sub_12A4C((uint64_t)self + OBJC_IVAR____TtC15JournalSettings13ExportManager_currentExportOptions);
  swift_release();

  swift_unknownObjectWeakDestroy();
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  id v5 = a3;
  objc_super v6 = self;
  sub_12584();
}

- (void)documentPickerWasCancelled:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_12584();
}

@end