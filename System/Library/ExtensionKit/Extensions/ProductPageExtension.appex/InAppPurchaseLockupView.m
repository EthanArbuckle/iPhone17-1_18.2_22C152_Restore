@interface InAppPurchaseLockupView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDescriptionLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC20ProductPageExtension11OfferButton)accessibilityOfferButton;
- (_TtC20ProductPageExtension23InAppPurchaseLockupView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension23InAppPurchaseLockupView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)tintColorDidChange;
@end

@implementation InAppPurchaseLockupView

- (_TtC20ProductPageExtension23InAppPurchaseLockupView)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension23InAppPurchaseLockupView_theme;
  uint64_t v6 = enum case for InAppPurchaseTheme.infer(_:);
  uint64_t v7 = sub_10076B050();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 104))(v5, v6, v7);
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC20ProductPageExtension23InAppPurchaseLockupView_isHeightConstrained) = 0;
  id v8 = a3;

  result = (_TtC20ProductPageExtension23InAppPurchaseLockupView *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)tintColorDidChange
{
  v2 = self;
  sub_1000C8B08();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000C8E68();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v3 = qword_100947BA8;
  v4 = self;
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_10076B3A0();
  sub_10000D2C4(v5, (uint64_t)qword_1009A7840);
  sub_10076B3C0();
  sub_1000C9A94(&qword_100950438, (void (*)(uint64_t))&type metadata accessor for InAppPurchaseLockupViewLayout);
  sub_100779A20();
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
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension23InAppPurchaseLockupView_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension23InAppPurchaseLockupView_subtitleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDescriptionLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension23InAppPurchaseLockupView_descriptionLabel));
}

- (_TtC20ProductPageExtension11OfferButton)accessibilityOfferButton
{
  return (_TtC20ProductPageExtension11OfferButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                            + OBJC_IVAR____TtC20ProductPageExtension23InAppPurchaseLockupView_offerButton));
}

- (_TtC20ProductPageExtension23InAppPurchaseLockupView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC20ProductPageExtension23InAppPurchaseLockupView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23InAppPurchaseLockupView_iconView));
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension23InAppPurchaseLockupView_theme;
  uint64_t v4 = sub_10076B050();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23InAppPurchaseLockupView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23InAppPurchaseLockupView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23InAppPurchaseLockupView_descriptionLabel));
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension23InAppPurchaseLockupView_offerButton);
}

@end