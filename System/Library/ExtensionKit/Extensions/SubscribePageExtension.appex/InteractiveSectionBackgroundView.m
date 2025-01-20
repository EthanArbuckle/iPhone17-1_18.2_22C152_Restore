@interface InteractiveSectionBackgroundView
- (_TtC22SubscribePageExtension32InteractiveSectionBackgroundView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension32InteractiveSectionBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation InteractiveSectionBackgroundView

- (_TtC22SubscribePageExtension32InteractiveSectionBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension32InteractiveSectionBackgroundView *)sub_100458620(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension32InteractiveSectionBackgroundView)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC22SubscribePageExtension32InteractiveSectionBackgroundView *)sub_10045AADC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10045892C();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_100458A30();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32InteractiveSectionBackgroundView_materialView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32InteractiveSectionBackgroundView_topBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32InteractiveSectionBackgroundView_bottomBackgroundView));
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension32InteractiveSectionBackgroundView_currentState, (uint64_t *)&unk_100935290);
}

@end