@interface PrivacyHeaderCollectionViewCell
- (NSArray)accessibilitySupplementaryItemLabels;
- (_TtC18ASMessagesProvider22DynamicTypeLinkedLabel)accessibilityBodyLabel;
- (_TtC18ASMessagesProvider31PrivacyHeaderCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider31PrivacyHeaderCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation PrivacyHeaderCollectionViewCell

- (_TtC18ASMessagesProvider31PrivacyHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider31PrivacyHeaderCollectionViewCell *)sub_5057B0();
}

- (_TtC18ASMessagesProvider31PrivacyHeaderCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_505D68();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_504CA4();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_503B30();
}

- (_TtC18ASMessagesProvider22DynamicTypeLinkedLabel)accessibilityBodyLabel
{
  return (_TtC18ASMessagesProvider22DynamicTypeLinkedLabel *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider31PrivacyHeaderCollectionViewCell_bodyLabel);
}

- (NSArray)accessibilitySupplementaryItemLabels
{
  swift_beginAccess();
  type metadata accessor for DynamicTypeLinkedLabel();
  swift_bridgeObjectRetain();
  v2.super.isa = sub_77D880().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider31PrivacyHeaderCollectionViewCell_bodyLabel));
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider31PrivacyHeaderCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_95C250);
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider31PrivacyHeaderCollectionViewCell_bodyText, &qword_961A98);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider31PrivacyHeaderCollectionViewCell_supplementaryItemReusePool;
  uint64_t v4 = sub_FD50(&qword_96C700);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider31PrivacyHeaderCollectionViewCell_topSeparatorView));
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider31PrivacyHeaderCollectionViewCell_topSeparator, &qword_95EE70);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider31PrivacyHeaderCollectionViewCell_middleSeparatorView));
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider31PrivacyHeaderCollectionViewCell_middleSeparator, &qword_95EE70);
}

@end