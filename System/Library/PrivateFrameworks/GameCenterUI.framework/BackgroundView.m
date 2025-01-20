@interface BackgroundView
- (_TtC12GameCenterUI14BackgroundView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI14BackgroundView)initWithFrame:(CGRect)a3;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)layoutSubviews;
@end

@implementation BackgroundView

- (_TtC12GameCenterUI14BackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI14BackgroundView *)sub_1AF3DAAE8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI14BackgroundView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF3DAD70();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF3DAF2C();
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v2 = self;
  sub_1AF3DB058();
}

- (void).cxx_destruct
{
  sub_1AF3DB200(*(void **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12GameCenterUI14BackgroundView_backgroundStyle), *(void **)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC12GameCenterUI14BackgroundView_backgroundStyle), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC12GameCenterUI14BackgroundView_backgroundStyle), *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC12GameCenterUI14BackgroundView_backgroundStyle), *(uint64_t *)((char *)&self->super._cachedTraitCollection+ OBJC_IVAR____TtC12GameCenterUI14BackgroundView_backgroundStyle), *(uint64_t *)((char *)&self->super._swiftAnimationInfo+ OBJC_IVAR____TtC12GameCenterUI14BackgroundView_backgroundStyle), *((unsigned char *)&self->super._traitChangeRegistry + OBJC_IVAR____TtC12GameCenterUI14BackgroundView_backgroundStyle));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI14BackgroundView_backgroundVisualEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI14BackgroundView_backgroundHighlightView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI14BackgroundView_backgroundGradientLayer);
}

@end