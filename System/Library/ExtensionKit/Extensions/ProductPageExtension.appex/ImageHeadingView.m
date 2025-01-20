@interface ImageHeadingView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC20ProductPageExtension16ImageHeadingView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension16ImageHeadingView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ImageHeadingView

- (_TtC20ProductPageExtension16ImageHeadingView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension16ImageHeadingView *)sub_1005A3464(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension16ImageHeadingView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension16ImageHeadingView_metrics);
  v4[3] = &type metadata for Double;
  v4[4] = &protocol witness table for Double;
  void *v4 = 0;
  id v5 = a3;

  result = (_TtC20ProductPageExtension16ImageHeadingView *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1005A38D4();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1005A459C(a3);
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  id v5 = self;
  double v6 = sub_1005A497C();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  swift_unknownObjectRelease();

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.var3 = v16;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16ImageHeadingView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16ImageHeadingView_headingLabel));
  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension16ImageHeadingView_metrics;

  sub_1001E5918((uint64_t)v3);
}

@end