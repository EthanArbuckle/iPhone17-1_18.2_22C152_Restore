@interface AppPromotionDetailPageView
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (_TtC18ASMessagesProvider12HeaderButton)accessibilityCloseButton;
- (_TtC18ASMessagesProvider22SubscriptionLockupView)accessibilityLockupView;
- (_TtC18ASMessagesProvider26AppPromotionDetailPageView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider26AppPromotionDetailPageView)initWithFrame:(CGRect)a3;
- (_TtC18ASMessagesProvider29AppPromotionFormattedDateView)accessibilityFormattedDateView;
- (_TtC18ASMessagesProvider9VideoView)accessibilityVideoView;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDetailLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityKindLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (void)didTapCloseButton;
- (void)dismissTapGestureRecognized;
- (void)layoutSubviews;
- (void)scrollViewDidScroll:(id)a3;
@end

@implementation AppPromotionDetailPageView

- (_TtC18ASMessagesProvider26AppPromotionDetailPageView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_43A270();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_436CDC();
}

- (void)didTapCloseButton
{
  v2 = self;
  sub_26E22C();
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_A6B94();

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)dismissTapGestureRecognized
{
  v2 = self;
  sub_437EEC();
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
  char v9 = sub_43958C((int)v6, v7);

  return v9 & 1;
}

- (void)scrollViewDidScroll:(id)a3
{
  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider26AppPromotionDetailPageView_appPromotionCloseButtonAppearanceCoordinator))
  {
    id v4 = a3;
    v5 = self;
    swift_retain();
    sub_3945D4(v4);

    swift_release();
  }
}

- (_TtC18ASMessagesProvider29AppPromotionFormattedDateView)accessibilityFormattedDateView
{
  return (_TtC18ASMessagesProvider29AppPromotionFormattedDateView *)*(id *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider26AppPromotionDetailPageView_contentView) + OBJC_IVAR____TtC18ASMessagesProvider33AppPromotionDetailPageContentView_availabilityLabelView);
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityKindLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider26AppPromotionDetailPageView_contentView)
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider33AppPromotionDetailPageContentView_promotionKindLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider26AppPromotionDetailPageView_contentView)
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider33AppPromotionDetailPageContentView_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(void *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider26AppPromotionDetailPageView_contentView) + OBJC_IVAR____TtC18ASMessagesProvider33AppPromotionDetailPageContentView_subtitleView)
                                                                                                + qword_976E30));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDetailLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider26AppPromotionDetailPageView_contentView)
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider33AppPromotionDetailPageContentView_detailLabel));
}

- (_TtC18ASMessagesProvider12HeaderButton)accessibilityCloseButton
{
  return (_TtC18ASMessagesProvider12HeaderButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                           + OBJC_IVAR____TtC18ASMessagesProvider26AppPromotionDetailPageView_closeButton));
}

- (_TtC18ASMessagesProvider22SubscriptionLockupView)accessibilityLockupView
{
  return (_TtC18ASMessagesProvider22SubscriptionLockupView *)*(id *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider26AppPromotionDetailPageView_contentView) + OBJC_IVAR____TtC18ASMessagesProvider33AppPromotionDetailPageContentView_lockupView);
}

- (_TtC18ASMessagesProvider9VideoView)accessibilityVideoView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtC18ASMessagesProvider9VideoView *)Strong;
}

- (_TtC18ASMessagesProvider26AppPromotionDetailPageView)initWithFrame:(CGRect)a3
{
  result = (_TtC18ASMessagesProvider26AppPromotionDetailPageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_174B8((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider26AppPromotionDetailPageView_delegate);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider26AppPromotionDetailPageView_pageScrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider26AppPromotionDetailPageView_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider26AppPromotionDetailPageView_pageContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider26AppPromotionDetailPageView_mediaContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider26AppPromotionDetailPageView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider26AppPromotionDetailPageView_closeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider26AppPromotionDetailPageView_learnMoreView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider26AppPromotionDetailPageView_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider26AppPromotionDetailPageView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider26AppPromotionDetailPageView_borderView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider26AppPromotionDetailPageView_mediaReplicationView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider26AppPromotionDetailPageView_dismissTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider26AppPromotionDetailPageView_videoBackgroundColor));
  id v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider26AppPromotionDetailPageView_mediaOverlayStyle;
  uint64_t v4 = sub_771910();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
}

@end