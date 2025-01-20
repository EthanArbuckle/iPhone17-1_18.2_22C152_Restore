@interface BaseLockupView
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityHeadingLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityOfferLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityOrdinalLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTertiaryTitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC22SubscribePageExtension11OfferButton)accessibilityOfferButton;
- (_TtC22SubscribePageExtension14BaseLockupView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension14BaseLockupView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation BaseLockupView

- (_TtC22SubscribePageExtension14BaseLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension14BaseLockupView *)sub_1005C14E0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension14BaseLockupView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005C225C();
}

- (void)dealloc
{
  v2 = self;
  sub_1005C1DE0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension14BaseLockupView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension14BaseLockupView_ordinalLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension14BaseLockupView_headingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension14BaseLockupView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension14BaseLockupView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension14BaseLockupView_tertiaryTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension14BaseLockupView_offerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension14BaseLockupView_offerButton));
  sub_1000126F4((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension14BaseLockupView_offerLabelPresenter);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension14BaseLockupView_titleTextColor));

  swift_unknownObjectRelease();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1005C1F94(a3);
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityOrdinalLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension14BaseLockupView_ordinalLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension14BaseLockupView_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension14BaseLockupView_subtitleLabel));
}

- (_TtC22SubscribePageExtension11OfferButton)accessibilityOfferButton
{
  return (_TtC22SubscribePageExtension11OfferButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                              + OBJC_IVAR____TtC22SubscribePageExtension14BaseLockupView_offerButton));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTertiaryTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension14BaseLockupView_tertiaryTitleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityHeadingLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension14BaseLockupView_headingLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityOfferLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension14BaseLockupView_offerLabel));
}

@end