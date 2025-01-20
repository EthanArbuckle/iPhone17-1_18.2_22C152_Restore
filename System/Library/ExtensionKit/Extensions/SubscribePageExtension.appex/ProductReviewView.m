@interface ProductReviewView
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityAuthorLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDateLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityResponseDateLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityResponseTitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC22SubscribePageExtension10RatingView)accessibilityRatingView;
- (_TtC22SubscribePageExtension17ProductReviewView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension17ProductReviewView)initWithFrame:(CGRect)a3;
- (_TtC22SubscribePageExtension18ExpandableTextView)accessibilityBodyLabel;
- (_TtC22SubscribePageExtension18ExpandableTextView)accessibilityResponseBodyLabel;
- (void)layoutSubviews;
- (void)moreResponseFrom:(id)a3;
- (void)moreReviewFrom:(id)a3;
- (void)stateChangedFor:(id)a3;
@end

@implementation ProductReviewView

- (_TtC22SubscribePageExtension17ProductReviewView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension17ProductReviewView *)sub_10031BAE8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension17ProductReviewView)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC22SubscribePageExtension17ProductReviewView *)sub_10031FFE8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10031E80C();
}

- (void)stateChangedFor:(id)a3
{
  id v4 = a3;
  v7 = self;
  if ([v4 state] == (id)1)
  {
    v5 = *(void (**)(uint64_t))((char *)&v7->super.super.super.isa
                                        + OBJC_IVAR____TtC22SubscribePageExtension17ProductReviewView_actionHandler);
    if (v5)
    {
      uint64_t v6 = swift_retain();
      v5(v6);
      sub_10001A4D0((uint64_t)v5);
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
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension17ProductReviewView_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDateLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension17ProductReviewView_dateLabel));
}

- (_TtC22SubscribePageExtension10RatingView)accessibilityRatingView
{
  return (_TtC22SubscribePageExtension10RatingView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                             + OBJC_IVAR____TtC22SubscribePageExtension17ProductReviewView_ratingView));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityAuthorLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension17ProductReviewView_authorLabel));
}

- (_TtC22SubscribePageExtension18ExpandableTextView)accessibilityBodyLabel
{
  return (_TtC22SubscribePageExtension18ExpandableTextView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension17ProductReviewView_bodyLabel);
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityResponseTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension17ProductReviewView_responseTitleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityResponseDateLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension17ProductReviewView_responseDateLabel));
}

- (_TtC22SubscribePageExtension18ExpandableTextView)accessibilityResponseBodyLabel
{
  return (_TtC22SubscribePageExtension18ExpandableTextView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension17ProductReviewView_responseBodyLabel);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension17ProductReviewView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension17ProductReviewView_ratingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension17ProductReviewView_dateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension17ProductReviewView_authorLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension17ProductReviewView_dateAuthorLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension17ProductReviewView_bodyLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension17ProductReviewView_responseTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension17ProductReviewView_responseDateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension17ProductReviewView_responseBodyLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension17ProductReviewView_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension17ProductReviewView_roundedCornerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension17ProductReviewView_cardContentView));
  sub_10001A4D0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC22SubscribePageExtension17ProductReviewView_moreReviewTapHandler));
  sub_10001A4D0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC22SubscribePageExtension17ProductReviewView_moreResponseTapHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension17ProductReviewView_moreReviewTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension17ProductReviewView_moreResponseTapGestureRecognizer));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension17ProductReviewView_actionHandler);

  sub_10001A4D0(v3);
}

@end