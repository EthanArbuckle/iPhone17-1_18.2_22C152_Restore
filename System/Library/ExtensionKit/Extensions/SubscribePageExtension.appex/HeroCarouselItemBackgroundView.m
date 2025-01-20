@interface HeroCarouselItemBackgroundView
- (_TtC22SubscribePageExtension30HeroCarouselItemBackgroundView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension30HeroCarouselItemBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation HeroCarouselItemBackgroundView

- (_TtC22SubscribePageExtension30HeroCarouselItemBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension30HeroCarouselItemBackgroundView *)sub_1000850BC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension30HeroCarouselItemBackgroundView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC22SubscribePageExtension30HeroCarouselItemBackgroundView_mediaViewContainer;
  objc_allocWithZone((Class)type metadata accessor for MediaView());
  id v6 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_100596574(0.0, 0.0, 0.0, 0.0, 1.0, 0.0);
  uint64_t v7 = OBJC_IVAR____TtC22SubscribePageExtension30HeroCarouselItemBackgroundView_artworkView;
  sub_100758360();
  *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)[objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];

  result = (_TtC22SubscribePageExtension30HeroCarouselItemBackgroundView *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for HeroCarouselItemBackgroundView();
  v2 = (char *)v4.receiver;
  [(HeroCarouselItemBackgroundView *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension30HeroCarouselItemBackgroundView_mediaViewContainer];
  sub_10075C580();
  objc_msgSend(v3, "setFrame:", v4.receiver, v4.super_class);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30HeroCarouselItemBackgroundView_mediaViewContainer));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension30HeroCarouselItemBackgroundView_artworkView);
}

@end