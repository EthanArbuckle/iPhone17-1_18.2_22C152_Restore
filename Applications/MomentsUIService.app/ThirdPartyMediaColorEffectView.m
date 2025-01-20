@interface ThirdPartyMediaColorEffectView
- (_TtC16MomentsUIService30ThirdPartyMediaColorEffectView)initWithCoder:(id)a3;
- (_TtC16MomentsUIService30ThirdPartyMediaColorEffectView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ThirdPartyMediaColorEffectView

- (_TtC16MomentsUIService30ThirdPartyMediaColorEffectView)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService30ThirdPartyMediaColorEffectView *)ThirdPartyMediaColorEffectView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MomentsUIService30ThirdPartyMediaColorEffectView)initWithCoder:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  v2 = self;
  ThirdPartyMediaColorEffectView.layoutSubviews()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService30ThirdPartyMediaColorEffectView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService30ThirdPartyMediaColorEffectView_fillView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService30ThirdPartyMediaColorEffectView_overlayView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MomentsUIService30ThirdPartyMediaColorEffectView_fillColor);
}

@end