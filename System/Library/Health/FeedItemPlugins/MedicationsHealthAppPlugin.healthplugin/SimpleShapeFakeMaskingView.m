@interface SimpleShapeFakeMaskingView
- (CALayer)croppingLayer;
- (_TtC26MedicationsHealthAppPlugin26SimpleShapeFakeMaskingView)initWithCoder:(id)a3;
- (_TtC26MedicationsHealthAppPlugin26SimpleShapeFakeMaskingView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setCroppingLayer:(id)a3;
@end

@implementation SimpleShapeFakeMaskingView

- (CALayer)croppingLayer
{
  return (CALayer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC26MedicationsHealthAppPlugin26SimpleShapeFakeMaskingView_croppingLayer));
}

- (void)setCroppingLayer:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC26MedicationsHealthAppPlugin26SimpleShapeFakeMaskingView_croppingLayer);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC26MedicationsHealthAppPlugin26SimpleShapeFakeMaskingView_croppingLayer) = (Class)a3;
  id v3 = a3;
}

- (_TtC26MedicationsHealthAppPlugin26SimpleShapeFakeMaskingView)initWithFrame:(CGRect)a3
{
  return (_TtC26MedicationsHealthAppPlugin26SimpleShapeFakeMaskingView *)sub_2410DAAE8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC26MedicationsHealthAppPlugin26SimpleShapeFakeMaskingView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC26MedicationsHealthAppPlugin26SimpleShapeFakeMaskingView_backgroundLayerColor) = 0;
  id v4 = a3;

  result = (_TtC26MedicationsHealthAppPlugin26SimpleShapeFakeMaskingView *)sub_2411616B0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2410DAE40();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin26SimpleShapeFakeMaskingView_backgroundLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin26SimpleShapeFakeMaskingView_croppingLayer));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC26MedicationsHealthAppPlugin26SimpleShapeFakeMaskingView_backgroundLayerColor);
}

@end