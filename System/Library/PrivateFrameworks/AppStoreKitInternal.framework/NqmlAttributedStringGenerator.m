@interface NqmlAttributedStringGenerator
- (_TtC19AppStoreKitInternalP33_99C75C19F989C0B7BF00D5167FBC286B29NqmlAttributedStringGenerator)init;
- (void)parser:(id)a3 didEndElement:(unint64_t)a4;
- (void)parser:(id)a3 didFindCharacters:(id)a4;
- (void)parser:(id)a3 didStartElement:(unint64_t)a4 attributes:(id)a5;
- (void)parser:(id)a3 parseErrorOccurred:(id)a4;
- (void)parserDidEndDocument:(id)a3;
- (void)parserDidFindNewline:(void *)a3;
@end

@implementation NqmlAttributedStringGenerator

- (void)parser:(id)a3 didStartElement:(unint64_t)a4 attributes:(id)a5
{
  id v7 = a3;
  v8 = self;
  sub_1E18AAE6C((char *)a4);
}

- (void)parser:(id)a3 didEndElement:(unint64_t)a4
{
  id v6 = a3;
  id v7 = self;
  sub_1E18AB7D4(a4);
}

- (void)parser:(id)a3 didFindCharacters:(id)a4
{
  sub_1E1D5BE58();
  id v6 = a3;
  id v7 = self;
  sub_1E18AC1D0();

  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_1E18AC85C();
}

- (void)parserDidEndDocument:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E18ACAD0();
}

- (void)parserDidFindNewline:(void *)a3
{
  uint64_t v5 = sub_1E1D56C88();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  id v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = a3;
  id v10 = a1;
  swift_bridgeObjectRetain();
  sub_1E1D56B78();
  swift_beginAccess();
  sub_1E18AD260(&qword_1EAD85670, MEMORY[0x1E4F273A8]);
  sub_1E1D56C38();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_endAccess();
}

- (_TtC19AppStoreKitInternalP33_99C75C19F989C0B7BF00D5167FBC286B29NqmlAttributedStringGenerator)init
{
  result = (_TtC19AppStoreKitInternalP33_99C75C19F989C0B7BF00D5167FBC286B29NqmlAttributedStringGenerator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternalP33_99C75C19F989C0B7BF00D5167FBC286B29NqmlAttributedStringGenerator_parser));
  v3 = *(void **)&self->configuration[OBJC_IVAR____TtC19AppStoreKitInternalP33_99C75C19F989C0B7BF00D5167FBC286B29NqmlAttributedStringGenerator_configuration];
  id v4 = *(void **)&self->configuration[OBJC_IVAR____TtC19AppStoreKitInternalP33_99C75C19F989C0B7BF00D5167FBC286B29NqmlAttributedStringGenerator_configuration
                                    + 8];
  uint64_t v5 = *(void **)&self->configuration[OBJC_IVAR____TtC19AppStoreKitInternalP33_99C75C19F989C0B7BF00D5167FBC286B29NqmlAttributedStringGenerator_configuration
                                    + 32];
  objc_release(*(id *)&self->configuration[OBJC_IVAR____TtC19AppStoreKitInternalP33_99C75C19F989C0B7BF00D5167FBC286B29NqmlAttributedStringGenerator_configuration
                                         + 56]);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = (char *)self
     + OBJC_IVAR____TtC19AppStoreKitInternalP33_99C75C19F989C0B7BF00D5167FBC286B29NqmlAttributedStringGenerator_accumulator;
  uint64_t v7 = sub_1E1D56C88();
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  id v8 = (char *)self
     + OBJC_IVAR____TtC19AppStoreKitInternalP33_99C75C19F989C0B7BF00D5167FBC286B29NqmlAttributedStringGenerator_lastElementIndex;
  uint64_t v9 = sub_1E1D56C28();
  id v10 = *(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8);
  v10(v8, v9);
}

@end