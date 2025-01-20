@interface DepthRectangularView
- (CLKMonochromeFilterProvider)filterProvider;
- (_TtC32DepthComplicationBundleCompanion20DepthRectangularView)initWithCoder:(id)a3;
- (_TtC32DepthComplicationBundleCompanion20DepthRectangularView)initWithFrame:(CGRect)a3;
- (id)initFullColorImageViewWithDevice:(id)a3;
- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4;
- (void)layoutSubviews;
- (void)setFilterProvider:(id)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation DepthRectangularView

- (id)initFullColorImageViewWithDevice:(id)a3
{
  return sub_27EB0(a3);
}

- (_TtC32DepthComplicationBundleCompanion20DepthRectangularView)initWithCoder:(id)a3
{
  type metadata accessor for DepthComplicationMetrics(0);
  swift_storeEnumTagMultiPayload();
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_alwaysOn) = 0;
  *(_OWORD *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_activeView) = xmmword_383F0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_filterProvider) = 0;
  id v5 = a3;

  result = (_TtC32DepthComplicationBundleCompanion20DepthRectangularView *)sub_371D8();
  __break(1u);
  return result;
}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_29EF8(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_28E58();
}

- (CLKMonochromeFilterProvider)filterProvider
{
  v2 = (void *)swift_unknownObjectRetain();

  return (CLKMonochromeFilterProvider *)v2;
}

- (void)setFilterProvider:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_filterProvider) = (Class)a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  v4 = self;
  sub_2927C(a3);
}

- (void)updateMonochromeColor
{
  v2 = self;
  sub_29468();
}

- (_TtC32DepthComplicationBundleCompanion20DepthRectangularView)initWithFrame:(CGRect)a3
{
  result = (_TtC32DepthComplicationBundleCompanion20DepthRectangularView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_device));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_deviceMetrics));
  sub_29E98((uint64_t)self + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_metrics, type metadata accessor for DepthComplicationMetrics);
  sub_29A34(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_activeView), *(void *)&self->device[OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_activeView]);

  swift_unknownObjectRelease();
}

@end