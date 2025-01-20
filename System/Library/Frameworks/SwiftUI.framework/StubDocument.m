@interface StubDocument
- (BOOL)loadFromContents:(id)a3 ofType:(id)a4 error:(id *)a5;
- (BOOL)writeContents:(id)a3 toURL:(id)a4 forSaveOperation:(int64_t)a5 originalContentsURL:(id)a6 error:(id *)a7;
- (_TtC7SwiftUI12StubDocument)initWithFileURL:(id)a3;
@end

@implementation StubDocument

- (BOOL)writeContents:(id)a3 toURL:(id)a4 forSaveOperation:(int64_t)a5 originalContentsURL:(id)a6 error:(id *)a7
{
  _s10Foundation3URLVSgMaTm_9(0, (unint64_t *)&lazy cache variable for type metadata for URL?, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v10 - 8);
  v12 = &v22[-v11];
  uint64_t v13 = type metadata accessor for URL();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  v16 = &v22[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_unknownObjectRetain();
  id v17 = a4;
  v18 = self;
  id v19 = a6;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  if (v19)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v20 = 0;
  }
  else
  {
    uint64_t v20 = 1;
  }
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, v20, 1, v13);
  specialized StubDocument.writeContents(_:to:for:originalContentsURL:)((uint64_t)v23, (uint64_t)v16);

  _s10Foundation3URLVSgWOhTm_4((uint64_t)v12, (unint64_t *)&lazy cache variable for type metadata for URL?, MEMORY[0x1E4F276F0]);
  (*(void (**)(unsigned char *, uint64_t))(v14 + 8))(v16, v13);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  return 1;
}

- (BOOL)loadFromContents:(id)a3 ofType:(id)a4 error:(id *)a5
{
  swift_unknownObjectRetain();
  v7 = self;
  id v8 = a4;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  if (v8)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v10);
  swift_bridgeObjectRelease();

  return 1;
}

- (_TtC7SwiftUI12StubDocument)initWithFileURL:(id)a3
{
  uint64_t v3 = type metadata accessor for URL();
  MEMORY[0x1F4188790](v3 - 8);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  result = (_TtC7SwiftUI12StubDocument *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC7SwiftUI12StubDocument_contentType;
  uint64_t v3 = type metadata accessor for UTType();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_release();
}

@end