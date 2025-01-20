@interface InAppPurchaseShowcaseCollectionViewCell
- (_TtC22SubscribePageExtension39InAppPurchaseShowcaseCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension39InAppPurchaseShowcaseCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation InAppPurchaseShowcaseCollectionViewCell

- (_TtC22SubscribePageExtension39InAppPurchaseShowcaseCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension39InAppPurchaseShowcaseCollectionViewCell *)sub_100667BA0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension39InAppPurchaseShowcaseCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self
     + OBJC_IVAR____TtC22SubscribePageExtension39InAppPurchaseShowcaseCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_10075B720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = OBJC_IVAR____TtC22SubscribePageExtension39InAppPurchaseShowcaseCollectionViewCell_lockupView;
  id v8 = objc_allocWithZone((Class)type metadata accessor for InAppPurchaseShowcaseLockupView());
  id v9 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class)objc_msgSend(v8, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);

  result = (_TtC22SubscribePageExtension39InAppPurchaseShowcaseCollectionViewCell *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for InAppPurchaseShowcaseCollectionViewCell();
  v2 = (char *)v11.receiver;
  [(InAppPurchaseShowcaseCollectionViewCell *)&v11 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension39InAppPurchaseShowcaseCollectionViewCell_lockupView];
  sub_10075C580();
  objc_msgSend(v3, "sizeThatFits:", v4, v5, v11.receiver, v11.super_class);
  double v7 = v6;
  double v9 = v8;
  sub_10075C580();
  double MinX = CGRectGetMinX(v12);
  if (qword_100932340 != -1) {
    swift_once();
  }
  objc_msgSend(v3, "setFrame:", MinX, *(double *)&qword_1009558A0, v7, v9);
}

- (void).cxx_destruct
{
  sub_10002D20C((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension39InAppPurchaseShowcaseCollectionViewCell_itemLayoutContext);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension39InAppPurchaseShowcaseCollectionViewCell_lockupView);
}

@end