@interface ProductReviewView
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityAuthorLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDateLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityResponseDateLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityResponseTitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC20ProductPageExtension10RatingView)accessibilityRatingView;
- (_TtC20ProductPageExtension17ProductReviewView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension17ProductReviewView)initWithFrame:(CGRect)a3;
- (_TtC20ProductPageExtension18ExpandableTextView)accessibilityBodyLabel;
- (_TtC20ProductPageExtension18ExpandableTextView)accessibilityResponseBodyLabel;
- (void)layoutSubviews;
- (void)moreResponseFrom:(id)a3;
- (void)moreReviewFrom:(id)a3;
- (void)stateChangedFor:(id)a3;
@end

@implementation ProductReviewView

- (_TtC20ProductPageExtension17ProductReviewView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension17ProductReviewView *)sub_1005F500C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension17ProductReviewView)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC20ProductPageExtension17ProductReviewView *)sub_1005F950C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1005F7D30();
}

- (void)stateChangedFor:(id)a3
{
  id v4 = a3;
  v7 = self;
  if ([v4 state] == (id)1)
  {
    v5 = *(void (**)(uint64_t))((char *)&v7->super.super.super.isa
                                        + OBJC_IVAR____TtC20ProductPageExtension17ProductReviewView_actionHandler);
    if (v5)
    {
      uint64_t v6 = swift_retain();
      v5(v6);
      sub_1000194B0((uint64_t)v5);
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)moreReviewFrom:(id)a3
{
}

- (void)moreResponseFrom:(id)a3
{
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension17ProductReviewView_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDateLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension17ProductReviewView_dateLabel));
}

- (_TtC20ProductPageExtension10RatingView)accessibilityRatingView
{
  return (_TtC20ProductPageExtension10RatingView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                           + OBJC_IVAR____TtC20ProductPageExtension17ProductReviewView_ratingView));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityAuthorLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension17ProductReviewView_authorLabel));
}

- (_TtC20ProductPageExtension18ExpandableTextView)accessibilityBodyLabel
{
  return (_TtC20ProductPageExtension18ExpandableTextView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension17ProductReviewView_bodyLabel);
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityResponseTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension17ProductReviewView_responseTitleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityResponseDateLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension17ProductReviewView_responseDateLabel));
}

- (_TtC20ProductPageExtension18ExpandableTextView)accessibilityResponseBodyLabel
{
  return (_TtC20ProductPageExtension18ExpandableTextView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension17ProductReviewView_responseBodyLabel);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension17ProductReviewView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension17ProductReviewView_ratingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension17ProductReviewView_dateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension17ProductReviewView_authorLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension17ProductReviewView_dateAuthorLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension17ProductReviewView_bodyLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension17ProductReviewView_responseTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension17ProductReviewView_responseDateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension17ProductReviewView_responseBodyLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension17ProductReviewView_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension17ProductReviewView_roundedCornerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension17ProductReviewView_cardContentView));
  sub_1000194B0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC20ProductPageExtension17ProductReviewView_moreReviewTapHandler));
  sub_1000194B0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC20ProductPageExtension17ProductReviewView_moreResponseTapHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension17ProductReviewView_moreReviewTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension17ProductReviewView_moreResponseTapGestureRecognizer));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension17ProductReviewView_actionHandler);

  sub_1000194B0(v3);
}

@end