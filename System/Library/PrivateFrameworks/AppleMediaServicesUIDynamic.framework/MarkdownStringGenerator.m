@interface MarkdownStringGenerator
- (_TtC27AppleMediaServicesUIDynamic23MarkdownStringGenerator)init;
- (void)parser:(id)a3 didEndElement:(unint64_t)a4;
- (void)parser:(id)a3 didEndListOfStyle:(unint64_t)a4;
- (void)parser:(id)a3 didFindArtworkWithIdentifier:(id)a4;
- (void)parser:(id)a3 didFindCharacters:(id)a4;
- (void)parser:(id)a3 didStartElement:(unint64_t)a4 attributes:(id)a5;
- (void)parser:(id)a3 didStartListOfStyle:(unint64_t)a4;
- (void)parser:(id)a3 parseErrorOccurred:(id)a4;
- (void)parserDidEndDocument:(id)a3;
- (void)parserDidEndListElement:(id)a3;
- (void)parserDidFindNewline:(id)a3;
- (void)parserDidStartDocument:(id)a3;
- (void)parserDidStartListElement:(id)a3;
@end

@implementation MarkdownStringGenerator

- (_TtC27AppleMediaServicesUIDynamic23MarkdownStringGenerator)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic23MarkdownStringGenerator_accumulator));
  swift_bridgeObjectRelease();
  v3 = *(void **)&self->attributeStack[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic23MarkdownStringGenerator_configuration];
  v4 = *(void **)&self->configuration[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic23MarkdownStringGenerator_configuration];
  v5 = *(void **)&self->configuration[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic23MarkdownStringGenerator_configuration
                                    + 24];
  v6 = *(void **)&self->configuration[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic23MarkdownStringGenerator_configuration
                                    + 72];
  v7 = *(void **)&self->configuration[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic23MarkdownStringGenerator_configuration
                                    + 88];
  objc_release(*(id *)&self->configuration[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic23MarkdownStringGenerator_configuration
                                         + 80]);

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic23MarkdownStringGenerator_parser));

  swift_bridgeObjectRelease();
}

- (void)parserDidStartDocument:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BF42DF18();
}

- (void)parserDidEndDocument:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BF42E0BC();
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  v7 = self;
  sub_1BF42E158();
}

- (void)parser:(id)a3 didStartElement:(unint64_t)a4 attributes:(id)a5
{
  type metadata accessor for MarkdownAttributeName(0);
  sub_1BF4308DC(&qword_1EBA941D0, type metadata accessor for MarkdownAttributeName);
  uint64_t v8 = sub_1BF465EA8();
  id v9 = a3;
  v10 = self;
  sub_1BF42E4B0((uint64_t)v10, (void *)a4, v8);

  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 didEndElement:(unint64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_1BF42EED4((uint64_t)v7, a4);
}

- (void)parser:(id)a3 didFindArtworkWithIdentifier:(id)a4
{
}

- (void)parser:(id)a3 didFindCharacters:(id)a4
{
}

- (void)parserDidFindNewline:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BF42F500();
}

- (void)parser:(id)a3 didStartListOfStyle:(unint64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_1BF42F574((uint64_t)v7, a4);
}

- (void)parserDidStartListElement:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BF42F76C();
}

- (void)parserDidEndListElement:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BF42F9B8();
}

- (void)parser:(id)a3 didEndListOfStyle:(unint64_t)a4
{
  id v5 = a3;
  id v6 = self;
  sub_1BF42FAAC();
}

@end