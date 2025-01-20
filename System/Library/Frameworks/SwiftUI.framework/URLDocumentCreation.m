@interface URLDocumentCreation
- (_TtC7SwiftUI19URLDocumentCreation)init;
- (void)documentBrowser:(id)a3 didImportDocumentAtURL:(id)a4 toDestinationURL:(id)a5;
- (void)documentBrowser:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)documentBrowser:(id)a3 didRequestDocumentCreationWithHandler:(id)a4;
@end

@implementation URLDocumentCreation

- (_TtC7SwiftUI19URLDocumentCreation)init
{
  result = (_TtC7SwiftUI19URLDocumentCreation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  outlined consume of (@escaping @callee_guaranteed (@guaranteed NSFileWrapper?) -> (@owned NSFileWrapper, @error @owned Error))?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI19URLDocumentCreation_newDocumentHandler));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC7SwiftUI19URLDocumentCreation____lazy_storage___documentBrowser);
}

- (void)documentBrowser:(id)a3 didRequestDocumentCreationWithHandler:(id)a4
{
  _s10Foundation3URLVSgMaTm_9(0, &lazy cache variable for type metadata for TaskPriority?, MEMORY[0x1E4FBCFE8], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v18 - v8;
  v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = a3;
  v13[5] = self;
  v13[6] = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSURL?, @unowned UIDocumentBrowserImportMode) -> ();
  v13[7] = v11;
  id v14 = a3;
  v15 = self;
  id v16 = v14;
  v17 = v15;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v9, (uint64_t)&async function pointer to partial apply for closure #1 in URLDocumentCreation.documentBrowser(_:didRequestDocumentCreationWithHandler:), (uint64_t)v13);

  swift_release();
  swift_release();
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
  URLDocumentCreation.presentDocument(at:)((uint64_t)v10);

  id v16 = *(void (**)(char *, uint64_t))(v8 + 8);
  v16(v10, v7);
  v16(v13, v7);
}

- (void)documentBrowser:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  type metadata accessor for URL();
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  uint64_t v8 = self;
  specialized URLDocumentCreation.documentBrowser(_:didPickDocumentsAt:)(v6);

  swift_bridgeObjectRelease();
}

@end