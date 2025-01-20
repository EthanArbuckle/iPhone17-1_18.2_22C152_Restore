@interface PrivacyFooterCollectionViewCell
- (_TtC22SubscribePageExtension22DynamicTypeLinkedLabel)accessibilityBodyLabel;
- (_TtC22SubscribePageExtension31PrivacyFooterCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension31PrivacyFooterCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PrivacyFooterCollectionViewCell

- (_TtC22SubscribePageExtension31PrivacyFooterCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension31PrivacyFooterCollectionViewCell *)sub_1001679DC();
}

- (_TtC22SubscribePageExtension31PrivacyFooterCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension31PrivacyFooterCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_10075B720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension31PrivacyFooterCollectionViewCell_bodyText;
  uint64_t v8 = sub_10000FB44(&qword_10093B300);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  id v9 = a3;

  result = (_TtC22SubscribePageExtension31PrivacyFooterCollectionViewCell *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100167418();
}

- (_TtC22SubscribePageExtension22DynamicTypeLinkedLabel)accessibilityBodyLabel
{
  return (_TtC22SubscribePageExtension22DynamicTypeLinkedLabel *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension31PrivacyFooterCollectionViewCell_bodyLabel);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31PrivacyFooterCollectionViewCell_bodyLabel));
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension31PrivacyFooterCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_100934630);
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension31PrivacyFooterCollectionViewCell_bodyText, &qword_10093B308);
}

@end