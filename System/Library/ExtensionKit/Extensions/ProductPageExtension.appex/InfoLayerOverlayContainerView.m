@interface InfoLayerOverlayContainerView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC20ProductPageExtension29InfoLayerOverlayContainerView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension29InfoLayerOverlayContainerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation InfoLayerOverlayContainerView

- (_TtC20ProductPageExtension29InfoLayerOverlayContainerView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension29InfoLayerOverlayContainerView *)sub_1005B5128(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension29InfoLayerOverlayContainerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005B5884();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1005B5374();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_1005B5698(width);
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
                     + OBJC_IVAR____TtC20ProductPageExtension29InfoLayerOverlayContainerView_overlayView));
}

@end