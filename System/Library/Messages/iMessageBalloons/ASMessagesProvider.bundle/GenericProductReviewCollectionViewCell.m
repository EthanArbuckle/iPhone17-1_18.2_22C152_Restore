@interface GenericProductReviewCollectionViewCell
- (_TtC18ASMessagesProvider38GenericProductReviewCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider38GenericProductReviewCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation GenericProductReviewCollectionViewCell

- (_TtC18ASMessagesProvider38GenericProductReviewCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider38GenericProductReviewCollectionViewCell *)sub_404DC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider38GenericProductReviewCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider38GenericProductReviewCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_771720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18ASMessagesProvider38GenericProductReviewCollectionViewCell_userReviewView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18ASMessagesProvider38GenericProductReviewCollectionViewCell_editorsChoiceReviewView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18ASMessagesProvider38GenericProductReviewCollectionViewCell_reviewSummaryView) = 0;
  id v7 = a3;

  result = (_TtC18ASMessagesProvider38GenericProductReviewCollectionViewCell *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_4083C();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_40A2C();
}

- (void).cxx_destruct
{
  sub_411F8((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider38GenericProductReviewCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider38GenericProductReviewCollectionViewCell_userReviewView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider38GenericProductReviewCollectionViewCell_editorsChoiceReviewView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider38GenericProductReviewCollectionViewCell_reviewSummaryView);
}

@end