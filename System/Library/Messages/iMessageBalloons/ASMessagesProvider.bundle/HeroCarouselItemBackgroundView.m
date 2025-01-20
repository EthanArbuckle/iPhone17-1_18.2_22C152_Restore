@interface HeroCarouselItemBackgroundView
- (_TtC18ASMessagesProvider30HeroCarouselItemBackgroundView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider30HeroCarouselItemBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation HeroCarouselItemBackgroundView

- (_TtC18ASMessagesProvider30HeroCarouselItemBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider30HeroCarouselItemBackgroundView *)sub_10A760(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider30HeroCarouselItemBackgroundView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC18ASMessagesProvider30HeroCarouselItemBackgroundView_mediaViewContainer;
  objc_allocWithZone((Class)type metadata accessor for MediaView());
  id v6 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_1ED548(0.0, 0.0, 0.0, 0.0, 1.0, 0.0);
  uint64_t v7 = OBJC_IVAR____TtC18ASMessagesProvider30HeroCarouselItemBackgroundView_artworkView;
  sub_76E300();
  *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)[objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];

  result = (_TtC18ASMessagesProvider30HeroCarouselItemBackgroundView *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for HeroCarouselItemBackgroundView();
  v2 = (char *)v4.receiver;
  [(HeroCarouselItemBackgroundView *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC18ASMessagesProvider30HeroCarouselItemBackgroundView_mediaViewContainer];
  sub_772580();
  objc_msgSend(v3, "setFrame:", v4.receiver, v4.super_class);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider30HeroCarouselItemBackgroundView_mediaViewContainer));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider30HeroCarouselItemBackgroundView_artworkView);
}

@end