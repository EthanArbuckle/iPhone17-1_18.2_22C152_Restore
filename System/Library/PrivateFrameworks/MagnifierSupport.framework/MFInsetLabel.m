@interface MFInsetLabel
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC16MagnifierSupport12MFInsetLabel)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport12MFInsetLabel)initWithFrame:(CGRect)a3;
- (void)drawTextInRect:(CGRect)a3;
@end

@implementation MFInsetLabel

- (void)drawTextInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_2359379C4(x, y, width, height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_235937AD4(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  double v3 = sub_235937BF8();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (_TtC16MagnifierSupport12MFInsetLabel)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport12MFInsetLabel_topInset) = (Class)0x4000000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport12MFInsetLabel_leftInset) = (Class)0x4020000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport12MFInsetLabel_bottomInset) = (Class)0x4000000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport12MFInsetLabel_rightInset) = (Class)0x4020000000000000;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MFInsetLabel();
  return -[MFInsetLabel initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC16MagnifierSupport12MFInsetLabel)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport12MFInsetLabel *)sub_235937D14(a3);
}

@end