@interface HalfSheetPageView
- (_TtC20StoreDynamicUIPlugin17HalfSheetPageView)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin17HalfSheetPageView)initWithFrame:(CGRect)a3;
- (void)didTapPrimaryButton:(id)a3;
- (void)didTapSecondaryButton:(id)a3;
- (void)layoutSubviews;
- (void)scrollViewDidScroll:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HalfSheetPageView

- (_TtC20StoreDynamicUIPlugin17HalfSheetPageView)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin17HalfSheetPageView *)sub_924F4();
}

- (_TtC20StoreDynamicUIPlugin17HalfSheetPageView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_92E1C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_932DC();
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
  sub_957CC((uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin17HalfSheetPageView_scrollView));
  sub_10950(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC20StoreDynamicUIPlugin17HalfSheetPageView_animationFetcher));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin17HalfSheetPageView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin17HalfSheetPageView_footerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin17HalfSheetPageView_footerBlur));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin17HalfSheetPageView_primaryButton));
  sub_10950(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC20StoreDynamicUIPlugin17HalfSheetPageView_primaryButtonHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin17HalfSheetPageView_secondaryButton));
  sub_10950(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC20StoreDynamicUIPlugin17HalfSheetPageView_secondaryButtonHandler));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20StoreDynamicUIPlugin17HalfSheetPageView____lazy_storage___titleLabel);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_95B64();
}

@end