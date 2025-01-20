@interface VideoPlayer
- (_TtC19AppStoreKitInternal11VideoPlayer)init;
- (_TtC19AppStoreKitInternal11VideoPlayer)initWithPlayerItem:(id)a3;
- (_TtC19AppStoreKitInternal11VideoPlayer)initWithURL:(id)a3;
- (void)dealloc;
- (void)pause;
- (void)play;
@end

@implementation VideoPlayer

- (void)dealloc
{
  v2 = self;
  VideoPlayer.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_1E15B07DC((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal11VideoPlayer_videoUrl, &qword_1EBF36F70);

  sub_1E15B07DC((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal11VideoPlayer_failure, &qword_1EBF36160);
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC19AppStoreKitInternal11VideoPlayer_delegate;
  sub_1E15F6A98((uint64_t)v3);
}

- (void)play
{
  v2 = self;
  sub_1E171BCAC();
}

- (void)pause
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for VideoPlayer();
  v2 = (char *)v4.receiver;
  [(VideoPlayer *)&v4 pause];
  v3 = &v2[OBJC_IVAR____TtC19AppStoreKitInternal11VideoPlayer_shouldBePlaying];
  swift_beginAccess();
  char *v3 = 0;
}

- (_TtC19AppStoreKitInternal11VideoPlayer)init
{
  result = (_TtC19AppStoreKitInternal11VideoPlayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC19AppStoreKitInternal11VideoPlayer)initWithURL:(id)a3
{
  uint64_t v3 = sub_1E1D57018();
  MEMORY[0x1F4188790](v3 - 8);
  sub_1E1D56FB8();
  result = (_TtC19AppStoreKitInternal11VideoPlayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC19AppStoreKitInternal11VideoPlayer)initWithPlayerItem:(id)a3
{
  id v3 = a3;
  result = (_TtC19AppStoreKitInternal11VideoPlayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end