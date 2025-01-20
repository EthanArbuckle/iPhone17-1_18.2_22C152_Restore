@interface ProductReviewsShelfHeaderView
- (_TtC20ProductPageExtension29ProductReviewsShelfHeaderView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension29ProductReviewsShelfHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)sortButtonTapped;
@end

@implementation ProductReviewsShelfHeaderView

- (_TtC20ProductPageExtension29ProductReviewsShelfHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension29ProductReviewsShelfHeaderView *)sub_1005DA3BC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension29ProductReviewsShelfHeaderView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC20ProductPageExtension29ProductReviewsShelfHeaderView_sortButtonAction);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC20ProductPageExtension29ProductReviewsShelfHeaderView *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1005DA7CC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1005DB008();
}

- (void)sortButtonTapped
{
  v2 = self;
  sub_1005DB408();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension29ProductReviewsShelfHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension29ProductReviewsShelfHeaderView_sortButton));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension29ProductReviewsShelfHeaderView_sortButtonAction);

  sub_1000194B0(v3);
}

@end