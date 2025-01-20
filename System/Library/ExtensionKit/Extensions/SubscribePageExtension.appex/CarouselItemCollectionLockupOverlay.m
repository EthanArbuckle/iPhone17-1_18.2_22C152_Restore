@interface CarouselItemCollectionLockupOverlay
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityHeadingLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay)initWithFrame:(CGRect)a3;
- (void)handleSelection:(id)a3;
- (void)layoutSubviews;
@end

@implementation CarouselItemCollectionLockupOverlay

- (_TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay)initWithFrame:(CGRect)a3
{
  sub_10046BC38(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10046E430();
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CarouselItemCollectionLockupOverlay(0);
  v2 = (char *)v6.receiver;
  [(CarouselItemCollectionLockupOverlay *)&v6 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay_materialBackground];
  sub_10075C580();
  objc_msgSend(v3, "setFrame:");
  sub_10046C7BC(0, v5);
  sub_10000FE94(v5, v5[3]);
  sub_10075C580();
  id v4 = [v2 traitCollection];
  sub_100765900();

  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v5);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  sub_10046C7BC(1, v11);
  double v6 = sub_10074752C((uint64_t)v11, width, height);
  double v8 = v7;
  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v11);

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
                                      + OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay_selectionHandler);
  if (v3)
  {
    id v5 = a3;
    double v7 = self;
    uint64_t v6 = sub_10001A4E0((uint64_t)v3);
    v3(v6);
    sub_10001A4D0((uint64_t)v3);
  }
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityHeadingLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay_badgeLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay_descriptionLabel));
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay_displayOptions;
  uint64_t v4 = sub_10075F100();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay_materialBackground));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay_collectionArtwork));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay_badgeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay_chevronView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay_tapGestureRecognizer));
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay_selectionHandler);

  sub_10001A4D0(v5);
}

@end