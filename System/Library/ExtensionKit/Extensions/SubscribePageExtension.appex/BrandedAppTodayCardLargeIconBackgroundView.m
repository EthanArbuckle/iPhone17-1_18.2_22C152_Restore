@interface BrandedAppTodayCardLargeIconBackgroundView
- (_TtC22SubscribePageExtension42BrandedAppTodayCardLargeIconBackgroundView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension42BrandedAppTodayCardLargeIconBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BrandedAppTodayCardLargeIconBackgroundView

- (_TtC22SubscribePageExtension42BrandedAppTodayCardLargeIconBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension42BrandedAppTodayCardLargeIconBackgroundView *)sub_1005DFA00(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension42BrandedAppTodayCardLargeIconBackgroundView)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension42BrandedAppTodayCardLargeIconBackgroundView_style;
  uint64_t v6 = sub_100763FA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension42BrandedAppTodayCardLargeIconBackgroundView_image) = 0;
  id v7 = a3;

  result = (_TtC22SubscribePageExtension42BrandedAppTodayCardLargeIconBackgroundView *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1005DFF2C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension42BrandedAppTodayCardLargeIconBackgroundView_backgroundImageLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension42BrandedAppTodayCardLargeIconBackgroundView_gradientLayer));
  sub_100463808((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension42BrandedAppTodayCardLargeIconBackgroundView_style);
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension42BrandedAppTodayCardLargeIconBackgroundView_image);
}

@end