@interface FullSheetOverlayPageView
- (_TtC20StoreDynamicUIPlugin24FullSheetOverlayPageView)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin24FullSheetOverlayPageView)initWithFrame:(CGRect)a3;
- (void)didTapPrimaryButton:(id)a3;
- (void)didTapSecondaryButton:(id)a3;
- (void)layoutSubviews;
- (void)scrollViewDidScroll:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FullSheetOverlayPageView

- (_TtC20StoreDynamicUIPlugin24FullSheetOverlayPageView)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin24FullSheetOverlayPageView *)sub_860FC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20StoreDynamicUIPlugin24FullSheetOverlayPageView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_8669C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_86D38();
}

- (void)didTapPrimaryButton:(id)a3
{
}

- (void)didTapSecondaryButton:(id)a3
{
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_89474(a3);
}

- (void).cxx_destruct
{
  sub_10950(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC20StoreDynamicUIPlugin24FullSheetOverlayPageView_assetFetcher));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin24FullSheetOverlayPageView_gradientBaseColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin24FullSheetOverlayPageView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin24FullSheetOverlayPageView_footerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin24FullSheetOverlayPageView_footerBlur));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin24FullSheetOverlayPageView_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin24FullSheetOverlayPageView_gradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin24FullSheetOverlayPageView_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin24FullSheetOverlayPageView_textView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin24FullSheetOverlayPageView____lazy_storage___badgeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin24FullSheetOverlayPageView____lazy_storage___disclaimerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin24FullSheetOverlayPageView____lazy_storage___headlineLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin24FullSheetOverlayPageView____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin24FullSheetOverlayPageView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin24FullSheetOverlayPageView_primaryButton));
  sub_10950(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC20StoreDynamicUIPlugin24FullSheetOverlayPageView_primaryButtonHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin24FullSheetOverlayPageView_secondaryButton));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC20StoreDynamicUIPlugin24FullSheetOverlayPageView_secondaryButtonHandler);

  sub_10950(v3);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_89BA4();
}

@end