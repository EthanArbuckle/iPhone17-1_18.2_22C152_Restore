@interface TitledAppIconView
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC12GameCenterUI17TitledAppIconView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI17TitledAppIconView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TitledAppIconView

- (_TtC12GameCenterUI17TitledAppIconView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI17TitledAppIconView *)sub_1AF7496CC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI17TitledAppIconView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF749968();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF749AE0();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  double v4 = sub_1AF749DDC();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  double v6 = self;
  double v7 = sub_1AF74A3AC(a4, v6);
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

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityTitleLabel
{
  id v2 = sub_1AF74A0B8();

  return (_TtC12GameCenterUI16DynamicTypeLabel *)v2;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12GameCenterUI17TitledAppIconView_titleLabel);
}

@end