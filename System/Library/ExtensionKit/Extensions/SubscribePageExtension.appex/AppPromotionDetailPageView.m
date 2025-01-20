@interface AppPromotionDetailPageView
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDetailLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityKindLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC22SubscribePageExtension12HeaderButton)accessibilityCloseButton;
- (_TtC22SubscribePageExtension22SubscriptionLockupView)accessibilityLockupView;
- (_TtC22SubscribePageExtension26AppPromotionDetailPageView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension26AppPromotionDetailPageView)initWithFrame:(CGRect)a3;
- (_TtC22SubscribePageExtension29AppPromotionFormattedDateView)accessibilityFormattedDateView;
- (_TtC22SubscribePageExtension9VideoView)accessibilityVideoView;
- (void)didTapCloseButton;
- (void)dismissTapGestureRecognized;
- (void)layoutSubviews;
- (void)scrollViewDidScroll:(id)a3;
@end

@implementation AppPromotionDetailPageView

- (_TtC22SubscribePageExtension26AppPromotionDetailPageView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10059EC1C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10059B710();
}

- (void)didTapCloseButton
{
  v2 = self;
  sub_1000D7158();
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_1004E7CA8();

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)dismissTapGestureRecognized
{
  v2 = self;
  sub_10059C920();
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
  char v9 = sub_10059DFC0((int)v6, v7);

  return v9 & 1;
}

- (void)scrollViewDidScroll:(id)a3
{
  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension26AppPromotionDetailPageView_appPromotionCloseButtonAppearanceCoordinator))
  {
    id v4 = a3;
    v5 = self;
    swift_retain();
    sub_1003C5560(v4);

    swift_release();
  }
}

- (_TtC22SubscribePageExtension29AppPromotionFormattedDateView)accessibilityFormattedDateView
{
  return (_TtC22SubscribePageExtension29AppPromotionFormattedDateView *)*(id *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension26AppPromotionDetailPageView_contentView) + OBJC_IVAR____TtC22SubscribePageExtension33AppPromotionDetailPageContentView_availabilityLabelView);
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityKindLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension26AppPromotionDetailPageView_contentView)
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension33AppPromotionDetailPageContentView_promotionKindLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension26AppPromotionDetailPageView_contentView)
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension33AppPromotionDetailPageContentView_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(void *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension26AppPromotionDetailPageView_contentView) + OBJC_IVAR____TtC22SubscribePageExtension33AppPromotionDetailPageContentView_subtitleView)
                                                                                                + qword_1009428A0));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDetailLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension26AppPromotionDetailPageView_contentView)
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension33AppPromotionDetailPageContentView_detailLabel));
}

- (_TtC22SubscribePageExtension12HeaderButton)accessibilityCloseButton
{
  return (_TtC22SubscribePageExtension12HeaderButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                               + OBJC_IVAR____TtC22SubscribePageExtension26AppPromotionDetailPageView_closeButton));
}

- (_TtC22SubscribePageExtension22SubscriptionLockupView)accessibilityLockupView
{
  return (_TtC22SubscribePageExtension22SubscriptionLockupView *)*(id *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension26AppPromotionDetailPageView_contentView) + OBJC_IVAR____TtC22SubscribePageExtension33AppPromotionDetailPageContentView_lockupView);
}

- (_TtC22SubscribePageExtension9VideoView)accessibilityVideoView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtC22SubscribePageExtension9VideoView *)Strong;
}

- (_TtC22SubscribePageExtension26AppPromotionDetailPageView)initWithFrame:(CGRect)a3
{
  result = (_TtC22SubscribePageExtension26AppPromotionDetailPageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000FB1C((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension26AppPromotionDetailPageView_delegate);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension26AppPromotionDetailPageView_pageScrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension26AppPromotionDetailPageView_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension26AppPromotionDetailPageView_pageContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension26AppPromotionDetailPageView_mediaContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension26AppPromotionDetailPageView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension26AppPromotionDetailPageView_closeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension26AppPromotionDetailPageView_learnMoreView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension26AppPromotionDetailPageView_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension26AppPromotionDetailPageView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension26AppPromotionDetailPageView_borderView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension26AppPromotionDetailPageView_mediaReplicationView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension26AppPromotionDetailPageView_dismissTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension26AppPromotionDetailPageView_videoBackgroundColor));
  id v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension26AppPromotionDetailPageView_mediaOverlayStyle;
  uint64_t v4 = sub_10075B910();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
}

@end