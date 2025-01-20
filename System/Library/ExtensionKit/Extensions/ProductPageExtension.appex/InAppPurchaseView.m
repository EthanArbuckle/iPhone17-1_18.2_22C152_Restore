@interface InAppPurchaseView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC20ProductPageExtension17InAppPurchaseView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension17InAppPurchaseView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation InAppPurchaseView

- (_TtC20ProductPageExtension17InAppPurchaseView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005B4F18();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1005B3A9C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_10076B210();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC20ProductPageExtension17InAppPurchaseView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC20ProductPageExtension17InAppPurchaseView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension17InAppPurchaseView_artworkContainingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension17InAppPurchaseView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension17InAppPurchaseView_plusView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension17InAppPurchaseView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension17InAppPurchaseView_tileIconArtworkView));
  id v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension17InAppPurchaseView_theme;
  uint64_t v4 = sub_10076B050();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  double v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension17InAppPurchaseView_metrics;
  uint64_t v6 = sub_10076B250();
  double v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end