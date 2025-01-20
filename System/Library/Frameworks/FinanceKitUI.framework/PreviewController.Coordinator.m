@interface PreviewController.Coordinator
- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4;
- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3;
- (void)dismiss;
@end

@implementation PreviewController.Coordinator

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  return 1;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  id v4 = a3;
  swift_retain();
  v5 = (void *)sub_243DFBB30();

  swift_release();

  return v5;
}

- (void)dismiss
{
  v2 = (char *)self + OBJC_IVAR____TtCV12FinanceKitUI17PreviewController11Coordinator_parent;
  v3 = *(void (**)(uint64_t))&v2[*(int *)(type metadata accessor for PreviewController(0) + 20)];
  uint64_t v4 = swift_retain();
  v3(v4);

  swift_release();
}

@end