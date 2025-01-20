@interface BrandedAppTodayCardLargeIconBackgroundView
- (_TtC20ProductPageExtension42BrandedAppTodayCardLargeIconBackgroundView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension42BrandedAppTodayCardLargeIconBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BrandedAppTodayCardLargeIconBackgroundView

- (_TtC20ProductPageExtension42BrandedAppTodayCardLargeIconBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension42BrandedAppTodayCardLargeIconBackgroundView *)sub_10020D458(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension42BrandedAppTodayCardLargeIconBackgroundView)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension42BrandedAppTodayCardLargeIconBackgroundView_style;
  uint64_t v6 = sub_1007785F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension42BrandedAppTodayCardLargeIconBackgroundView_image) = 0;
  id v7 = a3;

  result = (_TtC20ProductPageExtension42BrandedAppTodayCardLargeIconBackgroundView *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10020D984();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension42BrandedAppTodayCardLargeIconBackgroundView_backgroundImageLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension42BrandedAppTodayCardLargeIconBackgroundView_gradientLayer));
  sub_100110B30((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension42BrandedAppTodayCardLargeIconBackgroundView_style);
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension42BrandedAppTodayCardLargeIconBackgroundView_image);
}

@end