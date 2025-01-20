@interface InstallPagePreInstallFreeOfferView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC20ProductPageExtension34InstallPagePreInstallFreeOfferView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension34InstallPagePreInstallFreeOfferView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation InstallPagePreInstallFreeOfferView

- (_TtC20ProductPageExtension34InstallPagePreInstallFreeOfferView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension34InstallPagePreInstallFreeOfferView *)sub_1000DC0D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension34InstallPagePreInstallFreeOfferView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000DDA0C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  double v4 = sub_1000DD0E0();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000DD3FC();
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension34InstallPagePreInstallFreeOfferView_metrics;
  uint64_t v4 = sub_10076ACF0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension34InstallPagePreInstallFreeOfferView_inAppPurchaseView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension34InstallPagePreInstallFreeOfferView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension34InstallPagePreInstallFreeOfferView_parentTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension34InstallPagePreInstallFreeOfferView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension34InstallPagePreInstallFreeOfferView_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension34InstallPagePreInstallFreeOfferView_offerButton));
  double v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension34InstallPagePreInstallFreeOfferView_ageRatingBadge);
}

@end