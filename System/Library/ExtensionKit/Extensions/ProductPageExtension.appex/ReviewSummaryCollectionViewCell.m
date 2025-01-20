@interface ReviewSummaryCollectionViewCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC20ProductPageExtension31ReviewSummaryCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension31ReviewSummaryCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ReviewSummaryCollectionViewCell

- (_TtC20ProductPageExtension31ReviewSummaryCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension31ReviewSummaryCollectionViewCell *)sub_1000C9BB8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension31ReviewSummaryCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension31ReviewSummaryCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_10076FC20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = OBJC_IVAR____TtC20ProductPageExtension31ReviewSummaryCollectionViewCell_reviewSummaryView;
  id v8 = objc_allocWithZone((Class)type metadata accessor for ReviewSummaryView());
  id v9 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class)objc_msgSend(v8, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);

  result = (_TtC20ProductPageExtension31ReviewSummaryCollectionViewCell *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for ReviewSummaryCollectionViewCell();
  v2 = (char *)v12.receiver;
  [(ReviewSummaryCollectionViewCell *)&v12 layoutSubviews];
  id v3 = objc_msgSend(v2, "contentView", v12.receiver, v12.super_class);
  sub_1000A7A80();
  sub_100770A80();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC20ProductPageExtension31ReviewSummaryCollectionViewCell_reviewSummaryView], "setFrame:", v5, v7, v9, v11);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  id v4 = [(ReviewSummaryCollectionViewCell *)v3 traitCollection];
  double v5 = sub_1003EFA74();
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void).cxx_destruct
{
  sub_1000105B0((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31ReviewSummaryCollectionViewCell_itemLayoutContext);
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension31ReviewSummaryCollectionViewCell_reviewSummaryView);
}

@end