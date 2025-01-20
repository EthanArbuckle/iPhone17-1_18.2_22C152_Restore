@interface SeparatorView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC20ProductPageExtension13SeparatorView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension13SeparatorView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SeparatorView

- (_TtC20ProductPageExtension13SeparatorView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension13SeparatorView *)sub_10062387C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension13SeparatorView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10062422C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  uint64_t v5 = sub_10077A090();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension13SeparatorView_separator;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v9, v5);
  v10 = self;
  sub_10077A050();
  double v12 = v11;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  double v13 = width;
  double v14 = v12;
  result.height = v14;
  result.CGFloat width = v13;
  return result;
}

- (CGSize)intrinsicContentSize
{
  uint64_t v3 = sub_10077A090();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension13SeparatorView_separator;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = self;
  sub_10077A050();
  double v10 = v9;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  double v11 = UIViewNoIntrinsicMetric;
  double v12 = v10;
  result.height = v12;
  result.CGFloat width = v11;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100623DA0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension13SeparatorView_lineView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension13SeparatorView_lineColor));
  sub_10001172C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension13SeparatorView_lineCompositingFilter);
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension13SeparatorView_separator;
  uint64_t v4 = sub_10077A090();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end