@interface PlayerView
+ (Class)layerClass;
- (_TtC22StickersUltraExtension10PlayerView)initWithCoder:(id)a3;
- (_TtC22StickersUltraExtension10PlayerView)initWithFrame:(CGRect)a3;
@end

@implementation PlayerView

+ (Class)layerClass
{
  sub_10000A990(0, &qword_1000AB4D8);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC22StickersUltraExtension10PlayerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22StickersUltraExtension10PlayerView_player) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22StickersUltraExtension10PlayerView_playerItem) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PlayerView();
  return -[PlayerView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC22StickersUltraExtension10PlayerView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22StickersUltraExtension10PlayerView_player) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22StickersUltraExtension10PlayerView_playerItem) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PlayerView();
  return [(PlayerView *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22StickersUltraExtension10PlayerView_playerItem);
}

@end