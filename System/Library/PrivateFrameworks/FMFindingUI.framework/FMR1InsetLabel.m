@interface FMR1InsetLabel
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC11FMFindingUI14FMR1InsetLabel)initWithCoder:(id)a3;
- (_TtC11FMFindingUI14FMR1InsetLabel)initWithFrame:(CGRect)a3;
- (void)drawTextInRect:(CGRect)a3;
@end

@implementation FMR1InsetLabel

- (void)drawTextInRect:(CGRect)a3
{
  double v4 = sub_24D38EC00(a3.origin.x);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for FMR1InsetLabel();
  v11 = self;
  -[FMR1InsetLabel drawTextInRect:](&v12, sel_drawTextInRect_, v4, v6, v8, v10);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for FMR1InsetLabel();
  -[FMR1InsetLabel sizeThatFits:](&v9, sel_sizeThatFits_, width, height);
  double v6 = v5 + 8.0;
  double v8 = v7 + 0.0;
  result.double height = v8;
  result.double width = v6;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMR1InsetLabel();
  [(FMR1InsetLabel *)&v6 intrinsicContentSize];
  double v3 = v2 + 8.0;
  double v5 = v4 + 0.0;
  result.double height = v5;
  result.double width = v3;
  return result;
}

- (_TtC11FMFindingUI14FMR1InsetLabel)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(_OWORD *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11FMFindingUI14FMR1InsetLabel_style) = xmmword_24D3A4500;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FMR1InsetLabel();
  return -[FMR1InsetLabel initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC11FMFindingUI14FMR1InsetLabel)initWithCoder:(id)a3
{
  *(_OWORD *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11FMFindingUI14FMR1InsetLabel_style) = xmmword_24D3A4500;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMR1InsetLabel();
  return [(FMR1InsetLabel *)&v5 initWithCoder:a3];
}

@end