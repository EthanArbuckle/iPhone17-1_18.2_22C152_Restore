@interface DOCShareBannerView
- (_TtC11SaveToFiles18DOCShareBannerView)init;
- (_TtC11SaveToFiles18DOCShareBannerView)initWithCoder:(id)a3;
- (_TtC11SaveToFiles18DOCShareBannerView)initWithFrame:(CGRect)a3;
@end

@implementation DOCShareBannerView

- (_TtC11SaveToFiles18DOCShareBannerView)init
{
  return (_TtC11SaveToFiles18DOCShareBannerView *)sub_1001C4CC8();
}

- (_TtC11SaveToFiles18DOCShareBannerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001C5910();
}

- (_TtC11SaveToFiles18DOCShareBannerView)initWithFrame:(CGRect)a3
{
  result = (_TtC11SaveToFiles18DOCShareBannerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10003B980(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC11SaveToFiles18DOCShareBannerView_optionsButtonHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles18DOCShareBannerView_containerView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles18DOCShareBannerView____lazy_storage___optionsButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles18DOCShareBannerView____lazy_storage___topSeparator));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11SaveToFiles18DOCShareBannerView____lazy_storage___bottomSeparator);
}

@end