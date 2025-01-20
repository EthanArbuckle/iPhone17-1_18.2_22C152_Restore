@interface CAFUIListItemCell
- (_TtC5CAFUI17CAFUIListItemCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation CAFUIListItemCell

- (_TtC5CAFUI17CAFUIListItemCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC5CAFUI17CAFUIListItemCell_item) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for CAFUIListItemCell();
  v7 = -[CAFUITileBaseCell initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  v8 = (void *)MEMORY[0x24C59F610](0xD000000000000011, 0x8000000249531B30);
  [(CAFUIListItemCell *)v7 setAccessibilityIdentifier:v8];

  return v7;
}

- (void)prepareForReuse
{
  v2 = self;
  CAFUIListItemCell.prepareForReuse()();
}

- (void).cxx_destruct
{
}

@end