@interface PaddingLabel
- (CGSize)intrinsicContentSize;
- (_TtC16MagnifierSupport12PaddingLabel)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport12PaddingLabel)initWithFrame:(CGRect)a3;
- (void)drawTextInRect:(CGRect)a3;
@end

@implementation PaddingLabel

- (void)drawTextInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_2358CBDD8(x, y, width, height);
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  double v3 = sub_2358CBF2C();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (_TtC16MagnifierSupport12PaddingLabel)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport12PaddingLabel_topInset) = (Class)0x4014000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport12PaddingLabel_bottomInset) = (Class)0x4014000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport12PaddingLabel_leftInset) = (Class)0x4014000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport12PaddingLabel_rightInset) = (Class)0x4014000000000000;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PaddingLabel();
  return -[PaddingLabel initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC16MagnifierSupport12PaddingLabel)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport12PaddingLabel_topInset) = (Class)0x4014000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport12PaddingLabel_bottomInset) = (Class)0x4014000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport12PaddingLabel_leftInset) = (Class)0x4014000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport12PaddingLabel_rightInset) = (Class)0x4014000000000000;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PaddingLabel();
  return [(PaddingLabel *)&v5 initWithCoder:a3];
}

@end