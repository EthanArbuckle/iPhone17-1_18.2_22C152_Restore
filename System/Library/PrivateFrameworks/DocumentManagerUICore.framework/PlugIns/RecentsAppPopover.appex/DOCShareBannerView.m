@interface DOCShareBannerView
- (_TtC17RecentsAppPopover18DOCShareBannerView)init;
- (_TtC17RecentsAppPopover18DOCShareBannerView)initWithCoder:(id)a3;
- (_TtC17RecentsAppPopover18DOCShareBannerView)initWithFrame:(CGRect)a3;
@end

@implementation DOCShareBannerView

- (_TtC17RecentsAppPopover18DOCShareBannerView)init
{
  return (_TtC17RecentsAppPopover18DOCShareBannerView *)sub_100252E9C();
}

- (_TtC17RecentsAppPopover18DOCShareBannerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100253AE4();
}

- (_TtC17RecentsAppPopover18DOCShareBannerView)initWithFrame:(CGRect)a3
{
  result = (_TtC17RecentsAppPopover18DOCShareBannerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100035EB4(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC17RecentsAppPopover18DOCShareBannerView_optionsButtonHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover18DOCShareBannerView_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover18DOCShareBannerView_labelView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover18DOCShareBannerView____lazy_storage___optionsButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover18DOCShareBannerView____lazy_storage___topSeparator));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC17RecentsAppPopover18DOCShareBannerView____lazy_storage___bottomSeparator);
}

@end