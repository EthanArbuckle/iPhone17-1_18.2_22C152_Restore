@interface PosterDetails
- (_TtC21contactsdonationagent13PosterDetails)init;
@end

@implementation PosterDetails

- (_TtC21contactsdonationagent13PosterDetails)init
{
  result = (_TtC21contactsdonationagent13PosterDetails *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC21contactsdonationagent13PosterDetails_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_100006BA8((uint64_t)self + OBJC_IVAR____TtC21contactsdonationagent13PosterDetails_dataProvider);

  swift_bridgeObjectRelease();
}

@end