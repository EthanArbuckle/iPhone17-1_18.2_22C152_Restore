@interface HeroCarouselItemView
- (NSArray)preferredFocusEnvironments;
- (_TtC22SubscribePageExtension20HeroCarouselItemView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension20HeroCarouselItemView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HeroCarouselItemView

- (_TtC22SubscribePageExtension20HeroCarouselItemView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension20HeroCarouselItemView *)sub_10060667C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension20HeroCarouselItemView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1006097A4();
}

- (NSArray)preferredFocusEnvironments
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension20HeroCarouselItemView_overlayView);
  if (v2)
  {
    id v3 = self;
    id v4 = [v2 preferredFocusEnvironments];
    sub_10000FB44((uint64_t *)&unk_1009532C0);
    sub_100767800();
  }
  sub_10000FB44((uint64_t *)&unk_1009532C0);
  v5.super.isa = sub_1007677F0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v5.super.isa;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100606D74();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100607184(a3);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20HeroCarouselItemView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20HeroCarouselItemView_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20HeroCarouselItemView____lazy_storage___moduleGradientView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension20HeroCarouselItemView_overlayView);
}

@end