@interface GenericProductReviewCollectionViewCell
- (_TtC20ProductPageExtension38GenericProductReviewCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension38GenericProductReviewCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation GenericProductReviewCollectionViewCell

- (_TtC20ProductPageExtension38GenericProductReviewCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension38GenericProductReviewCollectionViewCell *)sub_10015A2F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension38GenericProductReviewCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension38GenericProductReviewCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_10076FC20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension38GenericProductReviewCollectionViewCell_userReviewView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension38GenericProductReviewCollectionViewCell_editorsChoiceReviewView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension38GenericProductReviewCollectionViewCell_reviewSummaryView) = 0;
  id v7 = a3;

  result = (_TtC20ProductPageExtension38GenericProductReviewCollectionViewCell *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10015A654();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10015A844();
}

- (void).cxx_destruct
{
  sub_1000105B0((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension38GenericProductReviewCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension38GenericProductReviewCollectionViewCell_userReviewView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension38GenericProductReviewCollectionViewCell_editorsChoiceReviewView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension38GenericProductReviewCollectionViewCell_reviewSummaryView);
}

@end