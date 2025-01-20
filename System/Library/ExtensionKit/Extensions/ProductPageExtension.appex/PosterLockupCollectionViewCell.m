@interface PosterLockupCollectionViewCell
- (NSString)accessibilityFallbackTitle;
- (UIView)accessibilityFooterView;
- (UIView)accessibilityHeadingView;
- (_TtC19AppStoreKitInternal11ArtworkView)acccessibilityEpicHeaderView;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)acccessibilityFallbackTitleView;
- (_TtC20ProductPageExtension11OfferButton)accessibilityOfferButton;
- (_TtC20ProductPageExtension30PosterLockupCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension30PosterLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation PosterLockupCollectionViewCell

- (_TtC20ProductPageExtension30PosterLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension30PosterLockupCollectionViewCell *)sub_1004A0184(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension30PosterLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1004A19D8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1004A0C68();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10049F7E4();
}

- (UIView)accessibilityHeadingView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                           + OBJC_IVAR____TtC20ProductPageExtension30PosterLockupCollectionViewCell_headingView));
}

- (NSString)accessibilityFallbackTitle
{
  if (*(void *)&self->fallbackTitle[OBJC_IVAR____TtC20ProductPageExtension30PosterLockupCollectionViewCell_fallbackTitle])
  {
    swift_bridgeObjectRetain();
    NSString v2 = sub_10077BC80();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)acccessibilityFallbackTitleView
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension30PosterLockupCollectionViewCell_fallbackTitleView));
}

- (_TtC19AppStoreKitInternal11ArtworkView)acccessibilityEpicHeaderView
{
  return (_TtC19AppStoreKitInternal11ArtworkView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                           + OBJC_IVAR____TtC20ProductPageExtension30PosterLockupCollectionViewCell_epicHeaderView));
}

- (_TtC20ProductPageExtension11OfferButton)accessibilityOfferButton
{
  return (_TtC20ProductPageExtension11OfferButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                            + OBJC_IVAR____TtC20ProductPageExtension30PosterLockupCollectionViewCell_offerButton));
}

- (UIView)accessibilityFooterView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                           + OBJC_IVAR____TtC20ProductPageExtension30PosterLockupCollectionViewCell_footerLabel));
}

- (void).cxx_destruct
{
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension30PosterLockupCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_1009559B0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30PosterLockupCollectionViewCell_headingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30PosterLockupCollectionViewCell_epicHeaderView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30PosterLockupCollectionViewCell_fallbackTitleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30PosterLockupCollectionViewCell_offerButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30PosterLockupCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30PosterLockupCollectionViewCell_footerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30PosterLockupCollectionViewCell_gradientView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension30PosterLockupCollectionViewCell_mediaViewContainer);
}

@end