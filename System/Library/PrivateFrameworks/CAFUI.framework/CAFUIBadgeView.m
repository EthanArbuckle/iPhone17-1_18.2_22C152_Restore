@interface CAFUIBadgeView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC5CAFUI14CAFUIBadgeView)initWithCoder:(id)a3;
- (_TtC5CAFUI14CAFUIBadgeView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation CAFUIBadgeView

- (_TtC5CAFUI14CAFUIBadgeView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5CAFUI14CAFUIBadgeView____lazy_storage___label) = 0;
  id v4 = a3;

  result = (_TtC5CAFUI14CAFUIBadgeView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  id v3 = CAFUIBadgeView.label.getter();
  objc_msgSend(v3, sel_intrinsicContentSize);
  double v5 = v4;
  double v7 = v6;

  if (one-time initialization token for badgePadding != -1) {
    swift_once();
  }
  double v8 = *((double *)&static CAFUIBadgeView.badgePadding + 1);
  double v9 = v5 + *(double *)&static CAFUIBadgeView.badgePadding;

  double v10 = v7 + v8;
  double v11 = v9;
  result.height = v10;
  result.width = v11;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = self;
  id v6 = CAFUIBadgeView.label.getter();
  objc_msgSend(v6, sel_sizeThatFits_, width, height);
  double v8 = v7;
  double v10 = v9;

  if (one-time initialization token for badgePadding != -1) {
    swift_once();
  }
  double v11 = *((double *)&static CAFUIBadgeView.badgePadding + 1);
  double v12 = v8 + *(double *)&static CAFUIBadgeView.badgePadding;

  double v13 = v10 + v11;
  double v14 = v12;
  result.double height = v13;
  result.double width = v14;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CAFUIBadgeView();
  id v2 = v5.receiver;
  [(CAFUIBadgeView *)&v5 layoutSubviews];
  id v3 = objc_msgSend(v2, sel_layer, v5.receiver, v5.super_class);
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v3, sel_setCornerRadius_, v4 * 0.5);
}

- (_TtC5CAFUI14CAFUIBadgeView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC5CAFUI14CAFUIBadgeView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI14CAFUIBadgeView____lazy_storage___label));
}

@end