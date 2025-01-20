@interface DOCSuggestion
- (_TtC14RecentsAvocado13DOCSuggestion)init;
@end

@implementation DOCSuggestion

- (_TtC14RecentsAvocado13DOCSuggestion)init
{
  return (_TtC14RecentsAvocado13DOCSuggestion *)sub_10003B850();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_100035F60((uint64_t)self + OBJC_IVAR____TtC14RecentsAvocado13DOCSuggestion_representedObject);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1000388F0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC14RecentsAvocado13DOCSuggestion_customImageGenerator));

  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14RecentsAvocado13DOCSuggestion_customAtomImageGenerator);
  sub_1000388F0(v3);
}

@end