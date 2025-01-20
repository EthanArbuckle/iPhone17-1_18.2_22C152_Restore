@interface ServiceProductCardReferenceView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC20StoreDynamicUIPlugin31ServiceProductCardReferenceView)init;
- (_TtC20StoreDynamicUIPlugin31ServiceProductCardReferenceView)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin31ServiceProductCardReferenceView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ServiceProductCardReferenceView

- (_TtC20StoreDynamicUIPlugin31ServiceProductCardReferenceView)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin31ServiceProductCardReferenceView *)sub_DC124(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20StoreDynamicUIPlugin31ServiceProductCardReferenceView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_DC21C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_DC2DC();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  double v6 = sub_DC558();
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

- (_TtC20StoreDynamicUIPlugin31ServiceProductCardReferenceView)init
{
}

- (void).cxx_destruct
{
  id v3 = *(void **)&self->AMSUICommonView_opaque[OBJC_IVAR____TtC20StoreDynamicUIPlugin31ServiceProductCardReferenceView_titleLabel];
}

@end