@interface ProductRatingsCollectionViewCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC22SubscribePageExtension32ProductRatingsCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension32ProductRatingsCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ProductRatingsCollectionViewCell

- (_TtC22SubscribePageExtension32ProductRatingsCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension32ProductRatingsCollectionViewCell_itemLayoutContext;
  uint64_t v10 = sub_10075B720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension32ProductRatingsCollectionViewCell_productRatingView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension32ProductRatingsCollectionViewCell_productNoRatingsView) = 0;
  v14.receiver = self;
  v14.super_class = ObjectType;
  v11 = -[ProductRatingsCollectionViewCell initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
  id v12 = [(ProductRatingsCollectionViewCell *)v11 contentView];
  objc_msgSend(v12, "setLayoutMargins:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);

  return v11;
}

- (_TtC22SubscribePageExtension32ProductRatingsCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension32ProductRatingsCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_10075B720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension32ProductRatingsCollectionViewCell_productRatingView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension32ProductRatingsCollectionViewCell_productNoRatingsView) = 0;
  id v7 = a3;

  result = (_TtC22SubscribePageExtension32ProductRatingsCollectionViewCell *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10019292C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_100192A58(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void).cxx_destruct
{
  sub_10002D20C((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension32ProductRatingsCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32ProductRatingsCollectionViewCell_productRatingView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension32ProductRatingsCollectionViewCell_productNoRatingsView);
}

@end