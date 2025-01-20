@interface PrivacyHeaderCollectionViewCell
- (NSArray)accessibilitySupplementaryItemLabels;
- (_TtC20ProductPageExtension22DynamicTypeLinkedLabel)accessibilityBodyLabel;
- (_TtC20ProductPageExtension31PrivacyHeaderCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension31PrivacyHeaderCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation PrivacyHeaderCollectionViewCell

- (_TtC20ProductPageExtension31PrivacyHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension31PrivacyHeaderCollectionViewCell *)sub_100101AD0();
}

- (_TtC20ProductPageExtension31PrivacyHeaderCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100102088();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100100E90();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1001012E4();
}

- (_TtC20ProductPageExtension22DynamicTypeLinkedLabel)accessibilityBodyLabel
{
  return (_TtC20ProductPageExtension22DynamicTypeLinkedLabel *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension31PrivacyHeaderCollectionViewCell_bodyLabel);
}

- (NSArray)accessibilitySupplementaryItemLabels
{
  swift_beginAccess();
  type metadata accessor for DynamicTypeLinkedLabel();
  swift_bridgeObjectRetain();
  v2.super.isa = sub_10077BEC0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31PrivacyHeaderCollectionViewCell_bodyLabel));
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31PrivacyHeaderCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_1009559B0);
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31PrivacyHeaderCollectionViewCell_bodyText, &qword_10094E908);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension31PrivacyHeaderCollectionViewCell_supplementaryItemReusePool;
  uint64_t v4 = sub_10000D280(&qword_1009519E8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31PrivacyHeaderCollectionViewCell_topSeparatorView));
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31PrivacyHeaderCollectionViewCell_topSeparator, (uint64_t *)&unk_10094E4E0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31PrivacyHeaderCollectionViewCell_middleSeparatorView));
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31PrivacyHeaderCollectionViewCell_middleSeparator, (uint64_t *)&unk_10094E4E0);
}

@end