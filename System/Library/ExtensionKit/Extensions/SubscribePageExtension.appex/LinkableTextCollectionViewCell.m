@interface LinkableTextCollectionViewCell
- (_TtC22SubscribePageExtension22DynamicTypeLinkedLabel)accessibilityBodyLabel;
- (_TtC22SubscribePageExtension30LinkableTextCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension30LinkableTextCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation LinkableTextCollectionViewCell

- (_TtC22SubscribePageExtension30LinkableTextCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension30LinkableTextCollectionViewCell *)sub_100395BA8();
}

- (_TtC22SubscribePageExtension30LinkableTextCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension30LinkableTextCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_10075B720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension30LinkableTextCollectionViewCell_bodyText;
  uint64_t v8 = sub_10000FB44(&qword_10093B300);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  id v9 = a3;

  result = (_TtC22SubscribePageExtension30LinkableTextCollectionViewCell *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003957D4();
}

- (_TtC22SubscribePageExtension22DynamicTypeLinkedLabel)accessibilityBodyLabel
{
  return (_TtC22SubscribePageExtension22DynamicTypeLinkedLabel *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension30LinkableTextCollectionViewCell_bodyLabel);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30LinkableTextCollectionViewCell_bodyLabel));
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension30LinkableTextCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_100934630);
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension30LinkableTextCollectionViewCell_bodyText, &qword_10093B308);
}

@end