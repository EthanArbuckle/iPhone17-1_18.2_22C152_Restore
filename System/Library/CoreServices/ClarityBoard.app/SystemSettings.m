@interface SystemSettings
- (_TtC12ClarityBoard14SystemSettings)init;
- (void)airplaneModeChanged;
@end

@implementation SystemSettings

- (_TtC12ClarityBoard14SystemSettings)init
{
  return (_TtC12ClarityBoard14SystemSettings *)sub_10006820C();
}

- (void)airplaneModeChanged
{
  uint64_t v3 = sub_100029F90((uint64_t *)&unk_10017C500);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  type metadata accessor for MainActor();
  v7 = self;
  uint64_t v8 = static MainActor.shared.getter();
  v9 = (void *)swift_allocObject();
  v9[2] = v8;
  v9[3] = &protocol witness table for MainActor;
  v9[4] = v7;
  sub_1000B76CC((uint64_t)v5, (uint64_t)&unk_10017D9D8, (uint64_t)v9);
  swift_release();
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

@end