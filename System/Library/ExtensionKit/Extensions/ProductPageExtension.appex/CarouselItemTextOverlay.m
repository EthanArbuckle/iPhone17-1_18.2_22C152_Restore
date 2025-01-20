@interface CarouselItemTextOverlay
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityHeadingLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC20ProductPageExtension23CarouselItemTextOverlay)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension23CarouselItemTextOverlay)initWithFrame:(CGRect)a3;
- (void)handleSelection:(id)a3;
- (void)layoutSubviews;
@end

@implementation CarouselItemTextOverlay

- (_TtC20ProductPageExtension23CarouselItemTextOverlay)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension23CarouselItemTextOverlay *)sub_10010AE14(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension23CarouselItemTextOverlay)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10010D288();
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CarouselItemTextOverlay();
  id v2 = v5.receiver;
  [(CarouselItemTextOverlay *)&v5 layoutSubviews];
  sub_10010B728(v4);
  sub_10000FA3C(v4, v4[3]);
  sub_100770A80();
  id v3 = [v2 traitCollection];
  sub_100779F60();

  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  objc_super v5 = self;
  sub_10010B728(v11);
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
                                      + OBJC_IVAR____TtC20ProductPageExtension23CarouselItemTextOverlay_selectionHandler);
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
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension23CarouselItemTextOverlay_badgeLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension23CarouselItemTextOverlay_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension23CarouselItemTextOverlay_callToActionLabel));
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension23CarouselItemTextOverlay_displayOptions;
  uint64_t v4 = sub_1007736C0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23CarouselItemTextOverlay_badgeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23CarouselItemTextOverlay_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23CarouselItemTextOverlay_callToActionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23CarouselItemTextOverlay_tapGestureRecognizer));
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension23CarouselItemTextOverlay_selectionHandler);

  sub_1000194B0(v5);
}

@end