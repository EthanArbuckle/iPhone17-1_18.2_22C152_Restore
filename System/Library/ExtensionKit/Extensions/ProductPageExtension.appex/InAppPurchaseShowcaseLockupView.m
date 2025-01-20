@interface InAppPurchaseShowcaseLockupView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC20ProductPageExtension31InAppPurchaseShowcaseLockupView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension31InAppPurchaseShowcaseLockupView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation InAppPurchaseShowcaseLockupView

- (_TtC20ProductPageExtension31InAppPurchaseShowcaseLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension31InAppPurchaseShowcaseLockupView *)sub_10044B160(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension31InAppPurchaseShowcaseLockupView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10044BF9C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10044B824();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  double v4 = sub_10044BB8C();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31InAppPurchaseShowcaseLockupView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31InAppPurchaseShowcaseLockupView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31InAppPurchaseShowcaseLockupView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31InAppPurchaseShowcaseLockupView_descriptionLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension31InAppPurchaseShowcaseLockupView_offerButton);
}

@end