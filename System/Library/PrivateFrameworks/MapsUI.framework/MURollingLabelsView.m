@interface MURollingLabelsView
- (CGSize)intrinsicContentSize;
- (MURollingLabelsView)initWithCoder:(id)a3;
- (MURollingLabelsView)initWithFrame:(CGRect)a3;
- (UIView)viewForLastBaselineLayout;
@end

@implementation MURollingLabelsView

- (MURollingLabelsView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___MURollingLabelsView____lazy_storage___currentLabelAndConstraints) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___MURollingLabelsView____lazy_storage___labelAndConstraintsAnimatingIn) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___MURollingLabelsView____lazy_storage___labelForBaselineAlignment) = 0;
  v9 = (char *)self + OBJC_IVAR___MURollingLabelsView_transitioningContentSize;
  *(void *)v9 = 0;
  *((void *)v9 + 1) = 0;
  v9[16] = 1;
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = -[MURollingLabelsView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  sub_1932118F0();

  return v10;
}

- (MURollingLabelsView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___MURollingLabelsView____lazy_storage___currentLabelAndConstraints) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___MURollingLabelsView____lazy_storage___labelAndConstraintsAnimatingIn) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___MURollingLabelsView____lazy_storage___labelForBaselineAlignment) = 0;
  v4 = (char *)self + OBJC_IVAR___MURollingLabelsView_transitioningContentSize;
  *(void *)v4 = 0;
  *((void *)v4 + 1) = 0;
  v4[16] = 1;
  id v5 = a3;

  result = (MURollingLabelsView *)sub_1933417B0();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = (double *)((char *)self + OBJC_IVAR___MURollingLabelsView_transitioningContentSize);
  if (*((unsigned char *)&self->super.super.__layeringSceneIdentity + OBJC_IVAR___MURollingLabelsView_transitioningContentSize))
  {
    v3 = self;
    sub_1932116B0(&OBJC_IVAR___MURollingLabelsView____lazy_storage___currentLabelAndConstraints);
    id v4 = sub_193210EF8();
    swift_release();
    objc_msgSend(v4, sel_intrinsicContentSize);
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    double v6 = *v2;
    double v8 = v2[1];
  }
  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (UIView)viewForLastBaselineLayout
{
  v2 = self;
  id BaselineLayoutSo6UIViewCvg_0 = _s6MapsUI17RollingLabelsViewC21forLastBaselineLayoutSo6UIViewCvg_0();

  return (UIView *)BaselineLayoutSo6UIViewCvg_0;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___MURollingLabelsView____lazy_storage___labelForBaselineAlignment);
}

@end