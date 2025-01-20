@interface ProductReviewsShelfHeaderView
- (_TtC22SubscribePageExtension29ProductReviewsShelfHeaderView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension29ProductReviewsShelfHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)sortButtonTapped;
@end

@implementation ProductReviewsShelfHeaderView

- (_TtC22SubscribePageExtension29ProductReviewsShelfHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension29ProductReviewsShelfHeaderView *)sub_1001E53B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension29ProductReviewsShelfHeaderView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC22SubscribePageExtension29ProductReviewsShelfHeaderView_sortButtonAction);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC22SubscribePageExtension29ProductReviewsShelfHeaderView *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1001E57C4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001E64F4();
}

- (void)sortButtonTapped
{
  v2 = self;
  sub_1001E68F4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29ProductReviewsShelfHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29ProductReviewsShelfHeaderView_sortButton));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension29ProductReviewsShelfHeaderView_sortButtonAction);

  sub_10001A4D0(v3);
}

@end