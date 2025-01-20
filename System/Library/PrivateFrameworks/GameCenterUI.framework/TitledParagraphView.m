@interface TitledParagraphView
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC12GameCenterUI19TitledParagraphView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI19TitledParagraphView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TitledParagraphView

- (_TtC12GameCenterUI19TitledParagraphView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI19TitledParagraphView *)sub_1AF474BE4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI19TitledParagraphView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF474F2C();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double width = a3.width;
  swift_unknownObjectRetain();
  v6 = self;
  double v7 = sub_1AF475120(width);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  swift_unknownObjectRelease();

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.var3 = v17;
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_1AF3A39CC();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF475320();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI19TitledParagraphView_titleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI19TitledParagraphView_paragraphLabel);
}

@end