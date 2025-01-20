@interface IdentifiedDocumentGroupDocumentCreation
- (_TtC7SwiftUI39IdentifiedDocumentGroupDocumentCreation)init;
- (void)documentBrowser:(id)a3 didImportDocumentAtURL:(id)a4 toDestinationURL:(id)a5;
- (void)documentBrowser:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)documentBrowser:(id)a3 didRequestDocumentCreationWithHandler:(id)a4;
@end

@implementation IdentifiedDocumentGroupDocumentCreation

- (_TtC7SwiftUI39IdentifiedDocumentGroupDocumentCreation)init
{
  result = (_TtC7SwiftUI39IdentifiedDocumentGroupDocumentCreation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of NewDocumentProvider?((uint64_t)self+ OBJC_IVAR____TtC7SwiftUI39IdentifiedDocumentGroupDocumentCreation____lazy_storage___defaultEditorConfiguration, &lazy cache variable for type metadata for IdentifiedDocumentGroupConfiguration??, (uint64_t)&lazy cache variable for type metadata for IdentifiedDocumentGroupConfiguration?, (uint64_t)&type metadata for IdentifiedDocumentGroupConfiguration, (void (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for AccessibilityValueStorage?);
  outlined destroy of NewDocumentProvider?((uint64_t)self+ OBJC_IVAR____TtC7SwiftUI39IdentifiedDocumentGroupDocumentCreation____lazy_storage___defaultConfiguration, &lazy cache variable for type metadata for IdentifiedDocumentGroupConfiguration??, (uint64_t)&lazy cache variable for type metadata for IdentifiedDocumentGroupConfiguration?, (uint64_t)&type metadata for IdentifiedDocumentGroupConfiguration, (void (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for AccessibilityValueStorage?);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7SwiftUI39IdentifiedDocumentGroupDocumentCreation____lazy_storage___documentBrowser));
  outlined consume of (@escaping @callee_guaranteed (@guaranteed NSFileWrapper?) -> (@owned NSFileWrapper, @error @owned Error))?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI39IdentifiedDocumentGroupDocumentCreation_newDocumentHandler));

  swift_bridgeObjectRelease();
}

- (void)documentBrowser:(id)a3 didRequestDocumentCreationWithHandler:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  specialized IdentifiedDocumentGroupDocumentCreation.documentBrowser(_:didRequestDocumentCreationWithHandler:)(v7, (char *)v8, (void (**)(void, void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)documentBrowser:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  type metadata accessor for URL();
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  v8 = self;
  specialized IdentifiedDocumentGroupDocumentCreation.documentBrowser(_:didPickDocumentsAt:)(v6);

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
  IdentifiedDocumentGroupDocumentCreation.presentDocument(at:)((uint64_t)v10);

  v16 = *(void (**)(char *, uint64_t))(v8 + 8);
  v16(v10, v7);
  v16(v13, v7);
}

@end