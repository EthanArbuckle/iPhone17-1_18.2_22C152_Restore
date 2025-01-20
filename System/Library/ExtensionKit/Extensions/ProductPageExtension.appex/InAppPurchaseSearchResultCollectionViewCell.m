@interface InAppPurchaseSearchResultCollectionViewCell
- (_TtC20ProductPageExtension43InAppPurchaseSearchResultCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension43InAppPurchaseSearchResultCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation InAppPurchaseSearchResultCollectionViewCell

- (_TtC20ProductPageExtension43InAppPurchaseSearchResultCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension43InAppPurchaseSearchResultCollectionViewCell *)sub_100598CE4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension43InAppPurchaseSearchResultCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC20ProductPageExtension43InAppPurchaseSearchResultCollectionViewCell_metrics;
  uint64_t v5 = qword_100949240;
  id v6 = a3;
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_10076B410();
  uint64_t v8 = sub_10000D2C4(v7, (uint64_t)qword_1009AB878);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))((char *)self + v4, v8, v7);
  uint64_t v9 = OBJC_IVAR____TtC20ProductPageExtension43InAppPurchaseSearchResultCollectionViewCell_bodyBackgroundColor;
  sub_100019840(0, (unint64_t *)&qword_10094BD10);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v9) = (Class)sub_10077C9C0();

  result = (_TtC20ProductPageExtension43InAppPurchaseSearchResultCollectionViewCell *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100599820();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_100599CC8(a3);
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension43InAppPurchaseSearchResultCollectionViewCell_metrics;
  uint64_t v4 = sub_10076B410();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension43InAppPurchaseSearchResultCollectionViewCell_bodyBackgroundColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension43InAppPurchaseSearchResultCollectionViewCell_inAppPurchaseLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension43InAppPurchaseSearchResultCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension43InAppPurchaseSearchResultCollectionViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension43InAppPurchaseSearchResultCollectionViewCell_offerButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension43InAppPurchaseSearchResultCollectionViewCell_body));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension43InAppPurchaseSearchResultCollectionViewCell_iconView));
  id v5 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension43InAppPurchaseSearchResultCollectionViewCell_inAppDescription);
}

@end