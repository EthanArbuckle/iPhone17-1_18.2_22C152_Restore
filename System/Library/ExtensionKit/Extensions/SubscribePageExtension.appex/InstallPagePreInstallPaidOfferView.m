@interface InstallPagePreInstallPaidOfferView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC22SubscribePageExtension34InstallPagePreInstallPaidOfferView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension34InstallPagePreInstallPaidOfferView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation InstallPagePreInstallPaidOfferView

- (_TtC22SubscribePageExtension34InstallPagePreInstallPaidOfferView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension34InstallPagePreInstallPaidOfferView *)sub_1006617E8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension34InstallPagePreInstallPaidOfferView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100662E14();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  double v4 = sub_100662560();
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
  sub_100662884();
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension34InstallPagePreInstallPaidOfferView_metrics;
  uint64_t v4 = sub_100756980();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension34InstallPagePreInstallPaidOfferView_inAppPurchaseView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension34InstallPagePreInstallPaidOfferView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension34InstallPagePreInstallPaidOfferView_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension34InstallPagePreInstallPaidOfferView_divider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension34InstallPagePreInstallPaidOfferView_messageLabel));
  double v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension34InstallPagePreInstallPaidOfferView_lockupView);
}

@end