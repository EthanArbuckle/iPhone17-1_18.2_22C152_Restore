@interface PrivacyHeaderCollectionViewCell
- (NSArray)accessibilitySupplementaryItemLabels;
- (_TtC22SubscribePageExtension22DynamicTypeLinkedLabel)accessibilityBodyLabel;
- (_TtC22SubscribePageExtension31PrivacyHeaderCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension31PrivacyHeaderCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation PrivacyHeaderCollectionViewCell

- (_TtC22SubscribePageExtension31PrivacyHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension31PrivacyHeaderCollectionViewCell *)sub_1003DEBA0();
}

- (_TtC22SubscribePageExtension31PrivacyHeaderCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003DF158();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003DE018();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1003DE46C();
}

- (_TtC22SubscribePageExtension22DynamicTypeLinkedLabel)accessibilityBodyLabel
{
  return (_TtC22SubscribePageExtension22DynamicTypeLinkedLabel *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension31PrivacyHeaderCollectionViewCell_bodyLabel);
}

- (NSArray)accessibilitySupplementaryItemLabels
{
  swift_beginAccess();
  type metadata accessor for DynamicTypeLinkedLabel();
  swift_bridgeObjectRetain();
  v2.super.isa = sub_1007677F0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31PrivacyHeaderCollectionViewCell_bodyLabel));
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension31PrivacyHeaderCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_100934630);
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension31PrivacyHeaderCollectionViewCell_bodyText, &qword_10093B308);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = (char *)self
     + OBJC_IVAR____TtC22SubscribePageExtension31PrivacyHeaderCollectionViewCell_supplementaryItemReusePool;
  uint64_t v4 = sub_10000FB44(&qword_1009473E8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31PrivacyHeaderCollectionViewCell_topSeparatorView));
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension31PrivacyHeaderCollectionViewCell_topSeparator, (uint64_t *)&unk_100945230);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31PrivacyHeaderCollectionViewCell_middleSeparatorView));
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension31PrivacyHeaderCollectionViewCell_middleSeparator, (uint64_t *)&unk_100945230);
}

@end