@interface ProductTapToRateView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC22SubscribePageExtension20ProductTapToRateView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension20ProductTapToRateView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ProductTapToRateView

- (_TtC22SubscribePageExtension20ProductTapToRateView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension20ProductTapToRateView *)sub_100030260(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension20ProductTapToRateView)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension20ProductTapToRateView_rateAction;
  uint64_t v6 = sub_10000FB44(&qword_100934020);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension20ProductTapToRateView_isSingleColumn) = 0;
  id v7 = a3;

  result = (_TtC22SubscribePageExtension20ProductTapToRateView *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v2 = v5.receiver;
  [(ProductTapToRateView *)&v5 layoutSubviews];
  sub_100030ED8(v4);
  sub_10000FE94(v4, v4[3]);
  [v2 bounds];
  id v3 = [v2 traitCollection];
  sub_100765900();

  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_100030ED8(v11);
  sub_10000FE94(v11, v11[3]);
  id v4 = [(ProductTapToRateView *)v3 traitCollection];
  sub_100765910();
  double v6 = v5;
  double v8 = v7;

  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v11);
  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20ProductTapToRateView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20ProductTapToRateView_ratingControl));
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension20ProductTapToRateView_rateAction, &qword_100934030);
}

@end