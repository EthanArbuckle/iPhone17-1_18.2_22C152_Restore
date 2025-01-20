@interface ProductReviewActionsView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC22SubscribePageExtension24ProductReviewActionsView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension24ProductReviewActionsView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)supportWithSender:(id)a3;
- (void)writeReviewWithSender:(id)a3;
@end

@implementation ProductReviewActionsView

- (_TtC22SubscribePageExtension24ProductReviewActionsView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension24ProductReviewActionsView *)sub_10049B2B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension24ProductReviewActionsView)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension24ProductReviewActionsView_writeReviewAction;
  uint64_t v6 = sub_10000FB44((uint64_t *)&unk_1009443A0);
  v7 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  v7(v5, 1, 1, v6);
  v7((char *)self + OBJC_IVAR____TtC22SubscribePageExtension24ProductReviewActionsView_supportAction, 1, 1, v6);
  id v8 = a3;

  result = (_TtC22SubscribePageExtension24ProductReviewActionsView *)sub_100768A40();
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
  sub_10049CA10();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_10049CE3C(width, height);
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
                     + OBJC_IVAR____TtC22SubscribePageExtension24ProductReviewActionsView_writeReviewButton));
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension24ProductReviewActionsView_writeReviewAction, &qword_1009443B0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension24ProductReviewActionsView_supportButton));
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension24ProductReviewActionsView_supportAction, &qword_1009443B0);
}

@end