@interface PosterViewModel
- (_TtC10ContactsUI15PosterViewModel)init;
@end

@implementation PosterViewModel

- (_TtC10ContactsUI15PosterViewModel)init
{
  result = (_TtC10ContactsUI15PosterViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  v3 = (char *)self + OBJC_IVAR____TtC10ContactsUI15PosterViewModel___observationRegistrar;
  uint64_t v4 = sub_18B983DC8();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end