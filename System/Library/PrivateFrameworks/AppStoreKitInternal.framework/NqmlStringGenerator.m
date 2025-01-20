@interface NqmlStringGenerator
- (_TtC19AppStoreKitInternalP33_7BE152A6E9112DDB85E95517955C27A519NqmlStringGenerator)init;
- (void)parser:(id)a3 didEndElement:(unint64_t)a4;
- (void)parser:(id)a3 didEndListOfStyle:(unint64_t)a4;
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

@implementation NqmlStringGenerator

- (void)parserDidStartDocument:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E1D4956C();
}

- (void)parserDidEndDocument:(id)a3
{
  v5 = (char *)self
     + OBJC_IVAR____TtC19AppStoreKitInternalP33_7BE152A6E9112DDB85E95517955C27A519NqmlStringGenerator_attributeStack;
  swift_beginAccess();
  if (*(void *)(*(void *)v5 + 16))
  {
    id v6 = a3;
    v7 = self;
    if (!sub_1E1D48F40()) {
      sub_1E1799F18(*(void *)(*(void *)v5 + 16) - 1);
    }
    swift_bridgeObjectRelease();
    swift_endAccess();
  }
  else
  {
    __break(1u);
  }
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  v7 = self;
  sub_1E1D496A8();
}

- (void)parser:(id)a3 didStartElement:(unint64_t)a4 attributes:(id)a5
{
  type metadata accessor for NqmlAttributeName(0);
  sub_1E1D4A468(&qword_1EBF40910, type metadata accessor for NqmlAttributeName);
  uint64_t v8 = sub_1E1D5BCB8();
  id v9 = a3;
  v10 = self;
  sub_1E1D49914(a4, v8);

  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 didEndElement:(unint64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_1E1D49D24(a4);
}

- (void)parser:(id)a3 didFindCharacters:(id)a4
{
  sub_1E1D5BE58();
  id v6 = a3;
  v7 = self;
  sub_1E1D49DF8();

  swift_bridgeObjectRelease();
}

- (void)parserDidFindNewline:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E1D47FFC();
}

- (void)parser:(id)a3 didStartListOfStyle:(unint64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_1E1D49FFC(a4);
}

- (void)parserDidStartListElement:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E1D4A160();
}

- (void)parserDidEndListElement:(id)a3
{
  id v4 = a3;
  id v9 = self;
  sub_1E1D47FFC();
  uint64_t v5 = *(uint64_t *)((char *)&v9->super.isa
                  + OBJC_IVAR____TtC19AppStoreKitInternalP33_7BE152A6E9112DDB85E95517955C27A519NqmlStringGenerator_orderedListTracker);
  if (v5)
  {
    uint64_t v6 = *(void *)(v5 + 16);
    BOOL v7 = __OFADD__(v6, 1);
    uint64_t v8 = v6 + 1;
    if (v7)
    {
      __break(1u);
      return;
    }
    *(void *)(v5 + 16) = v8;
  }
}

- (void)parser:(id)a3 didEndListOfStyle:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1E1D4A388();
}

- (_TtC19AppStoreKitInternalP33_7BE152A6E9112DDB85E95517955C27A519NqmlStringGenerator)init
{
  result = (_TtC19AppStoreKitInternalP33_7BE152A6E9112DDB85E95517955C27A519NqmlStringGenerator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternalP33_7BE152A6E9112DDB85E95517955C27A519NqmlStringGenerator_parser));
  v3 = *(void **)&self->configuration[OBJC_IVAR____TtC19AppStoreKitInternalP33_7BE152A6E9112DDB85E95517955C27A519NqmlStringGenerator_configuration];
  id v4 = *(void **)&self->configuration[OBJC_IVAR____TtC19AppStoreKitInternalP33_7BE152A6E9112DDB85E95517955C27A519NqmlStringGenerator_configuration
                                    + 8];
  id v5 = *(void **)&self->configuration[OBJC_IVAR____TtC19AppStoreKitInternalP33_7BE152A6E9112DDB85E95517955C27A519NqmlStringGenerator_configuration
                                    + 32];
  objc_release(*(id *)&self->configuration[OBJC_IVAR____TtC19AppStoreKitInternalP33_7BE152A6E9112DDB85E95517955C27A519NqmlStringGenerator_configuration
                                         + 56]);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternalP33_7BE152A6E9112DDB85E95517955C27A519NqmlStringGenerator_accumulator));
  swift_bridgeObjectRelease();
  uint64_t v6 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC19AppStoreKitInternalP33_7BE152A6E9112DDB85E95517955C27A519NqmlStringGenerator_foregroundColor);
}

@end