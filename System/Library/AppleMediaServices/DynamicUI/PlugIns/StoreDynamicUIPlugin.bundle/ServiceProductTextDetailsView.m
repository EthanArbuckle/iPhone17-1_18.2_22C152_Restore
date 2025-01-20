@interface ServiceProductTextDetailsView
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView)init;
- (_TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ServiceProductTextDetailsView

- (_TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView *)sub_EE324(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_EEDC0();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_EEEB0((uint64_t)a3);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  double v4 = sub_EEFF8();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_EF110();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  double v5 = self;
  double v6 = sub_F0038();
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

- (_TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView)init
{
}

- (void).cxx_destruct
{
  id v3 = *(void **)&self->AMSUICommonView_opaque[OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView_visualAreaArtworkContainer];
}

@end