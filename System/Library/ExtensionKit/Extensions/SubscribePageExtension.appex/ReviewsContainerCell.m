@interface ReviewsContainerCell
- (BOOL)_disableRasterizeInAnimations;
- (_TtC22SubscribePageExtension20ReviewsContainerCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension20ReviewsContainerCell)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)didTapEditorsChoice;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ReviewsContainerCell

- (_TtC22SubscribePageExtension20ReviewsContainerCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension20ReviewsContainerCell *)sub_10003C6DC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension20ReviewsContainerCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100046478();
}

- (void)dealloc
{
  v2 = self;
  sub_10003CC80();
}

- (void).cxx_destruct
{
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension20ReviewsContainerCell_itemLayoutContext, (uint64_t *)&unk_100934630);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20ReviewsContainerCell_ratingsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20ReviewsContainerCell_tapToRateView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20ReviewsContainerCell_actionsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20ReviewsContainerCell_reviewSummaryView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20ReviewsContainerCell_ratingsSeparatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20ReviewsContainerCell_reviewsShelf));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20ReviewsContainerCell_noRatingsView));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20ReviewsContainerCell_editorsChoiceView));
  sub_10001A4D0(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC22SubscribePageExtension20ReviewsContainerCell_didSelectEditorsChoice));

  swift_unknownObjectRelease();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10003CED8();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10003D558();
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (void)didTapEditorsChoice
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension20ReviewsContainerCell_didSelectEditorsChoice);
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_10001A4E0((uint64_t)v2);
    v2(v3);
    sub_10001A4D0((uint64_t)v2);
  }
}

@end