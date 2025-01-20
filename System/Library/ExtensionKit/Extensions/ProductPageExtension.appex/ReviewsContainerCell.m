@interface ReviewsContainerCell
- (BOOL)_disableRasterizeInAnimations;
- (_TtC20ProductPageExtension20ReviewsContainerCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension20ReviewsContainerCell)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)didTapEditorsChoice;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ReviewsContainerCell

- (_TtC20ProductPageExtension20ReviewsContainerCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension20ReviewsContainerCell *)sub_1001CADF8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension20ReviewsContainerCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001D64D4();
}

- (void)dealloc
{
  v2 = self;
  sub_1001CB39C();
}

- (void).cxx_destruct
{
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension20ReviewsContainerCell_itemLayoutContext, (uint64_t *)&unk_1009559B0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20ReviewsContainerCell_ratingsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20ReviewsContainerCell_tapToRateView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20ReviewsContainerCell_actionsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20ReviewsContainerCell_reviewSummaryView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20ReviewsContainerCell_ratingsSeparatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20ReviewsContainerCell_reviewsShelf));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20ReviewsContainerCell_noRatingsView));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20ReviewsContainerCell_editorsChoiceView));
  sub_1000194B0(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC20ProductPageExtension20ReviewsContainerCell_didSelectEditorsChoice));

  swift_unknownObjectRelease();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001CB5F4();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1001CA9F0();
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (void)didTapEditorsChoice
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC20ProductPageExtension20ReviewsContainerCell_didSelectEditorsChoice);
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_1000194C0((uint64_t)v2);
    v2(v3);
    sub_1000194B0((uint64_t)v2);
  }
}

@end