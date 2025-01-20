@interface GenericProductReviewCollectionViewCell
- (_TtC22SubscribePageExtension38GenericProductReviewCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension38GenericProductReviewCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation GenericProductReviewCollectionViewCell

- (_TtC22SubscribePageExtension38GenericProductReviewCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension38GenericProductReviewCollectionViewCell *)sub_100034C0C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension38GenericProductReviewCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension38GenericProductReviewCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_10075B720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension38GenericProductReviewCollectionViewCell_userReviewView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension38GenericProductReviewCollectionViewCell_editorsChoiceReviewView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension38GenericProductReviewCollectionViewCell_reviewSummaryView) = 0;
  id v7 = a3;

  result = (_TtC22SubscribePageExtension38GenericProductReviewCollectionViewCell *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100034F6C();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10003515C();
}

- (void).cxx_destruct
{
  sub_10002D20C((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension38GenericProductReviewCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38GenericProductReviewCollectionViewCell_userReviewView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38GenericProductReviewCollectionViewCell_editorsChoiceReviewView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension38GenericProductReviewCollectionViewCell_reviewSummaryView);
}

@end