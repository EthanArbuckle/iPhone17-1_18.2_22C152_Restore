@interface CarouselItemMaterialTextOverlay
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityHeadingLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTertiaryTitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC20ProductPageExtension31CarouselItemMaterialTextOverlay)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension31CarouselItemMaterialTextOverlay)initWithFrame:(CGRect)a3;
- (void)handleSelection:(id)a3;
- (void)layoutSubviews;
@end

@implementation CarouselItemMaterialTextOverlay

- (_TtC20ProductPageExtension31CarouselItemMaterialTextOverlay)initWithFrame:(CGRect)a3
{
  sub_1003F730C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC20ProductPageExtension31CarouselItemMaterialTextOverlay)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003FAA40();
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CarouselItemMaterialTextOverlay();
  v2 = (char *)v6.receiver;
  [(CarouselItemMaterialTextOverlay *)&v6 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension31CarouselItemMaterialTextOverlay_materialBackground];
  sub_100770A80();
  objc_msgSend(v3, "setFrame:");
  sub_1003F7F58(0, v5);
  sub_10000FA3C(v5, v5[3]);
  sub_100770A80();
  id v4 = [v2 traitCollection];
  sub_100779F60();

  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v5);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  sub_1003F7F58(1, v11);
  double v6 = sub_100730888((uint64_t)v11, width, height);
  double v8 = v7;
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v11);

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)handleSelection:(id)a3
{
  id v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC20ProductPageExtension31CarouselItemMaterialTextOverlay_selectionHandler);
  if (v3)
  {
    id v5 = a3;
    double v7 = self;
    uint64_t v6 = sub_1000194C0((uint64_t)v3);
    v3(v6);
    sub_1000194B0((uint64_t)v3);
  }
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityHeadingLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension31CarouselItemMaterialTextOverlay_badgeLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension31CarouselItemMaterialTextOverlay_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension31CarouselItemMaterialTextOverlay_descriptionLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTertiaryTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension31CarouselItemMaterialTextOverlay_callToActionLabel));
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension31CarouselItemMaterialTextOverlay_displayOptions;
  uint64_t v4 = sub_1007736C0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31CarouselItemMaterialTextOverlay_materialBackground));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31CarouselItemMaterialTextOverlay_badgeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31CarouselItemMaterialTextOverlay_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31CarouselItemMaterialTextOverlay_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31CarouselItemMaterialTextOverlay_callToActionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31CarouselItemMaterialTextOverlay_chevronView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31CarouselItemMaterialTextOverlay_tapGestureRecognizer));
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension31CarouselItemMaterialTextOverlay_selectionHandler);

  sub_1000194B0(v5);
}

@end