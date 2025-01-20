@interface DepthRectangularSimpleHistoryView
- (_TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView)initWithCoder:(id)a3;
- (_TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation DepthRectangularSimpleHistoryView

- (_TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_69E0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_5BDC();
}

- (_TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView)initWithFrame:(CGRect)a3
{
  result = (_TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_device));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_deviceMetrics));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_depthLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_depthValueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_depthUnitLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_numberOfDivesLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_timeUnitLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_timeValueLabel));
  sub_6980((uint64_t)self + OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_metrics, type metadata accessor for DepthComplicationMetrics);
}

@end