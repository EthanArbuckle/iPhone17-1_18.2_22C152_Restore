@interface ServiceDetailView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC20StoreDynamicUIPlugin17ServiceDetailView)init;
- (_TtC20StoreDynamicUIPlugin17ServiceDetailView)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin17ServiceDetailView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ServiceDetailView

- (_TtC20StoreDynamicUIPlugin17ServiceDetailView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_BE498();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_BE7CC();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  v6 = self;
  double v7 = sub_BE9F4((uint64_t)a4);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  swift_unknownObjectRelease();

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.var3 = v17;
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (_TtC20StoreDynamicUIPlugin17ServiceDetailView)init
{
}

- (_TtC20StoreDynamicUIPlugin17ServiceDetailView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((uint64_t)&self->AMSUICommonView_opaque[OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_detailTop]);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((uint64_t)&self->AMSUICommonView_opaque[OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_spacingDimension]);

  uint64_t v3 = *(void *)&self->AMSUICommonView_opaque[OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_applyCachedArtwork];

  sub_10950(v3);
}

@end