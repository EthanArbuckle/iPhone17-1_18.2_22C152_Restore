@interface ServiceOverlayContainerView
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIView)contentView;
- (_TtC23AppStoreOverlaysService27ServiceOverlayContainerView)initWithCoder:(id)a3;
- (_TtC23AppStoreOverlaysService27ServiceOverlayContainerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setContentView:(id)a3;
@end

@implementation ServiceOverlayContainerView

- (_TtC23AppStoreOverlaysService27ServiceOverlayContainerView)initWithFrame:(CGRect)a3
{
  return (_TtC23AppStoreOverlaysService27ServiceOverlayContainerView *)sub_1000123FC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23AppStoreOverlaysService27ServiceOverlayContainerView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23AppStoreOverlaysService27ServiceOverlayContainerView_contentView) = 0;
  id v4 = a3;

  result = (_TtC23AppStoreOverlaysService27ServiceOverlayContainerView *)sub_100018A60();
  __break(1u);
  return result;
}

- (UIView)contentView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC23AppStoreOverlaysService27ServiceOverlayContainerView_contentView));
}

- (void)setContentView:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100012780(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100012850();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = self;
  sub_100012A90(width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23AppStoreOverlaysService27ServiceOverlayContainerView_contentView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23AppStoreOverlaysService27ServiceOverlayContainerView_visualEffectView);
}

@end