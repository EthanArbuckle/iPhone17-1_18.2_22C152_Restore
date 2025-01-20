@interface GenericProductReviewActionCollectionViewCell
- (_TtC22SubscribePageExtension44GenericProductReviewActionCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension44GenericProductReviewActionCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation GenericProductReviewActionCollectionViewCell

- (void)layoutSubviews
{
  v2 = self;
  sub_1002BA0D8();
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GenericProductReviewActionCollectionViewCell();
  id v2 = v3.receiver;
  [(GenericProductReviewActionCollectionViewCell *)&v3 prepareForReuse];
  sub_1002BA004(0);
  sub_1002BA010(0);
}

- (_TtC22SubscribePageExtension44GenericProductReviewActionCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (char *)self
     + OBJC_IVAR____TtC22SubscribePageExtension44GenericProductReviewActionCollectionViewCell_itemLayoutContext;
  uint64_t v9 = sub_10075B720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension44GenericProductReviewActionCollectionViewCell_productTapToRateView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension44GenericProductReviewActionCollectionViewCell_productReviewActionsView) = 0;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for GenericProductReviewActionCollectionViewCell();
  return -[GenericProductReviewActionCollectionViewCell initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtC22SubscribePageExtension44GenericProductReviewActionCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self
     + OBJC_IVAR____TtC22SubscribePageExtension44GenericProductReviewActionCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_10075B720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension44GenericProductReviewActionCollectionViewCell_productTapToRateView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension44GenericProductReviewActionCollectionViewCell_productReviewActionsView) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for GenericProductReviewActionCollectionViewCell();
  return [(GenericProductReviewActionCollectionViewCell *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_10002D20C((uint64_t)self+ OBJC_IVAR____TtC22SubscribePageExtension44GenericProductReviewActionCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension44GenericProductReviewActionCollectionViewCell_productTapToRateView));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension44GenericProductReviewActionCollectionViewCell_productReviewActionsView);
}

@end