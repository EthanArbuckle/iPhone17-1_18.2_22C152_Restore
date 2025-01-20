@interface HeroCarouselItemView
- (NSArray)preferredFocusEnvironments;
- (_TtC20ProductPageExtension20HeroCarouselItemView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension20HeroCarouselItemView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HeroCarouselItemView

- (_TtC20ProductPageExtension20HeroCarouselItemView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension20HeroCarouselItemView *)sub_100171FEC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension20HeroCarouselItemView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100175114();
}

- (NSArray)preferredFocusEnvironments
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension20HeroCarouselItemView_overlayView);
  if (v2)
  {
    id v3 = self;
    id v4 = [v2 preferredFocusEnvironments];
    sub_10000D280((uint64_t *)&unk_100953CE0);
    sub_10077BED0();
  }
  sub_10000D280((uint64_t *)&unk_100953CE0);
  v5.super.isa = sub_10077BEC0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v5.super.isa;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001726E4();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100172AF4(a3);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20HeroCarouselItemView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20HeroCarouselItemView_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20HeroCarouselItemView____lazy_storage___moduleGradientView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension20HeroCarouselItemView_overlayView);
}

@end