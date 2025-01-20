@interface ProductReviewCollectionViewCell
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityAuthorLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDateLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityResponseDateLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityResponseTitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC22SubscribePageExtension10RatingView)accessibilityRatingView;
- (_TtC22SubscribePageExtension18ExpandableTextView)accessibilityBodyLabel;
- (_TtC22SubscribePageExtension18ExpandableTextView)accessibilityResponseBodyLabel;
- (_TtC22SubscribePageExtension31ProductReviewCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension31ProductReviewCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)moreResponseFrom:(id)a3;
- (void)moreReviewFrom:(id)a3;
- (void)prepareForReuse;
@end

@implementation ProductReviewCollectionViewCell

- (_TtC22SubscribePageExtension31ProductReviewCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension31ProductReviewCollectionViewCell *)sub_10029D3CC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension31ProductReviewCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension31ProductReviewCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_10075B720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = OBJC_IVAR____TtC22SubscribePageExtension31ProductReviewCollectionViewCell_reviewsView;
  type metadata accessor for ProductReviewView();
  id v8 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v9 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class)[v8 init];

  result = (_TtC22SubscribePageExtension31ProductReviewCollectionViewCell *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10029D824();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10029D908();
}

- (void)moreReviewFrom:(id)a3
{
}

- (void)moreResponseFrom:(id)a3
{
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension31ProductReviewCollectionViewCell_reviewsView)
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension17ProductReviewView_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDateLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension31ProductReviewCollectionViewCell_reviewsView)
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension17ProductReviewView_dateLabel));
}

- (_TtC22SubscribePageExtension10RatingView)accessibilityRatingView
{
  return (_TtC22SubscribePageExtension10RatingView *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension31ProductReviewCollectionViewCell_reviewsView)
                                                                                             + OBJC_IVAR____TtC22SubscribePageExtension17ProductReviewView_ratingView));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityAuthorLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension31ProductReviewCollectionViewCell_reviewsView)
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension17ProductReviewView_authorLabel));
}

- (_TtC22SubscribePageExtension18ExpandableTextView)accessibilityBodyLabel
{
  return (_TtC22SubscribePageExtension18ExpandableTextView *)*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension31ProductReviewCollectionViewCell_reviewsView) + OBJC_IVAR____TtC22SubscribePageExtension17ProductReviewView_bodyLabel);
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityResponseTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension31ProductReviewCollectionViewCell_reviewsView)
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension17ProductReviewView_responseTitleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityResponseDateLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension31ProductReviewCollectionViewCell_reviewsView)
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension17ProductReviewView_responseDateLabel));
}

- (_TtC22SubscribePageExtension18ExpandableTextView)accessibilityResponseBodyLabel
{
  return (_TtC22SubscribePageExtension18ExpandableTextView *)*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension31ProductReviewCollectionViewCell_reviewsView) + OBJC_IVAR____TtC22SubscribePageExtension17ProductReviewView_responseBodyLabel);
}

- (void).cxx_destruct
{
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension31ProductReviewCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_100934630);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension31ProductReviewCollectionViewCell_reviewsView);
}

@end