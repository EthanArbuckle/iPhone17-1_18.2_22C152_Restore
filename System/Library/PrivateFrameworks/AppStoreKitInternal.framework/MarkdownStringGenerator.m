@interface MarkdownStringGenerator
- (_TtC19AppStoreKitInternalP33_B4B7001B821E0CE6B7ABCB22A63E48C723MarkdownStringGenerator)init;
- (void)parser:(id)a3 didEndElement:(unint64_t)a4;
- (void)parser:(id)a3 didFindCharacters:(id)a4;
- (void)parser:(id)a3 didStartElement:(unint64_t)a4 attributes:(id)a5;
- (void)parser:(id)a3 parseErrorOccurred:(id)a4;
- (void)parserDidFindNewline:(id)a3;
@end

@implementation MarkdownStringGenerator

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  v7 = self;
  sub_1E1925CE8();
}

- (void)parser:(id)a3 didStartElement:(unint64_t)a4 attributes:(id)a5
{
  swift_beginAccess();
  id v7 = a3;
  id v8 = self;
  sub_1E1D5BFC8();
  swift_endAccess();

  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 didEndElement:(unint64_t)a4
{
  swift_beginAccess();
  id v6 = a3;
  id v7 = self;
  sub_1E1D5BFC8();
  swift_endAccess();

  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 didFindCharacters:(id)a4
{
  sub_1E1D5BE58();
  id v6 = a3;
  id v7 = self;
  sub_1E1925F54();

  swift_bridgeObjectRelease();
}

- (void)parserDidFindNewline:(id)a3
{
  swift_beginAccess();
  id v5 = a3;
  id v6 = self;
  sub_1E1D5BFC8();
  swift_endAccess();
}

- (_TtC19AppStoreKitInternalP33_B4B7001B821E0CE6B7ABCB22A63E48C723MarkdownStringGenerator)init
{
  result = (_TtC19AppStoreKitInternalP33_B4B7001B821E0CE6B7ABCB22A63E48C723MarkdownStringGenerator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternalP33_B4B7001B821E0CE6B7ABCB22A63E48C723MarkdownStringGenerator_parser));
  v3 = *(void **)&self->configuration[OBJC_IVAR____TtC19AppStoreKitInternalP33_B4B7001B821E0CE6B7ABCB22A63E48C723MarkdownStringGenerator_configuration];
  v4 = *(void **)&self->configuration[OBJC_IVAR____TtC19AppStoreKitInternalP33_B4B7001B821E0CE6B7ABCB22A63E48C723MarkdownStringGenerator_configuration
                                    + 8];
  id v5 = *(void **)&self->configuration[OBJC_IVAR____TtC19AppStoreKitInternalP33_B4B7001B821E0CE6B7ABCB22A63E48C723MarkdownStringGenerator_configuration
                                    + 32];
  objc_release(*(id *)&self->configuration[OBJC_IVAR____TtC19AppStoreKitInternalP33_B4B7001B821E0CE6B7ABCB22A63E48C723MarkdownStringGenerator_configuration
                                         + 56]);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end