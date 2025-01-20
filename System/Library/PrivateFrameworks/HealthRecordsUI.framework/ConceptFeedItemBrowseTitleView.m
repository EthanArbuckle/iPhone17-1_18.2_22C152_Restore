@interface ConceptFeedItemBrowseTitleView
- (_TtC15HealthRecordsUI30ConceptFeedItemBrowseTitleView)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI30ConceptFeedItemBrowseTitleView)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4;
@end

@implementation ConceptFeedItemBrowseTitleView

- (_TtC15HealthRecordsUI30ConceptFeedItemBrowseTitleView)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI30ConceptFeedItemBrowseTitleView *)ConceptFeedItemBrowseTitleView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI30ConceptFeedItemBrowseTitleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C232DFFC();
}

- (void)traitCollectionDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  v7 = self;
  sub_1C232E2D4(a4);
  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI30ConceptFeedItemBrowseTitleView_categoryIconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI30ConceptFeedItemBrowseTitleView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI30ConceptFeedItemBrowseTitleView_dateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI30ConceptFeedItemBrowseTitleView_chevronView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI30ConceptFeedItemBrowseTitleView____lazy_storage___bottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI30ConceptFeedItemBrowseTitleView____lazy_storage___dateChevronConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI30ConceptFeedItemBrowseTitleView____lazy_storage___dateTrailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI30ConceptFeedItemBrowseTitleView____lazy_storage___chevronTrailingConstraint));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI30ConceptFeedItemBrowseTitleView_headerImage));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI30ConceptFeedItemBrowseTitleView_categoryColor));
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI30ConceptFeedItemBrowseTitleView_viewData;
  sub_1C223B578((uint64_t)v3);
}

@end