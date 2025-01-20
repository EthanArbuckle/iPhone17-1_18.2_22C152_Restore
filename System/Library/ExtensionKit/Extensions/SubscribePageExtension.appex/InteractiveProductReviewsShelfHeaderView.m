@interface InteractiveProductReviewsShelfHeaderView
- (_TtC22SubscribePageExtension40InteractiveProductReviewsShelfHeaderView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension40InteractiveProductReviewsShelfHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation InteractiveProductReviewsShelfHeaderView

- (_TtC22SubscribePageExtension40InteractiveProductReviewsShelfHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension40InteractiveProductReviewsShelfHeaderView *)sub_10023F6C4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension40InteractiveProductReviewsShelfHeaderView)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension40InteractiveProductReviewsShelfHeaderView_currentState;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  v4[40] = 1;
  id v5 = a3;

  result = (_TtC22SubscribePageExtension40InteractiveProductReviewsShelfHeaderView *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(InteractiveProductReviewsShelfHeaderView *)&v4 prepareForReuse];
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC22SubscribePageExtension40InteractiveProductReviewsShelfHeaderView_firstColumnLabel], "setText:", 0, v4.receiver, v4.super_class);
  [*(id *)&v2[OBJC_IVAR____TtC22SubscribePageExtension40InteractiveProductReviewsShelfHeaderView_pinnedLabel] setText:0];
  v3 = &v2[OBJC_IVAR____TtC22SubscribePageExtension40InteractiveProductReviewsShelfHeaderView_currentState];
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((void *)v3 + 4) = 0;
  v3[40] = 1;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100240090();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension40InteractiveProductReviewsShelfHeaderView_firstColumnLabel));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension40InteractiveProductReviewsShelfHeaderView_pinnedLabel);
}

@end