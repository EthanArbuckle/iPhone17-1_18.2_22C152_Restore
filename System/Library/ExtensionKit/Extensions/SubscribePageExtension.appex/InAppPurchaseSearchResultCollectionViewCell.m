@interface InAppPurchaseSearchResultCollectionViewCell
- (_TtC22SubscribePageExtension43InAppPurchaseSearchResultCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension43InAppPurchaseSearchResultCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation InAppPurchaseSearchResultCollectionViewCell

- (_TtC22SubscribePageExtension43InAppPurchaseSearchResultCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension43InAppPurchaseSearchResultCollectionViewCell *)sub_10051AAB8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension43InAppPurchaseSearchResultCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC22SubscribePageExtension43InAppPurchaseSearchResultCollectionViewCell_metrics;
  uint64_t v5 = qword_100931E38;
  id v6 = a3;
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_100757040();
  uint64_t v8 = sub_10001076C(v7, (uint64_t)qword_100994FD8);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))((char *)self + v4, v8, v7);
  uint64_t v9 = OBJC_IVAR____TtC22SubscribePageExtension43InAppPurchaseSearchResultCollectionViewCell_bodyBackgroundColor;
  sub_10001A860(0, (unint64_t *)&qword_100933F20);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v9) = (Class)sub_1007682E0();

  result = (_TtC22SubscribePageExtension43InAppPurchaseSearchResultCollectionViewCell *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10051B5F4();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_10051BA9C(a3);
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension43InAppPurchaseSearchResultCollectionViewCell_metrics;
  uint64_t v4 = sub_100757040();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension43InAppPurchaseSearchResultCollectionViewCell_bodyBackgroundColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension43InAppPurchaseSearchResultCollectionViewCell_inAppPurchaseLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension43InAppPurchaseSearchResultCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension43InAppPurchaseSearchResultCollectionViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension43InAppPurchaseSearchResultCollectionViewCell_offerButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension43InAppPurchaseSearchResultCollectionViewCell_body));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension43InAppPurchaseSearchResultCollectionViewCell_iconView));
  id v5 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension43InAppPurchaseSearchResultCollectionViewCell_inAppDescription);
}

@end