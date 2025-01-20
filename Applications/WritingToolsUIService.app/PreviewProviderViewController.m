@interface PreviewProviderViewController
- (_TtC21WritingToolsUIService29PreviewProviderViewController)initWithCoder:(id)a3;
- (_TtC21WritingToolsUIService29PreviewProviderViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC21WritingToolsUIService29PreviewProviderViewController)initWithPreviewItems:(id)a3;
- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4;
- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3;
@end

@implementation PreviewProviderViewController

- (_TtC21WritingToolsUIService29PreviewProviderViewController)initWithCoder:(id)a3
{
  result = (_TtC21WritingToolsUIService29PreviewProviderViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  return 1;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, (char *)self + OBJC_IVAR____TtC21WritingToolsUIService29PreviewProviderViewController_url, v6);
  id v10 = a3;
  v11 = self;
  URL._bridgeToObjectiveC()(v12);
  v14 = v13;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v14;
}

- (_TtC21WritingToolsUIService29PreviewProviderViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC21WritingToolsUIService29PreviewProviderViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC21WritingToolsUIService29PreviewProviderViewController)initWithPreviewItems:(id)a3
{
  result = (_TtC21WritingToolsUIService29PreviewProviderViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC21WritingToolsUIService29PreviewProviderViewController_url;
  uint64_t v3 = type metadata accessor for URL();
  id v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end