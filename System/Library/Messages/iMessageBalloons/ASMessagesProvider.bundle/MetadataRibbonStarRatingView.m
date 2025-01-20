@interface MetadataRibbonStarRatingView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC18ASMessagesProvider10RatingView)accessibilityStarRatingView;
- (_TtC18ASMessagesProvider28MetadataRibbonStarRatingView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider28MetadataRibbonStarRatingView)initWithFrame:(CGRect)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityRatingCountLabel;
- (void)layoutSubviews;
@end

@implementation MetadataRibbonStarRatingView

- (_TtC18ASMessagesProvider28MetadataRibbonStarRatingView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider28MetadataRibbonStarRatingView *)sub_4993E4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider28MetadataRibbonStarRatingView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_49ACCC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_4999CC();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  double v6 = sub_499CCC();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  swift_unknownObjectRelease();

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.var3 = v16;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (_TtC18ASMessagesProvider10RatingView)accessibilityStarRatingView
{
  return (_TtC18ASMessagesProvider10RatingView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                         + OBJC_IVAR____TtC18ASMessagesProvider28MetadataRibbonStarRatingView_starRatingView));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityRatingCountLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider28MetadataRibbonStarRatingView_ratingCountLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider28MetadataRibbonStarRatingView_starRatingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider28MetadataRibbonStarRatingView_ratingCountLabel));
  id v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider28MetadataRibbonStarRatingView_metrics;
  uint64_t v4 = sub_778690();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider28MetadataRibbonStarRatingView_id, (uint64_t *)&unk_9563B0);
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider28MetadataRibbonStarRatingView_itemType, &qword_9505D0);
}

@end