@interface DOCSuggestion
- (_TtC17RecentsAppPopover13DOCSuggestion)init;
@end

@implementation DOCSuggestion

- (_TtC17RecentsAppPopover13DOCSuggestion)init
{
  return (_TtC17RecentsAppPopover13DOCSuggestion *)sub_10003B224();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_10003A60C((uint64_t)self + OBJC_IVAR____TtC17RecentsAppPopover13DOCSuggestion_representedObject);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_100035EB4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17RecentsAppPopover13DOCSuggestion_customImageGenerator));

  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC17RecentsAppPopover13DOCSuggestion_customAtomImageGenerator);
  sub_100035EB4(v3);
}

@end