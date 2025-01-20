@interface StorefrontAgeRatingView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC22SubscribePageExtension23StorefrontAgeRatingView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension23StorefrontAgeRatingView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation StorefrontAgeRatingView

- (_TtC22SubscribePageExtension23StorefrontAgeRatingView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension23StorefrontAgeRatingView *)sub_10021F9C8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension23StorefrontAgeRatingView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC22SubscribePageExtension23StorefrontAgeRatingView_label;
  id v6 = objc_allocWithZone((Class)UILabel);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  uint64_t v8 = OBJC_IVAR____TtC22SubscribePageExtension23StorefrontAgeRatingView_fontMetrics;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)[objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleSubheadline];

  result = (_TtC22SubscribePageExtension23StorefrontAgeRatingView *)sub_100768A40();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension23StorefrontAgeRatingView_fontMetrics);
  v3 = self;
  [v2 scaledValueForValue:26.0];
  double v5 = v4;
  [v2 scaledValueForValue:26.0];
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(StorefrontAgeRatingView *)self intrinsicContentSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10021FE50();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23StorefrontAgeRatingView_label));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension23StorefrontAgeRatingView_fontMetrics);
}

@end