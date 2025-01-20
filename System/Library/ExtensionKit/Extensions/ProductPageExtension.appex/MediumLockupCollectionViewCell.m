@interface MediumLockupCollectionViewCell
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC20ProductPageExtension11OfferButton)accessibilityOfferButton;
- (_TtC20ProductPageExtension30MediumLockupCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension30MediumLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MediumLockupCollectionViewCell

- (_TtC20ProductPageExtension30MediumLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension30MediumLockupCollectionViewCell *)sub_1002B7E8C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension30MediumLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002BA4C4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1002B8FA4();
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension30MediumLockupCollectionViewCell_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension30MediumLockupCollectionViewCell_subtitleLabel));
}

- (_TtC20ProductPageExtension11OfferButton)accessibilityOfferButton
{
  return (_TtC20ProductPageExtension11OfferButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                            + OBJC_IVAR____TtC20ProductPageExtension30MediumLockupCollectionViewCell_offerButton));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30MediumLockupCollectionViewCell_avatarShowcase));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30MediumLockupCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30MediumLockupCollectionViewCell_headingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30MediumLockupCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30MediumLockupCollectionViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30MediumLockupCollectionViewCell_tertiaryTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30MediumLockupCollectionViewCell_offerLabel));
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension30MediumLockupCollectionViewCell_offerLabelPresenter, &qword_10094BAD0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30MediumLockupCollectionViewCell_offerButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30MediumLockupCollectionViewCell_separatorView));
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension30MediumLockupCollectionViewCell_separator, (uint64_t *)&unk_10094E4E0);
}

@end