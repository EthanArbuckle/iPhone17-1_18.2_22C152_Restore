@interface QuoteCollectionViewCell
- (_TtC20ProductPageExtension23QuoteCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension23QuoteCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation QuoteCollectionViewCell

- (_TtC20ProductPageExtension23QuoteCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension23QuoteCollectionViewCell *)sub_1005CC154(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension23QuoteCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension23QuoteCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_10076FC20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC20ProductPageExtension23QuoteCollectionViewCell_preferredArtworkSize);
  void *v7 = 0;
  v7[1] = 0;
  id v8 = a3;

  result = (_TtC20ProductPageExtension23QuoteCollectionViewCell *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType();
  v2 = (char *)v13.receiver;
  [(QuoteCollectionViewCell *)&v13 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension23QuoteCollectionViewCell_quoteView];
  id v4 = objc_msgSend(v2, "contentView", v13.receiver, v13.super_class);
  sub_1000A7A80();
  sub_100770A80();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  objc_msgSend(v3, "setFrame:", v6, v8, v10, v12);
}

- (void).cxx_destruct
{
  sub_1000105B0((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension23QuoteCollectionViewCell_itemLayoutContext);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension23QuoteCollectionViewCell_quoteView);
}

@end