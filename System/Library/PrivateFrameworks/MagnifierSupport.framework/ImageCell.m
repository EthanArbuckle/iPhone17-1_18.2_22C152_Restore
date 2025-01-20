@interface ImageCell
- (_TtC16MagnifierSupport9ImageCell)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport9ImageCell)initWithFrame:(CGRect)a3;
@end

@implementation ImageCell

- (_TtC16MagnifierSupport9ImageCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MagnifierSupport9ImageCell *)sub_2357B63E4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MagnifierSupport9ImageCell)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport9ImageCell_filter) = 12;
  uint64_t v5 = OBJC_IVAR____TtC16MagnifierSupport9ImageCell_imageView;
  id v6 = objc_allocWithZone(MEMORY[0x263F82828]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC16MagnifierSupport9ImageCell *)sub_23594A968();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end