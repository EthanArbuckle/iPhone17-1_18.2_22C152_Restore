@interface BundleView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC22SubscribePageExtension10BundleView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension10BundleView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation BundleView

- (_TtC22SubscribePageExtension10BundleView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension10BundleView *)sub_100725AC0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension10BundleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100726F44();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100726060();
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for BundleView();
  id v4 = a3;
  v5 = (char *)v9.receiver;
  [(BundleView *)&v9 traitCollectionDidChange:v4];
  v6 = *(void **)&v5[OBJC_IVAR____TtC22SubscribePageExtension10BundleView_titleLabel];
  id v7 = objc_msgSend(v5, "traitCollection", v9.receiver, v9.super_class);
  char v8 = sub_100767D10();

  [v6 setNumberOfLines:(v8 & 1) == 0];
  [v5 setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  uint64_t v5 = sub_100763FA0();
  uint64_t v6 = *(void *)(v5 - 8);
  __n128 v8 = __chkstk_darwin(v5, v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t, __n128))(v6 + 16))(v10, (char *)self + OBJC_IVAR____TtC22SubscribePageExtension10BundleView_iconStyle, v5, v8);
  v11 = self;
  double v12 = sub_1007268FC((uint64_t)v10, v11);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v10, v5);

  double v13 = width;
  double v14 = v12;
  result.height = v14;
  result.CGFloat width = v13;
  return result;
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension10BundleView_iconStyle;
  uint64_t v4 = sub_100763FA0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension10BundleView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension10BundleView_itemStack));
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension10BundleView_itemReusePool;
  uint64_t v6 = sub_10000FB44((uint64_t *)&unk_10095A8A0);
  uint64_t v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end