@interface ExpandingSpiralScene
- (_TtC11EmojiPoster20ExpandingSpiralScene)init;
- (_TtC11EmojiPoster20ExpandingSpiralScene)initWithCoder:(id)a3;
- (_TtC11EmojiPoster20ExpandingSpiralScene)initWithSize:(CGSize)a3;
- (void)didMoveToView:(id)a3;
@end

@implementation ExpandingSpiralScene

- (_TtC11EmojiPoster20ExpandingSpiralScene)initWithCoder:(id)a3
{
  return (_TtC11EmojiPoster20ExpandingSpiralScene *)sub_20B901FD8(a3);
}

- (_TtC11EmojiPoster20ExpandingSpiralScene)initWithSize:(CGSize)a3
{
  return (_TtC11EmojiPoster20ExpandingSpiralScene *)sub_20B9021DC(a3.width, a3.height);
}

- (void)didMoveToView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20B90243C();
  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for ExpandingSpiralScene();
  [(SKScene *)&v6 didMoveToView:v4];
}

- (_TtC11EmojiPoster20ExpandingSpiralScene)init
{
  result = (_TtC11EmojiPoster20ExpandingSpiralScene *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

@end