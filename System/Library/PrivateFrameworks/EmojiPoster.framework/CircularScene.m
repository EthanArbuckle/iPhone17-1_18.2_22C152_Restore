@interface CircularScene
- (_TtC11EmojiPoster13CircularScene)init;
- (_TtC11EmojiPoster13CircularScene)initWithCoder:(id)a3;
- (_TtC11EmojiPoster13CircularScene)initWithSize:(CGSize)a3;
- (void)didMoveToView:(id)a3;
@end

@implementation CircularScene

- (_TtC11EmojiPoster13CircularScene)initWithCoder:(id)a3
{
  return (_TtC11EmojiPoster13CircularScene *)sub_20B8F2B6C(a3);
}

- (_TtC11EmojiPoster13CircularScene)initWithSize:(CGSize)a3
{
  return (_TtC11EmojiPoster13CircularScene *)sub_20B8F2D84(a3.width, a3.height);
}

- (void)didMoveToView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20B8F2F98((uint64_t)v4);
}

- (_TtC11EmojiPoster13CircularScene)init
{
  result = (_TtC11EmojiPoster13CircularScene *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

@end