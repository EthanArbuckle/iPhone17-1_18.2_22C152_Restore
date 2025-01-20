@interface PrivacyDefinitionCollectionViewCell
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDefinitionLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC22SubscribePageExtension35PrivacyDefinitionCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension35PrivacyDefinitionCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation PrivacyDefinitionCollectionViewCell

- (_TtC22SubscribePageExtension35PrivacyDefinitionCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension35PrivacyDefinitionCollectionViewCell *)sub_1001647A0();
}

- (_TtC22SubscribePageExtension35PrivacyDefinitionCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension35PrivacyDefinitionCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_10075B720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  id v7 = a3;

  result = (_TtC22SubscribePageExtension35PrivacyDefinitionCollectionViewCell *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001641A0();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_100164504();
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension35PrivacyDefinitionCollectionViewCell_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDefinitionLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension35PrivacyDefinitionCollectionViewCell_definitionLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35PrivacyDefinitionCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35PrivacyDefinitionCollectionViewCell_definitionLabel));
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension35PrivacyDefinitionCollectionViewCell_itemLayoutContext;

  sub_10002D20C((uint64_t)v3);
}

@end