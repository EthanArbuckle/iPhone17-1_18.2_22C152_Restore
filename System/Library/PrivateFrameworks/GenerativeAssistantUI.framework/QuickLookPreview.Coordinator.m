@interface QuickLookPreview.Coordinator
- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4;
- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3;
@end

@implementation QuickLookPreview.Coordinator

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  return 1;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  uint64_t v6 = sub_24FB46F68();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (char *)self
      + OBJC_IVAR____TtCV21GenerativeAssistantUIP33_E13B720E09BAE9A3AC6F33E81C90395E16QuickLookPreview11Coordinator_fileURL;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, v10, v6);
  id v11 = a3;
  swift_retain();
  v12 = (void *)sub_24FB46F18();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  swift_release();
  return v12;
}

@end