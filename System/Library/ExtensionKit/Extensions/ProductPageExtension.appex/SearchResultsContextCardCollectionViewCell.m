@interface SearchResultsContextCardCollectionViewCell
- (_TtC20ProductPageExtension42SearchResultsContextCardCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension42SearchResultsContextCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation SearchResultsContextCardCollectionViewCell

- (_TtC20ProductPageExtension42SearchResultsContextCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension42SearchResultsContextCardCollectionViewCell *)sub_1003C77B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension42SearchResultsContextCardCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self
     + OBJC_IVAR____TtC20ProductPageExtension42SearchResultsContextCardCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_10076FC20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  id v7 = a3;

  result = (_TtC20ProductPageExtension42SearchResultsContextCardCollectionViewCell *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(SearchResultsContextCardCollectionViewCell *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension42SearchResultsContextCardCollectionViewCell_content];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1003C7B6C();
}

- (void).cxx_destruct
{
  sub_1000105B0((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension42SearchResultsContextCardCollectionViewCell_itemLayoutContext);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension42SearchResultsContextCardCollectionViewCell_content);
}

@end