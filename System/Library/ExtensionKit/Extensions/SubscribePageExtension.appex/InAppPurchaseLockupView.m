@interface InAppPurchaseLockupView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDescriptionLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC22SubscribePageExtension11OfferButton)accessibilityOfferButton;
- (_TtC22SubscribePageExtension23InAppPurchaseLockupView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension23InAppPurchaseLockupView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)tintColorDidChange;
@end

@implementation InAppPurchaseLockupView

- (_TtC22SubscribePageExtension23InAppPurchaseLockupView)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension23InAppPurchaseLockupView_theme;
  uint64_t v6 = enum case for InAppPurchaseTheme.infer(_:);
  uint64_t v7 = sub_100756C80();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 104))(v5, v6, v7);
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension23InAppPurchaseLockupView_isHeightConstrained) = 0;
  id v8 = a3;

  result = (_TtC22SubscribePageExtension23InAppPurchaseLockupView *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)tintColorDidChange
{
  v2 = self;
  sub_1005C8F08();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1005C9268();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v3 = qword_100932118;
  v4 = self;
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_100756FD0();
  sub_10001076C(v5, (uint64_t)qword_1009956E8);
  sub_100756FF0();
  sub_1005C9F70(&qword_100944888, (void (*)(uint64_t))&type metadata accessor for InAppPurchaseLockupViewLayout);
  sub_1007653C0();
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension23InAppPurchaseLockupView_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension23InAppPurchaseLockupView_subtitleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDescriptionLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension23InAppPurchaseLockupView_descriptionLabel));
}

- (_TtC22SubscribePageExtension11OfferButton)accessibilityOfferButton
{
  return (_TtC22SubscribePageExtension11OfferButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                              + OBJC_IVAR____TtC22SubscribePageExtension23InAppPurchaseLockupView_offerButton));
}

- (_TtC22SubscribePageExtension23InAppPurchaseLockupView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC22SubscribePageExtension23InAppPurchaseLockupView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23InAppPurchaseLockupView_iconView));
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension23InAppPurchaseLockupView_theme;
  uint64_t v4 = sub_100756C80();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23InAppPurchaseLockupView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23InAppPurchaseLockupView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23InAppPurchaseLockupView_descriptionLabel));
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension23InAppPurchaseLockupView_offerButton);
}

@end