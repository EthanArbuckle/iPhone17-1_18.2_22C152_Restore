@interface DepthRectangularLiveView
- (_TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView)initWithCoder:(id)a3;
- (_TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation DepthRectangularLiveView

- (_TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_188C0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_17D1C();
}

- (_TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_device));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_deviceMetrics));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_depthLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_depthValueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_depthUnitLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_timeUnitLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_timeValueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_tentativeTimeView));
  sub_18748((uint64_t)self + OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_metrics, type metadata accessor for DepthComplicationMetrics);
}

@end