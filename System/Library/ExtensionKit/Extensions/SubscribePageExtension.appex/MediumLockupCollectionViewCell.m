@interface MediumLockupCollectionViewCell
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC22SubscribePageExtension11OfferButton)accessibilityOfferButton;
- (_TtC22SubscribePageExtension30MediumLockupCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension30MediumLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MediumLockupCollectionViewCell

- (_TtC22SubscribePageExtension30MediumLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension30MediumLockupCollectionViewCell *)sub_10026174C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension30MediumLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100263D84();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100262864();
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension30MediumLockupCollectionViewCell_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension30MediumLockupCollectionViewCell_subtitleLabel));
}

- (_TtC22SubscribePageExtension11OfferButton)accessibilityOfferButton
{
  return (_TtC22SubscribePageExtension11OfferButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                              + OBJC_IVAR____TtC22SubscribePageExtension30MediumLockupCollectionViewCell_offerButton));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30MediumLockupCollectionViewCell_avatarShowcase));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30MediumLockupCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30MediumLockupCollectionViewCell_headingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30MediumLockupCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30MediumLockupCollectionViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30MediumLockupCollectionViewCell_tertiaryTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30MediumLockupCollectionViewCell_offerLabel));
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension30MediumLockupCollectionViewCell_offerLabelPresenter, &qword_1009360F0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30MediumLockupCollectionViewCell_offerButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30MediumLockupCollectionViewCell_separatorView));
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension30MediumLockupCollectionViewCell_separator, (uint64_t *)&unk_100945230);
}

@end