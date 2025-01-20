@interface DOCSuggestion
- (_TtC18DocumentAppIntents13DOCSuggestion)init;
@end

@implementation DOCSuggestion

- (_TtC18DocumentAppIntents13DOCSuggestion)init
{
  return (_TtC18DocumentAppIntents13DOCSuggestion *)sub_10003D590();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_100034BB0((uint64_t)self + OBJC_IVAR____TtC18DocumentAppIntents13DOCSuggestion_representedObject);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_100037540(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC18DocumentAppIntents13DOCSuggestion_customImageGenerator));

  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC18DocumentAppIntents13DOCSuggestion_customAtomImageGenerator);

  sub_100037540(v3);
}

@end