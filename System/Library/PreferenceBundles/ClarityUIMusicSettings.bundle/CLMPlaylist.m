@interface CLMPlaylist
- (NSString)curatorName;
- (NSString)musicItemID;
- (NSString)name;
- (_TtC22ClarityUIMusicSettings11CLMPlaylist)init;
@end

@implementation CLMPlaylist

- (NSString)musicItemID
{
  swift_bridgeObjectRetain();
  NSString v2 = sub_C680();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSString)name
{
  return (NSString *)sub_BFD4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC22ClarityUIMusicSettings11CLMPlaylist_name);
}

- (NSString)curatorName
{
  return (NSString *)sub_BFD4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC22ClarityUIMusicSettings11CLMPlaylist_curatorName);
}

- (_TtC22ClarityUIMusicSettings11CLMPlaylist)init
{
  result = (_TtC22ClarityUIMusicSettings11CLMPlaylist *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC22ClarityUIMusicSettings11CLMPlaylist_playlist;
  uint64_t v4 = sub_C660();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end