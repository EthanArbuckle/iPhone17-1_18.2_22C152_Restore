@interface PrivacyDefinitionCollectionViewCell
- (_TtC18ASMessagesProvider35PrivacyDefinitionCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider35PrivacyDefinitionCollectionViewCell)initWithFrame:(CGRect)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDefinitionLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation PrivacyDefinitionCollectionViewCell

- (_TtC18ASMessagesProvider35PrivacyDefinitionCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider35PrivacyDefinitionCollectionViewCell *)sub_33E36C();
}

- (_TtC18ASMessagesProvider35PrivacyDefinitionCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider35PrivacyDefinitionCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_771720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  id v7 = a3;

  result = (_TtC18ASMessagesProvider35PrivacyDefinitionCollectionViewCell *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_33DD6C();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_33E0D0();
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider35PrivacyDefinitionCollectionViewCell_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDefinitionLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider35PrivacyDefinitionCollectionViewCell_definitionLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider35PrivacyDefinitionCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider35PrivacyDefinitionCollectionViewCell_definitionLabel));
  v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider35PrivacyDefinitionCollectionViewCell_itemLayoutContext;

  sub_411F8((uint64_t)v3);
}

@end