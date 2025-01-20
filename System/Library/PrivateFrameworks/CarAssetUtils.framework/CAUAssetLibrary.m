@interface CAUAssetLibrary
- (_TtC13CarAssetUtils15CAUAssetLibrary)init;
- (void)dealloc;
@end

@implementation CAUAssetLibrary

- (void)dealloc
{
  v2 = self;
  sub_24982E358();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for CAUAssetLibrary();
  [(CAUAssetLibrary *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13CarAssetUtils15CAUAssetLibrary_securityScopedBasePathURL));
  objc_super v3 = (char *)self + OBJC_IVAR____TtC13CarAssetUtils15CAUAssetLibrary_basePathURL;
  uint64_t v4 = sub_24982E398();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

- (_TtC13CarAssetUtils15CAUAssetLibrary)init
{
  result = (_TtC13CarAssetUtils15CAUAssetLibrary *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end