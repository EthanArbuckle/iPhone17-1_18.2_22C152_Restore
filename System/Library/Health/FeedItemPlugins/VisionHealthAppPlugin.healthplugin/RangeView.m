@interface RangeView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC21VisionHealthAppPlugin9RangeView)initWithCoder:(id)a3;
- (_TtC21VisionHealthAppPlugin9RangeView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation RangeView

- (CGSize)intrinsicContentSize
{
  -[RangeView sizeThatFits:](self, sel_sizeThatFits_, 0.0, 0.0);
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC21VisionHealthAppPlugin9RangeView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC21VisionHealthAppPlugin9RangeView_minimumFractionDigits) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC21VisionHealthAppPlugin9RangeView_maximumFractionDigits) = (Class)2;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC21VisionHealthAppPlugin9RangeView_showsPositivePrefix) = 0;
  id v4 = a3;

  CGSize result = (_TtC21VisionHealthAppPlugin9RangeView *)sub_241DAB080();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RangeView();
  id v2 = v3.receiver;
  [(RangeView *)&v3 layoutSubviews];
  objc_msgSend(v2, sel_setNeedsDisplay, v3.receiver, v3.super_class);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  objc_super v3 = self;
  _s21VisionHealthAppPlugin9RangeViewC12sizeThatFitsySo6CGSizeVAFF_0();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  v9.is_nil = (char)v6;
  double v7 = v6;
  v9.value.super.isa = (Class)a3;
  RangeView.traitCollectionDidChange(_:)(v9);
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v7 = self;
  v9.origin.CGFloat x = x;
  v9.origin.CGFloat y = y;
  v9.size.CGFloat width = width;
  v9.size.CGFloat height = height;
  RangeView.draw(_:)(v9);
}

- (_TtC21VisionHealthAppPlugin9RangeView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC21VisionHealthAppPlugin9RangeView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end