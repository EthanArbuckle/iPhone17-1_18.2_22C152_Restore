@interface DepthRichCircularLabelView
- (_TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView)initWithCoder:(id)a3;
- (_TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView)initWithFrame:(CGRect)a3;
@end

@implementation DepthRichCircularLabelView

- (_TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView)initWithFrame:(CGRect)a3
{
  return (_TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView *)sub_2E408(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView)initWithCoder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView____lazy_storage___depthLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView____lazy_storage___unitLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView_depthLabelFont));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView_unitLabelFont));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView_limitFont));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end