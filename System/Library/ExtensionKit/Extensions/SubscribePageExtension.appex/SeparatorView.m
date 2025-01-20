@interface SeparatorView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC22SubscribePageExtension13SeparatorView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension13SeparatorView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SeparatorView

- (_TtC22SubscribePageExtension13SeparatorView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension13SeparatorView *)sub_1006D24C8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension13SeparatorView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1006D2E78();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  uint64_t v5 = sub_100765A30();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension13SeparatorView_separator;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v10, v5);
  v11 = self;
  sub_1007659F0();
  double v13 = v12;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);

  double v14 = width;
  double v15 = v13;
  result.height = v15;
  result.CGFloat width = v14;
  return result;
}

- (CGSize)intrinsicContentSize
{
  uint64_t v3 = sub_100765A30();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension13SeparatorView_separator;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v8, v3);
  v9 = self;
  sub_1007659F0();
  double v11 = v10;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);

  double v12 = UIViewNoIntrinsicMetric;
  double v13 = v11;
  result.height = v13;
  result.CGFloat width = v12;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1006D29EC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension13SeparatorView_lineView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension13SeparatorView_lineColor));
  sub_1000126F4((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension13SeparatorView_lineCompositingFilter);
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension13SeparatorView_separator;
  uint64_t v4 = sub_100765A30();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end