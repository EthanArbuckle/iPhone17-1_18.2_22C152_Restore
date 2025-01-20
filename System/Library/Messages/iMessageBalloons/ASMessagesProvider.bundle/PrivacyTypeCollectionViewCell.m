@interface PrivacyTypeCollectionViewCell
- (NSArray)accessibilityCategoryViews;
- (_TtC18ASMessagesProvider29PrivacyTypeCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider29PrivacyTypeCollectionViewCell)initWithFrame:(CGRect)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDetailLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (void)layoutSubviews;
- (void)lowMemoryWarning:(id)a3;
- (void)prepareForReuse;
@end

@implementation PrivacyTypeCollectionViewCell

- (_TtC18ASMessagesProvider29PrivacyTypeCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider29PrivacyTypeCollectionViewCell *)sub_91D54();
}

- (_TtC18ASMessagesProvider29PrivacyTypeCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_9285C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_8F9E0();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_90994();
}

- (void)lowMemoryWarning:(id)a3
{
  uint64_t v4 = sub_76B900();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_76B8D0();
  swift_beginAccess();
  v8 = self;
  sub_FD50(&qword_954108);
  sub_77B9C0();
  swift_endAccess();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider29PrivacyTypeCollectionViewCell_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDetailLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider29PrivacyTypeCollectionViewCell_detailLabel));
}

- (NSArray)accessibilityCategoryViews
{
  swift_beginAccess();
  type metadata accessor for PrivacyCategoryView();
  swift_bridgeObjectRetain();
  v2.super.isa = sub_77D880().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider29PrivacyTypeCollectionViewCell_contentContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider29PrivacyTypeCollectionViewCell_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider29PrivacyTypeCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider29PrivacyTypeCollectionViewCell_detailLabel));
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider29PrivacyTypeCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_95C250);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider29PrivacyTypeCollectionViewCell_shadowView));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider29PrivacyTypeCollectionViewCell_categoryReusePool;
  uint64_t v4 = sub_FD50(&qword_954108);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider29PrivacyTypeCollectionViewCell_style;
  uint64_t v6 = sub_770D00();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider29PrivacyTypeCollectionViewCell_separatorView));
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider29PrivacyTypeCollectionViewCell_separator, &qword_95EE70);
}

@end