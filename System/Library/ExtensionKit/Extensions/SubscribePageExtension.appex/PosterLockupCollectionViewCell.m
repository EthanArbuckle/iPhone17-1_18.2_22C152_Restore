@interface PosterLockupCollectionViewCell
- (NSString)accessibilityFallbackTitle;
- (UIView)accessibilityFooterView;
- (UIView)accessibilityHeadingView;
- (_TtC19AppStoreKitInternal11ArtworkView)acccessibilityEpicHeaderView;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)acccessibilityFallbackTitleView;
- (_TtC22SubscribePageExtension11OfferButton)accessibilityOfferButton;
- (_TtC22SubscribePageExtension30PosterLockupCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension30PosterLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation PosterLockupCollectionViewCell

- (_TtC22SubscribePageExtension30PosterLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension30PosterLockupCollectionViewCell *)sub_100450644(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension30PosterLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100452014();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100451128();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10045158C();
}

- (UIView)accessibilityHeadingView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                           + OBJC_IVAR____TtC22SubscribePageExtension30PosterLockupCollectionViewCell_headingView));
}

- (NSString)accessibilityFallbackTitle
{
  if (*(void *)&self->fallbackTitle[OBJC_IVAR____TtC22SubscribePageExtension30PosterLockupCollectionViewCell_fallbackTitle])
  {
    swift_bridgeObjectRetain();
    NSString v2 = sub_1007675C0();
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
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension30PosterLockupCollectionViewCell_fallbackTitleView));
}

- (_TtC19AppStoreKitInternal11ArtworkView)acccessibilityEpicHeaderView
{
  return (_TtC19AppStoreKitInternal11ArtworkView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                           + OBJC_IVAR____TtC22SubscribePageExtension30PosterLockupCollectionViewCell_epicHeaderView));
}

- (_TtC22SubscribePageExtension11OfferButton)accessibilityOfferButton
{
  return (_TtC22SubscribePageExtension11OfferButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                              + OBJC_IVAR____TtC22SubscribePageExtension30PosterLockupCollectionViewCell_offerButton));
}

- (UIView)accessibilityFooterView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                           + OBJC_IVAR____TtC22SubscribePageExtension30PosterLockupCollectionViewCell_footerLabel));
}

- (void).cxx_destruct
{
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension30PosterLockupCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_100934630);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30PosterLockupCollectionViewCell_headingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30PosterLockupCollectionViewCell_epicHeaderView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30PosterLockupCollectionViewCell_fallbackTitleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30PosterLockupCollectionViewCell_offerButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30PosterLockupCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30PosterLockupCollectionViewCell_footerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30PosterLockupCollectionViewCell_gradientView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension30PosterLockupCollectionViewCell_mediaViewContainer);
}

@end