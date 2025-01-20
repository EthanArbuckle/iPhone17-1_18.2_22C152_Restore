@interface ProductReviewsShelfHeaderView
- (_TtC18ASMessagesProvider29ProductReviewsShelfHeaderView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider29ProductReviewsShelfHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)sortButtonTapped;
@end

@implementation ProductReviewsShelfHeaderView

- (_TtC18ASMessagesProvider29ProductReviewsShelfHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider29ProductReviewsShelfHeaderView *)sub_547A24(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider29ProductReviewsShelfHeaderView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC18ASMessagesProvider29ProductReviewsShelfHeaderView_sortButtonAction);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC18ASMessagesProvider29ProductReviewsShelfHeaderView *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_547E34();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_548B64();
}

- (void)sortButtonTapped
{
  v2 = self;
  sub_548F64();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider29ProductReviewsShelfHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider29ProductReviewsShelfHeaderView_sortButton));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC18ASMessagesProvider29ProductReviewsShelfHeaderView_sortButtonAction);

  sub_13308(v3);
}

@end