@interface PlayerView
+ (Class)layerClass;
- (_TtC10StickerKit10PlayerView)initWithCoder:(id)a3;
- (_TtC10StickerKit10PlayerView)initWithFrame:(CGRect)a3;
@end

@implementation PlayerView

+ (Class)layerClass
{
  sub_245203D98(0, &qword_268ED5278);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC10StickerKit10PlayerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10StickerKit10PlayerView_player) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10StickerKit10PlayerView_playerItem) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PlayerView();
  return -[PlayerView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC10StickerKit10PlayerView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10StickerKit10PlayerView_player) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10StickerKit10PlayerView_playerItem) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PlayerView();
  return [(PlayerView *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10StickerKit10PlayerView_playerItem);
}

@end