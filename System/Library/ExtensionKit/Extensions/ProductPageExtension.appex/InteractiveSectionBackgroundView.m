@interface InteractiveSectionBackgroundView
- (_TtC20ProductPageExtension32InteractiveSectionBackgroundView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension32InteractiveSectionBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation InteractiveSectionBackgroundView

- (_TtC20ProductPageExtension32InteractiveSectionBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension32InteractiveSectionBackgroundView *)sub_10021FFD0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension32InteractiveSectionBackgroundView)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC20ProductPageExtension32InteractiveSectionBackgroundView *)sub_10022260C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1002202DC();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1002203E0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32InteractiveSectionBackgroundView_materialView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32InteractiveSectionBackgroundView_topBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32InteractiveSectionBackgroundView_bottomBackgroundView));
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension32InteractiveSectionBackgroundView_currentState, (uint64_t *)&unk_100961180);
}

@end