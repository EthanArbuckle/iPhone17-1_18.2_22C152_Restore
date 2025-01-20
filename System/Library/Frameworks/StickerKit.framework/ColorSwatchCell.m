@interface ColorSwatchCell
- (BOOL)isSelected;
- (_TtC10StickerKit15ColorSwatchCell)initWithCoder:(id)a3;
- (_TtC10StickerKit15ColorSwatchCell)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation ColorSwatchCell

- (BOOL)isSelected
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ColorSwatchCell();
  return [(ColorSwatchCell *)&v3 isSelected];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ColorSwatchCell();
  id v4 = v5.receiver;
  [(ColorSwatchCell *)&v5 setSelected:v3];
  objc_msgSend(v4, sel_setNeedsDisplay, v5.receiver, v5.super_class);
}

- (_TtC10StickerKit15ColorSwatchCell)initWithFrame:(CGRect)a3
{
  return (_TtC10StickerKit15ColorSwatchCell *)sub_2452BE6A0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10StickerKit15ColorSwatchCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC10StickerKit15ColorSwatchCell_color) = 0;
  id v4 = a3;

  result = (_TtC10StickerKit15ColorSwatchCell *)sub_2454009B8();
  __break(1u);
  return result;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  sub_2452BE890(x, y, width, height);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit15ColorSwatchCell_color));
}

@end