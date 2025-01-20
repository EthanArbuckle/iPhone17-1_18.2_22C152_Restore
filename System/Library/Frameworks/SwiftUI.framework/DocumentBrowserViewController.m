@interface DocumentBrowserViewController
- (_TtC7SwiftUI29DocumentBrowserViewController)initWithCoder:(id)a3;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)initForOpeningContentTypes:(id)a3;
- (id)initForOpeningFilesWithContentTypes:(id)a3;
- (void)documentBrowser:(id)a3 didImportDocumentAtURL:(id)a4 toDestinationURL:(id)a5;
- (void)documentBrowser:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)documentBrowser:(id)a3 didRequestDocumentCreationWithHandler:(id)a4;
- (void)documentBrowser:(id)a3 failedToImportDocumentAtURL:(id)a4 error:(id)a5;
@end

@implementation DocumentBrowserViewController

- (_TtC7SwiftUI29DocumentBrowserViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7SwiftUI29DocumentBrowserViewController_documentConfigurations) = (Class)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7SwiftUI29DocumentBrowserViewController_configurationMap) = (Class)MEMORY[0x1E4FBC868];
  id v4 = a3;

  result = (_TtC7SwiftUI29DocumentBrowserViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)documentBrowser:(id)a3 didRequestDocumentCreationWithHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  specialized DocumentBrowserViewController.documentBrowser(_:didRequestDocumentCreationWithHandler:)((uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSURL?, @unowned UIDocumentBrowserImportMode) -> (), v7);

  swift_release();
}

- (void)documentBrowser:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  type metadata accessor for URL();
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  id v8 = self;
  specialized DocumentBrowserViewController.documentBrowser(_:didPickDocumentsAt:)(v6);

  swift_bridgeObjectRelease();
}

- (void)documentBrowser:(id)a3 didImportDocumentAtURL:(id)a4 toDestinationURL:(id)a5
{
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  v13 = (char *)&v17 - v12;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  id v14 = a3;
  v15 = self;
  DocumentBrowserViewController.presentDocument(at:animated:)((uint64_t)v10, 1);

  v16 = *(void (**)(char *, uint64_t))(v8 + 8);
  v16(v10, v7);
  v16(v13, v7);
}

- (void)documentBrowser:(id)a3 failedToImportDocumentAtURL:(id)a4 error:(id)a5
{
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  v13 = self;
  id v14 = a5;
  specialized DocumentBrowserViewController.documentBrowser(_:failedToImportDocumentAt:error:)(v12, (uint64_t)v11, (uint64_t)a5);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  specialized DocumentBrowserViewController.animationController(forPresented:presenting:source:)(v8);
  v13 = v12;

  return v13;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  v5 = self;
  DocumentBrowserViewController.animationController(forDismissed:)(v4);
  uint64_t v7 = v6;

  return v7;
}

- (id)initForOpeningFilesWithContentTypes:(id)a3
{
  id result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)initForOpeningContentTypes:(id)a3
{
  id result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  outlined destroy of RootModifier((uint64_t)self + OBJC_IVAR____TtC7SwiftUI29DocumentBrowserViewController_rootModifier);

  swift_bridgeObjectRelease();
}

@end