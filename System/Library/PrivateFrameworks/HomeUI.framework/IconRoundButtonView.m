@interface IconRoundButtonView
- (CGSize)intrinsicContentSize;
- (_TtC6HomeUI19IconRoundButtonView)initWithCoder:(id)a3;
- (_TtC6HomeUI19IconRoundButtonView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)updateConstraints;
@end

@implementation IconRoundButtonView

- (_TtC6HomeUI19IconRoundButtonView)initWithFrame:(CGRect)a3
{
  return (_TtC6HomeUI19IconRoundButtonView *)sub_1BE591BFC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6HomeUI19IconRoundButtonView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BE592740();
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for IconRoundButtonView();
  id v2 = v7.receiver;
  [(IconRoundButtonView *)&v7 layoutSubviews];
  objc_msgSend(v2, sel_bounds, v7.receiver, v7.super_class);
  double v4 = v3;
  objc_msgSend(v2, sel_bounds);
  if (v5 >= v4) {
    double v6 = v4;
  }
  else {
    double v6 = v5;
  }
  objc_msgSend(v2, sel__setContinuousCornerRadius_, v6 * 0.5);
  objc_msgSend(v2, sel_setNeedsDisplay);
}

- (CGSize)intrinsicContentSize
{
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for IconRoundButtonView();
  id v2 = (char *)v11.receiver;
  [(IconRoundButtonView *)&v11 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  objc_super v7 = (double *)&v2[OBJC_IVAR____TtC6HomeUI19IconRoundButtonView_dimension];
  swift_beginAccess();
  double v8 = *v7;

  if (v4 > v8) {
    double v9 = v4;
  }
  else {
    double v9 = v8;
  }
  if (v6 > v8) {
    double v10 = v6;
  }
  else {
    double v10 = v8;
  }
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)updateConstraints
{
  id v2 = self;
  sub_1BE5921C0();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  double v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6HomeUI19IconRoundButtonView_backgroundView);
}

@end