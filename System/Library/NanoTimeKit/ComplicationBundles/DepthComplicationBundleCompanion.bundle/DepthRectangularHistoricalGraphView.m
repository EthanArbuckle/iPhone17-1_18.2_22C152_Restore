@interface DepthRectangularHistoricalGraphView
- (_TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView)initWithCoder:(id)a3;
- (_TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation DepthRectangularHistoricalGraphView

- (void)layoutSubviews
{
  v2 = self;
  sub_14B3C();
}

- (_TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_15CB0();
}

- (_TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView)initWithFrame:(CGRect)a3
{
  result = (_TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_device));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_depthSymbolAttachment));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_maxDepthLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_durationLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_graphView));
  id v3 = (char *)self + OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_metrics;

  sub_15BE8((uint64_t)v3);
}

@end