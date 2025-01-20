@interface MediaOverlayGradientBlurView
- (_TtC22SubscribePageExtension28MediaOverlayGradientBlurView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension28MediaOverlayGradientBlurView)initWithFrame:(CGRect)a3;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)layoutSubviews;
@end

@implementation MediaOverlayGradientBlurView

- (_TtC22SubscribePageExtension28MediaOverlayGradientBlurView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10017F538();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10017E468();
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v2 = self;
  sub_10017E91C();
}

- (_TtC22SubscribePageExtension28MediaOverlayGradientBlurView)initWithFrame:(CGRect)a3
{
  result = (_TtC22SubscribePageExtension28MediaOverlayGradientBlurView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28MediaOverlayGradientBlurView_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28MediaOverlayGradientBlurView_blurGradientMaskView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28MediaOverlayGradientBlurView_colorGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28MediaOverlayGradientBlurView_secondaryColorGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28MediaOverlayGradientBlurView_todayCardStyleColor));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension28MediaOverlayGradientBlurView_secondaryColor);
}

@end