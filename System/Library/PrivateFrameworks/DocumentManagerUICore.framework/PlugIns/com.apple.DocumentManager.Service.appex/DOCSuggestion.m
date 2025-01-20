@interface DOCSuggestion
- (_TtC33com_apple_DocumentManager_Service13DOCSuggestion)init;
@end

@implementation DOCSuggestion

- (_TtC33com_apple_DocumentManager_Service13DOCSuggestion)init
{
  return (_TtC33com_apple_DocumentManager_Service13DOCSuggestion *)sub_10037002C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1000608B0((uint64_t)self + OBJC_IVAR____TtC33com_apple_DocumentManager_Service13DOCSuggestion_representedObject);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service13DOCSuggestion_customImage));
  sub_10003B0A8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC33com_apple_DocumentManager_Service13DOCSuggestion_customImageGenerator));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service13DOCSuggestion_customAtomImage));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC33com_apple_DocumentManager_Service13DOCSuggestion_customAtomImageGenerator);
  sub_10003B0A8(v3);
}

@end