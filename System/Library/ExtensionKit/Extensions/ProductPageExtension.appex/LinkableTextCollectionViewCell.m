@interface LinkableTextCollectionViewCell
- (_TtC20ProductPageExtension22DynamicTypeLinkedLabel)accessibilityBodyLabel;
- (_TtC20ProductPageExtension30LinkableTextCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension30LinkableTextCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation LinkableTextCollectionViewCell

- (_TtC20ProductPageExtension30LinkableTextCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension30LinkableTextCollectionViewCell *)sub_10008DE78();
}

- (_TtC20ProductPageExtension30LinkableTextCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension30LinkableTextCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_10076FC20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension30LinkableTextCollectionViewCell_bodyText;
  uint64_t v8 = sub_10000D280(&qword_10094E900);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  id v9 = a3;

  result = (_TtC20ProductPageExtension30LinkableTextCollectionViewCell *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10008D904();
}

- (_TtC20ProductPageExtension22DynamicTypeLinkedLabel)accessibilityBodyLabel
{
  return (_TtC20ProductPageExtension22DynamicTypeLinkedLabel *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension30LinkableTextCollectionViewCell_bodyLabel);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30LinkableTextCollectionViewCell_bodyLabel));
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension30LinkableTextCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_1009559B0);
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension30LinkableTextCollectionViewCell_bodyText, &qword_10094E908);
}

@end