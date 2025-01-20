@interface PrivacyTypeCollectionViewCell
- (NSArray)accessibilityCategoryViews;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDetailLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC20ProductPageExtension29PrivacyTypeCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension29PrivacyTypeCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)lowMemoryWarning:(id)a3;
- (void)prepareForReuse;
@end

@implementation PrivacyTypeCollectionViewCell

- (_TtC20ProductPageExtension29PrivacyTypeCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension29PrivacyTypeCollectionViewCell *)sub_10049545C();
}

- (_TtC20ProductPageExtension29PrivacyTypeCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100495F64();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100493DDC();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_100491590();
}

- (void)lowMemoryWarning:(id)a3
{
  uint64_t v4 = sub_100769D10();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100769CE0();
  swift_beginAccess();
  v8 = self;
  sub_10000D280(&qword_1009631E8);
  sub_100779FB0();
  swift_endAccess();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension29PrivacyTypeCollectionViewCell_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDetailLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension29PrivacyTypeCollectionViewCell_detailLabel));
}

- (NSArray)accessibilityCategoryViews
{
  swift_beginAccess();
  type metadata accessor for PrivacyCategoryView();
  swift_bridgeObjectRetain();
  v2.super.isa = sub_10077BEC0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension29PrivacyTypeCollectionViewCell_contentContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension29PrivacyTypeCollectionViewCell_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension29PrivacyTypeCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension29PrivacyTypeCollectionViewCell_detailLabel));
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension29PrivacyTypeCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_1009559B0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension29PrivacyTypeCollectionViewCell_shadowView));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension29PrivacyTypeCollectionViewCell_categoryReusePool;
  uint64_t v4 = sub_10000D280(&qword_1009631E8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension29PrivacyTypeCollectionViewCell_style;
  uint64_t v6 = sub_10076F200();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension29PrivacyTypeCollectionViewCell_separatorView));
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension29PrivacyTypeCollectionViewCell_separator, (uint64_t *)&unk_10094E4E0);
}

@end