@interface AppPromotionCardView
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityKindLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC22SubscribePageExtension20AppPromotionCardView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension20AppPromotionCardView)initWithFrame:(CGRect)a3;
- (_TtC22SubscribePageExtension22SubscriptionLockupView)accessibilityLockupView;
- (void)dealloc;
- (void)handleTapWithGestureRecognizer:(id)a3;
- (void)layoutSubviews;
@end

@implementation AppPromotionCardView

- (_TtC22SubscribePageExtension20AppPromotionCardView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension20AppPromotionCardView *)sub_1005EDA70();
}

- (_TtC22SubscribePageExtension20AppPromotionCardView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005EEB08();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_lockupTapGestureRecognizer);
  if (v4) {
    [v4 removeTarget:self action:0];
  }
  else {
    v5 = self;
  }
  v6.receiver = self;
  v6.super_class = ObjectType;
  [(AppPromotionCardView *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_mediaContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_artworkFallbackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_kindLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_borderView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_gradientBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_subtitleView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_lockupContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_lockupTapGestureRecognizer));
  sub_10001A4D0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_lockupViewTappedAction));

  swift_unknownObjectWeakDestroy();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1005EBDBC();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  double v4 = sub_1005EA2E4();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)handleTapWithGestureRecognizer:(id)a3
{
  id v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_lockupViewTappedAction);
  if (v3)
  {
    id v5 = a3;
    double v7 = self;
    uint64_t v6 = sub_10001A4E0((uint64_t)v3);
    v3(v6);
    sub_10001A4D0((uint64_t)v3);
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return swift_dynamicCastObjCClass() == 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  BOOL v9 = sub_1005EEC50(v7);

  return v9;
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityKindLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_kindLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_subtitleView)
                                                                                                + qword_1009428A0));
}

- (_TtC22SubscribePageExtension22SubscriptionLockupView)accessibilityLockupView
{
  return (_TtC22SubscribePageExtension22SubscriptionLockupView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_lockupView);
}

@end