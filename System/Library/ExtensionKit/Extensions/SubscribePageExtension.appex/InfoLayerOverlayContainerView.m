@interface InfoLayerOverlayContainerView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC22SubscribePageExtension29InfoLayerOverlayContainerView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension29InfoLayerOverlayContainerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation InfoLayerOverlayContainerView

- (_TtC22SubscribePageExtension29InfoLayerOverlayContainerView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension29InfoLayerOverlayContainerView *)sub_100471500(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension29InfoLayerOverlayContainerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100471C5C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10047174C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_100471A70(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29InfoLayerOverlayContainerView_overlayView));
}

@end