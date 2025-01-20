@interface RatingView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC22SubscribePageExtension10RatingView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension10RatingView)initWithFrame:(CGRect)a3;
- (double)accessibilityRating;
- (void)layoutSubviews;
@end

@implementation RatingView

- (_TtC22SubscribePageExtension10RatingView)initWithCoder:(id)a3
{
  *(_DWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension10RatingView_rating) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension10RatingView_emptyStarColor) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension10RatingView_starPadding;
  *(void *)v4 = 0;
  v4[8] = 1;
  id v5 = a3;

  result = (_TtC22SubscribePageExtension10RatingView *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10050E3CC();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  double v3 = sub_10050E69C();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = self;
  double v4 = sub_10050E69C();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  double v6 = self;
  double v7 = sub_10050FF84(a4);
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

- (double)accessibilityRating
{
  return *(float *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension10RatingView_rating);
}

- (_TtC22SubscribePageExtension10RatingView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension10RatingView_starColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension10RatingView_emptyStarColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension10RatingView_emptyStarRowView));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension10RatingView_filledStarRowView);
}

@end