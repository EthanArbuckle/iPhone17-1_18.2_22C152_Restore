@interface EditorialCardCollectionViewCell
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityCaptionLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC22SubscribePageExtension19CrossLinkLockupView)accessibilityLockupView;
- (_TtC22SubscribePageExtension29AppPromotionFormattedDateView)accessibilityAppPromotionFormattedDateView;
- (_TtC22SubscribePageExtension31EditorialCardCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension31EditorialCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)handleTapWithGestureRecognizer:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)stateChangedFor:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation EditorialCardCollectionViewCell

- (_TtC22SubscribePageExtension31EditorialCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension31EditorialCardCollectionViewCell *)sub_1003438B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension31EditorialCardCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100347FD0();
}

- (void)dealloc
{
  v2 = self;
  sub_100344DB0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31EditorialCardCollectionViewCell_cardContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31EditorialCardCollectionViewCell_cardView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31EditorialCardCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31EditorialCardCollectionViewCell_avatarShowcase));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31EditorialCardCollectionViewCell_tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31EditorialCardCollectionViewCell_captionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31EditorialCardCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31EditorialCardCollectionViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31EditorialCardCollectionViewCell_gradientBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31EditorialCardCollectionViewCell_lockupView));
  sub_10001A4D0(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC22SubscribePageExtension31EditorialCardCollectionViewCell_lockupViewTappedAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31EditorialCardCollectionViewCell_appEventFormattedDateView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31EditorialCardCollectionViewCell_longPressGestureRecognizer));
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension31EditorialCardCollectionViewCell_clickAction, &qword_1009443B0);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10034529C();
}

- (void)stateChangedFor:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1003459D4(v4);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1003467A0();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100346948(a3);
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
  BOOL v9 = sub_100346C60(v6, v7);

  return v9;
}

- (void)handleTapWithGestureRecognizer:(id)a3
{
  id v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension31EditorialCardCollectionViewCell_lockupViewTappedAction);
  if (v3)
  {
    id v5 = a3;
    id v7 = self;
    uint64_t v6 = sub_10001A4E0((uint64_t)v3);
    v3(v6);
    sub_10001A4D0((uint64_t)v3);
  }
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension31EditorialCardCollectionViewCell_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityCaptionLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension31EditorialCardCollectionViewCell_captionLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension31EditorialCardCollectionViewCell_subtitleLabel));
}

- (_TtC22SubscribePageExtension19CrossLinkLockupView)accessibilityLockupView
{
  return (_TtC22SubscribePageExtension19CrossLinkLockupView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension31EditorialCardCollectionViewCell_lockupView);
}

- (_TtC22SubscribePageExtension29AppPromotionFormattedDateView)accessibilityAppPromotionFormattedDateView
{
  return (_TtC22SubscribePageExtension29AppPromotionFormattedDateView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension31EditorialCardCollectionViewCell_appEventFormattedDateView);
}

@end