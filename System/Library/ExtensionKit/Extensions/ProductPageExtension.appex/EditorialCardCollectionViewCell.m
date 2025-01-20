@interface EditorialCardCollectionViewCell
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityCaptionLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC20ProductPageExtension19CrossLinkLockupView)accessibilityLockupView;
- (_TtC20ProductPageExtension29AppPromotionFormattedDateView)accessibilityAppPromotionFormattedDateView;
- (_TtC20ProductPageExtension31EditorialCardCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension31EditorialCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)handleTapWithGestureRecognizer:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)stateChangedFor:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation EditorialCardCollectionViewCell

- (_TtC20ProductPageExtension31EditorialCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension31EditorialCardCollectionViewCell *)sub_1003DEED4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension31EditorialCardCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003E3490();
}

- (void)dealloc
{
  v2 = self;
  sub_1003E03D0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_cardContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_cardView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_avatarShowcase));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_captionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_gradientBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_lockupView));
  sub_1000194B0(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_lockupViewTappedAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_appEventFormattedDateView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_longPressGestureRecognizer));
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_clickAction, &qword_10095BF20);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003E08BC();
}

- (void)stateChangedFor:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1003E0FF4(v4);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1003DDD9C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1003E1E08(a3);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return swift_dynamicCastObjCClass() == 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  BOOL v9 = sub_1003E2120(v6, v7);

  return v9;
}

- (void)handleTapWithGestureRecognizer:(id)a3
{
  id v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_lockupViewTappedAction);
  if (v3)
  {
    id v5 = a3;
    id v7 = self;
    uint64_t v6 = sub_1000194C0((uint64_t)v3);
    v3(v6);
    sub_1000194B0((uint64_t)v3);
  }
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityCaptionLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_captionLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_subtitleLabel));
}

- (_TtC20ProductPageExtension19CrossLinkLockupView)accessibilityLockupView
{
  return (_TtC20ProductPageExtension19CrossLinkLockupView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_lockupView);
}

- (_TtC20ProductPageExtension29AppPromotionFormattedDateView)accessibilityAppPromotionFormattedDateView
{
  return (_TtC20ProductPageExtension29AppPromotionFormattedDateView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension31EditorialCardCollectionViewCell_appEventFormattedDateView);
}

@end