@interface ReviewsContainerCell
- (BOOL)_disableRasterizeInAnimations;
- (_TtC18ASMessagesProvider20ReviewsContainerCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider20ReviewsContainerCell)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)didTapEditorsChoice;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ReviewsContainerCell

- (_TtC18ASMessagesProvider20ReviewsContainerCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider20ReviewsContainerCell *)sub_1EF218(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider20ReviewsContainerCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1F8EE8();
}

- (void)dealloc
{
  v2 = self;
  sub_1EF7BC();
}

- (void).cxx_destruct
{
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider20ReviewsContainerCell_itemLayoutContext, (uint64_t *)&unk_95C250);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider20ReviewsContainerCell_ratingsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider20ReviewsContainerCell_tapToRateView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider20ReviewsContainerCell_actionsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider20ReviewsContainerCell_reviewSummaryView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider20ReviewsContainerCell_ratingsSeparatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider20ReviewsContainerCell_reviewsShelf));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider20ReviewsContainerCell_noRatingsView));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider20ReviewsContainerCell_editorsChoiceView));
  sub_13308(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                       + OBJC_IVAR____TtC18ASMessagesProvider20ReviewsContainerCell_didSelectEditorsChoice));

  swift_unknownObjectRelease();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1EFA14();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1F0094();
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (void)didTapEditorsChoice
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC18ASMessagesProvider20ReviewsContainerCell_didSelectEditorsChoice);
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_13318((uint64_t)v2);
    v2(v3);
    sub_13308((uint64_t)v2);
  }
}

@end