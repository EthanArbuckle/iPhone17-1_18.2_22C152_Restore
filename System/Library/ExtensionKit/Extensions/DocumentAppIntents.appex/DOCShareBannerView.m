@interface DOCShareBannerView
- (_TtC18DocumentAppIntents18DOCShareBannerView)init;
- (_TtC18DocumentAppIntents18DOCShareBannerView)initWithCoder:(id)a3;
- (_TtC18DocumentAppIntents18DOCShareBannerView)initWithFrame:(CGRect)a3;
@end

@implementation DOCShareBannerView

- (_TtC18DocumentAppIntents18DOCShareBannerView)init
{
  return (_TtC18DocumentAppIntents18DOCShareBannerView *)sub_1003D6EE4();
}

- (_TtC18DocumentAppIntents18DOCShareBannerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003D7B2C();
}

- (_TtC18DocumentAppIntents18DOCShareBannerView)initWithFrame:(CGRect)a3
{
  result = (_TtC18DocumentAppIntents18DOCShareBannerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100037540(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC18DocumentAppIntents18DOCShareBannerView_optionsButtonHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents18DOCShareBannerView_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents18DOCShareBannerView_labelView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents18DOCShareBannerView____lazy_storage___optionsButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents18DOCShareBannerView____lazy_storage___topSeparator));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18DocumentAppIntents18DOCShareBannerView____lazy_storage___bottomSeparator);
}

@end