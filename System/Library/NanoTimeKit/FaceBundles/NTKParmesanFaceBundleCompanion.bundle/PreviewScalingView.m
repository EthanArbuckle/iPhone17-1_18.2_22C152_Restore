@interface PreviewScalingView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC30NTKParmesanFaceBundleCompanionP33_DC3BA41EEB072E14570EF1C5DEF2692418PreviewScalingView)initWithCoder:(id)a3;
- (_TtC30NTKParmesanFaceBundleCompanionP33_DC3BA41EEB072E14570EF1C5DEF2692418PreviewScalingView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PreviewScalingView

- (_TtC30NTKParmesanFaceBundleCompanionP33_DC3BA41EEB072E14570EF1C5DEF2692418PreviewScalingView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_DC3BA41EEB072E14570EF1C5DEF2692418PreviewScalingView_contentView) = 0;
  v7 = (char *)self
     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_DC3BA41EEB072E14570EF1C5DEF2692418PreviewScalingView_targetSize;
  *(void *)v7 = 0;
  *((void *)v7 + 1) = 0;
  v7[16] = 1;
  v8 = (char *)self
     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_DC3BA41EEB072E14570EF1C5DEF2692418PreviewScalingView_targetCornerRadius;
  *(void *)v8 = 0;
  v8[8] = 1;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for PreviewScalingView();
  v9 = -[PreviewScalingView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  id v10 = [(PreviewScalingView *)v9 layer];
  objc_msgSend(v10, sel_setMasksToBounds_, 1);

  return v9;
}

- (_TtC30NTKParmesanFaceBundleCompanionP33_DC3BA41EEB072E14570EF1C5DEF2692418PreviewScalingView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_DC3BA41EEB072E14570EF1C5DEF2692418PreviewScalingView_contentView) = 0;
  v4 = (char *)self
     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_DC3BA41EEB072E14570EF1C5DEF2692418PreviewScalingView_targetSize;
  *(void *)v4 = 0;
  *((void *)v4 + 1) = 0;
  v4[16] = 1;
  v5 = (char *)self
     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_DC3BA41EEB072E14570EF1C5DEF2692418PreviewScalingView_targetCornerRadius;
  *(void *)v5 = 0;
  v5[8] = 1;
  id v6 = a3;

  result = (_TtC30NTKParmesanFaceBundleCompanionP33_DC3BA41EEB072E14570EF1C5DEF2692418PreviewScalingView *)sub_246C2D3A8();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = (double *)((char *)self
                + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_DC3BA41EEB072E14570EF1C5DEF2692418PreviewScalingView_targetSize);
  if ((*((unsigned char *)&self->super.super.__layeringSceneIdentity
        + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_DC3BA41EEB072E14570EF1C5DEF2692418PreviewScalingView_targetSize) & 1) != 0)
  {
    double height = a3.height;
    double width = a3.width;
    v8.receiver = self;
    v8.super_class = (Class)type metadata accessor for PreviewScalingView();
    -[PreviewScalingView sizeThatFits:](&v8, sel_sizeThatFits_, width, height);
  }
  else
  {
    double v6 = *v3;
    double v7 = v3[1];
  }
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_246C1EB48();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_DC3BA41EEB072E14570EF1C5DEF2692418PreviewScalingView_contentView));
}

@end