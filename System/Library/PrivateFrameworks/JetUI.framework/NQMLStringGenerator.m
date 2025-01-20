@interface NQMLStringGenerator
- (_TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator)init;
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

@implementation NQMLStringGenerator

- (void)parserDidStartDocument:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B0861A58();
}

- (void)parserDidEndDocument:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_attributeStack;
  swift_beginAccess();
  if (*(void *)(*(void *)v5 + 16))
  {
    id v6 = a3;
    v7 = self;
    if (!sub_1B0860F5C()) {
      sub_1B07EB9E0(*(void *)(*(void *)v5 + 16) - 1);
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
  sub_1B0861B48();
}

- (void)parser:(id)a3 didStartElement:(unint64_t)a4 attributes:(id)a5
{
  type metadata accessor for NQMLAttributeName(0);
  sub_1B086286C(&qword_1E9B3AAE8, type metadata accessor for NQMLAttributeName);
  uint64_t v8 = sub_1B0869CB8();
  id v9 = a3;
  v10 = self;
  sub_1B0861DB4(a4, v8);

  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 didEndElement:(unint64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_1B086216C(a4);
}

- (void)parser:(id)a3 didFindCharacters:(id)a4
{
  sub_1B0869D98();
  id v6 = a3;
  v7 = self;
  sub_1B0862240();

  swift_bridgeObjectRelease();
}

- (void)parserDidFindNewline:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B085FEDC();
}

- (void)parser:(id)a3 didStartListOfStyle:(unint64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_1B0862444(a4);
}

- (void)parserDidStartListElement:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B08625A8();
}

- (void)parserDidEndListElement:(id)a3
{
  id v4 = a3;
  id v9 = self;
  sub_1B085FEDC();
  uint64_t v5 = *(uint64_t *)((char *)&v9->super.isa
                  + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_orderedListTracker);
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
  sub_1B086278C();
}

- (_TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator)init
{
  result = (_TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_parser));
  v3 = *(void **)&self->configuration[OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_configuration];
  id v4 = *(void **)&self->configuration[OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_configuration
                                    + 8];
  id v5 = *(void **)&self->configuration[OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_configuration
                                    + 32];
  objc_release(*(id *)&self->configuration[OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_configuration
                                         + 56]);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_accumulator));
  swift_bridgeObjectRelease();
  uint64_t v6 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_foregroundColor);
}

@end