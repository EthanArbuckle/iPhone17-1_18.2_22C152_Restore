@interface MediaOverlayGradientBlurView
- (_TtC20ProductPageExtension28MediaOverlayGradientBlurView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension28MediaOverlayGradientBlurView)initWithFrame:(CGRect)a3;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)layoutSubviews;
@end

@implementation MediaOverlayGradientBlurView

- (_TtC20ProductPageExtension28MediaOverlayGradientBlurView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100471CDC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100470EF0();
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v2 = self;
  sub_1004710C0();
}

- (_TtC20ProductPageExtension28MediaOverlayGradientBlurView)initWithFrame:(CGRect)a3
{
  result = (_TtC20ProductPageExtension28MediaOverlayGradientBlurView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28MediaOverlayGradientBlurView_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28MediaOverlayGradientBlurView_blurGradientMaskView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28MediaOverlayGradientBlurView_colorGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28MediaOverlayGradientBlurView_secondaryColorGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28MediaOverlayGradientBlurView_todayCardStyleColor));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension28MediaOverlayGradientBlurView_secondaryColor);
}

@end