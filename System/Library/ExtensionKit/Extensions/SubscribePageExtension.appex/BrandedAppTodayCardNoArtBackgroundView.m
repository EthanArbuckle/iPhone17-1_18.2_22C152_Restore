@interface BrandedAppTodayCardNoArtBackgroundView
- (_TtC22SubscribePageExtension38BrandedAppTodayCardNoArtBackgroundView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension38BrandedAppTodayCardNoArtBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BrandedAppTodayCardNoArtBackgroundView

- (_TtC22SubscribePageExtension38BrandedAppTodayCardNoArtBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension38BrandedAppTodayCardNoArtBackgroundView *)sub_100462BA8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension38BrandedAppTodayCardNoArtBackgroundView)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension38BrandedAppTodayCardNoArtBackgroundView_style;
  uint64_t v6 = sub_100763FA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension38BrandedAppTodayCardNoArtBackgroundView_image) = 0;
  id v7 = a3;

  result = (_TtC22SubscribePageExtension38BrandedAppTodayCardNoArtBackgroundView *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1004630EC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38BrandedAppTodayCardNoArtBackgroundView_imageLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38BrandedAppTodayCardNoArtBackgroundView_gradientLayer));
  sub_100463808((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension38BrandedAppTodayCardNoArtBackgroundView_style);
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension38BrandedAppTodayCardNoArtBackgroundView_image);
}

@end