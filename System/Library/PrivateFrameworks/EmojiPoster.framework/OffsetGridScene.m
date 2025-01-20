@interface OffsetGridScene
- (_TtC11EmojiPoster15OffsetGridScene)init;
- (_TtC11EmojiPoster15OffsetGridScene)initWithCoder:(id)a3;
- (_TtC11EmojiPoster15OffsetGridScene)initWithSize:(CGSize)a3;
- (void)didMoveToView:(id)a3;
@end

@implementation OffsetGridScene

- (_TtC11EmojiPoster15OffsetGridScene)initWithCoder:(id)a3
{
  return (_TtC11EmojiPoster15OffsetGridScene *)sub_20B9223C0(a3);
}

- (_TtC11EmojiPoster15OffsetGridScene)initWithSize:(CGSize)a3
{
  return (_TtC11EmojiPoster15OffsetGridScene *)sub_20B922604(a3.width, a3.height);
}

- (void)didMoveToView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20B9228A4();
  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for OffsetGridScene();
  [(SKScene *)&v6 didMoveToView:v4];
}

- (_TtC11EmojiPoster15OffsetGridScene)init
{
  result = (_TtC11EmojiPoster15OffsetGridScene *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

@end