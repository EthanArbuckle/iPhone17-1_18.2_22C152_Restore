@interface MediumLockupCollectionViewCell
- (_TtC18ASMessagesProvider11OfferButton)accessibilityOfferButton;
- (_TtC18ASMessagesProvider30MediumLockupCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider30MediumLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (void)layoutSubviews;
@end

@implementation MediumLockupCollectionViewCell

- (_TtC18ASMessagesProvider30MediumLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider30MediumLockupCollectionViewCell *)sub_27E77C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider30MediumLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_280DB4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_27F894();
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider30MediumLockupCollectionViewCell_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider30MediumLockupCollectionViewCell_subtitleLabel));
}

- (_TtC18ASMessagesProvider11OfferButton)accessibilityOfferButton
{
  return (_TtC18ASMessagesProvider11OfferButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                          + OBJC_IVAR____TtC18ASMessagesProvider30MediumLockupCollectionViewCell_offerButton));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider30MediumLockupCollectionViewCell_avatarShowcase));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider30MediumLockupCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider30MediumLockupCollectionViewCell_headingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider30MediumLockupCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider30MediumLockupCollectionViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider30MediumLockupCollectionViewCell_tertiaryTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider30MediumLockupCollectionViewCell_offerLabel));
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider30MediumLockupCollectionViewCell_offerLabelPresenter, (uint64_t *)&unk_951B40);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider30MediumLockupCollectionViewCell_offerButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider30MediumLockupCollectionViewCell_separatorView));
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider30MediumLockupCollectionViewCell_separator, &qword_95EE70);
}

@end