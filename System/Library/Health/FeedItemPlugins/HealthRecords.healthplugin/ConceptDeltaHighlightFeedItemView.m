@interface ConceptDeltaHighlightFeedItemView
- (_TtC13HealthRecords33ConceptDeltaHighlightFeedItemView)initWithCoder:(id)a3;
- (_TtC13HealthRecords33ConceptDeltaHighlightFeedItemView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ConceptDeltaHighlightFeedItemView

- (_TtC13HealthRecords33ConceptDeltaHighlightFeedItemView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_240926C2C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_240923B74(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_240924444();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for ConceptDeltaHighlightFeedItemView();
  [(ConceptDeltaHighlightFeedItemView *)&v3 layoutSubviews];
}

- (_TtC13HealthRecords33ConceptDeltaHighlightFeedItemView)initWithFrame:(CGRect)a3
{
  result = (_TtC13HealthRecords33ConceptDeltaHighlightFeedItemView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HealthRecords33ConceptDeltaHighlightFeedItemView_profile));
  sub_2408DA060((uint64_t)self + OBJC_IVAR____TtC13HealthRecords33ConceptDeltaHighlightFeedItemView_viewModel);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HealthRecords33ConceptDeltaHighlightFeedItemView____lazy_storage___leftGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HealthRecords33ConceptDeltaHighlightFeedItemView____lazy_storage___leftValueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HealthRecords33ConceptDeltaHighlightFeedItemView____lazy_storage___leftDateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HealthRecords33ConceptDeltaHighlightFeedItemView____lazy_storage___leftRangeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HealthRecords33ConceptDeltaHighlightFeedItemView____lazy_storage___rightGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HealthRecords33ConceptDeltaHighlightFeedItemView____lazy_storage___rightValueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HealthRecords33ConceptDeltaHighlightFeedItemView____lazy_storage___rightDateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HealthRecords33ConceptDeltaHighlightFeedItemView____lazy_storage___rightRangeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HealthRecords33ConceptDeltaHighlightFeedItemView____lazy_storage___containerLayoutGuide));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HealthRecords33ConceptDeltaHighlightFeedItemView____lazy_storage___deltaImageFont));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13HealthRecords33ConceptDeltaHighlightFeedItemView____lazy_storage___deltaImageView);
}

@end