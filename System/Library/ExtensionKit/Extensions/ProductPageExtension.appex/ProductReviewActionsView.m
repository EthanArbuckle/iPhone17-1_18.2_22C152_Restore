@interface ProductReviewActionsView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC20ProductPageExtension24ProductReviewActionsView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension24ProductReviewActionsView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)supportWithSender:(id)a3;
- (void)writeReviewWithSender:(id)a3;
@end

@implementation ProductReviewActionsView

- (_TtC20ProductPageExtension24ProductReviewActionsView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension24ProductReviewActionsView *)sub_10074F06C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension24ProductReviewActionsView)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension24ProductReviewActionsView_writeReviewAction;
  uint64_t v6 = sub_10000D280(&qword_10095FAE0);
  v7 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  v7(v5, 1, 1, v6);
  v7((char *)self + OBJC_IVAR____TtC20ProductPageExtension24ProductReviewActionsView_supportAction, 1, 1, v6);
  id v8 = a3;

  result = (_TtC20ProductPageExtension24ProductReviewActionsView *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)writeReviewWithSender:(id)a3
{
}

- (void)supportWithSender:(id)a3
{
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1007507C8();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_100750BF4(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension24ProductReviewActionsView_writeReviewButton));
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension24ProductReviewActionsView_writeReviewAction, &qword_10095BF20);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension24ProductReviewActionsView_supportButton));
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension24ProductReviewActionsView_supportAction, &qword_10095BF20);
}

@end