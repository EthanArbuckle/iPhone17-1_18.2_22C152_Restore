@interface ProductDescriptionCollectionViewCell
- (_TtC20ProductPageExtension36ProductDescriptionCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension36ProductDescriptionCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ProductDescriptionCollectionViewCell

- (_TtC20ProductPageExtension36ProductDescriptionCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension36ProductDescriptionCollectionViewCell *)sub_1002D2304(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension36ProductDescriptionCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension36ProductDescriptionCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_10076FC20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  id v7 = a3;

  result = (_TtC20ProductPageExtension36ProductDescriptionCollectionViewCell *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1002D27F0();
}

- (void).cxx_destruct
{
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension36ProductDescriptionCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_1009559B0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36ProductDescriptionCollectionViewCell_bodyTextView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension36ProductDescriptionCollectionViewCell_developerLinkView);
}

@end