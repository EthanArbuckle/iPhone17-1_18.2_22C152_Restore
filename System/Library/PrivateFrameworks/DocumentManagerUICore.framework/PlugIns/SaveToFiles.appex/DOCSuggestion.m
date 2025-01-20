@interface DOCSuggestion
- (_TtC11SaveToFiles13DOCSuggestion)init;
@end

@implementation DOCSuggestion

- (_TtC11SaveToFiles13DOCSuggestion)init
{
  return (_TtC11SaveToFiles13DOCSuggestion *)sub_10003A044();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_10003BA70((uint64_t)self + OBJC_IVAR____TtC11SaveToFiles13DOCSuggestion_representedObject);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_10003B980(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11SaveToFiles13DOCSuggestion_customImageGenerator));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11SaveToFiles13DOCSuggestion_customAtomImageGenerator);
  sub_10003B980(v3);
}

@end