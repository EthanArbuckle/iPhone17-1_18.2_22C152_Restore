@interface TapbackPlatterCircleView
- (_TtC7ChatKit24TapbackPlatterCircleView)initWithCoder:(id)a3;
- (_TtC7ChatKit24TapbackPlatterCircleView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TapbackPlatterCircleView

- (_TtC7ChatKit24TapbackPlatterCircleView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for TapbackPlatterCircleView();
  v7 = -[TapbackPlatterCircleView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  id v8 = [(TapbackPlatterCircleView *)v7 layer];
  objc_msgSend(v8, sel_setAllowsEdgeAntialiasing_, 1);

  return v7;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TapbackPlatterCircleView();
  id v2 = v9.receiver;
  [(TapbackPlatterCircleView *)&v9 layoutSubviews];
  id v3 = objc_msgSend(v2, sel_layer, v9.receiver, v9.super_class);
  objc_msgSend(v2, sel_bounds);
  double v5 = v4 * 0.5;
  id v6 = objc_msgSend(v2, sel_traitCollection);
  objc_msgSend(v6, sel_displayScale);
  double v8 = v7;

  objc_msgSend(v3, sel_setCornerRadius_, CGFloatPxRoundForScale(v5, v8));
}

- (_TtC7ChatKit24TapbackPlatterCircleView)initWithCoder:(id)a3
{
  result = (_TtC7ChatKit24TapbackPlatterCircleView *)sub_18F7BA5D0();
  __break(1u);
  return result;
}

@end