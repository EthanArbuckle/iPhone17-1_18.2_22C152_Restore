@interface HeroCarouselItemView
- (NSArray)preferredFocusEnvironments;
- (_TtC18ASMessagesProvider20HeroCarouselItemView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider20HeroCarouselItemView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HeroCarouselItemView

- (_TtC18ASMessagesProvider20HeroCarouselItemView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider20HeroCarouselItemView *)sub_5DEFA8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider20HeroCarouselItemView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_5E20D0();
}

- (NSArray)preferredFocusEnvironments
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider20HeroCarouselItemView_overlayView);
  if (v2)
  {
    id v3 = self;
    id v4 = [v2 preferredFocusEnvironments];
    sub_FD50((uint64_t *)&unk_971310);
    sub_77D890();
  }
  sub_FD50((uint64_t *)&unk_971310);
  v5.super.isa = sub_77D880().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v5.super.isa;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_5DF6A0();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_5DFAB0(a3);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider20HeroCarouselItemView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider20HeroCarouselItemView_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider20HeroCarouselItemView____lazy_storage___moduleGradientView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider20HeroCarouselItemView_overlayView);
}

@end