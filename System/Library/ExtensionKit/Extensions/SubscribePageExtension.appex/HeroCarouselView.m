@interface HeroCarouselView
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)pageControlTimerProgress:(id)a3 shouldAdvanceToPage:(int64_t)a4;
- (_TtC22SubscribePageExtension16HeroCarouselView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension16HeroCarouselView)initWithFrame:(CGRect)a3;
- (unint64_t)accessibilityTraits;
- (void)layoutSubviews;
- (void)pageControlDidChange;
- (void)reduceMotionStatusDidChange:(id)a3;
- (void)setAccessibilityTraits:(unint64_t)a3;
- (void)voiceOverStatusDidChange:(id)a3;
@end

@implementation HeroCarouselView

- (_TtC22SubscribePageExtension16HeroCarouselView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension16HeroCarouselView *)sub_100247224(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension16HeroCarouselView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10024AA24();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1002477F4();
}

- (void)pageControlDidChange
{
  v2 = self;
  sub_100248444();
}

- (void)reduceMotionStatusDidChange:(id)a3
{
}

- (BOOL)pageControlTimerProgress:(id)a3 shouldAdvanceToPage:(int64_t)a4
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitAdjustable;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for HeroCarouselView();
  [(HeroCarouselView *)&v4 setAccessibilityTraits:a3];
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  if (a3 == 1)
  {
    unsigned __int8 v4 = 0;
    goto LABEL_5;
  }
  BOOL v3 = 0;
  if (a3 == 2)
  {
    unsigned __int8 v4 = 1;
LABEL_5:
    v5 = self;
    sub_1005562A0(v4);

    return 1;
  }
  return v3;
}

- (void)voiceOverStatusDidChange:(id)a3
{
}

- (void).cxx_destruct
{
  sub_10024A8A4((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension16HeroCarouselView_carouselDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension16HeroCarouselView_pageControl));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension16HeroCarouselView_scrollView));
  swift_bridgeObjectRelease();
  BOOL v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension16HeroCarouselView_autoScrollConfiguration;
  uint64_t v4 = sub_10075EEA0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension16HeroCarouselView_autoScrollTimer));
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension16HeroCarouselView_pageControlProgress);
}

@end