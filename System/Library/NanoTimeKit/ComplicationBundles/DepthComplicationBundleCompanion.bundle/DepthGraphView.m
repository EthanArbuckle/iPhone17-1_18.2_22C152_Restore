@interface DepthGraphView
- (_TtC32DepthComplicationBundleCompanion14DepthGraphView)init;
- (_TtC32DepthComplicationBundleCompanion14DepthGraphView)initWithCoder:(id)a3;
- (_TtC32DepthComplicationBundleCompanion14DepthGraphView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation DepthGraphView

- (_TtC32DepthComplicationBundleCompanion14DepthGraphView)init
{
  return (_TtC32DepthComplicationBundleCompanion14DepthGraphView *)sub_2F8C0();
}

- (_TtC32DepthComplicationBundleCompanion14DepthGraphView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_3329C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2FE80();
}

- (_TtC32DepthComplicationBundleCompanion14DepthGraphView)initWithFrame:(CGRect)a3
{
  result = (_TtC32DepthComplicationBundleCompanion14DepthGraphView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_durationStartLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_durationEndLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_gridLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_dotLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_maxDotLayer));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_barLayer);
}

@end