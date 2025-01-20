@interface PosterLockupCollectionViewCell
- (NSString)accessibilityFallbackTitle;
- (UIView)accessibilityFooterView;
- (UIView)accessibilityHeadingView;
- (_TtC18ASMessagesProvider11OfferButton)accessibilityOfferButton;
- (_TtC18ASMessagesProvider30PosterLockupCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider30PosterLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (_TtC19AppStoreKitInternal11ArtworkView)acccessibilityEpicHeaderView;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)acccessibilityFallbackTitleView;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation PosterLockupCollectionViewCell

- (_TtC18ASMessagesProvider30PosterLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider30PosterLockupCollectionViewCell *)sub_7554D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider30PosterLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_756CE8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_755FB4();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_754AF4();
}

- (UIView)accessibilityHeadingView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                           + OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_headingView));
}

- (NSString)accessibilityFallbackTitle
{
  if (*(void *)&self->fallbackTitle[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_fallbackTitle])
  {
    swift_bridgeObjectRetain();
    NSString v2 = sub_77D640();
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
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_fallbackTitleView));
}

- (_TtC19AppStoreKitInternal11ArtworkView)acccessibilityEpicHeaderView
{
  return (_TtC19AppStoreKitInternal11ArtworkView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                           + OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_epicHeaderView));
}

- (_TtC18ASMessagesProvider11OfferButton)accessibilityOfferButton
{
  return (_TtC18ASMessagesProvider11OfferButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                          + OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_offerButton));
}

- (UIView)accessibilityFooterView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                           + OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_footerLabel));
}

- (void).cxx_destruct
{
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_95C250);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_headingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_epicHeaderView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_fallbackTitleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_offerButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_footerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_gradientView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_mediaViewContainer);
}

@end