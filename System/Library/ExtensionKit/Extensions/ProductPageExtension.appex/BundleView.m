@interface BundleView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC20ProductPageExtension10BundleView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension10BundleView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation BundleView

- (_TtC20ProductPageExtension10BundleView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension10BundleView *)sub_10054143C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension10BundleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005428C0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1005419DC();
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for BundleView();
  id v4 = a3;
  v5 = (char *)v9.receiver;
  [(BundleView *)&v9 traitCollectionDidChange:v4];
  v6 = *(void **)&v5[OBJC_IVAR____TtC20ProductPageExtension10BundleView_titleLabel];
  id v7 = objc_msgSend(v5, "traitCollection", v9.receiver, v9.super_class);
  char v8 = sub_10077C3E0();

  [v6 setNumberOfLines:(v8 & 1) == 0];
  [v5 setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  uint64_t v5 = sub_1007785F0();
  uint64_t v6 = *(void *)(v5 - 8);
  __n128 v7 = __chkstk_darwin(v5);
  objc_super v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t, __n128))(v6 + 16))(v9, (char *)self + OBJC_IVAR____TtC20ProductPageExtension10BundleView_iconStyle, v5, v7);
  v10 = self;
  double v11 = sub_100542278((uint64_t)v9, v10);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);

  double v12 = width;
  double v13 = v11;
  result.height = v13;
  result.CGFloat width = v12;
  return result;
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension10BundleView_iconStyle;
  uint64_t v4 = sub_1007785F0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension10BundleView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension10BundleView_itemStack));
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension10BundleView_itemReusePool;
  uint64_t v6 = sub_10000D280(&qword_100967800);
  __n128 v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end